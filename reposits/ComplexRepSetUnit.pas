unit ComplexRepSetUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, BoldComboBox;

type
  TStatRepSetForm = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SetBVH;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StatRepSetForm: TStatRepSetForm;

implementation

{$R *.dfm}

uses HandlesDM, ReportDMUnit, DateUtils, BusinessClasses, ModelDM;

procedure TStatRepSetForm.SetBVH;
begin
  //Процедура установка начальных и конечных дат и времени
  //статистических отчётов
  //ReportDM.bvhStartDate.Value.SetAsVariant(FloatToDateTime(Double(DateOf(DateTimePicker1.Date))+TimeOf(DateTimePicker2.Time)));
  //ReportDM.bvhEndDate.Value.SetAsVariant(FloatToDateTime(Double(DateOf(DateTimePicker3.Date))+TimeOf(DateTimePicker4.Time)));
  ReportDM.JournalADOQuery.Parameters[0].Value:=
    FloatToDateTime(Double(DateOf(DateTimePicker1.Date))+TimeOf(DateTimePicker2.Time));
  ReportDM.JournalADOQuery.Parameters[1].Value:=
    FloatToDateTime(Double(DateOf(DateTimePicker3.Date))+TimeOf(DateTimePicker4.Time));
  (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_nachala:=FloatToDateTime(Double(DateOf(DateTimePicker1.Date))+TimeOf(DateTimePicker2.Time));
  (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Data_konca:=FloatToDateTime(Double(DateOf(DateTimePicker3.Date))+TimeOf(DateTimePicker4.Time));
  ReportDM.RvProject.SetParam('StartDate',DateTimeToStr(FloatToDateTime(Double(DateOf(DateTimePicker1.Date))+TimeOf(DateTimePicker2.Time))));
  ReportDM.RvProject.SetParam('EndDate',DateTimeToStr(FloatToDateTime(Double(DateOf(DateTimePicker3.Date))+TimeOf(DateTimePicker4.Time))));
end;

procedure TStatRepSetForm.BitBtn1Click(Sender: TObject);
begin
  SetBVH;
  try
    if BoldModelDM.ADOConnection.Connected then
      begin
        ReportDM.JournalADOQuery.Active:=False;
        if CheckBox1.Checked then
          ReportDM.JournalADOQuery.Parameters.
            ParamByName('enable_arh').Value:=1
        else
          ReportDM.JournalADOQuery.Parameters.
            ParamByName('enable_arh').Value:=0;
        ReportDM.JournalADOQuery.Active:=True;
      end;

    ReportDM.RvProject.ExecuteReport('JournalReport');
  except
    ShowMessage('Неудачное извлечение данных отчёта ЖУРНАЛ');
  end;

end;

procedure TStatRepSetForm.BitBtn2Click(Sender: TObject);
begin
  if BoldHandlesDM.blhUsersList.List.Count>0 then
    begin
      SetBVH;
      try
    ReportDM.bdsDispStat.BoldHandle:=
      BoldHandlesDM.blhUsersList;
    ReportDM.bdsDispStat.Active:=True;
    ReportDM.cdsDispStat.Active:=False;
    ReportDM.cdsDispStat.Active:=True;
    ReportDM.cdsDispStat.Active:=False;
    ReportDM.cdsDispStat.Active:=True;

    ReportDM.RvProject.ExecuteReport('DispStatReport');
  except
    ShowMessage('Неудачное извлечение данных');
  end;
  ReportDM.bdsDispStat.Active:=False;
  ReportDM.bdsDispStat.BoldHandle:=
      nil;
    end
  else
    begin
      ShowMessage('Нет ни одного диспетчера в системе!');
    end;
end;

procedure TStatRepSetForm.BitBtn3Click(Sender: TObject);
begin
  if BoldHandlesDM.blhAllDrivers.List.Count>0 then
    begin
      SetBVH;
      try
    ReportDM.DrStateADODS.Active:=False;
    ReportDM.DrStateADODS.Parameters.ParamByName('st_date').Value:=
      FloatToDateTime(Double(DateOf(DateTimePicker1.Date))+TimeOf(DateTimePicker2.Time));
      //StartOfTheDay(DateTimePicker1.DateTime);
    ReportDM.DrStateADODS.Parameters.ParamByName('end_date').Value:=
      FloatToDateTime(Double(DateOf(DateTimePicker3.Date))+TimeOf(DateTimePicker4.Time));
      //StartOfTheDay(DateTimePicker3.DateTime);
    //ShowMessage(DateTimeToStr(ReportDM.DrStateADODS.Parameters.ParamByName('st_date').Value)+'---'+
    //  DateTimeToStr(ReportDM.DrStateADODS.Parameters.ParamByName('end_date').Value));
    ReportDM.DrStateADODS.Active:=True;

    ReportDM.RvProject.ExecuteReport('DrStatReport');
  except
    ShowMessage('Неудачное извлечение данных');
  end;
    end
  else
    begin
      ShowMessage('Нет ни одного водителя в системе!');
    end;
end;

procedure TStatRepSetForm.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date:=Today;
  DateTimePicker2.Time:=Time;
  DateTimePicker3.Date:=Today;
  DateTimePicker4.Time:=Time;
end;

procedure TStatRepSetForm.FormShow(Sender: TObject);
begin
  CheckBox1.Checked:=False;
end;

end.
