unit AMITCPClientInsulator;

interface

uses TCPClientUnit, Classes, WinSock, Windows, StdCtrls,
      Controls, SysUtils, Dialogs, MessageCollection,
      uLkJSON, IdTCPServer, Sockets, DateUtils;

type

  TSocketCoordinator = class;
  //TMessageCollection = class;
  TItemChangeEvent = procedure(Item: TCollectionItem) of object;

  TSocketCoordinator = class(TThread)
    private
      FTCPClientCollection: TTCPClientCollection;
    protected
      wData: WSADATA;
      sServerListen: TSOCKET;
      localaddr, clientaddr : sockaddr_in;
      iSize, ListenPort: Integer;
      ServerIsActive: Boolean;
      UseUsDGRProt: Boolean;
      Terminated: Boolean;
      procedure Execute; override;
      procedure SetTCPClientCollection(const Value: TTCPClientCollection);
    public
      constructor Create(ServListenPort: Integer; UseUDP: Boolean=False);
      destructor Destroy;
      function CheckClients(SendMessages: TMessageCollection): TMessageCollection;
      function SetLoginThreadClientItem(ClientID: Integer; Login: String): Boolean;
      function GetClientItemIndexByDrNum(DrNum: Integer): Integer;
      function GetClientItemIndexByDrId(DrId: Integer): Integer;
      procedure deleteOldClientThreads(newClientID: Integer=-1; newDrNum: Integer=-1);
      function GetActiveClientItemIndexByClientId(ClientId: Integer): Integer;
      procedure ShowAcceptMsg;
      procedure ShowAcceptMaxConnCountDenyMsg;
      procedure ShowErrorMsg;
      procedure TestWinSockError(S:String);
      procedure ShowConnMsg;
      procedure ShowMemoStr;
      function TestFuncError
        (iErr:Integer; FuncName:String): Boolean;
      procedure ShowSendErr;

      wData : WSADATA;
    sServerListen: TSOCKET;
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
    published
      property TCPClientCollection: TTCPClientCollection read FTCPClientCollection
        write SetTCPClientCollection;
  end;

var
  sFullErr:String;
  MemoStr: String;

const
  APP_TO_SOCK_MEMO = 3;

implementation

uses RemoteControlUnit, ServerMainUnit;

procedure TSocketCoordinator.TestWinSockError(S:String);
var
 iErr:Integer;
begin

 iErr:=WSAGetLastError();
 sFullErr:='����������� ������ '+IntToStr(iErr);

 case iErr of
  WSANOTINITIALISED: sFullErr:='����� ������� ������� ������� WSASturtup, � ����� ��������� �����';
	WSAENETDOWN: sFullErr:='C���� ��������, ��������� ������� - ������ ������ ��� ����������� �� ���������';
	WSAEADDRINUSE: sFullErr:='��������� ����� ��� ������������';
	WSAEFAULT: sFullErr:='��������� name � namelen �� ������������� ��������� ���������. �������� namelen ����� ���� ������ ������������ ��������, � name ��������� ������������ ������';
	WSAEINPROGRESS: sFullErr:='����������� �������� � ����������� ������. �� ��� ��������� �� ���������� �����-�� ������� � ����� ��������� ���������� � ������';
	WSAEINVAL: sFullErr:='����� ��� ������ � �������';
	WSAENOBUFS: sFullErr:='������������ �������, ������� ����� ����������';
	WSAENOTSOCK: sFullErr:='�������� ���������� ������';
  WSAEISCONN: sFullErr:='����� ��� ���������';
  WSAEMFILE: sFullErr:='��� ������ ��������� ������������';
 end;

 sFullErr:=S+' '+sFullErr;
 Synchronize(ShowErrorMsg);
end;

function TSocketCoordinator.TestFuncError
  (iErr:Integer; FuncName:String): Boolean;
begin
 Result:=false;
 if iErr = SOCKET_ERROR then
  begin
   TestWinSockError(FuncName);
   Result:=true;
  end;
end;

