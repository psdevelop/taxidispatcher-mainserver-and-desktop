unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ModelDM, StdCtrls, ExtCtrls, ToolWin, About,
  ImageLists, Mask, HandlesDM, PopUpCompUnit, BoldOtherHandlCompUnit, BoldElements,
  ShellAPI, BoldStringControlPack, BoldNumericControlPack,
  BoldPropertiesController, Sockets, Mapi, IdSMTPBase, IdSMTP,
  ADODB, DB, BoldPersistenceNotifier, WinInet, Registry, MidasLib,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, BoldControlPack,
  BoldSubscription, MPlayer, tlhelp32, Psapi;   

type

  TRasConn = record
    Size: DWORD;
    Handle: THandle;
    Name: array[0..20] of AnsiChar;
  end;

  TRasEnumConnections = function(var RasConn: TRasConn; var Size: DWORD;
    var Connections: DWORD): DWORD stdcall;
  TRasHangUp = function(Handle: THandle): DWORD stdcall;


  TProgrammKey = class
        StartDate: TDate;
        EndDate: TDate;
        SuccessLib: Boolean;
        Owner: string;
        ProductID: string;
        SeazoneKey: array[0..15] of Char;
        PhysicalParams: array[0..15] of Char;
        //constructor Create(path: string);
      public
        //function CheckSecurity: Boolean;
    end;

  TFirstForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    SettingsMI: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    StatusBar: TStatusBar;
    Bevel1: TBevel;
    EnumsMenu: TMenuItem;
    N13: TMenuItem;
    BaseCorrectRepMenu: TMenuItem;
    N17: TMenuItem;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ActivateToolButton: TToolButton;
    ToolButton1: TToolButton;
    ProgrammSettingsToolButton: TToolButton;
    DBConnectSettingsToolButton: TToolButton;
    AdministrationPanelToolButton: TToolButton;
    ToolBar3: TToolBar;
    LogViewPanelToolButton: TToolButton;
    QuitToolButton: TToolButton;
    ToolBar4: TToolBar;
    ArhiveToolButton: TToolButton;
    ProtectTimer: TTimer;
    N2: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    bpcArhEnabled: TBoldPropertiesController;
    basrDrList: TBoldAsStringRenderer;
    ToolButton2: TToolButton;
    BoldPropertiesController1: TBoldPropertiesController;
    N14: TMenuItem;
    N16: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    Panel1: TPanel;
    HintMemo: TMemo;
    ModemActivitiToolButton: TToolButton;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    SendControlEmailToolButton: TToolButton;
    IdSMTPControl: TIdSMTP;
    CasheN: TMenuItem;
    N26: TMenuItem;
    ToolButton3: TToolButton;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    L1Memo: TMemo;
    L2Memo: TMemo;
    RingSignalTimer: TTimer;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N10: TMenuItem;
    N35: TMenuItem;
    N38: TMenuItem;
    N37: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    GSM1: TMenuItem;
    N41: TMenuItem;
    USB1: TMenuItem;
    GSMCOM1: TMenuItem;
    RESETUSB1: TMenuItem;
    N1GSM1: TMenuItem;
    COM1: TMenuItem;
    SendSMSToDrToolButton: TToolButton;
    N3: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    PrevOrdersMenu: TMenuItem;
    N45: TMenuItem;
    N44: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    bairDrIcon: TBoldAsIntegerRenderer;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    CIDSearchTimer: TTimer;
    N60: TMenuItem;
    N61: TMenuItem;
    procedure N13Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure CIDSearchTimerTimer(Sender: TObject);
    procedure N59Click(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    function bairDrIconGetAsInteger(Element: TBoldElement;
      Representation: Integer; Expression: string): Integer;
    procedure N49Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure PrevOrdersMenuClick(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure COM1Click(Sender: TObject);
    procedure N1GSM1Click(Sender: TObject);
    procedure RESETUSB1Click(Sender: TObject);
    procedure GSMCOM1Click(Sender: TObject);
    procedure USB1Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure GSM1Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N210Click(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure RingSignalTimerTimer(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure SendSMSToDrToolButtonClick(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure CasheNClick(Sender: TObject);
    procedure SendControlEmailToolButtonClick(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure ModemActivitiToolButtonClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    function basrDrListGetAsString(Element: TBoldElement;
      Representation: Integer; Expression: string): string;
    procedure RTF1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure basrDrListSetColor(Element: TBoldElement; var AColor: TColor;
      Representation: Integer; Expression: string);
    procedure BoldAsStringRenderer2SetColor(Element: TBoldElement;
      var AColor: TColor; Representation: Integer; Expression: string);
    procedure ProgrammSettingsToolButtonClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    function BoldAsStringRenderer2GetAsString(Element: TBoldElement; Representation: Integer; Expression: string): string;
    function BoldAsIntegerRenderer1GetAsInteger(Element: TBoldElement; Representation: Integer; Expression: string): Integer;
    procedure N7Click(Sender: TObject);
    procedure AdminPanelMenuClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure ProtectTimerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActivateToolButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ArhiveToolButtonClick(Sender: TObject);
    procedure AdministrationPanelToolButtonClick(Sender: TObject);
    procedure DBConnectSettingsToolButtonClick(Sender: TObject);
    procedure QuitToolButtonClick(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QuitMenuClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure CheckUnionObjects;
    procedure ShowAttention(ASTR: Widestring; PrevAttention:  Boolean=False);
    function GetKey(cd: Widestring): TProgrammKey;
    function GetSectorByNum(SectNum: Integer): TBoldElement;
    function SpaceStr(str: string): Boolean;
    procedure SelectNotEndedDriverCust(Dr: TBoldElement);
    function GetFileDate(TheFileName: string): string;
    function ActivateDDU(Hide: Boolean): Boolean;
    procedure DeactivateDDU;
    function DisconnectDialUp: Boolean;
    procedure CheckBackUp;
    procedure RefreshADODataSets;
  private
    { Private declarations }
  public
    { Public declarations }
    EnableUpdates: Boolean;
    NDBCanFoc: Boolean;
    AttentionIter: Integer;
    PrevAttentionIter: Integer;
    Changing: Boolean;
  end;

var
  FirstForm: TFirstForm;
  Mouse: TMouse;
  CDP: string;
  rd: TBoldStringRendererData;
  pr: Integer;
  DetPhoneAdding: Boolean;
  ExitAttr: Boolean=False;
  Line1RCounter: Integer=0;
  Line2RCounter: Integer=0;
  ExpCounter: Integer=40;
  ChangeCustNum: Double=-1;
  PK: TProgrammKey;
  cidInSrc: Boolean=False;

implementation

{$R *.dfm}

uses BusinessClasses, CustIntervalSetUnit, ComplexRepSetUnit, SystemEnumsUnit, DriversEffectiveDgrUnit, CustDelUnit,
  AnapaMapUnit, ReportDMUnit, OneDriversOnDaysRepSettUnit,
  PrSettingsFormUnit, DriversIncomeUnit, MainRepSetFormUnit,
  DateUtils, AnnonceArhiveFormUnit,
  AdministrationPanelUnit, BoldAttributes, ReleaseStructUnit,
  ADODMUnit, SoundRecordUnit, UnitCOMFileLevel, SectorEnumsUnit,
  EconomicalEffectiveDgrUnit, PrevCustUnit, SetTimeDateIntervalUnit,
  DrWorkExecRepUnit, FictiveCustDelDateUnit, RemoteCtrlAdmUnit,
  EmptyConnectionUnit, USBAccess, AbOrdersRepSettFormUnit,
  OnLineNumSetUnit, IndividNumSetUnit;

function TFirstForm.GetFileDate(TheFileName: string): string;
var
  FHandle: integer;
begin
result := 'FILE_READ_ERROR';
if FileExists(TheFileName) then
 begin
  FHandle := FileOpen(TheFileName, 0);
  if FileGetDate(FHandle)>0 then
    result := DateTimeToStr(FileDateToDateTime(FileGetDate(FHandle)))
  else
    result:='FILE_OPEN';
  FileClose(FHandle);
 end
else
  result:='FILE_NOT_EXIST';
end;


procedure TFirstForm.SelectNotEndedDriverCust(Dr: TBoldElement);
begin
if IniFile.ReadString('BUSINESS_DATA','hybrid_SQLLEV_mode','NO')='YES' then
     begin
       if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
              begin
                ReleaseStructForm.DispDBGrid.SetFocus;
                ReleaseStructForm.DispDBGrid.SelectedField:=
                      ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Uslovn_stoim')];
                ADOConnectDM.ActiveCustADOQuery.First;

                while not ADOConnectDM.ActiveCustADOQuery.Eof
                  and (ADOConnectDM.ActiveCustADOQuery.FieldByName('Pozyvnoi_ustan').AsInteger<>
                    (Dr as TVoditelj).Pozyvnoi) do
                   begin
                    ReleaseStructForm.DispDBGrid.SelectedField:=
                      ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Uslovn_stoim')];
                    ADOConnectDM.ActiveCustADOQuery.Next;
                   end;
              end;
     end;
end;

function SendEMail(Handle: THandle; Mail: TStrings): Cardinal;
type 
  TAttachAccessArray = array [0..0] of TMapiFileDesc; 
  PAttachAccessArray = ^TAttachAccessArray;
var 
  MapiMessage: TMapiMessage; 
  Receip: TMapiRecipDesc; 
  Attachments: PAttachAccessArray; 
  AttachCount: Integer; 
  i1: integer; 
  FileName: string; 
  dwRet: Cardinal; 
  MAPI_Session, res: Cardinal;
  WndList: Pointer; 
begin 
  dwRet := MapiLogon(Handle, 
    PChar(''), 
    PChar(''), 
    MAPI_LOGON_UI or MAPI_NEW_SESSION, 
    0, @MAPI_Session);
  res:=0;
  if (dwRet <> SUCCESS_SUCCESS) then 
  begin 
    MessageBox(Handle, 
      PChar('Error while trying to send email'), 
      PChar('Error'), 
      MB_ICONERROR or MB_OK); 
  end 
  else 
  begin 
    FillChar(MapiMessage, SizeOf(MapiMessage), #0); 
    Attachments := nil; 
    FillChar(Receip, SizeOf(Receip), #0); 

    if Mail.Values['to'] <> '' then 
    begin 
      Receip.ulReserved := 0; 
      Receip.ulRecipClass := MAPI_TO; 
      Receip.lpszName := StrNew(PChar(Mail.Values['to'])); 
      Receip.lpszAddress := StrNew(PChar('SMTP:' + Mail.Values['to'])); 
      Receip.ulEIDSize := 0; 
      MapiMessage.nRecipCount := 1; 
      MapiMessage.lpRecips := @Receip; 
    end; 

    AttachCount := 0; 

    for i1 := 0 to MaxInt do 
    begin 
      if Mail.Values['attachment' + IntToStr(i1)] = '' then 
        break; 
      Inc(AttachCount); 
    end; 

    if AttachCount > 0 then 
    begin 
      GetMem(Attachments, SizeOf(TMapiFileDesc) * AttachCount); 

      for i1 := 0 to AttachCount - 1 do 
      begin 
        FileName := Mail.Values['attachment' + IntToStr(i1)]; 
        Attachments[i1].ulReserved := 0; 
        Attachments[i1].flFlags := 0; 
        Attachments[i1].nPosition := ULONG($FFFFFFFF); 
        Attachments[i1].lpszPathName := StrNew(PChar(FileName)); 
        Attachments[i1].lpszFileName := 
          StrNew(PChar(ExtractFileName(FileName))); 
        Attachments[i1].lpFileType := nil; 
      end; 
      MapiMessage.nFileCount := AttachCount; 
      MapiMessage.lpFiles := @Attachments^; 
    end; 

    if Mail.Values['subject'] <> '' then 
      MapiMessage.lpszSubject := StrNew(PChar(Mail.Values['subject'])); 
    if Mail.Values['body'] <> '' then 
      MapiMessage.lpszNoteText := StrNew(PChar(Mail.Values['body'])); 

    WndList := DisableTaskWindows(0); 
    try
    res := MapiSendMail(MAPI_Session, Handle,
      MapiMessage, MAPI_DIALOG, 0); 
    finally 
      EnableTaskWindows( WndList ); 
    end; 

    for i1 := 0 to AttachCount - 1 do 
    begin 
      StrDispose(Attachments[i1].lpszPathName); 
      StrDispose(Attachments[i1].lpszFileName); 
    end; 

    if Assigned(MapiMessage.lpszSubject) then 
      StrDispose(MapiMessage.lpszSubject); 
    if Assigned(MapiMessage.lpszNoteText) then 
      StrDispose(MapiMessage.lpszNoteText); 
    if Assigned(Receip.lpszAddress) then 
      StrDispose(Receip.lpszAddress); 
    if Assigned(Receip.lpszName) then 
      StrDispose(Receip.lpszName); 
    MapiLogOff(MAPI_Session, Handle, 0, 0); 
  end;
  Result:=res;
end;

function TFirstForm.SpaceStr(str: string): Boolean;
var i: Integer;
    res: Boolean;
begin
 res:=True;
 if str<>'' then
  for i:=1 to StrLen(PChar(str)) do
    begin
      if str[i]<>' ' then
        res:=False;
    end;
  Result:=
    res;  
end;

function TFirstForm.GetSectorByNum(SectNum: Integer): TBoldElement;
var res: TBoldElement;
begin
  {res:=nil;
  if  SectNum>=0 then
    begin
      BoldHandlesDM.bvhSectByNum.Value.SetAsVariant(SectNum);
      if BoldHandlesDM.blhSectByNum.List.Count>0 then
        res:=BoldHandlesDM.blhSectByNum.CurrentElement;
    end;
  Result:=res;  }
end;

function TFirstForm.GetKey(cd: Widestring): TProgrammKey;
begin
  Result:=PK;
end;

procedure TFirstForm.ShowAttention(ASTR: Widestring; PrevAttention:  Boolean=False);
begin
if PrevAttention then
 begin
  HasPrevCust:=True;
  PrevAttentionIter:=2;
 end
else
  begin
   MessageBeep(MB_ICONEXCLAMATION);
   AttentionIter:=2;
   HintMemo.Visible:=True;
   HintMemo.Lines.Clear;
   HintMemo.Lines.Append(ASTR);
   HintMemo.Color:=clYellow;
   HintMemo.SelStart:=0;
    HintMemo.SelLength:=0;
    SendMessage(HintMemo.Handle, EM_SCROLLCARET, 0, 0);
    //ReleaseStructForm.TabSheet1.Show;
  end;
end;

procedure TFirstForm.N6Click(Sender: TObject);
begin
   AboutBox.Show;
end;

procedure TFirstForm.QuitMenuClick(Sender: TObject);
begin
  Close;
end;

procedure CreateWin9xProcessList(List: TstringList); 
var 
  hSnapShot: THandle; 
  ProcInfo: TProcessEntry32; 
begin 
  if List = nil then Exit; 
  hSnapShot := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0); 
  if (hSnapShot <> THandle(-1)) then 
  begin 
    ProcInfo.dwSize := SizeOf(ProcInfo); 
    if (Process32First(hSnapshot, ProcInfo)) then 
    begin 
      List.Add(ProcInfo.szExeFile); 
      while (Process32Next(hSnapShot, ProcInfo)) do 
        List.Add(ProcInfo.szExeFile); 
    end; 
    CloseHandle(hSnapShot); 
  end; 
end; 

procedure CreateWinNTProcessList(List: TstringList); 
var 
  PIDArray: array [0..1023] of DWORD; 
  cb: DWORD; 
  I: Integer; 
  ProcCount: Integer; 
  hMod: HMODULE; 
  hProcess: THandle; 
  ModuleName: array [0..300] of Char; 
begin 
  if List = nil then Exit; 
  EnumProcesses(@PIDArray, SizeOf(PIDArray), cb); 
  ProcCount := cb div SizeOf(DWORD); 
  for I := 0 to ProcCount - 1 do 
  begin 
    hProcess := OpenProcess(PROCESS_QUERY_INFORMATION or 
      PROCESS_VM_READ, 
      False, 
      PIDArray[I]); 
    if (hProcess <> 0) then 
    begin 
      EnumProcessModules(hProcess, @hMod, SizeOf(hMod), cb); 
      GetModuleFilenameEx(hProcess, hMod, ModuleName, SizeOf(ModuleName)); 
      List.Add(ModuleName); 
      CloseHandle(hProcess); 
    end; 
  end; 
end;

procedure GetProcessList(var List: TstringList); 
var 
  ovi: TOSVersionInfo; 
begin 
  if List = nil then Exit; 
  ovi.dwOSVersionInfoSize := SizeOf(TOSVersionInfo); 
  GetVersionEx(ovi); 
  case ovi.dwPlatformId of 
    VER_PLATFORM_WIN32_WINDOWS: CreateWin9xProcessList(List); 
    VER_PLATFORM_WIN32_NT: CreateWinNTProcessList(List); 
  end 
end; 

function EXE_Running(FileName: string; bFullpath: Boolean): Integer;
var 
  i: Integer; 
  MyProcList: TstringList; 
begin 
  MyProcList := TStringList.Create;
  Result := 0;
  try 
    GetProcessList(MyProcList); 
    //Result := 0;
    if MyProcList = nil then Exit; 
    for i := 0 to MyProcList.Count - 1 do 
    begin 
      if not bFullpath then 
      begin 
        if CompareText(ExtractFileName(MyProcList.Strings[i]), FileName) = 0 then 
          Result := Result+1
      end 
      else if CompareText(MyProcList.strings[i], FileName) = 0
        then Result := Result+1;
      //if Result then Break; 
    end;
  finally
    MyProcList.Free; 
  end; 
end;

procedure TFirstForm.FormCreate(Sender: TObject);
begin
  Mouse:=TMouse.Create;
  CDP:=GetCurrentDir;
  if (EXE_Running('TaxiDispatcher.exe', False)>1) and
    not (IniFile.ReadString('develop_2015_year','ignore_exec_duplicate','NO')='YES') then
  begin
    ShowMessage('���������� ��� ��������, ���� ��� �� �������� ��������� ��� ����� ��������� �����!');
    //Application.Destroy;
    //Close;
    ActivateToolButton.Enabled:=False;
    DBConnectSettingsToolButton.Enabled:=False;
  end;
end;

procedure TFirstForm.N21Click(Sender: TObject);
begin
  CustIntervalSetForm.ShowModal;
end;

procedure TFirstForm.QuitToolButtonClick(Sender: TObject);
begin
  ExitAttr:=True;
  Close;
end;

procedure TFirstForm.DBConnectSettingsToolButtonClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'Open', PChar('TaxiDispatcher.udl'), nil, PChar(CDP), SW_SHOWNORMAL);
end;

procedure TFirstForm.AdministrationPanelToolButtonClick(Sender: TObject);
begin
  AdminPanelForm.ShowModal;
end;

procedure TFirstForm.ArhiveToolButtonClick(Sender: TObject);
begin
   //BoldHandlesDM.blhArhiveSearch.RootHandle:=
   //      BoldModelDM.bsh;
   AnnonceArhiveFormForm.Show;
end;

procedure TFirstForm.FormClose(Sender: TObject; var Action: TCloseAction);
var SaveChanges: OleVariant;
    DocItem: OleVariant;
begin
  SaveChanges:=False;
  DocItem:=1;
  //ClipBoard.Clear;
end;

procedure TFirstForm.CheckBackUp;
begin
  if IniFile.ReadString('BUSINESS_DATA','����������_�_������_����',
    'NO')='YES' then
    begin
    if MessageDlg('������� ��������� ����� ����?',
      mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
        if not ADOConnectDM.SendSQL('BACKUP DATABASE '+
          IniFile.ReadString('BUSINESS_DATA','�����_����',
            ' [TDTwoRelease0408] TO  DISK = N''C:\TDBackUp\TDTwoRelease0408.bak'' WITH NOFORMAT, NOINIT,  NAME = N''TDTwoRelease0408-������ ���� ������ ��������� �����������'', SKIP, NOREWIND, NOUNLOAD,  STATS = 10')) then
        begin
          ShowMessage('��������� �������� ��������� ����� ��!');
        end;
      end;
    end;
end;

procedure TFirstForm.RefreshADODataSets;
begin
  if BoldModelDM.ADOConnection.Connected then
    begin
     BoldModelDM.AllActDriverADOQuery.Active:=False;
     BoldModelDM.AllActDriverADOQuery.Active:=True;
    end;
end;

procedure TFirstForm.ActivateToolButtonClick(Sender: TObject);
var IBE: TVhody_poljz;
begin

  if BoldModelDM.bsh.Active then
  begin
  ExitAttr:=True;
  EnableUpdates:=False;

    if BoldHandlesDM.blhCurrUser.List.Count>0 then
    begin
      IBE:=
        (BoldHandlesDM.blhCurrUser.CurrentElement
        as TPersonal).imeet_vhody.AddNew;
      IBE.Vyhod:=True;
      IBE.Data:=Today+Time;
      if (BoldHandlesDM.blhCurrUser.CurrentElement
        as TPersonal).Rolj_dispetchera then
          IBE.V_roli_dispetchera:=True
      else
         IBE.V_roli_operatora:=True;
     end;
  BoldModelDM.BoldUpdateDBAction1.Execute;
  end;


try
  BoldModelDM.BoldActivateSystemAction1.Execute;
except
  ShowMessage('�������� �� ��������� ��� �� �������������� ���� Windows'+
  ', ��������� ����, ��������� ����������������� ������ �������, '+
  ' ������� � ������������ ������� ��� ������ � ����, ����� ������'+
  ' ��������������� �������������, ������������ � ����� ���������� ��� '+
  ' ��������� (���������) ���������� � �������� ����� ����� ���� '+
  '���������->���������� � �������� ��... (�������� ����� ��. � ������������)!');
end;

if BoldModelDM.bsh.Active then
  begin

   FirstForm.CheckUnionObjects;
   
   BoldModelDM.UserSystemEnter;

   try
     StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).vr_smeny_dispetcherov);
   except
     (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).vr_smeny_dispetcherov:='08:00:00';
   end;
   
   //BoldModelDM.ADOConnection.LoginPrompt:=False;
   EnableUpdates:=True;
   //StateMapForm.CreateSectors;

   RefreshADODataSets;
   ReleaseStructForm.RefreshStack;
   SendControlEmailToolButton.Enabled:=
     True;

   if BoldHandlesDM.blhCurrUser.List.Count>0 then
    begin
    IBE:=
      (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).imeet_vhody.AddNew;
    IBE.Vhod:=True;
    IBE.Data:=
      Today+Time;
    if (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Rolj_dispetchera
       and not (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Vidit_vseh then
      begin
        
        IBE.V_roli_dispetchera:=
          True;
        ADOConnectDM.MainADOConnection.LoginPrompt:=
          False;
        ADOConnectDM.MainADOConnection.Connected:=
           not ADOConnectDM.MainADOConnection.Connected;
         if ADOConnectDM.MainADOConnection.Connected then
           begin
             
             ReleaseStructForm.DispModeTabSheet.Show;

             if ADOConnectDM.SetCurrUserParam then
                begin
                  ADOConnectDM.MainADOConnection.
                    Connected:=False;
                  Close;
                end;

           end;

      end
     else if (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Rolj_dispetchera
        and (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Vidit_vseh then
      begin
        IBE.V_roli_dispetchera:=
          True;
        ADOConnectDM.ActiveCustADOQuery.Connection:=
                nil;

        if IniFile.ReadString('BUSINESS_DATA','��_��������_����������_��_������������_������','NO')='YES' then
          ADOConnectDM.ActiveCustADOQuery.SQL.LoadFromFile(
            CDP+'\sql_settings\main_table2_not_inum.sql') 
        else
          ADOConnectDM.ActiveCustADOQuery.SQL.LoadFromFile(
            CDP+'\sql_settings\main_table2.sql');

        ADOConnectDM.ActiveCustADOQuery.Connection:=
                ADOConnectDM.MainADOConnection;
        ADOConnectDM.MainADOConnection.LoginPrompt:=
          False;
        ADOConnectDM.MainADOConnection.Connected:=
           not ADOConnectDM.MainADOConnection.Connected;
         if ADOConnectDM.MainADOConnection.Connected then
           begin
             
             ReleaseStructForm.DispModeTabSheet.Show;

             if ADOConnectDM.SetCurrUserParam(False) then
                begin
                  ADOConnectDM.MainADOConnection.
                    Connected:=False;
                  Close;
                end;
           end;
      end
     else if not (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Rolj_dispetchera
        and (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Vidit_vseh then
      begin
        IBE.V_roli_operatora:=
           True;

        if IniFile.ReadString('BUSINESS_DATA','hybrid_SQLLEV_mode','NO')='YES' then
           begin
        ADOConnectDM.ActiveCustADOQuery.Connection:=
                nil;

        if IniFile.ReadString(
        'BUSINESS_DATA',
        '��_��������_����������_��_������������_������',
        'NO')='YES' then
          ADOConnectDM.ActiveCustADOQuery.SQL.LoadFromFile(
            CDP+'\sql_settings\main_table3_not_inum.sql')
        else
          ADOConnectDM.ActiveCustADOQuery.SQL.LoadFromFile(
            CDP+'\sql_settings\main_table3.sql');

        ADOConnectDM.ActiveCustADOQuery.Connection:=
                ADOConnectDM.MainADOConnection;
        ADOConnectDM.MainADOConnection.LoginPrompt:=
          False;
        ADOConnectDM.MainADOConnection.Connected:=
           not ADOConnectDM.MainADOConnection.Connected;
         if ADOConnectDM.MainADOConnection.Connected then
           begin
             
             ReleaseStructForm.DispModeTabSheet.Show;

             if ADOConnectDM.SetCurrUserParam(False) then
                begin
                  ADOConnectDM.MainADOConnection.
                    Connected:=False;
                  Close;
                end;
           end;
        end;

      end
     else
         begin
         IBE.V_roli_operatora:=
           True;
         
          if IniFile.ReadString('BUSINESS_DATA','hybrid_SQLLEV_mode','NO')='YES' then
           begin
              ADOConnectDM.ActiveCustADOQuery.Connection:=
                nil;

            if IniFile.ReadString('BUSINESS_DATA','��_��������_����������_��_������������_������','NO')='YES' then
              ADOConnectDM.ActiveCustADOQuery.SQL.LoadFromFile(
                CDP+'\sql_settings\main_table4_not_inum.sql')
            else
              ADOConnectDM.ActiveCustADOQuery.SQL.LoadFromFile(
                CDP+'\sql_settings\main_table4.sql');


        ADOConnectDM.ActiveCustADOQuery.Connection:=
                ADOConnectDM.MainADOConnection;
        ADOConnectDM.MainADOConnection.LoginPrompt:=
          False;
        ADOConnectDM.MainADOConnection.Connected:=
           not ADOConnectDM.MainADOConnection.Connected;
         if ADOConnectDM.MainADOConnection.Connected then
           begin

             ReleaseStructForm.DispModeTabSheet.Show;

             if ADOConnectDM.SetCurrUserParam then
                begin
                  ADOConnectDM.MainADOConnection.
                    Connected:=False;
                  Close;
                end;
           end;
         end;
        end;

   if ADOConnectDM.MainADOConnection.Connected then
      begin
          CheckBackUp;
      end;

     if not BoldModelDM.SendSQL('UPDATE Objekt_vyborki_otchyotnosti SET Ispoljz_priz_3='+
       IntToStr(Round(BoldModelDM.GetNextCustNumber))) then
         ShowMessage('��������� ���������� ���������� ����� �������� ������!');
     BoldModelDM.BoldUpdateDBAction1.Execute;
     end;
  end
else
 begin
  EnableUpdates:=False;
  if IniFile.ReadString(
        'BUSINESS_DATA',
        '���_������_���_������_��_������_�����������',
        'NO')='YES' then
  begin
    ADOConnectDM.MainADOConnection.Connected:=False;
  end
  else
    Close;
 end;
end;

procedure TFirstForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  ExitAttr:=True;
  if BoldModelDM.bsh.Active then
    begin
      ShowMessage('����������� � ���� �������, ���������� ������������ ���!');
      FirstForm.ActivateToolButtonClick(ActivateToolButton);
    end;
end;

procedure TFirstForm.ProtectTimerTimer(Sender: TObject);
begin

  if AttentionIter<0 then
  begin
  HintMemo.Visible:=False;
  HintMemo.Lines.SetText('');
  end
  else
    begin
      AttentionIter:=AttentionIter-1;
    end;
  if PrevAttentionIter<0 then
  begin
    HasPrevCust:=False;
  end
  else
    begin
      PrevAttentionIter:=PrevAttentionIter-1;
    end;
end;

procedure TFirstForm.FormDblClick(Sender: TObject);
begin
if (IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES')
  or (BoldHandlesDM.blhUsersList.List.Count=0) then
  AdminPanelForm.Show;
end;

procedure TFirstForm.AdminPanelMenuClick(Sender: TObject);
begin
  AdminPanelForm.ShowModal;
end;

procedure TFirstForm.N7Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'Open', PChar('TaxiDispatcher.udl'), nil, PChar(CDP), SW_SHOWNORMAL);
end;

procedure TFirstForm.CheckUnionObjects;
begin
  if BoldHandlesDM.blhDriversUnion.Count>0 then
    begin
    end
  else
    begin
     (BoldHandlesDM.blhUniionObjects.List.AddNew as TObjekt_vyborki_otchyotnosti).Tip_objekta:='for_drivers';
     (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya:='08:00:00';
     (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_prinyatyh:='08:00:00';
     (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Kolich_vyd_benzina:=0;
     BoldModelDM.BoldUpdateDBAction1.Execute;
    end;

  //if BoldHandlesDM.behBalansObj.Value=nil then
  //  begin
      //BalBE:=
  //    TBalans.Create(nil,True);
  //    BoldModelDM.BoldUpdateDBAction1.Execute;
  //  end;

  try
    DateTimeToStr((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).BetweenStartSet);
  except
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).BetweenStartSet:=StrToTime('00:02:00');
  end;

  try
    StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).vr_smeny_dispetcherov);
  except
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).vr_smeny_dispetcherov:='08:00:00';
  end;

  try
    DateTimeToStr((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).BetweenSetOn);
  except
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).BetweenSetOn:=StrToTime('00:07:00');
  end;

  try
    DateTimeToStr((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).BetweenOnEnd);
  except
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).BetweenOnEnd:=StrToTime('00:15:00');
  end;

  try
    StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya);
  except
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya:='08:00:00';
  end;

  try
    StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_prinyatyh);
  except
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_prinyatyh:='08:00:00';
  end;

  (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).rep_time:=Today+StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya);

  if (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Vr_smeny_deg_grupp='' then
    begin
      (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Vr_smeny_deg_grupp:='09:00:00';
    end;

  if (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Sutki_deg_gruppy=NULL then
    begin
     if Time>StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Vr_smeny_deg_grupp) then
      (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Sutki_deg_gruppy:=
        StartOfTheDay(Today)
     else
       (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Sutki_deg_gruppy:=
        IncDay(StartOfTheDay(Today),-1);
    end;

  if (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Per_obnovl_deg='' then
    begin
      (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Per_obnovl_deg:='02:00:00';
    end;

   if (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Per_obnovl_obychn_vod='' then
    begin
      (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Per_obnovl_obychn_vod:='00:30:00';
    end;  

  if BoldHandlesDM.blhAllDrivers.Count>0 then
    begin
      BoldHandlesDM.blhAllDrivers.First;
      while True  do
        begin
          (BoldHandlesDM.blhAllDrivers.CurrentElement as TVoditelj).chem_uchityvaetsya_voditelj:=
            (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti);
          if BoldHandlesDM.blhAllDrivers.HasNext then
            BoldHandlesDM.blhAllDrivers.Next
          else
            Break;
        end;
    end;
  if BoldHandlesDM.blhUsersList.List.Count>0 then
    begin
      BoldHandlesDM.blhUsersList.First;
      while True  do
        begin
          (BoldHandlesDM.blhUsersList.CurrentElement as TPersonal).chem_uchityvaetsya_dispetcher:=
            (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti);
          if BoldHandlesDM.blhUsersList.HasNext then
            BoldHandlesDM.blhUsersList.Next
          else
            Break;
        end;
    end;

   BoldModelDM.BoldUpdateDBAction1.Execute;
end;

function TFirstForm.BoldAsIntegerRenderer1GetAsInteger(Element: TBoldElement; Representation: Integer; Expression: string): Integer;
begin
  Result := 0;
  if Assigned(Element) then
  begin
      end;
end;

function TFirstForm.BoldAsStringRenderer2GetAsString(Element: TBoldElement; Representation: Integer; Expression: string): string;
begin
  Result := '';
  if Assigned(Element) then
  begin
    Result:=IntToStr((Element AS TZakaz).Pozyvnoi_ustan);
  end;
end;

procedure TFirstForm.N2Click(Sender: TObject);
begin
  MainRepSetFormUnit.MainRepSettForm.ShowModal;
end;

procedure TFirstForm.N8Click(Sender: TObject);
begin
  OneDaysOnRepSettForm.ShowModal;
end;

procedure TFirstForm.ProgrammSettingsToolButtonClick(Sender: TObject);
begin
   PrSettForm.ShowModal;
end;

procedure TFirstForm.BoldAsStringRenderer2SetColor(Element: TBoldElement;
  var AColor: TColor; Representation: Integer; Expression: string);
begin
  //if not (Element as TZakaz).Vypolnyaetsya and not (Element as TZakaz).Zavershyon then
  //  begin
  //    AColor:=clInfoBk;
  //  end
  if not (Element as TZakaz).Zavershyon then
    begin
      AColor:=clSkyBlue;
    end;
  //else
  //  begin
  //  end;
end;

procedure TFirstForm.basrDrListSetColor(Element: TBoldElement;
  var AColor: TColor; Representation: Integer; Expression: string);
begin
if (Element<>nil) and (Element is TVoditelj) then
 begin
 AColor:=clMoneyGreen;

  if (IniFile.ReadString('BUSINESS_DATA','������������_���������_�����_������_������_������','NO')='YES') and
  (BoldModelDM.GetLocalDrLastOrd(
  (Element as TVoditelj).Pozyvnoi)<
     IncDay((Today+Time),-9)) then
     begin
       AColor:=clLime;
       AColor:=TColor(StrToInt(IniFile.ReadString('BUSINESS_DATA','����_���������_��������_�����_������','59848')));
     end
  else if BoldModelDM.GetLocalDrBusy(
  (Element as TVoditelj).Pozyvnoi)
     then
    begin
      AColor:=clRed;
    end
  else if (Element as TVoditelj).Na_pereryve then
    begin
      AColor:=clSkyBlue;
    end
  else
    begin
      AColor:=clMoneyGreen;
    end;

 end;
end;

procedure TFirstForm.ToolButton2Click(Sender: TObject);
var date_prm: TParameter;
begin
 if not(IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
  begin
    CustDelForm.DataSetProvider1.DataSet:=
      nil;
   CustDelForm.ClientDataSet1.ProviderName:=
     '';
   PrevCustDatesForm.Caption:=
     '������� �� ����...';
   if PrevCustDatesForm.ShowModal=mrOk then
    begin
    if ADOConnectDM.CustDelADOQuery.Parameters.Count=0 then
                    begin
                     date_prm:=ADOConnectDM.CustDelADOQuery.Parameters.AddParameter;
                     date_prm.DataType:=ftDateTime;
                     date_prm.Name:='end_del_date';
                     date_prm.Value:=Today+Time;
                    end;
    ADOConnectDM.CustDelADOQuery.Parameters.ParamByName('end_del_date').
      Value:=FloatToDateTime(Double(DateOf(PrevCustDatesForm.DateTimePicker1.Date))+
           TimeOf(PrevCustDatesForm.DateTimePicker2.Time));
    CustDelForm.DelDate:=FloatToDateTime(Double(DateOf(PrevCustDatesForm.DateTimePicker1.Date))+
           TimeOf(PrevCustDatesForm.DateTimePicker2.Time));

    ADOConnectDM.CustDelADOQuery.Connection:=
           BoldModelDM.ADOConnection;

    //ShowMessage('1');
    ADOConnectDM.CustDelADOQuery.Active:=
      False;
    ADOConnectDM.CustDelADOQuery.Active:=
      True;
    //ShowMessage('2');

    CustDelForm.ShowModal;
    end;
    PrevCustDatesForm.Caption:=
     '��������������� �����';
  end
 else
  begin
   //BoldHandlesDM.blhDelCusts.RootHandle:=
   //      BoldModelDM.bsh;
   //CustDelForm.ShowModal;
  end;
end;

procedure TFirstForm.RTF1Click(Sender: TObject);
begin
   if ReportDM.NDROpenDialog.Execute then
    begin
      ReportDM.RvRenderRTF.InputFileName:=ReportDM.NDROpenDialog.FileName;
      ReportDM.RvRenderRTF.OutputFileName:=
      ExtractFileDir(ReportDM.NDROpenDialog.FileName)+'\'+StringReplace(PChar(ExtractFileName(ReportDM.NDROpenDialog.FileName)),StrScan(PChar(ExtractFileName(ReportDM.NDROpenDialog.FileName)),'.'),'',[rfReplaceAll])+'.rtf';
      ReportDM.RvRenderRTF.Render;
      ShowMessage('�������������� ���������, �������� ���� - '+ExtractFileDir(ReportDM.NDROpenDialog.FileName)+'\'+StringReplace(PChar(ExtractFileName(ReportDM.NDROpenDialog.FileName)),StrScan(PChar(ExtractFileName(ReportDM.NDROpenDialog.FileName)),'.'),'',[rfReplaceAll])+'.rtf');
    end;
end;

function TFirstForm.basrDrListGetAsString(Element: TBoldElement;
  Representation: Integer; Expression: string): string;
var has_aevs_str: string;
begin
  Result := '';
  has_aevs_str := '';
  if Assigned(Element) then
  begin

    if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
    begin
    end
    else
     begin
      if ModelDM.BoldModelDM.GetLocalDrHasAEvs(
        (Element as TVoditelj).Pozyvnoi) then
         has_aevs_str:='!!!';
      if IniFile.ReadString('BUSINESS_DATA','show_dr_empty_time','NO')='YES' then
        Result := has_aevs_str+IntToStr((Element as TVoditelj).Pozyvnoi)+
        ', '+IntToStr(HoursBetween(
        BoldModelDM.GetLocalDrLastOrd((Element as TVoditelj).
        Pozyvnoi),Today+Time))
        +':'+IntToStr(MinutesBetween(
        BoldModelDM.GetLocalDrLastOrd((Element as
        TVoditelj).Pozyvnoi),
        Today+Time) mod 60)+', '+FloatToStr(
        BoldModelDM.GetLocalDrSumm(
        (Element as TVoditelj).Pozyvnoi)
        )+' ���.'
      else
        Result := has_aevs_str+IntToStr((Element as TVoditelj).Pozyvnoi)+
        ', '+FloatToStr(
        BoldModelDM.GetLocalDrSumm(
        (Element as TVoditelj).Pozyvnoi)
        )+' ���.';
     end;
  end;
end;

procedure TFirstForm.N16Click(Sender: TObject);
begin
  ReportDM.MainRepForDiagramm:=True;
  MainRepSetFormUnit.MainRepSettForm.ShowModal;
  ReportDM.MainRepForDiagramm:=False;
  ReportDM.AllTaxSummCDS.LoadFromFile('proba.cds');
  ReportDM.AllTaxSummCDS.Active:=True;
  DrEffictiveDgrForm.ShowModal;
  ReportDM.AllTaxSummCDS.Active:=False;
end;

procedure TFirstForm.N22Click(Sender: TObject);
begin
  SystemEnumsForm.ShowModal;
  SystemEnumsForm.TabSheet1.Show;
end;

procedure TFirstForm.N9Click(Sender: TObject);
begin
  StatRepSetForm.ShowModal;
end;

procedure TFirstForm.ModemActivitiToolButtonClick(Sender: TObject);
begin
  if IniFile.ReadString('BUSINESS_DATA','scan_phone_line','NO')='YES' then
   begin
     if MessageDlg('�������� ����� �������� ���� �������� �� �������?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
       begin
        FirstForm.ModemActivitiToolButton.ImageIndex:=23;
        IniFile.WriteString('BUSINESS_DATA','scan_phone_line','NO');
        IniFile.UpdateFile;
       end;
   end
  else
   begin
     if MessageDlg('��������� ����� �������� ���� �������� �� �������?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
       begin
        FirstForm.ModemActivitiToolButton.ImageIndex:=22;
        IniFile.WriteString('BUSINESS_DATA','scan_phone_line','YES');
        IniFile.UpdateFile;
       end;
   end;
end;

procedure TFirstForm.N23Click(Sender: TObject);
begin
  ModemSettingsForm.Show;
end;

procedure TFirstForm.N24Click(Sender: TObject);
begin
  SectorEnumForm.ShowModal;
end;

procedure TFirstForm.N25Click(Sender: TObject);
begin
  SoundRecForm.ShowModal;
end;

procedure TFirstForm.SendControlEmailToolButtonClick(Sender: TObject);
var
    //mes: TIDMessage;
    i:integer;
    mail: TStringList;
    status: string;
begin

 mail := TStringList.Create;
 mail.Add('����� ���������: '+ADOConnectDM.
 CurrUserADOQuery.FieldByName(
   'Login').AsString);

 ADOConnectDM.Last8HourseArhADOQuery.Active:=False;
 try
   mail.Add('�� ��������� 8 ����� �������� ������ - '+
     '.');
 except
   ShowMessage('��������� ������ ���������� �������� ������!');
 end;

 ADOConnectDM.Last8HoursePresentADOQuery.Active:=False;
 try
   ADOConnectDM.Last8HoursePresentADOQuery.Active:=True;
   mail.Add('�� ��������� 8 ����� �������� ������ - '+
     IntToStr(ADOConnectDM.Last8HoursePresentADOQuery.
     FieldByName('presents_count').AsInteger)+'.');
 except
   ShowMessage('��������� ������ ���������� �������� ������!');
 end;

 mail.Add('��������� �� ����� - '+', detailed:');

 if BoldHandlesDM.blhActDrTimeOut.List.Count>0 then
  for i:=0 to BoldHandlesDM.blhActDrTimeOut.List.Count-1 do
   begin
     if True
     then
       status:='�����'
     else if True then
       status:='�� ��������'
     else if False then
       status:='������ � �������'
     else
       status:='��������';
     ADOConnectDM.Last30MinDrMailInfoADOQuery.Active:=
       False;
     ADOConnectDM.Last3HourseDrMailADOQuery.Active:=
       False;
     ADOConnectDM.Last8HourseDrMailADOQuery.Active:=
       False;
     ADOConnectDM.Last30MinDrMailInfoADOQuery.
       Parameters.FindParam('dr_num').Value:=
        (BoldHandlesDM.blhActDrTimeOut.List.Elements[i]
        as TVoditelj).Pozyvnoi;
     ADOConnectDM.Last3HourseDrMailADOQuery.
       Parameters.FindParam('dr_num').Value:=
        (BoldHandlesDM.blhActDrTimeOut.List.Elements[i]
        as TVoditelj).Pozyvnoi;
     ADOConnectDM.Last8HourseDrMailADOQuery.
       Parameters.FindParam('dr_num').Value:=
        (BoldHandlesDM.blhActDrTimeOut.List.Elements[i]
        as TVoditelj).Pozyvnoi;

     try
       ADOConnectDM.Last30MinDrMailInfoADOQuery.Active:=
         True;
       ADOConnectDM.Last3HourseDrMailADOQuery.Active:=
         True;
       ADOConnectDM.Last8HourseDrMailADOQuery.Active:=
         True;
     except
       ShowMessage('������ ��������� ����������� ������!');
     end;

     mail.Add('�������� '+
       IntToStr((BoldHandlesDM.blhActDrTimeOut.List.
       Elements[i] as TVoditelj).Pozyvnoi));
     mail.Add(' �� ��������� 30 ����� ������ = '+
     IntToStr(ADOConnectDM.Last30MinDrMailInfoADOQuery.
     FindField('ord_count').AsInteger)+', ����� - '+
     FloatToStr(ADOConnectDM.Last30MinDrMailInfoADOQuery.
     FindField('ord_summ').AsFloat));
     mail.Add(' �� ��������� 3 ���� ������ = '+
     IntToStr(ADOConnectDM.Last3HourseDrMailADOQuery.
     FindField('ord_count').AsInteger)+', ����� - '+
     FloatToStr(ADOConnectDM.Last3HourseDrMailADOQuery.
     FindField('ord_summ').AsFloat));
     mail.Add(' �� ��������� 8 ����� ������ = '+
     IntToStr(ADOConnectDM.Last8HourseDrMailADOQuery.
     FindField('ord_count').AsInteger)+', ����� - '+
     FloatToStr(ADOConnectDM.Last8HourseDrMailADOQuery.
     FindField('ord_summ').AsFloat));
   end;

 SendControlEmailToolButton.Enabled:=false;


   {if ActivateDDU(True) then
    begin
     try

      IdSMTPControl.Port:=25;
      IdSMTPControl.Password:=
       (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).betweenOnEndColor;
      //IdSMTPControl.
      mes:=TIdMessage.Create(nil);
      mes.Body:=mail;

      mes.ContentType:='text';
      mes.Subject:='Control information on moment '+DateTimeToStr(Today+Time);
      mes.From.Address:=IniFile.ReadString('BUSINESS_DATA','control_mail','');

      mes.Recipients.EMailAddresses:=IniFile.ReadString('BUSINESS_DATA','control_mail','');
      mes.IsEncoded:=true;

      IdSMTPControl.Connect();
        if IdSMTPControl.Connected then
        begin
          IdSMTPControl.Send(mes);
          ShowMessage('�������� ���������!');
        end
        else ShowMessage('��� ���������� � ��������, �������� �� ��������� ��������!');
      finally
        IdSMTPControl.Disconnect;
        DeactivateDDU;
      end;
    end; }

  SendControlEmailToolButton.Enabled:=true;
end;

procedure TFirstForm.CasheNClick(Sender: TObject);
begin
  DriversIncomeForm.ShowModal;
end;

procedure TFirstForm.N26Click(Sender: TObject);
begin
if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
begin
end
else
begin
 if SetDateIntervalForm.SelectInterval=mrOk then
  begin
   EconomicalEffectDgrForm.EffDgrADOQuery.Parameters.ParamByName
     ('st_dt').Value:=SetDateIntervalForm.StartDateTime;
   //ShowMessage(DatetimeToStr(SetDateIntervalForm.StartDateTime));
   EconomicalEffectDgrForm.EffDgrADOQuery.Parameters.ParamByName
     ('en_dt').Value:=SetDateIntervalForm.EndDateTime;
   EconomicalEffectDgrForm.EffDgrADOQuery.Active:=False;
   EconomicalEffectDgrForm.EffDgrADOQuery.Active:=True;
   EconomicalEffectDgrForm.ShowModal;
  end;
end;

end;

procedure TFirstForm.SendSMSToDrToolButtonClick(Sender: TObject);
begin
  if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
    begin
      ADOConnectDM.SendSMSToCurrentDriver;
    end
  else
    ShowMessage('��� �������� ������!');
end;


procedure TFirstForm.N28Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'Open', PChar('TaxiDispatcher.ini'), nil, PChar(CDP), SW_SHOWNORMAL);
end;

procedure TFirstForm.N29Click(Sender: TObject);
begin
if (Sender as TMenuItem).Checked then
 begin
  IniFile.WriteString('BUSINESS_DATA','disable_main_mode_ask','YES');
  IniFile.UpdateFile;
 end
else
 begin
  IniFile.WriteString('BUSINESS_DATA','disable_main_mode_ask','NO');
  IniFile.UpdateFile;
 end;
 (Sender as TMenuItem).Checked:=
   not (Sender as TMenuItem).Checked;
end;

procedure TFirstForm.N30Click(Sender: TObject);
begin
  ReleaseStructForm.sPanel1.Visible:=True;
  //ReleaseStructForm.Splitter2.Visible:=True;
  EndedOrderField:='nomer_zakaza';
  ReleaseStructForm.QueryNotEndedCust;
end;

procedure TFirstForm.RingSignalTimerTimer(Sender: TObject);
begin
  if Line1RCounter>0 then
     begin
       if L1Memo.Color<>clRed then
          L1Memo.Color:=clRed
       else
          L1Memo.Color:=clWhite;
       Line1RCounter:=
         Line1RCounter-1;
     end
  else
    L1Memo.Color:=clWhite;

  if Line2RCounter>0 then
     begin
       if L2Memo.Color<>clBlue then
          L2Memo.Color:=clBlue
       else
          L2Memo.Color:=clWhite;
       Line2RCounter:=
         Line2RCounter-1;
     end
  else
    L2Memo.Color:=clWhite;
end;

procedure TFirstForm.N110Click(Sender: TObject);
begin
  Line1RCounter:=20;
end;

procedure TFirstForm.N210Click(Sender: TObject);
begin
  Line2RCounter:=20;
end;

procedure TFirstForm.N31Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'Open', PChar('UnionDisp.udl'), nil, PChar(CDP), SW_SHOWNORMAL);
end;

procedure TFirstForm.N32Click(Sender: TObject);
begin
  DrExecRepSettForm.ShowModal;
end;

procedure TFirstForm.N33Click(Sender: TObject);
begin
  if FictOrdDelDateForm.ShowModal=mrOk then
    if MessageDlg('������� ��������� ������ �� '+DateToStr(
         StartOfTheDay(FictOrdDelDateForm.sDateEdit1.Date))+
         ' ?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
       begin
         ADOConnectDM.FictOrderDelADOCommand.
           Parameters[0].Value:=
             StartOfTheDay(FictOrdDelDateForm.sDateEdit1.Date);
         try
           ADOConnectDM.FictOrderDelADOCommand.Execute;
           ShowMessage('������������� ��� ���������� ����������!');
         except
           ShowMessage('��������� ����������� �������, ������������� ��� ���������� ����������!');
         end;
       end;
end;

procedure TFirstForm.N34Click(Sender: TObject);
begin
  BoldModelDM.IndividPersonsADOQuery.Active:=False;
  BoldModelDM.IndividPersonsADOQuery.Active:=True;
  BoldModelDM.IndividPersonsADOQuery.Sort:=
    'Korpus ASC';
  SystemEnumsForm.ShowModal;
  SystemEnumsForm.TabSheet2.Show;
end;

procedure TFirstForm.N10Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'Open', PChar('evolution/comments.txt'), nil, PChar(CDP), SW_SHOWNORMAL);
end;

procedure TFirstForm.N35Click(Sender: TObject);
begin
  if IniFile.ReadString('BUSINESS_DATA','����������_��������������_��������������_������','NO')='YES' then
     begin
       IniFile.WriteString('BUSINESS_DATA','����������_��������������_��������������_������','NO');
       ReleaseStructForm.AdditDispPageControl.Visible:=False;
       FirstForm.N35.Checked:=False;
     end
   else
     begin
       IniFile.WriteString('BUSINESS_DATA','����������_��������������_��������������_������','YES');
       ReleaseStructForm.AdditDispPageControl.Visible:=True;
       FirstForm.N35.Checked:=True;
     end;
end;

procedure TFirstForm.N5Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'Open', PChar('reports/guides/TaxiDispatcherGuide.doc'), nil, PChar(CDP), SW_SHOWNORMAL);
end;

function TFirstForm.ActivateDDU(Hide: Boolean): Boolean;
 var
  dwConnectionTypes: DWORD;
  res: Boolean;
  //Reg: TRegistry;
  //TempResult: Boolean;
  //name, con: string;
  //ASW: Integer;
 begin
   res:=False;
   dwConnectionTypes := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN +
     INTERNET_CONNECTION_PROXY;
   if not InternetGetConnectedState(@dwConnectionTypes, 0) then
     // not connected
    begin
      if not InternetAutodial(INTERNET_AUTODIAL_FORCE_ONLINE or
         INTERNET_AUTODIAL_FORCE_UNATTENDED, 0) then
       begin
         ShowMessage('��������� ����������� ���������� � ������� �� ���������!');
       end
      else
        res:=True;
     end
    else
      res:=True;
  Result := res;
 end;

procedure TFirstForm.DeactivateDDU;
 begin
   if DisconnectDialUp = true then
     ShowMessage('���������� ��������-��������.')
   else
     ShowMessage('�� ������� ��������� ����������');
 end;

procedure TFirstForm.N37Click(Sender: TObject);
begin
  FirstForm.ActivateDDU(True);
end;

procedure TFirstForm.N39Click(Sender: TObject);
begin
  FirstForm.DeactivateDDU;
end;

function TFirstForm.DisconnectDialUp: Boolean;
var
  Lib: HINST;
  RasEnumConnections: TRasEnumConnections;
  RasHangUp: TRasHangUp;
  RasConn: TRasConn;
  Code, Size, Connections: DWORD;
begin
  Result := True;
  try
    Lib := LoadLibrary('rasapi32.dll');
    try
      if Lib = 0 then
        Abort;
      RasEnumConnections := GetProcAddress(Lib, 'RasEnumConnectionsA');
      if not Assigned(@RasEnumConnections) then
        Abort;
      RasHangUp := GetProcAddress(Lib, 'RasHangUpA');
      if not Assigned(@RasHangUp) then
        Abort;
      FillChar(RasConn, SizeOf(RasConn), 0);
      RasConn.Size := SizeOf(RasConn);
      Code := RasEnumConnections(RasConn, Size, Connections);
      if (Connections <> 1) or (Code <> 0) then
        Abort;
      if RasHangUp(RasConn.Handle) <> 0 then
        Abort;
      Sleep(3000);
    finally
      FreeLibrary(Lib);
    end;
  except
    on E: EAbort do
      Result := False;
  else
    raise;
  end;
end;

procedure TFirstForm.N40Click(Sender: TObject);
begin
 if ADOConnectDM.MainADOConnection.Connected then
 begin
  try
    ADOConnectDM.RestoreUnlinkOrdersADOC.Execute;
    ShowMessage('�������������� ������ �����������, ������������� �������!');
  except
    ShowMessage('������ ���������� ������� �� �������������� ������!');
  end;
 end
 else
   ShowMessage('��� ���������� � ����� ������!');
end;

procedure TFirstForm.GSM1Click(Sender: TObject);
begin

  if (IniFile.ReadString('modems','use_gsm_modem','NO')='YES') then
    ModemSettingsForm.GSMApdComPort.DonePort;

  if (IniFile.ReadString('modems','use_gsm_modem2','NO')='YES') then
    ModemSettingsForm.GSM2ApdComPort.DonePort;

  if (IniFile.ReadString('modems','use_gsm_modem3','NO')='YES') then
    ModemSettingsForm.GSM3ApdComPort.DonePort;

  if not ModemSettingsForm.GSMApdComPort.Open and
                    (IniFile.ReadString('modems','use_gsm_modem','NO')='YES') then
                    begin

                      FirstForm.StatusBar.Panels[4].Text :=
                        '�����. 1GSM...';
                      ModemSettingsForm.Init1GSMModem;
                      if not ModemSettingsForm.GSMApdComPort.Open then
                        FirstForm.StatusBar.Panels[4].Text :=
                          '�� �����. 1GSM!!!';
                    end;
                  if not ModemSettingsForm.GSM2ApdComPort.Open and
                    (IniFile.ReadString('modems','use_gsm_modem2','NO')='YES') then
                    begin

                      FirstForm.StatusBar.Panels[4].Text :=
                        '�����. 2GSM...';
                      ModemSettingsForm.Init2GSMModem;
                      if not ModemSettingsForm.GSM2ApdComPort.Open then
                        FirstForm.StatusBar.Panels[4].Text :=
                          '�� �����. 2GSM!!!';
                    end;
                  if not ModemSettingsForm.GSM3ApdComPort.Open and
                    (IniFile.ReadString('modems','use_gsm_modem3','NO')='YES') then
                    begin

                      FirstForm.StatusBar.Panels[4].Text :=
                        '�����. 3GSM...';
                      ModemSettingsForm.Init3GSMModem;
                      if not ModemSettingsForm.GSM3ApdComPort.Open then
                        FirstForm.StatusBar.Panels[4].Text :=
                          '�� �����. 3GSM!!!';
                    end;
end;

procedure TFirstForm.N41Click(Sender: TObject);
begin
  if ModemSettingsForm.ApdComPort.Open then
    ShowMessage('Open');
  ModemSettingsForm.ApdComPort.DonePort;
  if not ModemSettingsForm.ApdComPort.Open then
    ShowMessage('Closed');
end;

procedure TFirstForm.USB1Click(Sender: TObject);
begin
  USBAccessForm.Show;
end;

procedure TFirstForm.GSMCOM1Click(Sender: TObject);
begin
    if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������','modem')) then
      ShowMessage('���������� 1 ���������');
    if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������2','modem')) then
      ShowMessage('���������� 2 ���������');
    if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������3','modem')) then
      ShowMessage('���������� 3 ���������');
    if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������','modem')) then
      begin
        PeriodicDevConRecovery:=True;
        ShowMessage('���������� 1 ��������');
      end
    else
      ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������','modem'));
    if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������2','modem')) then
      begin
        PeriodicDevConRecovery2:=True;
        ShowMessage('���������� 2 ��������');
      end
    else
      ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������2','modem'));
    if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������3','modem')) then
      begin
        PeriodicDevConRecovery3:=True;
        ShowMessage('���������� 3 ��������');
      end
    else
      ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������3','modem'));
end;

procedure TFirstForm.RESETUSB1Click(Sender: TObject);
begin
    if ChangeDeviceState(DICS_DISABLE, True) then
    ShowMessage('���������� ���������');
    if ChangeDeviceState(DICS_ENABLE, True) then
    ShowMessage('���������� ��������');
end;

procedure TFirstForm.N1GSM1Click(Sender: TObject);
begin
  PeriodicDevConRecovery:=True;
  PeriodicDevConRecovery2:=True;
  PeriodicDevConRecovery3:=True;
end;

procedure TFirstForm.COM1Click(Sender: TObject);
begin
  if (IniFile.ReadString('modems','use_gsm_modem','NO')='YES') then
    ModemSettingsForm.GSMApdComPort.DonePort;

  if (IniFile.ReadString('modems','use_gsm_modem2','NO')='YES') then
    ModemSettingsForm.GSM2ApdComPort.DonePort;

  if (IniFile.ReadString('modems','use_gsm_modem3','NO')='YES') then
    ModemSettingsForm.GSM3ApdComPort.DonePort;

  if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������','modem')) then
      ShowMessage('���������� 1 ���������');
    if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������2','modem')) then
      ShowMessage('���������� 2 ���������');
    if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������3','modem')) then
      ShowMessage('���������� 3 ���������');
    if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������','modem')) then
      begin
        PeriodicDevConRecovery:=True;
        ShowMessage('���������� 1 ��������');
      end
    else
      ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������','modem'));
    if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������2','modem')) then
      begin
        PeriodicDevConRecovery2:=True;
        ShowMessage('���������� 2 ��������');
      end
    else
      ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������2','modem'));
    if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������3','modem')) then
      begin
        PeriodicDevConRecovery3:=True;
        ShowMessage('���������� 3 ��������');
      end
    else
      ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
              '���_�������������_����������3','modem'));

  if not ModemSettingsForm.GSMApdComPort.Open and
                    (IniFile.ReadString('modems','use_gsm_modem','NO')='YES') then
                    begin

                      FirstForm.StatusBar.Panels[4].Text :=
                        '�����. 1GSM...';
                      ModemSettingsForm.Init1GSMModem;
                      if not ModemSettingsForm.GSMApdComPort.Open then
                        FirstForm.StatusBar.Panels[4].Text :=
                          '�� �����. 1GSM!!!';
                    end;
                  if not ModemSettingsForm.GSM2ApdComPort.Open and
                    (IniFile.ReadString('modems','use_gsm_modem2','NO')='YES') then
                    begin

                      FirstForm.StatusBar.Panels[4].Text :=
                        '�����. 2GSM...';
                      ModemSettingsForm.Init2GSMModem;
                      if not ModemSettingsForm.GSM2ApdComPort.Open then
                        FirstForm.StatusBar.Panels[4].Text :=
                          '�� �����. 2GSM!!!';
                    end;
                  if not ModemSettingsForm.GSM3ApdComPort.Open and
                    (IniFile.ReadString('modems','use_gsm_modem3','NO')='YES') then
                    begin

                      FirstForm.StatusBar.Panels[4].Text :=
                        '�����. 3GSM...';
                      ModemSettingsForm.Init3GSMModem;
                      if not ModemSettingsForm.GSM3ApdComPort.Open then
                        FirstForm.StatusBar.Panels[4].Text :=
                          '�� �����. 3GSM!!!';
                    end;
end;

procedure TFirstForm.N3Click(Sender: TObject);
begin
  if MessageDlg('������� ��������� ����� ����?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
                    begin
                        if not ADOConnectDM.SendSQL('BACKUP DATABASE '+
                          IniFile.ReadString('BUSINESS_DATA','�����_����',' [TDTwoRelease0408] TO  DISK = N''C:\TDBackUp\TDTwoRelease0408.bak'' WITH NOFORMAT, NOINIT,  NAME = N''TDTwoRelease0408-������ ���� ������ ��������� �����������'', SKIP, NOREWIND, NOUNLOAD,  STATS = 10')) then
                            begin
                              ShowMessage('��������� �������� ��������� ����� ��!');
                            end;
                    end;
end;

procedure TFirstForm.ToolButton4Click(Sender: TObject);
begin
  try
  BoldModelDM.BoldActivateSystemAction1.Execute;
except
  ShowMessage('�������� �� ��������� ��� �� �������������� ���� Windows'+
  ', ��������� ����, ��������� ����������������� ������ �������, '+
  ' ������� � ������������ ������� ��� ������ � ����, ����� ������'+
  ' ��������������� �������������, ������������ � ����� ���������� ��� '+
  ' ��������� (���������) ���������� � �������� ����� ����� ���� '+
  '���������->���������� � �������� ��... (�������� ����� ��. � ������������)!');
end;
end;

procedure TFirstForm.PrevOrdersMenuClick(Sender: TObject);
begin
  if PrevOrdersMenu.Checked then
  begin
  PrevOrdersMenu.Checked :=False;
  if (IniFile.ReadString('BUSINESS_DATA',
    'filter_by_manual_ready','NO')='YES') then
        begin
           ADOConnectDM.ActiveCustADOQuery.Filtered:=
             False;
           ADOConnectDM.ActiveCustADOQuery.Filter:='(Yavl_pochasovym=0) and (Predvariteljnyi=0) or (Zadeistv_predvarit=1)';
           ADOConnectDM.ActiveCustADOQuery.Filtered:=
             True;
          end
        else
        begin
           ADOConnectDM.ActiveCustADOQuery.Filtered:=
             False;
           ADOConnectDM.ActiveCustADOQuery.Filter:='(Predvariteljnyi=0) or (Zadeistv_predvarit=1)';
           ADOConnectDM.ActiveCustADOQuery.Filtered:=
             True;
          end;
  end
  else  begin
    PrevOrdersMenu.Checked :=True;
  if (IniFile.ReadString('BUSINESS_DATA',
    'filter_by_manual_ready','NO')='YES') then
        begin
           ADOConnectDM.ActiveCustADOQuery.Filtered:=
             False;
           ADOConnectDM.ActiveCustADOQuery.Filter:='(Yavl_pochasovym=0) and (Predvariteljnyi=1)';
           ADOConnectDM.ActiveCustADOQuery.Filtered:=
             True;
          end
        else
        begin
           ADOConnectDM.ActiveCustADOQuery.Filtered:=
             False;
           ADOConnectDM.ActiveCustADOQuery.Filter:='(Predvariteljnyi=1)';
           ADOConnectDM.ActiveCustADOQuery.Filtered:=
             True;
          end;
  end;
end;

procedure TFirstForm.N44Click(Sender: TObject);
begin
  BoldOthHandleCompDM.SetCustCount;
end;

procedure TFirstForm.N47Click(Sender: TObject);
begin
  ADOConnectDM.ExportAbNumbersToFile;
end;

procedure TFirstForm.N48Click(Sender: TObject);
begin
  if ADOConnectDM.ImportAbNumbersToFile then
  begin
    ReleaseStructForm.AbNumberImportTabSheet.Show;
  end;
end;

procedure TFirstForm.N49Click(Sender: TObject);
begin
  RemoteCtrlAdmForm.ShowModal;
end;

function TFirstForm.bairDrIconGetAsInteger(Element: TBoldElement;
  Representation: Integer; Expression: string): Integer;
begin
  Result := -1;
  if Assigned(Element) then
  begin
    if IniFile.ReadString('BUSINESS_DATA',
    'enable_for_allXML_DEMO','NO')='YES' then
    begin
    end
    else
    begin
    try
        if BoldModelDM.GetLocalDrRemoteCl(
        (Element as TVoditelj).Pozyvnoi)
          then
          begin
           if (BoldModelDM.GetLocalDrRemoteSet(
            (Element as TVoditelj).Pozyvnoi)<0)
            and
             ((ABS(MinutesBetween((Today+Time),BoldModelDM.
             GetLocalDrLastStatTime(
            (Element as TVoditelj).Pozyvnoi)))>
            IniFile.ReadInteger('���������_��������',
            '��������_��������_����������',0)
            ) or
            (IniFile.ReadString('���������_��������',
            '������������_�������_����������','NO')<>'YES'))
            then
             Result:=10
           else
              Result:=5;
          end
        else
          Result:=6;
    except
      ShowMessage('��������� ����������� '+
      '������� ���������� ��������!');
    end;
    end;
  end;
end;

procedure TFirstForm.N50Click(Sender: TObject);
begin
  EmptyConnForm.ShowModal;
end;

procedure TFirstForm.N52Click(Sender: TObject);
begin
  if ADOConnectDM.ImportCallPhonesToFile then
  begin
    ReleaseStructForm.ImportCallPhonesTabSheet.Show;
  end;
end;

procedure TFirstForm.N53Click(Sender: TObject);
begin
  ADOConnectDM.resetRemoteDrFlags;
end;

procedure TFirstForm.N54Click(Sender: TObject);
begin      
  ADOConnectDM.restoreRemoteDrFlags;
end;

procedure TFirstForm.N56Click(Sender: TObject);
begin
  ADOConnectDM.resetRemoteDrFlags;
end;

procedure TFirstForm.N57Click(Sender: TObject);
begin
  ADOConnectDM.restoreRemoteDrFlags;
end;

procedure TFirstForm.N58Click(Sender: TObject);
begin
    AbOrdersRepSettForm.ShowModal;
end;

procedure TFirstForm.N59Click(Sender: TObject);
begin
  ADOConnectDM.DrOnMapHttpParamsADODS.Active:=False;
  ADOConnectDM.DrOnMapHttpParamsADODS.Active:=True;
  if ADOConnectDM.DrOnMapHttpParamsADODS.Active then
  ShellExecute(FirstForm.Handle, 'open',
  PAnsiChar(IniFile.ReadString('BUSINESS_DATA',
    'gps_dr_statuses_page_base',
    'http://psdevelop.ru/ymap3.html?')+
    ADOConnectDM.DrOnMapHttpParamsADODS.
    FieldByName('prms').AsString), nil, nil, SW_NORMAL);
end;

procedure TFirstForm.CIDSearchTimerTimer(Sender: TObject);
var
  searchResult : TSearchRec;
  text: String;
  myFile: TextFile;
  sList: TStringList;
  phone: String;
begin
  //�����������_������_��_SIP
  if not cidInSrc and ADOConnectDM.MainADOConnection.Connected then
  begin
  try
  try
  cidInSrc:=True;
  if IniFile.ReadString('BUSINESS_DATA',
    '�����������_������_��_SIP','NO')='YES' then
  begin
    if FindFirst('ClientModules\TDSIPPhone\*.cid', faAnyFile, searchResult) = 0 then
    begin
      //repeat
      sList:=TStringList.Create;
      sList.LoadFromFile('ClientModules\TDSIPPhone\'+
        searchResult.Name);
      if sList.Count>0 then
      begin
        phone:=sList.Strings[0];
        if(Length(phone)=11) then
          phone := Copy(phone,2,10);
        if IniFile.ReadString('BUSINESS_DATA',
    '��������_������_��_SIP','NO')='YES' then
    begin
    phone:=(StringReplace(phone,
   IniFile.ReadString('BUSINESS_DATA',
    '��������_�������_SIP',''),
     '',[rfReplaceAll]));
    end;
      if(Length(phone)>=IniFile.ReadInteger('BUSINESS_DATA',
        '�����_�����_SIP',5)) then
            ReleaseStructForm.AddNewCustWithDetectNumber
              (phone, True);
      end;

      DeleteFile('ClientModules\TDSIPPhone\'+
        searchResult.Name);

      // ������ ���������� �������, ������������ ����� ���������, ��������
      FindClose(searchResult);
    end;
  end;
  except
  end;
  finally
    cidInSrc:=False;
  end;
  end;
end;

procedure TFirstForm.N60Click(Sender: TObject);
begin
  OnLineSetNumForm.ShowModal;
  if StrToIntDef(OnLineSetNumForm.sEdit1.Text,-1)<>-1 then
    begin
      ADOConnectDM.ChechDriverBalanceStatus(
        StrToInt(OnLineSetNumForm.sEdit1.Text));
      ADOConnectDM.CheckDrUseDynamicBalanceStatus(
        StrToInt(OnLineSetNumForm.sEdit1.Text));

      if not ADOConnectDM.SendSQLModel('UPDATE Voditelj SET '+
				'V_rabote=1 WHERE Pozyvnoi='+
        IntToStr(StrToIntDef(OnLineSetNumForm.sEdit1.Text,-1))) then
					ShowMessage('��������� ��������� �������� �� ����� ��������!');
    end
  else
    ShowMessage('������������ �������� ��������!'); 
end;

procedure TFirstForm.N61Click(Sender: TObject);
begin
  IndividNumSetUnit.AddOrderAndINumMode:=False;
    if IniFile.ReadString('BUSINESS_DATA',
    'enable_self_cust_adding','NO')='YES' then
         begin
             ADOConnectDM.AddDISPCust;
         end;
end;

procedure TFirstForm.N17Click(Sender: TObject);
begin
  SystemEnumsForm.ShowModal;
  SystemEnumsForm.TabSheet3.Show;
end;

procedure TFirstForm.N13Click(Sender: TObject);
begin
  RemoteCtrlAdmForm.ShowModal;
end;

end.
