program TDAppServer;

uses
  Forms,
  Dialogs,
  SysUtils,
  ServerMainUnit in 'ServerMainUnit.pas' {ServerMainForm},
  RemoteControlUnit in 'RemoteControl\RemoteControlUnit.pas' {RemoteControlForm},
  SMSSendUnit in 'SendSMS\SMSSendUnit.pas' {SmsSendForm},
  MessageCollection in 'TCPServer\MessageCollection.pas',
  uLkJSON in 'TCPServer\uLkJSON.pas',
  TCPClientUnit in 'TCPServer\TCPClientUnit.pas',
  TCPClientCollection in 'TCPServer\TCPClientCollection.pas',
  AMIClient in 'CallCentre\AMIClient.pas' {AMIClientForm},
  SimpleTCPUnit in 'CallCentre\SimpleTCPUnit.pas',
  AMIConnectUnit in 'CallCentre\AMIConnectUnit.pas';

{$R *.res}

begin
  try
  Application.Initialize;
  Application.Title := 'Сервер коммуникации "Таксопарк"';
  Application.CreateForm(TServerMainForm, ServerMainForm);
  Application.CreateForm(TRemoteControlForm, RemoteControlForm);
  Application.CreateForm(TSmsSendForm, SmsSendForm);
  Application.CreateForm(TAMIClientForm, AMIClientForm);
  try
  Application.Run;
  except on E: Exception do
   begin
    //ShowMessage('Системное сообщение, предусмотренное разработчиком. '+E.Message);
   end;
  end;
 except on E: Exception do
   begin
    //ShowMessage('Системное сообщение, предусмотренное разработчиком. '+E.Message);
   end;
  end;
end.
