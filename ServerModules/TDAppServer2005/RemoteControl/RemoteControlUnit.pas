unit RemoteControlUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Menus, ExtCtrls, StdCtrls, DB, ADODB, Grids, DBGrids, DBClient,
  Provider, ComCtrls, DateUtils, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Sockets, TCPClientCollection,
  MessageCollection, uLkJSON, Buttons, Mask, DBCtrls, ActnList, DBActns,
  IdAntiFreezeBase, IdAntiFreeze, IdTCPServer, IdTime;

type
  TRemoteControlForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    RemoteServerADOC: TADOConnection;
    TDMessagesADOT: TADOTable;
    TDMessagesDS: TDataSource;
    AddOperationADOC: TADOCommand;
    Button1: TButton;
    DEST_ID: TEdit;
    MSGText: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    LocalMessageTableCDS: TClientDataSet;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    MSGTableDSP: TDataSetProvider;
    LocalMSGDS: TDataSource;
    N4: TMenuItem;
    DBGrid2: TDBGrid;
    RemoteProcessedOrdersADOQ: TADOQuery;
    RemoteProcessedOrdersDS: TDataSource;
    SetOrderParamADOSP: TADOStoredProc;
    ConnectionCheckTimer: TTimer;
    RDataStateADODS: TADODataSet;
    RequestIdHTTP: TIdHTTP;
    SMSServiceIdHTTP: TIdHTTP;
    TabSheet1: TTabSheet;
    SocketLogMemo: TMemo;
    N5: TMenuItem;
    SocketCheckTimer: TTimer;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    DBGrid1: TDBGrid;
    RemoteOrdersDBGrid: TDBGrid;
    AutorizedVerifyADODS: TADODataSet;
    IncOrdersPriorityADOSP: TADOStoredProc;
    AllActiveDriversADODS: TADODataSet;
    AllActDrOnSectADODS: TADODataSet;
    SetDriverOnLineADOSP: TADOStoredProc;
    SetOrderRemoteStatusADOSP: TADOStoredProc;
    DriverByNumADODS: TADODataSet;
    Splitter1: TSplitter;
    SetIndOrderSendADOSP: TADOStoredProc;
    SetOrdOcAtStatADOSP: TADOStoredProc;
    TabSheet3: TTabSheet;
    BitBtn1: TBitBtn;
    SetOnHandOrdGoADOSP: TADOStoredProc;
    SetOrderGoADOSP: TADOStoredProc;
    AllowOrdDispCancelADOSP: TADOStoredProc;
    AttOrdCompleteADOSP: TADOStoredProc;
    AllDriversADOT: TADOTable;
    GetDrQueuePosADOSP: TADOStoredProc;
    SetDrRemStatusADOSP: TADOStoredProc;
    InsOrdWithStatusADOSP: TADOStoredProc;
    InputJSONTestEdit: TComboBox;
    OutputJSONTestEdit: TComboBox;
    BitBtn2: TBitBtn;
    ClientIdEdit: TEdit;
    AutoSetDriverADOSP: TADOStoredProc;
    AutoSetOrdFinishADOSP: TADOStoredProc;
    SetDrSectorADOSP: TADOStoredProc;
    GetJSONSectorListADOQ: TADOQuery;
    GetDrSectorNameADOQ: TADOQuery;
    AcceptingsSelADODS: TADODataSet;
    GetDrStatusJSONADOSP: TADOStoredProc;
    DriversADOT: TADODataSet;
    TabSheet6: TTabSheet;
    DBGrid3: TDBGrid;
    DriversDS: TDataSource;
    SetDrSyncStatusADOSP: TADOStoredProc;
    TabSheet7: TTabSheet;
    SettingsADODS: TADODataSet;
    SettingsADODSBOLD_ID: TIntegerField;
    SettingsADODSBOLD_TYPE: TSmallintField;
    SettingsADODSTip_objekta: TStringField;
    SettingsADODSData_nachala: TDateTimeField;
    SettingsADODSData_konca: TDateTimeField;
    SettingsADODSProcent_otchisleniya: TBCDField;
    SettingsADODSFiljtr_pozyvnoi: TIntegerField;
    SettingsADODSFiljtr_data_nachala: TDateTimeField;
    SettingsADODSFiljtr_data_konca: TDateTimeField;
    SettingsADODSCvet_prinyatyh: TStringField;
    SettingsADODSCvet_nachavshihsya: TStringField;
    SettingsADODSCvet_okonchivshihsya: TStringField;
    SettingsADODSVybratj_poslednie_nesk_dnei: TIntegerField;
    SettingsADODSKol_posl_dnei: TBCDField;
    SettingsADODSData_minus_vybir_dni: TDateTimeField;
    SettingsADODSNomer_pozyvnoi_filjtr: TIntegerField;
    SettingsADODSCvet_predvarit: TStringField;
    SettingsADODSData_po_umolchaniyu: TDateTimeField;
    SettingsADODSAvtozapoln_sektorov: TIntegerField;
    SettingsADODSNaznach_iz_obsh__spiska: TIntegerField;
    SettingsADODSrep_time: TDateTimeField;
    SettingsADODSAvtozap_konechn_sekt: TIntegerField;
    SettingsADODSAvtozap_nach_sektora: TIntegerField;
    SettingsADODSSoobsh_o_netochn_sekt_reg: TIntegerField;
    SettingsADODSZapros_konech_sektora: TIntegerField;
    SettingsADODSZapros_nach_sektora: TIntegerField;
    SettingsADODSIspoljz_priz_1: TIntegerField;
    SettingsADODSIspoljz_priz_2: TIntegerField;
    SettingsADODSIspoljz_priz_3: TIntegerField;
    SettingsADODSKoeff_prizov_sbavki_1: TBCDField;
    SettingsADODSKoeff_prizov_sbavki_2: TBCDField;
    SettingsADODSKoeff_prizov_sbavki_3: TBCDField;
    SettingsADODSPrizovoe_kolichestvo_1: TIntegerField;
    SettingsADODSPrizovoe_kolichestvo_2: TIntegerField;
    SettingsADODSPrizovoe_kolichestvo_3: TIntegerField;
    SettingsADODSVelichina_priz_sbavki_1: TBCDField;
    SettingsADODSVelichina_priz_sbavki_2: TBCDField;
    SettingsADODSVelichina_priz_sbavki_3: TBCDField;
    SettingsADODSRegim_dispetchera: TIntegerField;
    SettingsADODSEstj_nachatye: TIntegerField;
    SettingsADODSEstj_otpravlennye: TIntegerField;
    SettingsADODSNe_uchit_zanyat_drug_disp: TIntegerField;
    SettingsADODSKolich_deg_grupp: TIntegerField;
    SettingsADODSPer_obnovl_deg: TStringField;
    SettingsADODSPer_obnovl_obychn_vod: TStringField;
    SettingsADODSSutki_deg_gruppy: TDateTimeField;
    SettingsADODSTek_deg_gruppa: TIntegerField;
    SettingsADODSVr_smeny_deg_grupp: TStringField;
    SettingsADODSKolich_vyd_benzina: TBCDField;
    SettingsADODSKomment_k_rabote: TStringField;
    SettingsADODSNamen_organizacii: TStringField;
    SettingsADODSNapravlenie_1: TStringField;
    SettingsADODSNapravlenie_2: TStringField;
    SettingsADODSNapravlenie_3: TStringField;
    SettingsADODSNom_putevogo_lista: TIntegerField;
    SettingsADODSPutev_list_seriya: TStringField;
    SettingsADODSBetweenOnEnd: TDateTimeField;
    SettingsADODSBetweenSetOn: TDateTimeField;
    SettingsADODSBetweenStartSet: TDateTimeField;
    SettingsADODSBetweenOnEndColor: TStringField;
    SettingsADODSBetweenSetOnColor: TStringField;
    SettingsADODSBetweenStartSetColor: TStringField;
    SettingsADODSBetweenSetEnd: TDateTimeField;
    SettingsADODSBetweenSetEndColor: TStringField;
    SettingsADODSViewSetEndLong: TIntegerField;
    SettingsADODScvet_obshepriz: TStringField;
    SettingsADODScvet_so_skidkoi: TStringField;
    SettingsADODSobshepriz_chislo: TIntegerField;
    SettingsADODSobshepriz_schyotchik: TIntegerField;
    SettingsADODSsimv_avtom_ustan: TIntegerField;
    SettingsADODSschit_okon_posl_kon_sekt: TIntegerField;
    SettingsADODSvr_smeny_dispetcherov: TStringField;
    SettingsADODSuse_bonus3: TIntegerField;
    SettingsADODSuse_bonus4: TIntegerField;
    SettingsADODSPrizovoe_kolichestvo_4: TIntegerField;
    SettingsADODSDAYLY_SALE: TBCDField;
    SettingsADODSMIN_DEBET: TBCDField;
    SettingsADODSview_bonuses: TIntegerField;
    SettingsADODSview_ab_bonuses: TIntegerField;
    SettingsADODSuse_ab_account: TIntegerField;
    SettingsADODSdb_version: TIntegerField;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    SettingsDS: TDataSource;
    RModuleAL: TActionList;
    SettingsDSP: TDataSetPost;
    RemoteModIdAntiFreeze: TIdAntiFreeze;
    IdTCPServer1: TIdTCPServer;
    TabSheet8: TTabSheet;
    Test2Memo: TMemo;
    GetJSONDriversListADOQ: TADOQuery;
    SettingsADODSuse_dr_priority: TIntegerField;
    SettingsADODSdir_dr_autoset: TIntegerField;
    TabSheet9: TTabSheet;
    Panel3: TPanel;
    SocksStatusLabel: TLabel;
    SocksListView: TMemo;
    OneMinuteTaskADOSP: TADOStoredProc;
    AutoArhADOSP: TADOStoredProc;
    SettingsADODSauto_order_arhive: TIntegerField;
    SettingsADODSlast_arh_date: TDateTimeField;
    SettingsADODSmin_days_delta: TIntegerField;
    AutoArhivedTimer: TTimer;
    SetDrSectStatADOSP: TADOStoredProc;
    SettingsADODSsectors_wbroadcast: TStringField;
    SettingsADODSuse_sect_wbroadcast: TIntegerField;
    SettingsADODShas_sect_wbroadcast: TIntegerField;
    ResetSectBroadcastADOC: TADOCommand;
    DriverSettingsADODS: TADODataSet;
    SettingsADODSsync_busy_accounting: TIntegerField;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    SettingsADODScurr_mob_version: TIntegerField;
    SettingsADODSmin_mob_version: TIntegerField;
    SettingsADODSmandatory_update: TIntegerField;
    SettingsADODSaddit_rem_params: TStringField;
    SettingsADODSGPS_SRV_ADR: TStringField;
    ResetOrdBroadcastADOC: TADOCommand;
    SettingsADODSforders_wbroadcast: TStringField;
    SettingsADODSuse_ford_wbroadcast: TIntegerField;
    SettingsADODShas_ford_wbroadcast: TIntegerField;
    ProceedOpRequestADOSP: TADOStoredProc;
    SetOrdOcAtStat2ADOSP: TADOStoredProc;
    SetOrdDrCAttStADOSP: TADOStoredProc;
    InsertEventADOSP: TADOStoredProc;
    SetSectDirectionADOC: TADOCommand;
    InsertOrdWithParamADOOSP: TADOStoredProc;
    SMSServiceIdHTTPPOST: TIdHTTP;
    OnPlaceADOC: TADOCommand;
    AttOrdCompleteADOSP2: TADOStoredProc;
    GetDrLockOnCalcDebtADOSP: TADOStoredProc;
    SetDriverOutLineADOSP: TADOStoredProc;
    InsertEvent2ADOSP: TADOStoredProc;
    SetDrGPSRequStatusADOC: TADOCommand;
    AttOrdCompleteADOSP3: TADOStoredProc;
    GetTOListADOQ: TADOQuery;
    SetTarifADOC: TADOCommand;
    SetOptCombADOC: TADOCommand;
    SettingsADODSto_show_fords: TSmallintField;
    SettingsADODSclsms_ordground: TSmallintField;
    SettingsADODSsend_wait_info: TSmallintField;
    SettingsADODSsend_prev_wait: TSmallintField;
    SettingsADODSuse_dr_balance_counter: TIntegerField;
    SettingsADODSdont_reset_dr_queue: TSmallintField;
    SettingsADODSodirect_to_dsect: TSmallintField;
    SettingsADODSftime_tariff: TBCDField;
    SettingsADODSrecalc_on_timeset: TSmallintField;
    SettingsADODSdrcalc_start_date: TWideStringField;
    SettingsADODSorder_sort_dr_assign: TSmallintField;
    SettingsADODStmeter_tariff: TBCDField;
    SettingsADODStaropt_accounting: TSmallintField;
    SettingsADODSautotarif_by_driver: TSmallintField;
    SettingsADODSovertar_by_driver: TSmallintField;
    SettingsADODSautotarif_by_tplan: TSmallintField;
    SettingsADODSday_payment: TBCDField;
    SettingsADODSmanual_day_sale: TSmallintField;
    SettingsADODSdayli_pay_time_offset: TIntegerField;
    SettingsADODSnew_wperiod_opercent: TBCDField;
    SettingsADODScheck_net_time: TSmallintField;
    SettingsADODSlast_net_time: TDateTimeField;
    SetDrPaymentStatusADOC: TADOCommand;
    SetDrDailyPStatusADOSP: TADOStoredProc;
    One10SecTaskADOSP: TADOStoredProc;
    Timer10Sec: TTimer;
    SettingsADODStest_phone: TStringField;
    SettingsADODSdisp_phone: TStringField;
    SettingsADODSmanager_phone: TStringField;
    SettingsADODScall_demon_locsip_name: TStringField;
    SettingsADODScall_demon_netsip_name: TStringField;
    SettingsADODSdemon_call_ctx: TStringField;
    SettingsADODSdemon_call_virtext: TStringField;
    SettingsADODSdemon_call_priority: TStringField;
    SettingsADODSdemon_call_timeout: TStringField;
    SettingsADODSdemon_callerid: TStringField;
    SettingsADODSclord_sort_dassign: TSmallintField;
    SettingsADODSmax_clrereg_cnt: TSmallintField;
    SettingsADODSfix_order_pay_with_daily_pay: TSmallintField;
    SettingsADODSclsms_onplaceto: TSmallintField;
    SettingsADODSdont_show_auto_count: TSmallintField;
    SettingsADODSdont_show_auto_coords: TSmallintField;
    SettingsADODSdont_show_driver_info: TSmallintField;
    SettingsADODSauto_bsector_longorders: TSmallintField;
    SettingsADODSauto_bsectorid_longorders: TIntegerField;
    SettingsADODSauto_bsector_longtime: TIntegerField;
    SettingsADODSauto_bsector_onlineorders: TSmallintField;
    SettingsADODSauto_bsectorid_onlineorders: TIntegerField;
    SettingsADODSauto_bsector_onlinetime: TIntegerField;
    SettingsADODSauto_neardriver_onlineorders: TSmallintField;
    SettingsADODSauto_neardriver_onlinetime: TIntegerField;
    SettingsADODSneardriver_online_byord_geocode: TSmallintField;
    SettingsADODSauto_neardriver_allorders: TSmallintField;
    SettingsADODSauto_neardriver_alltime: TIntegerField;
    SettingsADODSneardriver_all_byord_geocode: TSmallintField;
    SettingsADODSclsms_offlinedr_assign: TSmallintField;
    SettingsADODSuse_kladr: TSmallintField;
    SettingsADODSkladr_object_code: TStringField;
    SettingsADODScurrency_short: TStringField;
    SettingsADODSstate_phone_code: TStringField;
    SettingsADODSuse_fordbroadcast_priority: TSmallintField;
    DecrementOrdersPriorityADOSP: TADOStoredProc;
    PriorityDriversADODS: TADODataSet;
    SetOrderEmptyDriverADOC: TADOCommand;
    ManualSetOrdRemStatADOSP: TADOStoredProc;
    SettingsADODSauto_bsect_notmanual_ord: TSmallintField;
    SettingsADODSauto_close_client_canceling: TSmallintField;
    SettingsADODSauto_close_clcancel_time: TIntegerField;
    SettingsADODSsip1_robot_active_time: TDateTimeField;
    SettingsADODSsip2_robot_active_time: TDateTimeField;
    SettingsADODSrobot_active_time_interval: TIntegerField;
    SettingsADODSreplace_sms_with_robot: TSmallintField;
    SettingsADODSuse_call_robot: TSmallintField;
    SettingsADODSstart_first_song_code: TIntegerField;
    SettingsADODSonplace_first_song_code: TIntegerField;
    SettingsADODSweb_protected_code: TStringField;
    SettingsADODSauto_arh_empty_orders: TSmallintField;
    SettingsADODSno_percent_before: TSmallintField;
    SettingsADODSno_percent_before_summ: TBCDField;
    SettingsADODSno_percent_before_payment: TBCDField;
    SettingsADODSuse_prize_reserved_limit: TSmallintField;
    SettingsADODSprize_reserved_limit: TIntegerField;
    SettingsADODSprize_reward_summ: TBCDField;
    SettingsADODSlock_reserv_on_limit: TSmallintField;
    SputnikApiHTTP: TIdHTTP;
    GetEarlyListADOQuery: TADOQuery;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure SMSServiceIdHTTPRedirect(Sender: TObject; var dest: string;
      var NumRedirect: Integer; var Handled: Boolean;
      var VMethod: TIdHTTPMethod);
    procedure Timer10SecTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AutoArhivedTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet7Show(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SocketCheckTimerTimer(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure SocketLogMemoChange(Sender: TObject);
    procedure ConnectionCheckTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AddSocketServLog(MSG: Widestring);
    function addDirectJSONMessageToClient(JSONStr: string; CurrClientID: Integer): Boolean;
    procedure sendDriverStatus(clientIndex: Integer; msg: TMessageCollectionItem);
  private
    { Private declarations }
  public
    { Public declarations }
    SocketCoord: TSocketCoordinator;
    ServerActive: Boolean;
    function SendTextMessage(DEST_ID: Integer; MSG: string;
      CLIENT_PHONE: string=''; dest_mode: string='client';
      sale: Double=0; deliveTime: Integer=0): Boolean;
    function RefreshMSGTable: Boolean;
    procedure ConnectToRemoteDB;
    function SendTextMessageWithHTTP(
      dest_id: Integer; text: String): Boolean;
    function IdHTTPGetDynamic(URL: string): Boolean;
    function SendTextMessageWithHTTPService
      (MSG: string; CLIENT_PHONE: string;
      ThreadMode: Boolean=False;
      dest_mode: string='client'; sale: Double=0; delivTime: Integer=0): Boolean;
    function SendTextMessageWithHTTPServicePOST
      (MSG: string; CLIENT_PHONE: string; ThreadMode:
      Boolean=False; dest_mode: string='client'; sale: Double=0): Boolean;
    function proceedOpRequest(InputJSONObject: TLkJSONObject;
      DriverId: Integer=-1; DrNum: Integer=-1): Widestring;
    function proceedInputJSONMessages
      (InputJSONMessages: TMessageCollection): Boolean;
    function verifyDriverClient
      (login, psw: String): Boolean;
    procedure incrementOrderPriorStat(orderId,
      MaxOrderPriority: Integer);
    function localRebuildSendMsgCollection: Boolean;
    procedure deleteAskedSendingMessages;
    function setOrderRemoteStatus(order_id, status: Integer;
      priority_counter: Integer=-10000) : Boolean;
    function getDriverStatusJSON(driver_id: Integer): Widestring;
    procedure deleteOldThreadsSendingMessages;
    //function AutoSetDriverOnOrder(orderID,
    //orderCounter: Integer): Boolean;
    function AutoSetOrderStatus(orderID, orderStatus: Integer;
      order_start_time, order_ended_time,
      last_status_time: TDateTime; rSync: Integer): Boolean;
    function setDriverRemoteStatus(driver_id, status:
      Integer; check_busy: Integer=-1; on_launch: Integer=-1;
      on_line: Integer=-1; sync: Integer=-1) : Boolean;
    function AutoSetDriverStatus(driverID, driverStatus: Integer;
      last_status_time: TDateTime; syncStatus: Integer): Boolean;
    function GetJSONSectorList(driverID: Integer): Widestring;
    function GetJSONDriversList: Widestring;
    function GetDrSectorName(driverId: Integer): String;
    function orderHasAccepting(orderId: Integer;
      driverId: Integer=-1; alsoCheckDriversActivity:
      Boolean=False): Boolean;
    function setDriverSyncStatus(driver_id, status:
      Integer) : Boolean;
    function getFileSize(FileName: String): Integer;
    procedure writeToServerLog(log_line: string; writeToFile: Boolean=True;
      writeToMemo: Boolean=True);
    procedure refreshSocksMemo;
    function checkRemoteDrivers: Boolean;
    function ReloadDrSettings: Boolean;
    procedure MessageWideBroadcasting(Msg: Widestring);
    function getDriverOrdBroadcasting(DriverId: Integer): Widestring;
    procedure MessageDriverOrderBroadcasting;
    function getSectorsStatus: WideString;
    procedure resetSectorBroadcast;
    function getDriverJSONSettings(driverId: Integer): Widestring;
    procedure resetOrdersBroadcast;
    procedure decrementDriversOrderPriority;
    function InsertEvent(ETYPE_ID, ORDER_ID, DRIVER_ID, SECTOR_ID: Integer;
      EDATE: TDateTime; DESCRIPTION: Widestring; ADRES, PHONE: String;
      DR_NUM: Integer): Integer;
    function getDriverCalcBlocked(DrNum: Integer): Boolean;
    function InsertEvent2(ETYPE_ID, ORDER_ID,
      DRIVER_ID, SECTOR_ID: Integer; EDATE: TDateTime;
      DESCRIPTION: Widestring; ADRES, PHONE: String;
      DR_NUM: Integer; LATITUDE, LONGITUDE: String): Integer;
    function GetJSONTOList(driverID: Integer): Widestring;
    function GetJSONEarlyOrdersList(driverID: Integer): Widestring;
    procedure setOrderTarif(orderId, tarifId: Integer);
    procedure setOrderOptComb(orderId: Integer; optComb: String);
    procedure ManualSetCurrOrderRemoteStatus(orderId,
      destStatus: Integer);
  end;

var
  RemoteControlForm: TRemoteControlForm;
  CD, CurrDir: Widestring;
  LastBackUpFile: Widestring;
  AutoRemoteConnectInActive: Boolean=False;
  LastHTTPAnswer: Widestring;
  SendMsgCollection: TMessageCollection;
  MaxOrderPriority, MaxIndivOrderPriority: Integer;
  StartWithOthersSendPriority: Integer;
  localRebuildSendMsgInProcess: Boolean=False;
  inputMessagesInProcess: Boolean=False;
  clientCheckingInActive: Boolean=False;
  HasRemoteDataChanges: Boolean=False;
  HasRemoteDrDataChanges: Boolean=False;
  logFile: TextFile;
  logActive: Boolean=False;
  sectorWideBroadcastCounter: Integer=5;
  ordersDBProcessingCounter: Integer=2;
  orderWideBroadcastCounter: Integer=2;

const
  ORDER_NO_REM_STATUS = 0;
  ORDER_INDIVID_TAKE = 1;
  ORDER_SECTOR_PUBLISHING = 2;
  ORDER_ALL_PUBLISHING = 3;
  ORDER_PUBLUSHED_WAIT = 4;
  ORDER_IS_OCCUPED = 5;
  ORDER_OCCUPED_DENY = 6;
  ORDER_OCCUPED_ALLOW = 7;
  ORDER_BUSY = 8; //???
  ORDER_ONHAND_ALLOW = 9;
  ORDER_ONHAND_ACTIVE = 10;
  ORDER_DISP_CANCEL = 11;
  ORDER_DISP_CANCEL_DR_INCOURSE = 12;
  ORDER_DRV_CANCEL = 13;
  ORDER_DRV_CANCEL_DISP_ALLOW = 14;
  ORDER_DRV_COMPLETE = 15;
  ORDER_COMLETE_ALLOW = 16;

  ORDER_ALLOW_ASK_WAIT = 17;
  ORDER_ONHAND_ALLOW_ASK_WAIT = 18;
  ORDER_DISP_CANCEL_ASK_WAIT = 19;
  ORDER_CLOSE_ERROR = 20;
  ORDER_DRCANCEL_DENY = 21;
  ORDER_INWORKING_WAIT = 22;
  ORDER_ONHAND_ATTEPMT = 23;
  ORDER_ONHAND_DENY = 24;
  ORDER_ONHAND_ALLOW_USER_WAIT = 25;
  ORDER_COMPLETE_ALLOW_USER_WAIT = 26;
  ORDER_CLOSE_ASK_WAIT = 27;
  //ORDER_ONHAND_ABORT = 28;
  ORDER_DRV_CANCEL_USER_WAIT = 29;

  ORDER_CLOSE = 100;

  DR_ERROR_CL_SOCKET = -2;
  DR_NOT_CONNECTED = -1;
  DR_NOT_AUTORIZED = 0;
  FREE_DRIVER = 1;
  DR_IN_DECISION = 2;
  DR_IN_WORKING = 3;
  DR_IN_WORKING_ONHAND = 4;
  DR_IN_CANCELING = 5;
  DR_IN_SELF_CANCELING = 6;
  DR_ON_REST = 7;
  DR_OUT_FROM_LINE = 8;
  DR_IN_WORKING_ONHAND_ATTEMPT = 9;
  DR_IN_CANCELING_ATTEMPT = 10;
  DR_IN_SELF_CANCELING_ATTEMPT = 11;
  DR_ON_REST_ATTEMPT = 12;
  DR_OUT_FROM_LINE_ATTEMPT = 13;
  DR_IN_WORKING_ONHAND_DENY = 14;
  DR_IN_SELF_CANCELING_DENY = 15; //???
  DR_ON_REST_DENY = 16;
  DR_OUT_FROM_LINE_DENY = 17;
  DR_FROM_REST_ATTEMPT = 18;
  DR_NOACTIVE_STATUS=100;

  EVENT_ALARM = 1;
  EVENT_ON_REST = 2;
  EVENT_SECTOR_DIRECTION = 3;
  EVENT_FROM_REST = 4;
  EVENT_FROM_LINE = 5;
  EVENT_GPS_COORDS = 6;

  PAY_NULL = 0;
  PAY_REQU = 1;
  PAY_REQU_SEND = 2;
  PAY_ALLOW = 3;
  PAY_DECLINE = 4;

  SPUTNIK_API_SEARCH = 0;
  SPUTNIK_API_ROUTE = 1;

implementation

uses ServerMainUnit, SMSSendUnit, EncdDecd,
  IdURI;

{$R *.dfm}

function TranslitRus2Lat(const Str: string; replaceDelimeter: Boolean=True): string;
const
  RArrayL = '��������������������������������';
  RArrayU = '�����Ũ��������������������������';
  colChar = 33;
  arr: array[1..2, 1..ColChar] of string =
  (('a', 'b', 'v', 'g', 'd', 'e', 'e', 'zh', 'z', 'i', 'y',
    'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f',
    'h', 'c', 'ch', 'sh', 'sh', '''', 'y', '''', 'e', 'yu', 'ya'),
    ('A', 'B', 'V', 'G', 'D', 'E', 'E', 'ZH', 'Z', 'I', 'Y',
    'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F',
    'H', 'C', 'CH', 'SH', 'SH', '''', 'Y', '''', 'E', 'YU', 'YA'));
var
  i: Integer;
  LenS: Integer;
  p: integer;
  d: byte;
begin
  result := '';
  LenS := length(str);
  for i := 1 to lenS do
  begin
    d := 1;
    p := pos(str[i], RArrayL);
    if p = 0 then
    begin
      p := pos(str[i], RArrayU);
      d := 2
    end;
    if p <> 0 then
      result := result + arr[d, p]
    else
      result := result + str[i]; //���� �� ������� �����, �� ����� ��������
  end;
  if replaceDelimeter then
  result:=StringReplace(StringReplace(result,
          '"',' ', [rfReplaceAll]),
          '''',' ', [rfReplaceAll]);
  //else
  //result:=
end;

procedure TRemoteControlForm.refreshSocksMemo;
var i:Integer;
begin
  SocksListView.Clear;
  socksStatusLabel.Caption:=
    '����� �����-�����: '+IntToStr(SocketCoord.TCPClientCollection.Count);
  if true then
      for i:=0 to SocketCoord.TCPClientCollection.Count-1 do
      begin
        try
        SocksListView.Lines.Add(
          'id='+IntToStr(SocketCoord.TCPClientCollection.
          Items[i].ClientID)+', ���. '+IntToStr(
          SocketCoord.TCPClientCollection.Items[i].Pozyvnoi)+
          ':'+SocketCoord.TCPClientCollection.
          Items[i].StatusStr);
        except on E:Exception do
          socksStatusLabel.Caption:=
            E.Message;
        end;
      end;
end;

function TRemoteControlForm.IdHTTPGetDynamic(URL: string): Boolean;
var res: Boolean;
    //idHttp :TIdHTTP;
begin

  res:=False;
  //idHttp := TIdHTTP.Create(nil);
  { ��� ������� "���������" ��������� idHTTP }
  { ... }
  try
    //idHttp.Get(URL, mStream);
    try
      RequestIdHTTP.ConnectTimeout := 60000;
      RequestIdHTTP.ReadTimeout := 60000;

      LastHTTPAnswer :=
        UTF8ToAnsi(RequestIdHTTP.
        Get(TIdURI.URLEncode(AnsiToUTF8(URL))));

      if (RequestIdHTTP.Response<>nil) then
        if (RequestIdHTTP.Response.ResponseCode=200) then
        begin
          if (LastHTTPAnswer=StringReplace(LastHTTPAnswer,
                      '[not_success]', '',
                      [rfReplaceAll, rfIgnoreCase])) then
            begin
              res:=True;
              ServerMainForm.WriteEvent(
                '�������, ����� �������: '
                +LastHTTPAnswer);
            end
          else
            ServerMainForm.WriteEvent(
            '������ ��������� �������: '
              +StringReplace(LastHTTPAnswer,
                      '[not_success]', '',
                      [rfReplaceAll, rfIgnoreCase])+'.');
        end;
      LastHTTPAnswer:=StringReplace(LastHTTPAnswer,
                      '[not_success]', '',
                      [rfReplaceAll, rfIgnoreCase]);

      except on E:Exception do
        begin
          ServerMainForm.WriteEvent(
            '������ ���������� ��������� ����� HTTP: '+E.Message+'.');
        end;
      end;
  finally
    //idHttp.Free;
    RequestIdHTTP.Disconnect;
  end;
  Result:=res;
end;

function TRemoteControlForm.SendTextMessageWithHTTP(
      dest_id: Integer; text: String): Boolean;
var res: Boolean;
begin
  res:=False;
  LastHTTPAnswer := '[not_success]��� ����������!';
  IdHTTPGetDynamic(
      IniFile.ReadString('BUSINESS_DATA',
      '�������_�����_HTTP_����������',
      'http://anapataxi.ru/')+'index.php?'+
      'action=clear_messages&dest_id='+IntToStr(dest_id)+
      '&psw='+
      EncodeString(IniFile.ReadString('BUSINESS_DATA',
      'HTTP_password',
      'password')));
  Result := IdHTTPGetDynamic(
      IniFile.ReadString('BUSINESS_DATA',
      '�������_�����_HTTP_����������',
      'http://anapataxi.ru/')+'index.php?'+
      'action=add_message&dest_id='+IntToStr(dest_id)+
      '&msg_text='+text+'&psw='+
      EncodeString(IniFile.ReadString('BUSINESS_DATA',
      'HTTP_password',
      'password')));
end;

function TRemoteControlForm.SendTextMessageWithHTTPService(MSG: string;
    CLIENT_PHONE: string; ThreadMode: Boolean=False;
    dest_mode: string='client'; sale: Double=0; delivTime: Integer=0): Boolean;
var s, msg_enc, delive_str: string;
    res: Boolean;
begin
  res:=False;
  delive_str:='';
  ServerMainForm.WriteEvent(CLIENT_PHONE+':'+MSG);
  if (Length(MSG)>0) and (Length(CLIENT_PHONE) >= 5) then
  if  ThreadMode then
  begin
    ServerMainForm.WriteEvent('Unsupported Thread SMS-mode!');
  end
  else
  begin
    ServerMainForm.WriteEvent('Go SMS!');
    try
      if IniFile.ReadString('BUSINESS_DATA',
        '������_��������_��_��������_������',
        '')<>'' then
      begin
      if (dest_mode='driver') then
        s := IniFile.ReadString('BUSINESS_DATA',
          '������_��������_��������',
          '')
      else
       begin

       ServerMainForm.WriteEvent('����� '+FloatToStr(sale));
       if (sale>0) and (IniFile.ReadString('BUSINESS_DATA',
          '��������_������_������_�����',
          'NO')='YES') then  ServerMainForm.WriteEvent
            ('������� ������ ������ �����!')
       else
       begin
          ServerMainForm.WriteEvent
            ('����� ��������='+IntToStr(delivTime));
       end;

        if (sale>0) and (IniFile.ReadString('BUSINESS_DATA',
          '��������_������_������_�����',
          'NO')='YES')   then
          s := IniFile.ReadString('BUSINESS_DATA',
          '������_��������_�������_��_������',
          '')
          else
          begin
            s := IniFile.ReadString('BUSINESS_DATA',
          '������_��������_��_��������_������',
          '');
            ServerMainForm.WriteEvent
            ('������� ������ ������ �����!');
            if (delivTime>0) and (IniFile.ReadString('BUSINESS_DATA',
              '����_��_��������_�_SMS',
              'NO')='YES')   then
              begin
              ServerMainForm.WriteEvent(
                  '������� ������ ������� � ������� ��������!');
                 delive_str:=StringReplace(IniFile.ReadString('BUSINESS_DATA',
                  '������_�����_��������','(�������� ***___msg_text ���.)'),
                  '***___msg_text',IntToStr(delivTime),
                  [rfReplaceAll]);
              end;
          end;
        end;

      s:=StringReplace(s,'***___br',#13#10,
          [rfReplaceAll]);

      if (s<>StringReplace(s,
        '***___dest_number','',
        [rfReplaceAll])) or True then
      begin

      s:=StringReplace(s,
        '***___dest_number',IniFile.ReadString('BUSINESS_DATA',
          '�������_������_���_���_��������_�������',
          '')+
        //'9184652120',
        CLIENT_PHONE,
        [rfReplaceAll]);
      //SMSServiceIdHTTP.URL.
      //AnsiToUTF8(
      if (s<>StringReplace(s,
        '***___msg_text','',
        [rfReplaceAll])) or True then
      begin

      if (sale>0) and (IniFile.ReadString('BUSINESS_DATA',
          '��������_������_������_�����',
          'NO')='YES')   then
          s:=StringReplace(s,
        '***___msg_text',FloatToStr(sale),[rfReplaceAll])
          else
      s:=StringReplace(s,
        '***___msg_text',MSG+delive_str,[rfReplaceAll]);

      ServerMainForm.WriteEvent(
            '������: '+s+'.');
      ServerMainForm.WriteEvent(
            'Encode: '+TIdURI.URLEncode(s)+'.');

      if IniFile.ReadString('BUSINESS_DATA',
          '������������_���������_�����_SMS_HTTP',
          'NO')='YES'   then begin
          SMSServiceIdHTTP.HandleRedirects := True;
      end;
      s := SMSServiceIdHTTP.Get(TIdURI.URLEncode(AnsiToUTF8(s)));

      ServerMainForm.WriteEvent(
            '�����: '+StringReplace
            (s,#13,#13#10, [rfReplaceAll]));
      res:=True;
      end
        else ServerMainForm.WriteEvent('������ �������� ��� 1!');
      end
        else ServerMainForm.WriteEvent('������ �������� ��� 2!');
      end
        else ServerMainForm.WriteEvent('������ �������� ��� 3!');
    except on E:Exception do
        begin
          //if not res then
          ServerMainForm.WriteEvent(
            '������ ���������� ��������� ����� ������ HTTP: '+E.Message+'.');
          try
            SMSServiceIdHTTP.Disconnect;
          except on E:Exception do
            ServerMainForm.WriteEvent(
            '������ ������ ����������! '+E.Message);
          end;
        end;
      end;
  end;
  if not res then
    ServerMainForm.WriteEvent('Bad result!');
  Result:=res;
end;

{function TRemoteControlForm.SendSputnikApiHTTPRequest(apiMethod: Integer;
  parameters: String): String;
begin
end;   }

function TRemoteControlForm.SendTextMessageWithHTTPServicePOST
  (MSG: string; CLIENT_PHONE: string; ThreadMode:
  Boolean=False; dest_mode: string='client'; sale: Double=0): Boolean;
var s, msg_enc, post_http_base, repl_str, templ_str: string;
    res, has_repl: Boolean;
    post: TStringList;
	i: Integer;
begin
  res:=False;
  ServerMainForm.WriteEvent(CLIENT_PHONE+':'+MSG);
  if (Length(MSG)>0) and (Length(CLIENT_PHONE) >= 5) then
  if  ThreadMode then
  begin
    ServerMainForm.WriteEvent('Unsupported Thread SMS-mode!');
  end
  else
  begin
    ServerMainForm.WriteEvent('Go SMS!');
    try
      post := TStringList.Create;
      if IniFile.ReadString('BUSINESS_DATA',
        'http_post_���������_������',
        '')<>'' then
      begin
      post_http_base:=IniFile.ReadString('BUSINESS_DATA',
        'http_post_���������_������','');
      if (dest_mode='driver') then
        post.LoadFromFile(CDP+'\driver_order_post.txt')
      else
       begin

       ServerMainForm.WriteEvent('����� '+FloatToStr(sale));
       if (sale>0) and (IniFile.ReadString('BUSINESS_DATA',
          '��������_������_������_�����',
          'NO')='YES') then  ServerMainForm.WriteEvent
            ('������� ������ ������ �����!');

        if (sale>0) and (IniFile.ReadString('BUSINESS_DATA',
          '��������_������_������_�����',
          'NO')='YES')   then
            post.LoadFromFile(CDP+'\client_report_post.txt')
          else
            post.LoadFromFile(CDP+'\client_call_post.txt');
        end;

      has_repl:=False;
	    templ_str:='***___br';
	    repl_str:=#13#10;
	    for i:=0 to post.Count-1 do
	    begin
		    if post.Strings[i]<>StringReplace(
          post.Strings[i],templ_str,repl_str,
          [rfReplaceAll]) then
		        has_repl:=True;
		    post.Strings[i]:=StringReplace(post.Strings[i],
        templ_str,repl_str,[rfReplaceAll]);
	    end;

      if (post.Count>0) then
      begin

      has_repl:=False;
	    templ_str:='***___dest_number';
	    repl_str:=IniFile.ReadString('BUSINESS_DATA',
          '�������_������_���_���_��������_�������',
          '')+CLIENT_PHONE;
	    for i:=0 to post.Count-1 do
	    begin
		    if post.Strings[i]<>StringReplace(
          post.Strings[i],templ_str,repl_str,
          [rfReplaceAll]) then
		        has_repl:=True;
		    post.Strings[i]:=StringReplace(post.Strings[i],
        templ_str,repl_str,[rfReplaceAll]);
	    end;

      if has_repl or True then
      begin

      has_repl:=False;
	    templ_str:='***___msg_text';
      if (sale>0) and (IniFile.ReadString('BUSINESS_DATA',
          '��������_������_������_�����',
          'NO')='YES')   then
          repl_str:=FloatToStr(sale)
          else
          repl_str:=MSG;
	    for i:=0 to post.Count-1 do
	    begin
		    if post.Strings[i]<>StringReplace(
          post.Strings[i],templ_str,repl_str,
          [rfReplaceAll]) then
		        has_repl:=True;
		    post.Strings[i]:=StringReplace(post.Strings[i],
        templ_str,repl_str,[rfReplaceAll]);
	    end;

      if (has_repl and ((sale=0) or ((sale>0) and
          (IniFile.ReadString('BUSINESS_DATA',
          '��������_������_������_�����',
          'NO')='YES')))) or True then
      begin

	  {if (IniFile.ReadString('BUSINESS_DATA',
          '��������_�_UTF8_���_POST',
          'NO')='YES') then
	  for i:=0 to post.Count-1 do
         post.Strings[i]:=AnsiToUTF8(post.Strings[i]); }

	  ServerMainForm.EventsList.Items.Add('������ POST:');
      for i:=0 to post.Count-1 do
         ServerMainForm.EventsList.Items.Add(post.Strings[i]);
    if (IniFile.ReadString('BUSINESS_DATA',
          '��������_�_UTF8_���_POST',
          'NO')='YES') then
    begin
      for i:=0 to post.Count-1 do
      begin

        if (IniFile.ReadString('BUSINESS_DATA',
          'no_url_decode_���_POST',
          'NO')='YES') then
          post.Strings[i]:=AnsiToUTF8(post.Strings[i])
          else
         post.Strings[i]:=TIdURI.ParamsEncode(AnsiToUTF8(post.Strings[i]));
      end
    end
    else
    if (IniFile.ReadString('BUSINESS_DATA',
          'no_url_decode_���_POST',
          'NO')<>'YES') then
      for i:=0 to post.Count-1 do
         post.Strings[i]:=TIdURI.ParamsEncode(post.Strings[i]);

      ServerMainForm.EventsList.Items.Add('Encode:');
      for i:=0 to post.Count-1 do
         ServerMainForm.EventsList.Items.Add(post.Strings[i]);
      //SMSServiceIdHTTPPOST.URL.Params

      if IniFile.ReadString('BUSINESS_DATA',
          '������������_���������_�����_SMS_HTTP',
          'NO')='YES'   then begin
          SMSServiceIdHTTPPOST.HandleRedirects := True;
      end;

      s := SMSServiceIdHTTPPOST.Post(post_http_base, post);
        //TIdURI.URLEncode(AnsiToUTF8(s)));
      ServerMainForm.WriteEvent(
            '�����: '+StringReplace
            (s,#13,#13#10, [rfReplaceAll]));
      res:=True;
      end
        else ServerMainForm.WriteEvent('������ post-�������� ��� 1!');
      end
        else ServerMainForm.WriteEvent('������ post-�������� ��� 2!');
      end
        else ServerMainForm.WriteEvent('������ post-�������� ��� 3!');
      end
        else ServerMainForm.WriteEvent('������ post-�������� ��� 4!');
    except on E:Exception do
        begin
          //if not res then
          ServerMainForm.WriteEvent(
            '������ ���������� ��������� ����� ������ HTTP POST: '+E.Message+'.');
          try
            SMSServiceIdHTTPPOST.Disconnect;
          except on E:Exception do
            ServerMainForm.WriteEvent(
            '������ ������ ���������� POST! '+E.Message);
          end;
        end;
      end;
  end;
  if not res then
    ServerMainForm.WriteEvent('Bad result POST!');
  Result:=res;
end;

function TRemoteControlForm.SendTextMessage(DEST_ID: Integer;
  MSG: string; CLIENT_PHONE: string=''; dest_mode: string='client';
  sale: Double=0; deliveTime: Integer=0): Boolean;
var res: Boolean;
begin
  if IniFile.ReadString('BUSINESS_DATA',
    '����������_���_��_��������_������',
    'NO')='YES' then
    begin
      ServerMainForm.WriteEvent('����� ����� '+FloatToStr(sale));
      if IniFile.ReadString('BUSINESS_DATA',
        '�������_POST_�������_���_SMS',
        'NO')='YES' then
        Result:=SendTextMessageWithHTTPServicePOST
          (MSG, CLIENT_PHONE, False, dest_mode, sale)
      else
        Result:=SendTextMessageWithHTTPService
          (MSG, CLIENT_PHONE, False, dest_mode, sale, deliveTime);
    end
  else if IniFile.ReadString('BUSINESS_DATA',
    '����������_���_�����_HTTP',
    'NO')='YES' then
    begin
      Result:=SendTextMessageWithHTTP(DEST_ID, MSG);
    end
  else
    begin
      if IniFile.ReadString('BUSINESS_DATA','�����_��������_����������_����������','NO')='YES' then
      begin
      if False then
        begin
          RefreshMSGTable;
          Result:=True;
        end
      else
        begin
          Result:=false;
        end;
      end
      else
        Result:=false;
    end;
end;

procedure TRemoteControlForm.Button1Click(Sender: TObject);
begin
  if SendTextMessage(StrToInt(DEST_ID.Text),MSGText.Text) then
    ServerMainForm.WriteEvent('��������� ��������� ����������!')
  else
    ServerMainForm.WriteEvent('������ �������� ���������� ���������!');
  RefreshMSGTable;
end;

function TRemoteControlForm.RefreshMSGTable: Boolean;
begin
  try
    TDMessagesADOT.Active:=False;
    TDMessagesADOT.Active:=True;
    Result:=True;
  except on E:Exception do
   begin
    ServerMainForm.WriteEvent('������ ���������� ������� ���������: '+E.Message+'.');
    Result:=False;
   end;
  end;
end;

procedure TRemoteControlForm.FormCreate(Sender: TObject);
var logSize: Integer;
begin
  CD:=GetCurrentDir;
  CurrDir:=GetCurrentDir;
  RemoteServerADOC.Connected:=False;
  RemoteServerADOC.ConnectionString:='FILE NAME='+CDP+'\RemoteControl.udl';
  if IniFile.ReadString('BUSINESS_DATA','�����_��������_����������_����������','NO')='YES' then
    begin
      ConnectToRemoteDB;
      RefreshMSGTable;
    end;

  InputJSONTestEdit.Items.LoadFromFile(
    CDP+'\input_instructions.txt');
  InputJSONTestEdit.ItemIndex:=0;
  OutputJSONTestEdit.Items.LoadFromFile(
    CDP+'\output_instructions.txt');
  OutputJSONTestEdit.ItemIndex:=0;

  MaxOrderPriority := IniFile.ReadInteger('BUSINESS_DATA',
	'���������_���������',0);
  MaxIndivOrderPriority := IniFile.ReadInteger('BUSINESS_DATA',
	'���������_���������������_������',0);
  StartWithOthersSendPriority := IniFile.ReadInteger('BUSINESS_DATA',
	'���������_���������_��������_��_���������',100);

  ServerActive:=False;

  if (IniFile.ReadString('BUSINESS_DATA',
	'��������_�_�����_���������','NO')='YES') then
  begin
	if (IniFile.ReadString('BUSINESS_DATA',
	'�������������_���������_�����_������','NO')='YES') then
    begin
      SocketCoord:=TSocketCoordinator.Create(
      IniFile.ReadInteger('BUSINESS_DATA',
	      '����_�����_�������',6030));
	    SocketCoord.Resume;
      ServerActive:=True;
      SendMsgCollection :=
		    TMessageCollection.Create();
      N5.Enabled:=False;
      
    end;
  end
  else
	begin
	  N5.Enabled:=False;
	end;

  if (IniFile.ReadInteger('BUSINESS_DATA',
	  '��������_���������_�����_������',5000)<>
    SocketCheckTimer.Interval) and not
    ((IniFile.ReadInteger('BUSINESS_DATA',
	  '��������_���������_�����_������',5000)<
    2000) and (IniFile.ReadString('BUSINESS_DATA',
	  '��_���������_�������_��������_�����','NO')='NO')) and
    not (IniFile.ReadInteger('BUSINESS_DATA',
	  '��������_���������_�����_������',5000)<1000) and
    not (IniFile.ReadInteger('BUSINESS_DATA',
	  '��������_���������_�����_������',5000)>10000) then
  begin
    SocketCheckTimer.Interval:=IniFile.
      ReadInteger('BUSINESS_DATA',
	    '��������_���������_�����_������',5000);
  end;

  if (IniFile.ReadString('BUSINESS_DATA',
	'�����_���','NO')='YES') then
  begin
  try

  logSize:=getFileSize(GetCurrentDir+'\server.log');
  writeToServerLog('������ ��� ����� '''+GetCurrentDir+
    '\server.log'''+' - '+IntToStr(logSize), False);

  AssignFile(logFile, GetCurrentDir+'\server.log');
  if FileExists(GetCurrentDir+'\server.log') then
    begin
      if logSize>1 then
      begin
          CopyFile(PAnsiChar(GetCurrentDir+'\server.log'),
            PAnsiChar(GetCurrentDir+'\logs\server'+StringReplace(
            StringReplace(DateTimeToStr(Today+Time),
              '.','_', [rfReplaceAll]),
              ':','_', [rfReplaceAll])+'.log'),True);
        Rewrite(logFile);
      end
      else
        Append(logFile);
    end
  else
    Rewrite(logFile);

  logActive:=True;

  except on E:Exception do
    writeToServerLog('������ ������������� ���-�����! '+E.Message, False);
  end;
  end;

  writeToServerLog('������ �������� � ������!');

end;

function TRemoteControlForm.getFileSize(FileName: String): Integer;
var
  FS: TFileStream;
begin
  try
    try
      FS := TFileStream.Create(Filename, fmOpenRead);
    except
      Result := -1;
    end;
    if Result <> -1 then Result := FS.Size;
    FS.Free;
  except
    Result:=-1;
  end;
end;

procedure TRemoteControlForm.writeToServerLog(log_line: string; writeToFile: Boolean=True;
  writeToMemo: Boolean=True);
begin

  if writeToMemo then
  begin
    try
      SocketLogMemo.Lines.Add(log_line);
    except on E:Exception do
    end;
  end;

  if (IniFile.ReadString('BUSINESS_DATA',
	'�����_���','NO')='YES') then
  begin
  if writeToFile and logActive then
  begin
    try
      WriteLn(logFile, log_line);
    except on E:Exception do
      try
        SocketLogMemo.Lines.Add('��������� ������ � ���� ���� �������!');
      except
      end;
    end;
  end;
  end;

end;

function TRemoteControlForm.getDriverJSONSettings(driverId: Integer): Widestring;
var res: Widestring;
begin
  res:='{"command":"sets","msg_end":"ok"}';
  try
    DriverSettingsADODS.Active:=False;
    DriverSettingsADODS.Parameters.ParamByName('driver_id').
      Value:=driverId;
    DriverSettingsADODS.Active:=True;
    if DriverSettingsADODS.RecordCount>0 then
      res:=DriverSettingsADODS.FieldByName('driver_sets').AsString;
  except on E:Exception do
    SocketLogMemo.Lines.Add(
        '������ ������� ��������'+
        ' ��������. '+E.Message);
  end;
  Result:=res;
end;

procedure TRemoteControlForm.ConnectionCheckTimerTimer(Sender: TObject);
var StateRequestResult: Integer;
    success: Boolean;
begin

  if ServerMainForm.MainBASEADOC.Connected then
  begin

  if IniFile.ReadString('BUSINESS_DATA',
  '�����������_���������','NO')='YES' then
  begin
    success:=False;
    SocketLogMemo.Lines.Add(
        '����� ���������'+
        ' ����������� ������...');
    try
      OneMinuteTaskADOSP.Parameters.Refresh;
      OneMinuteTaskADOSP.Parameters.
        ParamByName('@success').Value:=
        0;
      OneMinuteTaskADOSP.ExecProc;
      if OneMinuteTaskADOSP.Parameters.
        ParamValues['@success']=1 then
                success:=True;
    except on E:Exception do
      SocketLogMemo.Lines.Add(
        '��������� ����� ���������'+
        ' ����������� ������! '+E.Message);
    end;
  end;

  end;

end;

procedure TRemoteControlForm.ConnectToRemoteDB;
begin
  if not AutoRemoteConnectInActive then
  begin
    try
      AutoRemoteConnectInActive:=True;
      try
        RemoteServerADOC.connected:=True;
      except
        ServerMainForm.WriteEvent('������ ������� ���������� � ��������� ��!');
      end;
    finally
      AutoRemoteConnectInActive:=False;
      if RemoteServerADOC.connected then
        ServerMainForm.WriteEvent('���������� � ��������� �� �����������!')
      else
        ServerMainForm.WriteEvent('��������� ���������� � ��������� ��!');
    end;
  end;
end;

procedure TRemoteControlForm.SocketLogMemoChange(Sender: TObject);
begin
  if SocketLogMemo.Lines.Count>200 then
  begin
     try
      if IniFile.ReadString
          ('BUSINESS_DATA',
          '����������_���_�������',
          'NO')='YES' then
      SocketLogMemo.Lines.SaveToFile(
        CD+'\logs\socks_srv'+StringReplace(
            StringReplace(DateTimeToStr(Today+Time),
              '.','_', [rfReplaceAll]),
              ':','_', [rfReplaceAll])+'.log');
     except on E:Exception do
        self.writeToServerLog('������ ������ ���� ���� �������! '+E.Message);
     end;
     SocketLogMemo.Clear;
  end;
end;

procedure TRemoteControlForm.AddSocketServLog(MSG: Widestring);
begin
  SocketLogMemo.Lines.Add(MSG);
end;

procedure TRemoteControlForm.N5Click(Sender: TObject);
begin
  SocketCoord:=TSocketCoordinator.Create(
  IniFile.ReadInteger('BUSINESS_DATA',
	      '����_�����_�������',6030));
  SocketCoord.Resume;
  ServerActive:=True;
  SendMsgCollection :=
    TMessageCollection.Create();
  N5.Enabled:=False;
end;

function TRemoteControlForm.addDirectJSONMessageToClient(JSONStr: string; CurrClientID: Integer): Boolean;
var res: Boolean;
    NewMSWCollectItem: TMessageCollectionItem;
begin
  res:=True;

  NewMSWCollectItem:=SendMsgCollection.Add;
  NewMSWCollectItem.SetDirectJSONString(JSONStr);
  NewMSWCollectItem.ClientID:=CurrClientID;
  NewMSWCollectItem.GetMessage().ClientID:=
    CurrClientID;
  Result:=res;
end;

function TRemoteControlForm.orderHasAccepting(orderId: Integer;
      driverId: Integer=-1; alsoCheckDriversActivity:
      Boolean=False): Boolean;
var res: Boolean;
begin
  res:=False;
  try
    AcceptingsSelADODS.Active:=False;
    AcceptingsSelADODS.Parameters.ParamByName
      ('order_id').Value:=orderId;
    AcceptingsSelADODS.Parameters.ParamByName
      ('driver_id').Value:=driverId;
    AcceptingsSelADODS.Parameters.ParamByName
      ('driver_id2').Value:=driverId;
    AcceptingsSelADODS.Active:=True;

    SocketLogMemo.Lines.Add(
      '������ �� ������������ '+
      IntToStr(AcceptingsSelADODS.RecordCount));

    if AcceptingsSelADODS.RecordCount>0 then
      res:=True;
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '������ ������� '+
      '���������� ������'+
      ' ����������  � �������!!! '+E.Message);
  end;
  Result:=res;
end;

procedure TRemoteControlForm.ManualSetCurrOrderRemoteStatus(orderId,
  destStatus: Integer);
var count: Integer;
begin
      try
        ManualSetOrdRemStatADOSP.Parameters.Refresh;
        ManualSetOrdRemStatADOSP.Parameters.
          ParamByName('@order_id').Value:=orderId;
		    ManualSetOrdRemStatADOSP.Parameters.
          ParamByName('@dest_status').Value:=destStatus;
		    ManualSetOrdRemStatADOSP.Parameters.
                ParamByName('@count').Value:=0;
        ManualSetOrdRemStatADOSP.ExecProc;
		    count:=ManualSetOrdRemStatADOSP.Parameters.
                ParamByName('@count').Value;
		  if (count<1) then
			  SocketLogMemo.Lines.Add('�������� �� ���������!!! '+
          '�� ������� ������ � ���������� ��������!');
      except on E: Exception do
      end;
end;

//procedure TRemoteControlForm.synchroDBAndThreadsStatuses;
//var i: Integer;
//begin
//end;

function TRemoteControlForm.AutoSetOrderStatus(orderID, orderStatus: Integer;
  order_start_time, order_ended_time,
  last_status_time: TDateTime; rSync: Integer): Boolean;
var res: Boolean;
    autoDrSetCounter, count, destStat: Integer;
begin
  res:=False;
  case orderStatus of
    ORDER_INDIVID_TAKE,ORDER_SECTOR_PUBLISHING,
    ORDER_ALL_PUBLISHING,ORDER_PUBLUSHED_WAIT,
    ORDER_IS_OCCUPED,ORDER_OCCUPED_DENY:
      begin
        //������� � ������� ������
        if IniFile.ReadString
          ('BUSINESS_DATA',
          '���������_���������_��_�������_��_������',
          'NO')='YES' then
        begin
          autoDrSetCounter:=IniFile.ReadInteger
          ('BUSINESS_DATA',
          '�����_��������_��_����������_��_�������',
          60000);

          if SecondsBetween(last_status_time,
            (Today+Time))>autoDrSetCounter then
          begin

            //SocketLogMemo.Lines.Add(
            //      '������� �������������� '+
            //      '�������� �� ������������...');

            try
              //if Self.orderHasAccepting(orderId)  then
              //begin

                //SocketLogMemo.Lines.Add(
                //  '������� �������������� '+
                //  '�������� �� ������������...');

                AutoSetDriverADOSP.
                Parameters.Refresh;
                AutoSetDriverADOSP.Parameters.
                  ParamByName('@order_id').Value:=
                  orderID;
                AutoSetDriverADOSP.Parameters.
                  ParamByName('@delta_time_param').Value:=
                  autoDrSetCounter;
                AutoSetDriverADOSP.Parameters.
                  ParamByName('@count').Value:=
                  0;
                if IniFile.ReadString
                  ('BUSINESS_DATA',
                  '����_������������_��_�������_�������',
                  'YES')='YES' then
                AutoSetDriverADOSP.Parameters.
                  ParamByName('@sort_with_accept').Value:=1
                else
                  AutoSetDriverADOSP.Parameters.
                  ParamByName('@sort_with_accept').Value:=0;
                if IniFile.ReadString
                  ('BUSINESS_DATA',
                  '������_��_�������_�������',
                  'YES')='YES' then
                AutoSetDriverADOSP.Parameters.
                  ParamByName('@manual_before').Value:=1
                else
                  AutoSetDriverADOSP.Parameters.
                  ParamByName('@manual_before').Value:=0;
                AutoSetDriverADOSP.ExecProc;
                count:=AutoSetDriverADOSP.Parameters.
                  ParamValues['@count'];
                if (count>0) then
                begin
                  res:=True;
                  SocketLogMemo.Lines.Add(
                  '��������� �������������� '+
                  '�������� �� ������������!');
                end
                else
                begin
                  //SocketLogMemo.Lines.Add(
                  //'�� ��������� �������������� '+
                  //'�������� �� ������������ '+
                  //'(������ �������� ��� ������ �� �������)!');
                end;
              //end;
            except on E:Exception do
                //SetDriverOnLineADOSP.Active:=False;
                SocketLogMemo.Lines.Add(
                  '������ ��������� �������������� '+
                  '�������� �� ������������! '+E.Message);
            end;
          end;

        end;

        //������� � ������� ������
        if (IniFile.ReadString('BUSINESS_DATA',
          '���������_������_������_���_���������_�������',
          'NO')='YES') and (orderStatus>3) then
        begin
          autoDrSetCounter:=IniFile.ReadInteger
          ('BUSINESS_DATA',
          '�����_��������_�������_��������',
          60000); 

          if SecondsBetween(last_status_time,
            (Today+Time))>autoDrSetCounter then
          begin
            try
              if not Self.orderHasAccepting(orderId) then
              begin
                SocketLogMemo.Lines.Add(
                  '������� ���������� ������� ������...');

                if setOrderRemoteStatus(orderId,
                  ORDER_SECTOR_PUBLISHING, -1) then
                begin
                  res:=True;
                  SocketLogMemo.Lines.Add(
                  '�������� ��������� ������ ��� '+
                  '������!');
                end
                else
                begin
                  SocketLogMemo.Lines.Add(
                  '�� �������� ��������� ������ ��� '+
                  '������ '+
                  '(������ �������� ��� ������ �� �������)!');
                end;
              end;
            except on E:Exception do
                //SetDriverOnLineADOSP.Active:=False;
                SocketLogMemo.Lines.Add(
                  '������ ��������� ��������� ������ ��� '+
                  '������!');
            end;

          end;

        end;

      end;
    ORDER_OCCUPED_ALLOW, ORDER_ALLOW_ASK_WAIT:
      begin
        //������� � ������� ������
        if IniFile.ReadString
          ('BUSINESS_DATA',
          '��������_����_�������_���_��������_������',
          'NO')='YES' then
        begin
          autoDrSetCounter:=IniFile.ReadInteger
          ('BUSINESS_DATA',
          '�����_��������_�������_���_��������_������',
          60000);
          if SecondsBetween(last_status_time,
            (Today+Time))>autoDrSetCounter then
          begin
            try
              if Self.orderHasAccepting(orderId)  then
              begin
                SocketLogMemo.Lines.Add(
                  '������� ����. ����. ����������� ������...');
                if setOrderRemoteStatus(orderId,
                  ORDER_OCCUPED_DENY) then
                begin
                  res:=True;
                  SocketLogMemo.Lines.Add(
                  '��������� ����. ����. ����������� '+
                  '������!');
                end
                else
                begin
                  SocketLogMemo.Lines.Add(
                  '�� ��������� ����. ����. ����������� '+
                  '������ '+
                  '(������ �������� ��� ������ �� �������)!');
                end;
              end;
            except on E:Exception do
                //SetDriverOnLineADOSP.Active:=False;
                SocketLogMemo.Lines.Add(
                  '������ ��������� ����. ����. ����������� '+
                  '������!');
            end;

          end;

        end;

        //������� � ������� ������
        if IniFile.ReadString
          ('BUSINESS_DATA',
          '���������_������_������_���_���������_�������',
          'NO')='YES' then
        begin
          autoDrSetCounter:=IniFile.ReadInteger
          ('BUSINESS_DATA',
          '�����_��������_�������_��������',
          60000);

          if SecondsBetween(last_status_time,
            (Today+Time))>autoDrSetCounter then
          begin
            try
              if not Self.orderHasAccepting(orderId)  then
              begin
                SocketLogMemo.Lines.Add(
                  '������� ���������� ������� ������...');

                if setOrderRemoteStatus(orderId,
                  ORDER_SECTOR_PUBLISHING, -1) then
                begin
                  res:=True;
                  SocketLogMemo.Lines.Add(
                  '�������� ��������� ������ ��� '+
                  '������!');
                end
                else
                begin
                  SocketLogMemo.Lines.Add(
                  '�� �������� ��������� ������ ��� '+
                  '������ '+
                  '(������ �������� ��� ������ �� �������)!');
                end;
              end;
            except on E:Exception do
                //SetDriverOnLineADOSP.Active:=False;
                SocketLogMemo.Lines.Add(
                  '������ ��������� ��������� ������ ��� '+
                  '������!');
            end;

          end;

        end;

      end;
    ORDER_BUSY:
      begin
        //������� � ������� ������
        if (IniFile.ReadString
          ('BUSINESS_DATA',
          '��������_����_�������_���_��������_������',
          'NO')='YES') and (IniFile.ReadString
          ('BUSINESS_DATA',
          '��������_�������_������_���_���_���������',
          'NO')='YES') and (rSync=1) then
        begin
          autoDrSetCounter:=IniFile.ReadInteger
          ('BUSINESS_DATA',
          '�����_��������_�������_���_��������_������',
          60000);
          if SecondsBetween(last_status_time,
            (Today+Time))>autoDrSetCounter then
          begin
            try
              if Self.orderHasAccepting(orderId)  then
              begin
                SocketLogMemo.Lines.Add(
                  '������� ����. ����. ����������� ������...');
                if setOrderRemoteStatus(orderId,
                  ORDER_OCCUPED_DENY) then
                begin
                  res:=True;
                  SocketLogMemo.Lines.Add(
                  '��������� ����. ����. ����������� '+
                  '������!');
                end
                else
                begin
                  SocketLogMemo.Lines.Add(
                  '�� ��������� ����. ����. ����������� '+
                  '������ '+
                  '(������ �������� ��� ������ �� �������)!');
                end;
              end;
            except on E:Exception do
                //SetDriverOnLineADOSP.Active:=False;
                SocketLogMemo.Lines.Add(
                  '������ ��������� ����. ����. ����������� '+
                  '������!');
            end;

          end;

        end;

        //������� � ������� ������
        if (IniFile.ReadString
          ('BUSINESS_DATA',
          '���������_������_������_���_���������_�������',
          'NO')='YES') and (IniFile.ReadString
          ('BUSINESS_DATA',
          '��������_�������_������_���_���_���������',
          'NO')='YES') and (rSync=1) then
        begin
          autoDrSetCounter:=IniFile.ReadInteger
          ('BUSINESS_DATA',
          '�����_��������_�������_��������',
          60000);

          if SecondsBetween(last_status_time,
            (Today+Time))>autoDrSetCounter then
          begin
            try
              if not Self.orderHasAccepting(orderId)  then
              begin
                SocketLogMemo.Lines.Add(
                  '������� ���������� ������� ������...');

                destStat:=ORDER_SECTOR_PUBLISHING;
                if IniFile.ReadString
                  ('BUSINESS_DATA',
                  '�����_��_�������_������_���_����_�������',
                  'NO')='YES' then
                destStat:=0;

                if setOrderRemoteStatus(orderId,
                  destStat, -1) then
                begin
                  res:=True;
                  SocketLogMemo.Lines.Add(
                  '�������� ��������� ������ ��� '+
                  '������!');
                end
                else
                begin
                  SocketLogMemo.Lines.Add(
                  '�� �������� ��������� ������ ��� '+
                  '������ '+
                  '(������ �������� ��� ������ �� �������)!');
                end;
              end;
            except on E:Exception do
                //SetDriverOnLineADOSP.Active:=False;
                SocketLogMemo.Lines.Add(
                  '������ ��������� ��������� ������ ��� '+
                  '������!');
            end;

          end;

        end;

      end;
    ORDER_ONHAND_ALLOW, ORDER_ONHAND_ALLOW_ASK_WAIT:
    begin
      if IniFile.ReadString
          ('BUSINESS_DATA',
          '�������_��_�����_�����_�_����',
          'NO')='YES' then
        begin
          autoDrSetCounter:=IniFile.ReadInteger
          ('BUSINESS_DATA',
          '�����_��������_���������_�_����',
          60000);

          if SecondsBetween(last_status_time,
            (Today+Time))>autoDrSetCounter then
          begin

            SocketLogMemo.Lines.Add(
            '������� ������ ��������� � ����...');

            try
                if setOrderRemoteStatus(orderId,
                  ORDER_ONHAND_ALLOW_USER_WAIT) then
                begin
                  res:=True;
                  SocketLogMemo.Lines.Add(
                  '�������� ����� �������� � ���� '+
                  '������!');
                end
                else
                begin
                  SocketLogMemo.Lines.Add(
                  '�� �������� ����� �������� � ���� '+
                  '������ '+
                  '(������ �������� ��� ������ �� �������)!');
                end;
            except on E:Exception do
                //SetDriverOnLineADOSP.Active:=False;
                SocketLogMemo.Lines.Add(
                  '������ ��������� ������ �������� � ���� '+
                  '������!');
            end;

          end;

        end;
    end;
    ORDER_DISP_CANCEL, ORDER_DISP_CANCEL_ASK_WAIT, ORDER_DRV_CANCEL:
    begin
      if IniFile.ReadString
          ('BUSINESS_DATA',
          '���������_������_���_����������_�������������',
          'NO')='YES' then
        begin
          autoDrSetCounter:=IniFile.ReadInteger
          ('BUSINESS_DATA',
          '�����_����������_������',
          60000);

          if SecondsBetween(last_status_time,
            (Today+Time))>autoDrSetCounter then
          begin

            SocketLogMemo.Lines.Add(
            '������� ���������� ������...');

            try

                SetOrderEmptyDriverADOC.Parameters.
                  ParamByName('order_id').Value:=
                    orderId;
                SetOrderEmptyDriverADOC.Execute;

                res:=True;
                SocketLogMemo.Lines.Add(
                  '�������� ��������� ������ '+
                  '������!');

            except on E:Exception do
                //SetDriverOnLineADOSP.Active:=False;
                SocketLogMemo.Lines.Add(
                  '������ ���������� ������ '+
                  '������!'+E.Message);
            end;

          end;

        end;
    end;
    //ORDER_DRV_COMPLETE, ORDER_COMLETE_ALLOW,
    //ORDER_DISP_CANCEL_DR_INCOURSE,
    ORDER_COMPLETE_ALLOW_USER_WAIT:
      begin

        if IniFile.ReadString
          ('BUSINESS_DATA',
          '�������������_���������_������',
          'NO')='YES' then
        begin
          autoDrSetCounter:=IniFile.ReadInteger
          ('BUSINESS_DATA',
          '�����_��������_��_��������_������',
          60000);

          if SecondsBetween(last_status_time,
            (Today+Time))>autoDrSetCounter then
          begin

            SocketLogMemo.Lines.Add(
                  '������� ����������������� ������...');

            try

                ManualSetCurrOrderRemoteStatus
                (orderID, ORDER_CLOSE);

            except on E:Exception do
                //SetDriverOnLineADOSP.Active:=False;
                SocketLogMemo.Lines.Add(
                  '������ ��������� ����������������� '+
                  '������!');
            end;

          end;

        end;

      end;

      ORDER_ONHAND_ALLOW_USER_WAIT :
      begin

        if IniFile.ReadString
          ('BUSINESS_DATA',
          '������������_��������_�_����',
          'NO')='YES' then
        begin
          autoDrSetCounter:=IniFile.ReadInteger
          ('BUSINESS_DATA',
          '�����_��������_��������_�_����',
          60000);

          if SecondsBetween(last_status_time,
            (Today+Time))>autoDrSetCounter then
          begin

            SocketLogMemo.Lines.Add(
                  '������� ����������� ������������� � ����...');

            try

                ManualSetCurrOrderRemoteStatus
                (orderID, ORDER_BUSY);

            except on E:Exception do
                //SetDriverOnLineADOSP.Active:=False;
                SocketLogMemo.Lines.Add(
                  '������ ��������� ����������� ������������� � ���� '+
                  '������!');
            end;

          end;

        end;

      end;

    else
      begin
      end;
  end;
  Result:=res;
end;

function TRemoteControlForm.setDriverSyncStatus(driver_id, status:
      Integer) : Boolean;
var res: Boolean;
    count: Integer;
begin
  count:=0;
  res:=False;
            try
              SetDrSyncStatusADOSP.Parameters.Refresh;
              SetDrSyncStatusADOSP.Parameters.
                ParamByName('@status').Value:=
                status;
              SetDrSyncStatusADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                driver_id;
              SetDrSyncStatusADOSP.Parameters.
                ParamByName('@count').Value:=0;
              SetDrSyncStatusADOSP.ExecProc;
              count:=SetDrSyncStatusADOSP.Parameters.
                ParamValues['@count'];
              //SocketLogMemo.Lines.Add('������� ��������� - '+IntToStr(count));
              if (count>0) then
              begin
                res:=True;
              end
              else
              begin
              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ����� ���������'+
                ' ���. ������� ������������� ��������! '+E.Message);
            end;
  Result:=res;
end;

function TRemoteControlForm.setDriverRemoteStatus(driver_id, status:
      Integer; check_busy: Integer=-1; on_launch: Integer=-1;
      on_line: Integer=-1; sync: Integer=-1) : Boolean;
var res: Boolean;
    count: Integer;
begin
  count:=0;
  res:=False;
            try
              SetDrRemStatusADOSP.Parameters.Refresh;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@status').Value:=
                status;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@check_busy').
                Value:=check_busy;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@on_launch').
                Value:=on_launch;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@on_line').
                Value:=on_line;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@sync').
                Value:=sync;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                driver_id;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@count').Value:=0;
              SetDrRemStatusADOSP.ExecProc;
              count:=SetDrRemStatusADOSP.Parameters.
                ParamValues['@count'];
              //SocketLogMemo.Lines.Add('������� ��������� - '+IntToStr(count));
              if (count>0) then
              begin
                res:=True;
              end
              else
              begin
              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ����� ���������'+
                ' ���. ������� ��������! '+E.Message);
            end;
  Result:=res;
end;

function TRemoteControlForm.AutoSetDriverStatus(driverID, driverStatus: Integer;
      last_status_time: TDateTime; syncStatus: Integer): Boolean;
var res: Boolean;
    autoSetCounter: Integer;
begin
  res:=False;

  if SyncStatus=2 then
        begin

          if (IniFile.ReadString
          ('BUSINESS_DATA',
          '����������_��������������_������_���',
          'NO')='YES') and
          (SocketCoord.GetClientItemIndexByDrId
          (driverID)>=0) then
          begin
            autoSetCounter:=IniFile.ReadInteger
            ('BUSINESS_DATA',
            '�����_��������_������_�������_���',
            60000);

            if SecondsBetween(last_status_time,
              (Today+Time))>autoSetCounter then
            begin

              SocketLogMemo.Lines.Add(
                  '������� ��������� �������� ��������� ��������� ����������...');

              if self.setDriverSyncStatus
                (driverID, 1) then
                begin
                  res:=True;
                end
              else
                SocketLogMemo.Lines.Add(
                  '��������� ������� ��������� �������� ��������� ��������� ����������...');

             end;

        end;
  end;

  if (SocketCoord.GetClientItemIndexByDrId(driverID)<0) and
    (driverStatus<>DR_ERROR_CL_SOCKET) and not res then
  begin
    if Self.setDriverRemoteStatus(driverID,
          DR_ERROR_CL_SOCKET, -1, -1, -1, -1) then
          begin
            //SocketLogMemo.Lines.Add(
            //    '��������� ������� ���������� ����� � ��! �� '+
            //    IntToStr(driverID));
            res:=True;
          end
          else
            SocketLogMemo.Lines.Add(
                '��������� ��������� ������� ���������� ����� � ��! �� '+
                IntToStr(driverID));
  end;
  Result:=res;
end;

procedure TRemoteControlForm.incrementOrderPriorStat(orderId, MaxOrderPriority: Integer);
begin
      try

        IncOrdersPriorityADOSP.
          Parameters.Refresh;
        IncOrdersPriorityADOSP.
          Parameters.
        ParamByName('@max_priority').Value:=
          MaxOrderPriority;
        //IncOrdersPriorityADOSP.
        //  Parameters.
        //ParamByName('@order_id').Value:=
        //  orderId;
        IncOrdersPriorityADOSP.ExecProc;

      except on Ex:Exception do
        SocketLogMemo.Lines.Add
        ('������ ���������� ������������� ���������� ������!'+
          Ex.Message);
      end;
end;

procedure TRemoteControlForm.setOrderTarif(orderId, tarifId: Integer);
begin
  try
    SetTarifADOC.Parameters.ParamByName('order_id').Value:=
        orderId;
    SetTarifADOC.Parameters.ParamByName('tarif_id').Value:=
        tarifId;
    SetTarifADOC.Execute;
  except on Ex:Exception do
        SocketLogMemo.Lines.Add
        ('������ ��������� ������ ������!'+
          Ex.Message);
  end;
end;

procedure TRemoteControlForm.setOrderOptComb(orderId: Integer; optComb: String);
begin
  try
    SetOptCombADOC.Parameters.ParamByName('order_id').Value:=
        orderId;
    SetOptCombADOC.Parameters.ParamByName('opts_comb').Value:=
        optComb;
    SetOptCombADOC.Execute;
  except on Ex:Exception do
        SocketLogMemo.Lines.Add
        ('������ ��������� ����� ������!'+
          Ex.Message);
  end;
end;

function TRemoteControlForm.getSectorsStatus: WideString;
begin
  if self.ReloadDrSettings then
    Result:=SettingsADODS.FieldByName
      ('sectors_wbroadcast').AsString
  else
    Result:='{"command":"err_op","msg_end":"ok"}';
end;

procedure TRemoteControlForm.resetSectorBroadcast;
begin
  try
    ResetSectBroadcastADOC.Execute;
  except
  end;
end;

procedure TRemoteControlForm.resetOrdersBroadcast;
begin
  try
    ResetOrdBroadcastADOC.Execute;
  except
  end;
end;

procedure TRemoteControlForm.decrementDriversOrderPriority;
begin
  try
    DecrementOrdersPriorityADOSP.Parameters.Refresh;
    DecrementOrdersPriorityADOSP.Parameters.
      ParamByName('@reset_has_broad').Value:=1;
    DecrementOrdersPriorityADOSP.ExecProc;
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '��������� ����� ���������'+
      ' ���������� ����������� ������� ���������! '+E.Message);
  end;
end;

function TRemoteControlForm.checkRemoteDrivers: Boolean;
var res: Boolean;
    DriverStatus, SyncStatus, GPSRequStatus: Integer;
    CurrClientID, ClientCollectionIndex, manual_day_sale: Integer;
begin

  if sectorWideBroadcastCounter>=0 then
  sectorWideBroadcastCounter:=
    sectorWideBroadcastCounter-1;
  if orderWideBroadcastCounter>=0 then
  orderWideBroadcastCounter:=
    orderWideBroadcastCounter-1;
  if self.ReloadDrSettings then
  begin

    if IniFile.ReadString
      ('BUSINESS_DATA',
      '�����_������_�������_��������',
      'NO')='YES' then
      if (SettingsADODS.FieldByName
        ('use_sect_wbroadcast').AsInteger=1) and
        (SettingsADODS.FieldByName
        ('has_sect_wbroadcast').AsInteger=1) then
        begin
          if sectorWideBroadcastCounter<=0 then
          begin
            sectorWideBroadcastCounter:=
              IniFile.ReadInteger
                ('BUSINESS_DATA',
                '��������_���������_��������',
                5);
            MessageWideBroadcasting(
            SettingsADODS.FieldByName
              ('sectors_wbroadcast').AsString);
            resetSectorBroadcast;
          end;
        end;

    if IniFile.ReadString
      ('BUSINESS_DATA',
      '��������������_�������_������',
      'NO')='YES' then
      if (SettingsADODS.FieldByName
        ('use_ford_wbroadcast').AsInteger=1) and
        (SettingsADODS.FieldByName
        ('has_ford_wbroadcast').AsInteger=1) then
        begin
          if orderWideBroadcastCounter<=0 then
          begin
            orderWideBroadcastCounter:=
              IniFile.ReadInteger
                ('BUSINESS_DATA',
                '��������_��������������_�������',
                2);
                if ( SettingsADODS.FieldByName
                ('use_fordbroadcast_priority').AsInteger=1) then
                begin
                    SocketLogMemo.Lines.Add(
                  '������������ ������� ������ � �������!');
                    MessageDriverOrderBroadcasting;
                end
                else
                begin
                    MessageWideBroadcasting(
                      SettingsADODS.FieldByName
                        ('forders_wbroadcast').AsString);
                    resetOrdersBroadcast;
                end;

          end;
        end;

  end;

  DriversADOT.Active:=False;
  try
    DriversADOT.Active:=True;
    if DriversADOT.RecordCount>0 then
    begin
      DriversADOT.First;
      while(not DriversADOT.Eof) do
      begin
        DriverStatus := DriversADOT.
          FieldByName('REMOTE_STATUS').AsInteger;

        SyncStatus := DriversADOT.
          FieldByName('SYNC_STATUS').AsInteger;

        GPSRequStatus := DriversADOT.
          FieldByName('GPSC_REQU_FLAG').AsInteger;

        manual_day_sale := DriversADOT.
          FieldByName('manual_day_sale').AsInteger;

        if AutoSetDriverStatus( DriversADOT.
          FieldByName('BOLD_ID').AsInteger,
          DriverStatus, DriversADOT.
          FieldByName('LAST_STATUS_TIME').AsDateTime,
          SyncStatus) then
        begin
          DriversADOT.Next;
          Continue;
        end;

        if (DriversADOT.
          FieldByName('daily_paym_status').AsInteger=PAY_REQU) then
        begin
            try

                ClientCollectionIndex:=SocketCoord.
                  GetClientItemIndexByDrNum(
                  DriversADOT.
                  FieldByName('Pozyvnoi').AsInteger);

                if (ClientCollectionIndex<0) then
                begin

                  SocketLogMemo.Lines.Add(
                    '�� ������� ������� ���� ��� ��������� '+
                    '�������� ������� ������ ��� �������� � �������� '+
                    IntToStr(DriversADOT.
                    FieldByName('Pozyvnoi').AsInteger));

                end
                else
                begin

                CurrClientID:=SocketCoord.TCPClientCollection.
                  Items[ClientCollectionIndex].ClientID;

                addDirectJSONMessageToClient(
                  '{"command":"dpay_req","txt":"'+
                  DriversADOT.FieldByName('paym_check_date').AsString+
                  '","msg_end":"ok"}', CurrClientID);

                SetDrPaymentStatusADOC.Parameters.
                  ParamByName('dpstat').Value:=PAY_REQU_SEND;
                SetDrPaymentStatusADOC.Parameters.
                  ParamByName('driver_id').Value:=DriversADOT.
                  FieldByName('BOLD_ID').AsInteger;
                SetDrPaymentStatusADOC.Execute;

                end;
          except on E: Exception do
            SocketLogMemo.Lines.Add(
                    '������ ��������� ������� ������� '+
                    '������ ��� �������� � �������� '+
                    IntToStr(DriversADOT.
                    FieldByName('Pozyvnoi').AsInteger)+' '+
                    E.Message);
          end;
        end;

        if GPSRequStatus=1 then
        begin
          try

                ClientCollectionIndex:=SocketCoord.
                  GetClientItemIndexByDrNum(
                  DriversADOT.
                  FieldByName('Pozyvnoi').AsInteger);

                if (ClientCollectionIndex<0) then
                begin

                  SocketLogMemo.Lines.Add(
                    '�� ������� ������� ���� ��� ��������� '+
                    '�������� ������� ������������ ��� �������� � �������� '+
                    IntToStr(DriversADOT.
                    FieldByName('Pozyvnoi').AsInteger));

                end
                else
                begin

                CurrClientID:=SocketCoord.TCPClientCollection.
                  Items[ClientCollectionIndex].ClientID;

                addDirectJSONMessageToClient(
                  '{"command":"gpsc_requ","msg_end":"ok"}', CurrClientID);

                SetDrGPSRequStatusADOC.Parameters.
                  ParamByName('status').Value:=0;
                SetDrGPSRequStatusADOC.Parameters.
                  ParamByName('driver_id').Value:=DriversADOT.
                  FieldByName('BOLD_ID').AsInteger;
                SetDrGPSRequStatusADOC.Execute;

                end;
          except on E: Exception do
            SocketLogMemo.Lines.Add(
                    '������ ��������� ������� ������� '+
                    'GPS-��������� ��� �������� � �������� '+
                    IntToStr(DriversADOT.
                    FieldByName('Pozyvnoi').AsInteger));
          end;
        end;

        if SyncStatus=1 then
        begin
          //SocketLogMemo.Lines.Add('----');
          if self.setDriverSyncStatus(DriversADOT.
          FieldByName('BOLD_ID').AsInteger, 0) then
          begin

            ClientCollectionIndex:=SocketCoord.
                  GetClientItemIndexByDrNum(
                  DriversADOT.
                  FieldByName('Pozyvnoi').AsInteger);

                if (ClientCollectionIndex<0) then
                begin

                  SocketLogMemo.Lines.Add(
                    '�� ������� ������� ���� ��� ��������� '+
                    '�������� ������� ������� ��� �������� � �������� '+
                    IntToStr(DriversADOT.
                    FieldByName('Pozyvnoi').AsInteger));

                end
                else
                begin

                CurrClientID:=SocketCoord.TCPClientCollection.
                  Items[ClientCollectionIndex].ClientID;

                if SocketCoord.TCPClientCollection.
                    Items[ClientCollectionIndex].useUTF8 then
                  addDirectJSONMessageToClient(
                  Self.getDriverStatusJSON
                    (DriversADOT.FieldByName('BOLD_ID').
                    AsInteger), CurrClientID)
                else
                  addDirectJSONMessageToClient(
                  TranslitRus2Lat(Self.getDriverStatusJSON
                    (DriversADOT.FieldByName('BOLD_ID').
                    AsInteger), False), CurrClientID);

                if SocketCoord.TCPClientCollection.
                    Items[ClientCollectionIndex].useUTF8 then
                  addDirectJSONMessageToClient(
                  Self.GetJSONEarlyOrdersList
                    (DriversADOT.FieldByName('BOLD_ID').
                    AsInteger), CurrClientID)
                else
                  addDirectJSONMessageToClient(
                  TranslitRus2Lat(Self.GetJSONEarlyOrdersList
                    (DriversADOT.FieldByName('BOLD_ID').
                    AsInteger), False), CurrClientID);

                end;



                DriversADOT.Next;
                Continue;
          end;

        end;

        case DriverStatus of
          0:
            begin
            end;
		  DR_ON_REST:
			begin
        if Self.setDriverRemoteStatus(DriversADOT.
          FieldByName('BOLD_ID').AsInteger,
          DR_NOACTIVE_STATUS, 1, 1, -1, 1) then
        begin

          ClientCollectionIndex:=SocketCoord.
                  GetClientItemIndexByDrNum(
                  DriversADOT.
                  FieldByName('Pozyvnoi').AsInteger);

                //if IniFile.ReadString
                //  ('BUSINESS_DATA',
                //  '��������_�������������_��������������',
                //  'NO')='YES' then
                if (ClientCollectionIndex<0) then
                begin

                  SocketLogMemo.Lines.Add(
                    '�� ������� ������� ���� ��� ��������� '+
                    '��������� ������ ��� �������� � �������� '+
                    IntToStr(DriversADOT.
                    FieldByName('Pozyvnoi').AsInteger));

                end
                else
                begin

                CurrClientID:=SocketCoord.TCPClientCollection.
                  Items[ClientCollectionIndex].ClientID;

                addDirectJSONMessageToClient(
                '{"command":"go_on_rest"'+
                ',"client_id":"'+IntToStr(CurrClientID)+
                '","msg_end":"ok"}', CurrClientID);
                end;

        end
        else
          SocketLogMemo.Lines.Add(
                    '��������� ��������� '+
                    '��������� �� ������� ��� �������� � �������� '+
                    IntToStr(DriversADOT.
                    FieldByName('Pozyvnoi').AsInteger));
			end;
      DR_FROM_REST_ATTEMPT:
      begin
        if Self.setDriverRemoteStatus(DriversADOT.
          FieldByName('BOLD_ID').AsInteger,
          DR_NOACTIVE_STATUS, 1, 0, -1, 1) then
        begin

          ClientCollectionIndex:=SocketCoord.
                  GetClientItemIndexByDrNum(
                  DriversADOT.
                  FieldByName('Pozyvnoi').AsInteger);

                //if IniFile.ReadString
                //  ('BUSINESS_DATA',
                //  '��������_�������������_��������������',
                //  'NO')='YES' then
                if (ClientCollectionIndex<0) then
                begin

                  SocketLogMemo.Lines.Add(
                    '�� ������� ������� ���� ��� ��������� '+
                    '��������� ������ ��� �������� � �������� '+
                    IntToStr(DriversADOT.
                    FieldByName('Pozyvnoi').AsInteger));

                end
                else
                begin

                CurrClientID:=SocketCoord.TCPClientCollection.
                  Items[ClientCollectionIndex].ClientID;

                addDirectJSONMessageToClient(
                '{"command":"go_from_rest"'+
                ',"client_id":"'+IntToStr(CurrClientID)+
                '","msg_end":"ok"}', CurrClientID);
                end;

        end
        else
          SocketLogMemo.Lines.Add(
                    '��������� ��������� '+
                    '��������� � �������� ��� �������� � �������� '+
                    IntToStr(DriversADOT.
                    FieldByName('Pozyvnoi').AsInteger));
      end;
		  DR_OUT_FROM_LINE:
			begin
			end;
		  DR_ON_REST_DENY:
			begin
			end;
		  DR_OUT_FROM_LINE_DENY:
			begin
			end;
		  DR_IN_WORKING_ONHAND_DENY:
			begin
			end;
          else
            begin
            end;
        end;

        DriversADOT.Next;
      end;
    end;
  except on E:Exception do
    SocketLogMemo.Lines.Add('��������� ���������� ��������� '+
    '�������� ���������! '+E.Message);
  end;
end;

procedure TRemoteControlForm.MessageWideBroadcasting(Msg: Widestring);
var i: Integer;
begin
  SocketLogMemo.Lines.Add('�������� �������� ��������...');
  if SocketCoord.TCPClientCollection.Count>0 then
    begin
      for i:=0 to SocketCoord.TCPClientCollection.Count-1 do
        addDirectJSONMessageToClient(
                  Msg, SocketCoord.TCPClientCollection.
                  Items[i].ClientId);
    end;
end;

function TRemoteControlForm.getDriverOrdBroadcasting(DriverId: Integer): Widestring;
var hasDriver: Boolean;
    driverOrders: Widestring;
begin
  hasDriver:=False;
  driverOrders:='';

  try

  if PriorityDriversADODS.Active then
  begin
    if PriorityDriversADODS.RecordCount>0 then
    begin
      PriorityDriversADODS.First;
      while not PriorityDriversADODS.Eof do
      begin
        if PriorityDriversADODS.FieldByName('BOLD_ID').
            AsInteger = DriverId then
        begin
          hasDriver:=True;
          driverOrders:=PriorityDriversADODS.
            FieldByName('forders_wbroadcast').AsVariant;
          Break;
        end;
        PriorityDriversADODS.Next;
      end;
    end;
  end;

  except on E:Exception do
  begin
    SocketLogMemo.Lines.Add('������ ��������� ������������ �������� ��� ���������� ��������!'+E.Message);
  end;
  end;

  Result:=driverOrders;
end;

procedure TRemoteControlForm.MessageDriverOrderBroadcasting;
var i: Integer;
    prioritySucc: Boolean;
    driverOrders: Widestring;
begin

  prioritySucc:=False;
  try
    PriorityDriversADODS.Active:=False;
    PriorityDriversADODS.Active:=True;
    prioritySucc:=True;
  except on E:Exception do
  begin
    SocketLogMemo.Lines.Add('������ ��������� ������ ������������ �������� ���������!'+E.Message);
  end;
  end;

  try

  if prioritySucc then
  begin
  SocketLogMemo.Lines.Add('�������� �������� �������� c �����������...');
  if SocketCoord.TCPClientCollection.Count>0 then
    begin
      for i:=0 to SocketCoord.TCPClientCollection.Count-1 do
      begin
        driverOrders:=getDriverOrdBroadcasting(SocketCoord.
            TCPClientCollection.Items[i].DriverDBID);
        if driverOrders<>'' then
        begin
            //SocketLogMemo.Lines.Add('['+driverOrders+'] :'+
            //IntToStr(SocketCoord.TCPClientCollection.Items[i].Pozyvnoi));
            addDirectJSONMessageToClient(
                  driverOrders,
                  SocketCoord.TCPClientCollection.
                  Items[i].ClientId);
        end
        else
        begin
          SocketLogMemo.Lines.Add('������ ������ ��������� ��� '+
            IntToStr(SocketCoord.TCPClientCollection.Items[i].Pozyvnoi));
        end;
      end;
    end;

  end;

  except on E:Exception do
  begin
    SocketLogMemo.Lines.Add('������ ������������ �������� ��������� ��� ���������!'+E.Message);
  end;
  end;

  decrementDriversOrderPriority;
end;

function TRemoteControlForm.localRebuildSendMsgCollection: Boolean;
var i, OrderStatus, CurrClientID: Integer;
    CurrDriverSectorID, CurrOrderID: Integer;
    CurrOrderPriorityCounter: Integer;
    ClientCollectionIndex, REMOTE_DRNUM: Integer;
    OrderData, manual_param: String;
    res: Boolean;
begin

res:=False;

  if localRebuildSendMsgInProcess or
    inputMessagesInProcess then
  begin
    SocketLogMemo.Lines.Add
    ('localRebuildSendMsgInProcess or inputMessagesInProcess!!!');
  end
  else
  begin
    localRebuildSendMsgInProcess:=True;
  try
  //ServerMainForm.ResetSelfAskRemoteAttr;
  HasRemoteDataChanges:=False;
  ServerMainForm.MainSB.Panels[0].Text:=
    '��������� ������ � ���������...';

  checkRemoteDrivers;

  if ordersDBProcessingCounter>=0 then
  ordersDBProcessingCounter:=
    ordersDBProcessingCounter-1;

  //SocketLogMemo.Lines.Add
  //  ('��������� ������ - �������!');

  if
  not (IniFile.ReadString('BUSINESS_DATA',
    '��_���������_�������_��������_�����',
    'NO')='YES')
   and (ordersDBProcessingCounter<=0)
    then
  begin

  //SocketLogMemo.Lines.Add
  //  ('��������� ������!');

  ordersDBProcessingCounter:=
    IniFile.ReadInteger
      ('BUSINESS_DATA',
      '��������_���������_������',
      1);

  RemoteProcessedOrdersADOQ.Active:=False;
  try

    RemoteProcessedOrdersADOQ.Active:=True;
    if RemoteProcessedOrdersADOQ.RecordCount>0 then
    begin

      RemoteProcessedOrdersADOQ.First;

      while (not RemoteProcessedOrdersADOQ.Eof) do
      begin

        CurrOrderID:=RemoteProcessedOrdersADOQ.
          FieldByName('BOLD_ID').AsInteger;

        OrderStatus:=RemoteProcessedOrdersADOQ.
          FieldByName('REMOTE_SET').AsInteger;

        REMOTE_DRNUM:=RemoteProcessedOrdersADOQ.
				  FieldByName('REMOTE_DRNUM').AsInteger;

        if AutoSetOrderStatus(CurrOrderID, OrderStatus,
          RemoteProcessedOrdersADOQ.FieldByName
          ('Nachalo_zakaza_data').AsDateTime,
          RemoteProcessedOrdersADOQ.FieldByName
          ('Konec_zakaza_data').AsDateTime,
          RemoteProcessedOrdersADOQ.FieldByName
          ('LAST_STATUS_TIME').AsDateTime,
          RemoteProcessedOrdersADOQ.FieldByName
          ('REMOTE_SYNC').AsInteger) then
        begin
          RemoteProcessedOrdersADOQ.Next;
          Continue;
        end;

        CurrDriverSectorID:=
          RemoteProcessedOrdersADOQ.FieldByName(
              'SECTOR_ID').AsInteger;

        if (CurrDriverSectorID<=0) and
        (IniFile.ReadString('BUSINESS_DATA',
        '��_����������_����_������_��_��������','NO')<>'YES') then
        begin
          DriverByNumADODS.Active:=False;
          try
          DriverByNumADODS.Parameters.
            ParamByName('poz').Value:=
            REMOTE_DRNUM;
          DriverByNumADODS.Active:=True;

          if DriverByNumADODS.RecordCount=1 then
          begin
            CurrDriverSectorID:=
              DriverByNumADODS.FieldByName
              ('rabotaet_na_sektore').AsInteger;

            if not ServerMainForm.SendLocalSQL(
            'UPDATE Zakaz SET SECTOR_ID='+
            IntToStr(CurrDriverSectorID)+' where'+
            ' BOLD_ID='+IntToStr(CurrOrderID),
            '������ ��������� ������� ������������� ������!') then
              SocketLogMemo.Lines.Add(
              '��������� ������ ��������� ������� ������������� ������!');

          end
          else
          begin
            SocketLogMemo.Lines.Add(
              '�� ������ ��� ����� ������ ��������� � �������� '+
              IntToStr(REMOTE_DRNUM)+' � �������� ������!');
          end;
          except on E:Exception do
          begin
            SocketLogMemo.Lines.Add(
              '������ ������� ������ '+
              '� �������� �������� ������! '+
              E.Message);
          end;
          end;
          //��������� �������� ���� ������ �� ��� ���������
          RemoteProcessedOrdersADOQ.Next;
          Continue;

        end;

        if IniFile.ReadString
              ('BUSINESS_DATA',
              '��������������_������������_�������',
              'NO')='YES' then
        begin

        CurrOrderPriorityCounter:=RemoteProcessedOrdersADOQ.
          FieldByName('PRIORITY').AsInteger;

        if (MaxOrderPriority<CurrOrderPriorityCounter) and
          (OrderStatus>0) and (OrderStatus<4) then
          if not setOrderRemoteStatus(CurrOrderID,4) then
            SocketLogMemo.Lines.Add('�� ������� ������ '+
              '��� ��������� ������� 4!')
          else
          begin
            RemoteProcessedOrdersADOQ.Next;
            Continue;
          end;

        if (IniFile.ReadString(
          'BUSINESS_DATA',
          '����������_�������_�_JAVA_����������',
          'NO')<>'YES') then
          OrderData:=StringReplace(
          RemoteProcessedOrdersADOQ.
          FieldByName('Adres_vyzova_vvodim').AsString,
          '/',' ', [rfReplaceAll])
        else
        OrderData:=StringReplace(
          RemoteProcessedOrdersADOQ.
          FieldByName('Telefon_klienta').AsString+' '+
          RemoteProcessedOrdersADOQ.
          FieldByName('Adres_vyzova_vvodim').AsString,
          '/',' ', [rfReplaceAll]);

        case OrderStatus of
        ORDER_INDIVID_TAKE:
          begin
            //��������� ����� ����� ������

            //if not setOrderRemoteStatus(CurrOrderID,
            //ORDER_INDIVID_TAKE, -1) then
            //  SocketLogMemo.Lines.Add('�� ������� ������ '+
            //  '��� ��������� ������� ORDER_INDIVID_TAKE!');

            ClientCollectionIndex:=SocketCoord.
              GetClientItemIndexByDrNum(REMOTE_DRNUM);

            //������� ��������������� ��� �����������
            if IniFile.ReadString
              ('BUSINESS_DATA',
              '��������_�������������_��������������',
              'NO')='YES' then
            if (ClientCollectionIndex<0) then
              begin
                SocketLogMemo.Lines.Add(
                  '�� ������� ������� ���� ��� ��������� '+
                  '��������� ������ ��� �������� � �������� '+
                  IntToStr(REMOTE_DRNUM));
              end
            else
              begin
                CurrClientID:=SocketCoord.TCPClientCollection.
                  Items[ClientCollectionIndex].ClientID;

                manual_param:=',"manual":"no"';
                if IniFile.ReadString
                  ('BUSINESS_DATA',
                  '�����_�����_�������_�������������',
                  'NO')='YES' then
                  manual_param:=',"manual":"yes"';

                if not SocketCoord.TCPClientCollection.
                    Items[ClientCollectionIndex].useUTF8 then
                  OrderData:=TranslitRus2Lat(OrderData);

                addDirectJSONMessageToClient(
                  '{"command":"take_order",'+
                  '"order_id":"'+IntToStr(CurrOrderID)+
                  '","order_data":"'+OrderData+
                  '","client_id":"'+IntToStr(CurrClientID)+
                  '"'+manual_param+',"msg_end":"ok"}', CurrClientID);
              end;

            //���� �������������� ����� �������
            //� �������� � ����������
            if (RemoteProcessedOrdersADOQ.
              FieldByName('Individ_order').
              AsInteger=1) and (IniFile.ReadString
              ('BUSINESS_DATA',
              '������������_��������������_���������',
              'NO')='YES') then
              begin
                  SetIndOrderSendADOSP.
                    Parameters.Refresh;
                  SetIndOrderSendADOSP.Parameters.
                    ParamByName('@order_id').Value:=
                    CurrOrderID;

                  SetIndOrderSendADOSP.Parameters.
                    ParamByName('@indiv_priority').Value:=
                    MaxIndivOrderPriority;

                  SetIndOrderSendADOSP.ExecProc;
              end
            else
              begin
                if (IniFile.ReadString('BUSINESS_DATA',
                  '��������_��_����','NO')='YES') or
                  (CurrDriverSectorID<=0) then
                begin
                  if not setOrderRemoteStatus(CurrOrderID,3,-1) then
                    SocketLogMemo.Lines.Add('�� ������� ������ '+
                      '��� ��������� ������� 3!');
                end
                else if IniFile.ReadString(
                  'BUSINESS_DATA',
                  '��������_��_�������_�������',
                  'NO')='YES' then
                begin
                  if setOrderRemoteStatus(CurrOrderID,2,-1) then
                    SocketLogMemo.Lines.Add('�� ������� ������ '+
                      '��� ��������� ������� 2!');
                end
                else
                begin
                  if setOrderRemoteStatus(CurrOrderID,4) then
                    SocketLogMemo.Lines.Add('�� ������� ������ '+
                      '��� ��������� ������� 4!');
                end;

              end;

          end;

       ORDER_SECTOR_PUBLISHING:
          begin
            if (IniFile.ReadString(
            'BUSINESS_DATA',
            '��������_��_�������_�������',
            'NO')='YES') and
            (CurrDriverSectorID>0) then
            begin
              //�������� �� �������

              AllActDrOnSectADODS.Active:=False;
              try

                AllActDrOnSectADODS.Parameters.
                ParamByName('sector_id').Value :=
                  CurrDriverSectorID;
                AllActDrOnSectADODS.Parameters.
                ParamByName('order_priority').Value :=
                  CurrOrderPriorityCounter;
                if (IniFile.ReadString('BUSINESS_DATA',
                  '��������_�������_�_������_���_�������',
                  'NO')='YES') then
                  AllActDrOnSectADODS.Parameters.
                  ParamByName('include_all').Value:=1
                else
                  AllActDrOnSectADODS.Parameters.
                  ParamByName('include_all').Value:=0;
                AllActDrOnSectADODS.Active:=True;

                //������� �������� �� �������
                if AllActDrOnSectADODS.RecordCount>0 then
                begin
                  AllActDrOnSectADODS.First;
                  while not AllActDrOnSectADODS.Eof do
                  begin
                    ClientCollectionIndex:=SocketCoord.
                      GetClientItemIndexByDrNum(
                      AllActDrOnSectADODS.
                      FieldByName('Pozyvnoi').AsInteger);

                    if (ClientCollectionIndex<0) then
                    begin
                      SocketLogMemo.Lines.Add(
                        '�� ������� ������� ���� ��� ��������� '+
                        '��������� ������ ��� �������� � �������� '+
                        IntToStr(AllActDrOnSectADODS.
                        FieldByName('Pozyvnoi').AsInteger));
                    end
                    else
                    begin
                      CurrClientID:=SocketCoord.TCPClientCollection.
                        Items[ClientCollectionIndex].ClientID;

                      CurrClientID:=SocketCoord.TCPClientCollection.
                        Items[ClientCollectionIndex].ClientID;

                      manual_param:=',"manual":"no"';
                      if IniFile.ReadString('BUSINESS_DATA',
                        '�����_�����_��������_���_�������',
                        'NO')='YES' then
                          manual_param:=',"manual":"yes"';

                      if not SocketCoord.TCPClientCollection.
                        Items[ClientCollectionIndex].useUTF8 then
                        OrderData:=TranslitRus2Lat(OrderData);

                      addDirectJSONMessageToClient(
                        '{"command":"take_order",'+
                        '"order_id":"'+IntToStr(CurrOrderID)+
                        '","order_data":"'+OrderData+
                        '","client_id":"'+IntToStr(CurrClientID)+
                        '"'+manual_param+',"msg_end":"ok"}', CurrClientID);
                    end;

                    AllActDrOnSectADODS.Next;
                  end;
                end;
                //����� �������� �������� �� �������

                if (IniFile.ReadString('BUSINESS_DATA',
                  '���������_���������_�����_��������_��_�������',
                  'NO')='YES') and (CurrOrderPriorityCounter
                  >=StartWithOthersSendPriority) then
                begin
                  if not setOrderRemoteStatus(CurrOrderID,3,-1) then
                    SocketLogMemo.Lines.Add('�� ������� ������ '+
                      '��� ��������� ������� 3!');
                end;

              except on Ex:Exception do
                SocketLogMemo.Lines.Add('������ ��� '+
                  '�������� �� �������! '+Ex.Message);
              end;

            end
            else
            //���� �� ���������� ������� �������� �� �������
            //��������� �� ������ ���� ��������
            begin
              if ((IniFile.ReadString(
                'BUSINESS_DATA',
                '���������_���������_�����_��������_��_�������',
                'NO')='YES') and
                (CurrDriverSectorID<=0)) or
                (IniFile.ReadString(
                  'BUSINESS_DATA',
                  '��������_��_����',
                  'NO')='YES')  then
              begin
                if not setOrderRemoteStatus(CurrOrderID,3,-1) then
                    SocketLogMemo.Lines.Add('�� ������� ������ '+
                      '��� ��������� ������� 3!');
              end
              else
              begin
                if not setOrderRemoteStatus(CurrOrderID,4) then
                    SocketLogMemo.Lines.Add('�� ������� ������ '+
                      '��� ��������� ������� 4!');
              end;
            end;
            //����� �������� �� ������ ��������

          end;

      ORDER_ALL_PUBLISHING:
          begin
            AllActiveDriversADODS.Active:=False;
              try
                AllActiveDriversADODS.Parameters.
                ParamByName('order_priority').Value :=
                  CurrOrderPriorityCounter;

                if (IniFile.ReadString(
                'BUSINESS_DATA',
                '��������_�������_�_������_���_����',
                'NO')='YES') then
                  AllActiveDriversADODS.Parameters.
                    ParamByName('include_all').Value:=1
                else
                  AllActiveDriversADODS.Parameters.
                    ParamByName('include_all').Value:=0;

                AllActiveDriversADODS.Active:=True;

                if AllActiveDriversADODS.RecordCount>0 then
                begin
                  AllActiveDriversADODS.First;
                  while not AllActiveDriversADODS.Eof do
                  begin
                    ClientCollectionIndex:=SocketCoord.
                      GetClientItemIndexByDrNum(
                      AllActiveDriversADODS.
                      FieldByName('Pozyvnoi').AsInteger);

                    if (ClientCollectionIndex<0) then
                    begin
                      SocketLogMemo.Lines.Add(
                        '�� ������� ������� ���� ��� ��������� '+
                        '��������� ������ ��� �������� � �������� '+
                        IntToStr(AllActiveDriversADODS.
                        FieldByName('Pozyvnoi').AsInteger));
                    end
                    else
                    begin
                      CurrClientID:=SocketCoord.TCPClientCollection.
                        Items[ClientCollectionIndex].ClientID;

                      manual_param:=',"manual":"no"';
                      if IniFile.ReadString
                        ('BUSINESS_DATA',
                        '�����_�����_��������_���_����',
                        'NO')='YES' then
                        manual_param:=',"manual":"yes"';

                      if not SocketCoord.TCPClientCollection.
                        Items[ClientCollectionIndex].useUTF8 then
                        OrderData:=TranslitRus2Lat(OrderData);

                      addDirectJSONMessageToClient(
                        '{"command":"take_order",'+
                        '"order_id":"'+IntToStr(CurrOrderID)+
                        '","order_data":"'+OrderData+
                        '","client_id":"'+IntToStr(CurrClientID)+
                        '"'+manual_param+',"msg_end":"ok"}',
                        CurrClientID);
                    end;

                    AllActiveDriversADODS.Next;
                  end;
                end;

               except on Ex:Exception do
                  SocketLogMemo.Lines.Add('������ ��� '+
                  '�������� �� ����! '+Ex.Message);
               end;
          end;

      ORDER_PUBLUSHED_WAIT, ORDER_IS_OCCUPED,
      ORDER_OCCUPED_DENY:
      begin
        //��������� ����� ������ ���� ���������
        //������ (�������, ������� ��� ���)
        //��� ��������� ����� ��� ������ ������
        //����������� �������� �������� 2 � 3 ������������
      end;

		  ORDER_OCCUPED_ALLOW: //=7
		  begin
			  ClientCollectionIndex:=SocketCoord.
          GetClientItemIndexByDrNum(REMOTE_DRNUM);

			  if (ClientCollectionIndex<0) then
        begin
          SocketLogMemo.Lines.Add(
            '�� ������� ������� ���� ��� ��������� '+
            '��������� 7 ������ ��� �������� � �������� '+
            IntToStr(REMOTE_DRNUM));

          if IniFile.ReadString
            ('BUSINESS_DATA',
            '��������_����_�������_���_��������_������',
            'NO')='YES' then
          begin
            if setOrderRemoteStatus(CurrOrderID,
              ORDER_OCCUPED_DENY) then
            begin
            end
            else
              SocketLogMemo.Lines.Add('�� ������� ������ '+
                '��� ��������� ������� ORDER_OCCUPED_DENY'+
                ', �������� ��������_����_�������_���_��������_������!');
          end;

        end
        else
        begin
          CurrClientID:=SocketCoord.TCPClientCollection.
            Items[ClientCollectionIndex].ClientID;

          if setOrderRemoteStatus(CurrOrderID,
            ORDER_ALLOW_ASK_WAIT) then
              begin
              if not SocketCoord.TCPClientCollection.
                    Items[ClientCollectionIndex].useUTF8 then
                  OrderData:=TranslitRus2Lat(OrderData);
              addDirectJSONMessageToClient(
                '{"command":"order_is_your",'+
                '"order_id":"'+IntToStr(CurrOrderID)+
                '","order_data":"'+OrderData+
                '","client_id":"'+IntToStr(CurrClientID)+
                '","msg_end":"ok"}', CurrClientID);
              end
          else
            SocketLogMemo.Lines.Add('�� ������� ������ '+
              '��� ��������� ������� ORDER_ALLOW_ASK_WAIT!');

        end;
		  end;

		  //ORDER_OCCUPED_ALLOW: ORDER_BUSY = 8;
		  ORDER_ONHAND_ALLOW: //ORDER_ONHAND_ALLOW = 9;
		  begin
			ClientCollectionIndex:=SocketCoord.
        GetClientItemIndexByDrNum(REMOTE_DRNUM);
			  if (ClientCollectionIndex<0) then
        begin
          SocketLogMemo.Lines.Add(
            '�� ������� ������� ���� ��� ��������� '+
            '��������� ORDER_ONHAND_ALLOW '+
						'������ ��� �������� � �������� '+
            IntToStr(REMOTE_DRNUM));
        end
        else
        begin
						CurrClientID:=SocketCoord.TCPClientCollection.
							Items[ClientCollectionIndex].ClientID;

            if setOrderRemoteStatus(CurrOrderID,
              ORDER_ONHAND_ALLOW_ASK_WAIT) then
              begin
                if not SocketCoord.TCPClientCollection.
                    Items[ClientCollectionIndex].useUTF8 then
                  OrderData:=TranslitRus2Lat(OrderData);
						    addDirectJSONMessageToClient(
						      '{"command":"go_on_hand",'+
						      '"order_id":"'+IntToStr(CurrOrderID)+
						      '","order_data":"'+OrderData+
						      '","client_id":"'+IntToStr(CurrClientID)+
						      '","msg_end":"ok"}', CurrClientID);
              end
            else
               SocketLogMemo.Lines.Add('�� ������� ������ '+
                '��� ��������� ������� ORDER_ONHAND_ALLOW_ASK_WAIT!');
        end;

		  end;
		  
		  //ORDER_ONHAND_ACTIVE = 10; �������� �� ORDER_BUSY = 8;
		  ORDER_DISP_CANCEL: //ORDER_DISP_CANCEL = 11;
		  begin
			  ClientCollectionIndex:=SocketCoord.
          GetClientItemIndexByDrNum(
          REMOTE_DRNUM);

			    if (ClientCollectionIndex<0) then
          begin
            SocketLogMemo.Lines.Add(
              '�� ������� ������� ���� ��� ��������� '+
              '��������� ORDER_DISP_CANCEL '+
						  '������ ��� �������� � �������� '+
              IntToStr(REMOTE_DRNUM));
          end
          else
          begin
						CurrClientID:=SocketCoord.TCPClientCollection.
							Items[ClientCollectionIndex].ClientID;
            if setOrderRemoteStatus(CurrOrderID,
              ORDER_DISP_CANCEL_ASK_WAIT) then
              begin
                if not SocketCoord.TCPClientCollection.
                    Items[ClientCollectionIndex].useUTF8 then
                  OrderData:=TranslitRus2Lat(OrderData);
						    addDirectJSONMessageToClient(
						      '{"command":"order_cancel",'+
						      '"order_id":"'+IntToStr(CurrOrderID)+
						      '","order_data":"'+OrderData+
						      '","client_id":"'+IntToStr(CurrClientID)+
						      '","msg_end":"ok"}', CurrClientID);
              end
            else
               SocketLogMemo.Lines.Add('�� ������� ������ '+
                '��� ��������� ������� ORDER_DISP_CANCEL_ASK_WAIT!');
        end;

		  end;
		  //ORDER_DISP_CANCEL_DR_INCOURSE = 12;
		  //ORDER_DRV_CANCEL = 13;
		  ORDER_DRV_CANCEL_DISP_ALLOW:  //ORDER_DRV_CANCEL_DISP_ALLOW = 14;
		    begin
		    end;
		  //ORDER_DRV_COMPLETE = 15
		  ORDER_COMLETE_ALLOW: //ORDER_COMLETE_ALLOW = 16;
		    begin
		    end;
		  ORDER_CLOSE_ERROR:
		    begin
		    end;
		  ORDER_DRCANCEL_DENY:
		    begin
		    end;
      else
          begin
          end;
      //����� CASE-�������� ��������� ��������� ������
      end;

        //����� ������� �������������� ������������ �������
        //������� ���� �� ���������
      end;

      RemoteProcessedOrdersADOQ.Next;
    end;
    //����� ����� �������� ������

    if (IniFile.ReadString(
      'BUSINESS_DATA',
      '��������_�����_������������_�����������',
      'NO')='YES') then
        self.incrementOrderPriorStat(
          -1,MaxOrderPriority);

    end;

  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '������ ����� ��������� '+
      '��������� �������� ������! '+
      E.Message);
  end;

  //����� ������� �� �������������� �����
  end;

  finally
    localRebuildSendMsgInProcess:=False;
  end;
  end;

  Result:=res;

