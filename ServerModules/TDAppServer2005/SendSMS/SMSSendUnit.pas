unit SMSSendUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OoMisc, AdPort, ExtCtrls, ComCtrls, Grids, DBGrids,
  Buttons, DB, ADODB, DBClient, DateUtils, Menus;

type
  TSmsSendForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    DevOutMemo: TMemo;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    DevInMemo: TMemo;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    Splitter2: TSplitter;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    SMSSendedOrdersDS: TDataSource;
    SMSSendedADOQ: TADOQuery;
    SetSMSSendStateADOC: TADOCommand;
    GroupBox4: TGroupBox;
    Splitter3: TSplitter;
    StartedSMSStackDS: TDataSource;
    DBGrid2: TDBGrid;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    CallRobotsADOQuery: TADOQuery;
    procedure N1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CheckSMSSending;
    procedure CheckRobotCalling;
    function SendSMS(phone, send_text: string; order_id, dest_id: Integer;
      dest_mode: string; sale: Double=0; delivTime: Integer=0): Boolean;
  end;

var
  SmsSendForm: TSmsSendForm;
  hCommFile: Cardinal;
  SMSSendindIsActive: Boolean = False;
  RobotCallingIsActive: Boolean = False;

implementation

uses ServerMainUnit, RemoteControlUnit, AMIClient;

{$R *.dfm}

procedure TSmsSendForm.CheckRobotCalling;
var UPDATE_SQL_PART, phone_in_text: string;
begin
  if (not RobotCallingIsActive) then
  begin
  try
  RobotCallingIsActive := True;
  try
    CallRobotsADOQuery.Active:=False;
    CallRobotsADOQuery.Active:=True;
	ServerMainForm.ResetSelfAskAttr;
    if CallRobotsADOQuery.RecordCount>0 then
      begin
        CallRobotsADOQuery.First;
        while True do
          begin

			if (IniFile.ReadString('call_centre_settings', '������_�������_������_�����',
          'NO')='YES') or (IniFile.ReadString('call_centre_settings',
          '������_�������_������_�����', 'NO')='YES') or (IniFile.ReadString(
          'call_centre_settings', '������_�������_��_�����', 'NO')='YES')
          then
              begin
                ServerMainForm.WriteEvent('======'+IntToStr(CallRobotsADOQuery.FieldByName
                  ('CLIENT_CALL_STATE').AsInteger)+'=====������ �������');

                if ((CallRobotsADOQuery.FieldByName('CLIENT_CALL_STATE').AsInteger=1)
                  and (IniFile.ReadString('call_centre_settings', '������_�������_������_�����',
                  'NO')='YES')) then
                  begin
                    if AMIClientForm.sendAMICommand(CallRobotsADOQuery.
                      FieldByName('AMI_COMMAND').AsString) then
                      begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET CLIENT_CALL_STATE=2 '+
                            'WHERE BOLD_ID=' + IntToStr(CallRobotsADOQuery.
                            FieldByName('BOLD_ID').AsInteger),'��������� �������� ������� ����������!') then
                            begin
                                ServerMainForm.WriteEvent('�������� �������� ������� ���������� ��� �������!');
                            end;
                        end
                      else
                        begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET CLIENT_CALL_STATE=-1 '+
                            'WHERE BOLD_ID=' + IntToStr(CallRobotsADOQuery.
                            FieldByName('BOLD_ID').AsInteger), '��������� �������� ������ ������� ����������!') then
                            begin
                                ServerMainForm.WriteEvent('������ �������� ������� ���������� ��� �������!');
                            end;
                        end;
                      Break;
                  end
				        else if ((CallRobotsADOQuery.FieldByName('CLIENT_CALL_STATE').AsInteger=3)
                  and (IniFile.ReadString('call_centre_settings', '������_�������_������_�����',
                  'NO')='YES')) then
                  begin
                  end
                else if ((CallRobotsADOQuery.FieldByName('CLIENT_CALL_STATE').AsInteger=4)
                  and ((IniFile.ReadString('call_centre_settings', '������_�������_��_�����',
                  'NO')='YES') )) then
                  begin
                    if AMIClientForm.sendAMICommand(CallRobotsADOQuery.
                      FieldByName('AMI_ONPLACE_COMMAND').AsString) then
                      begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET CLIENT_CALL_STATE=2 '+
                            'WHERE BOLD_ID=' + IntToStr(CallRobotsADOQuery.
                            FieldByName('BOLD_ID').AsInteger), '��������� �������� ������� �� �����!') then
                            begin
                                ServerMainForm.WriteEvent('�������� �������� ������� �� ����� ��� �������!');
                            end;
                        end
                      else
                        begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET CLIENT_CALL_STATE=-1 '+
                            'WHERE BOLD_ID=' + IntToStr(CallRobotsADOQuery.
                              FieldByName('BOLD_ID').AsInteger),
                              '��������� �������� ������ ������� �� �����!') then
                            begin
                                ServerMainForm.WriteEvent('������ �������� ������� �� ����� ��� �������!');
                            end;
                        end;
                        Break;
                  end;

              end;

            if CallRobotsADOQuery.RecNo>=CallRobotsADOQuery.RecordCount then
              Break
            else
              CallRobotsADOQuery.Next;
          end;
         ServerMainForm.AskManipForAllUsersWithoutMe;
      end;
  except on E:Exception do
   begin
    ServerMainForm.WriteEvent('������ ���������� ������� ������' +
      ' ������� �� ������, ������: '+E.Message+'.');
   end;
  end;
  finally
    RobotCallingIsActive := False;

  end;
  end;

