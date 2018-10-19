unit SetTimeDateIntervalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DateUtils;

type
  TSetDateIntervalForm = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    function SelectInterval: TModalResult;
  private
    { Private declarations }
  public
    { Public declarations }
    StartDateTime: TDateTime;
    EndDateTime: TDateTime;
  end;

var
  SetDateIntervalForm: TSetDateIntervalForm;

implementation

{$R *.dfm}

function TSetDateIntervalForm.SelectInterval: TModalResult;
var res: TModalResult;
begin
  res:=ShowModal;
  StartDateTime:=StartOfTheDay(DateTimePicker1.Date)+TimeOf(DateTimePicker3.Time);
  EndDateTime:=StartOfTheDay(DateTimePicker2.Date)+TimeOf(DateTimePicker4.Time);
  Result:=res;
end;

procedure TSetDateIntervalForm.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date:=Today;
  DateTimePicker2.Date:=Today;
  DateTimePicker3.Time:=Time;
  DateTimePicker4.Time:=Time;
end;

end.