end;

function TRemoteControlForm.ReloadDrSettings: Boolean;
begin
  try
    SettingsADODS.Active:=False;
    SettingsADODS.Active:=True;
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '��������� ��������� ���������� �� ��!'+
      E.Message);
  end;
  Result:=SettingsADODS.Active;
end;

procedure TRemoteControlForm.SocketCheckTimerTimer(Sender: TObject);
var send_repeat_count, send_repeat_max_num: Integer;
begin

if (IniFile.ReadString('BUSINESS_DATA',
	'��������_�_�����_���������','NO')='YES') then
  begin

  if clientCheckingInActive then
  begin
  end
  else
  begin
    clientCheckingInActive:=True;
    try
    if ServerActive then
    begin
    if ServerMainForm.MainBASEADOC.Connected then
    begin

      if SettingsADODS.Active then
      begin
      if SettingsADODS.RecordCount>0 then
      if SettingsADODS.FieldByName('db_version').AsInteger>=5 then
      begin

	    if HasRemoteDataChanges or HasRemoteDrDataChanges or True then
      begin
        //SocketLogMemo.Lines.Add(
        //'Start localRebuildSendMsgCollection!');
        localRebuildSendMsgCollection;
      end;

      send_repeat_max_num:=IniFile.ReadInteger(
        'BUSINESS_DATA','����������_��������_�������_��������',
        2);
      send_repeat_count:=0;

      repeat
      proceedInputJSONMessages(
        SocketCoord.CheckClients(SendMsgCollection));

      deleteAskedSendingMessages;
      deleteOldThreadsSendingMessages;
      send_repeat_count:=send_repeat_count+1;
      until ((send_repeat_count>send_repeat_max_num) or
        (SendMsgCollection.Count=0));

      refreshSocksMemo;  

      end;

      end
      else
      begin
        SocketLogMemo.Lines.Add(
        '���������� ����� ���������� ��!');
        try
          SettingsADODS.Active:=False;
          SettingsADODS.Active:=True;
        except on E:Exception do
           SocketLogMemo.Lines.Add(
            '��������� ��������� ���������� �� ��!'+
              E.Message);
        end;
      end;
    end
    else
      SocketLogMemo.Lines.Add(
        '��� ���������� � ��������� �� '+
        '��� ������������ �����-��������!');



    end;

    finally
      clientCheckingInActive:=False;
    end;
  end;

  end;
