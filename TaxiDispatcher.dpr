program TaxiDispatcher;

uses
  Forms,
  Dialogs,
  SysUtils,
  MainForm in 'disp_mode\MainForm.pas' {FirstForm},
  ModelDM in 'ModelDM.pas' {BoldModelDM: TDataModule},
  HandlesDM in 'disp_mode\HandlesDM.pas' {BoldHandlesDM: TDataModule},
  ImageLists in 'reposits\ImageLists.pas' {ImageListsDM: TDataModule},
  ABOUT in 'reposits\ABOUT.pas' {AboutBox},
  BusinessClasses in 'BusinessClasses.pas',
  PopUpCompUnit in 'reposits\PopUpCompUnit.pas' {PopUpDM: TDataModule},
  BoldOtherHandlCompUnit in 'reposits\BoldOtherHandlCompUnit.pas' {BoldOthHandleCompDM: TDataModule},
  ReleaseStructUnit in 'disp_mode\ReleaseStructUnit.pas' {ReleaseStructForm},
  ReportDMUnit in 'Reports\ReportDMUnit.pas' {ReportDM: TDataModule},
  AdministrationPanelUnit in 'reposits\AdministrationPanelUnit.pas' {AdminPanelForm},
  ADOConsts in 'ADO\ADOConsts.pas',
  BoldADOInterfaces in 'ADO\BoldADOInterfaces.pas',
  BoldDatabaseAdapterADO in 'ADO\BoldDatabaseAdapterADO.pas',
  BoldPersistenceHandleADO in 'ADO\BoldPersistenceHandleADO.pas',
  BoldPersistenceHandleADOReg in 'ADO\BoldPersistenceHandleADOReg.pas',
  AnnonceArhiveFormUnit in 'reposits\AnnonceArhiveFormUnit.pas' {AnnonceArhiveFormForm},
  MainRepSetFormUnit in 'Reports\MainRepSetFormUnit.pas' {MainRepSettForm},
  DriversIncomeUnit in 'reposits\DriversIncomeUnit.pas' {DriversIncomeForm},
  PrSettingsFormUnit in 'reposits\PrSettingsFormUnit.pas' {PrSettForm},
  OneDriversOnDaysRepSettUnit in 'Reports\OneDriversOnDaysRepSettUnit.pas' {OneDaysOnRepSettForm},
  PrevCustUnit in 'reposits\PrevCustUnit.pas' {PrevCustDatesForm},
  CustDelUnit in 'reposits\CustDelUnit.pas' {CustDelForm},
  SectorEnumsUnit in 'reposits\SectorEnumsUnit.pas' {SectorEnumForm},
  AnapaMapUnit in 'reposits\AnapaMapUnit.pas' {StateMapForm},
  DriversEffectiveDgrUnit in 'Reports\DriversEffectiveDgrUnit.pas' {DrEffictiveDgrForm},
  CustIntervalSetUnit in 'reposits\CustIntervalSetUnit.pas' {CustIntervalSetForm},
  SystemEnumsUnit in 'reposits\SystemEnumsUnit.pas' {SystemEnumsForm},
  ComplexRepSetUnit in 'reposits\ComplexRepSetUnit.pas' {StatRepSetForm},
  ADODMUnit in 'disp_mode\ADODMUnit.pas' {ADOConnectDM: TDataModule},
  SetTimeDateIntervalUnit in 'reposits\SetTimeDateIntervalUnit.pas' {SetDateIntervalForm},
  UnitCOMFileLevel in 'com_port\modem\UnitCOMFileLevel.pas' {ModemSettingsForm},
  SoundRecordUnit in 'SoundRecord\SoundRecordUnit.pas' {SoundRecForm},
  EconomicalEffectiveDgrUnit in 'Reports\EconomicalEffectiveDgrUnit.pas' {EconomicalEffectDgrForm},
  MainModeSelectUnit in 'reposits\MainModeSelectUnit.pas' {MainModeSelectForm},
  BadReasoneForm in 'reposits\BadReasoneForm.pas' {BadReasone},
  OnLineNumSetUnit in 'reposits\OnLineNumSetUnit.pas' {OnLineSetNumForm},
  DrWorkExecRepUnit in 'Reports\DrWorkExecRepUnit.pas' {DrExecRepSettForm},
  FictiveCustDelDateUnit in 'reposits\FictiveCustDelDateUnit.pas' {FictOrdDelDateForm},
  DrWorkExecTableUnit in 'Reports\DrWorkExecTableUnit.pas' {DrWorkExecTableForm},
  IndividNumSetUnit in 'reposits\IndividNumSetUnit.pas' {SetIndividNumForm},
  RemoteCtrlAdmUnit in 'reposits\RemoteCtrlAdmUnit.pas' {RemoteCtrlAdmForm},
  WaitFormUnit in 'disp_mode\WaitFormUnit.pas' {AppWaitForm},
  EmptyConnectionUnit in 'disp_mode\EmptyConnectionUnit.pas' {EmptyConnForm},
  USBAccess in 'reposits\USBAccess.pas' {USBAccessForm},
  AbOrdersRepSettFormUnit in 'Reports\AbOrdersRepSettFormUnit.pas' {AbOrdersRepSettForm};

