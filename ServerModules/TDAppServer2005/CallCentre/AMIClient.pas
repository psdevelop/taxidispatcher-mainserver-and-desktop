unit AMIClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, Menus, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, Sockets, StdCtrls, DateUtils, IdTelnet, IdCmdTCPClient,
  IdIntercept, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, Winsock,
  SimpleTCPUnit, ComCtrls, Buttons, AMIConnectUnit;

type
  TBytes = array of Byte;
  TAMIClientForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    AMIInputMemo: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    AMIOutputMemo: TMemo;
    AMIRecvTimer: TTimer;
    StatusBar1: TStatusBar;
    Splitter2: TSplitter;
    AnalyseMemo: TMemo;
    SpeedButton1: TSpeedButton;
    StreamAnalyseMemo: TMemo;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    Button2: TButton;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure AMIRecvTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function createTCPClientSocket: Boolean;
    procedure AnalyseAsteriskMIInpData(AMIInput: String);
    function parseAMICommand(AMICommand: String): Boolean;
    procedure streamParseAMIData(AMIInput: String);
	  function AnalizeGSMPhonePrefix(phone: string): string;
	  function AddNewCustWithDetectNumber(DetectNum: string;
		  ColorCheck: Boolean=False; GSMDetectColorCode: Integer=0): Integer;
    procedure addOrderOnExtractedNumber(CallerIDStr: String);
    function sendAMICommand(AMICmd: String): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    wData : WSADATA;
    sServerListen: TSOCKET;
    AMICoord: TAMICoordinator;
    server_addr : sockaddr_in;
    iRet : Integer;
    sRecvBuff, sSendBuff : array [0..255] of char;
    ClientThread: SimpleTCPClientThread;
    ThreadCreated: Boolean;
    CurrentAMIAnaliseStr: Widestring;
    InpStrList: TStringList;
    LastInputHeaderIsBridge: Boolean;
    LastBridgeStateStateIsLink: Boolean;
    LastInputHeaderIsDial: Boolean;
    LastDialStateIsBegin: Boolean;
    LastInputHeaderIsNewChannel: Boolean;
    EVENT_BRIDGE: String;
    BRIDGE_STATE_LINK: String;
    BRIDGE_CALLERID1: String;
    EVENT_DIAL: String;
    DIAL_STATE_BEGIN: String;
    DIAL_CALLERID: String;
    EVENT_SUB: String;
    EVENT_NEW_CHANNEL: String;
    CHAN_CALLERID: String;
    PONG_ANSWER: String;
    crashedAMISocket: Boolean;
    pongAnswerCounter: Integer;
    pongAnswerWaiting: Boolean;
	  EVENT_HPREFIX: String;
	  PING_HPREFIX: String;
	  RESPONSE_HPREFIX: String;
	  PSTN1_CHANN_CODE: String;
	  PSTN2_CHANN_CODE: String;
	  GSM1_CHANN_CODE: String;
	  CHANN_CODE_PREFIX: String;
	  numRulesCount: Integer;
	  InReceiving: Boolean;
	  AMIPPCounter: Integer;
  end;

const
  CRLF = #$0D + #$0A;
  DELIM = '**_';
  TWO_DELIM = '**_**_';

var
  AMIClientForm: TAMIClientForm;

implementation

{$R *.dfm}

uses ServerMainUnit, RemoteControlUnit;

function LookupName(const AAddress: AnsiString): TInAddr;
begin
  FillChar(Result, sizeOf(Result), 0);
  Result.s_addr := inet_addr(PAnsiChar(AAddress))
end;

function TAMIClientForm.AnalizeGSMPhonePrefix(phone: string): string;
var res: string;
    prefix, dest: array[0..255] of Char;
    i, rule_count: Integer;