end;

procedure TRemoteControlForm.deleteOldThreadsSendingMessages;
var i, clIndex:Integer;
    itsDeleting: Boolean;
begin
  if SendMsgCollection.Count>0 then
  begin
    itsDeleting:=True;
    while(itsDeleting) do
      begin
        itsDeleting:=False;
        for i:=0 to SendMsgCollection.Count-1 do
          begin
            if SocketCoord.GetActiveClientItemIndexByClientId
              (SendMsgCollection.Items[i].ClientID)<0 then
              begin
                SendMsgCollection.Delete(i);
                itsDeleting:=True;
                Break;
              end;
          end;
      end;    
  end;
end;

procedure TRemoteControlForm.deleteAskedSendingMessages;
var i:Integer;
    itsDeleting: Boolean;
begin
  
  if SendMsgCollection.Count>0 then
  begin
    itsDeleting:=True;
    while(itsDeleting) do
      begin
        itsDeleting:=False;

        for i:=0 to SendMsgCollection.Count-1 do
        begin
          if SendMsgCollection.Items[i].
            OnDeletedASKed then
          begin
            SendMsgCollection.Delete(i);
            itsDeleting:=True;
            Break;
          end;
        end;

      end;
  end;

end;

function TRemoteControlForm.setOrderRemoteStatus(order_id,
  status: Integer; priority_counter: Integer=-10000) : Boolean;