constructor TSocketCoordinator.Create(ServListenPort: Integer; UseUDP: Boolean=False);
begin
  inherited Create(True);
  ServerIsActive:=False;
  Terminated:=False;
  FTCPClientCollection := TTCPClientCollection.Create(nil);

  ListenPort := ServListenPort;

  // �������� WinSock
  if WSAStartup(MAKEWORD(1,1), wData) <> 0 then
	  begin
      MessageBox(0, '�� ���� ��������� WinSock', '������', 0);
      Exit;
	  end;

  // �������� ������
  sServerListen := Socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
  if sServerListen = INVALID_SOCKET then
    begin
      MessageBox(0, '������ �������� ��������������� ������ �������', '������', 0);
      Exit;
    end;

  // ��������� ��������� ������
  localaddr.sin_addr.s_addr := htonl(INADDR_ANY);
  localaddr.sin_family := AF_INET;
  localaddr.sin_port := htons(ListenPort);

  //���������� ������ � ��������� �������
  if Bind(sServerListen, localaddr, sizeof(localaddr)) =
      SOCKET_ERROR then
    begin
      TestWinSockError('Bind');
      Exit;
    end;

  //�������������
  if TestFuncError(Listen(sServerListen, 4), 'Listen') then
    Exit;

  ServerIsActive:=True;
  Synchronize(ShowConnMsg);
end;

destructor TSocketCoordinator.Destroy;
begin
  ShutDown(sServerListen, SD_BOTH);
  CloseSocket(sServerListen);
  Terminated:=True;
  WSACleanup;
  FTCPClientCollection.Free;
  inherited Destroy;
end;

procedure TSocketCoordinator.SetTCPClientCollection(const Value: TTCPClientCollection);
begin
  //FTCPClientCollection
  FTCPClientCollection.Assign(Value);
end;

procedure TSocketCoordinator.ShowConnMsg;
begin
  RemoteControlForm.SocketLogMemo.Lines.Add(
    '������ �������! '+
    '����: '+IntToStr(ListenPort)+'.');
end;

procedure TSocketCoordinator.ShowMemoStr;
begin
  RemoteControlForm.SocketLogMemo.Lines.Add(
    MemoStr);
end;

procedure TSocketCoordinator.ShowErrorMsg;
begin
  RemoteControlForm.SocketLogMemo.Lines.Add(
    '������ � ������� - '+sFullErr);
end;

procedure TSocketCoordinator.ShowAcceptMsg;
begin
  RemoteControlForm.SocketLogMemo.Lines.
          Add('��������� ������!');
end;

procedure TSocketCoordinator.ShowSendErr;
begin
  RemoteControlForm.SocketLogMemo.Lines.
          Add('������ ������� ��������� ��������!');
end;

procedure TSocketCoordinator.ShowAcceptMaxConnCountDenyMsg;
begin
  RemoteControlForm.SocketLogMemo.Lines.
          Add('�������� �� ����. ����� ���������� ������!');
end;

procedure TSocketCoordinator.Execute;
var NewClientItem: TTCPClientCollectionItem;
    sClient : TSOCKET;
begin
  while (not Terminated) do
    begin
      try
      iSize := sizeof(clientaddr);
      //���� ������ ����������
      sClient := accept(sServerListen, @clientaddr, @iSize);
      if FTCPClientCollection.Count>=IniFile.ReadInteger
          ('BUSINESS_DATA',
          '����_�����_�������������_�����������',5) then
      begin
        try
          Shutdown(sClient, SD_Both);
          CloseSocket(sClient);
        except on E:Exception do
        end;
        Synchronize(ShowAcceptMaxConnCountDenyMsg);
      end
      else
      begin
        if sClient = INVALID_SOCKET then
          begin
            TestWinSockError('accept');
            Continue;
          end;
        //if (FTCPClientCollection<>nil) then
        Synchronize(ShowAcceptMsg);
        NewClientItem := FTCPClientCollection.Add;
        if IniFile.ReadString
          ('BUSINESS_DATA',
          '������������_�������������_������',
          'NO')='YES' then
          NewClientItem.CreateClientThread(sClient, True)
        else
          NewClientItem.CreateClientThread(sClient, False);
      end;
      except on E:Exception do
      end;
    end;
  //�������� �������������� �������
  Shutdown(sServerListen, SD_Both);
  CloseSocket(sServerListen);
