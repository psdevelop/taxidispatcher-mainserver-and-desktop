unit AnnonceArhiveFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BoldGrid, StdCtrls, Buttons, ExtCtrls, BoldComboBox,
  BoldCheckBox, ComCtrls, BoldEdit, BoldLabel, DBGrids;

type
  TAnnonceArhiveFormForm = class(TForm)
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel4: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel5: TPanel;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    DispDBGrid: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DispDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ShowSearchForm(ForLaterUsing: Boolean): Boolean;
  end;

var
  AnnonceArhiveFormForm: TAnnonceArhiveFormForm;
  IsResult, UseSelectArhElement: Boolean;
  CurrRelease: Double;

implementation

{$R *.dfm}

uses HandlesDM, DateUtils, ReleaseStructUnit, ModelDM, BusinessClasses, ADODMUnit;

procedure TAnnonceArhiveFormForm.FormShow(Sender: TObject);
begin
  if ADOConnectDM.MainADOConnection.Connected then
    begin
      ADOConnectDM.ArhiveADOQuery.Active:=False;
      ADOConnectDM.ArhiveADOQuery.Active:=True;
      TabSheet2.Show;
      //BitBtn2.Enabled:=True;
      //BitBtn3.Enabled:=True;
    end
  else
    begin
      //BitBtn2.Enabled:=False;
      //BitBtn3.Enabled:=False;
      //TabSheet1.Show;
    end;
end;

procedure TAnnonceArhiveFormForm.BitBtn2Click(Sender: TObject);
begin
  if ADOConnectDM.MainADOConnection.Connected then
    begin
      if not ADOConnectDM.SendSQL('UPDATE Zakaz SET arhivnyi=0'+
              ', zavershyon=0'+
              ' WHERE BOLD_ID='+IntToStr(ADOConnectDM.ArhiveADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('Неудачное восстановление заявки из архива!');

      ADOConnectDM.RefreshMainGrid(-1, True);          

      ADOConnectDM.ArhiveADOQuery.Active:=False;
      ADOConnectDM.ArhiveADOQuery.Active:=True;
    end
   else
   begin
   //if BoldHandlesDM.blhArhiveSearch.Count>0 then
   // begin
   //  (BoldHandlesDM.blhArhiveSearch.CurrentElement as TZakaz).Arhivnyi:=False;
   //  (BoldHandlesDM.blhArhiveSearch.CurrentElement as TZakaz).Zavershyon:=False;
   // end;
   end;
end;

function TAnnonceArhiveFormForm.ShowSearchForm(ForLaterUsing: Boolean): Boolean;
var res: Boolean;
begin
  res:=False;
  IsResult:=False;
  UseSelectArhElement:=False;
  if ForLaterUsing then
   begin
    AnnonceArhiveFormForm.ShowModal;
    if IsResult then
      res:=True;
   end
  else
    AnnonceArhiveFormForm.Show;
  Result:=res;
end;

procedure TAnnonceArhiveFormForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TAnnonceArhiveFormForm.BitBtn3Click(Sender: TObject);
begin
if ADOConnectDM.MainADOConnection.Connected then
    begin
      if not ADOConnectDM.SendSQL('DELETE FROM Zakaz '+
              ' WHERE BOLD_ID='+IntToStr(ADOConnectDM.ArhiveADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('Неудачное восстановление заявки из архива!');

      ADOConnectDM.ArhiveADOQuery.Active:=False;
      ADOConnectDM.ArhiveADOQuery.Active:=True;
    end
   else
   begin

   end;   
end;

procedure TAnnonceArhiveFormForm.BitBtn4Click(Sender: TObject);
begin
  UseSelectArhElement:=True;
  Close;
end;

procedure TAnnonceArhiveFormForm.DispDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  holdColor: TColor;
begin
  holdColor := DispDBGrid.Canvas.Brush.Color;
if (DataCol = 0) then
    begin
      //ArhiveCustBitmap
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,ReleaseStructForm.ArhiveCustBitmap);
    end;
    if Column.FieldName = 'Telefon_klienta' then
    begin
      DispDBGrid.Canvas.Brush.Color := clMoneyGreen;
      if ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1 then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clYellow;
      if (ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1) and
         (ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Zadeistv_predvarit').AsInteger=1) then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clRed;
      if (ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger>0)
          or (ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-100) then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          
      DispDBGrid.Canvas.Brush.Color := holdColor;
    end;
   if Column.FieldName = 'Adres_vyzova_vvodim' then
    begin
      DispDBGrid.Canvas.Brush.Color := clMoneyGreen;
      if ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1 then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clYellow;
      if (ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1) and
         (ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Zadeistv_predvarit').AsInteger=1) then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clRed;
      if (ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger>0)
          or (ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-100) then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := holdColor;
    end;
   if Column.FieldName = 'Pozyvnoi_ustan' then
    begin
      DispDBGrid.Canvas.Brush.Color := clWhite;
      if ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Zavershyon').AsInteger=1 then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := holdColor;
    end;
   if Column.FieldName = 'Nomer_zakaza' then
    begin
      DispDBGrid.Canvas.Brush.Color := clWhite;
      if ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Zavershyon').AsInteger=1 then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := holdColor;
    end;
   if Column.FieldName = 'Uslovn_stoim' then
    begin
      DispDBGrid.Canvas.Brush.Color := clWhite;
      if ADOConnectDM.dsArhiveCust.DataSet.FieldByName('Zavershyon').AsInteger=1 then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := holdColor;
    end;
end;

procedure TAnnonceArhiveFormForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //BoldHandlesDM.blhArhiveSearch.RootHandle:=
  //       nil;
end;

end.