begin
  res:=phone;
  for rule_count:=1 to
    IniFile.ReadInteger('call_centre_settings','количество_правил'
          ,0) do
    begin

      if IniFile.ReadString('call_centre_settings','удалять_префикс'
          +IntToStr(rule_count),'NO')='YES' then
      if IniFile.ReadString('call_centre_settings'
          ,'префикс'+IntToStr(rule_count),'')<>'' then
      begin
        if IniFile.ReadString
          ('call_centre_settings','префикс'
           +IntToStr(rule_count),'')=
          StrPLCopy(prefix,res,Length(IniFile.ReadString
          ('call_centre_settings','префикс'
           +IntToStr(rule_count),''))) then
          begin
            for i:=0 to Length(IniFile.ReadString
              ('call_centre_settings','префикс'
              +IntToStr(rule_count),''))-1 do
              res:=
                StrNextChar(StrPCopy(dest,res));
          end;
      end;

    end;
  Result:=res;
end;

function TAMIClientForm.AddNewCustWithDetectNumber
  (DetectNum: string; ColorCheck: Boolean=False;
  GSMDetectColorCode: Integer=0): Integer;
var DetectID: Integer;
begin

  DetectID:=-1;
  if ServerMainForm.MainBASEADOC.Connected then
  begin
  try
    RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.Refresh;

    if (IniFile.ReadString('call_centre_settings',
    'подсвечивать_второй_модем_синим_цветом','NO')='YES') then
    begin
    if ColorCheck then
      RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@color_check').Value:=
            1
    else
      RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@color_check').Value:=
            0;
    end
    else
      RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@color_check').Value:=
            0;

    RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@ord_num').Value:=
        -1;

    RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@adres').Value:='';
    RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@phone').Value:=DetectNum;
    RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@ab_num').Value:='';

    if (IniFile.ReadString('call_centre_settings',
     'АОН_заявка_как_принят_оператором_ручн',
     'NO')='YES')then
    begin
      RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
            ParamByName('@op_order').Value:=
            1;
    end
    else
      RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
            ParamByName('@op_order').Value:=
            0;
    RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@order_id').Value:=
          -1;
    RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@disp_id').Value:=
          -1;//CurrDispUserID;
    RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@gsm_detect_code').Value:=
          GSMDetectColorCode;
    if (IniFile.ReadString('call_centre_settings',
      'выводить_повторяющиеся_заявки','NO')='NO') then
      RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@deny_duplicate').Value:=1
    else
      RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@deny_duplicate').Value:=0;
    if (IniFile.ReadString('call_centre_settings',
      'использовать_подсветку_непросмотренных_заявок',
      'NO')='YES') then
      RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@colored_new').Value:=1
    else
      RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@colored_new').Value:=0;
    RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@status').Value:=0;
    RemoteControlForm.InsertOrdWithParamADOOSP.ExecProc;

    DetectID:=RemoteControlForm.InsertOrdWithParamADOOSP.Parameters.
            ParamValues['@ord_num'];

    Self.StreamAnalyseMemo.Lines.Add
        ('Прошла процедура добавления заявки! '
          +IntToStr(DetectID));

  except on E: Exception do
    begin
      DetectID:=-1;
      Self.StreamAnalyseMemo.Lines.Add
        ('Ошибка процедуры добавления заявки! '
          +E.Message);
    end;
  end;
  end;

  Result:=DetectId;

end;

function TAMIClientForm.createTCPClientSocket: Boolean;
begin
  // Создание сокета
  Result:=False;
  try
  AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
    'Попытка соединения с AMI!!!');
  sServerListen := Socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
  if sServerListen = INVALID_SOCKET then
    begin
      AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
        ' Ошибка создания сокета');
      Exit;
    end;

  // Запонение структуры адреса
  server_addr.sin_addr.s_addr := htonl(INADDR_ANY);
  server_addr.sin_family := AF_INET;
  server_addr.sin_port := htons(IniFile.
    ReadInteger('BUSINESS_DATA',
    'AMI_порт',5038));
  server_addr.sin_addr := LookupName(IniFile.
    ReadString('BUSINESS_DATA',
    'IP_адрес_ASTERISK','192.168.0.25'));

  if (Connect(sServerListen, server_addr, sizeof(server_addr)) = SOCKET_ERROR) then
    begin
      AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
          ' Ошибка соединения сокета!');
      Exit;
    end;
  //MessageBox(0, 'Жду ответа сервера', 'Внимание!!!', 0);
    ClientThread := SimpleTCPClientThread.Create(true);
    ClientThread.Sock:=sServerListen;
    ClientThread.ClientID:=Integer(sServerListen);
    ClientThread.BSize:=8192;
    ClientThread.UseNonBlockingMode:=False;
    ClientThread.StatusStr:='Создаем нить';
    ClientThread.Resume;
    ClientThread.notUseJSON:=True;
    ThreadCreated:=True;
    Result:=True;
  except
    AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
          ' Ошибка создания нити сокета!');
  end;
