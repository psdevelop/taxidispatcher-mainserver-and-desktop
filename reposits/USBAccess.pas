unit USBAccess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type

  PAR_SET_INFORMATION = record
    Init: byte;
  end;
  PPAR_SET_INFORMATION = ^PAR_SET_INFORMATION;

  PDevBroadcastHdr = ^DEV_BROADCAST_HDR;
  DEV_BROADCAST_HDR = packed record
    dbch_size: DWORD;
    dbch_devicetype: DWORD;
    dbch_reserved: DWORD;
  end;
    

  PDevBroadcastDeviceInterface = ^DEV_BROADCAST_DEVICEINTERFACE;
  DEV_BROADCAST_DEVICEINTERFACE = record
  dbcc_size: DWORD;
  dbcc_devicetype: DWORD;
  dbcc_reserved: DWORD;
  dbcc_classguid: TGUID;
  dbcc_name: short;
  end;

  TUSBAccessForm = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FWindowHandle: HWND;
    FOnUSBArrival: TNotifyEvent;
    FOnUSBRemove: TNotifyEvent;
    procedure WndProc(var Msg: TMessage);
    function USBRegister: Boolean;
  protected
    procedure WMDeviceChange(var Msg: TMessage); dynamic;
  public
    { Public declarations }
    //procedure ResetUSBPort(PortNum: Integer);
  published
    property OnUSBArrival: TNotifyEvent read FOnUSBArrival write FOnUSBArrival;
    property OnUSBRemove: TNotifyEvent read FOnUSBRemove write FOnUSBRemove;  
  end;

const
  DICS_ENABLE = $00000001;
  DICS_DISABLE = $00000002;
  DIF_PROPERTYCHANGE = $00000012;
  DICS_FLAG_GLOBAL = $00000001;
  DIGCF_PRESENT = $00000002;
  SPDRP_COMPATIBLEIDS = $00000002;
  SPDRP_DEVICEDESC = $00000000; // DeviceDesc (R/W)
  DIGCF_ALLCLASSES      = $00000004;
  SPDRP_CLASSGUID = $00000008;
  SPDRP_CLASS = $00000007;
  DIGCF_DEVICEINTERFACE = $00000010;

  DISK_GUID: TGUID = '{4D36E967-E325-11CE-BFC1-08002BE10318}';

  GUID_DEVINTERFACE_USB_DEVICE: TGUID = '{A5DCBF10-6530-11D2-901F-00C04FB951ED}';
  DBT_DEVICEARRIVAL = $8000; // system detected a new device
  DBT_DEVICEREMOVECOMPLETE = $8004; // device is gone
  DBT_DEVTYP_DEVICEINTERFACE = $00000005; // device interface class

var
  USBAccessForm: TUSBAccessForm;
  ParControl: PAR_SET_INFORMATION;

function ChangeDeviceState(AState: DWORD; RestartAll: Boolean=False; DevName: String=''): Boolean;

implementation

{$R *.dfm}

uses ADODMUnit, ModelDM, MainForm;

type
  PSP_CLASSINSTALL_HEADER = ^SP_CLASSINSTALL_HEADER;
  SP_CLASSINSTALL_HEADER = record
    cbSize: DWORD;
    InstallFunction: Cardinal;
  end;

  PSP_PROPCHANGE_PARAMS = ^SP_PROPCHANGE_PARAMS;
  SP_PROPCHANGE_PARAMS = record
    ClassInstallHeader: SP_CLASSINSTALL_HEADER;
    StateChange: DWORD;
    Scope: DWORD;
    HwProfile: DWORD;
  end;

  PSP_DEVINFO_DATA = ^SP_DEVINFO_DATA;
  SP_DEVINFO_DATA = record
    cbSize: DWORD;
    ClassGuid: TGUID;
    DevInst: DWORD;
    Reserved: Longint;
  end;

  function SetupDiGetClassDevs(const ClassGuid: PGUID; Enumerator: PChar;
    hwndParent: HWND; Flags: DWORD): DWORD; stdcall;
    external 'Setupapi.dll' name 'SetupDiGetClassDevsA';

  function SetupDiDestroyDeviceInfoList(DeviceInfoSet: DWORD): BOOL; stdcall;
    external 'Setupapi.dll';

  function SetupDiEnumDeviceInfo(DeviceInfoSet: DWORD; MemberIndex: DWORD;
    DeviceInfoData: PSP_DEVINFO_DATA): BOOL; stdcall;
    external 'Setupapi.dll';

  function SetupDiCallClassInstaller(InstallFunction: DWORD;
    DeviceInfoSet: DWORD; DeviceInfoData: PSP_DEVINFO_DATA): BOOL; stdcall;
    external 'setupapi.dll';

  function SetupDiGetDeviceRegistryProperty(DeviceInfoSet: DWORD;
    DeviceInfoData: PSP_DEVINFO_DATA; Propertys: DWORD; PropertyRegDataType: PWORD;
    PropertyBuffer: PByte; PropertyBufferSize: DWORD; RequiredSize: PWORD): BOOL; stdcall;
    external 'Setupapi.dll' name 'SetupDiGetDeviceRegistryPropertyA';

  function SetupDiSetClassInstallParams(DeviceInfoSet: DWORD;
    DeviceInfoData: PSP_DEVINFO_DATA; ClassInstallParams: PSP_CLASSINSTALL_HEADER;
    ClassInstallParamsSize: DWORD): BOOL; stdcall;
    external 'setupapi.dll' name 'SetupDiSetClassInstallParamsA';

