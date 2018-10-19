unit FictiveCustDelDateUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask,
  Buttons, DateUtils, ComCtrls;

type
  TFictOrdDelDateForm = class(TForm)
    sDateEdit1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FictOrdDelDateForm: TFictOrdDelDateForm;

implementation

{$R *.dfm}

procedure TFictOrdDelDateForm.FormCreate(Sender: TObject);
begin
  sDateEdit1.Date:=
    IncDay(Today,-8);
end;

end.