end;

procedure TAMIClientForm.FormCreate(Sender: TObject);
begin
  {InReceiving:=False;
  AMIPPCounter:=10;
  ThreadCreated:=False;
  CurrentAMIAnaliseStr:='';
  InpStrList := TStringList.Create;
  pongAnswerCounter := IniFile.ReadInteger('BUSINESS_DATA',
    'время_ожидания_PING_ASTERISK',15);
  pongAnswerWaiting := False;
  EVENT_BRIDGE := IniFile.ReadString('call_centre_settings',
    'EVENT_BRIDGE','Event: Bridge');
  BRIDGE_STATE_LINK := IniFile.ReadString('call_centre_settings',
    'BRIDGE_STATE_LINK','Bridgestate: Link');
  BRIDGE_CALLERID1 := IniFile.ReadString('call_centre_settings',
    'BRIDGE_CALLERID1','CallerID1: ');
  EVENT_DIAL := IniFile.ReadString('call_centre_settings',
    'EVENT_DIAL','Event: Dial');
  DIAL_STATE_BEGIN := IniFile.ReadString('call_centre_settings',
    'DIAL_STATE_BEGIN','SubEvent: Begin');
  DIAL_CALLERID := IniFile.ReadString('call_centre_settings',
    'DIAL_CALLERID','CallerIDNum: ');
  EVENT_SUB := IniFile.ReadString('call_centre_settings',
    'EVENT_SUB','SubEvent:');
  EVENT_NEW_CHANNEL := IniFile.ReadString('call_centre_settings',
    'EVENT_NEW_CHANNEL','Event: Newchannel');
  CHAN_CALLERID := IniFile.ReadString('call_centre_settings',
    'CHAN_CALLERID','CallerIDNum: ');
  PONG_ANSWER := IniFile.ReadString('call_centre_settings',
    'PONG_ANSWER','Ping: Pong');
  EVENT_HPREFIX := IniFile.ReadString('call_centre_settings',
    'EVENT_HPREFIX','Event:');
  PING_HPREFIX := IniFile.ReadString('call_centre_settings',
    'PING_HPREFIX','Ping:');
  RESPONSE_HPREFIX := IniFile.ReadString('call_centre_settings',
    'RESPONSE_HPREFIX','Response:');
  PSTN1_CHANN_CODE := IniFile.ReadString('call_centre_settings',
    'PSTN1_CHANN_CODE','fxo1');
  PSTN2_CHANN_CODE := IniFile.ReadString('call_centre_settings',
    'PSTN2_CHANN_CODE','fxo2');
  GSM1_CHANN_CODE := IniFile.ReadString('call_centre_settings',
    'GSM1_CHANN_CODE','gsm343');
  CHANN_CODE_PREFIX := IniFile.ReadString('call_centre_settings',
    'CHANN_CODE_PREFIX','Channel1:');
  crashedAMISocket:=False;
  try
  if IniFile.ReadString('BUSINESS_DATA',
    'активировать_AMI_клиента_TCPTHRD','NO')='YES' then
  begin
    if WSAStartup(MAKEWORD(1,1), wData) <> 0 then
    begin
      AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
        ' Не могу загрузить WinSock!');
    end;
    self.createTCPClientSocket;

    if ThreadCreated then
    begin
    self.ClientThread.SendUTFString(
    'Action: Login'+CRLF+'Username: '+
        IniFile.ReadString('BUSINESS_DATA',
        'AMI_логин','admin')+CRLF+'Secret: '+
        IniFile.ReadString('BUSINESS_DATA',
        'AMI_пароль','amp111')+CRLF+
        'Events: on'+CRLF+CRLF);
    end
    else
    begin
          self.crashedAMISocket := True;
          AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
            'НЕУДАЧА попытки первоначального соединения с AMI!!!');
    end;

  end;
  except on E: Exception do
    begin
    self.crashedAMISocket := True;
    AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
            'Ощибка инициализации AMI-модуля!!!'+E.Message);
    end;
  end;  }

  AMICoord:=TAMICoordinator.Create;
  AMICoord.Resume;
  ComboBox1.Items.LoadFromFile(GetCurrentDir+'/CallCentre/amii1.txt');