var count: Integer;
    res: Boolean;
begin
  count:=0;
  res:=False;
  try
    SetOrderRemoteStatusADOSP.
      Parameters.Refresh;
    SetOrderRemoteStatusADOSP.Parameters.
      ParamByName('@order_id').Value:=
      order_id;
    SetOrderRemoteStatusADOSP.Parameters.
      ParamByName('@status').Value:=
      status;
    SetOrderRemoteStatusADOSP.Parameters.
      ParamByName('@count').Value:=0;
    SetOrderRemoteStatusADOSP.Parameters.
      ParamByName('@priority_counter').
      Value:=priority_counter;
    SetOrderRemoteStatusADOSP.ExecProc;
    count:=SetOrderRemoteStatusADOSP.Parameters.
      ParamValues['@count'];
    if (count>0) then
      res:=True;
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '��������� �������� '+
      '��������� ������� ������! '+
      E.Message);
  end;
  Result:=res;
end;

function TRemoteControlForm.getDriverStatusJSON(driver_id: Integer): Widestring;
var res: Widestring;
begin
  res:='{"command":"driver_status","did":"-1","msg_end":"ok"}';
  try
    GetDrStatusJSONADOSP.
      Parameters.Refresh;
    GetDrStatusJSONADOSP.Parameters.
      ParamByName('@driver_id').Value:=
      driver_id;
    if (IniFile.ReadString(
      'BUSINESS_DATA',
      '����������_�������_�_JAVA_����������',
      'NO')<>'YES') then
        GetDrStatusJSONADOSP.Parameters.
          ParamByName('@show_phone').Value:=
            0
    else
        GetDrStatusJSONADOSP.Parameters.
          ParamByName('@show_phone').Value:=
          1;
    GetDrStatusJSONADOSP.Parameters.
      ParamByName('@res').Value:='';
    GetDrStatusJSONADOSP.ExecProc;
    res:=GetDrStatusJSONADOSP.Parameters.
      ParamValues['@res'];
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '��������� �������� '+
      '������� ������� ��������! '+
      E.Message);
  end;
  Result:=res;
