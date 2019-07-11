unit UnitCOMFileLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Registry, ExtCtrls, OoMisc, AdPort,
  Menus, AdMdm, Buttons;

type
  TModemSettingsForm = class(TForm)
    ApdComPort: TApdComPort;
    AdditionalApdComPort: TApdComPort;
    GSMApdComPort: TApdComPort;
    GSM2ApdComPort: TApdComPort;
    GSM3ApdComPort: TApdComPort;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel1: TPanel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    RxMemo: TMemo;
    BtnSend: TButton;
    Command: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    AdditRxMemo: TMemo;
    Button1: TButton;
    AdditCommand: TEdit;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GSMMemo: TMemo;
    Panel4: TPanel;
    GSM2Memo: TMemo;
    Panel5: TPanel;
    GSM3Memo: TMemo;
    Panel6: TPanel;
    Button3: TButton;
    GSMCommand: TEdit;
    Label3: TLabel;
    Button2: TButton;
    GSM2Command: TEdit;
    Label4: TLabel;
    Button4: TButton;
    GSM3Command: TEdit;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure GSM3ApdComPortTriggerAvail(CP: TObject; Count: Word);
    procedure GSM2ApdComPortTriggerAvail(CP: TObject; Count: Word);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure AdditionalApdComPortTriggerAvail(CP: TObject; Count: Word);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure GSMApdComPortTriggerAvail(CP: TObject; Count: Word);
    procedure ApdComPortTriggerAvail(CP: TObject; Count: Word);
    procedure FormCreate(Sender: TObject);
    procedure BtnInitClick(Sender: TObject);
    procedure InitModem;
    function SendCommandWithEcho(command: string): Boolean;
    function SendCommandAdditModem(command: string): Boolean;
    function SendCommand(command: string): Boolean;
    procedure SetModemStatusBar(text: string);
    procedure CallNumber(phone: string);
    procedure ApplyCommSettings;
    function GetTextAfter(src: string; before_text: string): string;
    function CutDetectNumber(analiz_string: string; num_count: Integer): string;
    function HasStartDetect(analiz_string: string): Boolean;
    function SendGSMCommand(command: string): Boolean;
    function SendGSM2Command(command: string): Boolean;
    function SendGSM3Command(command: string): Boolean;
    function OutDetectCNDNumber(analiz_string, res: string): Boolean;
    function AnalizePhonePrefix(phone: string): string;
    function AnalizeGSMPhonePrefix(phone: string): string;
    function ModemsOnActivePhoneLine: Boolean;
    function GSMModemsOnActivePhoneLine: Boolean;
    function Init1GSMModem: Boolean;
    function Init2GSMModem: Boolean;
    function Init3GSMModem: Boolean;
    function SufficsEqualLastCharOfLastNumbers(detect_number: string; suffics_len: Integer): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModemSettingsForm     : TModemSettingsForm;
  hCommFile : THandle;
  OutBuffer : array[0..1023] of Char;
  InBuffer  : array[0..1023] of Char;
  OpenCOM: Boolean;
  CommPort: string;
  IsRing: Boolean;
  PhoneDefCount: Integer=0;
  DefPhone: string='';
  HasDefPhone: Boolean=False;
  HasAnswer: Boolean=False;
  LastDetectPhoneNum: string='?';
  prev_scan_str: array[0..30] of string;
  addit_prev_scan_str: array[0..30] of string;
  analyz_combine_quant: Integer=1;
  pr_analyz_start: Boolean=False;
  prev_scan_str_quant: Integer=2;
  scan_str: Widestring='';
  addit_scan_str: Widestring='';
  analyz_str: Widestring='';
  addit_analyz_str: Widestring='';
  analyz_concat_counter: Integer=0;
  addit_analyz_concat_counter: Integer=0;
  classic_ND_comb: string='CALLER NUMBER: ';
  caller_id_ND_comb: string='CALLER NUMBER: ';
  analyz_cancat_start: Boolean=False;
  addit_analyz_cancat_start: Boolean=False;
  //numeric_combination_quant: Integer=1;
  numeric_comb_counter: Integer=0;
  ring_counter: Integer=2;
  addit_ring_counter: Integer=2;
  hand_down_counter: Integer=0;
  addit_hand_down_counter: Integer=0;
  prev_gsm_tnum: string='';
  gsm_receive_max_number: Integer=20;
  gsm_receive_max_number2: Integer=20;
  gsm_receive_max_number3: Integer=20;
  detect_num_length: Integer;
  between_group_command_delay: Integer=100;
  addit_modem_detect: Boolean=False;
  first_modem_detect_number, addit_modem_detect_number: string;
  has_first_modem_detect: Boolean=False;
  has_addit_modem_detect: Boolean=False;
  first_modem_detect_counter: Integer=3;
  addit_modem_detect_counter: Integer=3;
  prev_gsm_char: Char=' ';
  prev_gsm2_char: Char=' ';
  prev_gsm3_char: Char=' ';
  GSMRING_distance_count: Integer=0;
  GSM2RING_distance_count: Integer=0;
  GSM3RING_distance_count: Integer=0;
  gsm2_has_detect: Boolean=False;
  last_detect_tnumber: string='';
  last_detect_tnumbers_array: TStringList;
implementation

{$R *.dfm}

uses ModelDM, MainForm, SoundRecordUnit, ADODMUnit, ReleaseStructUnit,
  HandlesDM, BusinessClasses, USBAccess;

function TModemSettingsForm.ModemsOnActivePhoneLine: Boolean;
var res: Boolean;
begin
  res:=True;

    //if ApdComPort.Open then
    //  begin
    //  end;

    //if AdditApdComPort.Open then
    //  begin
    //  end;

  Result:=res;
end;

function TModemSettingsForm.GSMModemsOnActivePhoneLine: Boolean;
var res: Boolean;
begin
  res:=True;

   if (IniFile.ReadString('modems','use_gsm_modem','NO')='YES') then
   begin
    if GSMApdComPort.Open then
      begin

        if GSMCheckStart and GSMCheckWait then
          begin
            GSMApdComPort.DonePort;
            res:=False;
          end;
        if GSMCheckStart and GSMApdComPort.Open then
         begin
          GSMCheckWait:=True;
          SendGSMCommand('AT');
         end;
      end
    else
     begin
       res:=False;
     end;
    end;

   if (IniFile.ReadString('modems','use_gsm_modem2','NO')='YES') then
   begin
    if GSM2ApdComPort.Open then
      begin
        if GSM2CheckStart and GSM2CheckWait then
          begin
            GSM2ApdComPort.DonePort;
            res:=False;
          end;
        if GSM2CheckStart and GSM2ApdComPort.Open then
         begin
          GSM2CheckWait:=True;
          SendGSM2Command('AT');
         end;
      end
    else
     begin
       res:=False;
     end;
    end;

   if (IniFile.ReadString('modems','use_gsm_modem3','NO')='YES') then
   begin
    if GSM3ApdComPort.Open then
      begin
        if GSM3CheckStart and GSM3CheckWait then
          begin
            GSM3ApdComPort.DonePort;
            res:=False;
          end;
        if GSM3CheckStart and GSM3ApdComPort.Open then
         begin
          GSM3CheckWait:=True;
          SendGSM3Command('AT');
         end;
      end
    else
     begin
       res:=False;
     end;
    end;

  Result:=res;
end;

procedure TModemSettingsForm.CallNumber(phone: string);
begin
  if SendCommand(IniFile.ReadString('BUSINESS_DATA','call_prefix','ATDP')+
    phone) then
    begin

    end
  else
    begin
      ShowMessage('Неудачная посылка команды вызова модему!');
    end;
end;

procedure TModemSettingsForm.SetModemStatusBar(text: string);
begin
  FirstForm.StatusBar.Panels[4].Text:=
    text;
end;

function TModemSettingsForm.SendCommand(command: string): Boolean;
var
  res: Boolean;
begin
  res:=False;
  if ApdComPort.Open then
  begin
    ApdComPort.OutPut := Command+^M;
    if IniFile.ReadString('TNum_detect','show_AT_commands','NO')='YES' then
      RxMemo.Lines.Add('To COM'+IntToStr(ApdComPort.ComNumber)+': '+ Command );
    res:=True;
  end;
  Result:=res;
end;

function TModemSettingsForm.SendGSMCommand(command: string): Boolean;
var
  res: Boolean;
