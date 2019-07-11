unit RemoteCtrlAdmUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TRemoteCtrlAdmForm = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn14: TBitBtn;
    procedure BitBtn14Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RemoteCtrlAdmForm: TRemoteCtrlAdmForm;

implementation

uses ADODMUnit, ModelDM, BusinessClasses, BoldElements;

{$R *.dfm}

procedure DrawGridCheckBox(Canvas: TCanvas; Rect: TRect; Checked: boolean);
var
  DrawFlags: Integer;
begin
  Canvas.TextRect(Rect, Rect.Left + 1, Rect.Top + 1, ' ');
  DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DFCS_BUTTONPUSH or DFCS_ADJUSTRECT);
  DrawFlags := DFCS_BUTTONCHECK or DFCS_ADJUSTRECT;// DFCS_BUTTONCHECK
  if Checked then
    DrawFlags := DrawFlags or DFCS_CHECKED;
  DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DrawFlags);
end;

procedure TRemoteCtrlAdmForm.FormShow(Sender: TObject);
begin

  ADOConnectDM.DrGroupsADODS.Active:=False;
  try
    ADOConnectDM.DrGroupsADODS.Active:=True;
  except on E:Exception do
    ShowMessage('��������� ����������'+
      ' ������� ����� ���������!'+
      E.Message);
  end;

  ADOConnectDM.RemoteCtrlAdmADOT.Active:=False;
  try
    ADOConnectDM.RemoteCtrlAdmADOT.Active:=True;
    ADOConnectDM.RemoteCtrlAdmADOT.
      Properties['Unique Table'].Value:='Voditelj';
  except on E:Exception do
    ShowMessage('��������� ����������'+
      ' ������� ������ �����������������'+
      ' ���������� �������! '+E.Message);
  end;
end;

procedure TRemoteCtrlAdmForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  try
    ADOConnectDM.RemoteCtrlAdmADOT.Post;
  except
  end;
end;

procedure TRemoteCtrlAdmForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Column.FieldName = 'fix_order_pay_with_daily_pay') or
  (Column.FieldName = 'ITS_REMOTE_CLIENT') or
  (Column.FieldName =  'EN_MOVING') or (Column.FieldName =  'use_dyn_balance')
    or (Column.FieldName =  'rlock_on_calc_debt') or (Column.FieldName =  'USE_GPS')
    or (Column.FieldName =  'is_our') or (Column.FieldName =  'manual_day_sale') or (Column.FieldName =  'require_gps') then // ������������� ��� ����
    if Column.Field.AsInteger > 0 then
      DrawGridCheckBox(DBGrid1.Canvas, Rect, true)
    else
      DrawGridCheckBox(DBGrid1.Canvas, Rect, false)
end;

procedure TRemoteCtrlAdmForm.DBGrid1ColEnter(Sender: TObject);
begin
  with TDBGrid(Sender) do
    if (SelectedField.FieldName = 'fix_order_pay_with_daily_pay') or
  (SelectedField.FieldName = 'ITS_REMOTE_CLIENT') or
  (SelectedField.FieldName =  'EN_MOVING') or (SelectedField.FieldName =  'use_dyn_balance')
    or (SelectedField.FieldName =  'rlock_on_calc_debt') or (SelectedField.FieldName =  'USE_GPS')
    or (SelectedField.FieldName =  'is_our') or (SelectedField.FieldName =  'manual_day_sale') or (SelectedField.FieldName =  'require_gps') then // ������������� ��� ����
      Options := Options - [dgEditing]
    else
      Options := Options + [dgEditing]
end;

procedure TRemoteCtrlAdmForm.DBGrid1DblClick(Sender: TObject);
begin
   //if DispDBGrid.SelectedField.FieldName <> 'Adres_vyzova_vvodim' then
   //ShowMessage(DBGrid1.SelectedField.FieldName);
end;

procedure TRemoteCtrlAdmForm.DBGrid1CellClick(Column: TColumn);
var fname: String;
begin
   fname:=DBGrid1.SelectedField.FieldName;
   if (fname =  'EN_MOVING') or (fname =  'ITS_REMOTE_CLIENT')
   or (fname =  'use_dyn_balance')
    or (fname =  'rlock_on_calc_debt') or (fname =  'USE_GPS')
    or (fname =  'is_our') or (fname =  'manual_day_sale') or (fname =  'require_gps') then
   begin
    if ADOConnectDM.RemoteCtrlAdmADOT.FieldByName(fname).AsInteger=0 then
    begin
    ADOConnectDM.RemoteCtrlAdmADOT.Edit;
    ADOConnectDM.RemoteCtrlAdmADOT.FieldByName(fname).Value:=1;
    end
    else
    begin
    ADOConnectDM.RemoteCtrlAdmADOT.Edit;
    ADOConnectDM.RemoteCtrlAdmADOT.FieldByName(fname).Value:=0;
    end;
    ADOConnectDM.RemoteCtrlAdmADOT.Post;
    end;
end;

procedure TRemoteCtrlAdmForm.BitBtn14Click(Sender: TObject);
var TmpBE: TBoldElement;
begin
  TmpBE:=TVoditelj.Create(nil,True);
  (TmpBE as TVoditelj).Pozyvnoi:=0;
  BoldModelDM.BoldUpdateDBAction1.Execute;

  ADOConnectDM.RemoteCtrlAdmADOT.Active:=False;
  try
    ADOConnectDM.RemoteCtrlAdmADOT.Active:=True;
    ADOConnectDM.RemoteCtrlAdmADOT.
      Properties['Unique Table'].Value:='Voditelj';
  except on E:Exception do
    ShowMessage('��������� ����������'+
      ' ������� ������ �����������������'+
      ' ���������� �������! '+E.Message);
  end;
end;

end.
