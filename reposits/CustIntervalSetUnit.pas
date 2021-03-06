unit CustIntervalSetUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TCustIntervalSetForm = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustIntervalSetForm: TCustIntervalSetForm;

implementation

{$R *.dfm}

uses ReportDMUnit, DateUtils, HandlesDM;

procedure TCustIntervalSetForm.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=IncDay(Today,-7);
  DateTimePicker2.Date:=Today;
  ModalResult:=mrNone;
end;

procedure TCustIntervalSetForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult=mrOk then
    begin
      //ReportDM.bvhStartDate.Value.SetAsVariant(StartOfTheDay(DateTimePicker1.Date));
      //ReportDM.bvhEndDate.Value.SetAsVariant(EndOfTheDay(DateTimePicker2.Date));
      //ReportDM.bvhSelectEqualStartSectors.Value.SetAsVariant(CheckBox1.Checked);
      //ReportDM.bvhUnEqualStSect.Value.SetAsVariant(CheckBox2.Checked);
      try
    ReportDM.RvProject.SetParam('StartDate',DateToStr(DateTimePicker1.Date));
    ReportDM.RvProject.SetParam('EndDate',DateToStr(DateTimePicker2.Date));

    //ShowMessage(IntToStr(ReportDM.RvDataSetConnectionAllTaxSumm.DataRows));
    //ReportDM.RvDataSetConnectionAllTaxSumm.ClearBufferHeader;
    {ReportDM.bdsCustOnPeriod.BoldHandle:=ReportDM.blhCustOnPeriod;
    ReportDM.bdsCustOnPeriod.Active:=True;
    ReportDM.ClientDataSetCustOnPeriod.Active:=False;
    ReportDM.ClientDataSetCustOnPeriod.Active:=True;
    ReportDM.ClientDataSetCustOnPeriod.Active:=False;
    ReportDM.ClientDataSetCustOnPeriod.Active:=True; }

    ReportDM.RvProject.ExecuteReport('CustIntervalReport');
  finally
    //ReportDM.bdsCustOnPeriod.BoldHandle:=nil;
    //ReportDM.bdsCustOnPeriod.Active:=False;
  end;

    end;
end;

end.