end;

procedure TSmsSendForm.CheckSMSSending;
var UPDATE_SQL_PART, phone_in_text: string;
begin
  if (not SMSSendindIsActive) then
  begin
  try
  SMSSendindIsActive := True;
  try
    SMSSendedADOQ.Active:=False;
    SMSSendedADOQ.Active:=True;
	ServerMainForm.ResetSelfAskAttr;
    if SMSSendedADOQ.RecordCount>0 then
      begin
        SMSSendedADOQ.First;
        while True do
          begin


            if ((SMSSendedADOQ.FieldByName('DRIVER_SMS_SEND_STATE').AsInteger=1)
            and (IniFile.ReadString('BUSINESS_DATA', '��������_SMS_��������_�����',
          'NO')='YES')) then
              begin

                      phone_in_text:=SMSSendedADOQ.FieldByName
                            ('Telefon_klienta').AsString;

                      if (Length(SMSSendedADOQ.FieldByName
                        ('Telefon_klienta').AsString)>5) then
                        begin
                          phone_in_text:='8'+SMSSendedADOQ.FieldByName
                            ('Telefon_klienta').AsString;
                        end;

                      if (Length(SMSSendedADOQ.FieldByName
                        ('Telefon_klienta').AsString)=5) then
                        begin
                          phone_in_text:='886133'+SMSSendedADOQ.FieldByName
                            ('Telefon_klienta').AsString;
                        end;

                      if IniFile.ReadString('BUSINESS_DATA',
                        '����������_�����_�������_���_�������_���������_��������',
                        'NO')<>'YES' then
                          phone_in_text:=''
                      else
                          phone_in_text:=phone_in_text+':';

                      ServerMainForm.WriteEvent('������ � ����, ������� ��� ��������'+
                        SMSSendedADOQ.FieldByName
                        ('SMS_SEND_DRNUM').AsString+', ���������: '+phone_in_text+
                        SMSSendedADOQ.FieldByName
                        ('Adres_vyzova_vvodim').AsString);

                      if SendSMS(SMSSendedADOQ.FieldByName
                        ('SMS_SEND_DRNUM').AsString,
                        phone_in_text+
                        SMSSendedADOQ.FieldByName
                        ('Adres_vyzova_vvodim').AsString,
                        SMSSendedADOQ.
                            FieldByName('BOLD_ID').AsInteger,
                        SMSSendedADOQ.
                            FieldByName('Pozyvnoi_ustan').AsInteger,
                            'driver') then
                        begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET DRIVER_SMS_SEND_STATE=2 '+
                            'WHERE BOLD_ID='+
                            IntToStr(SMSSendedADOQ.
                            FieldByName('BOLD_ID').AsInteger),'��������� �������� �������� � ����������!') then
                            begin
                                ServerMainForm.WriteEvent('������ ��������� �������� �������� � ���������� SMS ��� ��������!');
                            end;
                        end
                      else
                        begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET DRIVER_SMS_SEND_STATE=-1 '+
                            'WHERE BOLD_ID='+
                            IntToStr(SMSSendedADOQ.
                            FieldByName('BOLD_ID').AsInteger),'��������� �������� ������ �������� � ����������!') then
                            begin
                                ServerMainForm.WriteEvent('������ ��������� �������� ������ �������� � ���������� SMS ��� ��������!');
                            end;
                        end;

              end;

			if ((SMSSendedADOQ.FieldByName('CLIENT_SMS_SEND_STATE').AsInteger=1)
      and (IniFile.ReadString('BUSINESS_DATA', '��������_SMS_������_�����',
          'NO')='YES')) or
				((SMSSendedADOQ.FieldByName('CLIENT_SMS_SEND_STATE').AsInteger=3)
        and (IniFile.ReadString('BUSINESS_DATA', '��������_������_������_�����',
          'NO')='YES'))
          or ((SMSSendedADOQ.FieldByName('CLIENT_SMS_SEND_STATE').AsInteger=4)
          and (IniFile.ReadString('BUSINESS_DATA', '��������_���������_��_�����',
          'NO')='YES')) then
              begin
                ServerMainForm.WriteEvent('======'+IntToStr(SMSSendedADOQ.FieldByName
                  ('CLIENT_SMS_SEND_STATE').AsInteger)+'====='+
                  IniFile.ReadString('call_centre_settings', '����������_�������_��������_������_���',
                  'NO'));

                if ((SMSSendedADOQ.FieldByName('CLIENT_SMS_SEND_STATE').AsInteger=1)
                  and ((IniFile.ReadString('call_centre_settings', '����������_�������_��������_������_���',
                  'NO')='YES') or (IniFile.ReadString('call_centre_settings', '����������_�������_��������_�����e_c_���',
                  'NO')='YES'))) then
                  begin
                    if AMIClientForm.sendAMICommand(SMSSendedADOQ.
                      FieldByName('AMI_COMMAND').AsString) then
                      begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET CLIENT_SMS_SEND_STATE=2 '+
                            'WHERE BOLD_ID='+
                            IntToStr(SMSSendedADOQ.
                            FieldByName('BOLD_ID').AsInteger),'��������� �������� ������� ����������!') then
                            begin
                                ServerMainForm.WriteEvent('�������� �������� ������� ���������� ��� �������!');
                            end;
                        end
                      else
                        begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET CLIENT_SMS_SEND_STATE=-1 '+
                            'WHERE BOLD_ID='+
                            IntToStr(SMSSendedADOQ.
                            FieldByName('BOLD_ID').AsInteger),'��������� �������� ������ ������� ����������!') then
                            begin
                                ServerMainForm.WriteEvent('������ �������� ������� ���������� ��� �������!');
                            end;
                        end;
                      Break;
                  end
				        else if ((SMSSendedADOQ.FieldByName('CLIENT_SMS_SEND_STATE').AsInteger=3)
                  and ((IniFile.ReadString('call_centre_settings', '����������_�������_�����_������_���',
                  'NO')='YES') or (IniFile.ReadString('call_centre_settings', '����������_�������_�����_������_�_���',
                  'NO')='YES'))) then
                  begin
                  end
                else if ((SMSSendedADOQ.FieldByName('CLIENT_SMS_SEND_STATE').AsInteger=4)
                  and ((IniFile.ReadString('call_centre_settings', '����������_�������_��_�����_������_���',
                  'NO')='YES') )) then
                  begin
                    if AMIClientForm.sendAMICommand(SMSSendedADOQ.
                      FieldByName('AMI_ONPLACE_COMMAND').AsString) then
                      begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET CLIENT_SMS_SEND_STATE=2 '+
                            'WHERE BOLD_ID='+
                            IntToStr(SMSSendedADOQ.
                            FieldByName('BOLD_ID').AsInteger),'��������� �������� ������� �� �����!') then
                            begin
                                ServerMainForm.WriteEvent('�������� �������� ������� �� ����� ��� �������!');
                            end;
                        end
                      else
                        begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET CLIENT_SMS_SEND_STATE=-1 '+
                            'WHERE BOLD_ID='+
                            IntToStr(SMSSendedADOQ.
                            FieldByName('BOLD_ID').AsInteger),'��������� �������� ������ ������� �� �����!') then
                            begin
                                ServerMainForm.WriteEvent('������ �������� ������� �� ����� ��� �������!');
                            end;
                        end;
                        Break;
                  end;

                if not ((SMSSendedADOQ.FieldByName('CLIENT_SMS_SEND_STATE').AsInteger=1)
                  and (IniFile.ReadString('call_centre_settings', '����������_�������_��������_������_���',
                  'NO')='YES')) and
                  not ((SMSSendedADOQ.FieldByName('CLIENT_SMS_SEND_STATE').AsInteger=3)
                  and (IniFile.ReadString('call_centre_settings', '����������_�������_�����_������_���',
                  'NO')='YES')) and
                  not (SMSSendedADOQ.FieldByName('CLIENT_SMS_SEND_STATE').AsInteger=4) then
                  begin
                      phone_in_text:=SMSSendedADOQ.FieldByName
                            ('Telefon_klienta').AsString;

                      //if (Length(SMSSendedADOQ.FieldByName
                      //  ('Telefon_klienta').AsString)=10) then
                      //  begin
                      //    phone_in_text:='8'+SMSSendedADOQ.FieldByName
                      //      ('Telefon_klienta').AsString;
                      //  end;

                      //if (Length(SMSSendedADOQ.FieldByName
                      //  ('Telefon_klienta').AsString)=5) then
                      //  begin
                      //    phone_in_text:='886133'+SMSSendedADOQ.FieldByName
                      //      ('Telefon_klienta').AsString;
                      //  end;

                      if Length(phone_in_text) >= 5 then
                      begin

                      ServerMainForm.WriteEvent('������ � ����, ������� ��� �������'+
                        phone_in_text+', ���������: '+SMSSendedADOQ.FieldByName
                        ('CLIENT_ORDER_INFO').AsString);

                      if SendSMS(phone_in_text,
                        SMSSendedADOQ.FieldByName
                        ('CLIENT_ORDER_INFO').AsString,
                        SMSSendedADOQ.
                            FieldByName('BOLD_ID').AsInteger,
                        SMSSendedADOQ.
                            FieldByName('Pozyvnoi_ustan').AsInteger,
                            'client',
                            SMSSendedADOQ.
                            FieldByName('Uslovn_stoim').AsFloat,
                        SMSSendedADOQ.
                            FieldByName('WAITING').AsInteger) then
                        begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET CLIENT_SMS_SEND_STATE=2 '+
                            'WHERE BOLD_ID='+
                            IntToStr(SMSSendedADOQ.
                            FieldByName('BOLD_ID').AsInteger),'��������� �������� ��������!') then
                            begin
                                ServerMainForm.WriteEvent('�������� �������� SMS ��� �������!');
                            end;
                        end
                      else
                        begin
                          if not ServerMainForm.SendLocalSQL('UPDATE Zakaz SET CLIENT_SMS_SEND_STATE=-1 '+
                            'WHERE BOLD_ID='+
                            IntToStr(SMSSendedADOQ.
                            FieldByName('BOLD_ID').AsInteger),'��������� �������� ������ ��������!') then
                            begin
                                ServerMainForm.WriteEvent('������ �������� SMS ��� �������!');
                            end;
                        end;

                      end;

                    end;

              end;

			//else
            //  begin
            //  end;

            if SMSSendedADOQ.RecNo>=SMSSendedADOQ.RecordCount then
              Break
            else
              SMSSendedADOQ.Next;
          end;
         ServerMainForm.AskManipForAllUsersWithoutMe;
      end;
  except on E:Exception do
   begin
    ServerMainForm.WriteEvent('������ ���������� ������� ������ SMS �� ��������, ������: '+E.Message+'.');
   end;
  end;
  finally
    SMSSendindIsActive := False;
	
  end;
  end;

