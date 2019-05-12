unit ModelDM;

interface

uses
  SysUtils, Classes, BoldHandles, BoldSystemHandle, BoldAbstractModel,
  BoldModel, BoldSubscription, BoldHandle, BoldPersistenceHandle,
  BoldPersistenceHandleFile, BoldPersistenceHandleFileXML, BoldActions,
  ActnList, BoldHandleAction, RBoldTranslit, BoldAbstractPersistenceHandleDB,
  BoldPersistenceHandleDB, DB, ADODB, BoldAbstractDatabaseAdapter,
  BoldDatabaseAdapterADO, IniFiles, BoldUnloaderHandle,
  BoldPersistenceHandleSystem, BoldAbstractObjectUpgraderHandle,
  BoldObjectUpgraderHandle, BoldPersistenceNotifier, DBClient, MConnect,
  SConnect, DdeMan, Sockets, BoldRootedHandles, BoldAbstractListHandle,
  BoldCursorHandle, BoldVariableHandle, BoldOclVariables, BoldListHandle, BoldElements,
  BoldAttributes, ExtCtrls, Variants, DBActns, DateUtils;

type
  TBoldModelDM = class(TDataModule)
    bsh: TBoldSystemHandle;
    bstih: TBoldSystemTypeInfoHandle;
    BaseDBActionList: TActionList;
    BoldUpdateDBAction1: TBoldUpdateDBAction;
    BoldActivateSystemAction1: TBoldActivateSystemAction;
    RBoldTranslit: TRBoldTranslit;
    bph: TBoldPersistenceHandleDB;
    bdaADO: TBoldDatabaseAdapterADO;
    ADOConnection: TADOConnection;
    USRLoginADOQuery: TADOQuery;
    CurrTNumADOQuery: TADOQuery;
    CurrAdressADOQuery: TADOQuery;
    CurrArhValADOQuery: TADOQuery;
    BoldModel1: TBoldModel;
    AllActDriverADOQuery: TADOQuery;
    NextCustNumADOQuery: TADOQuery;
    AllDriverADOTable: TADOTable;
    blhCurrSyncDriver: TBoldListHandle;
    bovCurrSyncDriver: TBoldOclVariables;
    bvhCurrSyncDriver: TBoldVariableHandle;
    CheckCustADOQuery: TADOQuery;
    DrActCustADOQuery: TADOQuery;
    PersonaIDByLoginADOQuery: TADOQuery;
    CurrUserADOQuery: TADOQuery;
    MainADOCommand: TADOCommand;
    SectorByIDADOQuery: TADOQuery;
    UnionOADOTable: TADOTable;
    HistoryTNumADOQuery: TADOQuery;
    HasAllBonusADOQuery: TADOQuery;
    AdrPhoneRelatingADOTable: TADOTable;
    IndividPersonsADOQuery: TADOQuery;
    IPersPerINumADOQuery: TADOQuery;
    IPersPerINumDS: TDataSource;
    NewINumADOQuery: TADOQuery;
    HistoryINumADOQuery: TADOQuery;
    INumPourPhoneADOQuery: TADOQuery;
    HasAllBonusADOQueryBOLD_ID: TIntegerField;
    HasAllBonusADOQueryBOLD_TYPE: TSmallintField;
    HasAllBonusADOQueryTip_objekta: TStringField;
    HasAllBonusADOQueryData_nachala: TDateTimeField;
    HasAllBonusADOQueryData_konca: TDateTimeField;
    HasAllBonusADOQueryProcent_otchisleniya: TBCDField;
    HasAllBonusADOQueryFiljtr_pozyvnoi: TIntegerField;
    HasAllBonusADOQueryFiljtr_data_nachala: TDateTimeField;
    HasAllBonusADOQueryFiljtr_data_konca: TDateTimeField;
    HasAllBonusADOQueryCvet_prinyatyh: TStringField;
    HasAllBonusADOQueryCvet_nachavshihsya: TStringField;
    HasAllBonusADOQueryCvet_okonchivshihsya: TStringField;
    HasAllBonusADOQueryVybratj_poslednie_nesk_dnei: TIntegerField;
    HasAllBonusADOQueryKol_posl_dnei: TBCDField;
    HasAllBonusADOQueryData_minus_vybir_dni: TDateTimeField;
    HasAllBonusADOQueryNomer_pozyvnoi_filjtr: TIntegerField;
    HasAllBonusADOQueryCvet_predvarit: TStringField;
    HasAllBonusADOQueryData_po_umolchaniyu: TDateTimeField;
    HasAllBonusADOQueryAvtozapoln_sektorov: TIntegerField;
    HasAllBonusADOQueryNaznach_iz_obsh__spiska: TIntegerField;
    HasAllBonusADOQueryrep_time: TDateTimeField;
    HasAllBonusADOQueryAvtozap_konechn_sekt: TIntegerField;
    HasAllBonusADOQueryAvtozap_nach_sektora: TIntegerField;
    HasAllBonusADOQuerySoobsh_o_netochn_sekt_reg: TIntegerField;
    HasAllBonusADOQueryZapros_konech_sektora: TIntegerField;
    HasAllBonusADOQueryZapros_nach_sektora: TIntegerField;
    HasAllBonusADOQueryIspoljz_priz_1: TIntegerField;
    HasAllBonusADOQueryIspoljz_priz_2: TIntegerField;
    HasAllBonusADOQueryIspoljz_priz_3: TIntegerField;
    HasAllBonusADOQueryKoeff_prizov_sbavki_1: TBCDField;
    HasAllBonusADOQueryKoeff_prizov_sbavki_2: TBCDField;
    HasAllBonusADOQueryKoeff_prizov_sbavki_3: TBCDField;
    HasAllBonusADOQueryPrizovoe_kolichestvo_1: TIntegerField;
    HasAllBonusADOQueryPrizovoe_kolichestvo_2: TIntegerField;
    HasAllBonusADOQueryPrizovoe_kolichestvo_3: TIntegerField;
    HasAllBonusADOQueryVelichina_priz_sbavki_1: TBCDField;
    HasAllBonusADOQueryVelichina_priz_sbavki_2: TBCDField;
    HasAllBonusADOQueryVelichina_priz_sbavki_3: TBCDField;
    HasAllBonusADOQueryRegim_dispetchera: TIntegerField;
    HasAllBonusADOQueryEstj_nachatye: TIntegerField;
    HasAllBonusADOQueryEstj_otpravlennye: TIntegerField;
    HasAllBonusADOQueryNe_uchit_zanyat_drug_disp: TIntegerField;
    HasAllBonusADOQueryKolich_deg_grupp: TIntegerField;
    HasAllBonusADOQueryPer_obnovl_deg: TStringField;
    HasAllBonusADOQueryPer_obnovl_obychn_vod: TStringField;
    HasAllBonusADOQuerySutki_deg_gruppy: TDateTimeField;
    HasAllBonusADOQueryTek_deg_gruppa: TIntegerField;
    HasAllBonusADOQueryVr_smeny_deg_grupp: TStringField;
    HasAllBonusADOQueryKolich_vyd_benzina: TBCDField;
    HasAllBonusADOQueryKomment_k_rabote: TStringField;
    HasAllBonusADOQueryNamen_organizacii: TStringField;
    HasAllBonusADOQueryNapravlenie_1: TStringField;
    HasAllBonusADOQueryNapravlenie_2: TStringField;
    HasAllBonusADOQueryNapravlenie_3: TStringField;
    HasAllBonusADOQueryNom_putevogo_lista: TIntegerField;
    HasAllBonusADOQueryPutev_list_seriya: TStringField;
    HasAllBonusADOQueryBetweenOnEnd: TDateTimeField;
    HasAllBonusADOQueryBetweenSetOn: TDateTimeField;
    HasAllBonusADOQueryBetweenStartSet: TDateTimeField;
    HasAllBonusADOQueryBetweenOnEndColor: TStringField;
    HasAllBonusADOQueryBetweenSetOnColor: TStringField;
    HasAllBonusADOQueryBetweenStartSetColor: TStringField;
    HasAllBonusADOQueryBetweenSetEnd: TDateTimeField;
    HasAllBonusADOQueryBetweenSetEndColor: TStringField;
    HasAllBonusADOQueryViewSetEndLong: TIntegerField;
    HasAllBonusADOQuerycvet_obshepriz: TStringField;
    HasAllBonusADOQuerycvet_so_skidkoi: TStringField;
    HasAllBonusADOQueryobshepriz_chislo: TIntegerField;
    HasAllBonusADOQueryobshepriz_schyotchik: TIntegerField;
    HasAllBonusADOQuerysimv_avtom_ustan: TIntegerField;
    HasAllBonusADOQueryschit_okon_posl_kon_sekt: TIntegerField;
    HasAllBonusADOQueryvr_smeny_dispetcherov: TStringField;
    HasAllBonusADOQueryuse_bonus3: TIntegerField;
    HasAllBonusADOQueryuse_bonus4: TIntegerField;
    HasAllBonusADOQueryPrizovoe_kolichestvo_4: TIntegerField;
    HasAllBonusADOQuerypval: TIntegerField;
    HasAllBonusDS: TDataSource;
    HasAllBonusADOQueryDAYLY_SALE: TBCDField;
    HasAllBonusADOQueryMIN_DEBET: TBCDField;
    DriversPrmDSP: TDataSetPost;
    DataSetPost1: TDataSetPost;
    DataSetPost2: TDataSetPost;
    HasAllBonusADOQueryview_bonuses: TIntegerField;
    HasAllBonusADOQueryview_ab_bonuses: TIntegerField;
    HasAllBonusADOQueryuse_ab_account: TIntegerField;
    HasAllBonusADOQuerydb_version: TIntegerField;
    HasAllBonusADOQueryuse_dr_priority: TIntegerField;
    HasAllBonusADOQuerydir_dr_autoset: TIntegerField;
    HasAllBonusADOQueryauto_order_arhive: TIntegerField;
    HasAllBonusADOQuerylast_arh_date: TDateTimeField;
    HasAllBonusADOQuerymin_days_delta: TIntegerField;
    HasAllBonusADOQuerysectors_wbroadcast: TStringField;
    HasAllBonusADOQueryuse_sect_wbroadcast: TIntegerField;
    HasAllBonusADOQueryhas_sect_wbroadcast: TIntegerField;
    HasAllBonusADOQuerysync_busy_accounting: TIntegerField;
    HasAllBonusADOQuerycurr_mob_version: TIntegerField;
    HasAllBonusADOQuerymin_mob_version: TIntegerField;
    HasAllBonusADOQuerymandatory_update: TIntegerField;
    HasAllBonusADOQueryaddit_rem_params: TStringField;
    HasAllBonusADOQueryGPS_SRV_ADR: TStringField;
    HasAllBonusADOQueryforders_wbroadcast: TStringField;
    HasAllBonusADOQueryuse_ford_wbroadcast: TIntegerField;
    HasAllBonusADOQueryhas_ford_wbroadcast: TIntegerField;
    HasAllBonusADOQueryto_show_fords: TSmallintField;
    HasAllBonusADOQueryclsms_ordground: TSmallintField;
    HasAllBonusADOQuerysend_wait_info: TSmallintField;
    HasAllBonusADOQuerysend_prev_wait: TSmallintField;
    HasAllBonusADOQueryuse_dr_balance_counter: TIntegerField;
    HasAllBonusADOQuerydont_reset_dr_queue: TSmallintField;
    HasAllBonusADOQueryodirect_to_dsect: TSmallintField;
    HasAllBonusADOQueryftime_tariff: TBCDField;
    HasAllBonusADOQueryrecalc_on_timeset: TSmallintField;
    HasAllBonusADOQuerydrcalc_start_date: TWideStringField;
    HasAllBonusADOQueryorder_sort_dr_assign: TSmallintField;
    HasAllBonusADOQuerytmeter_tariff: TBCDField;
    HasAllBonusADOQuerytaropt_accounting: TSmallintField;
    HasAllBonusADOQueryautotarif_by_driver: TSmallintField;
    HasAllBonusADOQueryovertar_by_driver: TSmallintField;
    HasAllBonusADOQueryautotarif_by_tplan: TSmallintField;
    HasAllBonusADOQueryday_payment: TBCDField;
    HasAllBonusADOQuerymanual_day_sale: TSmallintField;
    HasAllBonusADOQuerydayli_pay_time_offset: TIntegerField;
    HasAllBonusADOQuerynew_wperiod_opercent: TBCDField;
    HasAllBonusADOQuerycheck_net_time: TSmallintField;
    HasAllBonusADOQuerylast_net_time: TDateTimeField;
    HasAllBonusADOQuerytest_phone: TStringField;
    HasAllBonusADOQuerydisp_phone: TStringField;
    HasAllBonusADOQuerymanager_phone: TStringField;
    HasAllBonusADOQuerycall_demon_locsip_name: TStringField;
    HasAllBonusADOQuerycall_demon_netsip_name: TStringField;
    HasAllBonusADOQuerydemon_call_ctx: TStringField;
    HasAllBonusADOQuerydemon_call_virtext: TStringField;
    HasAllBonusADOQuerydemon_call_priority: TStringField;
    HasAllBonusADOQuerydemon_call_timeout: TStringField;
    HasAllBonusADOQuerydemon_callerid: TStringField;
    HasAllBonusADOQueryclord_sort_dassign: TSmallintField;
    HasAllBonusADOQuerymax_clrereg_cnt: TSmallintField;
    HasAllBonusADOQueryfix_order_pay_with_daily_pay: TSmallintField;
    HasAllBonusADOQueryclsms_onplaceto: TSmallintField;
    BadPhoneRelADOTable: TADOTable;
    HasAllBonusADOQuerydont_show_auto_count: TSmallintField;
    HasAllBonusADOQuerydont_show_auto_coords: TSmallintField;
    HasAllBonusADOQuerydont_show_driver_info: TSmallintField;
    HasAllBonusADOQueryauto_bsector_longorders: TSmallintField;
    HasAllBonusADOQueryauto_bsectorid_longorders: TIntegerField;
    HasAllBonusADOQueryauto_bsector_longtime: TIntegerField;
    HasAllBonusADOQueryauto_bsector_onlineorders: TSmallintField;
    HasAllBonusADOQueryauto_bsectorid_onlineorders: TIntegerField;
    HasAllBonusADOQueryauto_bsector_onlinetime: TIntegerField;
    HasAllBonusADOQueryauto_neardriver_onlineorders: TSmallintField;
    HasAllBonusADOQueryauto_neardriver_onlinetime: TIntegerField;
    HasAllBonusADOQueryneardriver_online_byord_geocode: TSmallintField;
    HasAllBonusADOQueryauto_neardriver_allorders: TSmallintField;
    HasAllBonusADOQueryauto_neardriver_alltime: TIntegerField;
    HasAllBonusADOQueryneardriver_all_byord_geocode: TSmallintField;
    HasAllBonusADOQueryclsms_offlinedr_assign: TSmallintField;
    HasAllBonusADOQueryuse_kladr: TSmallintField;
    HasAllBonusADOQuerykladr_object_code: TStringField;
    KLADRCITYDS: TDataSource;
    KLADRCITYADOTable: TADODataSet;
    HasAllBonusADOQuerycurrency_short: TStringField;
    HasAllBonusADOQuerystate_phone_code: TStringField;
    HasAllBonusADOQueryuse_fordbroadcast_priority: TSmallintField;
    HasAllBonusADOQueryauto_bsect_notmanual_ord: TSmallintField;
    HasAllBonusADOQueryauto_close_client_canceling: TSmallintField;
    HasAllBonusADOQueryauto_close_clcancel_time: TIntegerField;
    HasAllBonusADOQuerysip1_robot_active_time: TDateTimeField;
    HasAllBonusADOQuerysip2_robot_active_time: TDateTimeField;
    HasAllBonusADOQueryrobot_active_time_interval: TIntegerField;
    HasAllBonusADOQueryreplace_sms_with_robot: TSmallintField;
    HasAllBonusADOQueryuse_call_robot: TSmallintField;
    HasAllBonusADOQuerystart_first_song_code: TIntegerField;
    HasAllBonusADOQueryonplace_first_song_code: TIntegerField;
    HasAllBonusADOQueryweb_protected_code: TStringField;
    HasAllBonusADOQueryauto_arh_empty_orders: TSmallintField;
    HasAllBonusADOQueryno_percent_before: TSmallintField;
    HasAllBonusADOQueryno_percent_before_summ: TBCDField;
    HasAllBonusADOQueryno_percent_before_payment: TBCDField;
    HasAllBonusADOQueryuse_prize_reserved_limit: TSmallintField;
    HasAllBonusADOQueryprize_reserved_limit: TIntegerField;
    HasAllBonusADOQueryprize_reward_summ: TBCDField;
    HasAllBonusADOQuerylock_reserv_on_limit: TSmallintField;
    HasAllBonusADOQueryfirst_trip_bonus: TBCDField;
    HasAllBonusADOQuerytrip_bonus: TBCDField;
    HasAllBonusADOQuerypercent_bonus_min_summ: TBCDField;
    HasAllBonusADOQuerybonus_percent: TBCDField;
    HasAllBonusADOQuerylock_free_orders_info: TSmallintField;
    HasAllBonusADOQueryuse_drivers_rating: TSmallintField;
    HasAllBonusADOQuerybase_referral_bonus: TBCDField;
    HasAllBonusADOQuerybase_ref_bonus_interval: TIntegerField;
    HasAllBonusADOQueryold_order_rating_bonus: TBCDField;
    HasAllBonusADOQueryorder_rating_bonus: TBCDField;
    HasAllBonusADOQuerypeak_one_start: TWideStringField;
    HasAllBonusADOQuerypeak_one_lenght: TSmallintField;
    HasAllBonusADOQuerypeak_one_bonus: TBCDField;
    HasAllBonusADOQuerypeak_two_start: TWideStringField;
    HasAllBonusADOQuerypeak_two_lenght: TSmallintField;
    HasAllBonusADOQuerypeak_two_bonus: TBCDField;
    HasAllBonusADOQuerypeak_three_start: TWideStringField;
    HasAllBonusADOQuerypeak_three_lenght: TSmallintField;
    HasAllBonusADOQuerypeak_three_bonus: TBCDField;
    HasAllBonusADOQuerybase_referral_cashback: TBCDField;
    HasAllBonusADOQueryorder_late_rating_fine: TBCDField;
    HasAllBonusADOQueryorder_refusal_rating_fine: TBCDField;
    HasAllBonusADOQueryorder_refusal_balance_fine: TBCDField;
    HasAllBonusADOQueryold_order_time: TIntegerField;
    HasAllBonusADOQueryorder_late_rating_time: TIntegerField;
    HasAllBonusADOQueryorder_refusal_rating_time: TIntegerField;
    HasAllBonusADOQueryorder_rating_bonus_time: TIntegerField;
    HasAllBonusADOQueryold_order_rbonus_time: TIntegerField;
    HasAllBonusADOQuerypeak_one_bonus_time: TIntegerField;
    HasAllBonusADOQuerypeak_two_bonus_time: TIntegerField;
    HasAllBonusADOQuerypeak_three_bonus_time: TIntegerField;
    HasAllBonusADOQueryreferral_rbonus_expire: TIntegerField;
    HasAllBonusADOQueryrating_pretendent_sorting: TSmallintField;
    HasAllBonusADOQueryauto_detect_sector_by_addr: TSmallintField;
    HasAllBonusADOQuerygeocode_default_prefix: TStringField;
    HasAllBonusADOQueryauto_detect_driver_sector: TSmallintField;
    HasAllBonusADOQueryuse_opengts_monitoring: TSmallintField;
    HasAllBonusADOQueryon_gps_signaling: TSmallintField;
    HasAllBonusADOQuerydnts_wait_oth_company: TSmallintField;
    HasAllBonusADOQuerydnts_wait_wtout_company: TSmallintField;
    HasAllBonusADOQueryauto_show_wait_dialog: TSmallintField;
    HasAllBonusADOQuerywait_dlg_with_sectors: TSmallintField;
    HasAllBonusADOQuerydispatcher_phone: TStringField;
    HasAllBonusADOQueryalart_order_confirm: TSmallintField;
    HasAllBonusADOQueryconfirm_lineout_on_exit: TSmallintField;
    HasAllBonusADOQueryhide_other_sect_wait_orders: TSmallintField;
    HasAllBonusADOQuerydont_wait_in_busy_state: TSmallintField;
    HasAllBonusADOQueryshow_all_sectwait_manual: TSmallintField;
    HasAllBonusADOQuerytaxm_block_wtout_onplace: TSmallintField;
    HasAllBonusADOQueryreserved_ip: TStringField;
    HasAllBonusADOQuerystart_free_distance: TIntegerField;
    HasAllBonusADOQuerystart_free_time: TIntegerField;
    HasAllBonusADOQueryauto_assign_driver_by_coords: TSmallintField;
    HasAllBonusADOQueryaass_driver_max_radius: TIntegerField;
    HasAllBonusADOQueryaddr_actualization_time: TIntegerField;
    HasAllBonusADOQueryauto_for_all_tender: TSmallintField;
    HasAllBonusADOQueryauto_for_all_longtime: TIntegerField;
    HasAllBonusADOQueryauto_for_all_empty_sector: TSmallintField;
    HasAllBonusADOQueryshow_region_in_addr: TSmallintField;
    HasAllBonusADOQuerydont_auto_wtout_adr_appr: TSmallintField;
    HasAllBonusADOQueryauto_assign_wait_orders: TSmallintField;
    HasAllBonusADOQueryearly_orders_started_time: TIntegerField;
    HasAllBonusADOQueryautoasg_drby_coord_by_rating: TSmallintField;
    HasAllBonusADOQueryprev_orders_started_time: TIntegerField;
    HasAllBonusADOQueryshow_phone_in_orders: TSmallintField;
    HasAllBonusADOQueryset_manual_addr_change: TSmallintField;
    HasAllBonusADOQueryset_addr_manual_enter: TSmallintField;
    HasAllBonusADOQueryprise_only_online: TSmallintField;
    HasAllBonusADOQueryuse_rating_levels: TSmallintField;
    HasAllBonusADOQuerydont_reset_que_early_complete: TSmallintField;
    HasAllBonusADOQueryauto_set_bonus_value: TBCDField;
    procedure CustCheckTimerTimer(Sender: TObject);
    procedure BoldActivateSystemAction1SystemClosed(Sender: TObject);
    procedure BoldActivateSystemAction1SystemOpened(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure SetEnabledValue(Value: Boolean);
    procedure UserSystemEnter;
    procedure UserSystemExit;
    function GetCurrUserLogin: string;
    procedure SetCurrWorkerAndYourPrivilegies(login: string);
    function GetCurrCustTNum(CustNum: Double): string;
    function GetCurrCustAdress(CustNum: Double): string;
    function GetCurrentArhVal(CustNum: Double): Boolean;
    function GetNextCustNumber: Double;
    procedure RefreshDriverData(AnyWhere: Boolean);
    function SynhroCurrDriver: Boolean;
    //procedure SetLockForAllDrivers;
    function GetOccupedByNum(DrNum: Integer): Boolean;
    function IDByLogin(login: string): Integer;
    function SendSQL(SQL: Widestring): Boolean;
    procedure RefreshStartAndEndSector(CBE: TBoldElement; SID, EID:  Integer);
    function GetNewWayBlankNum: Integer;
    function FindHistByNumber(tnum: string): string;
    procedure AskManipForAll(CheckDrv: Boolean=True);
    procedure ResetSelfAskAttr;
    function HasSelfAskAttr: Boolean;
    function CurrUserLoginName: string;
    function HasAllCounterOverflow: Boolean;
    function HasBonusByNumber(Number: string): Integer;
    procedure AskManipForAllWithMe(CheckDrv: Boolean=True);
    function GetIPersByNum(num: Integer): Integer;
    function GetNewIPersNum: Integer;
    function HasBonusByIndNumber(INumber: Integer): Integer;
    function FindHistByIndNumber(inum: Integer): Integer;
    function HasIndAllCounterOverflow: Boolean;
    function HasINumPourPhone(phone: string): string;
    function HasSelfAskRemoteAttr: Boolean;
    function SetLocalDrSumm(DrNum: Integer; DrSumm: Double): Integer;
    function GetLocalDrSumm(DrNum: Integer): Double;
    function SetLocalDrDynBal(DrNum: Integer; DrSumm: Double): Integer;
    function GetLocalDrDynBal(DrNum: Integer): Double;
    function SetLocalDrUseDynBal(DrNum, IRC: Integer): Boolean;
    function GetLocalDrUseDynBal(DrNum: Integer): Boolean;
    function SetLocalDrHasAEvs(DrNum, IRC: Integer): Boolean;
    function GetLocalDrHasAEvs(DrNum: Integer): Boolean;
    function SetLocalDrRemoteCl(DrNum, IRC: Integer): Boolean;
    function GetLocalDrRemoteCl(DrNum: Integer): Boolean;
    function SetLocalDrRemoteSet(DrNum, IRC: Integer): Boolean;
    function GetLocalDrRemoteSet(DrNum: Integer): Integer;
    function SetLocalDrLastOrd(DrNum: Integer; LastOrd: TDateTime): Boolean;
    function GetLocalDrLastOrd(DrNum: Integer): TDateTime;
    function SetLocalDrLastStatTime(DrNum: Integer; LastStatTime: TDateTime): Boolean;
    function GetLocalDrLastStatTime(DrNum: Integer): TDateTime;
    function SetLocalDrBusy(DrNum, DrBusyVal: Integer): Boolean;
    function GetLocalDrBusy(DrNum: Integer): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    RefreshState: Boolean;
    CurrLogin: string;
  end;

var
  BoldModelDM: TBoldModelDM;
  IniFile: TIniFile;
  hasAtt: Boolean=False;
  FindSectorNum: Integer;
  CheckDrv: Boolean=False;
  EnablePrevFind: Boolean=True;
  BadAdr: string;
  BonusPercent, IndBonusPercent, BonusPercent1, BonusPercent2, BonusPercent3, BonusPercentAll: Double;
  CallCount, BonusCount, IndCallCount, IndBonusCount: Integer;
  DrSumms: array[1..99999] of Double;
  DrDynBals: array[1..99999] of Double;
  DrUseDBals:  array[1..99999] of Boolean;
  DrHasActEvs:  array[1..99999] of Boolean;
  DrRemoteCl:  array[1..99999] of Boolean;
  DrRSets: array[1..99999] of Integer;
  DrLastOrders: array[1..99999] of TDateTime;
  DrLastStatTime: array[1..99999] of TDateTime;
  DrBusy:  array[1..99999] of Boolean;
  ActiveCount, BusyCount, OnLaunchCount: Integer;
implementation

{$R *.dfm}

uses MainForm, Dialogs, BoldOtherHandlCompUnit, HandlesDM, BusinessClasses,
  ReleaseStructUnit, ADODMUnit, MainModeSelectUnit,
  SystemEnumsUnit;

function TBoldModelDM.HasINumPourPhone(phone: string): string;
var res: string;
begin
  res:='';

  INumPourPhoneADOQuery.Active:=False;
  INumPourPhoneADOQuery.Parameters[0].Value:=
    phone;
  try
    INumPourPhoneADOQuery.Active:=True;
    if INumPourPhoneADOQuery.RecordCount=1 then
    begin
     if INumPourPhoneADOQuery.FieldByName('korpus').AsInteger>0  then
      res:=
        IntToStr(INumPourPhoneADOQuery.FieldByName('korpus').AsInteger);
    end
    else if INumPourPhoneADOQuery.RecordCount>1 then
       begin
         res:=
          IntToStr(INumPourPhoneADOQuery.FieldByName('korpus').AsInteger);
        //ShowMessage('�������, � ��� ��������� ����������� ������� � ��������� ���� ������� ��������, ��������� ���������� ����������� �������!')
       end
    else
      begin
      end;
  except
    ShowMessage('��������� ����������� ������� �� ����� �������� �� ����������� ������!');
  end;
  Result:=res;
end;

function TBoldModelDM.HasIndAllCounterOverflow: Boolean;
var res: Boolean;
begin
  res:=False;
  if not (IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
  begin
  try
    HasAllBonusADOQuery.Active:=
      False;
    HasAllBonusADOQuery.Active:=
      True;

  except
    ShowMessage('��������� ������ ������� ������������ ������ � ���� �� ���. ������ ��������!');
  end;
  end; 
  Result:=
     res;
end;

function TBoldModelDM.FindHistByIndNumber(inum: Integer): Integer;
var res: Integer;
begin
res:=0;

if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
 begin

 end
else
  begin

  try
    HistoryINumADOQuery.Active:=False;
    HistoryINumADOQuery.Parameters[0].Value:=inum;
    HistoryINumADOQuery.Active:=True;
    if HistoryINumADOQuery.RecordCount>0 then
     begin
      res:=HistoryINumADOQuery.FindField('OrderCount').asInteger;
      {try
        SectorByIDADOQuery.Active:=False;
        SectorByIDADOQuery.Parameters[0].Value:=
          HistoryTNumADOQuery.FindField('otnositsya_k_sektoru').asInteger;
        SectorByIDADOQuery.Active:=True;
        if SectorByIDADOQuery.RecordCount>0 then
          FindSectorNum:=
            SectorByIDADOQuery.FindField('nomer_sektora').asInteger;
      except
        ShowMessage('��������� ������ ������� ��������� �������!');
      end;  }
     end;
  except
    ShowMessage('��������� ������ ���������� ������ �� ��������������� ������ ��������!');
  end;
 end;
Result:=res;
end;

function TBoldModelDM.HasBonusByIndNumber(INumber: Integer): Integer;
var res: Integer;
begin
  res:=-1;
  if not (IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
  begin
  FindHistByIndNumber(INumber);
  HasIndAllCounterOverflow;
  //ShowMessage(IntToSTr(HistoryINumADOQuery.FieldByName('OrderCount').AsInteger));
  if HistoryINumADOQuery.RecordCount>0 then
    begin
      if (HistoryINumADOQuery.FieldByName('OrderCount').AsInteger>0) then
        if (HasAllBonusADOQuery.FieldByName('Ispoljz_priz_1').AsInteger<>0) then
         begin
          if ((HistoryINumADOQuery.FieldByName('OrderCount').AsInteger) mod
           (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_1').AsInteger))=0 then
             begin
               res:=1;
               IndBonusPercent:=1;
             end
           else
             begin
              if HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_1').AsInteger>0 then
               IndBonusPercent:=((HistoryINumADOQuery.FieldByName('OrderCount').AsInteger) mod
                 (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_1').AsInteger))/HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_1').AsInteger
              else
               IndBonusPercent:=0;
             end;
            IndCallCount:=HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_1').AsInteger;
            IndBonusCount:=HistoryINumADOQuery.FieldByName('OrderCount').AsInteger;
          end
        else if (HasAllBonusADOQuery.FieldByName('Ispoljz_priz_2').AsInteger<>0) then
         begin
          if ((HistoryINumADOQuery.FieldByName('OrderCount').AsInteger) mod
           (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_2').AsInteger))=0 then
             begin
               res:=2;
               IndBonusPercent:=1;
             end
           else
             begin
              if HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_2').AsInteger>0 then
               IndBonusPercent:=((HistoryINumADOQuery.FieldByName('OrderCount').AsInteger) mod
                 (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_2').AsInteger))/HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_2').AsInteger
              else
               IndBonusPercent:=0;
             end;
            IndCallCount:=HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_2').AsInteger;
            IndBonusCount:=HistoryINumADOQuery.FieldByName('OrderCount').AsInteger;
          end
        {else if (HasAllBonusADOQuery.FieldByName('Ispoljz_priz_3').AsInteger<>0) then
         begin
          if ((HistoryINumADOQuery.FieldByName('OrderCount').AsInteger) mod
           (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_3').AsInteger))=0 then
             begin
               res:=3;
               IndBonusPercent:=1;
             end
           else
             begin
              if HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_3').AsInteger>0 then
               IndBonusPercent:=((HistoryINumADOQuery.FieldByName('OrderCount').AsInteger) mod
                 (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_3').AsInteger))/HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_3').AsInteger
              else
               IndBonusPercent:=0;
             end;
            IndCallCount:=HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_3').AsInteger;
            IndBonusCount:=HistoryINumADOQuery.FieldByName('OrderCount').AsInteger;
          end }
         else
           begin
           end;
    end;
   end; 
   Result:=
     res; 
end;

function TBoldModelDM.GetNewIPersNum: Integer;
begin
  Result:=-1;
  try
    NewINumADOQuery.Active:=False;
    NewINumADOQuery.Active:=True;
    if NewINumADOQuery.RecordCount>0 then
      begin
       if NewINumADOQuery.FindField('new_in').AsVariant=
         NULL then
           Result:=1
       else
           Result:=
             NewINumADOQuery.FindField('new_in').AsInteger;
      end;

  except
    ShowMessage('��������� ������ ������ ������������� ������ ��������!');
  end;
end;

function TBoldModelDM.GetIPersByNum(num: Integer): Integer;
begin
  Result:=0;
  IPersPerINumADOQuery.Active:=False;
  IPersPerINumADOQuery.Parameters[0].Value:=
    num;
  try
    IPersPerINumADOQuery.Active:=True;
    if IPersPerINumADOQuery.RecordCount=0 then
      Result:=num
    else
      Result:=-1;
  except
    ShowMessage('��������� ������ �������� �� ��� ��������������� ������!');
  end;
end;

function TBoldModelDM.HasAllCounterOverflow: Boolean;
var res: Boolean;
begin
  res:=False;
  if not (IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
  begin
  try
    HasAllBonusADOQuery.Active:=
      False;
    HasAllBonusADOQuery.Active:=
      True;
   if HasAllBonusADOQuery.FindField('obshepriz_chislo').AsInteger>0 then
   begin

    if HasAllBonusADOQuery.FindField('obshepriz_chislo').AsInteger<
       HasAllBonusADOQuery.FindField('obshepriz_schyotchik').AsInteger then
       begin
        //ReleaseStructForm.ProgressBar1.Position:=ReleaseStructForm.ProgressBar1.Max;
        ReleaseStructForm.Gauge.Max:=
          HasAllBonusADOQuery.FindField('obshepriz_chislo').AsInteger;
        ReleaseStructForm.Gauge.Position:=
          ReleaseStructForm.Gauge.Max;
       end
    else
      begin
         ReleaseStructForm.Gauge.Position:=
            HasAllBonusADOQuery.FindField('obshepriz_schyotchik').AsInteger;
       end;
     if (HasAllBonusADOQuery.FindField('pval').AsInteger<0)
       and not (HasAllBonusADOQuery.FindField('obshepriz_chislo').AsInteger=0)  then
      begin
        res:=
          True;
      end;
   end;   
  except
    ShowMessage('��������� ������ ������� ������������ ������ � ����!');
  end;
  end;
  Result:=
     res;
end;

function TBoldModelDM.HasBonusByNumber(Number: string): Integer;
var res: Integer;
begin
  res:=-1;
  if not (IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
  begin
  FindHistByNumber(Number);
  HasAllCounterOverflow;
  if HistoryTNumADOQuery.RecordCount>0 then
    begin

      if (HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger>0) then
        begin

        if (HasAllBonusADOQuery.FieldByName('Ispoljz_priz_1').AsInteger<>0) then
         begin
          if ((HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger) mod
           (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_1').AsInteger))=0 then
             begin
               res:=1;
               BonusPercent:=1;
               CallCount:=HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_1').AsInteger;
               BonusCount:=HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger;
             end
           else
             begin
              if HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_1').AsInteger>0 then
               BonusPercent:=((HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger) mod
                 (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_1').AsInteger))/HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_1').AsInteger
              else
               BonusPercent:=0;
             end;

          end;

        if (HasAllBonusADOQuery.FieldByName('Ispoljz_priz_2').AsInteger<>0) then
         begin
          if ((HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger) mod
           (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_2').AsInteger))=0 then
             begin
               res:=2;
               BonusPercent:=1;
               CallCount:=HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_2').AsInteger;
               BonusCount:=HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger;
             end
           else
             begin
              if HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_2').AsInteger>0 then
               BonusPercent:=((HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger) mod
                 (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_2').AsInteger))/HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_2').AsInteger
              else
               BonusPercent:=0;
             end;

          end;

        if (HasAllBonusADOQuery.FieldByName('use_bonus3').AsInteger<>0) then
         begin
          if ((HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger) mod
           (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_3').AsInteger))=0 then
             begin
               res:=3;
               BonusPercent:=1;
               CallCount:=HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_3').AsInteger;
               BonusCount:=HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger;
             end
           else
             begin
              if HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_3').AsInteger>0 then
               BonusPercent:=((HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger) mod
                 (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_3').AsInteger))/HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_3').AsInteger
              else
               BonusPercent:=0;
             end;
           end;

         if (HasAllBonusADOQuery.FieldByName('use_bonus4').AsInteger<>0) then
         begin
          if ((HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger) mod
           (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_4').AsInteger))=0 then
             begin
               res:=4;
               BonusPercent:=1;
               CallCount:=HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_4').AsInteger;
               BonusCount:=HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger;
             end
           else
             begin
              if HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_4').AsInteger>0 then
               BonusPercent:=((HistoryTNumADOQuery.FieldByName('Summarn_chislo_vyzovov').AsInteger) mod
                 (HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_4').AsInteger))/HasAllBonusADOQuery.FieldByName('Prizovoe_kolichestvo_4').AsInteger
              else
               BonusPercent:=0;
             end;
            end;

          end;
    end;
   end;
   Result:=
     res; 
end;

procedure TBoldModelDM.AskManipForAll(CheckDrv: Boolean=True);
begin
FirstForm.StatusBar.Panels[2].Text:='��������� ��������';
 if not (IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
  if IniFile.ReadString('BUSINESS_DATA','check_refresh_by_ask','NO')='YES' then
   if CheckDrv then
   begin
    if not SendSQL('UPDATE Personal SET EstjVneshnieManip=1, Prover_vodit=1 where'+
      ' (login<>'''+CurrUserLoginName+''')')
     then
              ShowMessage('��������� ���������� �� ��������� ���������������� ������!');
   end
  else
    begin
      if not SendSQL('UPDATE Personal SET EstjVneshnieManip=1 where'+
      ' (login<>'''+CurrUserLoginName+''')')
     then
              ShowMessage('��������� ���������� �� ��������� ���������������� ������!');

    end;
  ReleaseStructForm.RefreshStack;
end;

procedure TBoldModelDM.AskManipForAllWithMe(CheckDrv: Boolean=True);
begin
FirstForm.StatusBar.Panels[2].Text:='��������� ��������';
 if not (IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
  if IniFile.ReadString('BUSINESS_DATA','check_refresh_by_ask','NO')='YES' then
   if CheckDrv then
   begin
    if not SendSQL('UPDATE Personal SET EstjVneshnieManip=1, Prover_vodit=1 ')
     then
              ShowMessage('��������� ���������� �� ��������� ���������������� ������!');
   end
  else
    begin
      if not SendSQL('UPDATE Personal SET EstjVneshnieManip=1 ')
     then
              ShowMessage('��������� ���������� �� ��������� ���������������� ������!');

    end;
  ReleaseStructForm.RefreshStack;
end;

procedure TBoldModelDM.ResetSelfAskAttr;
begin
  if not SendSQL('UPDATE Personal SET EstjVneshnieManip=0, Prover_vodit=0 where'+
    ' login='''+CurrUserLoginName+'''') then
              ShowMessage('��������� ����� �������� ������� ��������� ����� ������ ��� �������� ������������!');
end;

function TBoldModelDM.HasSelfAskRemoteAttr: Boolean;
var res: Boolean;
begin
 CheckDrv:=False;
 //res:=False;
 if (IniFile.ReadString('���������_��������',
  '�����_���������_��������_�����_��������','NO')='YES') and
    BoldModelDM.ADOConnection.Connected then
  begin
  res:=False;
  try
    CurrUserADOQuery.Active:=False;
    CurrUserADOQuery.Active:=True;
    if CurrUserADOQuery.FindField('HasRemOrdChanges')
      .AsInteger=1 then
        begin
          res:=True;
        end;

  except
    ShowMessage('��������� ������ ������� ��������� ����� ������ �� �������� ������������!');
  end;
  end
   else
     res:=False;
 Result:=res;
end;

function TBoldModelDM.HasSelfAskAttr: Boolean;
var res: Boolean;
begin
 CheckDrv:=False;
 res:=False;
 if (IniFile.ReadString('BUSINESS_DATA','check_refresh_by_ask','NO')='YES') and
    BoldModelDM.ADOConnection.Connected then
  begin
  res:=False;
  try
    CurrUserADOQuery.Active:=False;
    CurrUserADOQuery.Active:=True;
    if CurrUserADOQuery.FindField('Prover_vodit')
      .AsInteger=1 then
        begin
          CheckDrv:=True;
        end;
    if CurrUserADOQuery.FindField('EstjVneshnieManip')
      .AsInteger=1 then
        begin
          res:=True;
        end;

  except
    ShowMessage('��������� ������ ������� ��������� ����� ������ �� �������� ������������!');
  end;
  end;
 Result:=res;
end;

function TBoldModelDM.CurrUserLoginName: string;
begin
  Result:=
    (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Login;
end;

function TBoldModelDM.FindHistByNumber(tnum: string): string;
var res: string;
begin
res:='';
FindSectorNum:=-1;
if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
 begin

 end
else
  begin

  try
    HistoryTNumADOQuery.Active:=False;
    HistoryTNumADOQuery.Parameters[0].Value:=tnum;
    HistoryTNumADOQuery.Active:=True;
    if HistoryTNumADOQuery.RecordCount>0 then
     begin
      res:=HistoryTNumADOQuery.FindField('Adres_vyzova_vvodim').asString;
      try
        SectorByIDADOQuery.Active:=False;
        SectorByIDADOQuery.Parameters[0].Value:=
          HistoryTNumADOQuery.FindField('otnositsya_k_sektoru').asInteger;
        SectorByIDADOQuery.Active:=True;
        if SectorByIDADOQuery.RecordCount>0 then
          FindSectorNum:=
            SectorByIDADOQuery.FindField('nomer_sektora').asInteger;
      except
        ShowMessage('��������� ������ ������� ��������� �������!');
      end;
     end;
  except
    ShowMessage('��������� ������ �� ������� ������ � ����!');
  end;
 end;
Result:=res;
end;

function TBoldModelDM.GetNewWayBlankNum: Integer;
var res: Integer;
begin
res:=0;
if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
  begin

  end
else
  begin
    if UnionOADOTable.Active then
      begin
        if UnionOADOTable.RecordCount>0 then
          begin
            res:=UnionOADOTable.FieldByName('Nom_putevogo_lista').AsInteger;
            //UnionOADOTable.FieldByName('Nom_putevogo_lista').Value:=
            //  UnionOADOTable.FieldByName('Nom_putevogo_lista').AsInteger+1;
            if not SendSQL('UPDATE Objekt_vyborki_otchyotnosti SET Nom_putevogo_lista=Nom_putevogo_lista+1') then
              ShowMessage('��������� ������������� ������ �������� �����!');
            try
              UnionOADOTable.Active:=False;
              UnionOADOTable.Active:=True;
            except
              ShowMessage('������ ���������� ������� ��������!');
            end;
          end
        else
          begin
            ShowMessage('������ - ������ ������� ��������!');
          end;
      end
    else
      ShowMessage('������ - ���������� ������� ��������!');
  end;
Result:=res;
end;

procedure TBoldModelDM.RefreshStartAndEndSector(CBE: TBoldElement; SID, EID:  Integer);
begin
  {try
    SectorByIDADOQuery.Parameters[0].Value:=SID;
    SectorByIDADOQuery.Active:=False;
    SectorByIDADOQuery.Active:=True;
    if SectorByIDADOQuery.RecordCount=1 then
    begin
    BoldHandlesDM.bvhSectorCode.Value.SetAsVariant(SectorByIDADOQuery.FindField('kod_sektora').AsString);
    if BoldHandlesDM.blhSectorByCode.List.Count=1 then
      begin
        if (BoldHandlesDM.blhSectorByCode.CurrentElement as TSektor_raboty)<>
          (CBE  as TZakaz).adres_sektora then
          begin
            (CBE  as TZakaz).adres_sektora:=
              (BoldHandlesDM.blhSectorByCode.CurrentElement as TSektor_raboty);
          end;  
      end
    else
      ShowMessage('�� ������ ������ ��� �������� ����� ������ � ����� - '+SectorByIDADOQuery.FindField('kod_sektora').AsString);
    end
      else
        begin
          if SID>0 then
           begin
            ShowMessage('� ���� ���������� ����� ������ ������� ��� �� ������, ID - '+IntToStr(SID));
           end; 
        end;

    SectorByIDADOQuery.Parameters[0].Value:=EID;
    SectorByIDADOQuery.Active:=False;
    SectorByIDADOQuery.Active:=True;
    if SectorByIDADOQuery.RecordCount=1 then
    begin
    BoldHandlesDM.bvhSectorCode.Value.SetAsVariant(SectorByIDADOQuery.FindField('kod_sektora').AsString);
    if BoldHandlesDM.blhSectorByCode.List.Count=1 then
      begin
        if (BoldHandlesDM.blhSectorByCode.CurrentElement as TSektor_raboty)<>
          (CBE  as TZakaz).konechnyi_sektor_raboty then
          begin
            (CBE  as TZakaz).konechnyi_sektor_raboty:=
              (BoldHandlesDM.blhSectorByCode.CurrentElement as TSektor_raboty)
          end;  
      end
    else
      ShowMessage('�� ������ ������ ��� �������� ����� ������ � ����� - '+SectorByIDADOQuery.FindField('kod_sektora').AsString);
    end
      else
        begin
          if EID>0 then
           begin
             ShowMessage('� ���� ���������� ����� ������ ������� ��� �� ������, ID - '+IntToStr(EID));
           end; 
        end;
  except
    ShowMessage('��������� ��������� ������� �������!');
  end;  }
end;

function TBoldModelDM.SendSQL(SQL: Widestring): Boolean;
var res: Boolean;
begin
  res:=True;
  try
    MainADOCommand.CommandText:=SQL;
    MainADOCommand.Execute;
    //MainADOCommand.
  except
    res:=False;
  end;
  Result:=res;
end;

function TBoldModelDM.IDByLogin(login: string): Integer;
var res: Integer;
begin
  res:=-1;
  try
    PersonaIDByLoginADOQuery.Parameters[0].Value:=
      login;
    PersonaIDByLoginADOQuery.Active:=False;
    PersonaIDByLoginADOQuery.Active:=True;

    if PersonaIDByLoginADOQuery.RecordCount=1 then
      begin
        res:=PersonaIDByLoginADOQuery.FindField('BOLD_ID').AsInteger;
      end
    else
      ShowMessage('�� ������ ��� ����� ���� ������������� � ������� '+login);   

  except
    ShowMessage('��������� ������ ���������� ����� ������� �������!');
  end;
  Result:=res;
end;

function TBoldModelDM.GetOccupedByNum(DrNum: Integer): Boolean;
var res: Boolean;
begin
  res:=False;
  if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
    begin
    end
  else
   begin
    try
      DrActCustADOQuery.Parameters[0].Value:=
        DrNum;
      DrActCustADOQuery.Active:=False;
      DrActCustADOQuery.Active:=True;
      if DrActCustADOQuery.RecordCount>0 then
        res:=True;
    except
      ShowMessage('��������� ������ ���������� ������������� ������ �� ����������!');
    end;
   end;
  Result:=res;
end;

procedure TBoldModelDM.RefreshDriverData(AnyWhere: Boolean);
begin
if BoldModelDM.ADOConnection.Connected then
if CheckDrv or AnyWhere  then
begin
  try
   AllDriverADOTable.Active:=False;
   AllDriverADOTable.Active:=True;
  if AllDriverADOTable.RecordCount>0 then
    begin

      try
      ActiveCount:=0;
      BusyCount:=0;
      OnLaunchCount:=0;
      AllDriverADOTable.First;
      SynhroCurrDriver;
      while not AllDriverADOTable.Eof do
        begin
          AllDriverADOTable.Next;
          SynhroCurrDriver;
        end;

      finally
        FirstForm.basrDrList.Changed;
        FirstForm.bairDrIcon.Changed;
        ReleaseStructForm.BoldTreeView1.Repaint;
        ReleaseStructForm.StatusBar2.Panels[0].Text:=
          TimeToStr(Time)+' �� �����-'+IntToStr(ActiveCount)+
          ', ������-'+IntToStr(BusyCount)+
          ', �� ��������-'+IntToStr(OnLaunchCount)+
          ', ��������-'+IntToStr(ActiveCount-
            BusyCount-OnLaunchCount);
      end;
    end;
    except on E:Exception do
     begin
      ShowMessage('��������� ����������� ������� �� ���������� ������ ���������. ������: '+
        E.Message);
     end;
    end;
end;

ReleaseStructForm.RefreshStack;
end;

function TBoldModelDM.SynhroCurrDriver: Boolean;
var res: Boolean;
begin
res:=True;
  Result:=False;
 if AllDriverADOTable.FindField('pozyvnoi').AsInteger>0 then
 begin
  bvhCurrSyncDriver.Value.SetAsVariant(AllDriverADOTable.FindField('pozyvnoi').AsInteger);
  if blhCurrSyncDriver.List.Count=0 then
    begin
      ShowMessage('����� �� ������������� �������� ����� ��������, �������� - '
        + IntToStr(AllDriverADOTable.FindField('pozyvnoi').AsInteger)+
        '. ������������� �������.');
      Result:=False;
    end
  else if blhCurrSyncDriver.List.Count=1 then
    begin
    
      if (AllDriverADOTable.FindField('v_rabote').AsInteger=0)
         and (blhCurrSyncDriver.CurrentElement as TVoditelj).V_rabote then
        begin
          (blhCurrSyncDriver.CurrentElement as TVoditelj).V_rabote:=
            False;
        end
      else if (AllDriverADOTable.FindField('v_rabote').AsInteger=1)
         and not (blhCurrSyncDriver.CurrentElement as TVoditelj).V_rabote then
        begin
          (blhCurrSyncDriver.CurrentElement as TVoditelj).V_rabote:=
            True;
          end
       else
       begin
       end;

       SetLocalDrRemoteCl(AllDriverADOTable.FindField('pozyvnoi').AsInteger,
        AllDriverADOTable.FindField('ITS_REMOTE_CLIENT').AsInteger);
       SetLocalDrSumm(AllDriverADOTable.FindField('pozyvnoi').AsInteger,
        AllDriverADOTable.FindField('DR_SUMM').AsFloat);
       self.SetLocalDrRemoteSet(AllDriverADOTable.FindField('pozyvnoi').AsInteger,
        AllDriverADOTable.FindField('REMOTE_STATUS').AsInteger);
       self.SetLocalDrDynBal(AllDriverADOTable.FindField('pozyvnoi').AsInteger,
        AllDriverADOTable.FindField('DRIVER_BALANCE').AsFloat);
       self.SetLocalDrUseDynBal(AllDriverADOTable.FindField('pozyvnoi').AsInteger,
        AllDriverADOTable.FindField('use_dyn_balance').AsInteger);
       self.SetLocalDrHasAEvs(AllDriverADOTable.FindField('pozyvnoi').AsInteger,
        AllDriverADOTable.FindField('has_active_events').AsInteger);

       SetLocalDrBusy(AllDriverADOTable.FindField('pozyvnoi').AsInteger,
        AllDriverADOTable.FindField('Zanyat_drugim_disp').AsInteger);

        if (AllDriverADOTable.FindField('Na_pereryve').AsInteger=0)
           and (blhCurrSyncDriver.CurrentElement as
           TVoditelj).Na_pereryve then
        begin
          (blhCurrSyncDriver.CurrentElement as TVoditelj).Na_pereryve:=
            False;
        end
      else if (AllDriverADOTable.FindField('Na_pereryve').AsInteger=1)
           and not (blhCurrSyncDriver.CurrentElement as
           TVoditelj).Na_pereryve then
        begin
          (blhCurrSyncDriver.CurrentElement as TVoditelj).Na_pereryve:=
            True;
        end
      else
        begin
        end;
     if AllDriverADOTable.FindField('rabotaet_na_sektore').AsInteger>=0 then
      begin
       if ((blhCurrSyncDriver.CurrentElement as TVoditelj).
         rabotaet_na_sektore.Nomer_sektora<>
         AllDriverADOTable.FindField('Nomer_posl_sektora').AsInteger) then
         begin
           BoldHandlesDM.bvhSectorCode.Value.SetAsVariant(
           IntToStr(AllDriverADOTable.FindField('Nomer_posl_sektora').AsInteger));
           if BoldHandlesDM.blhSectorByCode.List.Count=1 then
             begin
               (blhCurrSyncDriver.CurrentElement as TVoditelj).
                rabotaet_na_sektore:=
                 (BoldHandlesDM.blhSectorByCode.CurrentElement
                 as TSektor_raboty);
               (blhCurrSyncDriver.CurrentElement as TVoditelj).
                  Nomer_posl_sektora:=
                  (BoldHandlesDM.blhSectorByCode.CurrentElement
                  as TSektor_raboty).Nomer_sektora;
             end
           else if BoldHandlesDM.blhSectorByCode.List.Count>1 then
             begin
               FirstForm.ShowAttention('����� ������ ������� � ���������� ����� , ��� - '
                + IntToStr(AllDriverADOTable.FindField(
                'Nomer_posl_sektora').AsInteger));
               res:=False;
             end
           else
             begin
               FirstForm.ShowAttention('����� �� ������������� �������� ����� ������, ��� - '
                + IntToStr(AllDriverADOTable.FindField(
                'Nomer_posl_sektora').AsInteger)+
                '. ���� � ������ �� �������� �� ���������� ������. ���������� ������. ������������� �������.');
               res:=False;
             end;
         end;
        end
       else
         begin
           if ((blhCurrSyncDriver.CurrentElement as TVoditelj).
            rabotaet_na_sektore<>nil) then
             begin
               BoldHandlesDM.bvhSectorCode.Value.SetAsVariant(
                IntToStr(AllDriverADOTable.FindField(
                'Nomer_posl_sektora').AsInteger));
           if BoldHandlesDM.blhSectorByCode.List.Count=1 then
             begin
               (blhCurrSyncDriver.CurrentElement as TVoditelj).
                rabotaet_na_sektore:=
                 (BoldHandlesDM.blhSectorByCode.CurrentElement
                 as TSektor_raboty);
               (blhCurrSyncDriver.CurrentElement as TVoditelj).
                Nomer_posl_sektora:=
                  (BoldHandlesDM.blhSectorByCode.CurrentElement
                  as TSektor_raboty).Nomer_sektora;
             end
             else if BoldHandlesDM.blhSectorByCode.List.Count>1 then
             begin
               FirstForm.ShowAttention('����� ������ ������� � ���������� ����� , ��� - '
                + IntToStr(AllDriverADOTable.FindField(
                'Nomer_posl_sektora').AsInteger));
               res:=False;
             end
             else
             begin
               FirstForm.ShowAttention('����� �� ������������� �������� ����� ������, ��� - '
                + IntToStr(AllDriverADOTable.FindField(
                'Nomer_posl_sektora').AsInteger)+
                '. ���� � ������ �� �������� �� ���������� ������. ���������� ������. ������������� �������.');
               res:=False;
             end;
             end;
         end;

      self.SetLocalDrLastOrd(AllDriverADOTable.FindField('pozyvnoi').AsInteger,
        AllDriverADOTable.FindField('Vremya_poslednei_zayavki').AsDateTime);
      self.SetLocalDrLastStatTime(AllDriverADOTable.FindField('pozyvnoi').AsInteger,
        AllDriverADOTable.FindField('LAST_STATUS_TIME').AsDateTime);

      if (blhCurrSyncDriver.CurrentElement as TVoditelj).
          Vremya_poslednei_zayavki<>
          AllDriverADOTable.FindField(
          'Vremya_poslednei_zayavki').AsDateTime then
       begin
         (blhCurrSyncDriver.CurrentElement as TVoditelj).
          Vremya_poslednei_zayavki:=
           AllDriverADOTable.FindField(
           'Vremya_poslednei_zayavki').AsDateTime;

       end;

     if (blhCurrSyncDriver.CurrentElement as
      TVoditelj).V_rabote and not
      (blhCurrSyncDriver.CurrentElement as
      TVoditelj).S_klass then
     begin
      ActiveCount:=ActiveCount+1;
      if AllDriverADOTable.FindField('Zanyat_drugim_disp').
      AsInteger<>0 then
        BusyCount:=BusyCount+1;
      if (blhCurrSyncDriver.CurrentElement as
      TVoditelj).Na_pereryve then
        OnLaunchCount:=OnLaunchCount+1;
     end;
     Result:=res;
    end
  else
    begin
      ShowMessage('������ ��������� ��������� � ���������� �������� - '
        + IntToStr(AllDriverADOTable.FindField(
        'pozyvnoi').AsInteger));
      Result:=False;
    end;
 end;
end;

function TBoldModelDM.GetNextCustNumber: Double;
begin
  try
    NextCustNumADOQuery.Active:=False;
    NextCustNumADOQuery.Active:=True;
    NextCustNumADOQuery.ExecSQL;
  except
    ShowMessage('��������� ���������� ������� ������ ���������� ������!');
  end;
  if NextCustNumADOQuery.RecordCount>0 then
    begin
      NextCustNumADOQuery.Last;
      Result:=NextCustNumADOQuery.FindField('nomer_zakaza').AsFloat+1;
    end
  else
    Result:=1;
end;

function TBoldModelDM.GetCurrCustTNum(CustNum: Double): string;
var res: string;
begin
res:='�� ��������';
if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
  begin

  end
  else
  begin
  CurrTNumADOQuery.Parameters.Items[0].Value:=CustNum;
   try
    CurrTNumADOQuery.Active:=False;
    CurrTNumADOQuery.Active:=True;

    if CurrTNumADOQuery.RecordCount>0 then
      res:=CurrTNumADOQuery.FindField('pvalue').AsString;

   except
     ShowMessage('��������� ������ ������ �������� � ����!');
   end;
  end;
  Result:=res;
end;

function TBoldModelDM.GetCurrCustAdress(CustNum: Double): string;
begin
if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
  begin
    Result:='';
  end
  else
  begin
  CurrAdressADOQuery.Parameters.Items[0].Value:=CustNum;
  CurrAdressADOQuery.Active:=False;
  CurrAdressADOQuery.Active:=True;
  CurrAdressADOQuery.ExecSQL;
  if CurrAdressADOQuery.RecordCount>0 then
    Result:=CurrAdressADOQuery.FindField('pvalue').AsString
  else
    Result:='�� ��������';
  end;  
end;

function TBoldModelDM.GetCurrentArhVal(CustNum: Double): Boolean;
begin
if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
  Result:=False
 else
  begin
  CurrArhValADOQuery.Parameters.Items[0].Value:=CustNum;
  CurrArhValADOQuery.Active:=False;
  CurrArhValADOQuery.Active:=True;
  CurrArhValADOQuery.ExecSQL;
  if CurrArhValADOQuery.RecordCount>0 then
    Result:=Boolean(CurrArhValADOQuery.FindField('pvalue').AsInteger)
  else
    Result:=True;
  end;  
end;

procedure TBoldModelDM.DataModuleCreate(Sender: TObject);
var i: Integer;
begin
  //bphXML.FileName:=GetCurrentDir+'\TaxiManageDB_DATA.xml';
  ADOConnection.connected:=False;
  ADOConnection.ConnectionString:='FILE NAME='+CDP+'\TaxiDispatcher.udl';
  ADOConnection.LoginPrompt:=True;
  
  IniFile:= TIniFile.Create(GetCurrentDir+'\TaxiDispatcher.ini');
  if IniFile.ReadString('BUSINESS_DATA','disable_main_mode_ask','NO')='YES' then
    FirstForm.N29.Checked:=False
  else
    FirstForm.N29.Checked:=True;

  if IniFile.ReadString('BUSINESS_DATA','scan_phone_line','NO')='YES' then
    FirstForm.ModemActivitiToolButton.ImageIndex:=22
  else
    FirstForm.ModemActivitiToolButton.ImageIndex:=23;

  if Length(IniFile.ReadString('BUSINESS_DATA',
  '���������_��������_����',
    ''))>0 then
    begin
      MainForm.FirstForm.Caption := IniFile.ReadString(
        'BUSINESS_DATA','���������_��������_����',
        '');
    end;

  //if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
  //  bsh.PersistenceHandle:=bphXML
  //else
  // begin
  bsh.PersistenceHandle:=bph;
  // end;

   for i:=0 to 99999 do
   begin
      DrSumms[i]:=0;
      DrRemoteCl[i]:=false;
      DrRSets[i]:=0;
      DrLastOrders[i]:=Today+Time;
      DrLastStatTime[i]:=Today+Time;
      DrBusy[i]:=false;
   end;
  
end;

function TBoldModelDM.SetLocalDrSumm(DrNum: Integer; DrSumm: Double): Integer;
begin
  if (DrNum>0) and (DrNum<=99999) then
    DrSumms[DrNum]:=DrSumm;
  Result:=0;
end;

function TBoldModelDM.GetLocalDrSumm(DrNum: Integer): Double;
begin
  if (DrNum>0) and (DrNum<=99999) then
    Result:=DrSumms[DrNum]
  else
    Result:=0;
end;

function TBoldModelDM.SetLocalDrDynBal(DrNum: Integer; DrSumm: Double): Integer;
begin
  if (DrNum>0) and (DrNum<=99999) then
    DrDynBals[DrNum]:=DrSumm;
  Result:=0;
end;

function TBoldModelDM.GetLocalDrDynBal(DrNum: Integer): Double;
begin
  if (DrNum>0) and (DrNum<=99999) then
    Result:=DrDynBals[DrNum]
  else
    Result:=0;
end;

function TBoldModelDM.SetLocalDrUseDynBal(DrNum, IRC: Integer): Boolean;
begin
  if (DrNum>0) and (DrNum<=99999) then
    if IRC<>0 then
      DrUseDBals[DrNum]:=True
    else
      DrUseDBals[DrNum]:=False;
    Result:=True;
end;

function TBoldModelDM.GetLocalDrUseDynBal(DrNum: Integer): Boolean;
begin
  if (DrNum>0) and (DrNum<=99999) then
    Result:=DrUseDBals[DrNum]
  else
    Result:=false;
end;

function TBoldModelDM.SetLocalDrHasAEvs(DrNum, IRC: Integer): Boolean;
begin
  if (DrNum>0) and (DrNum<=99999) then
    if IRC<>0 then
      DrHasActEvs[DrNum]:=True
    else
      DrHasActEvs[DrNum]:=False;
    Result:=True;
end;

function TBoldModelDM.GetLocalDrHasAEvs(DrNum: Integer): Boolean;
begin
  if (DrNum>0) and (DrNum<=99999) then
    Result:=DrHasActEvs[DrNum]
  else
    Result:=false;
end;

function TBoldModelDM.SetLocalDrRemoteCl(DrNum, IRC: Integer): Boolean;
begin
  if (DrNum>0) and (DrNum<=99999) then
    if IRC<>0 then
      DrRemoteCl[DrNum]:=True
    else
      DrRemoteCl[DrNum]:=False;
    Result:=True;
end;

function TBoldModelDM.GetLocalDrRemoteCl(DrNum: Integer): Boolean;
begin
  if (DrNum>0) and (DrNum<=99999) then
    Result:=DrRemoteCl[DrNum]
  else
    Result:=false;
end;

function TBoldModelDM.SetLocalDrRemoteSet(DrNum, IRC: Integer): Boolean;
begin
  if (DrNum>0) and (DrNum<=99999) then
      DrRSets[DrNum]:=IRC;
    Result:=True;
end;

function TBoldModelDM.GetLocalDrRemoteSet(DrNum: Integer): Integer;
begin
  if (DrNum>0) and (DrNum<=99999) then
    Result:=DrRSets[DrNum]
  else
    Result:=0;
end;

function TBoldModelDM.SetLocalDrLastOrd(DrNum: Integer; LastOrd: TDateTime): Boolean;
begin
  if (DrNum>0) and (DrNum<=99999) then
      DrLastOrders[DrNum]:=LastOrd;
  Result:=True;
end;

function TBoldModelDM.GetLocalDrLastOrd(DrNum: Integer): TDateTime;
begin
  if (DrNum>0) and (DrNum<=99999) then
    Result:=DrLastOrders[DrNum]
  else
    Result:=Today+Time;
end;

function TBoldModelDM.SetLocalDrLastStatTime(DrNum: Integer; LastStatTime: TDateTime): Boolean;
begin
  if (DrNum>0) and (DrNum<=99999) then
      DrLastStatTime[DrNum]:=LastStatTime;
  Result:=True;
end;

function TBoldModelDM.GetLocalDrLastStatTime(DrNum: Integer): TDateTime;
begin
  if (DrNum>0) and (DrNum<=99999) then
    Result:=DrLastStatTime[DrNum]
  else
    Result:=Today+Time;
end;

function TBoldModelDM.SetLocalDrBusy(DrNum, DrBusyVal: Integer): Boolean;
begin
  if (DrNum>0) and (DrNum<=99999) then
    if DrBusyVal<>0 then
      DrBusy[DrNum]:=True
    else
      DrBusy[DrNum]:=False;
      Result:=True;
end;

function TBoldModelDM.GetLocalDrBusy(DrNum: Integer): Boolean;
begin
  if (DrNum>0) and (DrNum<=99999) then
    Result:=DrBusy[DrNum]
  else
    Result:=false;
end;

procedure TBoldModelDM.SetCurrWorkerAndYourPrivilegies(login: string);
begin
  CurrLogin:=login;
  while not bsh.Active do;
  BoldHandlesDM.bvhCurrUserLogin.Value.SetAsVariant(login);
        if (BoldHandlesDM.blhCurrUser.Count=0) or ((BoldHandlesDM.blhCurrUser.Count>1)) then
          begin
            ShowMessage('������������ � ����� ������� ����������� � ������� �������������, ���� ������������� � ����� ������� ���������!');
            if not(IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
              bsh.Active:=False;
            Exit;
          end
         else
           begin
             AllowWorkWithSaldo:=
                (BoldHandlesDM.blhCurrUser.
                CurrentElement as TPersonal).
                Razreshitj_udalenie_vypuskov;
             ShowMessage('����� ���������� � �������. ��� ����� ��������������� ��� ������������ '+
             (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Polnoe_imya);
             if (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Razresh_administr
                or (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Razreshitj_vsyo then
               SetEnabledValue(True);

             if not (IniFile.ReadString('BUSINESS_DATA','hybrid_SQLLEV_mode','NO')='YES')
               and (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Rolj_dispetchera then
               begin

               end

             else if not (BoldHandlesDM.blhCurrUser.CurrentElement as TPersonal).Rolj_dispetchera then
               begin

               end
             else
               begin
               end;
           end;
end;

procedure TBoldModelDM.BoldActivateSystemAction1SystemOpened(Sender: TObject);
begin
if not RefreshState then
 begin
  FirstForm.ActivateToolButton.ImageIndex:=3;
  //FirstForm.BoldActivateSystemActionMenu.ImageIndex:=3;
  FirstForm.StatusBar.Panels[0].Text:='���������� �������';
  FirstForm.ActivateToolButton.Hint:='�������� ���������� ����� ����������� ������';
  FirstForm.QuitToolButton.Enabled:=False;
 end;
end;

procedure TBoldModelDM.BoldActivateSystemAction1SystemClosed(Sender: TObject);
begin
if not RefreshState then
 begin
  FirstForm.ActivateToolButton.ImageIndex:=0;
  //FirstForm.BoldActivateSystemActionMenu.ImageIndex:=0;
  FirstForm.StatusBar.Panels[0].Text:='��� ����������';
  FirstForm.ActivateToolButton.Hint:='���������� ���������� � �� ��� ������ � �������';
  FirstForm.QuitToolButton.Enabled:=True;
  UserSystemExit;
 end;
end;

procedure TBoldModelDM.UserSystemEnter;
var login: string;
begin
ReleaseStructForm.Enabled:=True;
if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
 begin

 end
else
  begin
    UnionOADOTable.Active:=True;
    login:=GetCurrUserLogin;
    if login='' then
     begin
       bsh.Active:=False;
       Exit;
     end
    else
      begin
       SetCurrWorkerAndYourPrivilegies(login);
      end;
  end;
end;

procedure TBoldModelDM.UserSystemExit;
begin
  //SetEnabledValue(False);
  if ReleaseStructForm<>nil then
    ReleaseStructForm.Enabled:=False;
end;

procedure TBoldModelDM.SetEnabledValue(Value: Boolean);
begin
  FirstForm.BaseCorrectRepMenu.Enabled:=Value;
  SystemEnumsForm.INumDelBitBtn.Enabled:=Value;
  SystemEnumsForm.DBGrid1.Columns[0].ReadOnly:=not Value;
  SystemEnumsForm.DBGrid1.Columns[4].ReadOnly:=not Value;
end;

function TBoldModelDM.GetCurrUserLogin: string;
var login: string;
begin
  login:='';
  try
    USRLoginADOQuery.Active:=False;
    USRLoginADOQuery.SQL.Text:='select system_user as curr_usr_name';
    USRLoginADOQuery.Active:=True;
    login:=USRLoginADOQuery.FindField('curr_usr_name').AsString;
    USRLoginADOQuery.Active:=False;
  except
    ShowMessage('��������� ����������� ������� � ���� ��� ��������� ������ ������������!');
  end;
  try
    CurrUserADOQuery.Parameters[0].Value:=login;
    CurrUserADOQuery.Active:=False;
    CurrUserADOQuery.Active:=True;
    if CurrUserADOQuery.RecordCount<>1 then
      begin
        ShowMessage('�� ������ ��� ����� ������ ������������ � ������� �����������������!');
      end;
  except
  end;
  Result:=login;
end;

procedure TBoldModelDM.CustCheckTimerTimer(Sender: TObject);
begin
if IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES' then
    begin
    end
else
  begin

  end;
end;

end.
