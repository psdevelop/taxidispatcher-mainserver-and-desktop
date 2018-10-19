unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, DBCtrls, Grids, DBGrids, DBCGrids,
  ToolWin;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    DBCheckBox1: TDBCheckBox;
    DBGrid1: TDBGrid;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    Splitter2: TSplitter;
    DBCtrlGrid1: TDBCtrlGrid;
    Image1: TImage;
    DBText1: TDBText;
    DBText2: TDBText;
    DBGrid3: TDBGrid;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ActivateToolButton: TToolButton;
    ToolButton1: TToolButton;
    ProgrammSettingsToolButton: TToolButton;
    DBConnectSettingsToolButton: TToolButton;
    AdministrationPanelToolButton: TToolButton;
    ToolBar3: TToolBar;
    QuitToolButton: TToolButton;
    DBDataRefreshToolButton: TToolButton;
    StatusBar1: TStatusBar;
    procedure DBDataRefreshToolButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBGrid2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBCtrlGrid1Click(Sender: TObject);
    procedure QuitToolButtonClick(Sender: TObject);
    procedure ActivateToolButtonClick(Sender: TObject);
    procedure RefreshSectorDrivers;
    procedure RefreshDBData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses ADODMUnit, AnapaMapUnit;

procedure TMainForm.RefreshSectorDrivers;
begin
if ADOConnectDM.MainADOConnection.Connected then
begin
 try
  if ADOConnectDM.AllSectorsADOQuery.RecordCount>0 then
  begin
    ADOConnectDM.AllSectorDriversADOQuery.Parameters[0].Value:=
      ADOConnectDM.AllSectorsADOQuery.FindField('BOLD_ID').AsInteger;
    ADOConnectDM.AllSectorDriversADOQuery.Active:=False;
    ADOConnectDM.AllSectorDriversADOQuery.Active:=True;
  end;
 except
   ShowMessage('Неудачное обновление списка водителей сектора!');
 end;
end;
end;

procedure TMainForm.ActivateToolButtonClick(Sender: TObject);
begin
  ADOConnectDM.MainADOConnection.Connected:=
    not ADOConnectDM.MainADOConnection.Connected;
  if ADOConnectDM.MainADOConnection.Connected then
    begin
      ActivateToolButton.ImageIndex:=3;
      RefreshDBData;
      RefreshSectorDrivers;
      StateMapForm.CreateSectors;
      ADOConnectDM.SetCurrUserParam;
      MainForm.StatusBar1.Panels[0].Text:=
        'Соединение активно';
      DBDataRefreshToolButton.Enabled:=
        True;  
    end
  else
    begin
      ActivateToolButton.ImageIndex:=0;
      Close;
    end;
end;

procedure TMainForm.QuitToolButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.RefreshDBData;
begin
  ADOConnectDM.ActiveCustADOQuery.Active:=False;
  ADOConnectDM.AllActDrNumADOQuery.Active:=False;
  ADOConnectDM.AllSectorsADOQuery.Active:=False;
  ADOConnectDM.AllSectorDriversADOQuery.Active:=False;
  ADOConnectDM.ActiveCustADOQuery.Active:=True;
  ADOConnectDM.AllActDrNumADOQuery.Active:=True;
  ADOConnectDM.AllSectorsADOQuery.Active:=True;
  ADOConnectDM.AllSectorDriversADOQuery.Active:=True;

  ADOConnectDM.BoldIDADOTable.Active:=False;
  ADOConnectDM.BoldIDADOTable.Active:=True;
  ADOConnectDM.UnionObjADOTable.Active:=False;
  ADOConnectDM.UnionObjADOTable.Active:=True;
  ADOConnectDM.HistoryADOTable.Active:=False;
  ADOConnectDM.HistoryADOTable.Active:=True;

  
end;

procedure TMainForm.DBCtrlGrid1Click(Sender: TObject);
begin
  RefreshSectorDrivers;
end;

procedure TMainForm.DBGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //
end;

procedure TMainForm.ToolButton1Click(Sender: TObject);
begin
try
  MainForm.ToolButton1.Enabled:=False;
  ADOConnectDM.ActiveCustADOQuery.Post;
except
  ShowMessage('Неудачное сохранение данных!');
end;
end;

procedure TMainForm.DBDataRefreshToolButtonClick(Sender: TObject);
begin
  RefreshBaseGrids:=True;
      
  ADOConnectDM.ActiveCustADOQuery.Active:=False;
  ADOConnectDM.AllActDrNumADOQuery.Active:=False;
  ADOConnectDM.AllSectorsADOQuery.Active:=False;
  ADOConnectDM.AllSectorDriversADOQuery.Active:=False;
  ADOConnectDM.ActiveCustADOQuery.Active:=True;
  ADOConnectDM.AllActDrNumADOQuery.Active:=True;
  ADOConnectDM.AllSectorsADOQuery.Active:=True;
  ADOConnectDM.AllSectorDriversADOQuery.Active:=True;

  RefreshBaseGrids:=False;
end;

end.
