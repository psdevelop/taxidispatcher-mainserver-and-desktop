unit DriversEffectiveDgrUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeeProcs, TeEngine, Chart, DbChart, StdCtrls, Buttons, ExtCtrls, DB,
  Series, ADODB;

type
  TDrEffictiveDgrForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    DBChart1: TDBChart;
    dsDrEffectDgr: TDataSource;
    Series1: TPieSeries;
    BitBtn2: TBitBtn;
    SaveDialog1: TSaveDialog;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DrEffictiveDgrForm: TDrEffictiveDgrForm;

implementation

{$R *.dfm}

uses ReportDMUnit, ModelDM;

procedure TDrEffictiveDgrForm.BitBtn1Click(Sender: TObject);
begin
if SaveDialog1.Execute then
 begin
  DBChart1.SaveToBitmapFile(SaveDialog1.FileName);
 end;
end;

end.
