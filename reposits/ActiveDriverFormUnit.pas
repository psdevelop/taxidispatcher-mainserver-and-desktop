unit ActiveDriverFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, BoldGrid, BoldOclVariables,
  BoldSubscription, BoldHandles, BoldRootedHandles, BoldExpressionHandle,
  BoldPropertiesController, BoldElements, BoldControlPack, BoldStringControlPack,
  BoldAbstractListHandle, BoldCursorHandle, BoldListHandle,
  BoldViewerControlPack, BoldPlaceableSubscriber, BoldComboBox,
  BoldVariableHandle, BoldCheckBox;

type
  TActiveDriverForm = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure BoldGrid1Columns10LookupChange(DestElement,
      NewValue: TBoldElement);
    procedure basrIndividPercentSetAsString(Element: TBoldElement;
      NewValue: string; Representation: Integer; Expression: string);
    procedure BoldGrid1Columns13LookupChange(DestElement,
      NewValue: TBoldElement);
    procedure BoldGrid1Columns16LookupChange(DestElement,
      NewValue: TBoldElement);
    function BoldAsStringRenderer3GetAsString(Element: TBoldElement;
      Representation: Integer; Expression: string): string;
    procedure BoldGrid1Columns4LookupChange(DestElement,
      NewValue: TBoldElement);
    procedure BoldGrid1Columns5LookupChange(DestElement,
      NewValue: TBoldElement);
    function SectorBoldAsStringRendererGetAsString(Element: TBoldElement;
      Representation: Integer; Expression: string): string;
    procedure BoldAsStringRenderer1SetAsString(Element: TBoldElement;
      NewValue: string; Representation: Integer; Expression: string);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    PrevActVal: Boolean;
  end;

var
  ActiveDriverForm: TActiveDriverForm;

implementation

{$R *.dfm}

uses HandlesDM, ReleaseStructUnit, PopUpCompUnit, DateUtils, ModelDM, BusinessClasses, MainForm,
  ADODMUnit;

procedure TActiveDriverForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FirstForm.RefreshADODataSets;
   BoldModelDM.BoldUpdateDBAction1.Execute;
end;

procedure TActiveDriverForm.BitBtn2Click(Sender: TObject);
begin
if MessageDlg('����� � �������� ����� �������, �� �������� �������� ����������, ����������?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
 begin
  if MessageDlg('��� ����� ������ ��������, ���� �� �� �������� �� � ������ ���������� ����������� � � �������������, ����������?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
    BoldHandlesDM.blhAllDrivers.CurrentBoldObject.Delete;
   end; 
 end;
end;

procedure TActiveDriverForm.BoldAsStringRenderer1SetAsString(
  Element: TBoldElement; NewValue: string; Representation: Integer;
  Expression: string);
begin
  if Element<>nil then
    begin
     try
     StrToInt(NewValue);
     BoldModelDM.bvhCurrSyncDriver.Value.SetAsVariant(StrToInt(NewValue));
     if BoldModelDM.blhCurrSyncDriver.List.Count>0 then
     begin
       ShowMessage('�������� � ����� �������� ��� ����������!');
     end
     else
     begin
      if  (IniFile.ReadString('BUSINESS_DATA','enable_dr_num_set','NO')='YES') or ((Element as TVoditelj).Pozyvnoi=0) then
        (Element as TVoditelj).Pozyvnoi:=StrToInt(NewValue)
      else
        ShowMessage('��� ���������� ������ ��������');
     end;
     except
       ShowMessage('������ ������� ������� �������� ��������!');
     end;
    end;
end;

function TActiveDriverForm.SectorBoldAsStringRendererGetAsString(
  Element: TBoldElement; Representation: Integer; Expression: string): string;
begin
  Result := '';
  if Assigned(Element) then
  begin
   if (Element as TVoditelj).rabotaet_na_sektore<>nil then
     Result:=IntToStr((Element as TVoditelj).rabotaet_na_sektore.Nomer_sektora)+'-'+(Element as TVoditelj).rabotaet_na_sektore.Naimenovanie
   else
     Result:='�� ��������';
  end;
end;

procedure TActiveDriverForm.BoldGrid1Columns5LookupChange(DestElement,
  NewValue: TBoldElement);
begin
  (DestElement as TVoditelj).Familiya:=NewValue.AsString;
end;

procedure TActiveDriverForm.BoldGrid1Columns4LookupChange(DestElement,
  NewValue: TBoldElement);
begin
  (DestElement as TVoditelj).Nomer_deg_gruppy:=NewValue.GetAsVariant;
end;

function TActiveDriverForm.BoldAsStringRenderer3GetAsString(
  Element: TBoldElement; Representation: Integer; Expression: string): string;
begin
  Result := '';
  if Assigned(Element) then
  begin
    if (Element as TVoditelj).V_rabote then
      Result:='��'
    else
      Result:='���';  
  end;
end;

procedure TActiveDriverForm.BoldGrid1Columns16LookupChange(DestElement,
  NewValue: TBoldElement);
begin
  if DestElement<>nil then
    begin
      (DestElement as TVoditelj).Licenzionnaya_kart:=
        NewValue.AsString;
      BoldModelDM.BoldUpdateDBAction1.Execute;
    end;
end;

procedure TActiveDriverForm.BoldGrid1Columns13LookupChange(DestElement,
  NewValue: TBoldElement);
begin
  (DestElement as TVoditelj).otnositsya_k_gruppe:=
    (NewValue as TGruppa_voditelei);
end;

procedure TActiveDriverForm.basrIndividPercentSetAsString(Element: TBoldElement;
  NewValue: string; Representation: Integer; Expression: string);
begin
  if Element<>nil then
    begin
      if (BoldHandlesDM.blhCurrUser.CurrentElement
            as TPersonal).Razresh_administr then
              begin
                try
                  StrToFloat(NewValue);
                  (Element as TVoditelj).Individ_procent:=
                    StrToFloat(NewValue);
                except
                  ShowMessage('�������� ��������!');
                end;
              end
      else
        ShowMessage('��� ���� ��������������!');
    end;
end;

procedure TActiveDriverForm.BoldGrid1Columns10LookupChange(DestElement,
  NewValue: TBoldElement);
begin
  (DestElement as TVoditelj).cvet_avto:=NewValue.AsString;
end;

procedure TActiveDriverForm.FormShow(Sender: TObject);
begin
  BoldHandlesDM.bvhShowStaticWorker.Value.SetAsVariant(True);
  BoldHandlesDM.bvhShowStag.Value.SetAsVariant(True);
end;

end.
