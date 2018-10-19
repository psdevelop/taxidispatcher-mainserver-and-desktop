unit TCPClientUnit;

interface

uses
  Classes, winsock, windows, dialogs, DateUtils, SysUtils;

type
  TCPClientThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
    Sock: TSOCKET;
    UseUsDGRProt: Boolean; 
    ClientID: Integer;
    SetR, SetE, SetRW: TFDSet;
    Timeout:PTimeVal;
    ExBeg: Boolean;
    BufSize, SNDBufSize : integer;
    BSize: integer;
    LastSendindNOHasASK: Boolean;
    SendingNoComplete: Boolean;
    CurrentReceivedPacket: Widestring;
    LastReceivedNoAccept: Boolean;
    LastReceivedComplete: Boolean;
    ErrorClientSocket: Boolean;
    Autorized: Boolean;
    UseNonBlockingMode: Boolean;
    //SendBufSection: TCriticalSection;
    Login: String;
    Password: String;
    StatusStr: String;
    InputDataStringList: TStringList;
    ThreadMessagesStringList: TStringList;
    WaitAsk, SendAsk: Boolean;
    Terminated: Boolean;
    useUTF8: Boolean;
    function SendUTFString(data: string;
		  itsSystemMessage: Boolean=False): Boolean;
    procedure TestWinSockError(S:String);
  end;

  const FTimeOutWrite = 60000;

implementation

{ TCPClientThread }

procedure TCPClientThread.TestWinSockError(S:String);
var
 iErr:Integer;
 sFullErr:String;
begin

 iErr:=WSAGetLastError();
 sFullErr:='Неизвестная ошибка'+IntToStr(iErr);

 case iErr of
  WSANOTINITIALISED: sFullErr:='Нужно сначала вызвать функцию WSASturtup, а потом создавать сокет';
	WSAENETDOWN: sFullErr:='Cвязь нарушена, возможные причины - отошёл кабель или отключились от Интернета';
	WSAEADDRINUSE: sFullErr:='Указанный адрес уже используется';
	WSAEFAULT: sFullErr:='Параметры name и namelen не соответствуют выбранной адресации. Параметр namelen может быть меньше необходимого значения, а name содержать некорректные данные';
	WSAEINPROGRESS: sFullErr:='Выполняется операция в блокирующем режиме. Вы уже запустили на выполнение какую-то функцию и нужно дождаться завершения её работы';
	WSAEINVAL: sFullErr:='Сокет уже связан с адресом';
	WSAENOBUFS: sFullErr:='Недостаточно буферов, слишком много соединений';
	WSAENOTSOCK: sFullErr:='Неверный дескриптор сокета';
  WSAEISCONN: sFullErr:='Сокет уже подключён';
  WSAEMFILE: sFullErr:='Нет больше доступных дескрипторов';
 end;

 ThreadMessagesStringList.Add('Ошибка в функции '+S+
    ' - '+sFullErr);
 StatusStr:='Ошибка в функции '+S+
    ' - '+sFullErr;
end;

procedure TCPClientThread.Execute;
var
 sRecvBuff: array of char;//[0..255] of char;
 sSendBuff: array of char;
 ret, rcv_size: Integer;
 s, SendStr, partial_in_str, modified_str, last_end_part: String;
 vSize : integer;
 Block:u_long;
 mode_succes: Boolean;