end;

function TRemoteControlForm.proceedOpRequest(
  InputJSONObject: TLkJSONObject; DriverId: Integer=-1; DrNum: Integer=-1): Widestring;
var res: Widestring;
begin
  res:='{"command":"opa","scs":"no","msg_end":"ok"}';
  try
    ProceedOpRequestADOSP.
      Parameters.Refresh;
    ProceedOpRequestADOSP.Parameters.
      ParamByName('@opnm').Value:=
      InputJSONObject.getString('opnm');
    if DriverId>0 then
      ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm1').Value:=DriverId
    else
    ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm1').Value:=
      StrToIntDef(InputJSONObject.getString('prm1'),-1);
    if DrNum>0 then
      ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm2').Value:=DrNum
    else
    ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm2').Value:=
      StrToIntDef(InputJSONObject.getString('prm2'),-1);
    ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm3').Value:=
      StrToIntDef(InputJSONObject.getString('prm3'),-1);
    ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm4').Value:=
      InputJSONObject.getString('prm4');
    ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm5').Value:=
      InputJSONObject.getString('prm5');
    ProceedOpRequestADOSP.Parameters.
      ParamByName('@op_answer').Value:='';
    ProceedOpRequestADOSP.ExecProc;

    res:=ProceedOpRequestADOSP.Parameters.
      ParamValues['@op_answer'];
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '��������� ��������� '+
      '������� �������� ! '+
      InputJSONObject.getString('opnm') +' '+
      E.Message);
  end;
  SocketLogMemo.Lines.Add(
      '��������� ��������: '+res);
  Result:=res;
