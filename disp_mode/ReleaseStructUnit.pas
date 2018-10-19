unit ReleaseStructUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, BoldGrid, Buttons, BoldTreeView,
  ToolWin, ExtCtrls, BoldElements, OleCtnrs,
  BoldSystem, DB, DBGrids, DBCGrids, DBCtrls,
  BoldHandles, Mask, ActnList, Menus, BusinessClasses, ADODB;

type

  TFrameType = ( frtSquare, frtSmoothSuqare, frtNone );
  TBackGrndType = ( bktWhite, bktInvers );

  TReleaseStructForm = class(TForm)
    Panel1: TPanel;

    MainPanel: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    LeftPageControl: TPageControl;
    TabSheet1: TTabSheet;
    StatusBar2: TStatusBar;
    SectorsTabSheet: TTabSheet;
    DBGrid1: TDBGrid;
    PageControl5: TPageControl;
    DispModeTabSheet: TTabSheet;
    Splitter3: TSplitter;
    StartTabSheet: TTabSheet;
    Panel3: TPanel;
    Panel17: TPanel;
    OnLanchOnTreeBitBtn: TBitBtn;
    BitBtn3: TBitBtn;
    BoldTreeView1: TBoldTreeView;
    DispModePanel: TPanel;
    sPanel1: TPanel;
    Panel6: TPanel;
    Label5: TLabel;
    EndedCustDBGrid: TDBGrid;
    TopEndCPanel: TPanel;
    OnlySpecCustCheckBox: TCheckBox;
    UpDown3: TUpDown;
    UpDown2: TUpDown;
    UpDown1: TUpDown;
    sLabel2: TLabel;
    TopOrdersPanel: TPanel;
    DBText1: TDBText;
    DispDBGrid: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    sEdit3: TEdit;
    sEdit2: TEdit;
    sEdit1: TEdit;
    sEdit4: TEdit;
    sEdit5: TEdit;
    AdditDispPageControl: TPageControl;
    sTabSheet4: TTabSheet;
    sTabSheet6: TTabSheet;
    LastWeekIndOrdTabSheet: TTabSheet;
    DBGrid2: TDBGrid;
    DBMemo1: TDBMemo;
    Gauge: TProgressBar;
    DBText2: TDBText;
    sLabel6: TLabel;
    sLabel7: TLabel;
    sLabel1: TLabel;
    StacksPanel: TPanel;
    DrStackStringGrid: TStringGrid;
    Panel4: TPanel;
    AbNumberImportTabSheet: TTabSheet;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    BitBtn4: TBitBtn;
    TabSheet2: TTabSheet;
    DBGrid4: TDBGrid;
    PretendsTabSheet: TTabSheet;
    PretendsDBGrid: TDBGrid;
    ImportCallPhonesTabSheet: TTabSheet;
    Panel7: TPanel;
    DBGrid5: TDBGrid;
    BitBtn1: TBitBtn;
    DBCtrlGrid1: TDBCtrlGrid;
    DBMemo2: TDBMemo;
    OrderOptionTabSheet: TTabSheet;
    Panel8: TPanel;
    SaveOOptsBitBtn: TBitBtn;
    DBGrid6: TDBGrid;
    Splitter4: TSplitter;
    TabSheet3: TTabSheet;
    DBCtrlGrid2: TDBCtrlGrid;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    FEditor: TDBComboBox;
    TabSheet4: TTabSheet;
    DBMemo3: TDBMemo;
    Memo1: TMemo;
    Panel9: TPanel;
    Label1: TLabel;
    DBText4: TDBText;
    DBText3: TDBText;
    TabSheet5: TTabSheet;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBText9: TDBText;
    DBEdit7: TDBEdit;
    procedure FEditorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DispDBGridColEnter(Sender: TObject);
    procedure SaveOOptsBitBtnClick(Sender: TObject);
    procedure DBGrid6DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PretendsDBGridDblClick(Sender: TObject);
    procedure PretendsDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure sEdit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sEdit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OnlySpecCustCheckBoxClick(Sender: TObject);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BoldTreeView1EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure DispDBGridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DispDBGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DispDBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EndedCustDBGridTitleClick(Column: TColumn);
    procedure DispDBGridDblClick(Sender: TObject);
    procedure DrStackStringGridDblClick(Sender: TObject);
    procedure DrStackStringGridClick(Sender: TObject);
    procedure DrStackStringGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure EndedCustDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DispDBGridCellClick(Column: TColumn);
    procedure DispDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BoldTreeView1Click(Sender: TObject);
    procedure DispDBGridColExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OnLanchOnTreeBitBtnClick(Sender: TObject);
    procedure BoldTreeView1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure BoldTreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure BoldTreeView1StartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    function AddNewOrder(ColorCheck: Boolean=False;
      SetIndParam: Integer=0;ItIsANDOrder:
      Boolean=False): Integer;
    procedure SelectStartSector(Zakaz: TBoldElement);
    procedure SelectSectorForDrvers(Zakaz, Driver: TBoldElement);
    procedure SetEndSector(Zakaz: TBoldElement);
    procedure AddFictiveCust(DBE: TBoldElement; Comment: String);
    procedure AddNewCustWithDetectNumber(DetectNum: string; ColorCheck: Boolean=False; GSMDetectColorCode: Integer=0);
    procedure QueryNotEndedCust;
    procedure RefreshStack;
    function iCalcGridWidth(
      dbg: TDBGrid { �������������� ��������� }
        ): integer;
    function NewTextWidth(fntFont: TFont; const sString: OpenString): integer;
    function EnableFictiveCust(FictiveTypeStr: string): Boolean;
    function ViewINumPersInfo(inum: integer): string;
    procedure CheckUsePeriod;
  private
    { Private declarations }
  public
    { Public declarations }
    ISMScroll: Boolean;
    AfterDelete: Boolean;
    CurrDragDriver: TBoldElement;
    BlinkSignal: Boolean;
    HasOnTempStop: Boolean;
    TNSearchMode, AdrSearchMode: Boolean;
    SearchSetMode: Boolean;
    SearchSetBE: TBoldElement;
    SelectIteration: Integer;
    NotActiveRender, TNSetMode: Boolean;
    ConstrCount: Integer;
    EndedCustBitmap, ReservedCustBitmap, AddingCustBitmap,
    EditCustBitmap, ActiveCustBitmap, ArhiveCustBitmap,
    PresentCustBitmap, AttentionCustBitmap,
    SpecCustBitmap, BadCustBitmap, ServiceCustBitmap,
    ANDCustBitmap, WorldWaitBitmap,
    WorldOnHandBitmap, RefreshBitmap, WorldSettings2Bitmap,
    WorldEasyGlassBitmap, WorldEasy2Bitmap, WorldDownloadBitmap,
    WorldCautionBitmap, WorldSettingsBitmap, WorldCheckBitmap,
    WorldRedBitmap, WorldYellowBitmap, WorldEasyBitmap,
    ImportantBitmap, OfflineWorldBitmap, TakeOrderBitmap: TBitmap;
    //FEditor: TDBComboBox;
  end;

const
  Signature: Integer = -525465623;

var
  AdrSearchVal: Boolean;
  HasPrevCust: Boolean=False;
  NewVal: string;
  ReleaseStructForm: TReleaseStructForm;
  CurrBottomBE: TBoldElement;
  MSOb: TMouse;
  EndedOrderField: string='nomer_zakaza';
  RefreshPerDetectNum: Boolean;
  DetectID: Integer;
  AllQueueDrNum: Integer;
  live_search_str: String='';
  enterCounter: Integer=0;

implementation

{$R *.dfm}

uses SectorEnumsUnit, ReportDMUnit,
  ImageLists, BoldAttributes, HandlesDM, PopUpCompUnit,
  BoldOtherHandlCompUnit, PrevCustUnit,
  Clipbrd, AnnonceArhiveFormUnit, DateUtils, MainForm, ModelDM,
  AnapaMapUnit, ADODMUnit, UnitCOMFileLevel,
  BadReasoneForm, IndividNumSetUnit, SoundRecordUnit;

procedure TReleaseStructForm.CheckUsePeriod;
begin
  if ((Today<StrToDate('20.08.2016')) or
    (Today>StrToDate('20.10.2016'))) and not
    (IniFile.ReadString('develop_2015_year',
                     'reset_test_period','NO')='YES')
    then
    begin
      ShowMessage('��������� ����� ������� ��������������. ���������� � ������������ �� �����������!');
      FirstForm.Close;
    end;
end;

function TReleaseStructForm.ViewINumPersInfo(inum: integer): string;
begin
  Result:='';
end;

function TReleaseStructForm.EnableFictiveCust(FictiveTypeStr: string): Boolean;
var res: Boolean;
begin
  res:=False;
  if (IniFile.ReadString('develop_2008_year',
                     'all_fictive_enabled','YES')='YES') then
   res:=True
  else begin
    if ((IniFile.ReadString('develop_2008_year',
                     'sector_change_crit_enabled','YES')='YES')
          and  (FictiveTypeStr=
             IniFile.ReadString('develop_2008_year',
                     'sector_change_crit','������� �� ������'))
           ) then res:=True
    else if ((IniFile.ReadString('develop_2008_year',
                     'on_launch_set_crit_enabled','YES')='YES')
          and  (FictiveTypeStr=
             IniFile.ReadString('develop_2008_year',
                     'on_launch_set_crit','���� �������'))
           ) then res:=True
    else if ((IniFile.ReadString('develop_2008_year',
                     'on_self_work_set_crit_enabled','YES')='YES')
          and  (FictiveTypeStr=
             IniFile.ReadString('develop_2008_year',
                     'on_self_work_set_crit','���� ������� � ����'))
           ) then res:=True
    else if ((IniFile.ReadString('develop_2008_year',
                     'on_line_from_launch_enabled','YES')='YES')
          and  (FictiveTypeStr=
             IniFile.ReadString('develop_2008_year',
                     'on_line_from_launch','������ � ��������'))
           ) then res:=True
    else if ((IniFile.ReadString('develop_2008_year',
                     'on_line_set_crit_enabled','YES')='YES')
          and  (FictiveTypeStr=
             IniFile.ReadString('develop_2008_year',
                     'on_line_set_crit','���������� �� �����'))
           ) then res:=True
    else if ((IniFile.ReadString('develop_2008_year',
                     'end_work_set_crit_enabled','YES')='YES')
          and  (FictiveTypeStr=
             IniFile.ReadString('develop_2008_year',
                     'end_work_set_crit','������ � �����'))
           ) then res:=True
     else
       begin
       end;
    end;
    
  Result:=res;
end;

function TReleaseStructForm.NewTextWidth(fntFont: TFont; const sString: OpenString): integer;
var
  fntSave: TFont;
begin
  fntSave := Application.MainForm.Font;
  Application.MainForm.Font := fntFont;
  try
    result := Application.MainForm.Canvas.TextWidth(sString);
  finally
    Application.MainForm.Font := fntSave;
  end;
  Result := 0;
end;

function TReleaseStructForm.iCalcGridWidth(
  dbg: TDBGrid { �������������� ��������� }
  ): integer; { "������" ������ }
const
  cMEASURE_CHAR = '0';
  iEXTRA_COL_PIX = 4;
  iINDICATOR_WIDE = 11;
var
  i, iColumns, iColWidth, iTitleWidth, iCharWidth: integer;
