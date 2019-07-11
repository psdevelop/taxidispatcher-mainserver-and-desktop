unit IndividNumSetUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, ComCtrls, Grids, DBGrids, BusinessClasses;

type
  TSetIndividNumForm = class(TForm)
    Panel3: TPanel;
    Panel1: TPanel;
    sEdit1: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    function PrevAnalyzeIN(tin: string): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetIndividNumForm: TSetIndividNumForm;
  pbel: TPersona;
  UseIndividParam: Boolean;
  SelectNewNumMode: Boolean=False;
  NewINumber: Integer=-1;
  AddOrderAndINumMode: Boolean=False;

implementation

{$R *.dfm}

uses ModelDM, MainForm, ADODMUnit, ReleaseStructUnit;

procedure TSetIndividNumForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Integer(Key)=13 then
    Edit2.SetFocus;
end;

procedure TSetIndividNumForm.Panel1Click(Sender: TObject);
begin
  TabSheet1.Show;
  sEdit1.Text:=IntToStr(BoldModelDM.GetNewIPersNum);
  Edit1.SetFocus;
end;

procedure TSetIndividNumForm.Button1Click(Sender: TObject);
var NewIN: Integer;
begin
  if BoldModelDM.bsh.Active then
    begin
    NewIN:=PrevAnalyzeIN(sEdit1.Text);
    if (NewIN=-1) then
            begin
              ShowMessage('Абонент с таким номером уже существует!');
              Exit;
            end
          else
            begin
              pbel:=TPersona.Create(nil);
              pbel.Elektronnyi_adres:='Индивидуальный клиент';
              pbel.Familiya:=Edit1.Text;
              pbel.Imya:=Edit2.Text;
              pbel.Otchestvo:=Edit3.Text;
              pbel.Rabochii_telefon:=Edit4.Text;
              pbel.Ulica:=Edit5.Text;
              pbel.Dom:=0;
              pbel.Korpus:=NewIN;
              NewINumber:=NewIN;
              BoldModelDM.bsh.UpdateDatabase;

              ReleaseStructForm.StatusBar2.Panels[2]
                       .Text:='Последний аб-т '+
                       Edit1.Text+' '+
                       Edit2.Text+' '+
                       Edit3.Text;

              UseIndividParam:=True;
              Close;
            end;
    end;

end;

procedure TSetIndividNumForm.FormShow(Sender: TObject);
begin
  UseIndividParam:=False;
  sEdit1.Text:='';
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Edit5.Text:='';
  if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
    if ((ADOConnectDM.ActiveCustADOQuery.FindField('Adres_vyzova_vvodim').AsString<>'') or
                  (ADOConnectDM.ActiveCustADOQuery.FindField('Telefon_klienta').AsString<>'')) and
                  (ADOConnectDM.ActiveCustADOQuery.FindField('Pozyvnoi_ustan').AsInteger=0) and
                  (ADOConnectDM.ActiveCustADOQuery.FindField('Adres_okonchaniya_zayavki').AsString='')
                  and
                  (IniFile.ReadString('BUSINESS_DATA','добавление_новых_аб_данных_к_неоконченной_заявке','NO')='YES') then 
                      begin
                       if ADOConnectDM.ActiveCustADOQuery.FindField('Telefon_klienta').AsString<>'' then
                        Edit4.Text:=ADOConnectDM.ActiveCustADOQuery.FindField('Telefon_klienta').AsString;
                       if ADOConnectDM.ActiveCustADOQuery.FindField('Adres_vyzova_vvodim').AsString<>'' then
                        Edit5.Text:=ADOConnectDM.ActiveCustADOQuery.FindField('Adres_vyzova_vvodim').AsString;
                      end;

  BoldModelDM.GetIPersByNum(-1);
  if SelectNewNumMode then
    begin
      SetIndividNumForm.Caption:=
        'Введите новый номер клиента...';
      Panel1.Visible:=False;
      PageControl1.Visible:=False;
      sEdit1.Text:=IntToStr(BoldModelDM.GetNewIPersNum);
    end;

  sEdit1.SetFocus;
  
  if AddOrderAndINumMode then
    SetIndividNumForm.Panel1Click(
      SetIndividNumForm.Panel1);
end;

procedure TSetIndividNumForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SelectNewNumMode:=False;
  AddOrderAndINumMode:=False;
  SetIndividNumForm.Caption:=
    'Индивидуальный номер клиента (кнопка-новый)...';
  Panel1.Visible:=True;
  PageControl1.Visible:=True;
end;