end;

function TSocketCoordinator.CheckClients(SendMessages: TMessageCollection): TMessageCollection;
var client_count, i, j: Integer;
    InputJSONObject: TLkJSONObject;
    InputMSGCollection: TMessageCollection;
    InputMSGCollectionItem: TMessageCollectionItem;
    MSGClientID: Integer;
begin
  client_count:=FTCPClientCollection.Count;
  InputMSGCollection := TMessageCollection.Create();
  InputJSONObject := TLkJSONObject.Create();

  for i:=0 to SendMessages.Count-1 do
    begin
      MSGClientID:=SendMessages.Items[i].GetMessage().ClientID;

      for j:=0 to FTCPClientCollection.Count-1 do
        begin
          if FTCPClientCollection.Items[j].ClientID=MSGClientID then
          begin
            if not FTCPClientCollection.Items[j].GetTreadObject().ErrorClientSocket then
            begin
              if not FTCPClientCollection.Items[j].GetTreadObject().SendingNoComplete then
              begin
                if not FTCPClientCollection.Items[j].GetTreadObject().LastSendindNOHasASK then
                begin

                  if SendMsgCollection.Items[i].OnDeleted then
                  begin
                     SendMsgCollection.Items[i].
                      OnDeletedASKed := True;
                     Break;
                  end;

                  if FTCPClientCollection.
                    Items[j].GetTreadObject().
                    SendUTFString(
                    SendMessages.Items[i].
                    GetMessage().GetStrJSON()) then
                  begin
                    //������������� �������� ����������
                    //��� ��������� �������� �������
                    //������� �������� �� ���������� �
                    //�������� �� �������� ���������
                    SendMsgCollection.Items[i].OnDeleted:=
                      True;
                  end
                  else
                  begin
                    //������ ������� ��������� ��������
                    Synchronize(ShowSendErr);
                  end;

                end
                else
                begin
                  //��� ������������� ����������
                  //�������� � ����
                  MemoStr:=
                      '��� ������������� ����������'+
                      ' �������� � ���� ������� '+IntToStr(
                      FTCPClientCollection.Items[j].
                      ClientID);
                  Synchronize(ShowMemoStr);
                end;
                //����� ������� �� ���������� ������ ��������
              end
              else
              begin
                //��� ������������ ���-�� � ����
                MemoStr:=
                      '��� ������������ ���-��'+
                      ' � ���� ������� '+IntToStr(
                      FTCPClientCollection.Items[j].
                      ClientID);
                Synchronize(ShowMemoStr);
              end;

              //���� ������ ������� ������ ����� ������� �����-����
              Break;
            end
            else
            begin
              //������ � ������ ����
              //���� ������ �����
              MemoStr:=
                '������� ������������ ������ � ������ ��� �������� �������'+
                ' � ���� ������� '+IntToStr(
                FTCPClientCollection.Items[j].
                ClientID);
              Synchronize(ShowMemoStr);
            end;
          //����� ������� ���������� id ���������
          //���� � id ���������, ������� ��
          //����� �������� �������� ������� �� ����������
          end;
        //����� ����� �������� ��������
        end;

    end;

    deleteOldClientThreads;

    for j:=0 to FTCPClientCollection.Count-1 do
    begin
      if not FTCPClientCollection.Items[j].
      GetTreadObject().ErrorClientSocket or True then
      begin

        FTCPClientCollection.Items[j].StatusStr:=
          FTCPClientCollection.Items[j].GetTreadObject().StatusStr;

        if FTCPClientCollection.Items[j].GetTreadObject().InputDataStringList.Count>0 then
        begin
          for i:=0 to FTCPClientCollection.Items[j].GetTreadObject().InputDataStringList.Count-1 do
          begin
            MemoStr:='Data from client '+
              IntToStr(FTCPClientCollection.Items[j].ClientID)+
              ': '+FTCPClientCollection.Items[j].GetTreadObject().
              InputDataStringList.Strings[i];
            Synchronize(ShowMemoStr);

            try
              InputJSONObject :=  TLkJSON.ParseText(
                FTCPClientCollection.Items[j].GetTreadObject().
                InputDataStringList.Strings[i]) as TLkJSONObject;

              InputMSGCollectionItem:=
                InputMSGCollection.Add;
              InputMSGCollectionItem.MSGJSONObject:=
                InputJSONObject;
              InputMSGCollectionItem.ClientID:=
                FTCPClientCollection.Items[j].ClientID;
              InputMSGCollectionItem.Pozyvnoi:=
                FTCPClientCollection.Items[j].Pozyvnoi;
              InputMSGCollectionItem.DriverDBID:=
                FTCPClientCollection.Items[j].DriverDBID;

              if Pos('{"sync":"',FTCPClientCollection.
                Items[j].GetTreadObject().
                InputDataStringList.Strings[i])<>0 then
              begin
                InputMSGCollectionItem.itsSystemMessage:=True;
              end
              else
              begin
                
              end;

            except on E:Exception do
            begin
              MemoStr:=
                '��������� ������� JSON: '+E.Message;
              Synchronize(ShowMemoStr);
            end;  
            end;
          end;
          FTCPClientCollection.Items[j].GetTreadObject().
              InputDataStringList.Clear;
        end;

        if FTCPClientCollection.Items[j].GetTreadObject().ThreadMessagesStringList.Count>0 then
        begin
          for i:=0 to FTCPClientCollection.Items[j].GetTreadObject().ThreadMessagesStringList.Count-1 do
          begin
            MemoStr:='Message from client-thread '+
              IntToStr(FTCPClientCollection.Items[j].ClientID)+
              ': '+FTCPClientCollection.Items[j].GetTreadObject().
              ThreadMessagesStringList.Strings[i];
            Synchronize(ShowMemoStr);
          end;
          FTCPClientCollection.Items[j].GetTreadObject().
              ThreadMessagesStringList.Clear;
        end;

      end;
      //else
      if FTCPClientCollection.Items[j].
      GetTreadObject().ErrorClientSocket then
      begin
        //������ � ����, ����� ��!!!
        MemoStr:=
          '������� ������������ ��� �������� '+
          '�������� �������� �� ID ������� ������ � ������'+
          ' ���� ������� '+IntToStr(
          FTCPClientCollection.Items[j].
          ClientID);
        Synchronize(ShowMemoStr);
      end;
      //����� ����� ������ �����
    end;

   Result:=InputMSGCollection;