end;

function TAMIClientForm.parseAMICommand(AMICommand: String): Boolean;
var res: Boolean;
begin
  res:=False;
  try
  AnalyseMemo.Lines.Add('Парсим: ['+StringReplace
    (CurrentAMIAnaliseStr,CRLF,'',[rfReplaceAll])+']');
  except on E:Exception do
    AnalyseMemo.Lines.Add('Ошибка парсинга строки! '+E.Message);
  end;
  Result:=res;
end;

procedure TAMIClientForm.AnalyseAsteriskMIInpData(AMIInput: String);
var TWO_CRLF_POS: Integer;
    CommandAnalyseStr: String;
    i: Integer;
begin

  try
  InpStrList.Clear;
  InpStrList.Append(AMIInput);
  for i:=0 to InpStrList.Count-1 do
  CurrentAMIAnaliseStr:=CurrentAMIAnaliseStr+StringReplace(
    InpStrList.Strings[i],CRLF,DELIM,[rfReplaceAll]);
  
  AnalyseMemo.Lines.Add('Поступило: ['+CurrentAMIAnaliseStr+']');
  if Length(CurrentAMIAnaliseStr)>2048 then
    CurrentAMIAnaliseStr:=Copy(CurrentAMIAnaliseStr,
      (Length(CurrentAMIAnaliseStr)-2048+1),2048);
  if CurrentAMIAnaliseStr=(CRLF+CRLF) then
    CurrentAMIAnaliseStr:='';

  AnalyseMemo.Lines.Add('Разбираем: ['+StringReplace
    (CurrentAMIAnaliseStr,CRLF,'',[rfReplaceAll])+']');

  while (Length(CurrentAMIAnaliseStr)>4) do
  begin
    TWO_CRLF_POS:=Pos((CRLF+CRLF),CurrentAMIAnaliseStr);
    if (TWO_CRLF_POS>0) then
    begin
      if TWO_CRLF_POS>1 then
        parseAMICommand(Copy(CurrentAMIAnaliseStr,1,(TWO_CRLF_POS-1)));
      if TWO_CRLF_POS+Length(CRLF+CRLF)<=Length(CurrentAMIAnaliseStr) then
	    begin
		    CurrentAMIAnaliseStr:=Copy(CurrentAMIAnaliseStr,
			    TWO_CRLF_POS+Length(CRLF+CRLF),
          (Length(CurrentAMIAnaliseStr)-Length(CRLF+CRLF)-
			    (TWO_CRLF_POS-1)));
	    end
      else
        CurrentAMIAnaliseStr:='';
    end
    else
    begin
      if parseAMICommand(CurrentAMIAnaliseStr) then
        CurrentAMIAnaliseStr:=''
      else
        Break;
    end;
  end;
  AnalyseMemo.Lines.Add('Осталось: ['+StringReplace
    (CurrentAMIAnaliseStr,CRLF,'',[rfReplaceAll])+']');

  except on E:Exception do
    AnalyseMemo.Lines.Add('Ошибка подг. строки(packet-analys)! '+E.Message);
  end;
end;