begin
  res:=False;
  if GSMApdComPort.Open then
  begin

      try

          GSMApdComPort.OutPut := Command+^M;
          if IniFile.ReadString('TNum_detect','show_AT_commands','NO')='YES' then
            GSMMemo.Lines.Add('To COM'+IntToStr(GSMApdComPort.ComNumber)+': '+ Command );
          res:=True;

      except

          if (IniFile.ReadString('BUSINESS_DATA','выключать_программу_при_отсутствии_модема','NO')='YES') then
            begin
              ShowMessage('Ошибка посыла команды к модему 1 сотового телефона! Воспользуйтесь инструкцией!');
              FirstForm.Close;
            end
            else
            begin

              FirstForm.StatusBar.Panels[4].Text :=
                'Команда к 1GSM!!!';
                  if (IniFile.ReadString('BUSINESS_DATA','производить_попытки_восстановления_связи_с_модемами','NO')='YES') and
                  PeriodicDevConRecovery then
                    begin
                      GSMApdComPort.DonePort;
                      FirstForm.ShowAttention('Восстановление подключения к 1GSM!');
                      Sleep(100);
                      //ReleaseStructForm.AddCurrUserLog('Виртуальный COM GSM1 недоступен!');
                      while not ModemSettingsForm.Init1GSMModem do
                      begin
                      PortRecovCounter1:=PortRecovCounter1+1;
                        if PortRecovCounter1>5 then
                          begin
                            PortRecovCounter1:=0;
                            Break;
                          end;
                      FirstForm.ShowAttention('Восстановление подключения к 1GSM!');
                      Sleep(200);
                      if not ModemSettingsForm.GSMApdComPort.Open then
                        FirstForm.ShowAttention('Не восстановлено! Повторная попытка...');
                      GSMApdComPort.DonePort;
                      Sleep(200);
                      end;
                      if (IniFile.ReadString('BUSINESS_DATA',
                        'попытки_восстановления_связи_делать_периодически_GSM','NO')='NO') then
                           PeriodicDevConRecovery:=False;

                      if not ModemSettingsForm.GSMApdComPort.Open and
                         (IniFile.ReadString('BUSINESS_DATA',
                         'перезагружать_USB_модемы_при_неудачном_восстановлении_связи','NO')='YES') then
                        begin
                           if (IniFile.ReadString('BUSINESS_DATA',
                             'перезагружать_все_USB_устройства_при_неудачном_восстановлении_связи','NO')='YES') and
                             (IniFile.ReadString('BUSINESS_DATA',
                             'перезагружать_все_USB_устройства_после_модемов','NO')='NO')
                               then
                                 begin
                                   if ChangeDeviceState(DICS_DISABLE, True) then
                                     FirstForm.ShowAttention('Устройство отключено');
                                   if ChangeDeviceState(DICS_ENABLE, True) then
                                     begin

                                       FirstForm.ShowAttention('Устройство включено');
                                     end;
                                 end;


                          if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            'имя_рестартуемого_устройства','modem')) then
                              FirstForm.ShowAttention('Устройство 1 отключено');
                          if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            'имя_рестартуемого_устройства','modem')) then
                            begin
                              if (IniFile.ReadString('BUSINESS_DATA',
                                'автосканирование_устройств_после_реконнекта','NO')=
                                'YES') then
                                PeriodicDevConRecovery:=True;
                              FirstForm.ShowAttention('Устройство 1 включено');
                              //ReleaseStructForm.AddCurrUserLog('GSM1 удачно рестартован!');
                            end  
                          else
                           begin
                            //ReleaseStructForm.AddCurrUserLog('GSM1 рестартован неудачно!');
                            ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            'имя_рестартуемого_устройства','modem'));
                           end; 

                        end;
                        //else
                        //ReleaseStructForm.AddCurrUserLog('Виртуальный COM удачно рестартован!');
                        
                      PortRecovCounter1:=0;
                    end;  
            end;

      end;

  end;
  Result:=res;
end;

function TModemSettingsForm.SendGSM2Command(command: string): Boolean;
var
  res: Boolean;
begin
  res:=False;
  if GSM2ApdComPort.Open then
  begin

    try
    GSM2ApdComPort.OutPut := Command+^M;
    if IniFile.ReadString('TNum_detect','show_AT_commands','NO')='YES' then
      GSM2Memo.Lines.Add('To COM'+IntToStr(GSM2ApdComPort.ComNumber)+': '+ Command );
    res:=True;
    except
            if (IniFile.ReadString('BUSINESS_DATA','выключать_программу_при_отсутствии_модема','NO')='YES') then
            begin
              ShowMessage('Ошибка посыла команды к модему 2 сотового телефона! Воспользуйтесь инструкцией!');
              FirstForm.Close;
            end
            else
            begin
              FirstForm.StatusBar.Panels[4].Text :=
                'Команда к 2GSM!!!';
                  if (IniFile.ReadString('BUSINESS_DATA','производить_попытки_восстановления_связи_с_модемами','NO')='YES') and
                  PeriodicDevConRecovery2 then
                    begin
                      GSM2ApdComPort.DonePort;
                      FirstForm.ShowAttention('Восстановление подключения к 2GSM!');
                      Sleep(100);
                      //ReleaseStructForm.AddCurrUserLog('Виртуальный COM GSM2 недоступен!');
                      while not ModemSettingsForm.Init2GSMModem do
                      begin
                      PortRecovCounter2:=PortRecovCounter2+1;
                        if PortRecovCounter2>5 then
                          begin
                            PortRecovCounter2:=0;
                            Break;
                          end;
                      FirstForm.ShowAttention('Восстановление подключения к 2GSM!');
                      Sleep(200);
                      if not ModemSettingsForm.GSM2ApdComPort.Open then
                        FirstForm.ShowAttention('Не восстановлено! Повторная попытка...');
                      GSM2ApdComPort.DonePort;
                      Sleep(200);
                      end;
                      if (IniFile.ReadString('BUSINESS_DATA',
                        'попытки_восстановления_связи_делать_периодически_2GSM','NO')='NO') then
                           PeriodicDevConRecovery2:=False;

                      if not ModemSettingsForm.GSM2ApdComPort.Open and
                         (IniFile.ReadString('BUSINESS_DATA',
                         'перезагружать_USB_модемы_при_неудачном_восстановлении_связи','NO')='YES') then
                        begin
                          if (IniFile.ReadString('BUSINESS_DATA',
                             'перезагружать_все_USB_устройства_при_неудачном_восстановлении_связи','NO')='YES') and
                             (IniFile.ReadString('BUSINESS_DATA',
                             'перезагружать_все_USB_устройства_после_модемов','NO')='NO')
                               then
                                 begin
                                   if ChangeDeviceState(DICS_DISABLE, True) then
                                     FirstForm.ShowAttention('Устройство отключено');
                                   if ChangeDeviceState(DICS_ENABLE, True) then
                                     begin
    
                                       FirstForm.ShowAttention('Устройство включено');
                                     end;
                                 end;
                          if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            'имя_рестартуемого_устройства2','modem')) then
                              FirstForm.ShowAttention('Устройство 2 отключено');
                          if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            'имя_рестартуемого_устройства2','modem')) then
                            begin
                              if (IniFile.ReadString('BUSINESS_DATA',
                                'автосканирование_устройств_после_реконнекта','NO')=
                                'YES') then
                                PeriodicDevConRecovery2:=True;
                              FirstForm.ShowAttention('Устройство 2 включено');
                              //ReleaseStructForm.AddCurrUserLog('GSM2 удачно рестартован!');
                            end  
                          else
                           begin
                            //ReleaseStructForm.AddCurrUserLog('GSM2 рестартован неудачно!');
                            ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            'имя_рестартуемого_устройства2','modem'));
                           end;     

                        end;
                        //else
                        //ReleaseStructForm.AddCurrUserLog('Виртуальный COM удачно рестартован!');
                        
                      PortRecovCounter2:=0;
                    end;  
            end;
          end;

  end;
  Result:=res;
end;

function TModemSettingsForm.SendGSM3Command(command: string): Boolean;
var
  res: Boolean;
begin
  res:=False;
  if GSM3ApdComPort.Open then
  begin

    try

    GSM3ApdComPort.OutPut := Command+^M;
    if IniFile.ReadString('TNum_detect','show_AT_commands','NO')='YES' then
      GSM3Memo.Lines.Add('To COM'+IntToStr(GSM3ApdComPort.ComNumber)+': '+ Command );
    res:=True;

    except
            if (IniFile.ReadString('BUSINESS_DATA','выключать_программу_при_отсутствии_модема','NO')='YES') then
            begin
              ShowMessage('Ошибка посыла команды к модему сотового телефона! Воспользуйтесь инструкцией!');
              FirstForm.Close;
            end
            else
            begin
              FirstForm.StatusBar.Panels[4].Text :=
                'Команда к 3GSM!!!';
                  if (IniFile.ReadString('BUSINESS_DATA','производить_попытки_восстановления_связи_с_модемами','NO')='YES') and
                  PeriodicDevConRecovery3 then
                    begin
                      GSM3ApdComPort.DonePort;
                      FirstForm.ShowAttention('Восстановление подключения к 3GSM!');
                      Sleep(100);
                      //ReleaseStructForm.AddCurrUserLog('Виртуальный COM GSM3 недоступен!');
                      while not ModemSettingsForm.Init3GSMModem do
                      begin
                      PortRecovCounter3:=PortRecovCounter3+1;
                        if PortRecovCounter3>5 then
                          begin
                            PortRecovCounter3:=0;
                            Break;
                          end;
                      FirstForm.ShowAttention('Восстановление подключения к 3GSM!');
                      Sleep(200);
                      if not ModemSettingsForm.GSM3ApdComPort.Open then
                        FirstForm.ShowAttention('Не восстановлено! Повторная попытка...');
                      GSM3ApdComPort.DonePort;
                      Sleep(200);
                      end;
                      if (IniFile.ReadString('BUSINESS_DATA',
                        'попытки_восстановления_связи_делать_периодически_3GSM','NO')='NO') then
                           PeriodicDevConRecovery3:=False;

                       if not ModemSettingsForm.GSM3ApdComPort.Open and
                         (IniFile.ReadString('BUSINESS_DATA',
                         'перезагружать_USB_модемы_при_неудачном_восстановлении_связи','NO')='YES') then
                        begin
                           if (IniFile.ReadString('BUSINESS_DATA',
                             'перезагружать_все_USB_устройства_при_неудачном_восстановлении_связи','NO')='YES') and
                             (IniFile.ReadString('BUSINESS_DATA',
                             'перезагружать_все_USB_устройства_после_модемов','NO')='NO')
                               then
                                 begin
                                   if ChangeDeviceState(DICS_DISABLE, True) then
                                     FirstForm.ShowAttention('Устройство отключено');
                                   if ChangeDeviceState(DICS_ENABLE, True) then
                                     begin
                                       
                                       FirstForm.ShowAttention('Устройство включено');
                                     end;
                                 end;


                          if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            'имя_рестартуемого_устройства3','modem')) then
                              FirstForm.ShowAttention('Устройство 3 отключено');
                          if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            'имя_рестартуемого_устройства3','modem')) then
                            begin
                              if (IniFile.ReadString('BUSINESS_DATA',
                                'автосканирование_устройств_после_реконнекта','NO')=
                                'YES') then
                                PeriodicDevConRecovery3:=True;
                              FirstForm.ShowAttention('Устройство 3 включено');
                              //ReleaseStructForm.AddCurrUserLog('GSM3 удачно рестартован!');
                            end  
                          else
                           begin
                            //ReleaseStructForm.AddCurrUserLog('GSM3 рестартован неудачно!');
                            ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            'имя_рестартуемого_устройства3','modem'));
                           end;     

                          if (IniFile.ReadString('BUSINESS_DATA',
                            'перезагружать_все_USB_устройства_при_неудачном_восстановлении_связи','NO')='YES') then
                              RestartUSBHub:=True;
                        end;
                        //else
                        //ReleaseStructForm.AddCurrUserLog('Виртуальный COM удачно рестартован!');
                        
                      PortRecovCounter3:=0;
                    end;
            end;
    end;

  end;
  Result:=res;