end;

procedure TRemoteControlForm.sendDriverStatus(clientIndex: Integer; msg: TMessageCollectionItem);
var
  NewMSWCollectItem: TMessageCollectionItem;
begin
  NewMSWCollectItem:=SendMsgCollection.Add;

  if SocketCoord.TCPClientCollection.
    Items[clientIndex].useUTF8 then

    NewMSWCollectItem.SetDirectJSONString(
      Self.getDriverStatusJSON
        (msg.DriverDBID))
  else
    NewMSWCollectItem.SetDirectJSONString(
      TranslitRus2Lat(Self.getDriverStatusJSON
        (msg.DriverDBID), False));

  NewMSWCollectItem.ClientID:=
    msg.ClientID;
  NewMSWCollectItem.GetMessage().ClientID:=
    msg.ClientID;

  NewMSWCollectItem:=SendMsgCollection.Add;
  if SocketCoord.TCPClientCollection.
      Items[clientIndex].useUTF8 then begin
    NewMSWCollectItem.SetDirectJSONString(
      Self.GetJSONEarlyOrdersList(msg.DriverDBID));
  end
  else begin
    NewMSWCollectItem.SetDirectJSONString(
      TranslitRus2Lat(Self.GetJSONEarlyOrdersList
      (msg.DriverDBID), False));
  end;
  NewMSWCollectItem.ClientID:=
    msg.ClientID;
  NewMSWCollectItem.GetMessage().ClientID:=
    msg.ClientID;
end;

function TRemoteControlForm.proceedInputJSONMessages
  (InputJSONMessages: TMessageCollection): Boolean;
var i, j, k, m, count, order_id, client_index: Integer;
    NewMSWCollectItem: TMessageCollectionItem;
    InputJSONObject: TLkJSONObject;
    commandName, sectorName: String;
    orderSumm: Double;
    res: Boolean;
    success_login, success_send: Boolean;
    clientIndex, waiting, order_time, order_distance: Integer;
begin
res:=False;
if not ServerMainForm.MainBASEADOC.Connected then
    begin
      SocketLogMemo.Lines.Add(
        '��� ���������� � ��������� �� '+
        '��� ��������� �����-������!');
    end
