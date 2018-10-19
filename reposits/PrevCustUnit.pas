unit PrevCustUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TPrevCustDatesForm = class(TForm)
    BitBtn1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrevCustDatesForm: TPrevCustDatesForm;

implementation

{$R *.dfm}

uses DateUtils, ReleaseStructUnit, HandlesDM, BusinessClasses;

procedure TPrevCustDatesForm.FormShow(Sender: TObject);
begin
  ModalResult:=mrCancel;
  DateTimePicker1.Date:=Today;
  DateTimePicker2.Time:=Time;
end;

end.
