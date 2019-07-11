unit CustDelUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BoldDataSet, Provider, DB, DBClient, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, BoldSubscription, BoldHandles, BoldRootedHandles,
  BoldExpressionHandle, BoldPropertiesController, ComCtrls;

type
  TCustDelForm = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    BoldDataSet1: TBoldDataSet;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    BoldPropertiesController1: TBoldPropertiesController;
    behDelCustCount: TBoldExpressionHandle;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn5: TBitBtn;
    Memo1: TMemo;
    Splitter1: TSplitter;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    DelDate: TDateTime;
  end;

var
  CustDelForm: TCustDelForm;

implementation

{$R *.dfm}

uses HandlesDM, ADODMUnit, ModelDM, ReportDMUnit, BusinessClasses, DateUtils, ADODB, MainForm, SetTimeDateIntervalUnit;

procedure TCustDelForm.BitBtn3Click(Sender: TObject);
var date_prm: TParameter;
begin
if ClientDataSet1.ProviderName='' then
begin
 if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
    begin

    end
  else
    begin
      try
       if MessageDlg('Удалить список объявлений из рабочей базы?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
            if BoldModelDM.MainADOCommand.Parameters.Count=0 then
                    begin
                     date_prm:=BoldModelDM.MainADOCommand.Parameters.AddParameter;
                     date_prm.DataType:=ftDateTime;
                     date_prm.Name:='date_prm';
                     date_prm.Value:=DelDate;
                    end;
            BoldModelDM.MainADOCommand.Parameters[0].Value:=DelDate;
            if not BoldModelDM.SendSQL('DELETE from Zakaz WHERE (Nachalo_zakaza_data<:date_prm) and (Zavershyon<>0)') then
                ShowMessage('Неудачное удаление заявок!');
            ShowMessage('Перезагрузите приложение!!');
            FirstForm.Close;
          end;
       except
       end;
    end;

end
else
  ShowMessage('Сохраните выгруженный список заказов!');
end;

procedure TCustDelForm.FormShow(Sender: TObject);
begin
 ClientDataSet1.FileName:='';
 ClientDataSet1.ProviderName:='DataSetProvider1';

 ClientDataSet1.Filtered:=
         False;
 ADOConnectDM.CustDelADOQuery.Filtered:=
         False;
         
 if (IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
 begin

 end
 else
   begin
     DataSource1.DataSet:=
       ADOConnectDM.CustDelADOQuery;
   end;
  BitBtn3.Enabled:=True;
end;

procedure TCustDelForm.BitBtn2Click(Sender: TObject);
begin
  BitBtn1.Enabled:=False;
  BitBtn3.Enabled:=False;
  BitBtn4.Enabled:=True;
  if OpenDialog1.Execute then
    begin

           try
             DataSource1.DataSet:=
               ClientDataSet1;
             ClientDataSet1.Active:=False;
             ClientDataSet1.ProviderName:='';
             ClientDataSet1.LoadFromFile(OpenDialog1.FileName);

           except
           try
           DataSource1.DataSet:=
             ADOConnectDM.CustDelADOQuery;
           ADOConnectDM.CustDelADOQuery.Connection:=
             nil;
           ADOConnectDM.CustDelADOQuery.LoadFromFile
             (OpenDialog1.FileName);
           Label3.Caption:=
             'открыто заявок-'+IntToStr(
               ADOConnectDM.CustDelADOQuery.RecordCount);
           except
             ShowMessage('Неудачная загрузка файла');
           end;
           end;

    end;
end;

procedure TCustDelForm.BitBtn1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    begin
     if (IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
  begin
      ClientDataSet1.SaveToFile(SaveDialog1.FileName);
      ClientDataSet1.Active:=False;
      ClientDataSet1.ProviderName:='';
      ClientDataSet1.LoadFromFile(SaveDialog1.FileName);
      BoldDataSet1.Active:=False;
      BoldDataSet1.BoldHandle:=nil;
      end
     else
       begin
         ADOConnectDM.CustDelADOQuery.SaveToFile(SaveDialog1.FileName);
       end;
    end;
  ClientDataSet1.ProviderName:='';
end;

procedure TCustDelForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BoldDataSet1.Active:=False;
  BoldDataSet1.BoldHandle:=nil;
  ADOConnectDM.CustDelADOQuery.Active:=False;
  //BoldHandlesDM.blhDelCusts.RootHandle:=
  //       nil;
end;

procedure TCustDelForm.BitBtn4Click(Sender: TObject);
begin
  if ClientDataSet1.Active then
     begin
       ClientDataSet1.Filter:=
         'pozyvnoi='+Edit1.Text;
       ClientDataSet1.Filtered:=
         True;
       ReportDM.RvProject.ExecuteReport('ArhiveReport');
       ClientDataSet1.Filtered:=
         False;
     end
 else
     begin
       ADOConnectDM.CustDelADOQuery.Filter:=
         'pozyvnoi='+Edit1.Text;
       ADOConnectDM.CustDelADOQuery.Filtered:=
         True;
       ReportDM.RvProject.ExecuteReport('ArhiveReport2');
       ADOConnectDM.CustDelADOQuery.Filtered:=
         False;
     end;


end;

procedure TCustDelForm.FormCreate(Sender: TObject);
begin
if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
    begin
    end
  else
   begin
    if IniFile.ReadString('BUSINESS_DATA','hybrid_SQLLEV_mode','NO')='YES' then
     begin
       behDelCustCount.RootHandle:=
         nil;
     end;
   end;
end;

procedure TCustDelForm.BitBtn5Click(Sender: TObject);
var ch_array: array[0..255] of Char;
    analyze_str: string;
    i, symbol_count: Integer;
    result_str: string;
begin
  Memo1.Clear;
  if ADOConnectDM.CustDelADOQuery.RecordCount>0 then
    begin
      ADOConnectDM.CustDelADOQuery.First;
      while True do
        begin
          result_str:='';
          if (ADOConnectDM.CustDelADOQuery.FindField('telefon_klienta').
            AsString<>'Фиктивная') and (
            ADOConnectDM.CustDelADOQuery.FindField('nachalo_zakaza_data').AsDateTime
            >StartOfTheDay(DateTimePicker1.DateTime)) then
              begin
                analyze_str:=ADOConnectDM.CustDelADOQuery.
                  FindField('poln_imya_disp').AsString;
                StrPCopy(ch_array,analyze_str);
                if StrLen(ch_array)>0 then
                  begin
                    symbol_count:=0;
                    for i:=0 to StrLen(ch_array)-1 do
                      begin
                        if symbol_count>=2 then
                          begin
                            result_str:=
                              result_str+String(ch_array[i]);
                          end;
                        if ch_array[i]=',' then
                          symbol_count:=symbol_count+1;
                      end;
                  end;
              end;
          if result_str<>'' then
           begin

            if result_str=' диспетчер ГАЛЯ' then
              result_str:='Galia';
            if result_str=' диспетчер НИНА' then
              result_str:='Nina';
            if result_str=' диспетчер Нинок' then
              result_str:='Ninok';
            if result_str=' диспетчер Маша' then
              result_str:='Masha';
            if result_str=' диспетчер АННА' then
              result_str:='Anna';
            if result_str=' диспетчер ТАНЯ' then
              result_str:='Tania';
            if result_str=' диспетчер Директор' then
              result_str:='Direktor';
            Memo1.Lines.Add(result_str);
           // Memo1.Lines.Strings[0].
            Label4.Caption:=
              'извлечено заявок - '+IntToStr(Memo1.Lines.Count);
           end;
          if ADOConnectDM.CustDelADOQuery.Eof then
            Break
          else
            ADOConnectDM.CustDelADOQuery.Next;
        end;
    end
  else
    ShowMessage('Нет данных!');
end;

end.
