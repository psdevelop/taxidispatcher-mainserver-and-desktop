program UnionDisp;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  ADODMUnit in 'ADODMUnit.pas' {ADOConnectDM: TDataModule},
  AnapaMapUnit in 'AnapaMapUnit.pas' {StateMapForm},
  ImageLists in 'ImageLists.pas' {ImageListsDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TADOConnectDM, ADOConnectDM);
  Application.CreateForm(TStateMapForm, StateMapForm);
  Application.CreateForm(TImageListsDM, ImageListsDM);
  Application.Run;
end.