begin

 modified_str:='';
 last_end_part:='';
 LastSendindNOHasASK:=False;
 WaitAsk:=False;
 SendAsk:=False;
 useUTF8:=False;
 SendingNoComplete:=False;
 LastReceivedNoAccept:=True;
 LastReceivedComplete:=True;
 ErrorClientSocket:=False;
 CurrentReceivedPacket:='';
 ExBeg:=False;
 Terminated:=False;
 StatusStr:='Инициализация!';

 if setsockopt(sock, SOL_SOCKET, SO_RCVBUF, @BSize, Sizeof(BSize))<>0 then;
 if setsockopt(sock, SOL_SOCKET, SO_SNDBUF, @BSize, Sizeof(BSize))<>0 then;

 vSize := sizeOf(BufSize);
 GetSockOpt(sock,SOL_SOCKET,SO_RCVBUF,PAnsiChar(@BufSize),vSize);
 GetSockOpt(sock,SOL_SOCKET,SO_SNDBUF,PAnsiChar(@SNDBufSize),vSize);
 SetLength(sRecvBuff,BufSize);
 Timeout := New(PTimeVal);
 Timeout.tv_sec:=1;
 Timeout.tv_usec:=500000;
 InputDataStringList:=TStringList.Create;
 ThreadMessagesStringList:=TStringList.Create;

 ThreadMessagesStringList.Add('In '+
	IntToStr(BufSize)+': Out '+
	IntToStr(SNDBufSize));

 //Перевод в неблокирующий режим
 Block:=1;

 mode_succes:=True;
 if UseNonBlockingMode then
 begin
  if IOCtlSocket(Sock,FIONBIO,Block)=0 then
    begin
      mode_succes:=True;
      ThreadMessagesStringList.Add(
      'Сокет в неблокирующем режиме!');
      StatusStr:='Сокет в неблокирующем режиме!';
    end
  else
    mode_succes:=False;
 end
 else
   ThreadMessagesStringList.Add(
      'Сокет в блокирующем режиме!');

 if mode_succes then begin

 FD_Zero(SetE);
 FD_Set(Sock,SetE);
 FD_Zero(SetRW);
 FD_Set(Sock,SetRW);
 Select(Sock,nil,@SetRW,@SetE,nil);

 if not FD_IsSet(Sock,SetE) then
 //FD_IsSet(Sock,SetW) then
 begin

 //Цикл проверки входного буфера

 while not Terminated and not ErrorClientSocket do
 begin
   //Проверка размера данных во входном буфере
   //2 варианта
   //IOCtlSocket(Sock,FIONRead,rcv_size);
   StatusStr:='Запуск цикла!';
   FD_Zero(SetR);
   FD_Set(Sock,SetR);
   FD_Zero(SetE);
   FD_Set(Sock,SetE);
   Select(0,@SetR,nil,@SetE,nil);  //Timeout

   //Если входной буфер не пуст
   //if (rcv_size>0) then
   if FD_IsSet(Sock,SetE) then
   begin
	ThreadMessagesStringList.Add(
      'Ошибка сокета при считывании!');
      ErrorClientSocket:=True;
      StatusStr:='Ошибка сокета при считывании!';
	Break;
   end
   else
   if FD_IsSet(Sock,SetR) then
   begin
    StatusStr:='Проверяем входной буфер!';
    ret := Recv(Sock, sRecvBuff[0], BufSize, 0);
    //if not(ExBeg) then
    //begin
      //MessageBox(0, 'Ожидание', 'Внимание!!!', 0);
    //end;
    ExBeg := True;

    if (ret = 0) then
    begin
       //MessageBox(0, 'ret = 0!', 'Внимание!!!', 0);
       if UseNonBlockingMode then
       begin
        StatusStr:='Пустой входной буфер!';
        Continue;
       end
       else
       begin
         StatusStr:='Пустой входной буфер в блокирующем режиме! '+
            'Возможно клиент отключился!';
          //ExchangeError:=True;
          //ErrorClientSocket:=True;
          Break;
       end;
    end
    else
    begin

      if (ret = SOCKET_ERROR) then
      begin
        if WSAGetLastError<>WSAEWouldBlock then
        begin
          ThreadMessagesStringList.Add('Ошибка получения данных! '+
            'Возможно клиент отключился!');
          TestWinSockError('Data receiving!');
          StatusStr:='Ошибка получения данных! '+
            'Возможно клиент отключился!';
          //ExchangeError:=True;
          ErrorClientSocket:=True;
          Break;
        end
        else
        begin
          //Требуется блокирование так как переполнен
          //буфер передачи
          ThreadMessagesStringList.Add(
            'Требуется блокирование так как буфер '+
            'приема переполнен!');
          StatusStr:='Требуется блокирование так как буфер '+
            'приема переполнен!';
          Continue;
        end;
      end;

    end;


   end
   else
   begin
      //Нет данных во входном буфере
      //MessageBox(0, 'Нет данных во входном буфере!', 'Внимание!!!', 0);
      StatusStr:='Входной буфер не готов!';
      Continue;
   end;

   //s:=sRecvBuff;
   SetLength(s,ret+1);//(ret div 2+ret mod 2));
   lstrcpyn(@s[1],@sRecvBuff[0],ret+1);
   //
   if s[Length(s)]=#10 then
      s:=Copy(s, 1, Length(s)-1);

   //MessageBox(0, PChar('Получил '+s), 'Внимание!!!', 0);

   s:=last_end_part+s;
   partial_in_str:=s;
   last_end_part:=s;

   //last_end_part
   //
   //ThreadMessagesStringList.Add('---'+s);

   while (Pos('}',partial_in_str)<>0) do
   begin
      modified_str:=partial_in_str;

      if Pos('}',modified_str)<
        Length(modified_str) then
        Delete(modified_str,
            Pos('}',modified_str)+1,
            Length(modified_str)-
            Pos('}',modified_str));

      s:=Trim(modified_str);
      //ThreadMessagesStringList.Add('+++'+s);


      if Length(s)>0 then
      if Pos('"ask":"ok"}',s)<>0 then
      begin
        LastSendindNOHasASK:=False;
        ThreadMessagesStringList.Add('LastSendindHasASK');
      end
      else if Pos('{"sync":"',s)<>0 then
      begin
        InputDataStringList.Add(s);
      end
      else
      begin

        if Pos('"msg_end":"ok"}', s)<>0 then
          begin
            if LastReceivedComplete then
              InputDataStringList.Add(s)
            else
              InputDataStringList.Strings[
                InputDataStringList.Count-1]:=
                InputDataStringList.Strings[
                InputDataStringList.Count-1]+s;
            LastReceivedComplete:=True;
            if self.SendAsk then
              SendUTFString('{"ask":"ok"}', True);
          end
	      else
          begin
            if LastReceivedComplete then
              InputDataStringList.Add(s)
            else
              InputDataStringList.Strings[
                InputDataStringList.Count-1]:=
                InputDataStringList.Strings[
                InputDataStringList.Count-1]+s;
             // LastReceivedComplete:=False;
             if self.SendAsk then
                SendUTFString('{"ask":"ok"}', True);
          end;

      end;

      if Pos('}',partial_in_str)<
        Length(partial_in_str) then
        begin
          Delete(partial_in_str, 1,
            Pos('}',partial_in_str));

          last_end_part:=partial_in_str;

        end
       else
        begin
          last_end_part:='';
          Break;
        end; 
   end;
   //!!!Рассмотреть случай передачи несколькими итерациями цикла приема


  //Конец цикла
  end;

 end
 else if FD_IsSet(Sock,SetE) then
    begin
      // Соединиться не удалось
      ThreadMessagesStringList.Add(
      'Неудачное создание неблокирующего сокета!');
      StatusStr:=
        'Неудачное создание неблокирующего сокета!';
      ErrorClientSocket:=True;
    end
 else
    begin
      // Произошла ещё какая-то ошибка
      ThreadMessagesStringList.Add(
      'Неудачное создание неблокирующего сокета!');
      StatusStr:=
        'Еще какая-то ошибка! Неудачное создание неблокирующего сокета!';
      ErrorClientSocket:=True;
    end;
 //Конец условия с отработкой IOCtlSocket
 end
    else
    begin
      ThreadMessagesStringList.Add(
      'Неудачное создание неблокирующего сокета, метод IOCtlSocket!');
      StatusStr:=
        'Неудачное создание неблокирующего сокета, метод IOCtlSocket!';
      ErrorClientSocket:=True;
    end;

 //Перевод в блокирующий режим
 Block:=0;
 if UseNonBlockingMode then
  IOCtlSocket(Sock,FIONBIO,Block);

 Shutdown(Sock, SD_Both);
 CloseSocket(sock);
 ErrorClientSocket:=True;