end;

function TSocketCoordinator.SetLoginThreadClientItem(ClientID: Integer; Login: String): Boolean;
var j: Integer;
    res: Boolean;
begin
  res:=False;
  for j:=0 to FTCPClientCollection.Count-1 do
    begin
      if FTCPClientCollection.Items[j].ClientID=ClientID then
      begin

        if not FTCPClientCollection.Items[j].GetTreadObject().ErrorClientSocket then
        begin
        FTCPClientCollection.Items[j].
          Autorized:=True;
        FTCPClientCollection.Items[j].
          Login:=Login;
        res:=True;
        end
        else
        begin
          MemoStr:=
            '������� ������������ ��� ��������� ���������� ����������� �� ID ������� ������ � ������'+
            ' ���� ������� '+IntToStr(
            FTCPClientCollection.Items[j].
            ClientID);
          Synchronize(ShowMemoStr);
        end;

      end;
    end;

end;

function TSocketCoordinator.GetClientItemIndexByDrNum(DrNum: Integer): Integer;
var res: Integer;
    j: Integer;
begin
  res:=-1;

  for j:=0 to FTCPClientCollection.Count-1 do
    begin
      if FTCPClientCollection.Items[j].Pozyvnoi=DrNum then
      begin
        if not FTCPClientCollection.Items[j].GetTreadObject().ErrorClientSocket then
        begin
          res:=j;
        end
        else
        begin
          MemoStr:=
            '������� ������������ ��� ������ ���� �� ��������� ������ � ������'+
            ' ���� ������� '+IntToStr(
            FTCPClientCollection.Items[j].
            ClientID);
          Synchronize(ShowMemoStr);
        end;
      end;
    end;

  Result:=res;