{$R *.res}

begin
 try
  Application.Initialize;
  Application.CreateForm(TFirstForm, FirstForm);
  Application.CreateForm(TBoldModelDM, BoldModelDM);
  Application.CreateForm(TBoldHandlesDM, BoldHandlesDM);
  Application.CreateForm(TImageListsDM, ImageListsDM);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TPopUpDM, PopUpDM);
  Application.CreateForm(TBoldOthHandleCompDM, BoldOthHandleCompDM);
  Application.CreateForm(TReleaseStructForm, ReleaseStructForm);
  Application.CreateForm(TReportDM, ReportDM);
  Application.CreateForm(TAdminPanelForm, AdminPanelForm);
  Application.CreateForm(TAnnonceArhiveFormForm, AnnonceArhiveFormForm);
  Application.CreateForm(TMainRepSettForm, MainRepSettForm);
  Application.CreateForm(TDriversIncomeForm, DriversIncomeForm);
  Application.CreateForm(TPrSettForm, PrSettForm);
  Application.CreateForm(TOneDaysOnRepSettForm, OneDaysOnRepSettForm);
  Application.CreateForm(TPrevCustDatesForm, PrevCustDatesForm);
  Application.CreateForm(TCustDelForm, CustDelForm);
  Application.CreateForm(TSectorEnumForm, SectorEnumForm);
  Application.CreateForm(TStateMapForm, StateMapForm);
  Application.CreateForm(TDrEffictiveDgrForm, DrEffictiveDgrForm);
  Application.CreateForm(TCustIntervalSetForm, CustIntervalSetForm);
  Application.CreateForm(TSystemEnumsForm, SystemEnumsForm);
  Application.CreateForm(TStatRepSetForm, StatRepSetForm);
  Application.CreateForm(TADOConnectDM, ADOConnectDM);
  Application.CreateForm(TSetDateIntervalForm, SetDateIntervalForm);
  Application.CreateForm(TModemSettingsForm, ModemSettingsForm);
  Application.CreateForm(TSoundRecForm, SoundRecForm);
  Application.CreateForm(TEconomicalEffectDgrForm, EconomicalEffectDgrForm);
  Application.CreateForm(TMainModeSelectForm, MainModeSelectForm);
  Application.CreateForm(TBadReasone, BadReasone);
  Application.CreateForm(TOnLineSetNumForm, OnLineSetNumForm);
  Application.CreateForm(TDrExecRepSettForm, DrExecRepSettForm);
  Application.CreateForm(TFictOrdDelDateForm, FictOrdDelDateForm);
  Application.CreateForm(TDrWorkExecTableForm, DrWorkExecTableForm);
  Application.CreateForm(TSetIndividNumForm, SetIndividNumForm);
  Application.CreateForm(TRemoteCtrlAdmForm, RemoteCtrlAdmForm);
  Application.CreateForm(TAppWaitForm, AppWaitForm);
  Application.CreateForm(TEmptyConnForm, EmptyConnForm);
  Application.CreateForm(TUSBAccessForm, USBAccessForm);
  Application.CreateForm(TAbOrdersRepSettForm, AbOrdersRepSettForm);
  try
    Application.Run;
  except on E: Exception do
   begin
    ShowMessage('��������� ���������, ��������������� �������������. '+E.Message);
   end;
  end;
 except on E: Exception do
   begin
    ShowMessage('��������� ���������, ��������������� �������������. '+E.Message);
   end;
  end;
end.
