unit SystemEnumsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, Grids, BoldGrid, ExtCtrls, StdCtrls, Buttons,
  BoldSubscription, BoldHandles, BoldRootedHandles, BoldAbstractListHandle,
  BoldCursorHandle, BoldListHandle, BoldListActions, BoldHandleAction, DB,
  DBGrids, DBActns, BoldDerivedHandle, DBCtrls, ComCtrls;

type
  TSystemEnumsForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    AdrPhoneRelDBGrid: TDBGrid;
    Panel4: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel7: TPanel;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    Panel5: TPanel;
    ActionList1: TActionList;
    BoldListHandleAddNewAction1: TBoldListHandleAddNewAction;
    BoldListHandleDeleteAction1: TBoldListHandleDeleteAction;
    ActionList2: TActionList;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSource1: TDataSource;
    Panel8: TPanel;
    BitBtn6: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    ActionList3: TActionList;
    CheckBox4: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    INumDelBitBtn: TBitBtn;
    INDelete: TDataSetDelete;
    TabSheet3: TTabSheet;
    Panel9: TPanel;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    DataSource3: TDataSource;
    DBGrid2: TDBGrid;
    DataSetDelete2: TDataSetDelete;
    DataSetPost1: TDataSetPost;
    BitBtn1: TBitBtn;
    DBGrid3: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure INumDelBitBtnClick(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RefreshINumSearch;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SystemEnumsForm: TSystemEnumsForm;

implementation

{$R *.dfm}

uses ModelDM, HandlesDM, ADODMUnit, BusinessClasses, IndividNumSetUnit,
     ImageLists;

procedure TSystemEnumsForm.FormShow(Sender: TObject);
begin

  ADOConnectDM.DistrictCompaniesADODS.Active := False;
  ADOConnectDM.DistrictCompaniesADODS.Active := True;

  ADOConnectDM.DistrictSectorsADODS.Active := False;
  ADOConnectDM.DistrictSectorsADODS.Active := True;

  ADOConnectDM.DistrictsADOT.Active := False;
  ADOConnectDM.DistrictsADOT.Active := True;

  BoldModelDM.AdrPhoneRelatingADOTable.Active:=False;
if not BoldModelDM.AdrPhoneRelatingADOTable.Active then
  BoldModelDM.AdrPhoneRelatingADOTable.Active:=True;
  try
    if not BoldModelDM.IndividPersonsADOQuery.Active then
      BoldModelDM.IndividPersonsADOQuery.Active:=True;
  except
    ShowMessage('Неадачная активизация таблицы абонентских номеров!');
  end;

  try
    BoldModelDM.BadPhoneRelADOTable.Active:=False;
    if not BoldModelDM.BadPhoneRelADOTable.Active then
      BoldModelDM.BadPhoneRelADOTable.Active:=True;
  except
    ShowMessage('Неадачная активация BadPhoneRelADOTable!');
  end;
end;

procedure TSystemEnumsForm.CheckBox3Click(Sender: TObject);
begin
  BoldModelDM.AdrPhoneRelatingADOTable.Sort:='';

  if CheckBox1.Checked then
      BoldModelDM.AdrPhoneRelatingADOTable.Sort:=
        BoldModelDM.AdrPhoneRelatingADOTable.Sort+
        'Adres_vyzova_vvodim ASC';

  if CheckBox2.Checked then
    if CheckBox1.Checked then
      BoldModelDM.AdrPhoneRelatingADOTable.Sort:=
        BoldModelDM.AdrPhoneRelatingADOTable.Sort+
        ' ,Telefon_klienta ASC'
    else
      BoldModelDM.AdrPhoneRelatingADOTable.Sort:=
        BoldModelDM.AdrPhoneRelatingADOTable.Sort+
        'Telefon_klienta ASC';

  if CheckBox3.Checked then
    if CheckBox2.Checked or CheckBox1.Checked then
      BoldModelDM.AdrPhoneRelatingADOTable.Sort:=
        BoldModelDM.AdrPhoneRelatingADOTable.Sort+
        ' ,Summarn_chislo_vyzovov DESC'
    else
      BoldModelDM.AdrPhoneRelatingADOTable.Sort:=
        BoldModelDM.AdrPhoneRelatingADOTable.Sort+
        'Summarn_chislo_vyzovov DESC';
end;

procedure TSystemEnumsForm.BitBtn6Click(Sender: TObject);
var bel: TPersona;
begin
  if BoldModelDM.bsh.Active then
    begin
     UseIndividParam:=False;
     SelectNewNumMode:=True;
     SetIndividNumForm.ShowModal;

     if UseIndividParam then
     begin
      bel:=TPersona.Create(nil);
      bel.Elektronnyi_adres:='Индивидуальный клиент';
      bel.Korpus:=NewINumber;
      UseIndividParam:=False;
      BoldModelDM.bsh.UpdateDatabase;
      BoldModelDM.IndividPersonsADOQuery.Active:=False;
      BoldModelDM.IndividPersonsADOQuery.Active:=True;
     end;

    end;
end;

procedure TSystemEnumsForm.CheckBox4Click(Sender: TObject);
begin
  if not CheckBox4.Checked then
    begin
      BoldModelDM.IndividPersonsADOQuery.Active:=False;
      BoldModelDM.IndividPersonsADOQuery.Active:=True;
      BoldModelDM.IndividPersonsADOQuery.Sort:=
        'Korpus ASC';
    end
  else
    begin
      BoldModelDM.IndividPersonsADOQuery.Active:=False;
      BoldModelDM.IndividPersonsADOQuery.Active:=True;
      BoldModelDM.IndividPersonsADOQuery.Sort:=
        'Familiya ASC';
    end;
end;

procedure TSystemEnumsForm.INumDelBitBtnClick(Sender: TObject);
begin
  if BoldModelDM.IndividPersonsADOQuery.Active then
    if MessageDlg('Вы точно уверены в удалении аб. номера. это действие. возможно, создаст несхождения в отчетах и будет учтено в журнале?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
      BoldModelDM.IndividPersonsADOQuery.Delete;
end;

procedure TSystemEnumsForm.Edit1Change(Sender: TObject);
begin
  RefreshINumSearch;
end;

procedure TSystemEnumsForm.RefreshINumSearch;
var where_sql: string;
begin
  BoldModelDM.IndividPersonsADOQuery.Active:=False;

  where_sql:='';
  if (Edit1.Text<>'') then
     where_sql:=where_sql+' AND (Familiya LIKE '''+Edit1.Text+'%'')';
  if (Edit2.Text<>'') then
     where_sql:=where_sql+' AND (Imya LIKE '''+Edit2.Text+'%'')';

  BoldModelDM.IndividPersonsADOQuery.SQL.Text:=
    'select * from Persona where'+
    ' (Elektronnyi_adres=''Индивидуальный клиент'') '+
    where_sql;

  try
    BoldModelDM.IndividPersonsADOQuery.Active:=True;
  except
    ShowMessage('Неудачное обновление таблицы аб. справочника!');
  end;

end;

procedure TSystemEnumsForm.Edit2Change(Sender: TObject);
begin
  RefreshINumSearch;
end;

procedure TSystemEnumsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BoldModelDM.BoldUpdateDBAction1.Execute;

  //ADOConnectDM.DistrictsADOT.Post;

  ADOConnectDM.DistrictsADODS.Active := False;
  ADOConnectDM.DistrictsADODS.Active := True;
end;

end.
