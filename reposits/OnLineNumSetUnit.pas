unit OnLineNumSetUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TOnLineSetNumForm = class(TForm)
    sEdit1: TEdit;
    procedure sEdit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OnLineSetNumForm: TOnLineSetNumForm;

implementation

uses ModelDM;

{$R *.dfm}

procedure TOnLineSetNumForm.FormShow(Sender: TObject);
begin
  sEdit1.Text:='';
  sEdit1.SetFocus;
  BoldModelDM.HasAllCounterOverflow;
end;

procedure TOnLineSetNumForm.sEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=13 then
    Close;
end;

end.