function TSetIndividNumForm.PrevAnalyzeIN(tin: string): Integer;
var NewIN: Integer;
begin
  //NewIN:=-1;
  if tin='' then
        begin
            NewIN:=BoldModelDM.GetNewIPersNum;
        end
    else
        begin
           try
             NewIN:=StrToInt(tin);
           except
             NewIN:=-1;
             ShowMessage('Некорректно введено целочисленное значение!');
           end;

           if NewIN<=0 then
             begin
               NewIN:=-1;
               ShowMessage('Значение должно быть больше нуля!');
             end;

           NewIN:=BoldModelDM.GetIPersByNum(NewIN);
        end;
   Result:=NewIN;
end;

procedure TSetIndividNumForm.sEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var NewIN: Integer;
begin
  if Integer(Key)=13 then
    begin
      NewIN:=PrevAnalyzeIN(sEdit1.Text);
      if SelectNewNumMode then
        begin
          if (NewIN=-1) then
            begin
              ShowMessage('Абонент с таким номером уже существует!');
              Exit;
            end
          else
            begin
              if NewIN>0 then
                begin
                  NewINumber:=NewIN;
                  UseIndividParam:=True;
                  Close;
                end;
            end;
        end
      else
        begin
           if TabSheet1.Visible then
             begin
               SetIndividNumForm.Button1Click(
                 SetIndividNumForm.Button1);
             end
           else if TabSheet2.Visible then
             begin
               if BoldModelDM.IPersPerINumADOQuery.RecordCount=1 then
                 begin
                     Edit4.Text:=
                       BoldModelDM.IPersPerINumADOQuery.
                       FieldByName('Rabochii_telefon').AsString;
                     Edit5.Text:=
                       BoldModelDM.IPersPerINumADOQuery.
                       FieldByName('Ulica').AsString;
                     NewINumber:=
                       BoldModelDM.IPersPerINumADOQuery.
                       FieldByName('Korpus').AsInteger;
                     ReleaseStructForm.StatusBar2.Panels[2]
                       .Text:='Последний аб-т '+
                       BoldModelDM.IPersPerINumADOQuery.
                       FieldByName('Familiya').AsString+' '+
                       BoldModelDM.IPersPerINumADOQuery.
                       FieldByName('Imya').AsString+' '+
                       BoldModelDM.IPersPerINumADOQuery.
                       FieldByName('Otchestvo').AsString;
                     UseIndividParam:=True;
                     Close;
                 end
               else if BoldModelDM.IPersPerINumADOQuery.RecordCount>1 then
                 begin
                   ShowMessage('Система нашла несколько записей по данному абоненту, выберите одну из них в таблице!');
                   DBGrid1.SetFocus;
                 end
               else if BoldModelDM.IPersPerINumADOQuery.RecordCount=0 then
                 begin
                   ShowMessage('Нет абонента с таким номером!');
                   Close;
                 end
               else
                 begin
                 end;
             end
           else
             begin
             end;
        end;

    end
   else
     if TabSheet2.Visible then
             begin
               PrevAnalyzeIN(sEdit1.Text);
             end;
end;

procedure TSetIndividNumForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Integer(Key)=13 then
    Edit3.SetFocus;
end;

procedure TSetIndividNumForm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Integer(Key)=13 then
    Edit4.SetFocus;
end;

procedure TSetIndividNumForm.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if Integer(Key)=13 then
    Edit5.SetFocus;
end;

procedure TSetIndividNumForm.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if Integer(Key)=13 then
    Button1.SetFocus;
end;

procedure TSetIndividNumForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Integer(Key)=13 then
    begin
      Edit4.Text:=
        BoldModelDM.IPersPerINumADOQuery.
        FieldByName('Rabochii_telefon').AsString;
      Edit5.Text:=
        BoldModelDM.IPersPerINumADOQuery.
        FieldByName('Ulica').AsString;
      NewINumber:=
        BoldModelDM.IPersPerINumADOQuery.
        FieldByName('Korpus').AsInteger;
      ReleaseStructForm.StatusBar2.Panels[2]
                       .Text:='Последний аб-т '+
                       BoldModelDM.IPersPerINumADOQuery.
                       FieldByName('Familiya').AsString+' '+
                       BoldModelDM.IPersPerINumADOQuery.
                       FieldByName('Imya').AsString+' '+
                       BoldModelDM.IPersPerINumADOQuery.
                       FieldByName('Otchestvo').AsString;  
      UseIndividParam:=True;
      Close;
    end; 
end;

procedure TSetIndividNumForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Integer(Key)=27) then
    begin
      //UseIndividParam:=False;
      //Close;
    end;
end;

end.