procedure TAMIClientForm.addOrderOnExtractedNumber(CallerIDStr: String);
var i: Integer;
    AChar: Char;
    tnum: String;
begin
  StreamAnalyseMemo.Lines.Append(DateTimeToStr(Today+Time)+
    'Extract number для добавления заявки.'+
    ' Строка для анализа: '+
    CallerIDStr);
  tnum:='';
  if Length(CallerIDStr)>=5 then
  begin

    for i:=1 to Length(CallerIDStr) do
    begin
      AChar:=CallerIDStr[i];
      case  AChar of
        '+': begin
                tnum:=tnum+AChar;
              end;
        '0'..'9': begin
                tnum:=tnum+AChar;
              end;
        else
          begin
            //tnum:='';
          end;
        end;

    end;

    StreamAnalyseMemo.Lines.Append(DateTimeToStr(Today+Time)+
        'TNUM='+tnum);

    if Length(tnum)>=5 then
    begin
      tnum:=self.AnalizeGSMPhonePrefix(tnum);
      StreamAnalyseMemo.Lines.Append(DateTimeToStr(Today+Time)+
        'TNUM2='+tnum);
      self.AddNewCustWithDetectNumber(tnum);
    end;

  end;
end;

procedure TAMIClientForm.streamParseAMIData(AMIInput: String);
var i: Integer;
    cutNumAnalysStr: String;
    callerIdHeaderPos: Integer;