else
  if inputMessagesInProcess or
    localRebuildSendMsgInProcess then
  begin
  end
  else
  begin
    inputMessagesInProcess:=True;
  try

  ServerMainForm.MainSB.Panels[0].Text:=
    DateTimeToStr(Today+Time)+' : ��������� �������� ��������...';
  //SocketLogMemo.Lines.Add('��������� �������� ��������...');
  for i:=0 to InputJSONMessages.Count-1 do
  begin
    InputJSONObject := InputJSONMessages.
      Items[i].MSGJSONObject;

      clientIndex:=-1;

      for k:=0 to SocketCoord.TCPClientCollection.Count-1 do
        if SocketCoord.TCPClientCollection.
          Items[k].ClientID=
          InputJSONMessages.Items[i].ClientID then
          begin
            clientIndex:=k;
          end;

      if clientIndex>=0 then
      begin

      try

      if InputJSONMessages.Items[i].itsSystemMessage and
        SocketCoord.TCPClientCollection.
                    Items[clientIndex].Autorized  then
      begin
        commandName:=InputJSONObject.
          getString('oper_type');
        if commandName='' then
          commandName:=InputJSONObject.
          getString('ot');
        if (commandName='order_accepting') or
          (commandName='oac') then
          begin

            if InputJSONObject.
              getString('order_id')='' then
            order_id:=StrToIntDef(InputJSONObject.
              getString('oid'),-1)
            else
            order_id:=StrToIntDef(InputJSONObject.
              getString('order_id'),-1);

            waiting := StrToIntDef(InputJSONObject.
              getString('wait'),0);

            if order_id>0 then
            begin

            if waiting<0 then waiting:=0;

            if not ServerMainForm.SendLocalSQL(
              'UPDATE Zakaz SET REMOTE_SYNC=0, WAITING='+
              IntToStr(waiting)+
              ' WHERE BOLD_ID='+IntToStr(order_id),
              '��������� �������� �������������!') then
              SocketLogMemo.Lines.Add(
                  '��������� ��������� �������� '+
                  '������������� ����������� ������!');
            end
            else
              SocketLogMemo.Lines.Add(
                  '��������� ��������� �������� '+
                  '������������� ����������� ������!');

          end
        else if commandName='accept_status' then
          begin
            if not self.setDriverSyncStatus(InputJSONMessages.
              Items[i].DriverDBID, 0) then
               SocketLogMemo.Lines.Add(
                  '��������� ��������� �������� '+
                  '������������� ������� ��������!')
            else
               SocketLogMemo.Lines.Add(
                  '������� ��������� �������� '+
                  '������������� ������� ��������!');
          end
        else
          begin
          end;
      end
      else
      begin

      try
        commandName:=InputJSONObject.getString('command');
        //SocketLogMemo.Lines.Add('---'+commandName+'---');
        if commandName='' then
          commandName:=InputJSONObject.getString('cmd');
      except
        try
          commandName:=InputJSONObject.getString('cmd');
        except
          commandName:='unknown';
          SocketLogMemo.Lines.Add('�� ��������� ��� �������!');
        end;
      end;

      if commandName='connect_attempt' then
          begin
          end
      else if commandName='autr' then
          begin
            success_login:=False;

            if (Length(InputJSONObject.getString('lg'))>0)
              and (Length(InputJSONObject.getString('pw'))>5) then
            begin
            if verifyDriverClient(
              InputJSONObject.getString('lg'),
              InputJSONObject.getString('pw'))
            then
            begin
            if InputJSONObject.getString('uu')='ok' then
              SocketCoord.TCPClientCollection.
                    Items[clientIndex].SetTreadUTF8Use(true);
            if Self.setDriverRemoteStatus(
            AutorizedVerifyADODS.
                FieldByName('BOLD_ID').AsInteger,
              FREE_DRIVER, 1, -1, -1, -1)
            then
            begin

              try
                if (IniFile.ReadString(
                'BUSINESS_DATA',
                '��������������_��_�����_���_�����������',
                'NO')='YES') then
                begin
                  SetDriverOnLineADOSP.
                    Parameters.Refresh;
                  SetDriverOnLineADOSP.Parameters.
                    ParamByName('@driver_id').Value:=
                      AutorizedVerifyADODS.
                      FieldByName('BOLD_ID').AsInteger;
                  SetDriverOnLineADOSP.ExecProc;
                end;
                //SetDriverOnLineADOSP.Active:=False;
                SocketLogMemo.Lines.Add(        
                  '������� ��������������');

                NewMSWCollectItem:=SendMsgCollection.Add;

                NewMSWCollectItem.SetDirectJSONString(
                '{"command":"autr_ok",'+
                '"client_id":"'+IntToStr(
                InputJSONMessages.Items[i].ClientID)+
                '","msg_end":"ok"}');

                NewMSWCollectItem.ClientID:=
                  InputJSONMessages.Items[i].ClientID;
                NewMSWCollectItem.GetMessage().ClientID:=
                  InputJSONMessages.Items[i].ClientID;


                SocketLogMemo.Lines.Add('���������� ����� '+
                  IntToStr(SocketCoord.TCPClientCollection.
                  Count));

                SocketCoord.TCPClientCollection.
                    Items[clientIndex].Pozyvnoi:=
                    AutorizedVerifyADODS.
                    FieldByName('Pozyvnoi').AsInteger;
                SocketCoord.TCPClientCollection.
                    Items[clientIndex].DriverDBID:=
                    AutorizedVerifyADODS.
                    FieldByName('BOLD_ID').AsInteger;
                SocketCoord.TCPClientCollection.
                    Items[clientIndex].Autorized:=True;

                success_login:=True;

                SocketLogMemo.Lines.Add('�����������'+
                    ' �������� � �������� '+
                    IntToStr(SocketCoord.TCPClientCollection.
                    Items[clientIndex].Pozyvnoi));

                if success_login then
                  begin
                  if InputJSONObject.getString('sl')='ok' then
                  begin
                    NewMSWCollectItem:=SendMsgCollection.Add;

                    if SocketCoord.TCPClientCollection.
                    Items[clientIndex].useUTF8 then
                      NewMSWCollectItem.SetDirectJSONString(
                        GetJSONSectorList(SocketCoord.TCPClientCollection.
                    Items[clientIndex].DriverDBID))
                    else
                      NewMSWCollectItem.SetDirectJSONString(
                        TranslitRus2Lat(GetJSONSectorList(SocketCoord.TCPClientCollection.
                    Items[clientIndex].DriverDBID), False));

                    NewMSWCollectItem.ClientID:=
                      InputJSONMessages.Items[i].ClientID;
                    NewMSWCollectItem.GetMessage().ClientID:=
                      InputJSONMessages.Items[i].ClientID;

                    if (IniFile.ReadString(
                      'BUSINESS_DATA',
                      '������������_������',
                      'NO')='YES') then
                      begin
                        NewMSWCollectItem:=SendMsgCollection.Add;

                        if SocketCoord.TCPClientCollection.
                          Items[clientIndex].useUTF8 then
                            NewMSWCollectItem.SetDirectJSONString(
                              GetJSONTOList(SocketCoord.TCPClientCollection.
                    Items[clientIndex].DriverDBID))
                        else
                          NewMSWCollectItem.SetDirectJSONString(
                            TranslitRus2Lat(GetJSONTOList(SocketCoord.TCPClientCollection.
                    Items[clientIndex].DriverDBID), False));

                        NewMSWCollectItem.ClientID:=
                          InputJSONMessages.Items[i].ClientID;
                        NewMSWCollectItem.GetMessage().ClientID:=
                          InputJSONMessages.Items[i].ClientID;
                      end;
                  end;

                  NewMSWCollectItem:=SendMsgCollection.Add;
                  if SocketCoord.TCPClientCollection.
                    Items[clientIndex].useUTF8 then begin
                    NewMSWCollectItem.SetDirectJSONString(
                      Self.getDriverStatusJSON
                      (AutorizedVerifyADODS.
                        FieldByName('BOLD_ID').AsInteger));
                    end
                  else begin
                    NewMSWCollectItem.SetDirectJSONString(
                      TranslitRus2Lat(Self.getDriverStatusJSON
                      (AutorizedVerifyADODS.
                        FieldByName('BOLD_ID').AsInteger), False));
                    end;
                  NewMSWCollectItem.ClientID:=
                    InputJSONMessages.Items[i].ClientID;
                  NewMSWCollectItem.GetMessage().ClientID:=
                    InputJSONMessages.Items[i].ClientID;

                  NewMSWCollectItem:=SendMsgCollection.Add;
                  if SocketCoord.TCPClientCollection.
                    Items[clientIndex].useUTF8 then begin
                    NewMSWCollectItem.SetDirectJSONString(
                      Self.GetJSONEarlyOrdersList(
                      AutorizedVerifyADODS.
                        FieldByName('BOLD_ID').AsInteger));
                    end
                  else begin
                    NewMSWCollectItem.SetDirectJSONString(
                      TranslitRus2Lat(Self.GetJSONEarlyOrdersList
                      (AutorizedVerifyADODS.
                        FieldByName('BOLD_ID').AsInteger), False));
                    end;
                  NewMSWCollectItem.ClientID:=
                    InputJSONMessages.Items[i].ClientID;
                  NewMSWCollectItem.GetMessage().ClientID:=
                    InputJSONMessages.Items[i].ClientID;

                  NewMSWCollectItem:=SendMsgCollection.Add;
                  NewMSWCollectItem.SetDirectJSONString(
                    Self.getDriverJSONSettings
                    (AutorizedVerifyADODS.
                      FieldByName('BOLD_ID').AsInteger));
                  NewMSWCollectItem.ClientID:=
                    InputJSONMessages.Items[i].ClientID;
                  NewMSWCollectItem.GetMessage().ClientID:=
                    InputJSONMessages.Items[i].ClientID;

                  NewMSWCollectItem:=SendMsgCollection.Add;
                  NewMSWCollectItem.SetDirectJSONString(
                    getSectorsStatus);
                  NewMSWCollectItem.ClientID:=
                    InputJSONMessages.Items[i].ClientID;
                  NewMSWCollectItem.GetMessage().ClientID:=
                    InputJSONMessages.Items[i].ClientID;

                  try
                  if ( SettingsADODS.FieldByName
                    ('use_fordbroadcast_priority').AsInteger=1) then
                  begin
                  end
                  else
                  begin
                    addDirectJSONMessageToClient(
                      SettingsADODS.FieldByName
                      ('forders_wbroadcast').AsString,
                      InputJSONMessages.Items[i].ClientID);
                  end;
                  except on Efb:Exception do
                  begin
                    SocketLogMemo.Lines.Add(
                      '��������� �������� ������� ���������� ������ ��������������� ��������!'+
                      Efb.Message);
                  end;
                  end;

                  SocketCoord.deleteOldClientThreads(
                      InputJSONMessages.Items[i].
                      ClientID,
                      AutorizedVerifyADODS.
                      FieldByName('Pozyvnoi').AsInteger);

                  end;

              except on E:Exception do
                SocketLogMemo.Lines.Add(
                  '��������� �������� '+
                  '���������� �� �����! '+
                  E.Message);
              end;
              end
              else
                begin

                  NewMSWCollectItem:=SendMsgCollection.Add;

                  NewMSWCollectItem.SetDirectJSONString(
                  '{"command":"autr_uns",'+
                  '"msg_end":"ok"}');
                  SocketLogMemo.Lines.Add('��������� �������������� (��� 1)');

                  NewMSWCollectItem.ClientID:=
                    InputJSONMessages.Items[i].ClientID;
                  NewMSWCollectItem.GetMessage().ClientID:=
                    InputJSONMessages.Items[i].ClientID;

                end;
              end
            else
            begin
              //���������� �� ����� (������ ������)
              NewMSWCollectItem:=SendMsgCollection.Add;

              NewMSWCollectItem.SetDirectJSONString(
              '{"command":"autr_uns",'+
              '"msg_end":"ok"}');
              SocketLogMemo.Lines.Add('��������� �������������� (��� 2)');

              NewMSWCollectItem.ClientID:=
                  InputJSONMessages.Items[i].ClientID;
                NewMSWCollectItem.GetMessage().ClientID:=
                  InputJSONMessages.Items[i].ClientID;
            end;
            end
            else
              begin
                //���������� �� �����
              end;

          end;

    if SocketCoord.TCPClientCollection.
                    Items[clientIndex].Autorized then
		if commandName='accept_order' then
          begin
            if StrToIntDef(InputJSONObject.
                getString('wait'),-1)>0 then
            begin   
            //�������� �������� ������� ������������ �����
            count:=0;
            try
			
              SetOrdOcAtStat2ADOSP.Parameters.Refresh;
              SetOrdOcAtStat2ADOSP.Parameters.
                ParamByName('@order_id').Value:=
                StrToIntDef(InputJSONObject.
                getString('order_id'),-1);
              SetOrdOcAtStat2ADOSP.Parameters.
                ParamByName('@waiting').Value:=
                StrToIntDef(InputJSONObject.
                getString('wait'),60);
              SetOrdOcAtStat2ADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                InputJSONMessages.Items[i].DriverDBID;
              if InputJSONObject.getString('manual')='yes' then
                SetOrdOcAtStat2ADOSP.Parameters.
                ParamByName('@is_manual').Value:=
                1
              else
                SetOrdOcAtStat2ADOSP.Parameters.
                ParamByName('@is_manual').Value:=
                0;
			        if (IniFile.ReadString(
                'BUSINESS_DATA',
                '��������_���_�������_��_����������',
                'NO')<>'YES') then
				        SetOrdOcAtStat2ADOSP.Parameters.
                ParamByName('@status').Value:=ORDER_IS_OCCUPED
			        else
				      SetOrdOcAtStat2ADOSP.Parameters.
                ParamByName('@status').Value:=ORDER_OCCUPED_DENY;
              SetOrdOcAtStat2ADOSP.Parameters.
                ParamByName('@count').Value:=0;  
              SetOrdOcAtStat2ADOSP.ExecProc;
              //SetOrdOcAtStatADOSP.Refresh;
              //SetOrdOcAtStatADOSP.Active:=True;
              count:=SetOrdOcAtStat2ADOSP.Parameters.
                ParamValues['@count'];
              SocketLogMemo.Lines.Add('������� ������� - '+IntToStr(count));
              if (count>0) then
                SocketLogMemo.Lines.Add(
                '������ ������� '+
                '������� ����� '+InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' ������...')
              else
              begin

                NewMSWCollectItem:=SendMsgCollection.Add;

                NewMSWCollectItem.SetDirectJSONString(
                  '{"command":"order_occuped",'+
                  '"order_id":"'+InputJSONObject.
                  getString('order_id')+
                  '","client_id":"'+IntToStr(
                  InputJSONMessages.Items[i].ClientId)+
                  '","msg_end":"ok"}');

                NewMSWCollectItem.ClientID:=
                  InputJSONMessages.Items[i].ClientID;
                NewMSWCollectItem.GetMessage().ClientID:=
                  InputJSONMessages.Items[i].ClientID;

                SocketLogMemo.Lines.Add(
                '������ ������� '+
                '������� ����� '+InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� ������!!!');
              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������� ������� '+
                '������� �����! '+E.Message);
            end;
            end
            else
            begin
			      //�������� �������� ������� ������������ �����
            count:=0;
            try
			
              SetOrdOcAtStatADOSP.Parameters.Refresh;
              SetOrdOcAtStatADOSP.Parameters.
                ParamByName('@order_id').Value:=
                StrToIntDef(InputJSONObject.
                getString('order_id'),-1);
              SetOrdOcAtStatADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                InputJSONMessages.Items[i].DriverDBID;
              if InputJSONObject.getString('manual')='yes' then
                SetOrdOcAtStatADOSP.Parameters.
                ParamByName('@is_manual').Value:=
                1
              else
                SetOrdOcAtStatADOSP.Parameters.
                ParamByName('@is_manual').Value:=
                0;
			        if (IniFile.ReadString(
                'BUSINESS_DATA',
                '��������_���_�������_��_����������',
                'NO')<>'YES') then
				        SetOrdOcAtStatADOSP.Parameters.
                ParamByName('@status').Value:=ORDER_IS_OCCUPED
			        else
				      SetOrdOcAtStatADOSP.Parameters.
                ParamByName('@status').Value:=ORDER_OCCUPED_DENY;
              SetOrdOcAtStatADOSP.Parameters.
                ParamByName('@count').Value:=0;  
              SetOrdOcAtStatADOSP.ExecProc;
              //SetOrdOcAtStatADOSP.Refresh;
              //SetOrdOcAtStatADOSP.Active:=True;
              count:=SetOrdOcAtStatADOSP.Parameters.
                ParamValues['@count'];
              SocketLogMemo.Lines.Add('������� ������� - '+IntToStr(count));
              if (count>0) then
                SocketLogMemo.Lines.Add(
                '������ ������� '+
                '������� ����� '+InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' ������...')
              else
              begin

                NewMSWCollectItem:=SendMsgCollection.Add;

                NewMSWCollectItem.SetDirectJSONString(
                  '{"command":"order_occuped",'+
                  '"order_id":"'+InputJSONObject.
                  getString('order_id')+
                  '","client_id":"'+IntToStr(
                  InputJSONMessages.Items[i].ClientId)+
                  '","msg_end":"ok"}');

                NewMSWCollectItem.ClientID:=
                  InputJSONMessages.Items[i].ClientID;
                NewMSWCollectItem.GetMessage().ClientID:=
                  InputJSONMessages.Items[i].ClientID;

                SocketLogMemo.Lines.Add(
                '������ ������� '+
                '������� ����� '+InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� ������!!!');
              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������� ������� '+
                '������� �����! '+E.Message);
            end;
            end
          end 
		else if commandName='no_accept_order' then
          begin
			    //�������� ������������ ������� ������������ �����
          end
		else if commandName='order_is_my' then
          begin
			    //�������� ���������� �������� �����
            count:=0;
            try
              SetOrderGoADOSP.Parameters.Refresh;
              SetOrderGoADOSP.Parameters.
                ParamByName('@order_id').Value:=
                StrToIntDef(InputJSONObject.
                getString('order_id'),-1);
              SetOrderGoADOSP.Parameters.
                ParamByName('@dr_num').Value:=
                InputJSONMessages.Items[i].Pozyvnoi;
              SetOrderGoADOSP.Parameters.
                ParamByName('@count').Value:=0;
              SetOrderGoADOSP.ExecProc;
              //SetOrdOcAtStatADOSP.Refresh;
              //SetOrdOcAtStatADOSP.Active:=True;
              count:=SetOrderGoADOSP.Parameters.
                ParamValues['@count'];
              SocketLogMemo.Lines.Add('������� ������� - '+IntToStr(count));
              if (count>0) then
              begin
                client_index:=SocketCoord.
                  GetActiveClientItemIndexByClientId(
                  InputJSONMessages.Items[i].ClientId);
                if (client_index>=0) then
                begin
                if SocketCoord.TCPClientCollection.
                  Items[client_index].GetTreadObject.
                  SendUTFString('{"sync":"ok","order_id":"'+
                  InputJSONObject.getString('order_id')+
                  '","client_id":"'+IntToStr(InputJSONMessages.
                  Items[i].ClientId)+
                  '","oper_type":"order_accepting","msg_end":"ok"}',
                  True) then
                SocketLogMemo.Lines.Add(
                '�������������� �������� ������ '
                +InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �������...');
                end;
              end
              else
              begin
                SocketLogMemo.Lines.Add(
                '�������������� �������� ������ '+InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� �������!!!');
              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������������� '+
                '�������� �����! '+E.Message);
            end;
          end
		else if commandName='onhand_order' then
          begin
			//�������� ������ ����� � ����	  
            if (IniFile.ReadString(
                'BUSINESS_DATA',
                '���������_�������_�_����',
                'NO')<>'YES') then
			begin
			order_id:=-1;
            count:=0;
            try

              InsOrdWithStatusADOSP.Parameters.Refresh;
			        if (IniFile.ReadString(
                'BUSINESS_DATA',
                '��������_���_�������_�_����',
                'NO')='YES') then
				        InsOrdWithStatusADOSP.Parameters.
                  ParamByName('@status').Value:=
                  ORDER_ONHAND_ALLOW_USER_WAIT
			        else  //����� ������ � ����
                InsOrdWithStatusADOSP.Parameters.
                  ParamByName('@status').Value:=
                  ORDER_ONHAND_ALLOW;
              InsOrdWithStatusADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                InputJSONMessages.Items[i].DriverDBID;
              InsOrdWithStatusADOSP.Parameters.
                ParamByName('@order_id').Value:=-1;
              InsOrdWithStatusADOSP.Parameters.
                ParamByName('@disp_id').Value:=-1;
              InsOrdWithStatusADOSP.Parameters.
                ParamByName('@adres').Value:=IniFile.ReadString(
                'BUSINESS_DATA',
                '�����_���_�������_�_����',
                '� ����');
              InsOrdWithStatusADOSP.ExecProc;

              order_id:=InsOrdWithStatusADOSP.Parameters.
                ParamValues['@order_id'];
              SocketLogMemo.Lines.Add('������� ��������� - '+IntToStr(order_id));

              if (order_id>0) then
                //���������� ������������ � ����� �������� ���� ������
                SocketLogMemo.Lines.Add(
                '������ � ���� '
                +InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' ������...')
              else
              begin
                SocketLogMemo.Lines.Add(
                '������ � ���� '+InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� ������!!!');
              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������� � ����! '+E.Message);
            end;
			end;
          end
		else if commandName='accept_order_cancel' then
          begin
			      //�������� ���������� ������ ������ �����������
            if Self.setOrderRemoteStatus(
              StrToIntDef(InputJSONObject.
                getString('order_id'),-1),
                ORDER_DISP_CANCEL_DR_INCOURSE) then
                SocketLogMemo.Lines.Add(
                '������������� ������ ���������� '
                +InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �������...')
              else
              begin
                SocketLogMemo.Lines.Add(
                '������������� ������ ���������� '+InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� �������!!!');
              end;
          end
		else if commandName='working_abort' then
          begin
			      //�������� �������� �� ������ ������ ��������
          end
    else if commandName='decline_order' then
          begin
			      //�������� �������� �� ������ ������
			if (IniFile.ReadString(
                'BUSINESS_DATA',
                '���������_������_���������',
                'NO')='YES') then
			begin
            count:=0;
            try
              SetOrdDrCAttStADOSP.Parameters.Refresh;
              SetOrdDrCAttStADOSP.Parameters.
                ParamByName('@order_id').Value:=
                StrToIntDef(InputJSONObject.
                getString('order_id'),-1);
              SetOrdDrCAttStADOSP.Parameters.
                ParamByName('@dr_id').Value:=
                InputJSONMessages.Items[i].DriverDBID;
              SetOrdDrCAttStADOSP.Parameters.
                ParamByName('@count').Value:=0;
              SetOrdDrCAttStADOSP.ExecProc;
              //SetOrdOcAtStatADOSP.Refresh;
              //SetOrdOcAtStatADOSP.Active:=True;
              count:=SetOrdDrCAttStADOSP.Parameters.
                ParamValues['@count'];
              SocketLogMemo.Lines.Add('������� ������� - '+IntToStr(count));
              if (count>0) then
              begin
                SocketLogMemo.Lines.Add(
                '����� ��� ������ ������ '
                +InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �������...');
              end
              else
              begin
                SocketLogMemo.Lines.Add(
                '����� ��� ������ ������ '+InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� �������!!!');
              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������ '+
                '��� ������ ������! '+E.Message);
            end;
			end;
          end
    else if commandName='sect_direct' then
          begin
			if (IniFile.ReadString(
                'BUSINESS_DATA',
                '���������_��������_����_�����������',
                'NO')='YES') then
			begin//�������� �������� � ������� �����������
            try
              SetSectDirectionADOC.Parameters.
                ParamByName('sector_id').Value:=
              StrToIntDef(InputJSONObject.
                getString('sector_id'),-1);
              SetSectDirectionADOC.Parameters.
                ParamByName('order_id').Value:=
              StrToIntDef(InputJSONObject.
                getString('order_id'),-1);
              SetSectDirectionADOC.Execute;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ��������� '+
                '������� ����������� ������! '+E.Message);
            end;
			end;
          end
	else if commandName='iam_here' then
          begin
			if (IniFile.ReadString(
                'BUSINESS_DATA',
                '���������_�����_��_�����',
                'NO')='YES') then
			begin//�������� �������� � ������� �����������
            try
              OnPlaceADOC.Parameters.
                ParamByName('order_id').Value:=
              StrToIntDef(InputJSONObject.
                getString('order_id'),-1);
              OnPlaceADOC.Execute;
              sendDriverStatus(clientIndex, InputJSONMessages.Items[i]);
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ��������� '+
                '�������� �� ����� ������! '+E.Message);
            end;
			end;
          end
    else if commandName='alarm' then
          begin
			      //EVENT_ALARM = 1;
            //EVENT_ON_REST = 2;
            //EVENT_SECTOR_DIRECTION = 3;
            Self.InsertEvent(EVENT_ALARM,-1,InputJSONMessages.Items[i].DriverDBID,
            -1, Today+Time, '�������� ����� ��������� ������!!!','','',
            InputJSONMessages.Items[i].Pozyvnoi);
          end
    else if commandName='gpsc' then
          begin
			      //EVENT_ALARM = 1;
            //EVENT_ON_REST = 2;
            //EVENT_SECTOR_DIRECTION = 3;
            Self.InsertEvent2(EVENT_GPS_COORDS,-1,InputJSONMessages.Items[i].DriverDBID,
            -1, Today+Time, '�������� ���������� ��������!!!','','',
            InputJSONMessages.Items[i].Pozyvnoi,InputJSONObject.
                  getString('lt'),InputJSONObject.
                  getString('ln'));
          end
		else if commandName='order_complete' then
          begin
			      //�������� ������������ �� ����������
            count:=0;
            try

              order_time:=0;
              try
                order_time:=StrToIntDef(InputJSONObject.
                  getString('time'),0);
              except on E:Exception do
              end;

              order_distance:=0;
              try
                order_distance:=StrToIntDef(InputJSONObject.
                  getString('tdist'),0);
              except on E:Exception do
              end;

              orderSumm:=StrToFloatDef(InputJSONObject.
                getString('sale'),-1.0);

              if (orderSumm>=0) then
              begin
              if (order_time<=0) and (order_distance<=0) then
              begin
              AttOrdCompleteADOSP.Parameters.Refresh;
              AttOrdCompleteADOSP.Parameters.
                ParamByName('@order_id').Value:=
                StrToIntDef(InputJSONObject.
                getString('order_id'),-1);
              AttOrdCompleteADOSP.Parameters.
                ParamByName('@summ').Value:=
                orderSumm;
              AttOrdCompleteADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                InputJSONMessages.Items[i].DriverDBID;
			        if (IniFile.ReadString(
                    'BUSINESS_DATA','��������_���_������',
                    'NO')='YES') then
				      AttOrdCompleteADOSP.Parameters.
                ParamByName('@status').Value:=
					    ORDER_COMPLETE_ALLOW_USER_WAIT
			        else //����� ������� ����������� � ����������
				      AttOrdCompleteADOSP.Parameters.
					      ParamByName('@status').Value:=
						    ORDER_COMLETE_ALLOW;
              AttOrdCompleteADOSP.Parameters.
                ParamByName('@count').Value:=0;
              AttOrdCompleteADOSP.ExecProc;
              //SetOrdOcAtStatADOSP.Refresh;
              //SetOrdOcAtStatADOSP.Active:=True;
              count:=AttOrdCompleteADOSP.Parameters.
                ParamValues['@count'];
              end
              else
              begin
              AttOrdCompleteADOSP3.Parameters.Refresh;
              AttOrdCompleteADOSP3.Parameters.
                ParamByName('@order_id').Value:=
                StrToIntDef(InputJSONObject.
                getString('order_id'),-1);
              AttOrdCompleteADOSP3.Parameters.
                ParamByName('@summ').Value:=
                orderSumm;
              AttOrdCompleteADOSP3.Parameters.
                ParamByName('@order_time').Value:=
                order_time;
              AttOrdCompleteADOSP3.Parameters.
                ParamByName('@tm_distance').Value:=
                order_distance;
              AttOrdCompleteADOSP3.Parameters.
                ParamByName('@driver_id').Value:=
                InputJSONMessages.Items[i].DriverDBID;
			        if (IniFile.ReadString(
                    'BUSINESS_DATA','��������_���_������',
                    'NO')='YES') then
				      AttOrdCompleteADOSP3.Parameters.
                ParamByName('@status').Value:=
					    ORDER_COMPLETE_ALLOW_USER_WAIT
			        else //����� ������� ����������� � ����������
				      AttOrdCompleteADOSP3.Parameters.
					      ParamByName('@status').Value:=
						    ORDER_COMLETE_ALLOW;
              AttOrdCompleteADOSP3.Parameters.
                ParamByName('@count').Value:=0;
              AttOrdCompleteADOSP3.ExecProc;
              //SetOrdOcAtStatADOSP.Refresh;
              //SetOrdOcAtStatADOSP.Active:=True;
              count:=AttOrdCompleteADOSP3.Parameters.
                ParamValues['@count'];
              end;
              SocketLogMemo.Lines.Add('������� ������� - '+IntToStr(count));
              end
              else
              begin
                SocketLogMemo.Lines.Add(
                '�������� �������� �����!');
              end;
              if (count>0) then
              begin
                success_send:=True;

                client_index:=SocketCoord.
                  GetActiveClientItemIndexByClientId(
                  InputJSONMessages.Items[i].ClientId);

                if (client_index>=0) and
                  not (IniFile.ReadString(
                'BUSINESS_DATA',
                '��������_���_������',
                'NO')='YES') then
                success_send:=SocketCoord.TCPClientCollection.
                  Items[client_index].GetTreadObject.
                  SendUTFString(
                  '{"command":"order_close","order_id":"'+
                  InputJSONObject.getString('order_id')+
                  '","client_id":"'+IntToStr(InputJSONMessages.
                  Items[i].ClientId)+
                  '","msg_end":"ok"}',
                  True);
                if success_send then
                SocketLogMemo.Lines.Add(
                '����� ������ '
                +InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' ������� � ����...')
                else
                  SocketLogMemo.Lines.Add(
                '��������� �������� '+
                '�������������, �� ����� ������ '
                +InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' ������� � ����...');
              end
              else
              begin
                SocketLogMemo.Lines.Add(
                '����� ������ '+InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� ������!!!');
              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������ '+
                '������ �� ��������! '+E.Message);
            end;
          end
		else if commandName='sign_out' then
          begin
			      //�������� ������ � ������ � �����
            count:=0;
            try

              if (IniFile.ReadString(
                'BUSINESS_DATA',
                '���������_������_�_�����',
                'NO')='YES') then
              begin
                SetDriverOutLineADOSP.Parameters.Refresh;
                SetDriverOutLineADOSP.Parameters.
                  ParamByName('@driver_id').Value:=
                    InputJSONMessages.Items[i].DriverDBID;
                SetDriverOutLineADOSP.Parameters.
                  ParamByName('@count').Value:=0;
                SetDriverOutLineADOSP.ExecProc;
                count:=SetDriverOutLineADOSP.Parameters.
                  ParamValues['@count'];
              end
              else
              begin
                if (IniFile.ReadString(
                  'BUSINESS_DATA',
                  '���������_�������_�_������',
                  'NO')='YES') then
                Self.InsertEvent(RemoteControlUnit.EVENT_FROM_LINE,
                  -1,InputJSONMessages.Items[i].DriverDBID,
                  -1, Today+Time, '�������� ����� c������ � �����!!!','','',
                  InputJSONMessages.Items[i].Pozyvnoi);

              end;

              SocketLogMemo.Lines.Add('������� ��������� - '+IntToStr(count));
              if (count>0) then
              begin
                SocketLogMemo.Lines.Add(
                '������ �� ������ � �����'+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' ������...');

                NewMSWCollectItem:=SendMsgCollection.Add;

                NewMSWCollectItem.SetDirectJSONString(
                  '{"command":"out_stat",'+
                  '"succ":"yes"'+
                  ',"msg_end":"ok"}');

                NewMSWCollectItem.ClientID:=
                  InputJSONMessages.Items[i].ClientID;
                NewMSWCollectItem.GetMessage().ClientID:=
                  InputJSONMessages.Items[i].ClientID;
              end
              else
              begin
                SocketLogMemo.Lines.Add(
                '������ �� ������ � �����'+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� ������!!!');

                NewMSWCollectItem:=SendMsgCollection.Add;

                NewMSWCollectItem.SetDirectJSONString(
                  '{"command":"out_stat",'+
                  '"succ":"no"'+
                  ',"msg_end":"ok"}');

                NewMSWCollectItem.ClientID:=
                  InputJSONMessages.Items[i].ClientID;
                NewMSWCollectItem.GetMessage().ClientID:=
                  InputJSONMessages.Items[i].ClientID;

              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������� �� ������ � �����! '+E.Message);
            end;
          end
		else if commandName='on_rest' then
          begin
			      //�������� ������ �������
            count:=0;
            try
              SetDrRemStatusADOSP.Parameters.Refresh;
              if (IniFile.ReadString(
                'BUSINESS_DATA',
                '��������������_����������_��_�������',
                'NO')='YES') then
              begin
                SetDrRemStatusADOSP.Parameters.
                ParamByName('@status').Value:=
                DR_ON_REST;
                SetDrRemStatusADOSP.Parameters.
                ParamByName('@check_busy').Value:=-1;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@on_launch').Value:=-1;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@on_line').Value:=-1;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@sync').Value:=-1;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                InputJSONMessages.Items[i].DriverDBID;
              SetDrRemStatusADOSP.Parameters.
                ParamByName('@count').Value:=0;
              SetDrRemStatusADOSP.ExecProc;
              //SetOrdOcAtStatADOSP.Refresh;
              //SetOrdOcAtStatADOSP.Active:=True;
              count:=SetDrRemStatusADOSP.Parameters.
                ParamValues['@count'];
              end
              else
              begin
              Self.InsertEvent(RemoteControlUnit.EVENT_ON_REST,
                -1,InputJSONMessages.Items[i].DriverDBID,
                -1, Today+Time, '�������� ����� �� �������!!!','','',
                InputJSONMessages.Items[i].Pozyvnoi);
              //SetDrRemStatusADOSP.Parameters.
              //  ParamByName('@status').Value:=
              //  DR_ON_REST_ATTEMPT;
              end;

              SocketLogMemo.Lines.Add('������� ��������� - '+IntToStr(count));
              if (count>0) then
                SocketLogMemo.Lines.Add(
                '������ �� �������'+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' ������...')
              else
              begin
                SocketLogMemo.Lines.Add(
                '������ �� �������'+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� ������!!!');
              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������� �� �������! '+E.Message);
            end;
          end
    else if commandName='from_rest' then
      begin
        if (IniFile.ReadString(
                'BUSINESS_DATA',
                '��������������_������_�_��������',
                'NO')='YES') then
        begin
          if Self.setDriverRemoteStatus(
          InputJSONMessages.Items[i].DriverDBID,
          DR_FROM_REST_ATTEMPT, 1, -1, -1, -1) then
          begin
            SocketLogMemo.Lines.Add(
                '������ �� �������'+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' ������...');
          end
          else
            SocketLogMemo.Lines.Add(
                '������ c ��������'+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� ������!!!');
        end
        else
              begin
              Self.InsertEvent(RemoteControlUnit.EVENT_FROM_REST,
                -1,InputJSONMessages.Items[i].DriverDBID,
                -1, Today+Time, '�������� ����� ���� � ��������!!!','','',
                InputJSONMessages.Items[i].Pozyvnoi);
              end;
      end
		else if commandName='queue_query' then
          begin
			      //�������� ������ ���������� � ����� �������������� � �������
            count:=0;
            try
              GetDrQueuePosADOSP.Parameters.Refresh;
              GetDrQueuePosADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                InputJSONMessages.Items[i].DriverDBID;
              GetDrQueuePosADOSP.Parameters.
                ParamByName('@pos_msg').Value:='';
              GetDrQueuePosADOSP.ExecProc;

              NewMSWCollectItem:=SendMsgCollection.Add;

              if SocketCoord.TCPClientCollection.
                    Items[clientIndex].useUTF8 then
                NewMSWCollectItem.SetDirectJSONString(
                  '{"command":"queue_answer",'+
                  '"msg":"'+
                  GetDrQueuePosADOSP.Parameters.
                  ParamValues['@pos_msg']+
                  '","client_id":"'+IntToStr(
                  InputJSONMessages.Items[i].ClientId)+
                  '","msg_end":"ok"}')
              else
                NewMSWCollectItem.SetDirectJSONString(
                  '{"command":"queue_answer",'+
                  '"msg":"'+TranslitRus2Lat(
                  GetDrQueuePosADOSP.Parameters.
                  ParamValues['@pos_msg'])+
                  '","client_id":"'+IntToStr(
                  InputJSONMessages.Items[i].ClientId)+
                  '","msg_end":"ok"}');

                NewMSWCollectItem.ClientID:=
                  InputJSONMessages.Items[i].ClientID;
                NewMSWCollectItem.GetMessage().ClientID:=
                  InputJSONMessages.Items[i].ClientID;
              {SocketLogMemo.Lines.Add('������� ������� - '+IntToStr(count));
              if (count>0) then
                SocketLogMemo.Lines.Add(
                '�������������� �������� ������ '
                +InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �������...')
              else
              begin
                SocketLogMemo.Lines.Add(
                '�������������� �������� ������ '+InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� �������!!!');
              end;  }
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������� '+
                '�������������� � �������! '+E.Message);
            end;
          end
        else if commandName='sector_list_query' then
          begin
			      //�������� ������ ���������� � ����� �������������� � �������
            count:=0;
            try

              NewMSWCollectItem:=SendMsgCollection.Add;

              if SocketCoord.TCPClientCollection.
                    Items[clientIndex].useUTF8 then
                NewMSWCollectItem.SetDirectJSONString(
                  GetJSONSectorList(SocketCoord.TCPClientCollection.
                    Items[clientIndex].DriverDBID))
              else
                NewMSWCollectItem.SetDirectJSONString(
                  TranslitRus2Lat(GetJSONSectorList(SocketCoord.TCPClientCollection.
                    Items[clientIndex].DriverDBID), False));

                NewMSWCollectItem.ClientID:=
                  InputJSONMessages.Items[i].ClientID;
                NewMSWCollectItem.GetMessage().ClientID:=
                  InputJSONMessages.Items[i].ClientID;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������� '+
                '������ ��������! '+E.Message);
            end;
          end
        else if commandName='op_requ' then
          begin
            if (IniFile.ReadString(
                'BUSINESS_DATA',
                '������������_������',
                'NO')='YES')   then
            begin
			      //�������� ������ ���������� � ����� �������������� � �������
            count:=0;
            try

              NewMSWCollectItem:=SendMsgCollection.Add;

              if SocketCoord.TCPClientCollection.
                    Items[clientIndex].useUTF8 then
                NewMSWCollectItem.SetDirectJSONString(
                  GetJSONTOList(SocketCoord.TCPClientCollection.
                    Items[clientIndex].DriverDBID))
              else
                NewMSWCollectItem.SetDirectJSONString(
                  TranslitRus2Lat(GetJSONTOList(SocketCoord.TCPClientCollection.
                    Items[clientIndex].DriverDBID), False));

                NewMSWCollectItem.ClientID:=
                  InputJSONMessages.Items[i].ClientID;
                NewMSWCollectItem.GetMessage().ClientID:=
                  InputJSONMessages.Items[i].ClientID;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������� '+
                '������ ������� � �����! '+E.Message);
            end;
            end;
          end
        else if commandName='dls' then
          begin
			      //�������� ������ ���������� � ����� �������������� � �������
            count:=0;
            try

              NewMSWCollectItem:=SendMsgCollection.Add;

              if SocketCoord.TCPClientCollection.
                    Items[clientIndex].useUTF8 then
                NewMSWCollectItem.SetDirectJSONString(
                  GetJSONDriversList)
              else
                NewMSWCollectItem.SetDirectJSONString(
                  TranslitRus2Lat(GetJSONDriversList, False));

                NewMSWCollectItem.ClientID:=
                  InputJSONMessages.Items[i].ClientID;
                NewMSWCollectItem.GetMessage().ClientID:=
                  InputJSONMessages.Items[i].ClientID;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������� '+
                '������ ���������! '+E.Message);
            end;
          end
        else if commandName='change_sector' then
          begin
			      //�������� ������ ���������� � ����� �������������� � �������
            count:=0;
            sectorName:='';
            try
              SetDrSectorADOSP.Parameters.Refresh;
              SetDrSectorADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                InputJSONMessages.Items[i].DriverDBID;
              SetDrSectorADOSP.Parameters.
                ParamByName('@sector_id').Value:=
                StrToIntDef(InputJSONObject.
                getString('sector_id'),-1);
              SetDrSectorADOSP.Parameters.
                ParamByName('@count').Value:=1;
              SetDrSectorADOSP.Parameters.
                ParamByName('@remote_sync').Value:=1;
              SetDrSectorADOSP.Parameters.
                ParamByName('@sector_name').Value:='';
              SetDrSectorADOSP.ExecProc;

              count:=SetDrSectorADOSP.Parameters.
                ParamValues['@count'];
              sectorName:=SetDrSectorADOSP.Parameters.
                ParamValues['@sector_name'];

              SocketLogMemo.Lines.Add('������� ��������� - '+IntToStr(count));
              if (count>0) then
              begin

                NewMSWCollectItem:=SendMsgCollection.Add;

                if SocketCoord.TCPClientCollection.
                    Items[clientIndex].useUTF8 then
                NewMSWCollectItem.SetDirectJSONString(
                  '{"command":"goto_sector"'+
                  ',"sector_id":"'+InputJSONObject.
                  getString('sector_id')+
                  '","sector_name":"'+sectorName+
                  '","client_id":"'+IntToStr(
                  InputJSONMessages.Items[i].ClientId)+
                  '","msg_end":"ok"}')
                else
                NewMSWCollectItem.SetDirectJSONString(
                  '{"command":"goto_sector"'+
                  ',"sector_id":"'+InputJSONObject.
                  getString('sector_id')+
                  '","sector_name":"'+TranslitRus2Lat(
                  sectorName)+
                  '","client_id":"'+IntToStr(
                  InputJSONMessages.Items[i].ClientId)+
                  '","msg_end":"ok"}');

                NewMSWCollectItem.ClientID:=
                  InputJSONMessages.Items[i].ClientID;
                NewMSWCollectItem.GetMessage().ClientID:=
                  InputJSONMessages.Items[i].ClientID;

                SocketLogMemo.Lines.Add(
                '������ ����� ������� '
                +InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' ������...');
              end
              else
              begin
                SocketLogMemo.Lines.Add(
                '������ ����� ������� '+InputJSONObject.
                getString('order_id')+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� ������!!!');
              end;  
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� ������� '+
                '����� �������! '+E.Message);
            end;
          end
        else if (commandName='status_request') or
          (commandName='r') then
        begin
          NewMSWCollectItem:=SendMsgCollection.Add;

          if SocketCoord.TCPClientCollection.
                    Items[clientIndex].useUTF8 then
            NewMSWCollectItem.SetDirectJSONString(
              Self.getDriverStatusJSON
              (InputJSONMessages.Items[i].DriverDBID))
          else
            NewMSWCollectItem.SetDirectJSONString(
              TranslitRus2Lat(Self.getDriverStatusJSON
              (InputJSONMessages.Items[i].DriverDBID), False));

          NewMSWCollectItem.ClientID:=
            InputJSONMessages.Items[i].ClientID;
          NewMSWCollectItem.GetMessage().ClientID:=
            InputJSONMessages.Items[i].ClientID;

          NewMSWCollectItem:=SendMsgCollection.Add;
          if SocketCoord.TCPClientCollection.
              Items[clientIndex].useUTF8 then begin
            NewMSWCollectItem.SetDirectJSONString(
              Self.GetJSONEarlyOrdersList(
              InputJSONMessages.Items[i].DriverDBID));
          end
          else begin
            NewMSWCollectItem.SetDirectJSONString(
              TranslitRus2Lat(Self.GetJSONEarlyOrdersList
              (InputJSONMessages.Items[i].DriverDBID), False));
            end;
          NewMSWCollectItem.ClientID:=
            InputJSONMessages.Items[i].ClientID;
          NewMSWCollectItem.GetMessage().ClientID:=
            InputJSONMessages.Items[i].ClientID;
        end
        else if (commandName='ss') then
        begin
            NewMSWCollectItem:=SendMsgCollection.Add;
                  NewMSWCollectItem.SetDirectJSONString(
                    getSectorsStatus);
                  NewMSWCollectItem.ClientID:=
                    InputJSONMessages.Items[i].ClientID;
                  NewMSWCollectItem.GetMessage().ClientID:=
                    InputJSONMessages.Items[i].ClientID;
        end 
        else if (commandName='opr') then
        begin
         if (IniFile.ReadString(
                'BUSINESS_DATA',
                '����_��������_�������',
                'NO')='YES') or (InputJSONMessages.
                      Items[i].MSGJSONObject.
                      getString('opnm')<>'dr_bal') then
         begin
            NewMSWCollectItem:=SendMsgCollection.Add;
                  NewMSWCollectItem.SetDirectJSONString(
                    proceedOpRequest(InputJSONMessages.
                      Items[i].MSGJSONObject,
                      InputJSONMessages.Items[i].DriverDBID,
                      InputJSONMessages.Items[i].Pozyvnoi));
                  NewMSWCollectItem.ClientID:=
                    InputJSONMessages.Items[i].ClientID;
                  NewMSWCollectItem.GetMessage().ClientID:=
                    InputJSONMessages.Items[i].ClientID;
         end;
        end
        else if (commandName='dpay_aok') then
        begin
          //�������� �������� �� ���������� ����������
            count:=0;
            try

              SetDrDailyPStatusADOSP.Parameters.Refresh;
              SetDrDailyPStatusADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                InputJSONMessages.Items[i].DriverDBID;
              SetDrDailyPStatusADOSP.Parameters.
                ParamByName('@pstatus').Value:=
                PAY_ALLOW;
              SetDrDailyPStatusADOSP.Parameters.
                ParamByName('@count').Value:=1;
              SetDrDailyPStatusADOSP.ExecProc;

              count:=SetDrDailyPStatusADOSP.Parameters.
                ParamValues['@count'];

              //SocketLogMemo.Lines.Add('������� ��������� - '+IntToStr(count));
              if (count>0) then
              begin

                SocketLogMemo.Lines.Add(
                '�������� �� ������'+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' ������...');
              end
              else
              begin
                SocketLogMemo.Lines.Add(
                '�������� �� ������'+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� ������!!!');
              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� �������� '+
                '�� ������! '+E.Message);
            end;
        end
        else if (commandName='dpay_ano') then
        begin
          //�������� �������� �� ���������� ����������
            count:=0;
            try

              SetDrDailyPStatusADOSP.Parameters.Refresh;
              SetDrDailyPStatusADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                InputJSONMessages.Items[i].DriverDBID;
              SetDrDailyPStatusADOSP.Parameters.
                ParamByName('@pstatus').Value:=
                PAY_DECLINE;
              SetDrDailyPStatusADOSP.Parameters.
                ParamByName('@count').Value:=1;
              SetDrDailyPStatusADOSP.ExecProc;

              count:=SetDrDailyPStatusADOSP.Parameters.
                ParamValues['@count'];

              //SocketLogMemo.Lines.Add('������� ��������� - '+IntToStr(count));
              if (count>0) then
              begin

                SocketLogMemo.Lines.Add(
                '����� ������'+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' ������...');
              end
              else
              begin
                SocketLogMemo.Lines.Add(
                '����� ������'+
                ' �������� '+IntToStr(
                InputJSONMessages.Items[i].ClientId)+
                ' , �������� '+IntToStr(
                InputJSONMessages.Items[i].Pozyvnoi)+
                ' �� ������!!!');
              end;
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� �������� '+
                '�� ������! '+E.Message);
            end;
        end
        else if (commandName='settar') then
        begin
          if (StrToIntDef(
              InputJSONMessages.
                      Items[i].MSGJSONObject.
                      getString('oid'), -1)>=0) and
             (StrToIntDef(
              InputJSONMessages.
                      Items[i].MSGJSONObject.
                      getString('tarid'), -1)>=0) then
          Self.setOrderTarif(StrToIntDef(
              InputJSONMessages.
                      Items[i].MSGJSONObject.
                      getString('oid'), 0),
              StrToIntDef(
              InputJSONMessages.
                      Items[i].MSGJSONObject.
                      getString('tarid'), 0)        );
        end
        else if (commandName='setopts') then
        begin
          if (StrToIntDef(
              InputJSONMessages.
                      Items[i].MSGJSONObject.
                      getString('oid'), -1)>=0) and
             (InputJSONMessages.
                      Items[i].MSGJSONObject.
                      getString('oopts')<>'') then
          Self.setOrderOptComb(StrToIntDef(
              InputJSONMessages.
                      Items[i].MSGJSONObject.
                      getString('oid'), 0),

              InputJSONMessages.
                      Items[i].MSGJSONObject.
                      getString('oopts')        );
        end
        else
          begin
            SocketLogMemo.Lines.Add(
                  '����������� �������! "'+commandName+'".');
          end;

        end;

    except on E:Exception do

    end;
    end
    else
    begin
      //�� ������� ���� ��� ���������
      //���������� � ������� ������
    end;



  end;

  finally
    inputMessagesInProcess:=False;
  end;
  end;

  Result:=res;

end;

function TRemoteControlForm.InsertEvent(ETYPE_ID, ORDER_ID,
  DRIVER_ID, SECTOR_ID: Integer; EDATE: TDateTime;
  DESCRIPTION: Widestring; ADRES, PHONE: String;
  DR_NUM: Integer): Integer;
var count: Integer;
begin
  count:=0;
            try
              InsertEventADOSP.Parameters.Refresh;
              InsertEventADOSP.Parameters.
                ParamByName('@etype_id').Value:=
                ETYPE_ID;
              InsertEventADOSP.Parameters.
                ParamByName('@order_id').Value:=
                ORDER_ID;
              InsertEventADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                DRIVER_ID;
              InsertEventADOSP.Parameters.
                ParamByName('@sector_id').Value:=
                SECTOR_ID;
              InsertEventADOSP.Parameters.
                ParamByName('@edate').Value:=
                EDATE;
              InsertEventADOSP.Parameters.
                ParamByName('@description').Value:=
                DESCRIPTION;
              InsertEventADOSP.Parameters.
                ParamByName('@adres').Value:=
                ADRES;
              InsertEventADOSP.Parameters.
                ParamByName('@phone').Value:=
                PHONE;
              InsertEventADOSP.Parameters.
                ParamByName('@dr_num').Value:=
                DR_NUM;
              InsertEventADOSP.Parameters.
                ParamByName('@count').Value:=0;
              InsertEventADOSP.ExecProc;
              count:=InsertEventADOSP.Parameters.
                ParamValues['@count'];
              SocketLogMemo.Lines.Add('��������� ������� - '
                +IntToStr(count));
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� '+
                '���������� �������! '+E.Message);
            end;
    Result:=count;
end;

function TRemoteControlForm.InsertEvent2(ETYPE_ID, ORDER_ID,
  DRIVER_ID, SECTOR_ID: Integer; EDATE: TDateTime;
  DESCRIPTION: Widestring; ADRES, PHONE: String;
  DR_NUM: Integer; LATITUDE, LONGITUDE: String): Integer;
var count: Integer;
begin
  count:=0;
            try
              InsertEvent2ADOSP.Parameters.Refresh;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@etype_id').Value:=
                ETYPE_ID;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@order_id').Value:=
                ORDER_ID;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@driver_id').Value:=
                DRIVER_ID;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@sector_id').Value:=
                SECTOR_ID;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@edate').Value:=
                EDATE;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@description').Value:=
                DESCRIPTION;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@adres').Value:=
                ADRES;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@phone').Value:=
                PHONE;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@dr_num').Value:=
                DR_NUM;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@LATITUDE').Value:=
                LATITUDE;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@LONGITUDE').Value:=
                LONGITUDE;
              InsertEvent2ADOSP.Parameters.
                ParamByName('@count').Value:=0;
              InsertEvent2ADOSP.ExecProc;
              count:=InsertEvent2ADOSP.Parameters.
                ParamValues['@count'];
              SocketLogMemo.Lines.Add('��������� ������� - '
                +IntToStr(count));
            except on E:Exception do
              SocketLogMemo.Lines.Add(
                '��������� ��������� '+
                '���������� �������! '+E.Message);
            end;
    Result:=count;
end;

function TRemoteControlForm.GetJSONSectorList(driverID: Integer): Widestring;
var res: Widestring;
begin
  res:='{"command":"sector_list","sector_count":"0","msg_end":"ok"}';
  try
      GetJSONSectorListADOQ.Active:=False;
      GetJSONSectorListADOQ.Active:=True;
      GetJSONSectorListADOQ.Parameters.ParamByName(
        'driver_id').Value:=driverID;
      SocketLogMemo.Lines.Add(
      '������ '+
      '������ ��������! '+ IntToStr(driverID));
      if GetJSONSectorListADOQ.RecordCount>0 then
      begin
        res:=GetJSONSectorListADOQ.
          FieldByName('sector_list').AsString;
      end;
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '��������� ������ '+
      '������ ��������! '+E.Message);
  end;
  Result:=res;