end;

function ucs2(s: string): string;
var i,k: integer;
begin
 for i:=1 to length(s) do begin
  k:= ord(s[i]);
  if k>=192 then k:= k + 1040 - 192;
  result:= result + inttohex(k,4)
 end
end;

function Encode7bit(Src:String):String;
var Dst:String;
    i:Integer;
    CurS,NextS:Byte;
    TStr:String;
begin
  for i:=1 to Length(Src) do begin
    if (i mod 8)=0 then Continue;
    TStr:=Copy(Src,i,1);
    CurS:=Ord(TStr[1]);
    if (i mod 8)>1 then
      CurS:=(CurS shr ((i mod 8)-1) );
    if i<Length(Src) then begin
      TStr:=Copy(Src,i+1,1);
      NextS:=Ord(TStr[1]);
    end else
      NextS:=0;
    NextS:=(NextS shl (8-(i mod 8)));
    Dst:=Dst+IntToHex(CurS+NextS,2);
  end;
  Result:=Dst;
end;

function TSmsSendForm.SendSMS(phone, send_text: string; order_id, dest_id: Integer; dest_mode: string; sale: Double=0; delivTime: Integer=0): Boolean;
var
  res: Boolean;
  nTel, msg_text, hex_code: string;
  NumberWritten: cardinal;
  nmes,tel, m:string;
  h:THandle;
  lngt, i:integer;
begin

  if DevInMemo.Lines.Count>500 then
    DevInMemo.Clear;

  res:=True;

  if (IniFile.ReadString('BUSINESS_DATA',
    '����������_���_��_��������_������','NO')='YES') or
    (IniFile.ReadString('BUSINESS_DATA',
    '����������_���_��_Java_����������','NO')='YES') then
  begin

      res:=RemoteControlForm.SendTextMessage(
        dest_id, send_text, phone, dest_mode, sale, delivTime);
      if res then
        ServerMainForm.WriteEvent('��������� ��������� ����������!')
      else
        ServerMainForm.WriteEvent('������ �������� ���������� ���������!');
  end;
  Result:=res;
end;

procedure TSmsSendForm.Button1Click(Sender: TObject);
begin
  SendSMS('7'+Edit1.Text, Edit2.Text, -1, 1,'driver');
end;

procedure TSmsSendForm.N1Click(Sender: TObject);
begin
  //ServerMainForm.IdIMAP4Yandex.Connect();
  //ServerMainForm.IdIMAP4Yandex.CheckMailBox;
end;

end.