end;

function TModemSettingsForm.SendCommandWithEcho(command: string): Boolean;
var res: Boolean;
begin
  res:=False;
  if ApdComPort.Open then
  begin
    ApdComPort.OutPut := Command+^M;
    if IniFile.ReadString('TNum_detect','show_AT_commands','NO')='YES' then
      RxMemo.Lines.Add('To COM'+IntToStr(ApdComPort.ComNumber)+': '+ Command );
    res:=True;
  end;
  Result:=res;
end;

function TModemSettingsForm.SendCommandAdditModem(command: string): Boolean;
var res: Boolean;
begin
  res:=False;
  if AdditionalApdComPort.Open then
  begin
    AdditionalApdComPort.OutPut := Command+^M;
    if IniFile.ReadString('TNum_detect','show_AT_commands','NO')='YES' then
      AdditRxMemo.Lines.Add('To COM'+IntToStr(AdditionalApdComPort.ComNumber)+': '+ Command );
    res:=True;
  end;
  Result:=res;
end;

procedure TModemSettingsForm.ApplyCommSettings;
begin

{if IniFile.ReadString('com_settings','ComPort','')<>'' then
 begin
 try
  StrToInt(IniFile.ReadString('com_settings','ComPort',''));
  CommPortDriver.ComPort := TComPortNumber(StrToInt(IniFile.ReadString('com_settings','ComPort','')));
  except
    ShowMessage('Неверное значение параметра ComPort (допустимо  0-3)!');
  end;
 end;
 }
if IniFile.ReadString('com_settings','скорость_основного_модема','19200')<>'' then
 begin
 try
  StrToInt(IniFile.ReadString('com_settings','скорость_основного_модема','19200'));
  ApdComPort.Baud := StrToInt(IniFile.ReadString('com_settings','скорость_основного_модема','19200'));
  except
    ShowMessage('Неверное значение параметра ''скорость_основного_модема''!');
  end;
 end;

if IniFile.ReadString('com_settings','скорость_дополнительного_модема','19200')<>'' then
 begin
 try
  StrToInt(IniFile.ReadString('com_settings','скорость_дополнительного_модема','19200'));
  AdditionalApdComPort.Baud := StrToInt(IniFile.ReadString('com_settings','скорость_дополнительного_модема','19200'));
  except
    ShowMessage('Неверное значение параметра ''скорость_дополнительного_модема''!');
  end;
 end;

{
if IniFile.ReadString('com_settings','ComPortDataBits','')<>'' then
 begin
 try
  StrToInt(IniFile.ReadString('com_settings','ComPortDataBits',''));
  CommPortDriver.ComPortDataBits := TComPortDataBits(StrToInt(IniFile.ReadString('com_settings','ComPortDataBits','')));
  except
    ShowMessage('Неверное значение параметра ComPortDataBits (допустимо  0-3)!');
  end;
 end;


if IniFile.ReadString('com_settings','ComPortParity','')<>'' then
 begin
 try
  StrToInt(IniFile.ReadString('com_settings','ComPortParity',''));
  CommPortDriver.ComPortParity := TComPortParity(StrToInt(IniFile.ReadString('com_settings','ComPortParity','')));
  except
    ShowMessage('Неверное значение параметра ComPortParity (допустимо  0-4)!');
  end;
 end;

 if IniFile.ReadString('com_settings','Insize','')<>'' then
 begin
 try
  StrToInt(IniFile.ReadString('com_settings','Insize',''));
  CommPortDriver.ComPortInBufSize := StrToInt(IniFile.ReadString('com_settings','Insize',''));
  except
    ShowMessage('Неверное значение параметра Insize!');
  end;
 end;

 if IniFile.ReadString('com_settings','Outsize','')<>'' then
 begin
 try
  StrToInt(IniFile.ReadString('com_settings','Outsize',''));
  CommPortDriver.ComPortOutBufSize := StrToInt(IniFile.ReadString('com_settings','Outsize',''));
  except
    ShowMessage('Неверное значение параметра Outsize!');
  end;
 end;

 if IniFile.ReadString('com_settings','Input_timeout','')<>'' then
 begin
 try
  StrToInt(IniFile.ReadString('com_settings','Input_timeout',''));
  CommPortDriver.InputTimeout := StrToInt(IniFile.ReadString('com_settings','Input_timeout',''));
  except
    ShowMessage('Неверное значение параметра Input_timeout!');
  end;
 end;

 if IniFile.ReadString('com_settings','Output_timeout','')<>'' then
 begin
 try
  StrToInt(IniFile.ReadString('com_settings','Output_timeout',''));
  CommPortDriver.OutputTimeout := StrToInt(IniFile.ReadString('com_settings','Output_timeout',''));
  except
    ShowMessage('Неверное значение параметра Output_timeout!');
  end;
 end;

  
if IniFile.ReadString('BUSINESS_DATA','HandshakingRG','')<>'' then
 begin
 try
 StrToInt(IniFile.ReadString('BUSINESS_DATA','HandshakingRG',''));
  case StrToInt(IniFile.ReadString('BUSINESS_DATA','HandshakingRG','')) of
    0: // none
      begin
        CommPortDriver.ComPortHwHandshaking := hhNoneRTSOn;
        CommPortDriver.ComPortSwHandshaking := shNone;
      end;
    1: // RTS/CTS
      begin
        CommPortDriver.ComPortHwHandshaking := hhRTSCTS;
        CommPortDriver.ComPortSwHandshaking := shNone;
      end;
    2: // XON/XOFF
      begin
        CommPortDriver.ComPortHwHandshaking := hhNoneRTSOn;
        CommPortDriver.ComPortSwHandshaking := shXONXOFF;
      end;
    3: // RTS/CTS + XON/XOFF
      begin
        CommPortDriver.ComPortHwHandshaking := hhRTSCTS;
        CommPortDriver.ComPortSwHandshaking := shXONXOFF;
      end;
  end;
  except
    ShowMessage('Неверное значение параметра HandshakingRG (допустимо  0-3)!');
  end;
 end; }
end;

procedure TModemSettingsForm.InitModem;
begin

ApplyCommSettings;