begin
  try
    StreamAnalyseMemo.Clear;
    StreamAnalyseMemo.Lines.Append(AMIInput);
    for i:=0 to StreamAnalyseMemo.Lines.Count-1 do
    begin
      //if self.LastInputHeaderIsDial or self.LastDialStateIsBegin then
    //AMIOutputMemo.Lines.Append('-----'+DateTimeToStr(Today+Time)+
    //StreamAnalyseMemo.Lines.Strings[i]);
      if Pos(Self.PONG_ANSWER,StreamAnalyseMemo.Lines.Strings[i])>0 then
      begin
        self.pongAnswerWaiting:=False;
        AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
            'Подтверждение PONG.');
      end;
      if Pos(Self.EVENT_BRIDGE,
          StreamAnalyseMemo.Lines.Strings[i])>0 then
      begin
        self.LastInputHeaderIsBridge:=True;
        AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
        'Найден признак LastInputHeaderIsBridge. Строка для анализа: '+
              StreamAnalyseMemo.Lines.Strings[i]);
      end
      else if Pos(Self.EVENT_DIAL,
          StreamAnalyseMemo.Lines.Strings[i])>0 then
      begin
        self.LastInputHeaderIsDial:=True;
        AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
        'Найден признак LastInputHeaderIsDial. Строка для анализа: '+
              StreamAnalyseMemo.Lines.Strings[i]);
        //AMIOutputMemo.Lines.Append(Self.DIAL_STATE_BEGIN);
        //AMIOutputMemo.Lines.AddStrings(StreamAnalyseMemo.Lines);
      end
      else if Pos(Self.EVENT_NEW_CHANNEL,
          StreamAnalyseMemo.Lines.Strings[i])>0 then
      begin
        self.LastInputHeaderIsNewChannel:=True;
        AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
        'Найден признак LastInputHeaderIsNewChannel. Строка для анализа: '+
              StreamAnalyseMemo.Lines.Strings[i]);
        //AMIOutputMemo.Lines.Append(Self.DIAL_STATE_BEGIN);
        //AMIOutputMemo.Lines.AddStrings(StreamAnalyseMemo.Lines);
      end
	  else if ( (Pos(Self.EVENT_HPREFIX,
          StreamAnalyseMemo.Lines.Strings[i])>0)
          and not (Pos(EVENT_SUB,
          StreamAnalyseMemo.Lines.Strings[i])>0) )
          or (Pos(Self.PING_HPREFIX,
          StreamAnalyseMemo.Lines.Strings[i])>0)
          or (Pos(Self.RESPONSE_HPREFIX,
          StreamAnalyseMemo.Lines.Strings[i])>0) then
      begin
		  self.LastInputHeaderIsBridge:=False;
		  self.LastBridgeStateStateIsLink:=False;
      self.LastInputHeaderIsNewChannel:=False;
      self.LastInputHeaderIsDial:=False;
      self.LastDialStateIsBegin:=False;
	  end
	  else
	  begin
	  end;
    if IniFile.ReadString('call_centre_settings',
        'AMI_CALLERID_по_факту_поднятия','NO')='YES' then
    begin
      if (Pos(Self.BRIDGE_STATE_LINK,
          StreamAnalyseMemo.Lines.Strings[i])>0)
        and self.LastInputHeaderIsBridge then
      begin
        self.LastBridgeStateStateIsLink:=True;
        AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
            'Найден признак BridgeStateStateIsLink. Строка для анализа: '+
              StreamAnalyseMemo.Lines.Strings[i]);
      end;
      callerIdHeaderPos:=Pos(Trim(Self.BRIDGE_CALLERID1),
          StreamAnalyseMemo.Lines.Strings[i]);
      if (callerIdHeaderPos>0)
        and self.LastBridgeStateStateIsLink then
      begin
        self.LastInputHeaderIsBridge:=False;
        self.LastBridgeStateStateIsLink:=False;
        AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
            'Найден номер по CALLERID. Строка для анализа: '+
              StreamAnalyseMemo.Lines.Strings[i]);
        if (
          (callerIdHeaderPos+
          Length(Self.BRIDGE_CALLERID1)-1) <=
          (Length(StreamAnalyseMemo.Lines.Strings[i])-12)
          )
          then
          begin
            cutNumAnalysStr:=
              Copy(
              StreamAnalyseMemo.Lines.Strings[i],
              (callerIdHeaderPos+Length(Self.BRIDGE_CALLERID1)),
              (Length(StreamAnalyseMemo.Lines.Strings[i])-
              (callerIdHeaderPos+Length(Self.BRIDGE_CALLERID1))+1)
              );
            cutNumAnalysStr:=Trim(cutNumAnalysStr);
            if Length(cutNumAnalysStr)>12 then
              cutNumAnalysStr:=Copy(cutNumAnalysStr,1,12);
            self.addOrderOnExtractedNumber(cutNumAnalysStr);
          end;
      end;
      end
      else if IniFile.ReadString('call_centre_settings',
        'AMI_CALLERID_по_DIAL','NO')='YES' then
      begin
      if (Pos(Self.DIAL_STATE_BEGIN,
          StreamAnalyseMemo.Lines.Strings[i])>0)
        and self.LastInputHeaderIsDial then
      begin
        self.LastDialStateIsBegin:=True;
        AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
            'Найден признак LastDialStateIsBegin. Строка для анализа: '+
              StreamAnalyseMemo.Lines.Strings[i]);
      end;
      callerIdHeaderPos:=Pos(Trim(Self.DIAL_CALLERID),
          StreamAnalyseMemo.Lines.Strings[i]);
      if (callerIdHeaderPos>0)
        and self.LastDialStateIsBegin then
      begin
        //AMIOutputMemo.Lines.AddStrings(StreamAnalyseMemo.Lines);
        self.LastInputHeaderIsDial:=False;
        self.LastDialStateIsBegin:=False;
        AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
            'Найден номер по CALLERID. Строка для анализа: '+
              StreamAnalyseMemo.Lines.Strings[i]);
        if (
          (callerIdHeaderPos+
          Length(Self.DIAL_CALLERID)-1) <=
          (Length(StreamAnalyseMemo.Lines.Strings[i])-12)
          )
          then
          begin
            cutNumAnalysStr:=
              Copy(
              StreamAnalyseMemo.Lines.Strings[i],
              (callerIdHeaderPos+Length(Self.DIAL_CALLERID)),
              (Length(StreamAnalyseMemo.Lines.Strings[i])-
              (callerIdHeaderPos+Length(Self.DIAL_CALLERID))+1)
              );
            cutNumAnalysStr:=Trim(cutNumAnalysStr);
            if Length(cutNumAnalysStr)>12 then
              cutNumAnalysStr:=Copy(cutNumAnalysStr,1,12);
            self.addOrderOnExtractedNumber(cutNumAnalysStr);
          end;
      end;
    end
    else
    begin
      callerIdHeaderPos:=Pos(Trim(Self.CHAN_CALLERID),
          StreamAnalyseMemo.Lines.Strings[i]);
      if (callerIdHeaderPos>0)
        and self.LastInputHeaderIsNewChannel then
      begin
        //AMIOutputMemo.Lines.AddStrings(StreamAnalyseMemo.Lines);
        self.LastInputHeaderIsNewChannel:=False;
        AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
            'Найден номер по CALLERID. Строка для анализа: '+
              StreamAnalyseMemo.Lines.Strings[i]);
        if (
          (callerIdHeaderPos+
          Length(Self.DIAL_CALLERID)-1) <=
          (Length(StreamAnalyseMemo.Lines.Strings[i])-12)
          )
          then
          begin
            cutNumAnalysStr:=
              Copy(
              StreamAnalyseMemo.Lines.Strings[i],
              (callerIdHeaderPos+Length(Self.CHAN_CALLERID)),
              (Length(StreamAnalyseMemo.Lines.Strings[i])-
              (callerIdHeaderPos+Length(Self.CHAN_CALLERID))+1)
              );
            cutNumAnalysStr:=Trim(cutNumAnalysStr);
            if Length(cutNumAnalysStr)>12 then
              cutNumAnalysStr:=Copy(cutNumAnalysStr,1,12);
            self.addOrderOnExtractedNumber(cutNumAnalysStr);
          end;
      end;
    end;
    end;
  except on E:Exception do
    AnalyseMemo.Lines.Add('Ошибка подг. строки (stream-analys)! '+E.Message);
  end;
