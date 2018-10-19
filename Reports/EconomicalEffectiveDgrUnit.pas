unit EconomicalEffectiveDgrUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, TeeProcs, Chart, DbChart, StdCtrls, Buttons,
  ExtCtrls, DB, ADODB, DBClient, Grids, DBGrids;

type
  TEconomicalEffectDgrForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBChart1: TDBChart;
    SaveDialog1: TSaveDialog;
    Series1: TFastLineSeries;
    EffDgrADOQuery: TADOQuery;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EconomicalEffectDgrForm: TEconomicalEffectDgrForm;

implementation

{$R *.dfm}

uses ReportDMUnit, ModelDM, MainRepSetFormUnit, DateUtils;

procedure TEconomicalEffectDgrForm.BitBtn2Click(Sender: TObject);
begin
if SaveDialog1.Execute then
 begin
  DBChart1.SaveToBitmapFile(SaveDialog1.FileName);
 end;
end;

end.