function ChangeDeviceState(AState: DWORD; RestartAll: Boolean=False; DevName: String=''): Boolean;
var
  pcp: SP_PROPCHANGE_PARAMS;
  DevInfoData: SP_DEVINFO_DATA;
  hDevInfo1:  DWORD;
  I, DataT, Buffersize: DWORD;
  Buffer: PAnsiChar;
  DevClass: string;
  ResetDevNum: Integer;
begin
  Result := False;
  pcp.ClassInstallHeader.cbSize := sizeof(SP_CLASSINSTALL_HEADER);
  pcp.ClassInstallHeader.InstallFunction := DIF_PROPERTYCHANGE;
  pcp.StateChange := AState;
  pcp.Scope := DICS_FLAG_GLOBAL;
  pcp.HwProfile := 0;
  hDevInfo1 := SetupDiGetClassDevs(@DISK_GUID, nil, HWND(nil), DIGCF_PRESENT or DIGCF_ALLCLASSES);
  try
    DevInfoData.cbSize := sizeof(SP_DEVINFO_DATA);
    I := 0;
    Buffersize := 500;
    GetMem(Buffer, Buffersize);
    try
      ResetDevNum:=0;
      while SetupDiEnumDeviceInfo(hDevInfo1, I, @DevInfoData) do
      begin

        SetupDiGetDeviceRegistryProperty(hDevInfo1, @DevInfoData,
          SPDRP_CLASS, @DataT, PByte(Buffer), Buffersize, nil);
        DevClass:=buffer;
        SetupDiGetDeviceRegistryProperty(hDevInfo1, @DevInfoData,
              SPDRP_DEVICEDESC, @DataT, PByte(Buffer), Buffersize, nil);


        if (IniFile.ReadString('BUSINESS_DATA',
              'отключать_только_конечный_USB_модем','NO')
                ='YES') and not RestartAll then
        begin
        if (Buffer=DevName) and
          (DevClass='Modem') and (DevName<>'') 
         then
          begin

              USBAccessForm.Memo1.Lines.Add(DevClass);
              USBAccessForm.Memo1.Lines.Add(buffer);
              if not SetupDiSetClassInstallParams(hDevInfo1,
                @DevInfoData, PSP_CLASSINSTALL_HEADER(@pcp), SizeOf(pcp)) then Exit;
              if not SetupDiCallClassInstaller(
                DIF_PROPERTYCHANGE, hDevInfo1, @DevInfoData) then Exit;
                   Result := True;

          end;
        end
        else
        begin
        if (Buffer=IniFile.ReadString('BUSINESS_DATA',
              'системное_имя_USB_концентратора','Корневой USB концентратор')) and
          (DevClass='USB')
         then
          begin
            ResetDevNum:=ResetDevNum+1;

            if (IniFile.ReadInteger('BUSINESS_DATA',
               'номер_перезагружаемого_USB_концентратора',0)
               =ResetDevNum) or
               (IniFile.ReadInteger('BUSINESS_DATA',
               'номер_перезагружаемого_USB_концентратора',0)
               <=0) then
             begin
              USBAccessForm.Memo1.Lines.Add(DevClass);
              USBAccessForm.Memo1.Lines.Add(buffer);
              if not SetupDiSetClassInstallParams(hDevInfo1,
                @DevInfoData, PSP_CLASSINSTALL_HEADER(@pcp), SizeOf(pcp)) then Exit;
              if not SetupDiCallClassInstaller(
                DIF_PROPERTYCHANGE, hDevInfo1, @DevInfoData) then Exit;
                   Result := True;
             end;
          end;
        end;

        //if buffer = 'USBSTOR\Disk' then
        //begin
        //end;
        //ShowMessage(Buffer);

        Inc(I);
      end;
    finally
      FreeMem(Buffer);
    end;
  finally
    SetupDiDestroyDeviceInfoList(hDevInfo1);
  end;