end;

procedure TAMIClientForm.AMIRecvTimerTimer(Sender: TObject);
var i: Integer;
begin
  if AMIPPCounter<=0 then
  begin
    if self.ThreadCreated then
      AMIPPCounter:=10
    else
      AMIPPCounter:=IniFile.ReadInteger('BUSINESS_DATA',
        'интервал_восстан_связи_с_ASTERISK',10);
  end;
  AMIPPCounter:=AMIPPCounter-1;
  if not InReceiving then
  begin
  try
  try
    InReceiving:=True;
    if IniFile.ReadString('BUSINESS_DATA',
    'активировать_AMI_клиента_TCPTHRD','NO')='YES' then
    begin
    if ThreadCreated then
    begin
      if ClientThread.ErrorClientSocket or
        (Self.pongAnswerCounter<=0) then
      begin
        if (Self.pongAnswerCounter<=0) then
        begin
          ClientThread.ErrorClientSocket:=True;
          AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
            'Подтверждение PONG НЕ ПРИШЛО!!!');
        end
        else
          AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
            'Сбой сокет-соединения с AMI!!!');
        ClientThread.Terminated:=True;
        Self.ThreadCreated:=False;
        Self.crashedAMISocket:=True;
        AMIPPCounter:=IniFile.ReadInteger('BUSINESS_DATA',
	        'интервал_восстан_связи_с_ASTERISK',10);
        CloseSocket(self.sServerListen);
      end
      else
      begin
      if Self.pongAnswerWaiting and
        (Self.pongAnswerCounter>=0) then
        Self.pongAnswerCounter:=
          Self.pongAnswerCounter-1;
      StatusBar1.Panels[0].Text:=DateTimeToStr(Today+Time)+
          ': TCPTHRD Статус '+
          ClientThread.StatusStr;
      for i:=0 to self.ClientThread.ThreadMessagesStringList.Count-1 do
        AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
          ': TCPTHRD '+
          ClientThread.ThreadMessagesStringList.Strings[i]);
      ClientThread.ThreadMessagesStringList.Clear;
      for i:=0 to self.ClientThread.InputDataStringList.Count-1 do
      begin
        AMIInputMemo.Lines.Append(DateTimeToStr(Today+Time)+
          ': TCPTHRD Поступили данные '+
          ClientThread.InputDataStringList.Strings[i]);
        if (IniFile.ReadString('BUSINESS_DATA',
	        'пакетный_анализ_AMI_данных','NO')='YES') then
          AnalyseAsteriskMIInpData(ClientThread.
            InputDataStringList.Strings[i]);
        if (IniFile.ReadString('BUSINESS_DATA',
	        'потоковый_анализ_AMI_данных','NO')='YES') then
          streamParseAMIData(ClientThread.
            InputDataStringList.Strings[i]);
      end;
      ClientThread.InputDataStringList.Clear;
      if AMIPPCounter<=0 then
        begin
         ClientThread.SendUTFString('Action: Ping'+CRLF+CRLF);
         pongAnswerCounter := IniFile.ReadInteger('BUSINESS_DATA',
            'время_ожидания_PING_ASTERISK',15);
         Self.pongAnswerWaiting:=True;
        end;
      end;
    end
    else
    begin
      if self.crashedAMISocket and
        (AMIPPCounter<=0) then
      begin
        Self.createTCPClientSocket;
        if ThreadCreated then
        begin
          self.ClientThread.SendUTFString(
            'Action: Login'+CRLF+'Username: '+
            IniFile.ReadString('BUSINESS_DATA',
            'AMI_логин','admin')+CRLF+'Secret: '+
            IniFile.ReadString('BUSINESS_DATA',
            'AMI_пароль','amp111')+CRLF+
            'Events: on'+CRLF+CRLF);
        end
        else
          AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
            'НЕУДАЧА попытки повторного соединения с AMI!!!');
      end;
    end;
    end;
  except on E: Exception do
    AMIOutputMemo.Lines.Append(DateTimeToStr(Today+Time)+
    ': Ошибка итерации опроса сокета AMI: '+E.Message);
  end;
  finally
    InReceiving:=False;
  end;
  end;