begin
  iColumns := 0;
  result := GetSystemMetrics(SM_CXVSCROLL);
  iCharWidth := NewTextWidth(dbg.Font, cMEASURE_CHAR);
  with dbg.dataSource.dataSet do
    for i := 0 to FieldCount - 1 do
      with Fields[i] do
        if visible then
        begin
          iColWidth := iCharWidth * DisplayWidth;
          if dgTitles in dbg.Options then
          begin
            iTitleWidth := NewTextWidth(dbg.TitleFont, DisplayLabel);
            if iColWidth < iTitleWidth then
              iColWidth := iTitleWidth;
          end;
          inc(iColumns, 1);
          inc(result, iColWidth + iEXTRA_COL_PIX);
        end;
  if dgIndicator in dbg.Options then
  begin
    inc(iColumns, 1);
    inc(result, iINDICATOR_WIDE);
  end;
  if dgColLines in dbg.Options then
    inc(result, iColumns)
  else
    inc(result, 1);
end;


procedure TReleaseStructForm.QueryNotEndedCust;
var date_prm: TParameter;
    poz_cond: string;
    tnum_cond, spec_cond: string;
begin
 poz_cond:='(1=1)';
 tnum_cond:='(1=1)';
 spec_cond:='(1=1)';
 if ADOConnectDM.MainADOConnection.Connected then
 begin
  if (sEdit4.Text<>'') then
    begin
     poz_cond:='(pozyvnoi_ustan='''+sEdit4.Text+''')';
    end;
  if (sEdit5.Text<>'') then
    begin
     tnum_cond:='(telefon_klienta='''+sEdit5.Text+''')';
    end;
  if OnlySpecCustCheckBox.Checked then
            spec_cond:=' (Slugebnyi=1) ';
  ADOConnectDM.EndedCustListADOQuery.SQL.Text:=
    'select  c.* '+
    'from Zakaz c '+
    'where '+
    '(c.nachalo_zakaza_data>=:date_prm) and '+
    poz_cond+ ' and '+ tnum_cond + ' and ' +spec_cond+ ' and ' +
    '(Soobsheno_voditelyu=0) and '+
    '(arhivnyi=0) '+
    'order by '+EndedOrderField+' desc ';

  if ADOConnectDM.EndedCustListADOQuery.Parameters.Count=0 then
    begin
      date_prm:=ADOConnectDM.EndedCustListADOQuery.Parameters.AddParameter;
      date_prm.DataType:=ftDateTime;
      date_prm.Name:='date_prm';
      date_prm.Value:=Today+Time;
    end;

  ADOConnectDM.EndedCustListADOQuery.Parameters[0].Value:=
    IncMonth(IncDay(IncHour(Today+Time, -UpDown1.Position),-UpDown2.Position),-UpDown3.Position);
  //EndedOrderField
  ADOConnectDM.EndedCustListADOQuery.Active:=False;
  ADOConnectDM.EndedCustListADOQuery.Active:=True;
  Label5.Caption:='����� '+
    IntToStr(ADOConnectDM.EndedCustListADOQuery.RecordCount)+' ������.';
 end;
end;

procedure TReleaseStructForm.RefreshStack;
var //LI: TListItem;
    crow, ccol, i, j: Integer;
begin
if (IniFile.ReadString('BUSINESS_DATA',
                     '�������_�������_���������','NO')='YES') then
if ADOConnectDM.MainADOConnection.Connected then
begin
try
  ADOConnectDM.DrWrkRatingsADODS.Active:=False;
  ADOConnectDM.DrWrkRatingsADODS.Active:=True;
except on E: Exception do
  ShowMessage('������ ���������� ����������� �������!');
end;
end;
ReleaseStructForm.DrStackStringGrid.ColCount:=
  (ReleaseStructForm.DrStackStringGrid.Width - 40) div
    ReleaseStructForm.DrStackStringGrid.DefaultColWidth;
ReleaseStructForm.DrStackStringGrid.RowCount:=
  100;
crow:=0;
ccol:=0;

for i:=0 to ReleaseStructForm.DrStackStringGrid.ColCount-1 do
  for j:=0 to ReleaseStructForm.DrStackStringGrid.RowCount-1 do
    ReleaseStructForm.DrStackStringGrid.Cells[i,j]:='';

if BoldModelDM.bsh.Active then
 begin
  //DrStackListView.Items.Clear;
  if BoldHandlesDM.blhOrderDrGroups.List.Count>0 then
    begin
      BoldHandlesDM.blhOrderDrGroups.First;
      while True do
        begin

          if ccol>0 then
            begin
                crow:=
                  crow+1;
                ccol:=0;
              end;
          ReleaseStructForm.DrStackStringGrid.Cells[ccol,crow]:=
            (BoldHandlesDM.blhOrderDrGroups.CurrentElement
              as TGruppa_voditelei).Naimenovanie;
          ccol:=ccol+1;
          if ccol>=
            (ReleaseStructForm.DrStackStringGrid.ColCount) then
              begin
                crow:=
                  crow+1;
                ccol:=0;
              end;

          if BoldHandlesDM.blhGroupDrivers.List.Count>0 then
            begin
              BoldHandlesDM.blhGroupDrivers.First;
              while True do
               begin

                ReleaseStructForm.DrStackStringGrid.Cells[ccol,crow]:=
                  IntToStr((BoldHandlesDM.blhGroupDrivers.CurrentElement
                    as TVoditelj).Pozyvnoi);
                ccol:=ccol+1;
                if ccol>=
                  (ReleaseStructForm.DrStackStringGrid.ColCount) then
                    begin
                      crow:=
                        crow+1;
                      ccol:=0;
                    end;

                  if BoldHandlesDM.blhGroupDrivers.HasNext then
                    BoldHandlesDM.blhGroupDrivers.Next
                  else
                    Break;
                end;
            end;


          if BoldHandlesDM.blhOrderDrGroups.HasNext then
            BoldHandlesDM.blhOrderDrGroups.Next
          else
            Break;
        end;
    end;
 end;

ReleaseStructForm.DrStackStringGrid.Repaint;
end;

procedure TReleaseStructForm.AddNewCustWithDetectNumber
  (DetectNum: string; ColorCheck: Boolean=False;
  GSMDetectColorCode: Integer=0);
begin
  CheckUsePeriod;

  DetectID:=-1;
  if ADOConnectDM.MainADOConnection.Connected then
  begin
  try
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.Refresh;

    if (IniFile.ReadString('BUSINESS_DATA',
    '������������_������_�����_�����_������','NO')='YES') then
    begin
    if ColorCheck then
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@color_check').Value:=
            1
    else
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@color_check').Value:=
            0;
    end
    else
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@color_check').Value:=
            0;

    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@ord_num').Value:=
        -1;

    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@adres').Value:='';
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@phone').Value:=DetectNum;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@ab_num').Value:='';

    if (IniFile.ReadString('BUSINESS_DATA',
     'manual_operator_ask_mode','NO')='YES')
     and not (IniFile.ReadString('BUSINESS_DATA',
     '��_�������_���_������_���_��������_����������',
     'NO')='YES')then
    begin
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
            ParamByName('@op_order').Value:=
            1;
    end
    else
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
            ParamByName('@op_order').Value:=
            0;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@order_id').Value:=
          -1;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@disp_id').Value:=
          CurrDispUserID;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@gsm_detect_code').Value:=
          GSMDetectColorCode;
    if (IniFile.ReadString('BUSINESS_DATA',
      '��������_�������������_������','NO')='NO') then
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@deny_duplicate').Value:=1
    else
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@deny_duplicate').Value:=0;
    if (IniFile.ReadString('BUSINESS_DATA',
      '������������_���������_���������������_������',
      'NO')='YES') then
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@colored_new').Value:=1
    else
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@colored_new').Value:=0;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@status').Value:=0;
    ADOConnectDM.InsertOrdWithParamADOOSP.ExecProc;

    DetectID:=ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
            ParamValues['@ord_num'];

  except on E: Exception do
    begin
      DetectID:=-1;
      ShowMessage('������ ��������� ���������� ������! '
          +E.Message);
    end;
  end;
  end;

  if (IniFile.ReadString('BUSINESS_DATA',
    '��_������������_��_����������������_������',
    'NO')='YES') then
    NotJumpWithLastChange:=True;

end;

procedure TReleaseStructForm.SetEndSector(Zakaz: TBoldElement);
begin
if (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Avtozap_konechn_sekt then
  if (Zakaz as TZakaz).konechnyi_sektor_raboty=nil then
    begin
       (Zakaz as TZakaz).konechnyi_sektor_raboty:=(Zakaz as TZakaz).adres_sektora;
    end;
end;

procedure TReleaseStructForm.SelectSectorForDrvers(Zakaz, Driver: TBoldElement);
begin
   if (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Avtozapoln_sektorov and
                 not (BoldHandlesDM.blhDriversUnion.CurrentElement as TObjekt_vyborki_otchyotnosti).Naznach_iz_obsh__spiska
               then
                 begin
              if ((Zakaz as TZakaz).adres_sektora<>nil) and
                 ((Driver as TVoditelj).rabotaet_na_sektore=nil) then
                begin
                  (Driver as TVoditelj).rabotaet_na_sektore:=
                     (Zakaz as TZakaz).adres_sektora;

                end
               else if ((Zakaz as TZakaz).adres_sektora=nil) and
                 ((Driver as TVoditelj).rabotaet_na_sektore=nil) then
                 begin
                  ShowMessage('�������� ��������� ������ ��� ������ � ������!!');
                  while (Zakaz as TZakaz).adres_sektora=nil do
                     SelectStartSector(Zakaz);
                  (Driver as TVoditelj).rabotaet_na_sektore:=
                     (Zakaz as TZakaz).adres_sektora;
                 end
               else if ((Zakaz as TZakaz).adres_sektora=nil) and
                 ((Driver as TVoditelj).rabotaet_na_sektore<>nil) then
                 begin
                   (Zakaz as TZakaz).adres_sektora:=
                      (Driver as TVoditelj).rabotaet_na_sektore;
                end
                else
                  begin
                  end;
   if (Zakaz as TZakaz).adres_sektora<>(Driver as TVoditelj).rabotaet_na_sektore then
     begin
       (Zakaz as TZakaz).sektor_voditelya:=(Driver as TVoditelj).rabotaet_na_sektore;
       FirstForm.ShowAttention('�������� ������� ������ � �������� �� ���������!');
     end;

   SetEndSector(Zakaz);

 end;
end;

procedure TReleaseStructForm.SelectStartSector(Zakaz: TBoldElement);
begin
{if ((Zakaz as TZakaz).adres_sektora=nil)
         then
           begin
             StateMapForm.Close;
             StateMapForm.Caption:='����� ���������� ������� ������';
             StateMapForm.ShowModal;
              if StateMapForm.HasResult then
                (Zakaz as TZakaz).adres_sektora:=
                   (BoldHandlesDM.blhSectorByCode.CurrentElement as TSektor_raboty);
           end;   }
end;

function TReleaseStructForm.AddNewOrder(
  ColorCheck: Boolean=False; SetIndParam: Integer=0;
  ItIsANDOrder: Boolean=False): Integer;
var res: Integer;
begin
  CheckUsePeriod;

  res:=-1;
  if ADOConnectDM.MainADOConnection.Connected then
  begin
  try
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.Refresh;
    if ColorCheck then
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@color_check').Value:=
            1
    else
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@color_check').Value:=
            0;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
      ParamByName('@ord_num').Value:=
        -1;

    if  SetIndParam>0 then
    begin
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
        ParamByName('@adres').Value:=
        SetIndividNumForm.Edit5.Text;
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
        ParamByName('@phone').Value:=
        SetIndividNumForm.Edit4.Text;
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
        ParamByName('@ab_num').Value:=
        IntToStr(NewINumber);
    end
    else
    begin
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
        ParamByName('@adres').Value:='';
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
        ParamByName('@phone').Value:='';
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
        ParamByName('@ab_num').Value:='';
    end;

    if (IniFile.ReadString('BUSINESS_DATA',
     'manual_operator_ask_mode','NO')='YES')
     and not (ItIsANDOrder and
     (IniFile.ReadString('BUSINESS_DATA',
     '��_�������_���_������_���_��������_����������','NO')='YES'))then
    begin
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
            ParamByName('@op_order').Value:=
            1;
    end
    else
      ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
            ParamByName('@op_order').Value:=
            0;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@order_id').Value:=
          -1;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@disp_id').Value:=
          CurrDispUserID;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@gsm_detect_code').Value:=0;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@deny_duplicate').Value:=0;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@colored_new').Value:=0;
    ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
          ParamByName('@status').Value:=0;
    ADOConnectDM.InsertOrdWithParamADOOSP.ExecProc;

    res:=ADOConnectDM.InsertOrdWithParamADOOSP.Parameters.
            ParamValues['@order_id'];

  except on E: Exception do
    begin
      res:=-1;
      ShowMessage('������ ��������� ���������� ������! '
          +E.Message);
    end;
  end;
  end;

  Result:=res;
end;

procedure TReleaseStructForm.BitBtn3Click(Sender: TObject);
begin
  if BoldTreeView1.SelectionCount>0 then
 if BoldTreeView1.Selected.Follower.Element.ClassType.ClassName='TVoditelj' then
  begin
   if not BoldModelDM.GetOccupedByNum
     ((BoldTreeView1.Selected.Follower.Element as TVoditelj).Pozyvnoi) then
    begin
      if not ADOConnectDM.SendSQL('UPDATE Voditelj SET '+
				'V_rabote=0 WHERE Pozyvnoi='+
        IntToStr((BoldTreeView1.Selected.Follower.
        Element as TVoditelj).Pozyvnoi)) then
					ShowMessage('��������� ��������� �������� �� �� ����� ��������!')
   end
   else
     ShowMessage('�������� ��� ��������� ������!');
  end
 else
   ShowMessage('�� ������ �� �������� �� ������ ��������!');
end;

procedure TReleaseStructForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var UseIPrm: Boolean;
    sql_text: Widestring;
begin
sql_text:='';
AdrSearchVal:=False;
ISMScroll:=False;

  //ShowMessage(IntToStr(Integer(Key)));
  //F9 �������� ��� ��������
  if (Integer(Key)=120) then
    begin
        if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
        begin
          ADOConnectDM.SendSMSToCurrentDriver;
        end
        else
          ShowMessage('��� �������� ������!');
    end
   //F5 - ������������� ������ � ���� ���� ��������
   else if (Integer(Key)=116) then
     begin
       if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
       begin
        if not OrdersOperationInActive then
        begin
          if ADOConnectDM.ActiveCustADOQuery.
            FindField('REMOTE_SET').AsInteger=
            ORDER_COMPLETE_ALLOW_USER_WAIT then
            begin
              ADOConnectDM.ManualSetCurrOrderRemoteStatus
                (ADOConnectDM.ActiveCustADOQuery.
                FindField('BOLD_ID').AsInteger,
                ORDER_CLOSE);
              ADOConnectDM.RefreshMainGrid(-1);
            end
          else if ADOConnectDM.ActiveCustADOQuery.
            FindField('REMOTE_SET').AsInteger=
            ORDER_ONHAND_ALLOW_USER_WAIT then
            ADOConnectDM.ManualSetCurrOrderRemoteStatus
              (ADOConnectDM.ActiveCustADOQuery.
              FindField('BOLD_ID').AsInteger,
              ORDER_BUSY)
          else
            ShowMessage('������ �� � ������ �������������!');
        end
        else
         ShowMessage('������������ ������� ������, ��������� �����!');
       end
       else
        ShowMessage('�� �������� �������� ������!');
     end
   //F6 - ����� ������������
   else if (Integer(Key)=117) then
     begin
       if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
       begin
          ADOConnectDM.ReloadCurrOrderOccupAttempts
            (ADOConnectDM.ActiveCustADOQuery.
            FindField('BOLD_ID').AsInteger);
          PretendsTabSheet.Show;
          PretendsDBGrid.SetFocus;
       end
       else
        ShowMessage('�� �������� �������� ������!');
     end
   //F8 - ���. ����� - ������ ������
   else if (Integer(Key)=115) then
     begin
       ADOConnectDM.SetServiceCust;
     end
   //F8 - ���. ����� - ���. ������ � ���.
   //���. ������������ ������, ��� ��� ���.
   //������ ���� ����� �� ������
   else if (Integer(Key)=119) then
     begin
       if IniFile.ReadString('BUSINESS_DATA',
       'enable_self_cust_adding','NO')='YES' then
         begin

          if IniFile.ReadString('BUSINESS_DATA',
          '����������_����_��_������_��������',
          'NO')='YES' then
            begin
             UseIPrm:=
               ADOConnectDM.SetIndividNum(True);
             if UseIPrm then
             begin
               if ((ADOConnectDM.ActiveCustADOQuery.FindField
                  ('Adres_vyzova_vvodim').AsString<>'') or
                  (ADOConnectDM.ActiveCustADOQuery.FindField
                  ('Telefon_klienta').AsString<>'')) and
                  (ADOConnectDM.ActiveCustADOQuery.FindField
                  ('Pozyvnoi_ustan').AsInteger=0) and
                  (ADOConnectDM.ActiveCustADOQuery.FindField
                  ('Adres_okonchaniya_zayavki').AsString='') and
                  (IniFile.ReadString('BUSINESS_DATA',
                  '����������_�����_��_������_�_������������_������',
                  'NO')='YES')
                then begin
                      sql_text:='UPDATE Zakaz SET Adres_okonchaniya_zayavki='''+
                        IntToStr(NewINumber)+''' ';
                      if ADOConnectDM.ActiveCustADOQuery.FindField('Adres_vyzova_vvodim').AsString='' then
                        sql_text:=sql_text+',Adres_vyzova_vvodim='''+
                          SetIndividNumForm.Edit5.Text+'''';
                      if ADOConnectDM.ActiveCustADOQuery.FindField('Telefon_klienta').AsString='' then
                        sql_text:=sql_text+',Telefon_klienta='''+
                          SetIndividNumForm.Edit4.Text+'''';
                      sql_text:=sql_text+' WHERE BOLD_ID='+
                        ADOConnectDM.ActiveCustADOQuery.FindField('BOLD_ID').AsString;
                      if not ADOConnectDM.SendSQL(sql_text) then
                                ShowMessage('��������� ��������� ���������� ������ �������� � ���� ������!');

                      if not (IniFile.ReadString('BUSINESS_DATA','manual_operator_ask_mode','NO')='YES') then
                                    BoldModelDM.AskManipForAll(False)
                                   else
                                    FirstForm.StatusBar.Panels[2].Text:='���� ���������';


                      ADOConnectDM.RefreshMainGrid(
                        ADOConnectDM.ActiveCustADOQuery.FindField
                        ('Nomer_zakaza').AsInteger, False);

                      if (IniFile.ReadString('BUSINESS_DATA','jump_on_region_after_phone','NO')='YES') then
                      begin
                        ReleaseStructForm.DispDBGrid.SelectedField:=
                          ReleaseStructForm.DispDBGrid.Fields[
                          ADOConnectDM.GetFieldNumByName('Region')];
                      end
                      else
                      begin
                        ReleaseStructForm.DispDBGrid.SelectedField:=
                          ReleaseStructForm.DispDBGrid.Fields[
                          ADOConnectDM.GetFieldNumByName('Adres_vyzova_vvodim')];
                      end;

                    end
                  else
                  begin
                      ADOConnectDM.AddDISPCust(False,1);
                  end;

             end
             //���� ����� �� �������� ������ ��������������� ������
             else
               ADOConnectDM.AddDISPCust(False,0);
            end
           else
             ShowMessage('������ � ������������ ��������'+
              ' ���������, ���������� � �����������, ����'+
              ' ����������� ��� ���������� ������� F7.');
         end;
     end
   else if (Integer(Key)=13) then
     begin
      if not (IniFile.ReadString('BUSINESS_DATA','hybrid_SQLLEV_mode','NO')='YES') then
        begin
          TNSearchMode:=False;
          AdrSearchMode:=False;
          NotActiveRender:=False;
        end
      else
        begin

        end;
     end
  //������� F11 (������ ����� ----
  // ���. ���. - ������� ��������� � ����������
   else if (Integer(Key)=122) then
     begin
       DispDBGrid.SetFocus;
       if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
         begin
           if not ADOConnectDM.SendSQL('UPDATE Zakaz SET Yavl_pochasovym=0'+
              ' WHERE BOLD_ID='+IntToStr(ADOConnectDM.ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ����������� ������ � ������ ������� � ��������!');

           ADOConnectDM.RefreshMainGrid(ADOConnectDM.ActiveCustADOQuery.
             FindField('Nomer_zakaza').AsInteger, True);
         end;
     end
   else
     begin
       NotActiveRender:=False;
     end;
  //109 - minus, 8 - backspace, 107 - plus,
  //46-delete, insert-45, enter-13,
  //������� F7 (������ ����� ----
  // ���. ���. - ���������� ������
  if (Integer(Key)=118) or (Integer(Key)=45) then
  begin
    AddOrderAndINumMode:=False;
    if IniFile.ReadString('BUSINESS_DATA',
    'enable_self_cust_adding','NO')='YES' then
         begin
             ADOConnectDM.AddDISPCust;
         end;
  end
  //F3 ���������� ������� ������
  else if (Integer(Key)=114) then
  begin
  if MessageDlg('����� ������� �������(��� ��������-����������) ������ �� '+
  '��������� ������������� ��������� �� ��������. ��� ���� ��������  ����� ���!!! '+
  '���� ����� ������� ������� ������ ����������� F7 ��� Insert.',
      mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
      if MessageDlg('������� ������ ��������� ����� F7!!! ������� �������-������?',
      mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
    ADOConnectDM.setNoTransmitOrder(ADOConnectDM.AddDISPCust);
      end;
      end;
  end
  else if (Integer(Key)=40)
   and (IniFile.ReadString('BUSINESS_DATA',
   'enable_key_cust_adding','NO')='YES') then
  begin
   if ADOConnectDM.MainADOConnection.Connected then
    if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
      begin
         if ADOConnectDM.dsActiveCust.DataSet.RecNo=
             (ADOConnectDM.ActiveCustADOQuery.RecordCount) then
          begin
           ADOConnectDM.AddDISPCust;
           ADOConnectDM.dsActiveCust.DataSet.Last;
           ADOConnectDM.dsActiveCust.DataSet.Prior;
         end;
      end;
  end
  //������� F2 (������ ����� ----
  // ���. ���. - ������� �������� � �����
  else if (Integer(Key)=113) then
  begin
  //���������� ����� ��� ����� ���������
  if ADOConnectDM.MainADOConnection.Connected then
  begin
   if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
    begin
     //if ADOConnectDM.OrderInRemoteProcess(ADOConnectDM.ActiveCustADOQuery.FindField('BOLD_ID').AsInteger) then
     //begin
     //   ShowMessage('������ ������ �������������� � �������������� ������!');
     //end
     //else
     //begin
     
     if ADOConnectDM.ActiveCustADOQuery.FieldByName('Predvariteljnyi').AsInteger<>0 then
      begin
        ShowMessage('������ ������ �������� ���������������!');
      end
     else
      begin
       if not ADOConnectDM.SendSQL('UPDATE Zakaz SET Arhivnyi=1, Adres_vyzova_vvodim=(''���������� ''+Adres_vyzova_vvodim), Konec_zakaza_data=(CAST(GETDATE() as DateTime)), Zavershyon=1 '+
        ' WHERE BOLD_ID='+IntToStr(ADOConnectDM.ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
        ShowMessage('��������� ����������� ������ � �����!');

        ADOConnectDM.RefreshMainGrid(-1);
      end;
    end;
   end;

   // end;
  end
  //������� F3 (������ ����� - ��������� ��. ����.
  // ���. ���. ----
  //������� F6 (������ ����� - ��������� ��. ����. �� ����� ������
  // ���. ���. ----
  //������� F2 (������ ����� ----  113
  // ���. ���. ----
  //����� ������� �� ������
  else
  begin
  end;
end;

procedure TReleaseStructForm.AddFictiveCust(DBE: TBoldElement; Comment: String);
var CBE: TBoldElement;
begin
 if ReleaseStructForm.EnableFictiveCust(Comment) then
  begin
  CBE:=(DBE as TVoditelj).vypolnyaet_zakazy.AddNew;
  (CBE as TZakaz).Soobsheno_voditelyu:=True;
  (CBE as TZakaz).Data_podachi:=Today+Time;
  (CBE as TZakaz).Telefon_klienta:='���������';
  (CBE as TZakaz).Adres_vyzova_vvodim:=Comment;
  (CBE as TZakaz).Nachalo_zakaza_data:=Today+Time;
  (CBE as TZakaz).Zavershyon:=True;
  (CBE as TZakaz).Pozyvnoi_ustan:=
     (DBE as TVoditelj).Pozyvnoi;
  (CBE as TZakaz).Konec_zakaza_data:=Today+Time;
  (CBE as TZakaz).Uslovn_stoim:=0;
  end;
end;

procedure TReleaseStructForm.BoldTreeView1StartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
if BoldTreeView1.SelectionCount>0 then
 begin
  if BoldTreeView1.Selected.Follower.Element.ClassType.ClassName=
     'TVoditelj' then
    begin
      CurrDragDriver:=(BoldTreeView1.Selected.Follower.Element as TVoditelj);
      if (IniFile.ReadString('BUSINESS_DATA',
      '������_����������_���_������������_�_�������',
      'NO')='YES') then
        EnableDriverRefresh:=False;
    end
  else
    ShowMessage('�������� ������������� ������ ������� ������');
 end
else
  ShowMessage('�� �������� �� ����� ������!');
end;

procedure TReleaseStructForm.BoldTreeView1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source is TBoldTreeView) then
    Accept:=True;
end;

procedure TReleaseStructForm.BoldTreeView1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var DragDropBE: TBoldElement;
    dropDT: TDateTime;
begin
  EnableDriverRefresh:=True;
  if (Source is TBoldTreeView) or (Source is TDBText) then
    begin
      if BoldTreeView1.GetElementAt(X,Y)<>nil then
        if BoldTreeView1.GetElementAt(X,Y).ClassType.ClassName='TSektor_raboty' then
             begin
                if CurrDragDriver<>nil then
                  begin
                 (CurrDragDriver as TVoditelj).Na_pereryve:=False;
                 (CurrDragDriver as TVoditelj).rabotaet_na_sektore:=
                 (BoldTreeView1.GetElementAt(X,Y) as TSektor_raboty);
                 (CurrDragDriver as TVoditelj).Nomer_posl_sektora:=
                 StrToInt((CurrDragDriver as TVoditelj).rabotaet_na_sektore.Kod_sektora);
                 if (IniFile.ReadString('BUSINESS_DATA',
                  '����_�����_���_�������_��_����',
                  'NO')<>'YES') then
                    (CurrDragDriver as TVoditelj).Vremya_poslednei_zayavki:=
                        Today+Time;
                  BoldModelDM.BoldUpdateDBAction1.Execute;

                  FirstForm.basrDrList.Changed;
                  ReleaseStructForm.BoldTreeView1.Repaint;
                end;
              end
         else if BoldTreeView1.GetElementAt(X,Y).ClassType.ClassName='TVoditelj' then
             begin
               if IniFile.ReadString('BUSINESS_DATA','enable_on_dr_tree_drop','NO')='YES' then
                if CurrDragDriver<>nil then
                  begin
                 DragDropBE:=BoldTreeView1.GetElementAt(X,Y);
                 (CurrDragDriver as TVoditelj).Na_pereryve:=False;
                 (CurrDragDriver as TVoditelj).rabotaet_na_sektore:=
                   (DragDropBE as TVoditelj).rabotaet_na_sektore;
                 (CurrDragDriver as TVoditelj).Nomer_posl_sektora:=
                 StrToInt((CurrDragDriver as TVoditelj).rabotaet_na_sektore.Kod_sektora);
                 dropDT:=(DragDropBE as TVoditelj).Vremya_poslednei_zayavki;
                 BoldModelDM.BoldUpdateDBAction1.Execute;
                 (CurrDragDriver as TVoditelj).Vremya_poslednei_zayavki:=
                    IncSecond(dropDT,-1);
                 BoldModelDM.BoldUpdateDBAction1.Execute;

                  FirstForm.basrDrList.Changed;
                  ReleaseStructForm.BoldTreeView1.Repaint;
                end;
             end   
          else
            begin

            end;
    end;
end;

procedure TReleaseStructForm.OnLanchOnTreeBitBtnClick(Sender: TObject);
begin
if BoldTreeView1.SelectionCount>0 then
 if BoldTreeView1.Selected.Follower.Element.ClassType.ClassName='TVoditelj' then
  begin
    //ReleaseStructForm.AddFictiveCustByDrNum(
    //     (BoldTreeView1.Selected.Follower.Element as TVoditelj).Pozyvnoi,'���� �������');
    if not ADOConnectDM.SendSQL('UPDATE Voditelj SET '+
				'Na_pereryve=1 WHERE Pozyvnoi='+
        IntToStr((BoldTreeView1.Selected.Follower.
        Element as TVoditelj).Pozyvnoi)) then
					ShowMessage('��������� ��������� �������� �� �������� ��������!')
  end
 else
   ShowMessage('�� ������ �� �������� �� ������ ��������!');
end;

procedure TReleaseStructForm.FormCreate(Sender: TObject);
begin
  MSOb:=
    TMouse.Create;

  AllQueueDrNum := -1;

  StartTabSheet.Show;
  SectorsTabSheet.Show;
  

  if IniFile.ReadString('BUSINESS_DATA','live_combo_adr_input','NO')='YES' then
    begin
    end;

  if IniFile.ReadString('BUSINESS_DATA','simple_program_view','NO')='YES' then
    begin
      LeftPageControl.Width:=1;
      AdditDispPageControl.Height:=1;
      DispDBGrid.Columns.Items[4].Width:=
        DispDBGrid.Columns.Items[4].Width+160;
    end;
  if IniFile.ReadString('BUSINESS_DATA','view_groups_stacks','NO')='NO' then
     begin
       StacksPanel.Visible:=
         False;
     end;
  {if IniFile.ReadString('BUSINESS_DATA','show_top_aggregate_text','NO')='YES' then
     begin
       TopAggregatePanel.Visible:=
         True;
       TopAggregatePanel.Height:=
         73;  
     end; }
   {if IniFile.ReadString('BUSINESS_DATA','show_top_all_stack','NO')='YES' then
     begin
       TopAggregatePanel.Visible:=
         True;
     end; }
   {if IniFile.ReadString('BUSINESS_DATA','endtime_at_end','NO')='YES' then
     begin
       
     end;
   if IniFile.ReadString('BUSINESS_DATA','show_region_field','NO')='YES' then
     begin
       
     end;  }
   if IniFile.ReadString('BUSINESS_DATA','show_symbol_grid_stack','NO')='YES' then
    begin
      ReleaseStructForm.DrStackStringGrid.Visible:=
        True;
    end;

  try
    StrToInt(IniFile.ReadString('BUSINESS_DATA','stack_row_height','35'));
    ReleaseStructForm.DrStackStringGrid.DefaultRowHeight:=
      StrToInt(IniFile.ReadString('BUSINESS_DATA','stack_row_height','35'));
  except
    ReleaseStructForm.DrStackStringGrid.DefaultRowHeight:=
      35;
  end;

  try
    StrToInt(IniFile.ReadString('BUSINESS_DATA','stack_col_width','40'));
    ReleaseStructForm.DrStackStringGrid.DefaultColWidth:=
      StrToInt(IniFile.ReadString('BUSINESS_DATA','stack_col_width','40'));
  except
    ReleaseStructForm.DrStackStringGrid.DefaultColWidth:=
      40;
  end;

  try
    StrToInt(IniFile.ReadString('BUSINESS_DATA','main_disp_grid_font_size','12'));
    //ReleaseStructForm.DispDBGrid.Font.Size:=
    //  StrToInt(IniFile.ReadString('BUSINESS_DATA','stack_col_width','12'));
  except
    ReleaseStructForm.DispDBGrid.Font.Size:=
      12;
  end;

  try
    StrToInt(IniFile.ReadString('BUSINESS_DATA','stack_font_size','25'));
    ReleaseStructForm.DrStackStringGrid.Font.Size:=
      StrToInt(IniFile.ReadString('BUSINESS_DATA','stack_font_size','25'));
  except
    ReleaseStructForm.DrStackStringGrid.Font.Size:=
      25;
  end;

  if (IniFile.ReadString('BUSINESS_DATA','use_1c_design','NO')='YES') then
    begin
      DispDBGrid.Columns.Items[6].Color:=clYellow;
      DispDBGrid.Columns.Items[7].Color:=clYellow;
    end
  else
    begin
      DispDBGrid.Columns.Items[2].Font.Color:=clRed;
      DispDBGrid.Columns.Items[4].Font.Color:=clBlue;
    end;

  ConstrCount:=1;
  EndedCustBitmap:=TBitmap.Create;
  ReservedCustBitmap:=TBitmap.Create;
  AddingCustBitmap:=TBitmap.Create;
  EditCustBitmap:=TBitmap.Create;
  ActiveCustBitmap:=TBitmap.Create;
  PresentCustBitmap:=TBitmap.Create;
  AttentionCustBitmap:=TBitmap.Create;
  SpecCustBitmap:=TBitmap.Create;
  ArhiveCustBitmap:=TBitmap.Create;
  BadCustBitmap:=TBitmap.Create;
  ServiceCustBitmap:=TBitmap.Create;
  ANDCustBitmap:=TBitmap.Create;
  WorldWaitBitmap:=TBitmap.Create;

  WorldOnHandBitmap:=TBitmap.Create;
  RefreshBitmap:=TBitmap.Create;
  WorldSettings2Bitmap:=TBitmap.Create;
  WorldEasyGlassBitmap:=TBitmap.Create;
  WorldEasy2Bitmap:=TBitmap.Create;
  WorldDownloadBitmap:=TBitmap.Create;
  WorldCautionBitmap:=TBitmap.Create;
  WorldSettingsBitmap:=TBitmap.Create;
  WorldCheckBitmap:=TBitmap.Create;
  WorldRedBitmap:=TBitmap.Create;
  WorldYellowBitmap:=TBitmap.Create;
  WorldEasyBitmap:=TBitmap.Create;
  ImportantBitmap:=TBitmap.Create;
  OfflineWorldBitmap:=TBitmap.Create;
  TakeOrderBitmap:=TBitmap.Create;

  try
    WorldOnHandBitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldOnHandBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldOnHandBitmap.bmp'+'!');
  end;

  try
    RefreshBitmap.LoadFromFile(GetCurrentDir+'\Skins\RefreshBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\RefreshBitmap.bmp'+'!');
  end;

  try
    WorldSettings2Bitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldSettings2Bitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldSettings2Bitmap.bmp'+'!');
  end;

  try
    WorldEasyGlassBitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldEasyGlassBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldEasyGlassBitmap.bmp'+'!');
  end;

  try
    WorldEasy2Bitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldEasy2Bitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldEasy2Bitmap.bmp'+'!');
  end;

  try
    WorldDownloadBitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldDownloadBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldDownloadBitmap.bmp'+'!');
  end;

  try
    WorldCautionBitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldCautionBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldCautionBitmap.bmp'+'!');
  end;

  try
    WorldSettingsBitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldSettingsBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldSettingsBitmap.bmp'+'!');
  end;

  try
    WorldCheckBitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldCheckBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldCheckBitmap.bmp'+'!');
  end;

  try
    WorldRedBitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldRedBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldRedBitmap.bmp'+'!');
  end;

  try
    WorldYellowBitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldYellowBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldYellowBitmap.bmp'+'!');
  end;

  try
    WorldEasyBitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldEasyBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldEasyBitmap.bmp'+'!');
  end;

  try
    ImportantBitmap.LoadFromFile(GetCurrentDir+'\Skins\ImportantBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\ImportantBitmap.bmp'+'!');
  end;

  try
    OfflineWorldBitmap.LoadFromFile(GetCurrentDir+'\Skins\OfflineWorldBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\OfflineWorldBitmap.bmp'+'!');
  end;

  try
    TakeOrderBitmap.LoadFromFile(GetCurrentDir+'\Skins\TakeOrderBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\TakeOrderBitmap.bmp'+'!');
  end;

  try
    WorldWaitBitmap.LoadFromFile(GetCurrentDir+'\Skins\WorldWaitBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\WorldWaitBitmap.bmp'+'!');
  end;

  try
    ANDCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\ADNCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\ADNCustBitmap.bmp'+'!');
  end;

  try
    ServiceCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\ServiceCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\ServiceCustBitmap.bmp'+'!');
  end;

  try
    BadCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\BadCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\BadCustBitmap.bmp'+'!');
  end;

  try
    ArhiveCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\ArhiveCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\ArhiveCustBitmap.bmp'+'!');
  end;

  try
    EndedCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\EndedCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\EndedCustBitmap.bmp'+'!');
  end;

  try
    ReservedCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\ReservedCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\ReservedCustBitmap.bmp'+'!');
  end;

  try
    AddingCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\AddingCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\AddingCustBitmap.bmp'+'!');
  end;

  try
    EditCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\EditCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\EditCustBitmap.bmp'+'!');
  end;

  try
    ActiveCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\ActiveCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\ActiveCustBitmap.bmp'+'!');
  end;

  try
    PresentCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\PresentCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\PresentCustBitmap.bmp'+'!');
  end;

  try
    AttentionCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\AttentionCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\AttentionCustBitmap.bmp'+'!');
  end;

  try
    SpecCustBitmap.LoadFromFile(GetCurrentDir+'\Skins\SpecCustBitmap.bmp');
  except
    ShowMessage('��������� �������� ���������� ����������� '+
      GetCurrentDir+'\Skins\SpecCustBitmap.bmp'+'!');
  end;

  if (IniFile.ReadString('BUSINESS_DATA',
     '������_�����_���������_�����_��������','NO')='YES')
     and (IniFile.ReadString('BUSINESS_DATA',
         '����������_����_��_������_��������','NO')='YES')
   then
    begin
      DispDBGrid.Columns.Items[3].FieldName:='Adres_okonchaniya_zayavki';
      DispDBGrid.Columns.Items[3].Title.Caption:='� ��-��';

      if not (IniFile.ReadString('BUSINESS_DATA',
         '���������_��������_�������_�����_��������_��������_�_�������','NO')='YES')
         then
           DispDBGrid.Columns.Items[3].ReadOnly:=True;
           
      DispDBGrid.Columns.Items[3].Alignment:=taCenter;
    end;
    
   if IniFile.ReadString('BUSINESS_DATA','����������_���������_��_��������','NO')='YES' then
     ReleaseStructForm.DBText2.Visible:=True;

   if IniFile.ReadString('BUSINESS_DATA','��_��������_����������_��_������������_������','NO')='YES' then
     ReleaseStructForm.DBText2.DataField:='';
   if IniFile.ReadString('BUSINESS_DATA','����������_��������������_��������������_������','NO')='YES' then
     begin
       AdditDispPageControl.Visible:=True;
       FirstForm.N35.Checked:=True;
     end
   else
     begin
       AdditDispPageControl.Visible:=False;
       FirstForm.N35.Checked:=False;
     end;

   if (IniFile.ReadString('BUSINESS_DATA',
         '��������_����_������_��������','NO')='NO') then
           begin
             ReleaseStructForm.LastWeekIndOrdTabSheet.
               TabVisible:=False;
           end;

   if (IniFile.ReadString('BUSINESS_DATA',
         '����������_��������_������','NO')='YES') then
           begin
             DispDBGrid.Columns[7].Visible:=True;
           end
   else
     DispDBGrid.Columns[7].Visible:=False;

   if (IniFile.ReadString('BUSINESS_DATA',
         '����������_������_�_�����','NO')='YES') then
           begin
             DispDBGrid.Columns[10].Visible:=True;
             DispDBGrid.Columns[10].Width:=45;
             DispDBGrid.Columns[11].Visible:=True;
             DispDBGrid.Columns[11].Width:=45;
             DispDBGrid.Columns[12].Visible:=True;
             DispDBGrid.Columns[12].Width:=45;
           end
   else
      begin
          DispDBGrid.Columns[10].Visible:=False;
          DispDBGrid.Columns[11].Visible:=False;
          DispDBGrid.Columns[12].Visible:=False;
      end;

   if (IniFile.ReadString('���������_��������',
         '����������_REMOTE_COMMENT','NO')='YES') then
           begin
             DispDBGrid.Columns[13].Visible:=True;
             DispDBGrid.Columns[13].Width:=300;
           end
   else
     DispDBGrid.Columns[13].Visible:=False;

   if (IniFile.ReadString('���������_��������',
         '����������_����������_��_��������_SMS','NO')='YES') then
           begin
             DispDBGrid.Columns[14].Visible:=True;
             DispDBGrid.Columns[14].Width:=300;
           end
   else
     DispDBGrid.Columns[14].Visible:=False;

   if (IniFile.ReadString('BUSINESS_DATA',
         '�����_����_�������_���_��_������','NO')='YES') then
           begin
             DispDBGrid.Columns[3].Visible:=False;
           end
   else
     DispDBGrid.Columns[3].Visible:=True;

end;

procedure TReleaseStructForm.DispDBGridColExit(Sender: TObject);
begin

 if ADOConnectDM.dsActiveCust.State = dsEdit then
     begin
   try
     ADOConnectDM.ActiveCustADOQuery.Post;
     
  except on E: Exception do
   begin
    ShowMessage('��������� ���������� ������! ��������� - '+E.Message);
    if ADOConnectDM.MainADOConnection.Connected then
        ADOConnectDM.RefreshMainGrid(-1);
   end;     
  end;
 end;

 

end;

procedure TReleaseStructForm.BoldTreeView1Click(Sender: TObject);
begin
 if BoldTreeView1.SelectionCount>0 then
  if BoldTreeView1.Selected.Follower.Element.ClassType.ClassName=
     'TVoditelj' then
    begin
    FirstForm.SelectNotEndedDriverCust(
      BoldTreeView1.Selected.Follower.Element);
    end;
end;

procedure TReleaseStructForm.DispDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  holdColor: TColor;
  holdFont: TFont;
  fill_perc: Double;
  sect_cut_len: Integer;
  sect_str: string;
begin

 try

 if IniFile.ReadString('BUSINESS_DATA','live_combo_adr_input','NO')='YES' then
 if (gdFocused in State) then
    if (Column.Field.FieldName = 'Adres_vyzova_vvodim') then begin
      { ������ ������������ InplaceEditor'� ���������� ComboBox }
      FEditor.Left := Rect.Left + DispDBGrid.Left;
      FEditor.Top := Rect.Top + DispDBGrid.top;
      FEditor.Width := Rect.Right - Rect.Left + 2;
      FEditor.Visible := True;
      FEditor.SetFocus;
    end;

  holdColor := DispDBGrid.Canvas.Brush.Color;
  holdFont := DispDBGrid.Canvas.Font;
  if Column.FieldName = 'Primechanie' then
    begin
      if ADOConnectDM.dsActiveCust.DataSet.
          FieldByName('konechnyi_sektor_raboty').AsInteger>0 then
        sect_str:=ADOConnectDM.dsActiveCust.DataSet.
          FieldByName('esect').AsString
      else
        sect_str:=ADOConnectDM.dsActiveCust.DataSet.
          FieldByName('order_sect').AsString;
      if sect_str='' then sect_str:=' ';    
      fill_perc:=
          ((Rect.Right-Rect.Left))
          /
          (DispDBGrid.Canvas.TextWidth(
          sect_str))-0.1;
      if fill_perc>=1 then fill_perc:=0.9;
      if fill_perc<0 then fill_perc:=0;

      sect_cut_len:=Round(
      Length(sect_str)*fill_perc);
      SetLength(sect_str,sect_cut_len);
      //ShowMessage(FloatToStr(fill_perc));

      with DispDBGrid.Canvas do begin
        Brush.Color:=clWhite;
        FillRect(Rect);
        TextOut(Rect.Right-2-TextWidth(
          sect_str),
          Rect.Top+2,
          sect_str);
      end;
    end;

  {WorldOnHandBitmap, RefreshBitmap, WorldSettings2Bitmap,
    WorldEasyGlassBitmap, WorldEasy2Bitmap, WorldDownloadBitmap,
    WorldCautionBitmap, WorldSettingsBitmap, WorldCheckBitmap,
    WorldRedBitmap, WorldYellowBitmap, WorldEasyBitmap,
    ImportantBitmap, OfflineWorldBitmap, TakeOrderBitmap}

  if DataCol = 0 then
    begin
      //AddingCustBitmap
      if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Telefon_klienta').AsString='') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Adres_vyzova_vvodim').AsString='')) then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,AddingCustBitmap)
      else if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('REMOTE_SET').AsInteger>0) and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('REMOTE_SET').AsInteger<4))   then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,TakeOrderBitmap)
      else if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('REMOTE_SET').AsInteger=8))   then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,WorldWaitBitmap)
      else if ((ADOConnectDM.dsActiveCust.DataSet.
          FieldByName('REMOTE_SET').AsInteger in
          [ORDER_ONHAND_ALLOW_USER_WAIT, ORDER_ONHAND_ATTEPMT,
          ORDER_ONHAND_DENY, ORDER_ONHAND_ALLOW_ASK_WAIT,
          ORDER_ONHAND_ALLOW]))   then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,WorldOnHandBitmap)
      else if ((ADOConnectDM.dsActiveCust.DataSet.
          FieldByName('REMOTE_SET').AsInteger in
          [ORDER_DISP_CANCEL_ASK_WAIT,
          ORDER_COMLETE_ALLOW, ORDER_COMPLETE_ALLOW_USER_WAIT]))   then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,WorldCautionBitmap)
      else if ((ADOConnectDM.dsActiveCust.DataSet.
          FieldByName('REMOTE_SET').AsInteger in
          [ORDER_DRV_CANCEL, ORDER_CLOSE_ERROR, ORDER_DRCANCEL_DENY]))   then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,WorldRedBitmap)
      else if ((ADOConnectDM.dsActiveCust.DataSet.
          FieldByName('REMOTE_SET').AsInteger in
          [ORDER_DRV_COMPLETE,
          ORDER_CLOSE_ASK_WAIT]) or
          (ADOConnectDM.dsActiveCust.DataSet.FieldByName
          ('REMOTE_SET').AsInteger=ORDER_CLOSE))   then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,WorldCheckBitmap)
      else if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('REMOTE_SET').AsInteger<>0)   then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,WorldEasyBitmap)
      else if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-3000))  then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,ServiceCustBitmap)

      else if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=0) and
          (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-1000))  then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,BadCustBitmap)

      else if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=0) and
          ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger>0)
          or (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-100)))  then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,PresentCustBitmap)

      else if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Ustan_pribytie').AsInteger=1) then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,ANDCustBitmap)

      else if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=0) and
          (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Slugebnyi').AsInteger=1)) then
            DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,SpecCustBitmap)

      else if  ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Pozyvnoi_ustan').AsInteger=0) and
          (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=0)) then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,EditCustBitmap)

      else if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=0) and
              (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zadeistv_predvarit').AsInteger=0) and
          (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1))  then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,ReservedCustBitmap)

      else if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=0) and
          (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zadeistv_predvarit').AsInteger=1) and
          (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1))  then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,AttentionCustBitmap)

      else if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=0) then
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,ActiveCustBitmap)
      else
          DispDBGrid.Canvas.Draw(Rect.Left,Rect.Top,EndedCustBitmap);
    end;
  if Column.FieldName = 'Telefon_klienta' then
    begin
      DispDBGrid.Canvas.Font.Color := clGray;
      if (IniFile.ReadString('BUSINESS_DATA','manual_operator_ask_mode','NO')='YES') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Yavl_pochasovym').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Font.Color := clMenuHighlight;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Ustan_pribytie').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);    

      DispDBGrid.Canvas.Brush.Color := clMoneyGreen;
      DispDBGrid.Canvas.Font.Color := clBlack;
      if ADOConnectDM.dsActiveCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1 then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clRed;
      DispDBGrid.Canvas.Font.Color := clWhite;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger>0)
          or (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-100) then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      if (IniFile.ReadString('BUSINESS_DATA','colored_alien_cust','NO')='YES') and
         ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Telefon_klienta').AsString='') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Adres_vyzova_vvodim').AsString=''))  and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('otpuskaetsya_dostepcherom').AsInteger<>CurrDispUserID) then
           DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clBlack;
      DispDBGrid.Canvas.Font.Color := clWhite;


      if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=0) and
          (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-1000))  then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clSkyBlue;
      DispDBGrid.Canvas.Font.Color := clWhite;

      if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=0) and
          (ADOConnectDM.dsActiveCust.DataSet.
          FieldByName('Primechanie').AsString='C ������� ��������'))  then
      begin

        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      end;

      DispDBGrid.Canvas.Brush.Color := clBlue;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Opr_s_obsh_linii').AsInteger=1) and
         (IniFile.ReadString('BUSINESS_DATA','view_for_us_color','NO')='YES') then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := $004080FF;
      if ((ADOConnectDM.dsActiveCust.DataSet.
          FieldByName('REMOTE_SET').AsInteger in
          [ORDER_DRV_CANCEL, ORDER_CLOSE_ERROR,
          ORDER_DRCANCEL_DENY]))   then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Font.Color := clBlack;
      DispDBGrid.Canvas.Brush.Color := clYellow;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1) and
         (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zadeistv_predvarit').AsInteger=1) then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      
      
      DispDBGrid.Canvas.Brush.Color := holdColor;
      DispDBGrid.Canvas.Font := holdFont;
    end;
   if Column.FieldName = 'Adres_vyzova_vvodim' then
    begin
      DispDBGrid.Canvas.Font.Color := clGray;
      if (IniFile.ReadString('BUSINESS_DATA','manual_operator_ask_mode','NO')='YES') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Yavl_pochasovym').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Font.Color := clMenuHighlight;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Ustan_pribytie').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);    

      DispDBGrid.Canvas.Brush.Color := clLime;
      DispDBGrid.Canvas.Font.Color := clWhite;
      if (IniFile.ReadString('BUSINESS_DATA','������������_������_������','NO')='YES') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Nachalo_zakaza_data').AsDateTime<(IncMinute((Today+Time),
          -1*StrToInt(IniFile.ReadString('BUSINESS_DATA','����������_�����_��� �����������_������_������','0'))))) and
        ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Pozyvnoi_ustan').AsInteger=0))   then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clMoneyGreen;
      DispDBGrid.Canvas.Font.Color := clBlack;
      if ADOConnectDM.dsActiveCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1 then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clRed;
      DispDBGrid.Canvas.Font.Color := clWhite;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger>0)
          or (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-100) then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      if (IniFile.ReadString('BUSINESS_DATA','colored_alien_cust','NO')='YES') and
         ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Telefon_klienta').AsString='') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Adres_vyzova_vvodim').AsString=''))  and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('otpuskaetsya_dostepcherom').AsInteger<>CurrDispUserID) then
           DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clBlack;
      DispDBGrid.Canvas.Font.Color := clWhite;
      if ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=0) and
          (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-1000))  then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := $004080FF;
      if ((ADOConnectDM.dsActiveCust.DataSet.
          FieldByName('REMOTE_SET').AsInteger in
          [ORDER_DRV_CANCEL, ORDER_CLOSE_ERROR,
          ORDER_DRCANCEL_DENY]))   then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Font.Color := clBlack;
      DispDBGrid.Canvas.Brush.Color := clYellow;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1) and
         (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zadeistv_predvarit').AsInteger=1) then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);  

      DispDBGrid.Canvas.Brush.Color := holdColor;
      DispDBGrid.Canvas.Font := holdFont;
    end;
   if Column.FieldName = 'Pozyvnoi_ustan' then
    begin
      DispDBGrid.Canvas.Font.Color := clGray;
      if (IniFile.ReadString('BUSINESS_DATA','manual_operator_ask_mode','NO')='YES') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Yavl_pochasovym').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Font.Color := clMenuHighlight;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Ustan_pribytie').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Font.Color := clWhite;
      DispDBGrid.Canvas.Brush.Color := $004080FF;
      if ((ADOConnectDM.dsActiveCust.DataSet.
          FieldByName('REMOTE_SET').AsInteger in
          [ORDER_DRV_CANCEL, ORDER_CLOSE_ERROR,
          ORDER_DRCANCEL_DENY]))   then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clWhite;
      DispDBGrid.Canvas.Font.Color := clBlack;
      if ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=1 then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clRed;
      DispDBGrid.Canvas.Font.Color := clWhite;
      if (IniFile.ReadString('BUSINESS_DATA','colored_alien_cust','NO')='YES') and
         ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Telefon_klienta').AsString='') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Adres_vyzova_vvodim').AsString=''))  and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('otpuskaetsya_dostepcherom').AsInteger<>CurrDispUserID) then
           DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State); 

      DispDBGrid.Canvas.Brush.Color := holdColor;
      DispDBGrid.Canvas.Font := holdFont;
    end;
   if Column.FieldName = 'Nomer_zakaza' then
    begin
      DispDBGrid.Canvas.Font.Color := clGray;
      if (IniFile.ReadString('BUSINESS_DATA','manual_operator_ask_mode','NO')='YES') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Yavl_pochasovym').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

          DispDBGrid.Canvas.Font.Color := clMenuHighlight;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Ustan_pribytie').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clWhite;
      DispDBGrid.Canvas.Font.Color := clBlack;
      if ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=1 then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clRed;
      DispDBGrid.Canvas.Font.Color := clWhite;
      if (IniFile.ReadString('BUSINESS_DATA','colored_alien_cust','NO')='YES') and
         ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Telefon_klienta').AsString='') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Adres_vyzova_vvodim').AsString=''))  and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('otpuskaetsya_dostepcherom').AsInteger<>CurrDispUserID) then
           DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);      

      DispDBGrid.Canvas.Brush.Color := holdColor;
      DispDBGrid.Canvas.Font := holdFont;
    end;
   if Column.FieldName = 'Uslovn_stoim' then
    begin
      DispDBGrid.Canvas.Font.Color := clGray;
      if (IniFile.ReadString('BUSINESS_DATA','manual_operator_ask_mode','NO')='YES') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Yavl_pochasovym').AsInteger<>0)  then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Font.Color := clMenuHighlight;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Ustan_pribytie').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clWhite;
      DispDBGrid.Canvas.Font.Color := clBlack;
      if ADOConnectDM.dsActiveCust.DataSet.FieldByName('Zavershyon').AsInteger=1 then
        DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clRed;
      DispDBGrid.Canvas.Font.Color := clWhite;
      if (IniFile.ReadString('BUSINESS_DATA','colored_alien_cust','NO')='YES') and
         ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Telefon_klienta').AsString='') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Adres_vyzova_vvodim').AsString=''))  and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('otpuskaetsya_dostepcherom').AsInteger<>CurrDispUserID) then
           DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := holdColor;
      DispDBGrid.Canvas.Font := holdFont;
    end;

   if Column.FieldName = 'start_dt' then
    begin
      DispDBGrid.Canvas.Font.Color := clGray;
      if (IniFile.ReadString('BUSINESS_DATA','manual_operator_ask_mode','NO')='YES') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Yavl_pochasovym').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Font.Color := clMenuHighlight;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Ustan_pribytie').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);    

      DispDBGrid.Canvas.Brush.Color := clRed;
      DispDBGrid.Canvas.Font.Color := clWhite;
      if (IniFile.ReadString('BUSINESS_DATA','colored_alien_cust','NO')='YES') and
         ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Telefon_klienta').AsString='') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Adres_vyzova_vvodim').AsString=''))  and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('otpuskaetsya_dostepcherom').AsInteger<>CurrDispUserID) then
           DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := holdColor;
      DispDBGrid.Canvas.Font := holdFont;
    end;

    if Column.FieldName = 'Region' then
    begin
      DispDBGrid.Canvas.Font.Color := clGray;
      if (IniFile.ReadString('BUSINESS_DATA','manual_operator_ask_mode','NO')='YES') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Yavl_pochasovym').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Font.Color := clMenuHighlight;
      if (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Ustan_pribytie').AsInteger<>0) then
          DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := clRed;
      DispDBGrid.Canvas.Font.Color := clWhite;
      if (IniFile.ReadString('BUSINESS_DATA','colored_alien_cust','NO')='YES') and
         ((ADOConnectDM.dsActiveCust.DataSet.FieldByName('Telefon_klienta').AsString='') and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('Adres_vyzova_vvodim').AsString=''))  and
        (ADOConnectDM.dsActiveCust.DataSet.FieldByName('otpuskaetsya_dostepcherom').AsInteger<>CurrDispUserID) then
           DispDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DispDBGrid.Canvas.Brush.Color := holdColor;
      DispDBGrid.Canvas.Font := holdFont;
    end;
 except
   FirstForm.StatusBar.Panels[4].Text:=
     '������ ��������� ������� ������!';
 end;
end;

procedure TReleaseStructForm.DispDBGridCellClick(Column: TColumn);
begin
 try
  if ReleaseStructForm.sPanel1.Visible //or
      //ReleaseStructForm.Splitter2.Visible
      then
   begin
    ReleaseStructForm.sPanel1.Visible:=False;
    //ReleaseStructForm.Splitter2.Visible:=False;
   end;
   if ReleaseStructForm.DispDBGrid.SelectedField<>nil then
     ADOConnectDM.CurrQueryFieldName:=ReleaseStructForm.DispDBGrid.SelectedField.FieldName;
 except
   FirstForm.StatusBar.Panels[4].Text:=
     '������ ������� ������ �����. ������!';
 end;
//if (IniFile.ReadString('BUSINESS_DATA','set_label_by_click','NO')='YES') then
//  BoldOthHandleCompDM.SetCurrLabel;
end;

procedure TReleaseStructForm.EndedCustDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  holdColor: TColor;
begin
  holdColor := EndedCustDBGrid.Canvas.Brush.Color;
  if DataCol = 0 then
    begin

      if ((ADOConnectDM.dsEndedCust.DataSet.FieldByName('Telefon_klienta').AsString='') and
        (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Adres_vyzova_vvodim').AsString='')) then
          EndedCustDBGrid.Canvas.Draw(Rect.Left,Rect.Top,AddingCustBitmap)

      else if ((ADOConnectDM.dsEndedCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-3000))  then
          EndedCustDBGrid.Canvas.Draw(Rect.Left,Rect.Top,ServiceCustBitmap)

      else if ((ADOConnectDM.dsEndedCust.DataSet.FieldByName('Zavershyon').AsInteger=0) and
          ((ADOConnectDM.dsEndedCust.DataSet.FieldByName('Nomer_skidki').AsInteger>0)
          or (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-100)))  then
          EndedCustDBGrid.Canvas.Draw(Rect.Left,Rect.Top,PresentCustBitmap)

      else if ((ADOConnectDM.dsEndedCust.DataSet.FieldByName('Slugebnyi').AsInteger=1)) then
            EndedCustDBGrid.Canvas.Draw(Rect.Left,Rect.Top,SpecCustBitmap)

      else if  ((ADOConnectDM.dsEndedCust.DataSet.FieldByName('Pozyvnoi_ustan').AsInteger=0) and
          (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=0)) then
          EndedCustDBGrid.Canvas.Draw(Rect.Left,Rect.Top,EditCustBitmap)

      else if ((ADOConnectDM.dsEndedCust.DataSet.FieldByName('Zavershyon').AsInteger=0) and
              (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Zadeistv_predvarit').AsInteger=0) and
          (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1))  then
          EndedCustDBGrid.Canvas.Draw(Rect.Left,Rect.Top,ReservedCustBitmap)

      else if ((ADOConnectDM.dsEndedCust.DataSet.FieldByName('Zavershyon').AsInteger=0) and
          (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Zadeistv_predvarit').AsInteger=1) and
          (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1))  then
          EndedCustDBGrid.Canvas.Draw(Rect.Left,Rect.Top,AttentionCustBitmap)

      else if (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Zavershyon').AsInteger=0) then
          EndedCustDBGrid.Canvas.Draw(Rect.Left,Rect.Top,ActiveCustBitmap)
      else
          EndedCustDBGrid.Canvas.Draw(Rect.Left,Rect.Top,EndedCustBitmap);
    end;
  if Column.FieldName = 'Telefon_klienta' then
    begin
      EndedCustDBGrid.Canvas.Brush.Color := clMoneyGreen;
      if ADOConnectDM.dsEndedCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1 then
        EndedCustDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      EndedCustDBGrid.Canvas.Brush.Color := clYellow;
      if (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1) and
         (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Zadeistv_predvarit').AsInteger=1) then
        EndedCustDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      EndedCustDBGrid.Canvas.Brush.Color := clRed;
      if (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Nomer_skidki').AsInteger>0)
          or (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-100) then
        EndedCustDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          
      EndedCustDBGrid.Canvas.Brush.Color := holdColor;
    end;
   if Column.FieldName = 'Adres_vyzova_vvodim' then
    begin
      EndedCustDBGrid.Canvas.Brush.Color := clMoneyGreen;
      if ADOConnectDM.dsEndedCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1 then
        EndedCustDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      EndedCustDBGrid.Canvas.Brush.Color := clYellow;
      if (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Predvariteljnyi').AsInteger=1) and
         (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Zadeistv_predvarit').AsInteger=1) then
        EndedCustDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      EndedCustDBGrid.Canvas.Brush.Color := clRed;
      if (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Nomer_skidki').AsInteger>0)
          or (ADOConnectDM.dsEndedCust.DataSet.FieldByName('Nomer_skidki').AsInteger=-100) then
        EndedCustDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      EndedCustDBGrid.Canvas.Brush.Color := holdColor;
    end;
   if Column.FieldName = 'Pozyvnoi_ustan' then
    begin
      EndedCustDBGrid.Canvas.Brush.Color := clWhite;
      if ADOConnectDM.dsEndedCust.DataSet.FieldByName('Zavershyon').AsInteger=1 then
        EndedCustDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      EndedCustDBGrid.Canvas.Brush.Color := holdColor;
    end;
   if Column.FieldName = 'Nomer_zakaza' then
    begin
      EndedCustDBGrid.Canvas.Brush.Color := clWhite;
      if ADOConnectDM.dsEndedCust.DataSet.FieldByName('Zavershyon').AsInteger=1 then
        EndedCustDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      EndedCustDBGrid.Canvas.Brush.Color := holdColor;
    end;
   if Column.FieldName = 'Uslovn_stoim' then
    begin
      EndedCustDBGrid.Canvas.Brush.Color := clWhite;
      if ADOConnectDM.dsEndedCust.DataSet.FieldByName('Zavershyon').AsInteger=1 then
        EndedCustDBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

      EndedCustDBGrid.Canvas.Brush.Color := holdColor;
    end;
end;

procedure TReleaseStructForm.DrStackStringGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var oldcolor: TColor;
    oldfont: TFont;
    s: string;
    DrawRect: TRect;
begin
  oldcolor:=
      (Sender as TStringGrid).Canvas.Brush.Color;
  oldfont:=
      (Sender as TStringGrid).Canvas.Font;
      
  if (Sender as TStringGrid).Cells[ACol,ARow]<>'' then
  begin
   s:=
     (Sender as TStringGrid).Cells[ACol,ARow];

   if StrToIntDef((Sender as TStringGrid).Cells[ACol,ARow],-1)<>-1 then
    begin
    BoldHandlesDM.bvhDrNum.Value.SetAsVariant(
      StrToInt((Sender as TStringGrid).Cells[ACol,ARow]));
    if BoldHandlesDM.blhDrSearch.List.Count>0 then
      begin
        if IniFile.ReadString('BUSINESS_DATA','use_1c_design','NO')='YES' then
          begin
            (Sender as TStringGrid).Canvas.Font.Color:=
                  clOlive;
             if (BoldHandlesDM.blhDrSearch.CurrentElement
                as TVoditelj).Na_pereryve then
                 (Sender as TStringGrid).Canvas.Font.Color:=
                    clBlue;
             if BoldModelDM.GetLocalDrBusy(
              StrToInt((Sender as TStringGrid).
              Cells[ACol,ARow]))
             //(BoldHandlesDM.blhDrSearch.CurrentElement
             //   as TVoditelj).Z&&anyat_drugim_disp
                then
                  (Sender as TStringGrid).Canvas.Font.Color:=
                    clRed;
             if (BoldHandlesDM.blhDrSearch.CurrentElement
                as TVoditelj).S_klass then
                 (Sender as TStringGrid).Canvas.Font.Color:=
                    TColor(rgb(230,230,230));
          end
        else
          begin
             (Sender as TStringGrid).Canvas.Font.Color:=
                  clGreen;
             if (BoldHandlesDM.blhDrSearch.CurrentElement
                as TVoditelj).Na_pereryve then
                 (Sender as TStringGrid).Canvas.Font.Color:=
                    clGreen;
             if BoldModelDM.GetLocalDrBusy(
              (BoldHandlesDM.blhDrSearch.CurrentElement
              as TVoditelj).Pozyvnoi)
             //(BoldHandlesDM.blhDrSearch.CurrentElement
             //   as TVoditelj).Z&&anyat_drugim_disp
                then
                  (Sender as TStringGrid).Canvas.Font.Color:=
                    clBlue;
             if (BoldHandlesDM.blhDrSearch.CurrentElement
                as TVoditelj).S_klass then
                 (Sender as TStringGrid).Canvas.Font.Color:=
                    TColor(rgb(230,230,230));
          end;          
      end;
  end
  else
  begin
    (Sender as TStringGrid).Canvas.Brush.Color:=clRed;
    (Sender as TStringGrid).Canvas.Font.Color:=clWhite;
  end;
           if (Sender as TStringGrid).Canvas.Brush.Color=clRed then
           begin
             DrawRect:= Rect;
              DrawText((Sender As TStrinGgrid).Canvas.Handle, Pchar(S),
                    Length(S), DrawRect, dt_calcrect or dt_wordbreak or dt_left );
              If ((DrawRect.bottom - DrawRect.top) >
                 (Sender As TStrinGgrid).RowHeights[ARow])
              Then (Sender As TStrinGgrid).RowHeights[Arow]:=(DrawRect.bottom-DrawRect.top)
              Else Begin
                    DrawRect.Right:= Rect.Right;
                    (Sender As TStrinGgrid).Canvas.FillRect( DrawRect );
                    DrawText((Sender As TStrinGgrid).Canvas.Handle, Pchar(S),
                    Length(S), DrawRect, dt_wordbreak or dt_left);
                   End;
           end
           else
             begin
              DrawRect:= Rect;
              DrawText((Sender As TStrinGgrid).Canvas.Handle, Pchar(S),
                    Length(S), DrawRect, dt_calcrect or dt_wordbreak or dt_center );
              If ((DrawRect.bottom - DrawRect.top) >
                 (Sender As TStrinGgrid).RowHeights[ARow])
              Then (Sender As TStrinGgrid).RowHeights[Arow]:=(DrawRect.bottom-DrawRect.top)
              Else Begin
                    DrawRect.Right:= Rect.Right;
                    (Sender As TStrinGgrid).Canvas.FillRect( DrawRect );
                    DrawText((Sender As TStrinGgrid).Canvas.Handle, Pchar(S),
                    Length(S), DrawRect, dt_wordbreak or dt_center);
                   End;
             end;

  end
  else
    begin
    end;


  (Sender as TStringGrid).Canvas.Brush.Color:=oldcolor;
  (Sender as TStringGrid).Canvas.Font:=oldfont;

end;

procedure TReleaseStructForm.DrStackStringGridClick(Sender: TObject);
begin
  AllQueueDrNum:=StrToIntDef((Sender as TStringGrid).Cells
    [(Sender as TStringGrid).Col,
    (Sender as TStringGrid).Row],-1);
  if StrToIntDef((Sender as TStringGrid).Cells[(Sender as TStringGrid).Col,(Sender as TStringGrid).Row],-1)<>-1 then
    begin
    BoldHandlesDM.bvhDrNum.Value.SetAsVariant(
      StrToInt((Sender as TStringGrid).Cells[(Sender as TStringGrid).Col,(Sender as TStringGrid).Row]));
    if BoldHandlesDM.blhDrSearch.List.Count>0 then
      begin
       if BoldModelDM.GetLocalDrBusy(
              AllQueueDrNum)
       //(BoldHandlesDM.blhDrSearch.CurrentElement
       //       as TVoditelj).Z&&anyat_drugim_disp
              then
         FirstForm.SelectNotEndedDriverCust(
            BoldHandlesDM.blhDrSearch.CurrentElement);
      end;
    end;
end;

procedure TReleaseStructForm.DrStackStringGridDblClick(Sender: TObject);
begin
  CurrBottomBE:=nil;
  AllQueueDrNum:=StrToIntDef((Sender as TStringGrid).Cells
    [(Sender as TStringGrid).Col,
    (Sender as TStringGrid).Row],-1);
  if StrToIntDef((Sender as TStringGrid).Cells[(Sender as TStringGrid).Col,(Sender as TStringGrid).Row],-1)<>-1 then
    begin
      BoldHandlesDM.bvhDrNum.Value.SetAsVariant(
        StrToInt((Sender as TStringGrid).Cells[(Sender as TStringGrid).Col,(Sender as TStringGrid).Row]));
    if BoldHandlesDM.blhDrSearch.List.Count>0 then
      begin
       CurrBottomBE:=
         BoldHandlesDM.blhDrSearch.CurrentElement;

       PopUpDM.BottomStackPopupMenu.Popup(MSOb.CursorPos.X,
         MSOb.CursorPos.Y);

      end;
    end
  else
    PopUpDM.SetOnLinePopupMenu.Popup(MSOb.CursorPos.X,
         MSOb.CursorPos.Y);
end;

procedure TReleaseStructForm.DispDBGridDblClick(Sender: TObject);
begin
  //if (IniFile.ReadString('BUSINESS_DATA','set_label_by_dblclick','NO')='YES') then
  BoldOthHandleCompDM.SetCurrLabel;
  //if DispDBGrid.SelectedField.FieldName='REMOTE_INSTR' then
  //  PopUpDM.RemStatPopupMenu.Popup(MSOb.CursorPos.X,
  //       MSOb.CursorPos.Y);  
end;

procedure TReleaseStructForm.EndedCustDBGridTitleClick(Column: TColumn);
begin
if Column.Index>0 then
 begin
  EndedOrderField:=Column.FieldName;
  ReleaseStructForm.QueryNotEndedCust;
 end; 
end;

procedure TReleaseStructForm.DispDBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ReleaseStructForm.DispDBGrid.SelectedField<>nil then
    ADOConnectDM.CurrQueryFieldName:=ReleaseStructForm.DispDBGrid.SelectedField.FieldName;
  EnableDriverRefresh:=True;
  RefreshDelayCounter:=
    StrToInt(IniFile.ReadString('BUSINESS_DATA',
    '�����������_����������_�����_������','0'));
  if (Integer(Key)=13)
    and (IniFile.ReadString('BUSINESS_DATA','������������_���������_���������������_������','NO')='YES') then
    begin
     if ADOConnectDM.ActiveCustADOQuery.FindField('Ustan_pribytie').AsInteger<>0 then
      begin
      if not ADOConnectDM.SendSQL('UPDATE Zakaz SET '+
        'Ustan_pribytie=0'
        +' WHERE BOLD_ID='+IntToStr(ADOConnectDM.ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
           ShowMessage('��������� ��������� �������� ������������� ������!');
       if not(ADOConnectDM.dsActiveCust.State = dsEdit) then
        begin
         ADOConnectDM.RefreshMainGridAndDriverData;
        end;
      end;
      
    end;
  if (Integer(Key)=13) and (ADOConnectDM.ActiveCustADOQuery.RecordCount>0) then
  begin
  if (IniFile.ReadString('BUSINESS_DATA','jump_by_enter_disp','NO')='YES') then
            begin
   if False then
     begin

     end
  else
    begin
       if ReleaseStructForm.DispDBGrid.SelectedField=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Region')] then
         begin
          if (IniFile.ReadString('BUSINESS_DATA','����������_�����_��_��������_�����_���������_������_��������','YES')='NO') then
            begin
            if IniFile.ReadString('BUSINESS_DATA','live_combo_adr_input','NO')<>'YES' then
              ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Adres_vyzova_vvodim')];

            end
          else
            begin
              ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Pozyvnoi_ustan')];
            end;
         end
        else if ReleaseStructForm.DispDBGrid.SelectedField=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('DISTRICT_LOOK')] then
         begin
            if IniFile.ReadString('BUSINESS_DATA','live_combo_adr_input','NO')<>'YES' then
              ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Adres_vyzova_vvodim')]
              else
              begin
              ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Adres_vyzova_vvodim')];
              ReleaseStructForm.DispDBGrid.Repaint;
              end;

         end
        else if ReleaseStructForm.DispDBGrid.SelectedField=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Telefon_klienta')] then
         begin
          if (IniFile.ReadString('BUSINESS_DATA','jump_on_region_after_phone','NO')='YES') then
            begin
              ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Region')];
            end
          else if (IniFile.ReadString('BUSINESS_DATA','�������_��_������_������_�����_��������','NO')='YES') then
            begin
              ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('DISTRICT_LOOK')];
            end
          else
            begin
            if IniFile.ReadString('BUSINESS_DATA','live_combo_adr_input','NO')<>'YES' then
              ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Adres_vyzova_vvodim')]
              else
              begin
              ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Adres_vyzova_vvodim')];
              ReleaseStructForm.DispDBGrid.Repaint;
              end;
              //ADOConnectDM.ActiveCustADOQuery.Edit;
              //ReleaseStructForm.DispDBGrid.SelectedField.
              //ReleaseStructForm.DispDBGrid.SelectedField.FocusControl;
            end;
         end
        else if ReleaseStructForm.DispDBGrid.SelectedField=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Adres_vyzova_vvodim')] then
         begin
           ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Pozyvnoi_ustan')];
         end
        else if ReleaseStructForm.DispDBGrid.SelectedField=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Primechanie')] then
         begin
           ReleaseStructForm.DispDBGrid.SelectedField:=
               ReleaseStructForm.DispDBGrid.Fields[
                    ADOConnectDM.GetFieldNumByName('Uslovn_stoim')];
         end
        else if ReleaseStructForm.DispDBGrid.SelectedField=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Pozyvnoi_ustan')] then
         begin

           if (IniFile.ReadString('BUSINESS_DATA','����������_��_����_���_�������_�����_���������','NO')='YES') then
             ReleaseStructForm.DispDBGrid.SelectedField:=
               ReleaseStructForm.DispDBGrid.Fields[
                    ADOConnectDM.GetFieldNumByName('Primechanie')]
           else
             ReleaseStructForm.DispDBGrid.SelectedField:=
               ReleaseStructForm.DispDBGrid.Fields[
                    ADOConnectDM.GetFieldNumByName('Uslovn_stoim')];

         end
        else if ReleaseStructForm.DispDBGrid.SelectedField=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Uslovn_stoim')] then
         begin
           ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Telefon_klienta')];
         end
        else
          begin
          end;
    end;
  end;
 end;
 if ReleaseStructForm.DispDBGrid.SelectedField<>nil then
   ADOConnectDM.CurrQueryFieldName:=ReleaseStructForm.DispDBGrid.SelectedField.FieldName;
end;

procedure TReleaseStructForm.DispDBGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    EnableDriverRefresh:=True;
    RefreshDelayCounter:=
    StrToInt(IniFile.ReadString('BUSINESS_DATA',
    '�����������_����������_�����_������','0'));
end;

procedure TReleaseStructForm.DispDBGridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
    RefreshDelayCounter:=
    StrToInt(IniFile.ReadString('BUSINESS_DATA',
    '�����������_����������_�����_������','0'));
end;

procedure TReleaseStructForm.BoldTreeView1EndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  EnableDriverRefresh:=True;
end;

procedure TReleaseStructForm.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  holdColor: TColor;
  holdFont: TFont;

begin
 try
  holdColor := DispDBGrid.Canvas.Brush.Color;
  holdFont := DispDBGrid.Canvas.Font;

      if (ADOConnectDM.dsLastWeekIndOrd.DataSet.FieldByName('Nomer_skidki').AsInteger>0)
          or (ADOConnectDM.dsLastWeekIndOrd.DataSet.FieldByName('Nomer_skidki').AsInteger=-100) then
        begin
          DBGrid2.Canvas.Brush.Color := clRed;
          DBGrid2.Canvas.Font.Color := clWhite;
          DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
          DBGrid2.Canvas.Brush.Color := holdColor;
          DBGrid2.Canvas.Font := holdFont;
        end;
 except
   FirstForm.StatusBar.Panels[4].Text:=
     '������ ��������� ������� ������!';
 end;
end;

procedure TReleaseStructForm.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  QueryNotEndedCust;
end;

procedure TReleaseStructForm.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  QueryNotEndedCust;
end;

procedure TReleaseStructForm.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
 QueryNotEndedCust;
end;

procedure TReleaseStructForm.OnlySpecCustCheckBoxClick(Sender: TObject);
begin
  QueryNotEndedCust;
end;

procedure TReleaseStructForm.sEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Integer(Key)=13) then
    begin
      QueryNotEndedCust;
    end;
end;

procedure TReleaseStructForm.sEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Integer(Key)=13) then
    begin
      QueryNotEndedCust;
    end;
end;

procedure TReleaseStructForm.BitBtn4Click(Sender: TObject);
begin
  ADOConnectDM.SaveDBImportedAbNumbers;
end;

procedure TReleaseStructForm.PretendsDBGridKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Integer(Key)=116) then
    begin
      if ADOConnectDM.PresentMessageDlg('��������� ����������� �� '+
        ' �����?') then
        begin
          ADOConnectDM.SetDriverFromCurrPretendents;
        end;
    end;
end;

procedure TReleaseStructForm.PretendsDBGridDblClick(Sender: TObject);
begin
  if ADOConnectDM.PresentMessageDlg('��������� ����������� �� '+
    ' �����?') then
    begin
      ADOConnectDM.SetDriverFromCurrPretendents;
    end;
end;

procedure TReleaseStructForm.BitBtn1Click(Sender: TObject);
begin
  ADOConnectDM.SaveDBImportedCallPhones;
end;

procedure TReleaseStructForm.DBGrid6DblClick(Sender: TObject);
begin
  if ADOConnectDM.OrdOptsTblADODS.RecordCount>0 then
    begin
      if ADOConnectDM.OrderOptionsCDS.
        FieldByName('OrderOptHasIntCDSF').AsInteger<>0 then
        begin
          ADOConnectDM.OrderOptionsCDS.Edit;
          ADOConnectDM.OrderOptionsCDS.
            FieldByName('OrderOptHasIntCDSF').Value:=0;
          ADOConnectDM.OrderOptionsCDS.Post;
        end
      else
        begin
          ADOConnectDM.OrderOptionsCDS.Edit;
          ADOConnectDM.OrderOptionsCDS.
            FieldByName('OrderOptHasIntCDSF').Value:=1;
          ADOConnectDM.OrderOptionsCDS.Post;
        end;
      ReleaseStructForm.SaveOOptsBitBtn.Enabled:=True;
    end;
end;

procedure TReleaseStructForm.SaveOOptsBitBtnClick(Sender: TObject);
begin
  ADOConnectDM.saveCurrentOrderOptions;
end;

procedure TReleaseStructForm.DispDBGridColEnter(Sender: TObject);
begin
  try
  if IniFile.ReadString('BUSINESS_DATA','live_combo_adr_input','NO')='YES' then
  if DispDBGrid.SelectedField.FieldName <> 'Adres_vyzova_vvodim' then
    FEditor.Visible := false
  else
  begin
    FEditor.SelectAll;
    //FEditor.Left := Rect.Left + DispDBGrid.Left;
    //  FEditor.Top := Rect.Top + DispDBGrid.top;
    //  FEditor.Width := Rect.Right - Rect.Left + 2;
    //  FEditor.Visible := True;
  end;
  except

  end;
end;

procedure TReleaseStructForm.FEditorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if IniFile.ReadString('BUSINESS_DATA','live_combo_adr_input','NO')='YES' then
  if (Integer(Key) = 17)  then
  begin
    if (DispDBGrid.SelectedField.FieldName =
      'Adres_vyzova_vvodim') then begin
      //FEditor.SetFocus;
      //SendMessage(FEditor.Handle, WM_CHAR, word(Key), 0);
      live_search_str:=FEditor.Text;
      ADOConnectDM.liveSearchAdress(live_search_str);
      FEditor.Items.Clear;
      if ADOConnectDM.AdrLiveSearchADODS.RecordCount>0 then
      begin
         ADOConnectDM.AdrLiveSearchADODS.First;
         while not ADOConnectDM.AdrLiveSearchADODS.Eof do
         begin
          FEditor.Items.Add(
          ADOConnectDM.AdrLiveSearchADODS.
          FieldByName('Adres_vyzova_vvodim').AsString);
          ADOConnectDM.AdrLiveSearchADODS.Next;
         end;
      end;
      FEditor.DroppedDown:=True;
    end
    else
    begin
      live_search_str:='';
    end;
  end
  else if (Integer(Key) = 27) then
  begin
    ReleaseStructForm.DispDBGrid.SetFocus;
    ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Telefon_klienta')];
  end
  else
  begin
    if (Integer(Key) = 13) then
    begin
    enterCounter:=enterCounter+1;
    if enterCounter>=2 then
    begin
      ReleaseStructForm.DispDBGrid.SetFocus;
    ReleaseStructForm.DispDBGrid.SelectedField:=
                ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Pozyvnoi_ustan')];
    end;
    end
    else
    enterCounter:=0;
  end;
end;

end.
