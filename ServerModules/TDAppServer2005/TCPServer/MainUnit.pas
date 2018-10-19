unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, winsock, TCPClientCollection, ExtCtrls;

type

  TForm1 = class(TForm)
    bStartServer: TButton;
    Memo1: TMemo;
    SocketCheckTimer: TTimer;
    procedure SocketCheckTimerTimer(Sender: TObject);
    procedure bStartServerClick(Sender: TObject);
  private
    { Private declarations }
  public
    SocketCoord: TSocketCoordinator;
    ServerActive: Boolean;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses MessageCollection;

{procedure TestWinSockError(S:String);
function TestFuncError(iErr:Integer; FuncName:String):Boolean;
begin
 Result:=false;
 if iErr = SOCKET_ERROR then
  begin
   TestWinSockError(FuncName);
   Result:=true;
  end;
end; }


procedure TForm1.bStartServerClick(Sender: TObject);
begin
  SocketCoord:=TSocketCoordinator.Create(5050);
  SocketCoord.Resume;
  ServerActive:=True;
end;

procedure TForm1.SocketCheckTimerTimer(Sender: TObject);
var MsgCollection: TMessageCollection;
begin
  if ServerActive then
  begin
    MsgCollection := TMessageCollection.Create();
    SocketCoord.CheckClients(MsgCollection);
  end;  
end;

end.