if IniFile.ReadString('modems','init_base_modem','NO')='YES' then
    begin
  try
    StrToInt(IniFile.ReadString('com_settings','ComPort','1'));
    ApdComPort.ComNumber:=
      StrToInt(IniFile.ReadString('com_settings','ComPort','1'));
  except
    ApdComPort.ComNumber:=1;
  end;

  try
    ApdComPort.InitPort;

  
  if ApdComPort.Open then
  begin

  if IniFile.ReadString('BUSINESS_DATA','modem_init_comand','')<>'' then
     SendCommandWithEcho(
       IniFile.ReadString('BUSINESS_DATA','modem_init_comand',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Инициализация...';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);
  if IniFile.ReadString('BUSINESS_DATA','voice_mode_init','')<>'' then
     SendCommandWithEcho(
       IniFile.ReadString('BUSINESS_DATA','voice_mode_init',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Установка голосового режима работы модема...';
  FirstForm.Repaint;    
  Sleep(between_group_command_delay);
  if IniFile.ReadString('BUSINESS_DATA','modem_volume_level_command','')<>'' then
    begin
     SendCommandWithEcho(
       IniFile.ReadString('BUSINESS_DATA','modem_volume_level_command',''));
    end;
  FirstForm.StatusBar.Panels[4].Text :=
      'Установка уровня звука...';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);
  if IniFile.ReadString('BUSINESS_DATA','phone_auto_init_comand','')<>'' then
     SendCommandWithEcho(
       IniFile.ReadString('BUSINESS_DATA','phone_auto_init_comand',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Включение АОНа...';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);
  if IniFile.ReadString('BUSINESS_DATA','AND_settings_command','')<>'' then
     SendCommandWithEcho(
       IniFile.ReadString('BUSINESS_DATA','AND_settings_command',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Настройка АОНа...';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);

  if IniFile.ReadString('BUSINESS_DATA','init1_command','')<>'' then
     SendCommandWithEcho(
       IniFile.ReadString('BUSINESS_DATA','init1_command',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Настройка модема...1';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);

  if IniFile.ReadString('BUSINESS_DATA','init2_command','')<>'' then
     SendCommandWithEcho(
       IniFile.ReadString('BUSINESS_DATA','init2_command',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Настройка модема...2';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);

  if IniFile.ReadString('BUSINESS_DATA','init3_command','')<>'' then
     SendCommandWithEcho(
       IniFile.ReadString('BUSINESS_DATA','init3_command',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Настройка модема...3';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);

    //BtnInit.Enabled := false;
    FirstForm.StatusBar.Panels[4].Text :=
      'Модем инициализирован';

  end
  else // Error !
    begin
      FirstForm.StatusBar.Panels[4].Text := 'Ошибка подключения к модему -' +
                              ' (GetLastError = ' + IntToStr(GetLastError) + ')';
      MessageBeep( 0 );
    end;

  except
    ShowMessage('Неудачная инициализация порта COM'+
      IntToStr(ApdComPort.ComNumber));
    FirstForm.Close;
  end;
end;


//Addit modem initialization

if IniFile.ReadString('modems','use_addit_modem','NO')='YES' then
    begin
  try
    StrToInt(IniFile.ReadString('modems','addit_modem_com_port','2'));
    AdditionalApdComPort.ComNumber:=
      StrToInt(IniFile.ReadString('modems','addit_modem_com_port','2'));
  except
    AdditionalApdComPort.ComNumber:=2;
  end;

  try
    AdditionalApdComPort.InitPort;

  
  if AdditionalApdComPort.Open then
  begin

  if IniFile.ReadString('BUSINESS_DATA','modem_init_comand','')<>'' then
     SendCommandAdditModem(
       IniFile.ReadString('BUSINESS_DATA','modem_init_comand',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Инициализация доп. модема...';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);
  if IniFile.ReadString('BUSINESS_DATA','voice_mode_init','')<>'' then
     SendCommandAdditModem(
       IniFile.ReadString('BUSINESS_DATA','voice_mode_init',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Установка голосового режима работы доп. модема...';
  FirstForm.Repaint;    
  Sleep(between_group_command_delay);
  if IniFile.ReadString('BUSINESS_DATA','modem_volume_level_command','')<>'' then
    begin
     SendCommandAdditModem(
       IniFile.ReadString('BUSINESS_DATA','modem_volume_level_command',''));
    end;
  FirstForm.StatusBar.Panels[4].Text :=
      'Установка уровня звука доп. модема...';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);
  if IniFile.ReadString('BUSINESS_DATA','phone_auto_init_comand','')<>'' then
     SendCommandAdditModem(
       IniFile.ReadString('BUSINESS_DATA','phone_auto_init_comand',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Включение АОНа доп. модема...';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);
  if IniFile.ReadString('BUSINESS_DATA','AND_settings_command','')<>'' then
     SendCommandAdditModem(
       IniFile.ReadString('BUSINESS_DATA','AND_settings_command',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Настройка АОНа доп. модема...';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);

  if IniFile.ReadString('BUSINESS_DATA','init1_command','')<>'' then
     SendCommandAdditModem(
       IniFile.ReadString('BUSINESS_DATA','init1_command',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Настройка доп. модема...1';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);

  if IniFile.ReadString('BUSINESS_DATA','init2_command','')<>'' then
     SendCommandAdditModem(
       IniFile.ReadString('BUSINESS_DATA','init2_command',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Настройка доп. модема...2';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);

  if IniFile.ReadString('BUSINESS_DATA','init3_command','')<>'' then
     SendCommandAdditModem(
       IniFile.ReadString('BUSINESS_DATA','init3_command',''));
  FirstForm.StatusBar.Panels[4].Text :=
      'Настройка доп. модема...3';
  FirstForm.Repaint;
  Sleep(between_group_command_delay);

    //BtnInit.Enabled := false;
    FirstForm.StatusBar.Panels[4].Text :=
      'Дополнительный модем инициализирован';

  end
  else // Error !
    begin
      FirstForm.StatusBar.Panels[4].Text := 'Ошибка подключения к модему -' +
                              ' (GetLastError = ' + IntToStr(GetLastError) + ')';
      MessageBeep( 0 );
    end;

  except
    ShowMessage('Неудачная инициализация порта COM'+
      IntToStr(AdditionalApdComPort.ComNumber));
    FirstForm.Close;
  end;
end;

//End addit modedm initialization

Init1GSMModem;
Init2GSMModem;
Init3GSMModem;

end;

function TModemSettingsForm.Init1GSMModem: Boolean;
var res: Boolean;
begin
res:=True;
if IniFile.ReadString('modems','use_gsm_modem','NO')='YES' then
    begin
      try
        StrToInt(IniFile.ReadString('modems','gsm_modem_port','4'));
        GSMApdComPort.ComNumber:=
          StrToInt(IniFile.ReadString('modems','gsm_modem_port','4'));
      except
        GSMApdComPort.ComNumber:=4;
      end;

      try
        GSMApdComPort.InitPort;

        if GSMApdComPort.Open then
        begin
          FirstForm.Repaint;
          Sleep(between_group_command_delay);
          if IniFile.ReadString('modems','gsm_modem_pb_select','')<>'' then
            SendGSMCommand(
              IniFile.ReadString('modems','gsm_modem_pb_select',''));
          FirstForm.StatusBar.Panels[4].Text :=
            'Инициализация GSM-модема...';
          if IniFile.ReadString('modems','CLIP_AT_INSTR1','')<>'' then
            SendGSMCommand(
              IniFile.ReadString('modems','CLIP_AT_INSTR1',''));
          FirstForm.Repaint;
          Sleep(between_group_command_delay);
          FirstForm.StatusBar.Panels[4].Text :=
            'Модем GSM инициализирован';
        end
        else
         begin

          FirstForm.ShowAttention('Неудачная инициализация порта COM'+
          IntToStr(GSMApdComPort.ComNumber));
          if (IniFile.ReadString('BUSINESS_DATA','выключать_программу_при_отсутствии_модема','NO')='YES') then
            FirstForm.Close;
          res:=False;
         end;
      except
        FirstForm.ShowAttention('Неудачная инициализация порта COM'+
          IntToStr(GSMApdComPort.ComNumber));
        if (IniFile.ReadString('BUSINESS_DATA','выключать_программу_при_отсутствии_модема','NO')='YES') then
          FirstForm.Close;
        res:=False;
      end;
    end;
    Result:=res;
end;

function TModemSettingsForm.Init2GSMModem: Boolean;
var res: Boolean;
begin
res:=True;
if IniFile.ReadString('modems','use_gsm_modem2','NO')='YES' then
    begin
      try
        StrToInt(IniFile.ReadString('modems','gsm_modem_port2','4'));
        GSM2ApdComPort.ComNumber:=
          StrToInt(IniFile.ReadString('modems','gsm_modem_port2','4'));
      except
        GSM2ApdComPort.ComNumber:=4;
      end;

      try
        GSM2ApdComPort.InitPort;

        if GSM2ApdComPort.Open then
        begin
          FirstForm.Repaint;
          Sleep(between_group_command_delay);
          if IniFile.ReadString('modems','gsm_modem_pb_select','')<>'' then
            SendGSM2Command(
              IniFile.ReadString('modems','gsm_modem_pb_select',''));
          FirstForm.StatusBar.Panels[4].Text :=
            'Инициализация GSM2-модема...';
          if IniFile.ReadString('modems','CLIP_AT_INSTR2','')<>'' then
            SendGSM2Command(
              IniFile.ReadString('modems','CLIP_AT_INSTR2',''));
          FirstForm.Repaint;
          Sleep(between_group_command_delay);
          FirstForm.StatusBar.Panels[4].Text :=
            'Модем GSM2 инициализирован';
        end
        else
         begin
          FirstForm.ShowAttention('Неудачная инициализация порта COM'+
          IntToStr(GSM2ApdComPort.ComNumber));
          if (IniFile.ReadString('BUSINESS_DATA','выключать_программу_при_отсутствии_модема','NO')='YES') then
            FirstForm.Close;
          res:=False;
         end;
      except
        FirstForm.ShowAttention('Неудачная инициализация порта COM'+
          IntToStr(GSM2ApdComPort.ComNumber));
        if (IniFile.ReadString('BUSINESS_DATA','выключать_программу_при_отсутствии_модема','NO')='YES') then
          FirstForm.Close;
        res:=False;
      end;
    end;
    Result:=res;
end;

function TModemSettingsForm.Init3GSMModem: Boolean;
var res: Boolean;
begin
res:=True;
if IniFile.ReadString('modems','use_gsm_modem3','NO')='YES' then
    begin
      try
        StrToInt(IniFile.ReadString('modems','gsm_modem_port3','5'));
        GSM3ApdComPort.ComNumber:=
          StrToInt(IniFile.ReadString('modems','gsm_modem_port3','5'));
      except
        GSM3ApdComPort.ComNumber:=5;
      end;

      try
        GSM3ApdComPort.InitPort;

        if GSM3ApdComPort.Open then
        begin
          FirstForm.Repaint;
          Sleep(between_group_command_delay);
          if IniFile.ReadString('modems','gsm_modem_pb_select','')<>'' then
            SendGSM3Command(
              IniFile.ReadString('modems','gsm_modem_pb_select',''));
          FirstForm.StatusBar.Panels[4].Text :=
            'Инициализация GSM3-модема...';
          if IniFile.ReadString('modems','CLIP_AT_INSTR3','')<>'' then
            SendGSM3Command(
              IniFile.ReadString('modems','CLIP_AT_INSTR3',''));
          FirstForm.Repaint;
          Sleep(between_group_command_delay);
          FirstForm.StatusBar.Panels[4].Text :=
            'Модем GSM3 инициализирован';
        end
        else
         begin
          FirstForm.ShowAttention('Неудачная инициализация порта COM'+
          IntToStr(GSM3ApdComPort.ComNumber));
          if (IniFile.ReadString('BUSINESS_DATA','выключать_программу_при_отсутствии_модема','NO')='YES') then
            FirstForm.Close;
          res:=False;
         end;
      except
        FirstForm.ShowAttention('Неудачная инициализация порта COM'+
          IntToStr(GSM3ApdComPort.ComNumber));
        if (IniFile.ReadString('BUSINESS_DATA','выключать_программу_при_отсутствии_модема','NO')='YES') then
          FirstForm.Close;
        res:=False;
      end;
    end;
    Result:=res;
end;


procedure TModemSettingsForm.BtnInitClick(Sender: TObject);
begin
  RxMemo.Clear;
  InitModem;
end;

function TModemSettingsForm.GetTextAfter(src: string; before_text: string): string;
begin
  Result:= (StringReplace(src,
   before_text,
     '',[rfReplaceAll]));
end;

procedure TModemSettingsForm.FormCreate(Sender: TObject);
begin
IsRing:=False;
RxMemo.Clear;

last_detect_tnumbers_array:=TStringList.Create();

classic_ND_comb:=
  IniFile.ReadString('TNum_detect','classic_detect_combine',
  'CALLER''S NUMBER: ');
caller_id_ND_comb:=
  IniFile.ReadString('TNum_detect','caller_id_detect_comb',
  'CALLER''S NUMBER: ');
if (IniFile.ReadString('TNum_detect','добавить_пробелы_к_комбинациям',
  'NO')='YES') then
    begin
      classic_ND_comb:=
        classic_ND_comb+' ';
      caller_id_ND_comb:=
        caller_id_ND_comb+' ';
    end;     

try
  StrToInt(IniFile.ReadString('TNum_detect','длина_определяемого_номера_обычн_модем','11'));
  detect_num_length:=
    StrToInt(IniFile.ReadString('TNum_detect','длина_определяемого_номера_обычн_модем','11'));
except
  detect_num_length:=11;
end;  

try
  StrToInt(IniFile.ReadString('TNum_detect','prev_scan_str_quant','4'));
  prev_scan_str_quant:=
    StrToInt(IniFile.ReadString('TNum_detect','prev_scan_str_quant','4'));
except
  prev_scan_str_quant:=2;
end;

try
  StrToInt(IniFile.ReadString('TNum_detect','analyz_comb_str_quant','2'));
  analyz_combine_quant:=
    StrToInt(IniFile.ReadString('TNum_detect','analyz_comb_str_quant','2'));
except
  analyz_combine_quant:=1;
end;

try
  StrToInt(IniFile.ReadString('TNum_detect','auto_handup_ring_count','2'));
  ring_counter:=
    StrToInt(IniFile.ReadString('TNum_detect','auto_handup_ring_count','2'));
except
  ring_counter:=2;
end;

try
  StrToInt(IniFile.ReadString('modems','gsm_receive_max_number','20'));
  gsm_receive_max_number:=
    StrToInt(IniFile.ReadString('modems','gsm_receive_max_number','20'));
except
  gsm_receive_max_number:=20;
end;

try
  StrToInt(IniFile.ReadString('modems','gsm_receive_max_number2','20'));
  gsm_receive_max_number2:=
    StrToInt(IniFile.ReadString('modems','gsm_receive_max_number2','20'));
except
  gsm_receive_max_number2:=20;
end;

try
  StrToInt(IniFile.ReadString('modems','gsm_receive_max_number3','20'));
  gsm_receive_max_number3:=
    StrToInt(IniFile.ReadString('modems','gsm_receive_max_number3','20'));
except
  gsm_receive_max_number3:=20;
end;

if IniFile.ReadString('BUSINESS_DATA','auto_modem_init','NO')='YES' then
 begin
  InitModem;
 end;

end;

procedure TModemSettingsForm.ApdComPortTriggerAvail(CP: TObject; Count: Word);
  {Event OnTriggerAvail - Example how OnTriggerAvail works}
var
  I : Word;
  C : Char;
  S, cut_result : String;
  ind: Integer;
begin
if (IniFile.ReadString('BUSINESS_DATA','scan_phone_line','NO')='YES') then
 begin
  S := '';
  for I := 1 to Count do begin
    C := ApdComPort.GetChar;
    case C of
      #0..#31 : {Don't display} ;
      else S := S + C;
    end;
  end;

  if IniFile.ReadString('BUSINESS_DATA','высвечивать_автоопределенный_номер_после_поднятия_трубки','NO')='YES' then
    first_modem_detect_counter:=
      StrToInt(IniFile.ReadString('BUSINESS_DATA','ожидание_для_определения_после_звонка','3'));


  if S='RING' then
   begin
   end;

  RxMemo.Lines.Add('COM'+IntToStr(ApdComPort.ComNumber)+': '+ S );

  ind:=29;
  while True do
   begin
      prev_scan_str[ind+1]:=
        prev_scan_str[ind];
    if ind<=0 then
      Break
    else
      ind:=
        ind-1;
   end;

  prev_scan_str[0]:=S;

  scan_str:='';

  ind:=prev_scan_str_quant-1;
  while True do
   begin
    scan_str:=scan_str+
      prev_scan_str[ind];
    if ind<=0 then
      Break
    else
      ind:=
        ind-1;
   end;
  if IniFile.ReadString('TNum_detect','show_analyz_buffers','NO')='YES' then
      RxMemo.Lines.Add('Receive progr buff=|'+scan_str+'|' );

  if HasStartDetect(scan_str) then
   if (IniFile.ReadString('BUSINESS_DATA','paste_auto_def_phone','NO')='YES') then
        begin
          DispAdding:=True;
          if IniFile.ReadString('TNum_detect','show_analyz_buffers','NO')='YES' then
            RxMemo.Lines.Add('Cut number from='+
              scan_str);
          addit_modem_detect:=False;    
          cut_result:=
             CutDetectNumber(scan_str,0);
          
          for i:=0 to 30 do
            prev_scan_str[i]:='';
          prev_scan_str[0]:=
            cut_result;
          
          DispAdding:=False;
        end;

 end;
end;

function TModemSettingsForm.SufficsEqualLastCharOfLastNumbers(detect_number: string; suffics_len: Integer): Boolean;
var res: Boolean;
begin
  res:=False;
  //ShowMessage('sss');
  if (IniFile.ReadString('BUSINESS_DATA','количество_последних_запоминаемых_номеров','1')='1')
    and (last_detect_tnumber<>'')  then
    begin
      //ShowMessage(last_detect_tnumber);
      //ShowMessage(Copy(detect_number,(Length(detect_number)+1-suffics_len),suffics_len));
      //ShowMessage(Copy(last_detect_tnumber,(Length(last_detect_tnumber)+1-suffics_len),suffics_len));
      if (Copy(detect_number,(Length(detect_number)-suffics_len+1),suffics_len)
         =Copy(last_detect_tnumber,(Length(last_detect_tnumber)-suffics_len+1),suffics_len)) then
        begin
          res:=True;
        end;
    end;
  result:=res;
end;

function TModemSettingsForm.AnalizePhonePrefix(phone: string): string;
var res: string;
    prefix, dest: array[0..255] of Char;
    i, rule_num: Integer;
    has_prefics: Boolean;
begin
  res:=phone;
  has_prefics:=False;

  for rule_num:=1 to IniFile.ReadInteger('BUSINESS_DATA','количество_правил_для_обрезки',0) do
  begin

  if IniFile.ReadString
          ('BUSINESS_DATA','префикс_кода'+IntToStr(rule_num),'')=
          StrPLCopy(prefix,res,Length(IniFile.ReadString
          ('BUSINESS_DATA','префикс_кода'+IntToStr(rule_num),''))) then

            has_prefics:=True;

  if IniFile.ReadString('BUSINESS_DATA','убирать_префикс'+IntToStr(rule_num),'NO')='YES' then
    if IniFile.ReadString('BUSINESS_DATA','префикс_кода'+IntToStr(rule_num),'')<>'' then
      begin
        if IniFile.ReadString
          ('BUSINESS_DATA','префикс_кода'+IntToStr(rule_num),'')=
          StrPLCopy(prefix,res,Length(IniFile.ReadString
          ('BUSINESS_DATA','префикс_кода'+IntToStr(rule_num),''))) then
          begin

            for i:=0 to Length(IniFile.ReadString('BUSINESS_DATA','префикс_кода'+IntToStr(rule_num),''))-1 do
              res:=
                StrNextChar(StrPCopy(dest,res));

            if (IniFile.ReadString
            ('BUSINESS_DATA','является_прерывающим_по_префиксу'+IntToStr(rule_num),'NO')='YES') then
              Break;
          end;
      end;
   if ( ((IniFile.ReadString('BUSINESS_DATA','удалять_суффикс_при_наличии_префикса'+IntToStr(rule_num),'NO')='YES') and has_prefics)
      or (IniFile.ReadString('BUSINESS_DATA','удалять_суффикс_при_наличии_префикса'+IntToStr(rule_num),'NO')<>'YES'))
     then
       begin
         if (IniFile.ReadString('BUSINESS_DATA','удалять_суффикс'+IntToStr(rule_num),'NO')='YES') then
           begin
             if (IniFile.ReadString('BUSINESS_DATA','считать_суффикс_по_длине'+IntToStr(rule_num),'NO')='YES') then
               begin
                 if (  ((IniFile.ReadString('BUSINESS_DATA','суффикс_совпадает_с_концом_предыдущего_номера'+IntToStr(rule_num),'NO')='YES')
                    and SufficsEqualLastCharOfLastNumbers(res,
                    IniFile.ReadInteger('BUSINESS_DATA','длина_суффикса'+IntToStr(rule_num),0)))
                    or (IniFile.ReadString('BUSINESS_DATA','суффикс_совпадает_с_концом_предыдущего_номера'+IntToStr(rule_num),'NO')<>'YES') ) then
                     begin
                       Delete( res,(Length(res)+1-IniFile.ReadInteger('BUSINESS_DATA','длина_суффикса'+IntToStr(rule_num),0)),
                         IniFile.ReadInteger('BUSINESS_DATA','длина_суффикса'+IntToStr(rule_num),0) );
                       if (IniFile.ReadString
                        ('BUSINESS_DATA','является_прерывающим_по_суффиксу'+IntToStr(rule_num),'NO')='YES') then
                          Break;
                     end;
               end
             else
               begin
                 if (   IniFile.ReadString('BUSINESS_DATA','суффикс'+IntToStr(rule_num),'')
                    =Copy(res,(Length(res)+1-Length(IniFile.ReadString('BUSINESS_DATA','суффикс'+IntToStr(rule_num),''))),
                    Length(IniFile.ReadString('BUSINESS_DATA','суффикс'+IntToStr(rule_num),'')) )   )
                   then
                     begin
                       Delete(res,(Length(res)-Length(IniFile.ReadString('BUSINESS_DATA','суффикс'+IntToStr(rule_num),''))),
                         Length(IniFile.ReadString('BUSINESS_DATA','суффикс'+IntToStr(rule_num),'')));
                       if (IniFile.ReadString
                        ('BUSINESS_DATA','является_прерывающим_по_суффиксу'+IntToStr(rule_num),'NO')='YES') then
                          Break;
                     end;
               end;
           end;
       end;
   has_prefics:=False;
   
   end;
   last_detect_tnumber:=phone;
   { 

   if IniFile.ReadString('BUSINESS_DATA','убирать_префикс1','NO')='YES' then
    if IniFile.ReadString('BUSINESS_DATA','префикс_кода1','')<>'' then
      begin
        if IniFile.ReadString
          ('BUSINESS_DATA','префикс_кода1','')=
          StrPLCopy(prefix,res,Length(IniFile.ReadString
          ('BUSINESS_DATA','префикс_кода1',''))) then
          begin
            for i:=0 to Length(IniFile.ReadString('BUSINESS_DATA','префикс_кода1',''))-1 do
              res:=
                StrNextChar(StrPCopy(dest,res));
            has_prefics:=True;
          end;
      end;
   if ( ((IniFile.ReadString('BUSINESS_DATA','удалять_суффикс_при_наличии_префикса1','NO')='YES') and has_prefics)
      (IniFile.ReadString('BUSINESS_DATA','удалять_суффикс_при_наличии_префикса1','NO')<>'YES')) 
     then
       begin
         if (IniFile.ReadString('BUSINESS_DATA','удалять_суффикс1','NO')='YES') then
           begin
             if (IniFile.ReadString('BUSINESS_DATA','считать_суффикс_по_длине1','NO')='YES') then
               begin
                 if ((IniFile.ReadString('BUSINESS_DATA','суффикс_совпадает_с_концом_предыдущего_номера1','NO')='YES') 
                    and SufficsEqualLastCharOfLastNumbers(res,
                    IniFile.ReadInteger('BUSINESS_DATA','длина_суффикса1',0))) 
                    or ((IniFile.ReadString('BUSINESS_DATA','суффикс_совпадает_с_концом_предыдущего_номера1','NO')='NO') then 
                     begin
                       res:=Delete( res,(Length(res)-IniFile.ReadInteger('BUSINESS_DATA','длина_суффикса1',0)),
                         IniFile.ReadString('BUSINESS_DATA','длина_суффикса1',0) );
                     end;
               end
             else
               begin
                 if (   IniFile.ReadString('BUSINESS_DATA','суффикс1','')
                    =Copy(res,(Length(res)-Length(IniFile.ReadString('BUSINESS_DATA','суффикс1',''))),
                    Length(IniFile.ReadString('BUSINESS_DATA','суффикс1','')) )   )
                   then
                     begin
                       res:=Delete(res,(Length(res)-Length(IniFile.ReadString('BUSINESS_DATA','суффикс1',''))),
                         Length(IniFile.ReadString('BUSINESS_DATA','суффикс1','')));
                     end;
               end;
           end;
       end;
   has_prefics:=False;
   
   if IniFile.ReadString('BUSINESS_DATA','убирать_префикс2','NO')='YES' then
    if IniFile.ReadString('BUSINESS_DATA','префикс_кода2','')<>'' then
      begin
        if IniFile.ReadString
          ('BUSINESS_DATA','префикс_кода2','')=
          StrPLCopy(prefix,res,Length(IniFile.ReadString
          ('BUSINESS_DATA','префикс_кода2',''))) then
          begin
            for i:=0 to Length(IniFile.ReadString('BUSINESS_DATA','префикс_кода2',''))-1 do
              res:=
                StrNextChar(StrPCopy(dest,res));
            has_prefics:=True;
          end;      
      end;
   has_prefics:=False;

   if IniFile.ReadString('BUSINESS_DATA','убирать_префикс3','NO')='YES' then
    if IniFile.ReadString('BUSINESS_DATA','префикс_кода3','')<>'' then
      begin
        if IniFile.ReadString
          ('BUSINESS_DATA','префикс_кода3','')=
          StrPLCopy(prefix,res,Length(IniFile.ReadString
          ('BUSINESS_DATA','префикс_кода3',''))) then
          begin
            for i:=0 to Length(IniFile.ReadString('BUSINESS_DATA','префикс_кода3',''))-1 do
              res:=
                StrNextChar(StrPCopy(dest,res));
            has_prefics:=True;
          end;
      end;
  has_prefics:=False; 

  }

  if (Length(res)=10) and (
    IniFile.ReadString('BUSINESS_DATA','добавлять_префикс_к_номерам_длиной_10','NO')='YES')
    then
      res:= IniFile.ReadString('BUSINESS_DATA','общий_префикс','7')+
        res;

  Result:=res;
end;

function TModemSettingsForm.AnalizeGSMPhonePrefix(phone: string): string;
var res: string;
    prefix, dest: array[0..255] of Char;
    i, rule_count: Integer;
begin
  res:=phone;
  for rule_count:=1 to
    IniFile.ReadInteger('gsm_modems_logic_settings','количество_правил'
          ,0) do
    begin

      if IniFile.ReadString('gsm_modems_logic_settings','удалять_префикс'
          +IntToStr(rule_count),'NO')='YES' then
      if IniFile.ReadString('gsm_modems_logic_settings'
          ,'префикс'+IntToStr(rule_count),'')<>'' then
      begin
        if IniFile.ReadString
          ('gsm_modems_logic_settings','префикс'
           +IntToStr(rule_count),'')=
          StrPLCopy(prefix,res,Length(IniFile.ReadString
          ('gsm_modems_logic_settings','префикс'
           +IntToStr(rule_count),''))) then
          begin
            for i:=0 to Length(IniFile.ReadString('gsm_modems_logic_settings','префикс'
              +IntToStr(rule_count),''))-1 do
              res:=
                StrNextChar(StrPCopy(dest,res));
          end;
      end;

    end;
  Result:=res;
end;

function TModemSettingsForm.OutDetectCNDNumber(analiz_string, res: string): Boolean;
var
    fres: Boolean;
    detect_num: string;
begin
  fres:=False;

  //ShowMessage(analiz_string+'-'+caller_id_ND_comb+'-'+
  //  res+'-'+IntToStr(detect_num_length)+'---'+IntToStr(
  //  (Length(analiz_string)-Length(StringReplace(analiz_string,
  //        caller_id_ND_comb+res, '',[rfReplaceAll])))));
  if ((Length(analiz_string)-Length(StringReplace(analiz_string,
          caller_id_ND_comb+res, '',[rfReplaceAll])))>=
       (detect_num_length+Length(caller_id_ND_comb))) and
       ( (Length(res)=detect_num_length) or 
       ((IniFile.ReadString('BUSINESS_DATA','определять_номера_с_длиной_больше_установленной','NO')='YES')
        and (Length(res)>=detect_num_length)) ) then
      begin
        
        if (res<>IniFile.ReadString('BUSINESS_DATA','номер_не_показывать_при_автоопределении1','')) and
           (res<>IniFile.ReadString('BUSINESS_DATA','номер_не_показывать_при_автоопределении2','')) and
           (res<>IniFile.ReadString('BUSINESS_DATA','номер_не_показывать_при_автоопределении3','')) then
              begin
                if IniFile.ReadString('BUSINESS_DATA','высвечивать_автоопределенный_номер_после_поднятия_трубки','NO')='NO' then
                  begin
                    detect_num:=
                      AnalizePhonePrefix(res);
                    if IniFile.ReadString('TNum_detect','insert_prefics','NO')='NO' then
                      ReleaseStructForm.AddNewCustWithDetectNumber(
                        detect_num, addit_modem_detect)
                    else
                      ReleaseStructForm.AddNewCustWithDetectNumber(
                        IniFile.ReadString('TNum_detect','addit_modem_prefics','')+
                          detect_num, addit_modem_detect);
                  end
                else
                  begin
                    if addit_modem_detect then
                      begin
                        addit_modem_detect_counter:=
                          StrToInt(IniFile.ReadString('BUSINESS_DATA','ожидание_для_определения_после_звонка','3'));
                        if has_addit_modem_detect then
                          begin
                            if IniFile.ReadString('TNum_detect','insert_prefics','NO')='NO' then
                              ReleaseStructForm.AddNewCustWithDetectNumber(
                                addit_modem_detect_number, True)
                            else
                              ReleaseStructForm.AddNewCustWithDetectNumber(
                                IniFile.ReadString('TNum_detect','addit_modem_prefics','')+
                                addit_modem_detect_number, True);
                          end;
                        has_addit_modem_detect:=True;
                        addit_modem_detect_number:=AnalizePhonePrefix(res);
                        detect_num:=addit_modem_detect_number;
                      end
                    else
                      begin
                        first_modem_detect_counter:=
                          StrToInt(IniFile.ReadString('BUSINESS_DATA','ожидание_для_определения_после_звонка','3'));
                        if has_first_modem_detect then
                          begin
                            if IniFile.ReadString('TNum_detect','insert_prefics','NO')='NO' then
                              ReleaseStructForm.AddNewCustWithDetectNumber(
                                first_modem_detect_number, False)
                            else
                              ReleaseStructForm.AddNewCustWithDetectNumber(
                                IniFile.ReadString('TNum_detect','addit_modem_prefics','')+
                                first_modem_detect_number, False);
                          end;
                        has_first_modem_detect:=True;
                        first_modem_detect_number:=AnalizePhonePrefix(res);
                        detect_num:=first_modem_detect_number;
                      end;
                  end;
              end;
        if IniFile.ReadString('TNum_detect','show_analyz_buffers','NO')='YES' then
          RxMemo.Lines.Add('Cut result='+
            detect_num );
        fres:=True;
      end;

  Result:=fres;
end;

function TModemSettingsForm.CutDetectNumber(analiz_string: string; num_count: Integer): string;
var analyz_array: array[0..255] of Char;
    i: Integer;
    C : Char;
    S : String;
    has_number: Boolean;
    detect_number_count: Integer;
    to_next_cut_fragm: string;
begin
  S:='';
  has_number:=
    False;
  detect_number_count:=
    0;
  StrPCopy(analyz_array, analiz_string);
  to_next_cut_fragm:='';

  for i:=0 to Length(analiz_string)-1 do
    begin

      C := analyz_array[i];
      case C of
        '0'..'9','+':
          begin
            if not has_number then
              S:='';
            S := S + C;
            to_next_cut_fragm:=
             to_next_cut_fragm+C;
            has_number:=True;
            if (i=(Length(analiz_string)-1)) then
              begin

                if OutDetectCNDNumber(analiz_string, S) then
                  begin
                    detect_number_count:=detect_number_count+1;
                    to_next_cut_fragm:='';
                  end;
              end;
          end
        else
          begin
           if has_number then
             begin

               if OutDetectCNDNumber(analiz_string, S) then
                 detect_number_count:=detect_number_count+1;
              S:='';
              to_next_cut_fragm:='';
             end;
           S := S + C;
           to_next_cut_fragm:=
             to_next_cut_fragm+C;
           has_number:=False;     
          end;
          
        end;


    end;
  
  Result:=to_next_cut_fragm;
end;

function TModemSettingsForm.HasStartDetect(analiz_string: string): Boolean;
var res: Boolean;
begin
  res:=False;

  if (Length(StringReplace(analiz_string,
   classic_ND_comb, '',[rfReplaceAll]))<>Length(analiz_string)) or
     (Length(StringReplace(analiz_string,
   caller_id_ND_comb, '',[rfReplaceAll]))<>Length(analiz_string))
   then
     res:=True;

  Result:=res;
end;

procedure TModemSettingsForm.GSMApdComPortTriggerAvail(CP: TObject;
  Count: Word);
var
  I : Word;
  C : Char;
  S : String;
  tnum: string;
  write_tnum, view_phone: Boolean;
  ap_count: Integer;
  rule_count: Integer;
begin
GSMCheckWait:=False;
GSMCheckStart:=False;
if (IniFile.ReadString('BUSINESS_DATA','scan_phone_line','NO')='YES') then
 begin
  write_tnum:=False;
  view_phone:=True;
  ap_count:=0;
  S := '';
  tnum:='';
  for I := 1 to Count do begin
    C := GSMApdComPort.GetChar;
    case C of
      #0..#31 : {Don't display} ;
      '+':begin
             if write_tnum then
              begin
               tnum:=tnum+C; S := S + C;
              end; 
           end;
      '0'..'9': begin if write_tnum then
                  tnum:=tnum+C; S := S + C; end;
      '"':
        begin
         S := S + C;
         if ap_count=0 then
           write_tnum:=True
         else
           begin
             write_tnum:=False;
             if (ap_count=1) and (tnum<>'') and ((prev_gsm_tnum
                <>tnum) or (GSMRING_distance_count>IniFile.ReadInteger('modems','время_между_посылами_RING',20))) then
              begin
               GSMRING_distance_count:=0;
               prev_gsm_tnum:=
                 tnum;
               
                 for rule_count:=1 to
                   IniFile.ReadInteger('gsm_modems_logic_settings','количество_правил'
                     ,0) do
                   begin
                     if tnum=IniFile.ReadString('gsm_modems_logic_settings','не_выводить_номер'
                     +IntToStr(rule_count),'') then
                       view_phone:=False;
                   end;

                if view_phone then begin
                  if IniFile.ReadString('TNum_detect','insert_prefics','NO')='NO' then
                    ReleaseStructForm.AddNewCustWithDetectNumber(
                      AnalizeGSMPhonePrefix(tnum), False, -1010)
                  else
                    ReleaseStructForm.AddNewCustWithDetectNumber(
                    IniFile.ReadString('TNum_detect','gsm_modem_prefics','')+
                      AnalizeGSMPhonePrefix(tnum), False, -1010);
                  end;
                      
              end;
              if (ap_count=1) and (tnum<>'') and (prev_gsm_tnum
                =tnum) then GSMRING_distance_count:=0;
           end;
         ap_count:=ap_count+1;
        end;
      else S := S + C;
    end;
  end;

  GSMMemo.Lines.Add('COM'+IntToStr(GSMApdComPort.ComNumber)+': '+ S );

  if S='RING' then
   begin
     if IniFile.ReadString('modems','CLIP_AT_INSTR1','')<>'' then
            SendGSMCommand(
              IniFile.ReadString('modems','CLIP_AT_INSTR1',''))
     else
       SendGSMCommand('AT+CPBR='+IntToStr(gsm_receive_max_number));
   end;
   
  end;

  prev_gsm_char:=C;

end;

procedure TModemSettingsForm.BtnSendClick(Sender: TObject);
begin
  ApdComPort.OutPut := Command.Text+^M;
end;

procedure TModemSettingsForm.Button3Click(Sender: TObject);
begin
  GSMApdComPort.OutPut := GSMCommand.Text+^M;
end;

procedure TModemSettingsForm.Button1Click(Sender: TObject);
begin
  AdditionalApdComPort.OutPut := AdditCommand.Text+^M;
end;

procedure TModemSettingsForm.AdditionalApdComPortTriggerAvail(CP: TObject;
  Count: Word);
var
  I : Word;
  C : Char;
  S, cut_result: String;
  ind: Integer;
begin
//AdditionalApdComPort.
if (IniFile.ReadString('BUSINESS_DATA','scan_phone_line','NO')='YES') then
 begin
  S := '';
  for I := 1 to Count do begin
    C := AdditionalApdComPort.GetChar;
    case C of
      #0..#31 : {Don't display} ;
      else S := S + C;
    end;
  end;

  if IniFile.ReadString('BUSINESS_DATA','высвечивать_автоопределенный_номер_после_поднятия_трубки','NO')='YES' then
    addit_modem_detect_counter:=
      StrToInt(IniFile.ReadString('BUSINESS_DATA','ожидание_для_определения_после_звонка','3'));

  //Отлов сигнала вызова
  if S='RING' then
   begin

   end;

  AdditRxMemo.Lines.Add('COM'+IntToStr(AdditionalApdComPort.ComNumber)+': '+ S );

  //Смещение строк в буфере каждая на индекс выше
  ind:=29;
  while True do
   begin
      addit_prev_scan_str[ind+1]:=
        addit_prev_scan_str[ind];
    if ind<=0 then
      Break
    else
      ind:=
        ind-1;
   end;

  //Запись в первую ячейку новой строки
  addit_prev_scan_str[0]:=S;

  addit_scan_str:='';

  //Извлечение последних строк в количестве  prev_scan_str_quant (не более 30-ти)
  //и помещение результата в переменную addit_scan_str типа Widestring
  ind:=prev_scan_str_quant-1;
  while True do
   begin
    addit_scan_str:=addit_scan_str+
      addit_prev_scan_str[ind];
    if ind<=0 then
      Break
    else
      ind:=
        ind-1;
   end;
   //Конец извлечения

  //Отображение анализируемого состава строк
  if IniFile.ReadString('TNum_detect','show_analyz_buffers','NO')='YES' then
      AdditRxMemo.Lines.Add('Receive progr buff=|'+addit_scan_str+'|');
  //Конец вывода

  //Если обнаружены комбинации перед номером
  if HasStartDetect(addit_scan_str) then
    if (IniFile.ReadString('BUSINESS_DATA','paste_auto_def_phone','NO')='YES') then
        begin
          DispAdding:=True;

          addit_modem_detect:=True;
          cut_result:=
             CutDetectNumber(addit_scan_str,0);
          addit_modem_detect:=False;
          
          for i:=0 to 30 do
            addit_prev_scan_str[i]:='';
          addit_prev_scan_str[0]:=
            cut_result;

          if IniFile.ReadString('TNum_detect','show_analyz_buffers','NO')='YES' then
            AdditRxMemo.Lines.Add('Cut number from='+
              addit_scan_str);
          
          DispAdding:=False;
        end;


 end;
end;

procedure TModemSettingsForm.Button2Click(Sender: TObject);
begin
  GSM2ApdComPort.OutPut := GSM2Command.Text+^M;
end;

procedure TModemSettingsForm.Button4Click(Sender: TObject);
begin
  GSM3ApdComPort.OutPut := GSM3Command.Text+^M;
end;

procedure TModemSettingsForm.GSM2ApdComPortTriggerAvail(CP: TObject;
  Count: Word);
var
  I : Word;
  C : Char;
  S : String;
  tnum: string;
  write_tnum, view_phone: Boolean;
  ap_count: Integer;
  rule_count: Integer;
begin
GSM2CheckWait:=False;
GSM2CheckStart:=False;
view_phone:=True;
if (IniFile.ReadString('BUSINESS_DATA','scan_phone_line','NO')='YES') then
 begin
  write_tnum:=False;
  view_phone:=True;
  ap_count:=0;
  S := '';
  tnum:='';
  for I := 1 to Count do begin
    C := GSM2ApdComPort.GetChar;

    case C of
      #0..#31 : {Don't display} ;
      '+': begin
             if write_tnum then
              begin
               tnum:=tnum+C; S := S + C;
              end; 
           end;
      '0'..'9': begin if write_tnum then
                  tnum:=tnum+C; S := S + C; end;
      '"':
        begin
         S := S + C;
         if ap_count=0 then
           write_tnum:=True
         else
           begin
             write_tnum:=False;

             if (ap_count=1) and (tnum<>'') and ((prev_gsm_tnum
                <>tnum) or (GSM2RING_distance_count>IniFile.ReadInteger('modems','время_между_посылами_RING2',20))) then
              begin
               gsm2_has_detect:=False;
               GSM2RING_distance_count:=0;
               prev_gsm_tnum:=
                 tnum;

                 for rule_count:=1 to
                   IniFile.ReadInteger('gsm_modems_logic_settings','количество_правил'
                     ,0) do
                   begin
                     if tnum=IniFile.ReadString('gsm_modems_logic_settings','не_выводить_номер'
                     +IntToStr(rule_count),'') then
                       view_phone:=False;
                   end;

                if view_phone then begin
                 if IniFile.ReadString('TNum_detect','insert_prefics','NO')='NO' then
                    ReleaseStructForm.AddNewCustWithDetectNumber(
                      AnalizeGSMPhonePrefix(tnum), False, -1010)
                 else
                    ReleaseStructForm.AddNewCustWithDetectNumber(
                      IniFile.ReadString('TNum_detect','gsm_modem2_prefics','')+
                       AnalizeGSMPhonePrefix(tnum), False, -1010);
                 end;

              end;
              if (ap_count=1) and (tnum<>'') and (prev_gsm_tnum
                =tnum) then
                  begin
                    gsm2_has_detect:=False;
                    GSM2RING_distance_count:=0;
                  end;
           end;

         ap_count:=ap_count+1;
        end;

      else S := S + C;

    end;
  end;

  GSM2Memo.Lines.Add('COM'+IntToStr(GSM2ApdComPort.ComNumber)+': '+ S );

  if S='RING' then
   begin
     if gsm2_has_detect then
       begin
         //ReleaseStructForm.AddCurrUserLog('Не определен номер вызова!');
         ShowMessage('Номер не определен!');
       end;
     gsm2_has_detect:=True;

     if IniFile.ReadString('modems','CLIP_AT_INSTR2','')<>'' then
            SendGSMCommand(
              IniFile.ReadString('modems','CLIP_AT_INSTR2',''))
     else
       SendGSM2Command('AT+CPBR='+IntToStr(gsm_receive_max_number2));
   end;
   
  end;
  prev_gsm2_char:=C;
end;

procedure TModemSettingsForm.GSM3ApdComPortTriggerAvail(CP: TObject;
  Count: Word);
var
  I : Word;
  C : Char;
  S : String;
  tnum: string;
  write_tnum, view_phone: Boolean;
  ap_count: Integer;
  rule_count: Integer;
begin
GSM3CheckWait:=False;
GSM3CheckStart:=False;
if (IniFile.ReadString('BUSINESS_DATA','scan_phone_line','NO')='YES') then
 begin
  write_tnum:=False;
  view_phone:=True;
  ap_count:=0;
  S := '';
  tnum:='';
  for I := 1 to Count do begin
    C := GSM3ApdComPort.GetChar;
    case C of
      #0..#31 : {Don't display} ;
      '+': begin
             if write_tnum then
              begin
               tnum:=tnum+C; S := S + C;
              end;
           end;
      '0'..'9': begin if write_tnum then
                  tnum:=tnum+C; S := S + C; end;
      '"':
        begin
         S := S + C;
         if ap_count=0 then
           write_tnum:=True
         else
           begin
             write_tnum:=False;
             if (ap_count=1) and (tnum<>'') and ((prev_gsm_tnum
                <>tnum) or (GSM3RING_distance_count>IniFile.ReadInteger('modems','время_между_посылами_RING3',20))) then
              begin
               GSM3RING_distance_count:=0;
               prev_gsm_tnum:=
                 tnum;
               
                 for rule_count:=1 to
                   IniFile.ReadInteger('gsm_modems_logic_settings','количество_правил'
                     ,0) do
                   begin
                     if tnum=IniFile.ReadString('gsm_modems_logic_settings','не_выводить_номер'
                     +IntToStr(rule_count),'') then
                       view_phone:=False;
                   end;

                if view_phone then begin
                  if IniFile.ReadString('TNum_detect','insert_prefics','NO')='NO' then
                     ReleaseStructForm.AddNewCustWithDetectNumber(
                       AnalizeGSMPhonePrefix(tnum), False, -1010)
                  else
                     ReleaseStructForm.AddNewCustWithDetectNumber(
                     IniFile.ReadString('TNum_detect','gsm_modem3_prefics','')+
                       AnalizeGSMPhonePrefix(tnum), False, -1010);
                  end;     

              end;
              if (ap_count=1) and (tnum<>'') and (prev_gsm_tnum
                =tnum) then GSM3RING_distance_count:=0;
           end;
         ap_count:=ap_count+1;
        end;
      else S := S + C;
    end;
  end;

  GSM3Memo.Lines.Add('COM'+IntToStr(GSM3ApdComPort.ComNumber)+': '+ S );

  if S='RING' then
   begin
     if IniFile.ReadString('modems','CLIP_AT_INSTR3','')<>'' then
            SendGSMCommand(
              IniFile.ReadString('modems','CLIP_AT_INSTR3',''))
     else
       SendGSM3Command('AT+CPBR='+IntToStr(gsm_receive_max_number3));
   end;
   
  end;

  prev_gsm3_char:=C;

end;

procedure TModemSettingsForm.N2Click(Sender: TObject);
begin
  if ModemsOnActivePhoneLine then
    ShowMessage('Все'+
      ' модемы подключены к питанию '+
      'и к линии!')
  else
    ShowMessage('Один или несколько'+
      ' модемов не подключены к питанию, '+
      'либо к линии!');
end;

procedure TModemSettingsForm.N3Click(Sender: TObject);
begin
  ReleaseStructForm.AddNewCustWithDetectNumber
    ('9883138837',True);
end;

procedure TModemSettingsForm.N4Click(Sender: TObject);
begin
  ReleaseStructForm.AddNewCustWithDetectNumber(
    '9883138837', False, -1010);
end;

procedure TModemSettingsForm.BitBtn1Click(Sender: TObject);
begin
  CutDetectNumber(Edit1.Text,0);
end;

end.
