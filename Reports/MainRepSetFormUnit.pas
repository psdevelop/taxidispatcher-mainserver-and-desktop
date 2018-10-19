unit MainRepSetFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, BoldGrid, BoldComboBox, ExtCtrls,
  DBCtrls, DBGrids, BoldCheckBox, DB;

type
  TMainRepSettForm = class(TForm)
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BoldComboBox1: TBoldComboBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    RepModeRadioGroup: TRadioGroup;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    CheckBox1: TCheckBox;
    CalcSMSCheckBox: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainRepSettForm: TMainRepSettForm;

implementation

{$R *.dfm}

uses HandlesDM, BusinessClasses, ReportDMUnit, ModelDM, DateUtils, ADODMUnit;

procedure TMainRepSettForm.BitBtn1Click(Sender: TObject);
var //freeDaysCount,
    DrNum: Integer;
    emploeeDate: TDateTime;
    start_date, end_date: TDateTime;
    //newField: TField;
    //fval: TVarRec;
begin
  //fval.
  if not TabSheet2.Showing then
  begin
  try
  StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya);
  (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca:=
    StartOfTheDay(DateTimePicker2.Date)+StrToTime(TimeToStr(MainRepSettForm.DateTimePicker4.Time));
  (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala:=
     StartOfTheDay(DateTimePicker1.Date)+StrToTime(TimeToStr(MainRepSettForm.DateTimePicker3.Time));
  except
   ShowMessage('Неверное значение времени снятия отчётности, по умолчанию будет установлен0 08:00:00.');
   (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca:=
    StartOfTheDay(DateTimePicker2.Date)+StrToTime('08:00:00');

   (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala:=
     StartOfTheDay(DateTimePicker1.Date)+StrToTime('08:00:00');
  end;

  ReportDM.SMSRepADODS.Parameters.ParamByName('start_dt').Value:=
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala;
  ReportDM.SMSRepADODS.Parameters.ParamByName('start_dt2').Value:=
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala;
  ReportDM.SMSRepADODS.Parameters.ParamByName('end_dt').Value:=
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca;
  ReportDM.SMSRepADODS.Parameters.ParamByName('end_dt2').Value:=
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca;

  if CalcSMSCheckBox.Checked then
  begin
    try
      ReportDM.SMSRepADODS.Active:=False;
      ReportDM.SMSRepADODS.Active:=True;
    except
      ShowMessage('Ошибка перезагрузки набора данных для отчета по СМС!');
    end;
  end;

  ShowMessage('По период времени с '+DateTimeToStr((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala)+' по '+DateTimeToStr((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca));
  BoldModelDM.BoldUpdateDBAction1.Execute;
  end;

  try
    if not TabSheet2.Showing then
    begin
    ReportDM.RvProject.SetParam('StartDate',DateTimeToStr(
      (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala));
    ReportDM.RvProject.SetParam('EndDate',DateTimeToStr(
      (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca));

    //ShowMessage(IntToStr(ReportDM.RvDataSetConnectionAllTaxSumm.DataRows));
    //ReportDM.RvDataSetConnectionAllTaxSumm.ClearBufferHeader;
    //ReportDM.AllTaxSummBoldDataSet.BoldHandle:=BoldHandlesDM.blhAllDrivers;
    //ReportDM.AllTaxSummBoldDataSet.Active:=True;
    if CheckBox2.Checked then
       BoldHandlesDM.bvhShowStaticWorker.Value.SetAsVariant(False)
    else
       BoldHandlesDM.bvhShowStaticWorker.Value.SetAsVariant(True);
    if CheckBox3.Checked then
       BoldHandlesDM.bvhShowStag.Value.SetAsVariant(False)
    else
       BoldHandlesDM.bvhShowStag.Value.SetAsVariant(True);

    if (IniFile.ReadString('BUSINESS_DATA',
    'вести_контроль_оплаты_водителем','NO')='YES') then
    if BoldHandlesDM.blhAllDrivers.Count>0 then
    begin
      BoldHandlesDM.blhAllDrivers.First;
      while (True) do
      begin

        try

          DrNum:=(BoldHandlesDM.blhAllDrivers.
			      CurrentElement as
				    TVoditelj).Pozyvnoi;

          (BoldHandlesDM.blhAllDrivers.CurrentElement as
				    TVoditelj).Garagn_nomer:='0';
          if (DrNum>0) then
          if (ADOConnectDM.DrIDByNum(
          DrNum)>-1) then
          begin

            emploeeDate:=StrToDateDef(
              ADOConnectDM.DrInfoADOQuery.FieldByName
              ('Klass_vodit').AsString,
              IncDay(Today));

            //freeDaysCount:=StrToIntDef(
            //  ADOConnectDM.DrInfoADOQuery.FieldByName
            //  ('Udostoverenie_nom').AsString,0);

            start_date:=(BoldHandlesDM.blhDriversUnion.
              CurrentElement as
              TObjekt_vyborki_otchyotnosti).Data_nachala;

            end_date:=(BoldHandlesDM.blhDriversUnion.
              CurrentElement as
              TObjekt_vyborki_otchyotnosti).Data_konca;

            if emploeeDate>Today then
              begin
                emploeeDate:=start_date;
              end;

            //if start_date>Today then
            //  start_date:=IncDay(Today);
              //ShowMessage('Неверно выставлена '+
              //'дата_начала_контроля_оплат_водителей!');

            if emploeeDate<start_date then
            begin
              emploeeDate:=start_date;
            end;

            ADOConnectDM.DrWorkDetailSummADODS.Active:=False;
            ADOConnectDM.DrWorkDetailSummADODS.Parameters.
              ParamByName('poz3').Value:=DrNum;
            ADOConnectDM.DrWorkDetailSummADODS.Parameters.
              ParamByName('poz4').Value:=DrNum;
            ADOConnectDM.DrWorkDetailSummADODS.Parameters.
              ParamByName('dr_start_date').Value:=
              emploeeDate;
            ADOConnectDM.DrWorkDetailSummADODS.Parameters.
              ParamByName('dr_end_date').Value:=
              end_date;
            ADOConnectDM.DrWorkDetailSummADODS.Parameters.
              ParamByName('dr_start_date2').Value:=
              emploeeDate;
            ADOConnectDM.DrWorkDetailSummADODS.Parameters.
              ParamByName('free_days_count').Value:=
              0;

            ADOConnectDM.DrWorkDetailSummADODS.Active:=True;
			
			      (BoldHandlesDM.blhAllDrivers.CurrentElement as
				    TVoditelj).Garagn_nomer:=FloatToStr(
              ADOConnectDM.DrWorkDetailSummADODS
              .FieldByName('days_fixed_summ').AsFloat);

          end
          else
          begin
            ShowMessage('Неудачный запрос к'+
            ' таблице водителей!');
          end;

        except on E:Exception do
          ShowMessage(
          'Ошибка запросов '+
          ' подсчета для водителей! '+
          E.Message);
        end;

        if BoldHandlesDM.blhAllDrivers.HasNext then
          BoldHandlesDM.blhAllDrivers.Next
        else
			    Break;
      end;
      
    end;
	
	  BoldModelDM.BoldUpdateDBAction1.Execute;

    ReportDM.AllTaxSummBoldDataSet.BoldHandle:=BoldHandlesDM.blhAllDrivers;
    ReportDM.AllTaxSummBoldDataSet.Active:=True;
    ReportDM.AllTaxSummCDS.Active:=False;
    //ReportDM.AllTaxSummCDS.ProviderName:='AllTaxSummDataSetProvider';
    ReportDM.AllTaxSummCDS.Active:=True;
    ReportDM.AllTaxSummCDS.Active:=False;
    ReportDM.AllTaxSummCDS.Active:=True;
    ReportDM.AllTaxSummCDS.SaveToFile('proba.cds');
    //ReportDM.AllTaxSummCDS.Active:=False;
    //ReportDM.AllTaxSummCDS.ProviderName:='';
    //ReportDM.AllTaxSummCDS.LoadFromFile('proba.cds');
    //ReportDM.AllTaxSummCDS.Active:=True;

    if CheckBox1.Checked then
       ReportDM.AllTaxSummCDS.Filtered:=True
    else
       ReportDM.AllTaxSummCDS.Filtered:=False;
    end;

    {ReportDM.AllTaxSummCDS.FieldDefs.BeginUpdate;
    ReportDM.AllTaxSummCDS.FieldDefs.
      Add('days_fix_summ', ftFloat, 0, False);
    ReportDM.AllTaxSummCDS.FieldDefs.EndUpdate;
    ReportDM.AllTaxSummCDS.CreateDataSet;
    }

    {newField:=TField.Create(nil);
    newField.SetFieldType(ftFloat);
    //newField.CanModify:=True;
    //newField.DisplayName:='days_fix_summ';
    newField.FieldName:='days_fix_summ';
    //newField.FullName:='days_fix_summ';
    newField.ReadOnly:=False;
    newField.Size := 28;
    //newField.

    ReportDM.AllTaxSummCDS.Fields.Add(newField);}
    //ReportDM.AllTaxSummCDS.Fields.
    //FieldByName('').AssignValue();

    //ShowMessage('Готово');
    if not ReportDM.MainRepForDiagramm then
      if RepModeRadioGroup.ItemIndex=1 then
         ReportDM.RvProject.ExecuteReport('MainReportTwoVar')
      else if RepModeRadioGroup.ItemIndex=2 then
         ReportDM.RvProject.ExecuteReport('MainReportThreeVar')
      else
        ReportDM.RvProject.ExecuteReport('MainReport');

    if CalcSMSCheckBox.Checked then
    begin
      ReportDM.RvProject.ExecuteReport('SMSReport');
    end;
  finally
    ReportDM.AllTaxSummBoldDataSet.BoldHandle:=nil;
    ReportDM.AllTaxSummBoldDataSet.Active:=False;
    ReportDM.AllTaxSummCDS.Active:=False;
    //ReportDM.AllTaxSummBoldDataSet.BoldHandle:=nil;
    //ReportDM.AllTaxSummBoldDataSet.Active:=False;

  end;
  Close;
end;

procedure TMainRepSettForm.FormCreate(Sender: TObject);
begin
  MainRepSettForm.DateTimePicker1.Date:=IncDay(Today,-7);
  MainRepSettForm.DateTimePicker2.Date:=Today;

end;

procedure TMainRepSettForm.FormShow(Sender: TObject);
begin
  TabSheet1.Show;
  if ReportDM.MainRepForDiagramm then
    RepModeRadioGroup.ItemIndex:=-1
  else
    RepModeRadioGroup.ItemIndex:=2;
  try
    StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya);
    MainRepSettForm.DateTimePicker3.Time:=
      StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya);
    MainRepSettForm.DateTimePicker4.Time:=
      StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya);
  except
    MainRepSettForm.DateTimePicker3.Time:=StrToTime('08:00:00');
    MainRepSettForm.DateTimePicker4.Time:=StrToTime('08:00:00');
  end;
end;

procedure TMainRepSettForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BoldHandlesDM.brhCurrDrGroup.Value:=
    nil;
end;

procedure TMainRepSettForm.TabSheet2Show(Sender: TObject);
begin
  //TabSheet1.TabVisible:=False;
  try
  StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya);
  (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca:=
    StartOfTheDay(DateTimePicker2.Date)+StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya);
  (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala:=
     StartOfTheDay(DateTimePicker1.Date)+StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya);
  except
   ShowMessage('Неверное значение времени снятия отчётности, по умолчанию будет установлен0 08:00:00.');
   (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca:=
    StartOfTheDay(DateTimePicker2.Date)+StrToTime('08:00:00');

   (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala:=
     StartOfTheDay(DateTimePicker1.Date)+StrToTime('08:00:00');
  end;
  ShowMessage('По период времени с '+DateTimeToStr((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala)+' по '+DateTimeToStr((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca));
  BoldModelDM.BoldUpdateDBAction1.Execute;
  try
    ReportDM.RvProject.SetParam('StartDate',DateToStr(DateTimePicker1.Date));
    ReportDM.RvProject.SetParam('EndDate',DateToStr(DateTimePicker2.Date));

    //ShowMessage(IntToStr(ReportDM.RvDataSetConnectionAllTaxSumm.DataRows));
    //ReportDM.RvDataSetConnectionAllTaxSumm.ClearBufferHeader;
    //ReportDM.AllTaxSummBoldDataSet.BoldHandle:=BoldHandlesDM.blhAllDrivers;
    //ReportDM.AllTaxSummBoldDataSet.Active:=True;
    ReportDM.AllTaxSummBoldDataSet.BoldHandle:=BoldHandlesDM.blhAllDrivers;
    ReportDM.AllTaxSummBoldDataSet.Active:=True;
    ReportDM.AllTaxSummCDS.Active:=False;
    ReportDM.AllTaxSummCDS.Active:=True;
    ReportDM.AllTaxSummCDS.Active:=False;
    ReportDM.AllTaxSummCDS.Active:=True;
    ReportDM.AllTaxSummCDS.SaveToFile('proba.cds');
    ReportDM.AllTaxSummCDS.ProviderName:='';
   except
     ShowMessage('Ощибка обработки!');
     Close;
   end;
end;

procedure TMainRepSettForm.TabSheet1Show(Sender: TObject);
begin
  ReportDM.AllTaxSummCDS.Active:=False;
  ReportDM.AllTaxSummCDS.ProviderName:='AllTaxSummDataSetProvider';
end;

procedure TMainRepSettForm.Button1Click(Sender: TObject);
begin
  try
  StrToTime((BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Cvet_nachavshihsya);
  (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca:=
    StartOfTheDay(DateTimePicker2.Date)+StrToTime(TimeToStr(MainRepSettForm.DateTimePicker4.Time));
  (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala:=
     StartOfTheDay(DateTimePicker1.Date)+StrToTime(TimeToStr(MainRepSettForm.DateTimePicker3.Time));
  except
   ShowMessage('Неверное значение времени снятия отчётности, по умолчанию будет установлен0 08:00:00.');
   (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca:=
    StartOfTheDay(DateTimePicker2.Date)+StrToTime('08:00:00');

   (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala:=
     StartOfTheDay(DateTimePicker1.Date)+StrToTime('08:00:00');
  end;

  ReportDM.SMSRepADODS.Parameters.ParamByName('start_dt').Value:=
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala;
  ReportDM.SMSRepADODS.Parameters.ParamByName('start_dt2').Value:=
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala;
  ReportDM.SMSRepADODS.Parameters.ParamByName('end_dt').Value:=
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca;
  ReportDM.SMSRepADODS.Parameters.ParamByName('end_dt2').Value:=
    (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca;
  try
      ReportDM.SMSRepADODS.Active:=False;
      ReportDM.SMSRepADODS.Active:=True;
    except
      ShowMessage('Ошибка перезагрузки набора данных для отчета по СМС!');
    end;
end;

end.
