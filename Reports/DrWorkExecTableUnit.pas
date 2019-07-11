unit DrWorkExecTableUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, ComCtrls,
  Mask, DateUtils, Buttons;

type
  TDrWorkExecTableForm = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    sDateEdit1: TDateTimePicker;
    sDateEdit2: TDateTimePicker;
    sCheckBox1: TCheckBox;
    sCheckBox2: TCheckBox;
    sCheckBox3: TCheckBox;
    sCheckBox4: TCheckBox;
    sCheckBox5: TCheckBox;
    sCheckBox6: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DrWorkExecTableForm: TDrWorkExecTableForm;

implementation

uses ReportDMUnit;

{$R *.dfm}

procedure TDrWorkExecTableForm.sCheckBox1Click(Sender: TObject);
begin
  ReportDM.GetFilterFragmentForDrExecReport;
end;

procedure TDrWorkExecTableForm.Edit1Change(Sender: TObject);
begin
    ReportDM.AggrDrReportADOQuery.Active:=False;
    ReportDM.AggrDrReportADOQuery.Parameters.
      ParamByName('stdt').Value:=StartOfTheDay(sDateEdit1.Date);//+TTime(DateTimePicker1.Time);
    ReportDM.AggrDrReportADOQuery.Parameters.
      ParamByName('enddt').Value:=StartOfTheDay(sDateEdit2.Date);//+TTime(DateTimePicker2.Time);

    if DrWorkExecTableForm.Edit1.Text<>'' then
    begin
     try
      StrToInt(DrWorkExecTableForm.Edit1.Text);
      ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum').Value:=StrToInt(DrWorkExecTableForm.Edit1.Text);
      ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum2').Value:=StrToInt(DrWorkExecTableForm.Edit1.Text);
     except
       ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum').Value:=-1;
       ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum2').Value:=-1;
       ShowMessage('Позывной должен быть целым числом!');
     end;
    end
    else
      begin
       ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum').Value:=-1;
       ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum2').Value:=-1;
      end;

    try
      ReportDM.AggrDrReportADOQuery.Active:=True;
      ReportDM.GetFilterFragmentForDrExecReport;
    except
      ShowMessage('Неудачное прохождение запроса на перечень фиктивных заявок!');
    end;

end;

procedure TDrWorkExecTableForm.FormShow(Sender: TObject);
begin
  sDateEdit1.Date:=
  ReportDM.AggrDrReportADOQuery.Parameters.
      ParamByName('stdt').Value;
  sDateEdit2.Date:=
  ReportDM.AggrDrReportADOQuery.Parameters.
      ParamByName('enddt').Value;
end;

procedure TDrWorkExecTableForm.BitBtn1Click(Sender: TObject);
begin
    ReportDM.AggrDrReportADOQuery.Active:=False;
    ReportDM.AggrDrReportADOQuery.Parameters.
      ParamByName('stdt').Value:=StartOfTheDay(sDateEdit1.Date);//+TTime(DateTimePicker1.Time);
    ReportDM.AggrDrReportADOQuery.Parameters.
      ParamByName('enddt').Value:=StartOfTheDay(sDateEdit2.Date);//+TTime(DateTimePicker2.Time);

    if DrWorkExecTableForm.Edit1.Text<>'' then
    begin
     try
      StrToInt(DrWorkExecTableForm.Edit1.Text);
      ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum').Value:=StrToInt(DrWorkExecTableForm.Edit1.Text);
      ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum2').Value:=StrToInt(DrWorkExecTableForm.Edit1.Text);
     except
       ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum').Value:=-1;
       ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum2').Value:=-1;
       ShowMessage('Позывной должен быть целым числом!');
     end;
    end
    else
      begin
       ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum').Value:=-1;
       ReportDM.AggrDrReportADOQuery.Parameters.
         ParamByName('dnum2').Value:=-1;
      end;  

    try
      ReportDM.AggrDrReportADOQuery.Active:=True;
      ReportDM.GetFilterFragmentForDrExecReport;
    except
      ShowMessage('Неудачное прохождение запроса на перечень фиктивных заявок!');
    end;
end;

procedure TDrWorkExecTableForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DrWorkExecTableForm.Edit1.Text:='';
end;

end.