end;

function TRemoteControlForm.GetJSONTOList(driverID: Integer): Widestring;
var res: Widestring;
begin
  res:='{"command":"to_lst","t_cnt":"0","op_cnt":"0","msg_end":"ok"}';
  try
      GetTOListADOQ.Parameters.ParamByName(
        'driver_id').Value:=driverID;
      GetTOListADOQ.Active:=False;
      GetTOListADOQ.Active:=True;
      if GetTOListADOQ.RecordCount>0 then
      begin
        res:=GetTOListADOQ.
          FieldByName('to_list').AsString;
          if (IniFile.ReadString(
                'BUSINESS_DATA',
                'testlog2',
                'NO')='YES') then
        Test2Memo.Lines.Add('TOList: '+res);
      end;
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '��������� ������ '+
      '������ ������� � �����! '+E.Message);
  end;
  Result:=res;
end;

function TRemoteControlForm.GetJSONEarlyOrdersList(driverID: Integer): Widestring;
var res: Widestring;
begin
  res:='{"command":"erlo","cn":"0","msg_end":"ok"}';
  try
      GetEarlyListADOQuery.Parameters.ParamByName(
        'driver_id').Value:=driverID;
      GetEarlyListADOQuery.Active:=False;
      GetEarlyListADOQuery.Active:=True;
      if GetEarlyListADOQuery.RecordCount>0 then
      begin
        res:=GetEarlyListADOQuery.
          FieldByName('orders_list').AsString;
          if (IniFile.ReadString(
                'BUSINESS_DATA',
                'testlog2',
                'NO')='YES') then
        Test2Memo.Lines.Add('EarlyList: '+res);
      end;
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '��������� ������ '+
      '������ ��������������� ������� ��������! '+E.Message);
  end;
  Result:=res;
end;

function TRemoteControlForm.GetJSONDriversList: Widestring;
var res: Widestring;
begin
  res:='{"command":"sector_list","sector_count":"0","msg_end":"ok"}';
  try
      GetJSONDriversListADOQ.Active:=False;
      GetJSONDriversListADOQ.Active:=True;
      if GetJSONDriversListADOQ.RecordCount>0 then
      begin
        res:=GetJSONDriversListADOQ.
          FieldByName('dr_list').AsString;
      end;
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '��������� ������ '+
      '������ ���������! '+E.Message);
  end;
  Result:=res;
end;

function TRemoteControlForm.GetDrSectorName(driverId: Integer): String;
var res: String;
begin
  res:='�� ���������';
  try
      GetDrSectorNameADOQ.Active:=False;
      GetDrSectorNameADOQ.Parameters.ParamByName(
        'driver_id').Value:=driverId;
      GetDrSectorNameADOQ.Active:=True;
      if GetDrSectorNameADOQ.RecordCount>0 then
      begin
        res:=GetDrSectorNameADOQ.
          FieldByName('sector_name').AsString;
      end;
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '��������� ������ ����� '+
      '������� ��������! '+E.Message);
  end;
  Result:=res;
end;

function TRemoteControlForm.getDriverCalcBlocked(DrNum: Integer): Boolean;
var res: Boolean;
begin
  res:=True;
  try
      GetDrLockOnCalcDebtADOSP.Parameters.Refresh;
      GetDrLockOnCalcDebtADOSP.Parameters.
          ParamByName('@dr_num').Value:=DrNum;
      GetDrLockOnCalcDebtADOSP.Parameters.
          ParamByName('@res').Value:=-1;
      GetDrLockOnCalcDebtADOSP.ExecProc;
      if GetDrLockOnCalcDebtADOSP.Parameters.
                ParamValues['@res']<>1 then
                res:=False;
  except on E:Exception do
    SocketLogMemo.Lines.Add(
      '��������� ������ GetDrLockOnCalcDebtADOSP ������� '+
      '���������� �� ������ ��������! '+E.Message);
  end;
  Result:=res;
end;

function TRemoteControlForm.verifyDriverClient(login, psw: String): Boolean;
var res: Boolean;
begin
  res:=False;
  AutorizedVerifyADODS.Active:=False;
  AutorizedVerifyADODS.Parameters.
    ParamByName('login').Value:=login;
  AutorizedVerifyADODS.Parameters.
    ParamByName('psw').Value:=psw;
  try
    AutorizedVerifyADODS.Active:=True;
    if (AutorizedVerifyADODS.RecordCount=1) then
    begin
      if (IniFile.ReadString(
                'BUSINESS_DATA',
                '�����������_��_���_�������',
                'NO')='YES') then
        begin
          res:=not getDriverCalcBlocked(AutorizedVerifyADODS.FieldByName('Pozyvnoi').AsInteger);
          if not res  then
            SocketLogMemo.Lines.Add('������ ��� ����������� (�������� ���������� �������� �������� �������)'+
            'login:'''+login+''', password:'''+psw+'''. '+
        '���������� �������� '+ AutorizedVerifyADODS.FieldByName('Pozyvnoi').AsString);
        end
        else
          res:=True;
    end
    else
      begin
        SocketLogMemo.Lines.Add('������ ��� ����������� '+
        'login:'''+login+''', password:'''+psw+'''. '+
        '�� ������ ��� ����� ������ �������� � '+
        '����������� ����������� ���� ������������ �������.');
      end;
  except on E:Exception do
    begin
      SocketLogMemo.Lines.Add('������ ��� ����������� '+
        'login:'''+login+''', password:'''+psw+'''. '+
        E.Message);
    end;
  end;
  Result:=res;
end;

procedure TRemoteControlForm.BitBtn1Click(Sender: TObject);
begin
  SocketCoord.TCPClientCollection.Items[0].
  addTestInputCommand(
    InputJSONTestEdit.Text);
end;

procedure TRemoteControlForm.BitBtn2Click(Sender: TObject);
var NewMSWCollectItem: TMessageCollectionItem;
begin
  NewMSWCollectItem:=SendMsgCollection.Add;

  NewMSWCollectItem.SetDirectJSONString(
    OutputJSONTestEdit.Text);

  NewMSWCollectItem.ClientID:=
    StrToIntDef(ClientIdEdit.Text,-1);
  NewMSWCollectItem.GetMessage().ClientID:=
    StrToIntDef(ClientIdEdit.Text,-1);

end;

procedure TRemoteControlForm.TabSheet7Show(Sender: TObject);
begin
  try
    if ServerMainForm.MainBASEADOC.Connected and False then
    begin
      self.SettingsADODS.Active:=False;
      self.SettingsADODS.Active:=True;
    end;
  except
  end;
end;

procedure TRemoteControlForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (IniFile.ReadString('BUSINESS_DATA',
	'�����_���','NO')='YES') then
  begin
  if logActive then
    CloseFile(logFile);
  end;
end;

procedure TRemoteControlForm.AutoArhivedTimerTimer(Sender: TObject);
var arhCapacity: Integer;
begin
  if ServerMainForm.MainBASEADOC.Connected then
  begin

  if IniFile.ReadString('BUSINESS_DATA',
  '�����������������_������','NO')='YES' then
  begin

    arhCapacity:=IniFile.
      ReadInteger('BUSINESS_DATA',
      '��������_������_���������_��������',100);

    if arhCapacity>100 then
      arhCapacity:=100;

    SocketLogMemo.Lines.Add(
        DateTimeToStr(Today+Time)+
        ' ����� ���������'+
        ' �����������������...');
    try
      AutoArhADOSP.Parameters.Refresh;
      AutoArhADOSP.Parameters.
        ParamByName('@arh_limit').Value:=arhCapacity;
      AutoArhADOSP.Parameters.
        ParamByName('@del_limit').Value:=arhCapacity;
      AutoArhADOSP.Parameters.
        ParamByName('@last_arhived').Value:=IncDay(Today,-1);
      AutoArhADOSP.Parameters.
        ParamByName('@day_distance').Value:=42;      
      AutoArhADOSP.Parameters.
        ParamByName('@arh_count').Value:=0;
      AutoArhADOSP.Parameters.
        ParamByName('@del_count').Value:=0;
      AutoArhADOSP.ExecProc;
    except on E:Exception do
      SocketLogMemo.Lines.Add(
        '��������� ����� ���������'+
        ' �����������������! '+E.Message);
    end;

    SocketLogMemo.Lines.Add(
        DateTimeToStr(Today+Time)+
        ' ���������� ���������'+
        ' �����������������...');

  end;

  end;
end;

procedure TRemoteControlForm.FormDestroy(Sender: TObject);
begin
  if ServerActive then
  begin
    Self.SocketCoord.Destroy;
  end;
end;

procedure TRemoteControlForm.Timer10SecTimer(Sender: TObject);
var StateRequestResult: Integer;
    success: Boolean;
begin

  if ServerMainForm.MainBASEADOC.Connected then
  begin

  if IniFile.ReadString('BUSINESS_DATA',
  'tensec_���������','NO')='YES' then
  begin
    success:=False;
    //SocketLogMemo.Lines.Add(
    //    '����� ���������'+
    //    ' 10 sec ������...');
    try
      One10SecTaskADOSP.Parameters.Refresh;
      One10SecTaskADOSP.Parameters.
        ParamByName('@success').Value:=
        0;
      One10SecTaskADOSP.ExecProc;
      if One10SecTaskADOSP.Parameters.
        ParamValues['@success']=1 then
                success:=True;
    except on E:Exception do
      SocketLogMemo.Lines.Add(
        '��������� ����� ���������'+
        ' 10 sec ������! '+E.Message);
    end;
  end;

  end;

end;

procedure TRemoteControlForm.SMSServiceIdHTTPRedirect(Sender: TObject;
  var dest: string; var NumRedirect: Integer; var Handled: Boolean;
  var VMethod: TIdHTTPMethod);
begin
  ServerMainForm.WriteEvent('������ �������� ' + dest);
end;

procedure TRemoteControlForm.BitBtn3Click(Sender: TObject);
begin
  Test2Memo.Clear;
  Test2Memo.Lines.AddStrings(SocketLogMemo.Lines);
end;

end.
