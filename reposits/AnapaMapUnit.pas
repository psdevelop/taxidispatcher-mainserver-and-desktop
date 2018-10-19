unit AnapaMapUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TStateMapForm = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    procedure FormShow(Sender: TObject);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CreateSectors;
    function GetNewShape: TShape;
    function HasShapeByCode(HCode: string): TShape;
  private
    { Private declarations }
  public
    { Public declarations }
    HasResult: Boolean;
  end;

var
	StateMapForm: TStateMapForm;

implementation

{$R *.dfm}

uses BusinessClasses, HandlesDM, ADODMUnit;

function TStateMapForm.HasShapeByCode(HCode: string): TShape;
var i: Integer;
    res: TShape;
begin
  i:=0;
  res:=nil;
  while i<StateMapForm.ControlCount do
    begin
      if (StateMapForm.Controls[i] is TShape) then
        begin
          if (StateMapForm.Controls[i] as TShape).HelpKeyword=HCode then
             begin
               res:=(StateMapForm.Controls[i] as TShape);
             end;
        end;
      i:=i+1;
    end;
   Result:=res;
end;

function TStateMapForm.GetNewShape: TShape;
var SH: TShape;
begin
  SH:=TShape.Create(StateMapForm);
  SH.Parent:=StateMapForm;
  SH.Brush.Style:=bsFDiagonal;
  SH.Shape:=stEllipse;
  SH.Show;
  Result:=SH;
end;

procedure TStateMapForm.Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
	Y: Integer);

begin
  Image1.OnMouseMove(Image1,Shift,X,Y);
  (Sender as TShape).Brush.Color:=clRed;
end;

procedure TStateMapForm.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var i: Integer;
begin
  i:=0;
  while i<StateMapForm.ControlCount do
    begin
      if (StateMapForm.Controls[i] is TShape) then
        begin
          (StateMapForm.Controls[i] as TShape).Brush.Color:=clWhite;
        end;
      i:=i+1;
    end;
end;

procedure TStateMapForm.CreateSectors;
var i: Integer;
    SH: TShape;
begin
  {i:=0;
  while i<StateMapForm.ControlCount do
    begin
      if (StateMapForm.Controls[i] is TShape) then
        begin
          BoldHandlesDM.bvhSectorCode.Value.SetAsVariant(StateMapForm.Controls[i].HelpKeyword);
          if BoldHandlesDM.blhSectorByCode.List.Count>0 then
            begin
           end
          else
            (StateMapForm.Controls[i] as TShape).Visible:=False;
        end;
      i:=i+1;
    end;
  if BoldHandlesDM.blhAllWorkSector.List.Count>0 then
    begin
      BoldHandlesDM.blhAllWorkSector.First;
      while True do
        begin
          SH:=HasShapeByCode((BoldHandlesDM.blhAllWorkSector.CurrentElement as TSektor_Raboty).Kod_sektora);
          if SH=nil then
           begin
            SH:=GetNewShape;
            SH.HelpKeyword:=(BoldHandlesDM.blhAllWorkSector.CurrentElement as TSektor_Raboty).Kod_sektora;
             //ShowMessage('sss');
            end;
          SH.Left:=Round((BoldHandlesDM.blhAllWorkSector.CurrentElement as TSektor_Raboty).Oblastj_sleva);
          SH.Top:=Round((BoldHandlesDM.blhAllWorkSector.CurrentElement as TSektor_Raboty).Oblastj_sverhu);
          SH.Width:=Round((BoldHandlesDM.blhAllWorkSector.CurrentElement as TSektor_Raboty).Shirina);
          SH.Height:=Round((BoldHandlesDM.blhAllWorkSector.CurrentElement as TSektor_Raboty).Vysota);
          SH.Hint:=(BoldHandlesDM.blhAllWorkSector.CurrentElement as TSektor_Raboty).Podskazka_na_sektore;
          SH.ShowHint:=True;
          SH.OnMouseMove:=Shape1.OnMouseMove;
          //SH.OnMouseDown:=Shape1.OnMouseDown;
          if BoldHandlesDM.blhAllWorkSector.HasNext then
            BoldHandlesDM.blhAllWorkSector.Next
          else
            Break;
        end;
    end;
    }
end;

procedure TStateMapForm.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
{
  BoldHandlesDM.bvhSectorCode.Value.SetAsVariant((Sender as TShape).HelpKeyword);
  if ADOConnectDM.MainADOConnection.Connected then
   begin
    ADOConnectDM.SectByCodeADOQuery.Parameters[0].Value:=(Sender as TShape).HelpKeyword;
    ADOConnectDM.SectByCodeADOQuery.Active:=False;
    ADOConnectDM.SectByCodeADOQuery.Active:=True;
    ADOConnectDM.SectByCodeADOQuery.ExecSQL;
   end;
  if ((BoldHandlesDM.blhSectorByCode.List.Count>0) and not ADOConnectDM.MainADOConnection.Connected) then
   begin
     BoldHandlesDM.blhSectorByCode.First;
     HasResult:=True;
   end
  else if ADOConnectDM.MainADOConnection.Connected and (BoldHandlesDM.blhSectorByCode.List.Count>0) then
    begin
      if (ADOConnectDM.SectByCodeADOQuery.RecordCount>0) then
        begin
          ADOConnectDM.SectByCodeADOQuery.First;
          HasResult:=True;
        end;
    end
  else
   begin
     ShowMessage('�� ������ ������ � ��������� ��������!');
   end;
  Close;
  }
end;

procedure TStateMapForm.FormShow(Sender: TObject);
begin
  HasResult:=False;
end;

end.
