unit SectorEnumsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BoldGrid, ExtCtrls, StdCtrls, Buttons, DBCtrls, DBGrids,
  ShellAPI;

type
  TSectorEnumForm = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    DBGrid7: TDBGrid;
    DBNavigator2: TDBNavigator;
    Splitter2: TSplitter;
    DBGrid1: TDBGrid;
    BitBtn12: TBitBtn;
    procedure BitBtn12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SectorEnumForm: TSectorEnumForm;
  hasSectorIns: Boolean = False;

implementation

{$R *.dfm}

uses HandlesDM, BoldOtherHandlCompUnit, ModelDM, MainForm, ADODMUnit,
  PrSettingsFormUnit;

procedure TSectorEnumForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BoldModelDM.BoldUpdateDBAction1.Execute;
  if hasSectorIns then
  begin
    ShowMessage('������������� ���������� ����� ���������� ��������!!');
    FirstForm.Close;
  end;
end;

procedure TSectorEnumForm.FormShow(Sender: TObject);
begin
  hasSectorIns:=False;
  ADOConnectDM.SectorsADODS.Active := False;
  ADOConnectDM.SectorsADODS.Active := True;
  ADOConnectDM.SectorsCoordsADOT.Active := False;
  ADOConnectDM.SectorsCoordsADOT.Active := True;
  ADOConnectDM.DistrictCompaniesADODS.Active := False;
  ADOConnectDM.DistrictCompaniesADODS.Active := True;
end;

procedure TSectorEnumForm.BitBtn1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  hasSectorIns:=True;
end;

procedure TSectorEnumForm.Button1Click(Sender: TObject);
begin
  if ADOConnectDM.SectorsADODS.Active then
  begin
    if ADOConnectDM.SectorsADODS.RecordCount <75 then
    begin
      BoldHandlesDM.BoldListHandleAddNewActionAllWorkSector.Execute;
      BoldModelDM.BoldUpdateDBAction1.Execute;
      hasSectorIns:=True;
      ADOConnectDM.SectorsADODS.Active := False;
      ADOConnectDM.SectorsADODS.Active := True;
      ADOConnectDM.SectorsCoordsADOT.Active := False;
      ADOConnectDM.SectorsCoordsADOT.Active := True;
    end
    else begin
      ShowMessage('� ������ ������ ��������� ���������' +
        ' �� ����� 75 ��������!');
    end;
  end;
end;

procedure TSectorEnumForm.BitBtn12Click(Sender: TObject);
begin
  ShellExecute(SectorEnumForm.Handle, 'open',
    PAnsiChar(IniFile.ReadString('BUSINESS_DATA',
    '�����_�������_���������_����_������',
    'http://psdevelop.ru/gmap_constructor.html')), nil, nil, SW_NORMAL);
end;

end.
