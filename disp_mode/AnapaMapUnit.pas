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

uses ADODMUnit;

function TStateMapForm.HasShapeByCode(HCode: string): TShape;
var i: Integer;
    res: TShape;
begin
  i:=0;
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
var i, i2: Integer;
    SH: TShape;
    HKode: string;
    //HasShape: Boolean;
begin
  i:=0;
  while i<StateMapForm.ControlCount do
    begin
      if (StateMapForm.Controls[i] is TShape) then
        begin
          ADOConnectDM.SectByCodeADOQuery.Parameters[0].Value:=StateMapForm.Controls[i].HelpKeyword;
          ADOConnectDM.SectByCodeADOQuery.Active:=False;
          ADOConnectDM.SectByCodeADOQuery.Active:=True;
          ADOConnectDM.SectByCodeADOQuery.ExecSQL;
          if ADOConnectDM.SectByCodeADOQuery.RecordCount>0 then
            begin
           end
          else
            (StateMapForm.Controls[i] as TShape).Visible:=False;
        end;
      i:=i+1;
    end;
  if ADOConnectDM.AllSectorsADOQuery.RecordCount>0 then
    begin
      ADOConnectDM.AllSectorsADOQuery.First;

      SH:=HasShapeByCode(ADOConnectDM.AllSectorsADOQuery.FindField('Kod_sektora').AsString);
          if SH=nil then
           begin
            SH:=GetNewShape;
            SH.HelpKeyword:=ADOConnectDM.AllSectorsADOQuery.FindField('Kod_sektora').AsString;
             //ShowMessage('sss');
            end;
          SH.Left:=Round(ADOConnectDM.AllSectorsADOQuery.FindField('Oblastj_sleva').AsFloat);
          SH.Top:=Round(ADOConnectDM.AllSectorsADOQuery.FindField('Oblastj_sverhu').AsFloat);
          SH.Width:=Round(ADOConnectDM.AllSectorsADOQuery.FindField('Shirina').AsFloat);
          SH.Height:=Round(ADOConnectDM.AllSectorsADOQuery.FindField('Vysota').AsFloat);
          SH.Hint:=ADOConnectDM.AllSectorsADOQuery.FindField('Podskazka_na_sektore').AsString;
          SH.ShowHint:=True;
          SH.OnMouseMove:=Shape1.OnMouseMove;

      while not ADOConnectDM.AllSectorsADOQuery.Eof do
        begin
          SH:=HasShapeByCode(ADOConnectDM.AllSectorsADOQuery.FindField('Kod_sektora').AsString);
          if SH=nil then
           begin
            SH:=GetNewShape;
            SH.HelpKeyword:=ADOConnectDM.AllSectorsADOQuery.FindField('Kod_sektora').AsString;
             //ShowMessage('sss');
            end;
          SH.Left:=Round(ADOConnectDM.AllSectorsADOQuery.FindField('Oblastj_sleva').AsFloat);
          SH.Top:=Round(ADOConnectDM.AllSectorsADOQuery.FindField('Oblastj_sverhu').AsFloat);
          SH.Width:=Round(ADOConnectDM.AllSectorsADOQuery.FindField('Shirina').AsFloat);
          SH.Height:=Round(ADOConnectDM.AllSectorsADOQuery.FindField('Vysota').AsFloat);
          SH.Hint:=ADOConnectDM.AllSectorsADOQuery.FindField('Podskazka_na_sektore').AsString;
          SH.ShowHint:=True;
          SH.OnMouseMove:=Shape1.OnMouseMove;

          ADOConnectDM.AllSectorsADOQuery.Next

        end;
    end;
end;

procedure TStateMapForm.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ADOConnectDM.SectByCodeADOQuery.Parameters[0].Value:=(Sender as TShape).HelpKeyword;
  ADOConnectDM.SectByCodeADOQuery.Active:=False;
  ADOConnectDM.SectByCodeADOQuery.Active:=True;
  ADOConnectDM.SectByCodeADOQuery.ExecSQL;
  if ADOConnectDM.SectByCodeADOQuery.RecordCount>0 then
   begin
     ADOConnectDM.SectByCodeADOQuery.First;
     HasResult:=True;
   end;
  Close;
end;

procedure TStateMapForm.FormShow(Sender: TObject);
begin
  HasResult:=False;
end;

end.
