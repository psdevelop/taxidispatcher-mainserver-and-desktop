unit DrWorkExecRepUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask,
  ExtCtrls, DateUtils, ReportDMUnit;

type
  TDrExecRepSettForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    sDateEdit1: TDateTimePicker;
    sDateEdit2: TDateTimePicker;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DrExecRepSettForm: TDrExecRepSettForm;

implementation

uses DrWorkExecTableUnit;

{$R *.dfm}

procedure TDrExecRepSettForm.FormCreate(Sender: TObject);
begin
  sDateEdit1.Date:=IncDay(Today,-7);
  sDateEdit2.Date:=Today;
end;

procedure TDrExecRepSettForm.Button1Click(Sender: TObject);
begin
    ReportDM.AggrDrReportADOQuery.Active:=False;
    ReportDM.AggrDrReportADOQuery.Parameters.
      ParamByName('stdt').Value:=StartOfTheDay(sDateEdit1.Date);
    ReportDM.AggrDrReportADOQuery.Parameters.
      ParamByName('enddt').Value:=IncDay(StartOfTheDay(sDateEdit2.Date),1);
    ReportDM.AggrDrReportADOQuery.Parameters.
      ParamByName('dnum').Value:=-1;
    ReportDM.AggrDrReportADOQuery.Parameters.
      ParamByName('dnum2').Value:=-1;
    Close;
    try
      ReportDM.AggrDrReportADOQuery.Active:=True;
      //ReportDM.GetFilterFragmentForDrExecReport;
      DrWorkExecTableForm.ShowModal;
    except
      ShowMessage('Неудачное прохождение запроса на перечень фиктивных заявок!');
    end;
end;

end.