end;

function TSocketCoordinator.GetClientItemIndexByDrId(DrId: Integer): Integer;
var res: Integer;
    j: Integer;
begin
  res:=-1;

  for j:=0 to FTCPClientCollection.Count-1 do
    begin
      if FTCPClientCollection.Items[j].DriverDBID=DrId then
      begin
        if not FTCPClientCollection.Items[j].GetTreadObject().ErrorClientSocket then
        begin
          res:=j;
        end
        else
        begin
          MemoStr:=
            '������� ������������ ��� ������ ���� �� ��������� ������ � ������'+
            ' ���� ������� '+IntToStr(
            FTCPClientCollection.Items[j].
            ClientID);
          Synchronize(ShowMemoStr);
        end;
      end;
    end;

  Result:=res;
end;

function TSocketCoordinator.GetActiveClientItemIndexByClientId(ClientId: Integer): Integer;
var res: Integer;
    j: Integer;
begin
  res:=-1;

  for j:=0 to FTCPClientCollection.Count-1 do
    begin
      if FTCPClientCollection.Items[j].ClientID=ClientId then
      begin
        if not FTCPClientCollection.Items[j].GetTreadObject().ErrorClientSocket then
        begin
          res:=j;
        end
        else
        begin
          MemoStr:=
            '������� ������������ ��� ������'+
            ' ���� �� ID ������� ������� ������ � ������'+
            ' ���� ������� '+IntToStr(
            FTCPClientCollection.Items[j].
            ClientID);
          Synchronize(ShowMemoStr);
        end;
      end;
    end;

  Result:=res;
end;

procedure TSocketCoordinator.deleteOldClientThreads(newClientID: Integer=-1; newDrNum: Integer=-1);
var i: Integer;
    itsDeleting: Boolean;
begin

  if (FTCPClientCollection.Count>0) then
  begin
    itsDeleting:=True;
    while(itsDeleting) do
      begin
        itsDeleting:=False;
        for i:=0 to FTCPClientCollection.Count-1 do
          begin

            try

            if ((FTCPClientCollection.Items[i].Pozyvnoi=newDrNum)
              and (FTCPClientCollection.Items[i].
              ClientID<>newClientID) and (newDrNum>0) and
              (newClientID>0)) or FTCPClientCollection.
              Items[i].GetTreadObject.ErrorClientSocket
              then
              begin
                MemoStr:=
                '��������� �� ������������� ��� ��-�� '+
                '������ ������ ������ id='+IntToStr(FTCPClientCollection.
                Items[i].ClientID)+', �������� '+IntToStr(
                FTCPClientCollection.Items[i].Pozyvnoi);
                Synchronize(ShowMemoStr);

                FTCPClientCollection.Items[i].
                  GetTreadObject.Terminated:=True;
                FTCPClientCollection.Delete(i);

                itsDeleting:=True;
                Break;
              end;
              if not FTCPClientCollection.Items[i].Autorized then
                if ABS(SecondsBetween(FTCPClientCollection.
                  Items[i].AcceptDateTime, Today+Time))>20 then
              begin
                MemoStr:=
                '��������� ��-�� �������� �����������'+
                ' ������ id='+IntToStr(FTCPClientCollection.
                Items[i].ClientID);
                Synchronize(ShowMemoStr);

                FTCPClientCollection.Items[i].
                  GetTreadObject.Terminated:=True;
                FTCPClientCollection.Delete(i);

                itsDeleting:=True;
                Break;
              end;

            except
              MemoStr:=
                '����� �������� ����!';
              Synchronize(ShowMemoStr);
            end;
            
          end;
      end;

  end;
end;

end.