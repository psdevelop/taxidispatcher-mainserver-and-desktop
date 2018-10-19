unit AbOrdersRepSettFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TAbOrdersRepSettForm = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AbOrdersRepSettForm: TAbOrdersRepSettForm;

implementation

{$R *.dfm}

uses HandlesDM, ReportDMUnit, BusinessClasses, DateUtils, ADODMUnit;

procedure TAbOrdersRepSettForm.BitBtn1Click(Sender: TObject);
begin
  ReportDM.AbOrdersADODS.Active:=False;
  ReportDM.AbPresOrdersADODS.Active:=False;

  ReportDM.AbOrdersADODS.Parameters.ParamByName('start_date').Value:=
     StartOfTheDay(DateTimePicker1.Date);
  ReportDM.AbOrdersADODS.Parameters.ParamByName('end_date').Value:=
     EndOfTheDay(DateTimePicker2.Date);

  ReportDM.AbOrdersADODS.Parameters.ParamByName('start_date').Value:=
     StartOfTheDay(DateTimePicker1.Date);
  ReportDM.AbPresOrdersADODS.Parameters.ParamByName('end_date').Value:=
     EndOfTheDay(DateTimePicker2.Date);

  try

    ReportDM.AbOrdersADODS.Parameters.ParamByName('ab_id').Value:=
       Edit1.Text;
    ReportDM.AbPresOrdersADODS.Parameters.ParamByName('ab_id').Value:=
       Edit1.Text;

    ReportDM.AbOrdersADODS.Active:=True;
    ReportDM.AbPresOrdersADODS.Active:=True;



    ReportDM.RvProject.SetParam('StartDate',DateToStr(DateTimePicker1.Date));
    ReportDM.RvProject.SetParam('EndDate',DateToStr(DateTimePicker2.Date));
    ReportDM.RvProject.SetParam('DriverName',
      Edit1.Text);
    ReportDM.RvProject.ExecuteReport('AbOrdersReport');
  finally

  end;
  Close;
end;

procedure TAbOrdersRepSettForm.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date:=IncDay(Today,-7);
  DateTimePicker2.Date:=Today;
end;

end.
