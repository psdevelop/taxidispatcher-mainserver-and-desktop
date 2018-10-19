unit EmptyConnectionUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, ComCtrls, ExtCtrls,
  Grids, DBGrids, DB, DBClient, ModelDM, ADODB, StdCtrls,
  Buttons;

type
  TEmptyConnForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    RestoredDBGrid: TDBGrid;
    RecoveryOrderDS: TDataSource;
    RecoveryOrderCDS: TClientDataSet;
    CDSOpenDialog: TOpenDialog;
    RecoveryOrderADOSP: TADOStoredProc;
    BitBtn1: TBitBtn;
    RecoveryOrdADOQ: TADOQuery;
    BitBtn2: TBitBtn;
    RestoreMemo: TMemo;
    Splitter1: TSplitter;
    Label1: TLabel;
    TabSheet2: TTabSheet;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmptyConnForm: TEmptyConnForm;

implementation

uses ADODMUnit;

{$R *.dfm}

procedure TEmptyConnForm.FormShow(Sender: TObject);
begin
if not BoldModelDM.ADOConnection.Connected then
  BoldModelDM.ADOConnection.Connected:=True;
end;

procedure TEmptyConnForm.BitBtn1Click(Sender: TObject);
begin
  if CDSOpenDialog.Execute then
    RecoveryOrdADOQ.LoadFromFile(CDSOpenDialog.FileName);
end;

procedure TEmptyConnForm.BitBtn2Click(Sender: TObject);
var order_id, restore_crash: Integer;
    err_msg: string;
begin
  if RecoveryOrdADOQ.Active then
  begin
    if RecoveryOrdADOQ.RecordCount>0 then
    begin
      RecoveryOrdADOQ.First;
      while not RecoveryOrdADOQ.Eof do
      begin
        Label1.Caption:= IntToStr(RecoveryOrdADOQ.RecNo)+' из '+
          IntToStr(RecoveryOrdADOQ.RecordCount); 
        if (RecoveryOrdADOQ.FieldByName
            ('nomer_zakaza').AsInteger>0) then
        if   (RecoveryOrdADOQ.FieldByName
            ('pozyvnoi').AsInteger>0) then
        if   (RecoveryOrdADOQ.FieldByName
            ('stoimostj_zakaza').AsInteger>0)
        then
        begin
        try
          RecoveryOrderADOSP.Parameters.Refresh;
          RecoveryOrderADOSP.Parameters.
            ParamByName('@driver_num').Value:=
            RecoveryOrdADOQ.FieldByName
            ('pozyvnoi').AsInteger;
          RecoveryOrderADOSP.Parameters.
            ParamByName('@order_num').Value:=
            RecoveryOrdADOQ.FieldByName
            ('nomer_zakaza').AsInteger;
          RecoveryOrderADOSP.Parameters.
            ParamByName('@adres').Value:=
            RecoveryOrdADOQ.FieldByName
            ('adres_vyzova_vvodim').AsString;
          RecoveryOrderADOSP.Parameters.
            ParamByName('@phone').Value:=
            RecoveryOrdADOQ.FieldByName
            ('telefon_klienta').AsString;
          RecoveryOrderADOSP.Parameters.
            ParamByName('@sale').Value:=
            RecoveryOrdADOQ.FieldByName
            ('stoimostj_zakaza').AsInteger;
          RecoveryOrderADOSP.Parameters.
            ParamByName('@start_date').Value:=
            RecoveryOrdADOQ.FieldByName
            ('nachalo_zakaza_data').AsDateTime;
          RecoveryOrderADOSP.Parameters.
            ParamByName('@end_date').Value:=
            RecoveryOrdADOQ.FieldByName
            ('konec_zakaza_data').AsDateTime;
          RecoveryOrderADOSP.Parameters.
            ParamByName('@order_id').Value:=-1;
          RecoveryOrderADOSP.Parameters.
            ParamByName('@err_msg').Value:='UNKNOWN';
          RecoveryOrderADOSP.Parameters.
            ParamByName('@restore_crash').Value:=0;
          RecoveryOrderADOSP.ExecProc;

          order_id:=RecoveryOrderADOSP.Parameters.
            ParamValues['@order_id'];
          err_msg:=RecoveryOrderADOSP.Parameters.
            ParamValues['@err_msg'];
          restore_crash:=RecoveryOrderADOSP.Parameters.
            ParamValues['@restore_crash'];
          if restore_crash>0 then
          begin
            ShowMessage('Ошибка транзакции восстановления!');
          end
          else
          begin
            if order_id<=0 then
              RestoreMemo.Lines.Add(err_msg);
          end;
        except on E: Exception do
          ShowMessage('Ошибка процедуры восстановления! '+E.Message);
        end;
        end;
        RecoveryOrdADOQ.Next;
      end;
    end
    else
    begin
    end;
  end
  else
  begin
  end;
end;

procedure TEmptyConnForm.BitBtn3Click(Sender: TObject);
begin
  ADOConnectDM.ExportAbNumbersToFile;
end;

procedure TEmptyConnForm.BitBtn4Click(Sender: TObject);
begin
  ADOConnectDM.ExportCallPhonesToFile;
end;

end.