end;

function TCPClientThread.SendUTFString(data: string; itsSystemMessage: Boolean=False): Boolean;
var SendStr: string;
    ret: Integer;
    res: Boolean;
    TimeVal: TTimeVal;
    SetW, SetWE: TFDSet;
    sendUTF8: UTF8String;
begin
  res:=False;
  if not SendingNoComplete then
    SendingNoComplete:=True;
  SendStr := data;
  //если SendStr больше BufSize то сообщение надо разбить
  //ret := Send(sock, sSendBuff[0], sizeof(sSendBuff), 0);
  ThreadMessagesStringList.Add(
      'Передаю: '+data);
  while True do
  begin
    
	if Sock=INVALID_SOCKET then
    begin
      ThreadMessagesStringList.Add(
        'INVALID_SOCKET');
      ErrorClientSocket:=True;
      Break;
    end;

    FD_Zero(SetWE);
	  FD_Set(Sock,SetWE);
	  FD_Zero(SetW);
    FD_Set(Sock,SetW);
    TimeVal.tv_sec:=FTimeOutWrite div 1000;
    TimeVal.tv_usec:=(FTimeOutWrite mod 1000)*1000;
    
  if Select(0,nil,@SetW,@SetWE,nil)=  //@TimeVal
      SOCKET_ERROR then
      begin
        ThreadMessagesStringList.Add(
        'INVALID_SOCKET_OF_SELECT');
        ErrorClientSocket:=True;
        Break;
      end;

  if FD_IsSet(Sock,SetWE) then
	begin
	ThreadMessagesStringList.Add(
      'Ошибка сокета при записи!');
      ErrorClientSocket:=True;
	Break;  
	end
	else
	//Если в выходном буфере есть место
    if FD_IsSet(Sock,SetW) then
    begin
      if (self.useUTF8) then
      begin
        sendUTF8 := AnsiToUtf8(SendStr+#13#10);
        ret := Send(sock,sendUTF8[1],Length(sendUTF8),0);
      end
      else
        ret := Send(sock,SendStr[1],Length(SendStr),0);//Length(SendStr),0);
      if (ret = SOCKET_ERROR) then
      begin
        if WSAGetLastError<>WSAEWouldBlock then
        begin
          ThreadMessagesStringList.Add(
            'Ошибка передачи данных');
          ErrorClientSocket:=True;
          Break;
        end
        else
        begin
          //Требуется блокирование так как переполнен
          //буфер передачи
          ThreadMessagesStringList.Add(
          'Требуется блокирование так как переполнен'+
            ' буфер передачи!');
          Continue;
        end;
      end
      //else if ret<Length(SendStr)*2 then
      //begin
      //  Continue;
      //end
      else
      begin
		    //Если переполнен буфер передачи
        if not itsSystemMessage then
          begin
            if self.WaitAsk then
            begin
              LastSendindNOHasASK:=True;
              ThreadMessagesStringList.Add('LastSendindNOHasASK');
            end;
          end;

        if (self.useUTF8) then
        begin
          if Length(sendUtf8)<ret then
          begin
            Delete(sendUtf8,1,ret);
            ThreadMessagesStringList.Add(
              'Переполнение исх. буфера (UTF8)!');
            Continue;
          end
          else
            begin
              res:=True;
              Break;
            end;
        end
		    else
        begin
          Delete(SendStr, 1, ret);
          if Length(SendStr)>0 then
          begin
            ThreadMessagesStringList.Add(
              'Переполнение исх. буфера (ANSI)!');
            Continue;
          end
          else
            begin
              res:=True;
              Break;
            end;
        end;
		  
      end;
    end
    else
    begin
      ThreadMessagesStringList.Add(
      'Выходной буфер не готов к считыванию!');
      Continue;
    end;

  
  end; //Конец цикла

  SendingNoComplete:=False;
  Result:=res;
end;

end.
