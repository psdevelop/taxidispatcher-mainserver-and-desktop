unit DriversIncomeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BoldGrid, ExtCtrls, BoldNavigatorDefs, BoldNavigator, StdCtrls, Buttons,
  ComCtrls, BoldLabel, BoldElements, DBGrids, DateUtils;

type
  TDriversIncomeForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    BoldGrid2: TBoldGrid;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    BoldGrid4: TBoldGrid;
    Panel4: TPanel;
    BitBtn4: TBitBtn;
    BoldGrid3: TBoldGrid;
    BoldLabel1: TBoldLabel;
    DBGrid1: TDBGrid;
    BitBtn5: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BoldGrid3Columns1LookupChange(DestElement,
      NewValue: TBoldElement);
    procedure BoldGrid2Columns1LookupChange(DestElement,
      NewValue: TBoldElement);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DriversIncomeForm: TDriversIncomeForm;

implementation

{$R *.dfm}

uses HandlesDM, BusinessClasses, ImageLists, ADODMUnit, ModelDM;

procedure TDriversIncomeForm.BitBtn1Click(Sender: TObject);
var VBE: TBoldElement;
begin
 VBE:= TVyruchka_ot_voditelya.Create(nil, True);
 (VBE as TVyruchka_ot_voditelya).Data_postupleniya:=
  Today;
 BoldModelDM.BoldUpdateDBAction1.Execute;
 try
    ADOConnectDM.DrIncomesADOT.Active:=False;
      ADOConnectDM.DrIncomesADOT.Active:=True;
 except on E:Exception do
     begin

      ShowMessage('��������� ���������� ������� ����� �������� ���������. ������: '+
        E.Message);
     end;
    end;
end;

procedure TDriversIncomeForm.BoldGrid2Columns1LookupChange(DestElement,
  NewValue: TBoldElement);
begin
  (DestElement as TPrihod).otnos_k_operac_prih:=
     (NewValue as TOperaciya);
end;

procedure TDriversIncomeForm.BoldGrid3Columns1LookupChange(DestElement,
  NewValue: TBoldElement);
begin
  (DestElement as TRashod).otnos_k_operacii_rash:=
     (NewValue as TOperaciya);
end;

procedure TDriversIncomeForm.FormShow(Sender: TObject);
begin
  BoldModelDM.HasAllCounterOverflow;
  try
  ADOConnectDM.DrIncomesADOT.Active:=False;
      ADOConnectDM.DrIncomesADOT.Active:=True;
 except on E:Exception do
     begin

      ShowMessage('��������� ���������� ������� ����� �������� ���������. ������: '+
        E.Message);
     end;
    end;
end;

end.