end;

procedure TUSBAccessForm.Button1Click(Sender: TObject);
begin
    if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              'имя_рестартуемого_устройства','modem')) then
      ShowMessage('Устройство 1 отключено');
    if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              'имя_рестартуемого_устройства2','modem')) then
      ShowMessage('Устройство 2 отключено');
    if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              'имя_рестартуемого_устройства3','modem')) then
      ShowMessage('Устройство 3 отключено');
    if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
              'имя_рестартуемого_устройства','modem')) then
      begin
        PeriodicDevConRecovery:=True;
        ShowMessage('Устройство 1 включено')
      end
    else
      ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              'имя_рестартуемого_устройства','modem'));
    if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
              'имя_рестартуемого_устройства2','modem')) then
      begin
        PeriodicDevConRecovery2:=True;
        ShowMessage('Устройство 2 включено');
      end
    else
      ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              'имя_рестартуемого_устройства2','modem'));
    if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
              'имя_рестартуемого_устройства3','modem')) then
      begin
        PeriodicDevConRecovery3:=True;
        ShowMessage('Устройство 3 включено');
      end  
    else
      ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              'имя_рестартуемого_устройства3','modem'));
end;

procedure TUSBAccessForm.Button2Click(Sender: TObject);
begin
    if ChangeDeviceState(DICS_DISABLE, True) then
      ShowMessage('Устройство отключено');
    if ChangeDeviceState(DICS_ENABLE, True) then
      ShowMessage('Устройство включено');
end;

function TUSBAccessForm.USBRegister: Boolean;
var
  dbi: DEV_BROADCAST_DEVICEINTERFACE;
  Size: Integer;
  r: Pointer;
begin
  Result := False;
  Size := SizeOf(DEV_BROADCAST_DEVICEINTERFACE);
  ZeroMemory(@dbi, Size);
  dbi.dbcc_size := Size;
  dbi.dbcc_devicetype := DBT_DEVTYP_DEVICEINTERFACE;
  dbi.dbcc_reserved := 0;
  dbi.dbcc_classguid := GUID_DEVINTERFACE_USB_DEVICE;
  dbi.dbcc_name := 0;
  r := RegisterDeviceNotification(FWindowHandle, @dbi,
    DEVICE_NOTIFY_WINDOW_HANDLE);
  if Assigned(r) then Result := True;
end;

procedure TUSBAccessForm.FormCreate(Sender: TObject);
begin
  FWindowHandle := AllocateHWnd(WndProc);
  USBRegister;
end;

procedure TUSBAccessForm.FormDestroy(Sender: TObject);
begin
  DeallocateHWnd(FWindowHandle);
end;

procedure TUSBAccessForm.WndProc(var Msg: TMessage);
begin 
  if (Msg.Msg = WM_DEVICECHANGE)
  then begin
    //ShowMessage('ddd');

    //try
    //  WMDeviceChange(Msg);
    if (Msg.wParam = DBT_DEVICEARRIVAL) then
      begin
        PeriodicDevConRecovery:=True;
        PeriodicDevConRecovery2:=True;
        PeriodicDevConRecovery3:=True;
        FirstForm.ShowAttention('Добавлено устройство к системе!');
      end;
    //except
    //  Application.HandleException(Self);
    //end;
  end
  else
    Msg.Result := DefWindowProc(FWindowHandle, Msg.Msg, Msg.wParam, Msg.lParam);
end;

procedure TUSBAccessForm.WMDeviceChange(var Msg: TMessage);
var 
  devType: Integer;
  Datos: PDevBroadcastHdr;
begin
  if (Msg.wParam = DBT_DEVICEARRIVAL) or
     (Msg.wParam = DBT_DEVICEREMOVECOMPLETE)
    then begin
      Datos := PDevBroadcastHdr(Msg.lParam);
      devType := Datos^.dbch_devicetype;
      if devType = DBT_DEVTYP_DEVICEINTERFACE
      then begin // USB Device
        if Msg.wParam = DBT_DEVICEARRIVAL
        then begin
          if Assigned(FOnUSBArrival) then FOnUSBArrival(Self);
        end
        else begin
          if Assigned(FOnUSBRemove) then FOnUSBRemove(Self);
        end;
      end;
    end;
end;

end.