end;

procedure TAMIClientForm.SpeedButton1Click(Sender: TObject);
begin
  AnalyseMemo.CopyToClipboard;
end;

procedure TAMIClientForm.FormDestroy(Sender: TObject);
begin
  if IniFile.ReadString('BUSINESS_DATA',
    'активировать_AMI_клиента_TCPTHRD','NO')='YES' then
  begin
    if self.ThreadCreated then
    begin
      ShutDown(sServerListen, SD_BOTH);
      CloseSocket(self.sServerListen);
    end;
    WSACleanUp;
  end;
end;

procedure TAMIClientForm.ComboBox1Change(Sender: TObject);
begin
  Edit1.Text:=ComboBox1.Text;
end;

function TAMIClientForm.sendAMICommand(AMICmd: String): Boolean;
begin
  if(Length(AMICmd)>10) then
    Result:=self.AMICoord.sendAMICommand(AMICmd)
  else
    Result:=False;
end;

procedure TAMIClientForm.Button1Click(Sender: TObject);
begin
  sendAMICommand(Edit1.Text);
end;

procedure TAMIClientForm.BitBtn1Click(Sender: TObject);
begin
  AMIOutputMemo.Lines.SaveToFile('AMIOutputMemo.txt');
end;

procedure TAMIClientForm.Button2Click(Sender: TObject);
begin
  RemoteControlForm.Test2Memo.Clear;
  RemoteControlForm.Test2Memo.Lines.AddStrings(
    AMIOutputMemo.Lines);
end;

procedure TAMIClientForm.BitBtn2Click(Sender: TObject);
begin
  RemoteControlForm.Test2Memo.Clear;
  RemoteControlForm.Test2Memo.Lines.AddStrings(
    AMIInputMemo.Lines);
end;

procedure TAMIClientForm.BitBtn3Click(Sender: TObject);
begin
  RemoteControlForm.Test2Memo.Clear;
  RemoteControlForm.Test2Memo.Lines.AddStrings(
    StreamAnalyseMemo.Lines);
end;

end.
