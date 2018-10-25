unit ADODMUnit;

interface

uses
  SysUtils, Classes, DB, ADODB, Controls, IniFiles, ExtCtrls, Menus, BoldElements,
  DBClient, Variants, Dialogs, ActnList, DBActns;

type
  TMyThread = class(TThread)
   private
     { Private declarations }
   protected
     procedure DoWork;
     procedure Execute; override;
   end;

  TADOConnectDM = class(TDataModule)
    MainADOConnection: TADOConnection;
    ActiveCustADOQuery: TADOQuery;
    dsActiveCust: TDataSource;
    SectByCodeADOQuery: TADOQuery;
    DriverByBoldIDADOQuery: TADOQuery;
    MainADOCommand: TADOCommand;
    DrInfoADOQuery: TADOQuery;
    DrActCustADOQuery: TADOQuery;
    HistoryADOTable: TADOTable;
    TypeByNAMEADOQuery: TADOQuery;
    BoldIDADOTable: TADOTable;
    USRLoginADOQuery: TADOQuery;
    CurrUserADOQuery: TADOQuery;
    HasNewDataADOQuery: TADOQuery;
    NewMoveCustADOQuery: TADOQuery;
    UnionObjADOTable: TADOTable;
    DataRefreshTimer: TTimer;
    DispCustToArhivePopupMenu: TPopupMenu;
    N1: TMenuItem;
    PrevCustADOQuery: TADOQuery;
    RefreshPrevCustTimer: TTimer;
    DrSummADOQuery: TADOQuery;
    CurrCustParamADOQuery: TADOQuery;
    dsCurrCustParam: TDataSource;
    cdsSpec: TClientDataSet;
    N2: TMenuItem;
    N3: TMenuItem;
    ArhiveADOQuery: TADOQuery;
    dsArhiveCust: TDataSource;
    CurrCustValuesADOQuery: TADOQuery;
    dsCurrCustVal: TDataSource;
    CustDelADOQuery: TADODataSet;
    CustAggregateADOQuery: TADOQuery;
    EndedCustListADOQuery: TADOQuery;
    dsEndedCust: TDataSource;
    EndedPopupMenu: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    ActiveCustADOQueryBOLD_ID: TIntegerField;
    ActiveCustADOQueryBOLD_TYPE: TSmallintField;
    ActiveCustADOQueryYavl_pochasovym: TIntegerField;
    ActiveCustADOQueryKolichestvo_chasov: TBCDField;
    ActiveCustADOQueryNachalo_zakaza_data: TDateTimeField;
    ActiveCustADOQueryKonec_zakaza_data: TDateTimeField;
    ActiveCustADOQueryTelefon_klienta: TStringField;
    ActiveCustADOQueryData_podachi: TDateTimeField;
    ActiveCustADOQueryZavershyon: TIntegerField;
    ActiveCustADOQueryArhivnyi: TIntegerField;
    ActiveCustADOQueryUslovn_stoim: TBCDField;
    ActiveCustADOQueryAdres_vyzova_vvodim: TStringField;
    ActiveCustADOQueryPredvariteljnyi: TIntegerField;
    ActiveCustADOQueryData_predvariteljnaya: TDateTimeField;
    ActiveCustADOQueryZadeistv_predvarit: TIntegerField;
    ActiveCustADOQueryData_po_umolchaniyu: TDateTimeField;
    ActiveCustADOQuerySoobsheno_voditelyu: TIntegerField;
    ActiveCustADOQueryvypolnyaetsya_voditelem: TIntegerField;
    ActiveCustADOQueryotpuskaetsya_dostepcherom: TIntegerField;
    ActiveCustADOQueryocenivaetsya_cherez: TIntegerField;
    ActiveCustADOQueryadres_sektora: TIntegerField;
    ActiveCustADOQuerykonechnyi_sektor_raboty: TIntegerField;
    ActiveCustADOQuerysektor_voditelya: TIntegerField;
    ActiveCustADOQueryNomer_zakaza: TBCDField;
    ActiveCustADOQueryAdres_okonchaniya_zayavki: TStringField;
    ActiveCustADOQueryPozyvnoi_ustan: TIntegerField;
    ActiveCustADOQueryData_pribytie: TDateTimeField;
    ActiveCustADOQueryNomer_skidki: TIntegerField;
    ActiveCustADOQueryUstan_pribytie: TIntegerField;
    ActiveCustADOQueryPrimechanie: TStringField;
    ActiveCustADOQuerySlugebnyi: TIntegerField;
    ActiveCustADOQueryotpravlyaetsya: TIntegerField;
    ActiveCustADOQueryOpr_s_obsh_linii: TIntegerField;
    ActiveCustADOQueryData_na_tochke: TDateTimeField;
    ActiveCustADOQuerystart_dt: TStringField;
    ActiveCustADOQueryend_dt: TStringField;
    ActiveCustADOQueryMainCComment: TStringField;
    RegionsADOQuery: TADOQuery;
    ActiveCustADOQueryRegion: TStringField;
    CustAggregateSummADOQuery: TADOQuery;
    CurrUserFirstOnLastsSysEnterADOQuery: TADOQuery;
    FictOrderDelADOCommand: TADOCommand;
    ServerTimeADOQuery: TADOQuery;
    N6: TMenuItem;
    SetNewRelateAdressPourPhoneADOCommand: TADOCommand;
    RelateAdrCountADOQuery: TADOQuery;
    LastDriverOrderADOQuery: TADOQuery;
    N8: TMenuItem;
    N9: TMenuItem;
    N7: TMenuItem;
    DeleteFromBlackListADOCommand: TADOCommand;
    ActiveCustADOQueryINumInfo: TStringField;
    UnCompleteOrdersByPhoneADOQuery: TADOQuery;
    N10: TMenuItem;
    N11: TMenuItem;
    LastWeekIndADOQuery: TADOQuery;
    Last30MinDrMailInfoADOQuery: TADOQuery;
    Last3HourseDrMailADOQuery: TADOQuery;
    Last8HourseDrMailADOQuery: TADOQuery;
    dsLastWeekIndOrd: TDataSource;
    N12: TMenuItem;
    ActiveCustADOQueryesect: TStringField;
    SectByStrADOQuery: TADOQuery;
    Last8HourseArhADOQuery: TADOQuery;
    Last8HoursePresentADOQuery: TADOQuery;
    RestoreUnlinkOrdersADOC: TADOCommand;
    ModemsCheckTimer: TTimer;
    N13: TMenuItem;
    IsDuplicateRINGADOQuery: TADOQuery;
    ActiveCustADOQueryRemCustComment: TStringField;
    ActiveCustADOQueryREMOTE_SET: TIntegerField;
    ActiveCustADOQueryREMOTE_INCOURSE: TIntegerField;
    ActiveCustADOQueryREMOTE_ACCEPTED: TIntegerField;
    ActiveCustADOQueryREMOTE_DRNUM: TIntegerField;
    Internet1: TMenuItem;
    SMS1: TMenuItem;
    OrderHasCheckRemoteADOQuery: TADOQuery;
    SMS2: TMenuItem;
    OrderSMSStatesADOQuery: TADOQuery;
    ActiveCustADOQueryDRIVER_SMS_SEND_STATE: TIntegerField;
    ActiveCustADOQueryCLIENT_SMS_SEND_STATE: TIntegerField;
    ActiveCustADOQuerySMS_SEND_DRNUM: TStringField;
    ActiveCustADOQuerySMS_SEND_CLPHONE: TStringField;
    ActiveCustADOQuerySendSMSCustComment: TStringField;
    DrPhoneByNumADOQuery: TADOQuery;
    AbNumbersExportADODS: TADODataSet;
    ADTGSaveDlg: TSaveDialog;
    ADTGOpenDlg: TOpenDialog;
    AbNumbersImportADODS: TADODataSet;
    AbNumbersImportDS: TDataSource;
    DrIncomesADOT: TADOTable;
    DrIncomesDS: TDataSource;
    ConnDMActL: TActionList;
    DrIncomeDSD: TDataSetDelete;
    DrIncSummADODS: TADODataSet;
    DrWorkSummADODS: TADODataSet;
    RemoteCtrlAdmADOT2: TADOTable;
    RemoteCtrlAdmDS: TDataSource;
    RemoteCtrlAdmDSP: TDataSetPost;
    DriversADOT: TADOTable;
    RemSetOrdersADODS: TADODataSet;
    RemoteDataRefreshTimer: TTimer;
    dsOrdersOccupAtts: TDataSource;
    RemOrderByIdADODS: TADODataSet;
    DrWorkDetailSummADODS: TADODataSet;
    OrdersOccupAttsADOT: TADODataSet;
    SetDrFromPretendADOSP: TADOStoredProc;
    ActiveCustADOQueryPriority_counter: TIntegerField;
    ActiveCustADOQueryIndivid_order: TIntegerField;
    ActiveCustADOQueryIndivid_sending: TIntegerField;
    ActiveCustADOQuerySECTOR_ID: TIntegerField;
    ActiveCustADOQueryREMOTE_SUMM: TBCDField;
    ActiveCustADOQueryREMOTE_INSTR: TStringField;
    DrWorkFixSummADODS: TADODataSet;
    ManualSetOrdRemStatADOSP: TADOStoredProc;
    DrParamsADOQuery: TADOQuery;
    RemoteCtrlAdmADOT: TADODataSet;
    ActiveCustADOQueryREMOTE_SYNC: TIntegerField;
    ActiveCustADOQueryLAST_STATUS_TIME: TDateTimeField;
    ActiveCustADOQueryorder_sect: TStringField;
    DrRemOrdCountADODS: TADODataSet;
    SettingsADODS: TADODataSet;
    InsertNewOrderADOSP: TADOStoredProc;
    InsertOrdWithParamADOOSP: TADOStoredProc;
    SetNoTransmitADOC: TADOCommand;
    ActiveCustADOQueryNO_TRANSMITTING: TIntegerField;
    RemoteCtrlAdmADOTBOLD_ID: TIntegerField;
    RemoteCtrlAdmADOTBOLD_TYPE: TSmallintField;
    RemoteCtrlAdmADOTPozyvnoi: TIntegerField;
    RemoteCtrlAdmADOTV_rabote: TIntegerField;
    RemoteCtrlAdmADOTNa_pereryve: TIntegerField;
    RemoteCtrlAdmADOTIndeks_ocheryodnosti: TIntegerField;
    RemoteCtrlAdmADOTData_po_umolchaniyu: TDateTimeField;
    RemoteCtrlAdmADOTrabotaet_na: TIntegerField;
    RemoteCtrlAdmADOTchem_uchityvaetsya_voditelj: TIntegerField;
    RemoteCtrlAdmADOTrabotaet_na_sektore: TIntegerField;
    RemoteCtrlAdmADOTNomer_posl_sektora: TIntegerField;
    RemoteCtrlAdmADOTZanyat_drugim_disp: TIntegerField;
    RemoteCtrlAdmADOTVremya_poslednei_zayavki: TDateTimeField;
    RemoteCtrlAdmADOTNomer_deg_gruppy: TIntegerField;
    RemoteCtrlAdmADOTA_klass: TIntegerField;
    RemoteCtrlAdmADOTB_klass: TIntegerField;
    RemoteCtrlAdmADOTD_klass: TIntegerField;
    RemoteCtrlAdmADOTE_klass: TIntegerField;
    RemoteCtrlAdmADOTGaragn_nomer: TStringField;
    RemoteCtrlAdmADOTGos_nomernoi_znak: TStringField;
    RemoteCtrlAdmADOTKlass_vodit: TStringField;
    RemoteCtrlAdmADOTLicenzionnaya_kart: TStringField;
    RemoteCtrlAdmADOTMarka_avtomobilya: TStringField;
    RemoteCtrlAdmADOTS_klass: TIntegerField;
    RemoteCtrlAdmADOTUdostoverenie_nom: TStringField;
    RemoteCtrlAdmADOTIzm_haraktrist: TIntegerField;
    RemoteCtrlAdmADOTcvet_avto: TStringField;
    RemoteCtrlAdmADOTtip_nomer_racii: TStringField;
    RemoteCtrlAdmADOTotnositsya_k_gruppe: TIntegerField;
    RemoteCtrlAdmADOTIndivid_procent: TBCDField;
    RemoteCtrlAdmADOTPriority: TIntegerField;
    RemoteCtrlAdmADOTREMOTE_LOGIN: TStringField;
    RemoteCtrlAdmADOTREMOTE_PASSWORD: TStringField;
    RemoteCtrlAdmADOTREMOTE_STATUS: TIntegerField;
    RemoteCtrlAdmADOTACCEPT_RSTATUS: TIntegerField;
    RemoteCtrlAdmADOTSTAT_ORDER_ID: TIntegerField;
    RemoteCtrlAdmADOTREMOTE_SYNC: TIntegerField;
    RemoteCtrlAdmADOTLAST_STATUS_TIME: TDateTimeField;
    RemoteCtrlAdmADOTITS_REMOTE_CLIENT: TIntegerField;
    RemoteCtrlAdmADOTSYNC_STATUS: TIntegerField;
    RemoteCtrlAdmADOTDR_SUMM: TBCDField;
    RemoteCtrlAdmADOTSEND_WBROADCAST: TIntegerField;
    RemoteCtrlAdmADOTEN_MOVING: TIntegerField;
    RemoteCtrlAdmADOTUSE_GPS: TSmallintField;
    RemoteCtrlAdmADOTGTSS_ACCT_ID: TStringField;
    RemoteCtrlAdmADOTGTSS_DEV_ID: TStringField;
    CallPhonesExportADODS: TADODataSet;
    CallPhonesImportADODS: TADODataSet;
    CallPhonesImportDS: TDataSource;
    ActiveEventsDS: TDataSource;
    ActiveEventsADODS: TADODataSet;
    ActiveCustADOQueryRESTORED: TSmallintField;
    ActiveCustADOQueryAUTO_ARHIVED: TSmallintField;
    ActiveCustADOQueryWAITING: TIntegerField;
    ActiveCustADOQuerydirect_sect_id: TIntegerField;
    ActiveCustADOQuerydir_sect: TStringField;
    CloseEventADOC: TADOCommand;
    RemoteCtrlAdmADOThas_sect_fords: TSmallintField;
    RemoteCtrlAdmADOThas_forall_fords: TSmallintField;
    RemoteCtrlAdmADOTDRIVER_BALANCE: TBCDField;
    DrIncomesADOTBOLD_ID: TIntegerField;
    DrIncomesADOTBOLD_TYPE: TSmallintField;
    DrIncomesADOTSumma: TBCDField;
    DrIncomesADOTkem_prinositsya: TIntegerField;
    DrIncomesADOTData_postupleniya: TDateTimeField;
    DrIncomesADOTPozyvnoi: TIntegerField;
    AddToDynDrBalanceADOC: TADOCommand;
    RemoteCtrlAdmADOTuse_dyn_balance: TSmallintField;
    UseDrDBalanceADODS: TADODataSet;
    ActiveCustADOQueryfixed_time: TIntegerField;
    ActiveCustADOQueryfixed_summ: TBCDField;
    ActiveCustADOQueryon_place: TSmallintField;
    RemoteCtrlAdmADOThas_active_events: TSmallintField;
    RemoteCtrlAdmADOTrlock_on_calc_debt: TSmallintField;
    GetDrLockOnCalcDebtADOSP: TADOStoredProc;
    ResetRemDrFlADOSP: TADOStoredProc;
    RestoreRemDrFlagsADOSP: TADOStoredProc;
    SetGPSCRequStatusADOC: TADOCommand;
    RemoteCtrlAdmADOTWAS_REMOTE_CLIENT: TIntegerField;
    RemoteCtrlAdmADOTftime_tariff: TBCDField;
    RemoteCtrlAdmADOTtmeter_tariff: TBCDField;
    RemoteCtrlAdmADOTGPSC_REQU_FLAG: TSmallintField;
    ActiveCustADOQuerydr_assign_date: TDateTimeField;
    ActiveCustADOQuerytm_distance: TIntegerField;
    ActiveCustADOQuerytm_summ: TBCDField;
    OrdTariffsADODS: TADODataSet;
    OrdTariffsDS: TDataSource;
    OrderTarifDSI: TDataSetInsert;
    OrdOptsADODS: TADODataSet;
    OrdOptsDS: TDataSource;
    OrderOptionDSI: TDataSetInsert;
    ActiveCustADOQueryOPT_COMB: TLargeintField;
    ActiveCustADOQuerytarif_name: TStringField;
    OrdersTarTblADODS: TADODataSet;
    ActiveCustADOQueryOTAR_LOOK: TStringField;
    N14: TMenuItem;
    OrderOptSetDS: TDataSource;
    OrdOptsTblADODS: TADODataSet;
    OrdOptsTblADODSID: TAutoIncField;
    OrdOptsTblADODSOPTION_NAME: TStringField;
    OrdOptsTblADODSOSUMM_COEFF: TBCDField;
    OrdOptsTblADODSOS_COMPOSED: TBCDField;
    OrderOptionsCDS: TADODataSet;
    OrderOptionsCDSOrderOptionsNameCDSF: TStringField;
    OrderOptionsCDSOrderOptionsHasCDSF: TBooleanField;
    OrderOptionsCDSOrderOptHasIntCDSF: TIntegerField;
    SetOrdOptCombADOC: TADOCommand;
    ActiveCustADOQueryOPT_COMB_STR: TStringField;
    OrderOptionsCDSOrderOptIDCDSF: TIntegerField;
    OOptsDictADODS: TADODataSet;
    TarifPlansADODS: TADODataSet;
    TarifPlansTblADODS: TADODataSet;
    TarifPlansDS: TDataSource;
    TarifPlanDSI: TDataSetInsert;
    TarifPlansTblADODSID: TAutoIncField;
    TarifPlansTblADODSPOLICY_NAME: TStringField;
    OrdTariffsADODSID: TAutoIncField;
    OrdTariffsADODSTARIF_NAME: TStringField;
    OrdTariffsADODSTIME_TARIF: TBCDField;
    OrdTariffsADODSTMETER_TARIF: TBCDField;
    OrdTariffsADODSPR_POLICY_ID: TIntegerField;
    OrdTariffsADODSTPLAN_LOOK: TStringField;
    OrdOptsADODSID: TAutoIncField;
    OrdOptsADODSOPTION_NAME: TStringField;
    OrdOptsADODSOSUMM_COEFF: TBCDField;
    OrdOptsADODSOS_COMPOSED: TBCDField;
    OrdOptsADODSPR_POLICY_ID: TIntegerField;
    OrdOptsADODSTPLAN_LOOK: TStringField;
    ActiveCustADOQueryPR_POLICY_ID: TIntegerField;
    ActiveCustADOQueryTPLAN_LOOK: TStringField;
    DrGroupsWthTPADODS: TADODataSet;
    DrsWthTPADODS: TADODataSet;
    DrGroupsWthTPDS: TDataSource;
    DrWithTPDS: TDataSource;
    DrGroupsWthTPADODSBOLD_ID: TIntegerField;
    DrGroupsWthTPADODSPR_POLICY_ID: TIntegerField;
    DrGroupsWthTPADODSNaimenovanie: TStringField;
    DrGroupsWthTPADODSGRTP_LOOK: TStringField;
    DrsWthTPADODSPozyvnoi: TIntegerField;
    DrsWthTPADODSPR_POLICY_ID: TIntegerField;
    DrsWthTPADODSDRTP_LOOK: TStringField;
    OrdOptsADODSSHORT_NAME: TStringField;
    OrdTariffsADODSSHORT_NAME: TStringField;
    OrdOptsADODSIF_DEF: TSmallintField;
    OrdTariffsADODSIF_DEF: TSmallintField;
    ActiveCustADOQueryTARIFF_ID: TIntegerField;
    OrdTariffsADODSRATING_SUMM: TBCDField;
    OrdTariffsADODSIN_RATING: TSmallintField;
    OrdTariffsADODSRATING_PRIORITY: TIntegerField;
    DrWrkRatingsADODS: TADODataSet;
    DrWrkRatingsDS: TDataSource;
    AdrLiveSearchADODS: TADODataSet;
    ActiveDBConnsADODS: TADODataSet;
    ADOCommandModel: TADOCommand;
    RealizeEventADOSP: TADOStoredProc;
    RemoteCtrlAdmADOTuse_tmeter: TSmallintField;
    RemoteCtrlAdmADOTuse_nlocserv: TSmallintField;
    RemoteCtrlAdmADOTuse_bloc: TSmallintField;
    RemoteCtrlAdmADOTPR_POLICY_ID: TIntegerField;
    RemoteCtrlAdmADOTday_payment: TBCDField;
    RemoteCtrlAdmADOTmanual_day_sale: TSmallintField;
    RemoteCtrlAdmADOTdaily_paym_status: TSmallintField;
    RemoteCtrlAdmADOTonline_set_uname: TStringField;
    RemoteCtrlAdmADOTpaym_check_date: TDateTimeField;
    ReservePrOrdADOSP: TADOStoredProc;
    RealizeAbPresADOSP: TADOStoredProc;
    N15: TMenuItem;
    N16: TMenuItem;
    DrIncomeDSP: TDataSetPost;
    OrdTariffsADODSDISTANCE_PART: TIntegerField;
    OrdTariffsADODSDPART_TARIF: TBCDField;
    OrdTariffsADODSSTOP_TARIF: TBCDField;
    OrdTariffsADODSDISTANCE_START: TIntegerField;
    RemoteCtrlAdmADOTrequire_gps: TSmallintField;
    RemoteCtrlAdmADOTavar1: TSmallintField;
    RemoteCtrlAdmADOTavar2: TSmallintField;
    RemoteCtrlAdmADOTavar3: TSmallintField;
    RemoteCtrlAdmADOTavar4: TSmallintField;
    RemoteCtrlAdmADOTavar5: TSmallintField;
    RemoteCtrlAdmADOTavar6: TSmallintField;
    RemoteCtrlAdmADOTavar7: TSmallintField;
    RemoteCtrlAdmADOTavar8: TSmallintField;
    RemoteCtrlAdmADOTavar9: TSmallintField;
    RemoteCtrlAdmADOTavar10: TSmallintField;
    PhonesCodesADOT: TADOTable;
    PhoneCodesDS: TDataSource;
    N17: TMenuItem;
    ActiveCustADOQuerycall_it: TSmallintField;
    TarifsTblADODS: TADODataSet;
    TarifPlansADODSID: TAutoIncField;
    TarifPlansADODSPOLICY_NAME: TStringField;
    TarifPlansADODSSHORT_NAME: TStringField;
    TarifPlansADODSIF_DEF: TSmallintField;
    OrdTariffsADODSouther_tarid: TIntegerField;
    OrdTariffsADODSouther_tplid: TIntegerField;
    OrdTariffsADODSOTR_LOOK: TStringField;
    OrdTariffsADODSOTP_LOOK: TStringField;
    TarAreaCoordsADOT: TADOTable;
    dsTrAreaCoords: TDataSource;
    ActiveCustADOQueryrclient_id: TIntegerField;
    ActiveCustADOQueryrclient_status: TIntegerField;
    ActiveCustADOQueryclsync: TSmallintField;
    ActiveCustADOQuerytmsale: TBCDField;
    ActiveCustADOQuerytmhistory: TStringField;
    RemoteCtrlAdmADOTaddit_rem_params: TStringField;
    RemoteCtrlAdmADOTfix_order_pay_with_daily_pay: TSmallintField;
    RemoteCtrlAdmADOTlast_lat: TStringField;
    RemoteCtrlAdmADOTlast_lon: TStringField;
    DrOnMapHttpParamsADODS: TADODataSet;
    GetDrLockOnCalcDebtDynADOSP: TADOStoredProc;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    ActiveCustADOQueryalarmed: TSmallintField;
    AlarmedOrdersADOQuery: TADOQuery;
    RemoteCtrlAdmADOTphone_number: TStringField;
    DrGroupsADODS: TADODataSet;
    DrGroupsADODSBOLD_ID: TIntegerField;
    DrGroupsADODSBOLD_TYPE: TSmallintField;
    DrGroupsADODSNaimenovanie: TStringField;
    DrGroupsADODSKommentarii: TStringField;
    DrGroupsADODSIdentifikator: TIntegerField;
    RemoteCtrlAdmADOTdrgroup: TStringField;
    ActiveCustADOQuerystatus_accumulate: TStringField;
    ActiveCustADOQueryrclient_lat: TStringField;
    ActiveCustADOQueryrclient_lon: TStringField;
    ActiveCustADOQueryadr_manual_set: TSmallintField;
    ActiveCustADOQueryprev_price: TBCDField;
    ActiveCustADOQuerycargo_desc: TStringField;
    ActiveCustADOQueryend_adres: TStringField;
    ActiveCustADOQueryclient_name: TStringField;
    ActiveCustADOQueryprev_distance: TBCDField;
    RemoteCtrlAdmADOTlast_speed: TStringField;
    RemoteCtrlAdmADOTlast_cctime: TDateTimeField;
    RemoteCtrlAdmADOTits_manager: TSmallintField;
    RemoteCtrlAdmADOTforders_wbroadcast: TMemoField;
    RemoteCtrlAdmADOTauto_bith_year: TIntegerField;
    RemoteCtrlAdmADOTauto_material: TStringField;
    RemoteCtrlAdmADOTdr_cargo_services: TStringField;
    RemoteCtrlAdmADOTaddit_cargo_info: TStringField;
    RemoteCtrlAdmADOTis_our: TSmallintField;
    RemoteCtrlAdmADOTdont_reset_time: TSmallintField;
    RemoteCtrlAdmADOTfull_name: TStringField;
    OrdTariffsADODSmiss_every_nkm: TIntegerField;
    ActiveCustADOQueryCLIENT_CALL_STATE: TIntegerField;
    ActiveCustADOQuerysrc: TIntegerField;
    ActiveCustADOQuerysrc_id: TStringField;
    ActiveCustADOQuerysrc_state: TStringField;
    ActiveCustADOQuerypassengers: TIntegerField;
    ActiveCustADOQueryluggage: TStringField;
    ActiveCustADOQuerysrc_status_code: TIntegerField;
    ActiveCustADOQuerysrc_on_place: TSmallintField;
    ActiveCustADOQuerysrc_wait_sended: TSmallintField;
    ActiveCustADOQuerybonus_add: TBCDField;
    ActiveCustADOQuerybonus_use: TBCDField;
    ActiveCustADOQuerybonus_all: TBCDField;
    ProceedOpRequestADOSP: TADOStoredProc;
    N21: TMenuItem;
    RemoteCtrlAdmADOTcc_updated: TSmallintField;
    RemoteCtrlAdmADOTrating: TBCDField;
    RemoteCtrlAdmADOTreferral_driver_id: TIntegerField;
    RemoteCtrlAdmADOTreferral_set_date: TDateTimeField;
    SectorsADODS: TADODataSet;
    SectorsCoordsADOT: TADOTable;
    dsSectors: TDataSource;
    dsSectorsCoords: TDataSource;
    ActiveCustADOQuerydriver_rating_diff: TBCDField;
    ActiveCustADOQuerydriver_rating_expire_date: TDateTimeField;
    ActiveCustADOQuerydriver_rating_bonus_code: TStringField;
    ActiveCustADOQueryadr_detect_lat: TStringField;
    ActiveCustADOQueryadr_detect_lon: TStringField;
    ActiveCustADOQueryfailed_adr_coords_detect: TSmallintField;
    ActiveCustADOQuerydetected_sector: TIntegerField;
    ActiveCustADOQuerydet_sect_name: TStringField;
    DistrictsADODS: TADODataSet;
    DistrictsADODSid: TAutoIncField;
    DistrictsADODSname: TStringField;
    DistrictsADODScompany_id: TIntegerField;
    DistrictsADODSaddress: TStringField;
    DistrictsADODSdefault_sector_id: TIntegerField;
    ActiveCustADOQueryis_coordinates_upd: TSmallintField;
    ActiveCustADOQueryfor_all_sectors: TSmallintField;
    ActiveCustADOQueryfail_app_coords_geocode: TSmallintField;
    ActiveCustADOQuerydistrict_id: TIntegerField;
    ActiveCustADOQueryDISTRICT_LOOK: TStringField;
    DistrictsADOT: TADOTable;
    DistrictsADOTid: TAutoIncField;
    DistrictsADOTname: TStringField;
    DistrictsADOTcompany_id: TIntegerField;
    DistrictsADOTaddress: TStringField;
    DistrictsADOTdefault_sector_id: TIntegerField;
    DistrictsADOTDS: TDataSource;
    DistrictCompaniesADODS: TADODataSet;
    DistrictSectorsADODS: TADODataSet;
    DistrictSectorsADODSBOLD_ID: TIntegerField;
    DistrictSectorsADODSNaimenovanie: TStringField;
    DistrictCompaniesADODSBOLD_ID: TIntegerField;
    DistrictCompaniesADODSNaimenovanie: TStringField;
    DistrictsADOTCOMPANY_LOOK: TStringField;
    DistrictsADOTDEF_SECTOR_LOOK: TStringField;
    SectorsADODSBOLD_ID: TIntegerField;
    SectorsADODSBOLD_TYPE: TSmallintField;
    SectorsADODSNomer_sektora: TIntegerField;
    SectorsADODSOblastj_sverhu: TBCDField;
    SectorsADODSOblastj_sleva: TBCDField;
    SectorsADODSShirina: TBCDField;
    SectorsADODSVysota: TBCDField;
    SectorsADODSPodskazka_na_sektore: TStringField;
    SectorsADODSKod_sektora: TStringField;
    SectorsADODSford_count: TIntegerField;
    SectorsADODSford_json: TStringField;
    SectorsADODShas_fords: TSmallintField;
    SectorsADODSto_show_fords: TSmallintField;
    SectorsADODScompany_id: TIntegerField;
    SectorsADODSdistrict_id: TIntegerField;
    SectorsADODSNaimenovanie: TStringField;
    SectorsADODSKommentarii: TStringField;
    SectorsADODSCOMPANY_LOOK: TStringField;
    SectorsADODSDISTRICT_LOOK: TStringField;
    procedure ActiveCustADOQueryadr_manual_setGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure N21Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure DrIncomesADOTBeforeInsert(DataSet: TDataSet);
    procedure DrIncomesADOTBeforeEdit(DataSet: TDataSet);
    procedure N16Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure ActiveCustADOQueryOPT_COMB_STRGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure OrderOptionsCDSOrderOptHasIntCDSFGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure OrderOptionsCDSAfterInsert(DataSet: TDataSet);
    procedure N14Click(Sender: TObject);
    procedure ActiveCustADOQueryend_dtGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DrIncomesADOTAfterPost(DataSet: TDataSet);
    procedure ActiveCustADOQueryAdres_vyzova_vvodimGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure MainADOConnectionAfterConnect(Sender: TObject);
    procedure ActiveCustADOQueryPozyvnoi_ustanGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure ActiveCustADOQueryUslovn_stoimGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure ActiveCustADOQueryCalcFields(DataSet: TDataSet);
    procedure RemoteDataRefreshTimerTimer(Sender: TObject);
    procedure RemoteCtrlAdmADOT2AfterInsert(DataSet: TDataSet);
    procedure SMS1Click(Sender: TObject);
    procedure SMS2Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure ModemsCheckTimerTimer(Sender: TObject);
    procedure ActiveCustADOQueryBeforePost(DataSet: TDataSet);
    procedure N12Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure ActiveCustADOQueryBeforeInsert(DataSet: TDataSet);
    procedure N5Click(Sender: TObject);
    procedure ActiveCustADOQueryBeforeEdit(DataSet: TDataSet);
    procedure N4Click(Sender: TObject);
    procedure DispCustToArhivePopupMenuPopup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure RefreshPrevCustTimerTimer(Sender: TObject);
    procedure dsActiveCustDataChange(Sender: TObject; Field: TField);
    procedure N1Click(Sender: TObject);
    procedure DataRefreshTimerTimer(Sender: TObject);
    procedure ActiveCustADOQueryAfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    function SendSQL(SQL: Widestring): Boolean;
    function SetSale(Sale: Double; EnableSpecZeroSet: Boolean=False): Boolean;
	  //function SetSaleRemote(Sale: Double; OrderId: Integer; EnableSpecZeroSet: Boolean=False): Boolean;
    function Ocuppate(DrNum: Integer): Boolean;
    function OccupateByID(BID: Integer): Boolean;
    function GetDrByNum(DrNum: Integer): Boolean;
    function GetActiveDrCustCount(DrNum: Integer): Integer;
    function OnLaunch(DrNum: Integer): Boolean;
    function SetDriver(DrNum: Integer): Boolean;
    function SetCurrUserParam(SetDispID: Boolean=True): Boolean;
    procedure RefreshMainGridAndDriverData;
    function AddDISPCust(ColorCheck: Boolean=False;
      SetIndParam: Integer=0; ItIsANDOrder: Boolean=False): Integer;
    function SectIDByCode(code: string): integer;
    function DrIDByNum(DrNum: integer): integer;
    procedure SetAdress(adr: string);
    procedure RefreshMainGrid(id: integer; dr_refresh: Boolean=True);
    procedure SelectStartSectorLowLevel(id: Integer);
    procedure SetPrevCust(DT: TDateTime);
    procedure FindPrevCust;
    procedure SetSpecCust;
    procedure SetServiceCust;
    function GetServerDateTime: TDateTime;
    procedure SetNewRelateAdrPourPhone(phone, adress: string);
    function SetIndividNum(AddMode: Boolean=False): Boolean;
    procedure DeleteFromBlackList(phone: string);
    function GetFieldNumByName(FieldName: string): Integer;
    procedure GetINumHistory(i_num: string);
    procedure SetEntSectBySymb(comb: string);
    function PresentMessageDlg(Msg: string): Boolean;
    function OrderCheckToRemoteInit(OrderID: Integer; allowNoRemote: Boolean=True): Boolean;
    function OrderInRemoteProcess(OrderID: Integer): Boolean;
    function GetOrderRemoteSetParam(OrderID: Integer): Integer;
    procedure SendSMSToDriver(OrderID: Integer; PhoneNumber, Text: String);
    //procedure SendSMSToClient(PhoneNumber, Text: String);
    function GetDrSMSSendState(OrderID: Integer): Integer;
    function GetClientSMSSendState(OrderID: Integer): Integer;
    function GetDrPhoneByDrNum(DrNum: Integer): string;
    procedure SendSMSToCurrentDriver;
    procedure SendSMSToClient(OrderID: Integer);
    procedure SendSMSToCurrentClient;
	  procedure SendSaleToClient(OrderID: Integer);
    function GetClSMSSendState(OrderID: Integer): Integer;
    procedure ExportAbNumbersToFile;
    function ImportAbNumbersToFile: Boolean;
    procedure SaveDBImportedAbNumbers;
    function ChechDriverBalanceStatus(DrNum: Integer): Boolean;
    procedure RefreshRemoteData;
    procedure ReloadCurrOrderOccupAttempts(OrderId: Integer);
    procedure CheckDriversRemoteStatus;
    procedure CheckOrdersRemoteStatus;
    procedure SetDriverFromCurrPretendents;
    procedure ManualSetCurrOrderRemoteStatus(orderId,
      destStatus: Integer);
    function WaitOrdersOperation: Boolean;
    function OrderInRemoteRunning(OrderID: Integer): Boolean;
    procedure RefreshMainGridSys(id: integer; dr_refresh: Boolean=True);
    function getDrActiveRemoteOrdCount(DriverID: Integer): Integer;
    function setNoTransmitOrder(order_id: Integer): Boolean;
    procedure ExportCallPhonesToFile;
    function ImportCallPhonesToFile: Boolean;
    procedure SaveDBImportedCallPhones;
    procedure ReloadActiveEvents;
    procedure addToDynamicDrBalance(dr_num: Integer;
      summ: Double);
    function GetDrUseDynBalanceDrNum(DrNum: Integer): Boolean;
    procedure CheckDrUseDynamicBalanceStatus(DrNum: Integer);
	  function getDriverCalcBlocked(DrNum: Integer): Boolean;
    function getDriverCalcBlockedDyn(DrNum: Integer): Boolean;
    procedure resetRemoteDrFlags;
    procedure restoreRemoteDrFlags;
    function setDriverGPSCRequStatus(status, driver_num: Integer): Boolean;
    procedure reloadOrdersTariffs;
    procedure reloadOrdersOptions;
    procedure editCurrentOrderOptions;
    procedure saveCurrentOrderOptions;
    procedure setOrderOptsComb( orderId: Integer;
      optsComb: String);
    function getOOptNameByIDLoc(optId: Integer): String;
    function decodeOptComb(optComb: String): String;
    procedure reloadTarifPlans;
    procedure reloadTarifPlansTbl;
    procedure reloadGrDrsWthTP;
    procedure reloadDrsWthTP;
    procedure liveSearchAdress(like_s: String);
    function SendSQLModel(SQL: Widestring): Boolean;
    procedure realizeTDEvent(event_id: Integer);
    procedure reserveOrderPres(order_id: Integer);
    procedure realizeReservePres(order_id: Integer);
    procedure SetOrderCallIt;
    procedure SetOnlineOrderStatus(status: Integer);
    function proceedOpRequest( operationName: String;
      parameter1: Integer = -1; parameter2: Integer = -1;
      parameter3: Integer = -1; parameter4: String = '';
      parameter5: String = ''): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    CurrQueryFieldName: string;
    CurrCustBOLD_ID: Integer;
  end;

var
  ADOConnectDM: TADOConnectDM;
  ADOIniFile: TIniFile;
  RefreshOnTime: Boolean;
  RemoteRefreshOnTime: Boolean;
  RefreshBaseGrids, HasDrChange: Boolean;
  DispAdding: Boolean;
  HistFindSectorNum, PrevPoz: Integer;
  CurrDispUserLoginName:  string='';
  CustColorCheck: Boolean=False;
  CurrDispUserID: Integer;
  EnableManualRefresh: Boolean=False;
  RefreshDelayCounter: Integer=0;
  NotJumpWithLastChange: Boolean=False;
  GSMCheckStart: Boolean=False;
  GSMCheckWait: Boolean=False;
  GSM2CheckStart: Boolean=False;
  GSM2CheckWait: Boolean=False;
  GSM3CheckStart: Boolean=False;
  GSM3CheckWait: Boolean=False;
  EnableDriverRefresh: Boolean=True;
  PortRecovCounter1: Integer=0;
  PortRecovCounter2: Integer=0;
  PortRecovCounter3: Integer=0;
  PeriodicDevConRecovery: Boolean=True;
  PeriodicDevConRecovery2: Boolean=True;
  PeriodicDevConRecovery3: Boolean=True;
  RestartUSBHub: Boolean=False;
  AllowWorkWithSaldo: Boolean = False;
  LastSelRemStatOrderId: Integer = -1;
  LastSelOrdRemStatVal: Integer = -1;
  OrdersOperationInActive: Boolean=False;
  DriversOperationInActive: Boolean=False;
  OrdersOperationAccept: Boolean=False;
  DriversOperationAccept: Boolean=False;
  MinDBVersion: Integer = 5;
  CurrDrBalance: Double;
  currOrdOptID: Integer = -1;
  liveSearchIsActive: Boolean = False;
  alarmFlag: Boolean = False;

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
  EVENT_SALE_STATUS = 7;
  EVENT_MSG_STATUS = 8;

implementation

{$R *.dfm}

uses AnapaMapUnit, DateUtils, MainForm, ReleaseStructUnit, BusinessClasses, HandlesDM,
  ModelDM, Windows, Forms, ImageLists, BoldOtherHandlCompUnit, PrevCustUnit,
  UnitCOMFileLevel, BadReasoneForm, IndividNumSetUnit,
  USBAccess, WaitFormUnit, mmsystem, ShellAPI;

 procedure TMyThread.Execute;
 begin
   {���� �� ������, ����� ��������� DoWork ����������� ���� ���� ��� - ������� ���� while}
   ShellExecute(0, 'Open', PChar(GetCurrentDir+'\SoundRecord\wlns16269.mp3'), nil, PChar(CDP), SW_SHOWNORMAL);
   
   //if (IniFile.ReadString('BUSINESS_DATA','����������_������_������','NO')='YES') then
   ADOConnectDM.SendSQL('UPDATE Zakaz SET alarmed=0 WHERE Zavershyon=0');
 end;

 procedure TMyThread.DoWork;
 begin
   {����� ����� ��� ��������� �� ������, ������� ������ ���� ��������� ���������}

 end;

procedure TADOConnectDM.liveSearchAdress(like_s: String);
var use_kladr: Boolean;
    kladr_code: String;
begin

  try
    SettingsADODS.Active:=False;
    SettingsADODS.Active:=True;
    if SettingsADODS.Active then
    if SettingsADODS.RecordCount>0 then
      if (SettingsADODS.FieldByName('use_kladr').
        AsInteger=1) and (Length(SettingsADODS.
        FieldByName('kladr_object_code').AsString)>0)
        then
          begin
            use_kladr:=True;
            kladr_code:=SettingsADODS.
              FieldByName('kladr_object_code').AsString;
          end;
    except on E:Exception do
    begin
      ShowMessage('������ ��������� ���������� �� ��! '+
        E.Message);
      FirstForm.Close;
    end;
    end;

  if not liveSearchIsActive then
  begin
  try
    liveSearchIsActive:=True;
  try
      AdrLiveSearchADODS.Active:=False;
      if not use_kladr then
      AdrLiveSearchADODS.CommandText:=
        'SELECT DISTINCT Adres_vyzova_vvodim FROM '+
        'Sootvetstvie_parametrov_zakaza WHERE '+
        'Adres_vyzova_vvodim LIKE '''+like_s+'%'''+
        ' ORDER BY Adres_vyzova_vvodim ASC'
      else
      AdrLiveSearchADODS.CommandText:=
        ' SELECT tt.* FROM (SELECT DISTINCT Adres_vyzova_vvodim FROM '+
        'Sootvetstvie_parametrov_zakaza WHERE '+
        'Adres_vyzova_vvodim LIKE '''+like_s+'%'''+
        ' UNION '+
        ' SELECT ks.[������� 0] as Adres_vyzova_vvodim '+
        ' FROM KLADR_KLADR kk JOIN KLADR_STREET ks ' +
        'ON kk.[������� 6]=ks.[������� 6] ' +
        ' WHERE kk.[������� 2]='''+kladr_code+''' '+
        ' AND ks.[������� 0] LIKE '''+like_s+'%'') tt '+
        ' ORDER BY tt.Adres_vyzova_vvodim ASC';
      AdrLiveSearchADODS.Active:=True;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� ������ live-adress'+
      E.Message+'   :   '+AdrLiveSearchADODS.CommandText);
  end;
  finally
    liveSearchIsActive:=False;
  end;
  end;
end;

procedure TADOConnectDM.reloadGrDrsWthTP;
begin
  try
      DrGroupsWthTPADODS.Active:=False;
      DrGroupsWthTPADODS.Active:=True;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� ������ ����� ��� � ��'+
      E.Message);
  end;
end;



procedure TADOConnectDM.reloadDrsWthTP;
begin
  try
      DrsWthTPADODS.Active:=False;
      DrsWthTPADODS.Active:=True;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� ������ ��� � �� '+
      E.Message);
  end;
end;

procedure TADOConnectDM.reloadTarifPlansTbl;
begin
  try
      TarifPlansTblADODS.Active:=False;
      TarifPlansTblADODS.Active:=True;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� ������ �������� ������ '+
      E.Message);
  end;
end;

procedure TADOConnectDM.reloadTarifPlans;
begin
  try
      TarifPlansADODS.Active:=False;
      TarifPlansADODS.Active:=True;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� ������� �������� ������ '+
      E.Message);
  end;
end;

procedure TADOConnectDM.reloadOrdersTariffs;
begin
  try
      OrdTariffsADODS.Active:=False;
      OrdTariffsADODS.Active:=True;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� ������� ������� '+
      E.Message);
  end;
end;

procedure TADOConnectDM.reloadOrdersOptions;
begin
  try
      OrdOptsADODS.Active:=False;
      OrdOptsADODS.Active:=True;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� ������� ����� ������� '+
      E.Message);
  end;
end;

procedure TADOConnectDM.realizeTDEvent(event_id: Integer);
begin
  try
      RealizeEventADOSP.Parameters.ParamByName('@event_id').Value:=event_id;
      RealizeEventADOSP.ExecProc;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� RealizeEventADOSP '+
      E.Message);
  end;
end;

procedure TADOConnectDM.reserveOrderPres(order_id: Integer);
begin
  try
      ReservePrOrdADOSP.Parameters.Refresh;
      ReservePrOrdADOSP.Parameters.ParamByName('@order_id').
        Value:=order_id;
      ReservePrOrdADOSP.Parameters.ParamByName('@count').
        Value:=0;
      ReservePrOrdADOSP.ExecProc;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� ReservePrOrdADOSP '+
      E.Message);
  end;
end;

procedure TADOConnectDM.realizeReservePres(order_id: Integer);
begin
  try
      RealizeAbPresADOSP.Parameters.Refresh;
      RealizeAbPresADOSP.Parameters.ParamByName('@order_id').
        Value:=order_id;
      RealizeAbPresADOSP.Parameters.ParamByName('@count').
        Value:=0;
      RealizeAbPresADOSP.ExecProc;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� RealizeAbPresADOSP '+
      E.Message);
  end;
end;

procedure TADOConnectDM.resetRemoteDrFlags;
begin
  try
      ResetRemDrFlADOSP.ExecProc;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� ResetRemDrFlADOSP '+
      E.Message);
  end;
end;

procedure TADOConnectDM.restoreRemoteDrFlags;
begin
  try
      RestoreRemDrFlagsADOSP.ExecProc;
  except on E:Exception do
    ShowMessage(
      '��������� ���������� RestoreRemDrFlADOSP '+
      E.Message);
  end;
end;

function TADOConnectDM.getDriverCalcBlocked(DrNum: Integer): Boolean;
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
    ShowMessage(
      '��������� ������ GetDrLockOnCalcDebtADOSP ������� '+
      '���������� �� ������ ��������! '+E.Message);
  end;
  Result:=res;
end;

function TADOConnectDM.getDriverCalcBlockedDyn(DrNum: Integer): Boolean;
var res: Boolean;
begin
  res:=True;
  try
      GetDrLockOnCalcDebtDynADOSP.Parameters.Refresh;
      GetDrLockOnCalcDebtDynADOSP.Parameters.
          ParamByName('@dr_num').Value:=DrNum;
      GetDrLockOnCalcDebtDynADOSP.Parameters.
          ParamByName('@res').Value:=-1;
      GetDrLockOnCalcDebtDynADOSP.ExecProc;
      if GetDrLockOnCalcDebtDynADOSP.Parameters.
                ParamValues['@res']<>1 then
                res:=False;
  except on E:Exception do
    ShowMessage(
      '��������� ������ GetDrLockOnCalcDebtDynADOSP ������� '+
      '���������� �� ������ ��������! '+E.Message);
  end;
  Result:=res;
end;

procedure TADOConnectDM.ReloadActiveEvents;
begin
  //ShowMessage('ssss');
  try
    ActiveEventsADODS.Active:=False;
    ActiveEventsADODS.Active:=True;
    if ActiveEventsADODS.RecordCount>0 then
    begin
    ActiveEventsADODS.First;
    while (not ActiveEventsADODS.Eof) do
    begin
      if ActiveEventsADODS.FieldByName
        ('ETYPE_ID').AsInteger=EVENT_ALARM then
        FirstForm.ShowAttention(
          '���� �� ��������� ����� ������ �������!!!');
      if (ActiveEventsADODS.FieldByName
        ('ETYPE_ID').AsInteger=EVENT_SALE_STATUS) AND
        ((ActiveEventsADODS.FieldByName
        ('UNAME').AsString=BoldModelDM.CurrLogin) or
        (ActiveEventsADODS.FieldByName
        ('UNAME').AsString='app_server')) then
      if MessageDlg(ActiveEventsADODS.FieldByName
        ('DESCRIPT').AsString,
      mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
        ADOConnectDM.realizeTDEvent(ActiveEventsADODS.FieldByName
          ('EVENT_ID').AsInteger);
      end;
      ActiveEventsADODS.Next;
    end;
    end;

  except on E:Exception do
    ShowMessage('������ ������������ �������� �������! '+E.Message);
  end;
end;

function TADOConnectDM.setDriverGPSCRequStatus(status, driver_num: Integer): Boolean;
var res: Boolean;
begin
  res:=False;
  try
    self.SetGPSCRequStatusADOC.Parameters.
        ParamByName('status').Value:=status;
    self.SetGPSCRequStatusADOC.Parameters.
        ParamByName('driver_num').Value:=driver_num;
    SetGPSCRequStatusADOC.Execute;
  except on E:Exception do
    ShowMessage('������ ��������� ������� ������� GPS-���������! '+E.Message);
  end;
  Result:=res;
end;

function TADOConnectDM.setNoTransmitOrder(order_id: Integer): Boolean;
var res: Boolean;
begin
  res:=False;
  try
    self.SetNoTransmitADOC.Parameters.ParamByName('order_id').Value:=
      order_id;
    SetNoTransmitADOC.Execute;
  except on E:Exception do
    ShowMessage('������ ��������� ������� ������� ������! '+E.Message);
  end;
  Result:=res;
end;

function TADOConnectDM.GetDrPhoneByDrNum(DrNum: Integer): string;
var res: string;
begin
  res:='';
  try
    DrPhoneByNumADOQuery.Active:=False;
    DrPhoneByNumADOQuery.Parameters.ParamByName('dr_num').Value:=
      DrNum;
    DrPhoneByNumADOQuery.Active:=True;
    if (DrPhoneByNumADOQuery.RecordCount=1) then
      begin
        res:= DrPhoneByNumADOQuery.FieldByName('phone_number').AsString;
      end
    else
      begin
        ShowMessage('�� ������ �������� � ���� ��� �� ����� ������ � ����� ��������!');
      end;
  except on E: Exception do
    begin
      ShowMessage('��������� ���������� ������� ������ �������� ��������! ' + E.Message);
    end;
  end;
  Result:=res;
end;

function TADOConnectDM.GetDrSMSSendState(OrderID: Integer): Integer;
var res: Integer;
begin
  res:=0;
  try
    OrderSMSStatesADOQuery.Active:=False;
    OrderSMSStatesADOQuery.Parameters.ParamByName('BOLD_ID').Value:=
      OrderID;
    OrderSMSStatesADOQuery.Active:=True;
    if (OrderSMSStatesADOQuery.RecordCount>0) then
      begin
        res:= OrderSMSStatesADOQuery.FieldByName('DRIVER_SMS_SEND_STATE').AsInteger;
      end
    else
      begin
        ShowMessage('�� ������� ������ � ����, �������� ��� ������� ������ �������������!');
        res:=-2;
      end;
  except
    ShowMessage('��������� ���������� ������� ��������� �������� SMS!');
  end;
  Result:=res;
end;

function TADOConnectDM.GetClSMSSendState(OrderID: Integer): Integer;
var res: Integer;
begin
  res:=0;
  try
    OrderSMSStatesADOQuery.Active:=False;
    OrderSMSStatesADOQuery.Parameters.ParamByName('BOLD_ID').Value:=
      OrderID;
    OrderSMSStatesADOQuery.Active:=True;
    if (OrderSMSStatesADOQuery.RecordCount>0) then
      begin
        res:= OrderSMSStatesADOQuery.FieldByName('CLIENT_SMS_SEND_STATE').AsInteger;
      end
    else
      begin
        ShowMessage('�� ������� ������ � ����, �������� ��� ������� ������ �������������!');
        res:=-2;
      end;
  except
    ShowMessage('��������� ���������� ������� ��������� �������� SMS!');
  end;
  Result:=res;
end;

function TADOConnectDM.GetClientSMSSendState(OrderID: Integer): Integer;
var res: Integer;
begin
  res:=0;
  try
    OrderSMSStatesADOQuery.Active:=False;
    OrderSMSStatesADOQuery.Parameters.ParamByName('BOLD_ID').Value:=
      OrderID;
    OrderSMSStatesADOQuery.Active:=False;
    if (OrderSMSStatesADOQuery.RecordCount>0) then
      begin
        res:= OrderSMSStatesADOQuery.FieldByName('CLIENT_SMS_SEND_STATE').AsInteger;
      end
    else
      begin
        ShowMessage('�� ������� ������ � ����, �������� ��� ������� ������ �������������!');
        res:=-2;
      end;
  except
    ShowMessage('��������� ���������� ������� ��������� �������� SMS!');
  end;
  Result:=res;
end;

procedure TADOConnectDM.SendSMSToDriver(OrderID: Integer; PhoneNumber, Text: String);
begin
  if not SendSQL('UPDATE Zakaz SET DRIVER_SMS_SEND_STATE=1, SMS_SEND_DRNUM = '''
    +PhoneNumber+''' WHERE BOLD_ID='+IntToStr(OrderID)) then
                ShowMessage('��������� ��������� ������� �������� SMS ��������!');
end;

procedure TADOConnectDM.SendSMSToClient(OrderID: Integer);
begin
  if not SendSQL('UPDATE Zakaz SET CLIENT_SMS_SEND_STATE=1 '+
        ' WHERE BOLD_ID='+IntToStr(OrderID)) then
                ShowMessage('��������� ��������� ������� �������� SMS �������!');

end;

procedure TADOConnectDM.SendSaleToClient(OrderID: Integer);
begin
  if not SendSQL('UPDATE Zakaz SET CLIENT_SMS_SEND_STATE=3 '+
        ' WHERE BOLD_ID='+IntToStr(OrderID)) then
                ShowMessage('��������� ��������� ������� �������� ������ �� SMS �������!');
end;

function TADOConnectDM.OrderInRemoteRunning(OrderID: Integer): Boolean;
var res: Boolean;
    remote_set: Integer;
begin

  if (IniFile.ReadString('���������_��������','�����_���������_��������_�����_��������','NO')='YES') then
  begin
  remote_set:=GetOrderRemoteSetParam(OrderID);
  if remote_set in [ORDER_BUSY,
  ORDER_COMPLETE_ALLOW_USER_WAIT] then
   begin
    res:=True;
  end
  else if remote_set<ORDER_BUSY then
   begin
    res:=False;
   end
  else
    res:=False;
  end
  else
    res:=False;
    Result:=res;
end;

function TADOConnectDM.OrderInRemoteProcess(OrderID: Integer): Boolean;
var res: Boolean;
    remote_set: Integer;
begin
  if (IniFile.ReadString('���������_��������','�����_���������_��������_�����_��������','NO')='YES') then
  begin

  remote_set:=GetOrderRemoteSetParam(OrderID);
  if remote_set>0 then
   begin
    res:=True;
   end
  else if remote_set=0 then
   begin
    res:=False;
   end
  else
    res:=True;
  end
  else
    res:=False;
    Result:=res;
end;

function TADOConnectDM.PresentMessageDlg(Msg: string): Boolean;
var res: Boolean;
begin
  res:=False;
  if (IniFile.ReadString('BUSINESS_DATA',
    '�������������_�������_��������_���_�������','NO')='YES') then
    res:=True
  else
    if (MessageDlg(Msg, mtConfirmation,[mbYes,mbNo],0) = mrYes) then
      res:=True;
  Result:=res;
end;

procedure TADOConnectDM.SetEntSectBySymb(comb: string);
var find_sect_bold_id: Integer;
begin

if WaitOrdersOperation then
begin
try

 //find_sect_bold_id:=ActiveCustADOQuery.
 //FindField('konechnyi_sektor_raboty').AsInteger;
 try
  if comb<>'' then
   begin
    SectByStrADOQuery.Active:=False;
    SectByStrADOQuery.SQL.Clear;
    SectByStrADOQuery.SQL.Add('select dict.BOLD_ID, ws.Nomer_sektora from Spravochnik dict,'+
       ' Sektor_raboty ws where');
    SectByStrADOQuery.SQL.Add('(dict.BOLD_TYPE=15) and'+
       ' (dict.BOLD_ID=ws.BOLD_ID) and ');
    SectByStrADOQuery.SQL.Add(' ((dict.Naimenovanie LIKE '''
       +comb+'%'') or '+
       ' (ws.Kod_sektora LIKE '''
       +comb+'%''))');
    SectByStrADOQuery.Active:=True;

      if SectByStrADOQuery.RecordCount>0 then
        find_sect_bold_id:=SectByStrADOQuery.FindField('BOLD_ID').AsInteger
      else
       find_sect_bold_id:=-1;
       
   end
   else
    find_sect_bold_id:=-1;

   if ActiveCustADOQuery.FindField(
			'vypolnyaetsya_voditelem').AsInteger>-1 then
   begin
     if not SendSQL('UPDATE Zakaz SET konechnyi_sektor_raboty='+IntToStr(find_sect_bold_id)+
       ', adr_manual_set=1 WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
           ShowMessage('��������� ��������� ������� ��������� ������!');
   end
   else
    begin
      if (IniFile.ReadString('���������_��������',
	      '�����_���������_��������_�����_��������','NO')='YES') and
        OrderCheckToRemoteInit(ActiveCustADOQuery.
		    FindField('BOLD_ID').AsInteger) then
		  begin
		    if not SendSQL('UPDATE Zakaz SET SECTOR_ID='+IntToStr(find_sect_bold_id)+
       ', REMOTE_SET=2, adr_manual_set=1, Priority_counter=0 WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
           ShowMessage('��������� ��������� ������� ������� ������!');
		  end;
    end;
 except
   ShowMessage('��������� ������ ������� �� ������������!');
 end;

finally
  OrdersOperationInActive:=False;
end;
end
else
  begin
    //����� �� ��������?????
    ActiveCustADOQuery.CancelUpdates;
    ShowMessage('�������� ��������, ��������� ������� ������!');
  end;

end;

function TADOConnectDM.GetFieldNumByName(FieldName: string): Integer;
var res, i: Integer;
    fieldn: string;
begin
  res:=0;
  fieldn:=FieldName;
  if FieldName='Region' then
    begin
      if (ReleaseStructForm.DispDBGrid.Columns.Items[3].FieldName<>
        'Region') then
          fieldn:='Adres_okonchaniya_zayavki';
    end;
  for i:=0 to ReleaseStructForm.DispDBGrid.Columns.Count-1 do
    begin
      if ReleaseStructForm.DispDBGrid.Columns.Items[i].FieldName=fieldn then
        begin
          res:=i;
          Break;
        end;
    end;
  Result:=res;
end;

procedure TADOConnectDM.DeleteFromBlackList(phone: string);
begin
  try
    DeleteFromBlackListADOCommand.Parameters[0].Value:=phone;
    DeleteFromBlackListADOCommand.Execute;
    ShowMessage('������ �� ������� ������ ������ �������: ����� - '+
      phone+'.');
  except
    ShowMessage('������ �������� ������ �� ������� ������!');
  end;
end;

function TADOConnectDM.SetIndividNum(AddMode: Boolean=False): Boolean;
begin
  if AddMode then
    AddOrderAndINumMode:=True
  else
    SetIndividNumForm.TabSheet2.Show;
  SetIndividNumForm.ShowModal;
  Result:=UseIndividParam;
end;

procedure TADOConnectDM.SetNewRelateAdrPourPhone(phone, adress: string);
begin
  RelateAdrCountADOQuery.Parameters.ParamByName('phone').Value:=
    phone;
  SetNewRelateAdressPourPhoneADOCommand.Parameters.ParamByName('phone').Value:=
    phone;
  SetNewRelateAdressPourPhoneADOCommand.Parameters.ParamByName('adress').Value:=
    adress;
  try
    RelateAdrCountADOQuery.Active:=False;
    RelateAdrCountADOQuery.Active:=True;
    if RelateAdrCountADOQuery.RecordCount>0 then
      begin
        try
          SetNewRelateAdressPourPhoneADOCommand.Execute;
          ShowMessage('����� ����� ������� ����������!');
        except
          ShowMessage('��������� ����������� ������� �� ��������� ������������ ������ ������ ����������� ������!');
        end;
      end
    else
      ShowMessage('� ������� ������������ ������� � ���������� ������� ��� ������� � ����� ���������� �������!');
  except
    ShowMessage('��������� ����������� ������� �� ������� ������������ ������ ����������� ������!');
  end;
end;

function TADOConnectDM.GetServerDateTime: TDateTime;
begin
  Result:=Date+Time;
  try
    ServerTimeADOQuery.Active:=False;
    ServerTimeADOQuery.Active:=True;
    Result:=
      ServerTimeADOQuery.Fields.FieldByName('SRV_TIME').AsDateTime;
  except on E:Exception do
   begin
    ShowMessage('��������� ����������� ������� �������� ������� � �������! ������ '+E.Message+'.');
   end;
  end;
end;

procedure TADOConnectDM.SetPrevCust(DT: TDateTime);
var date_prm: TParameter;
begin
  if ActiveCustADOQuery.RecordCount>0 then
    begin
      if ActiveCustADOQuery.FieldByName('Predvariteljnyi').AsInteger<>0 then
        begin
          if MessageDlg('�������� ��������������� �����?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
              if not SendSQL('UPDATE Zakaz SET Predvariteljnyi=0'+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ������ �������� ��������������� ������!');
              RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger);
            end
        end
      else
        begin
          if not SendSQL('UPDATE Zakaz SET Predvariteljnyi=1'+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ��������� �������� ��������������� ������!');

          if MainADOCommand.Parameters.Count=0 then
                    begin
                     date_prm:=MainADOCommand.Parameters.AddParameter;
                     date_prm.DataType:=ftDateTime;
                     date_prm.Name:='date_prm';
                     date_prm.Value:=Today+Time;
                    end;      
          MainADOCommand.Parameters[0].Value:=DT;
          if not SendSQL('UPDATE Zakaz SET Data_predvariteljnaya=:date_prm'+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ��������� ���� ��������������� ������!');
          RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger);
        end;
    end
  else
    ShowMessage('��� �� ����� ������!');
end;

procedure TADOConnectDM.FindPrevCust;
begin
if IniFile.ReadString('BUSINESS_DATA','hybrid_SQLLEV_mode','NO')='YES' then
 if MainADOConnection.Connected then
 begin
  PrevCustADOQuery.Parameters[0].Value:=
          Today+Time;
  try
    PrevCustADOQuery.Active:=False;
    PrevCustADOQuery.Active:=True;
    if PrevCustADOQuery.RecordCount>0 then
      begin

        PrevCustADOQuery.First;
        if not SendSQL('UPDATE Zakaz SET Zadeistv_predvarit=1'+
              ' WHERE BOLD_ID='+IntToStr(PrevCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ��������� �������� ���������� ��������������� ������!');

        while not PrevCustADOQuery.Eof do
         begin

           PrevCustADOQuery.Next;
           if not SendSQL('UPDATE Zakaz SET Zadeistv_predvarit=1'+
              ' WHERE BOLD_ID='+IntToStr(PrevCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ��������� �������� ���������� ��������������� ������!');
          
         end;  

         PrevCustADOQuery.First;
         RefreshMainGrid(PrevCustADOQuery.FindField('BOLD_ID').AsInteger);
         ShowMessage('����� ��������������� ������, ���������� ����� ������!');
         FirstForm.ShowAttention('',True);
      end;
  except on E:Exception do
  begin
    ShowMessage('��������� ����������� ������� �� ������� �������� ��������������� ������!'+
      E.Message);
  end;
  end;
 end;       
end;

procedure TADOConnectDM.SetOnlineOrderStatus(status: Integer);
begin
  if ActiveCustADOQuery.RecordCount>0 then
    begin
      //if ActiveCustADOQuery.FieldByName('Slugebnyi').AsInteger<>0 then
      //  begin
          //if MessageDlg('?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
          //  begin
              if not SendSQL('UPDATE Zakaz SET rclient_status='+IntToStr(status)+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ��������� ������� ������-������!');
              RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger);
          //  end
      //  end
    end
  else
    ShowMessage('��� �� ����� ������!');
end;

procedure TADOConnectDM.SetSpecCust;
begin
  if ActiveCustADOQuery.RecordCount>0 then
    begin
      if ActiveCustADOQuery.FieldByName('Slugebnyi').AsInteger<>0 then
        begin
          if MessageDlg('����� ��������� �����?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
              if not SendSQL('UPDATE Zakaz SET Slugebnyi=0'+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ������ �������� ��������� ������!');
              RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger);
            end
        end
      else
        begin
          if not SendSQL('UPDATE Zakaz SET Slugebnyi=1'+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ��������� �������� ��������� ������!');
          RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger);
        end;
    end
  else
    ShowMessage('��� �� ����� ������!');
end;

procedure TADOConnectDM.SetOrderCallIt;
begin
  if ActiveCustADOQuery.RecordCount>0 then
    begin
      if ActiveCustADOQuery.FieldByName('call_it').AsInteger<>0 then
        begin
          if MessageDlg('����� ����� ��� ������?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
              if not SendSQL('UPDATE Zakaz SET call_it=0'+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ������ �������� ������ ������!');
              RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger);
            end
        end
      else
        begin
          if not SendSQL('UPDATE Zakaz SET call_it=1'+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ��������� �������� ������ ������!');
          RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger);
        end;
    end
  else
    ShowMessage('��� �� ����� ������!');
end;

procedure TADOConnectDM.SetServiceCust;
begin
  if ActiveCustADOQuery.RecordCount>0 then
    begin
      if ActiveCustADOQuery.FieldByName('Nomer_skidki').AsInteger=-3000 then
        begin
          if MessageDlg('�������� �����-������?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
              if not SendSQL('UPDATE Zakaz SET Nomer_skidki=0'+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ������ �������� ������ �� ������!');
              RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger);
            end
        end
      else
        begin
          if not SendSQL('UPDATE Zakaz SET Nomer_skidki=-3000, adres_vyzova_vvodim='''+
              IniFile.ReadString('BUSINESS_DATA','service_append_word','������')+' ''+adres_vyzova_vvodim'+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ��������� �������� ��������� ������!');
          RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger);
        end;
    end
  else
    ShowMessage('��� �� ����� ������!');
end;

function TADOConnectDM.SectIDByCode(code: string): integer;
var res: integer;
begin
  res:=-1;
  ADOConnectDM.SectByCodeADOQuery.Parameters[0].Value:=code;
    try
    ADOConnectDM.SectByCodeADOQuery.Active:=False;
    ADOConnectDM.SectByCodeADOQuery.Active:=True;
    
    if (ADOConnectDM.SectByCodeADOQuery.RecordCount=1) then
        begin
          ADOConnectDM.SectByCodeADOQuery.First;
          res:=
              ADOConnectDM.SectByCodeADOQuery.FindField('BOLD_ID').AsInteger;
        end;
       except
       ShowMessage('��������� ��������� ����� �� ���� �������!');
    end;
   Result:=res;
end;

function TADOConnectDM.DrIDByNum(DrNum: integer): integer;
var res: integer;
begin
  res:=-1;
   try
    DrInfoADOQuery.Parameters[0].Value:=
      DrNum;
    DrInfoADOQuery.Active:=False;
    DrInfoADOQuery.Active:=True;
    if DrInfoADOQuery.RecordCount>1 then
      begin
        
        ShowMessage('����� ��� ���� ��� �� ������ �������� � �������� '+IntToStr(DrNum));
      end
       else
         if DrInfoADOQuery.RecordCount=1 then
          res:=ADOConnectDM.DrInfoADOQuery.FindField('BOLD_ID').AsInteger;
  except
    ShowMessage('��������� ������ �������� �� ��������� - '+InttoStr(DrNum));
  end;
   Result:=res;
end;

procedure TADOConnectDM.SetAdress(adr: string);
var sql_text: string;
begin

if WaitOrdersOperation then
begin
try

try

FindSectorNum:=-1;
sql_text:='UPDATE Zakaz SET adr_manual_set=1, otpuskaetsya_dostepcherom='+
  IntToStr(CurrUserADOQuery.FindField('BOLD_ID').AsInteger);

  if True
  then
  begin
    //���
  if True
  then
       begin
          if not FirstForm.SpaceStr(adr) or
              (IniFile.ReadString('BUSINESS_DATA','enable_empty_adr_set','NO')='YES')  then begin
                  if (ActiveCustADOQuery.FindField('Adres_vyzova_vvodim').AsString='')  or
                      (IniFile.ReadString('BUSINESS_DATA','disable_repeat_enter','NO')<>'YES') then
                         begin

                              if adr<>'' then begin

                                    sql_text:=sql_text+
                                      ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger);
                                    if not SendSQL(sql_text) then
                                      ShowMessage('��������� ��������� ���������� ������!');
                                    //else
                                    //  ShowMessage(sql_text+'������� ��������� ���������� ������!');
                                    MainADOCommand.Parameters.Clear;

                                 if (IniFile.ReadString('BUSINESS_DATA',
                                  'manual_operator_ask_mode','NO')='YES') then
                                  FirstForm.StatusBar.Panels[2].Text:=
                                  '���� ���������';
         
                                 end
                              else
                                 ShowMessage('���������� ���������� ������ ��������!');
                         end
                   else
                       ShowMessage('���������� �������� ���������� ��������!');             
             end
           else
              ShowMessage('���������� ���������� ������ ��������!');

       end;
      //������� �������� �� ������������ ���� ������ �������������
  end;

except on E:Exception do
  ShowMessage('������ ��������� ������! '+E.Message);
end;

finally
  OrdersOperationInActive:=False;
end;
end
else
  begin
    //����� �� ��������?????
    ActiveCustADOQuery.CancelUpdates;
    ShowMessage('�������� ��������, ��������� ������� ������!');
  end;

end;

procedure TADOConnectDM.SelectStartSectorLowLevel(id: Integer);
begin
{if ActiveCustADOQuery.FindField('adres_sektora').AsInteger<0
         then
           begin
             StateMapForm.Close;
             StateMapForm.Caption:='����� ���������� ������� ������';
             StateMapForm.ShowModal;
              if StateMapForm.HasResult then
                if not SendSQL('UPDATE Zakaz SET adres_sektora='+IntToStr(SectIDByCode((BoldHandlesDM.blhSectorByCode.CurrentElement as TSektor_raboty).kod_sektora))+
              ' WHERE BOLD_ID='+IntToStr(id)) then
                ShowMessage('��������� ��������� ���������� �������!');
           end; }
end;

procedure TADOConnectDM.RefreshMainGrid(id: integer; dr_refresh: Boolean=True);
begin
 alarmFlag := True;
 if not RefreshBaseGrids then
 begin
    //ShowMessage('lll');
   try
      RefreshBaseGrids:=True;

   try

        //���������� ����� ������������� ������
        if RefreshPerDetectNum then
          if not NotJumpWithLastChange then
             id:=DetectID;
          try

            ADOConnectDM.ActiveCustADOQuery.Active:=False;
            if (IniFile.ReadString('develop_2008_year','temporally_dbgrid_disconnect','NO')='YES') then
                ReleaseStructForm.DispDBGrid.DataSource:=nil;
            ADOConnectDM.ActiveCustADOQuery.Active:=True;




            if id>=-1 then
              if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
                begin

                  if (IniFile.ReadString('develop_2008_year','search_with_recordset_clone','NO')='NO') then
                    begin
                      ADOConnectDM.ActiveCustADOQuery.First;

                        while not ADOConnectDM.ActiveCustADOQuery.Eof
                          and (ADOConnectDM.ActiveCustADOQuery.FieldByName('Nomer_zakaza').AsInteger<>id) do
                            begin

                              if (ADOConnectDM.ActiveCustADOQuery.FieldByName('Telefon_klienta').AsString='')
                                and (ADOConnectDM.ActiveCustADOQuery.FieldByName('Adres_vyzova_vvodim').AsString='')
                                and ((CurrQueryFieldName='Uslovn_stoim') or (id=-1))
                                and ((IniFile.ReadString('BUSINESS_DATA','colored_alien_cust','NO')='NO') or
                                    (ADOConnectDM.ActiveCustADOQuery.FieldByName('otpuskaetsya_dostepcherom').AsInteger=CurrDispUserID)) then
                                 Break;

                               ADOConnectDM.ActiveCustADOQuery.Next;
                            end;

                     end
                    else
                      begin

                      end;
                end;

            finally

                if (IniFile.ReadString('develop_2008_year','temporally_dbgrid_disconnect','NO')='YES') then
                  ReleaseStructForm.DispDBGrid.DataSource:=
                    ADOConnectDM.dsActiveCust;

                if RefreshPerDetectNum then
                  begin

                    if not NotJumpWithLastChange then
                      begin

                        if (IniFile.ReadString('BUSINESS_DATA','�����_����_�������_���_��_������','NO')='NO') then
                          ReleaseStructForm.DispDBGrid.SelectedField:=
                            ReleaseStructForm.DispDBGrid.Fields[
                            ADOConnectDM.GetFieldNumByName('Region')];

                       end
                    else
                      NotJumpWithLastChange:=False;

                    RefreshPerDetectNum:=False;

                  end;

              //����� finally
            end;

            BoldOthHandleCompDM.SetCurrLabel;

        {try
        if (IniFile.ReadString('BUSINESS_DATA','����������_������_������','NO')='YES') then
        begin
        AlarmedOrdersADOQuery.Active:=False;
        AlarmedOrdersADOQuery.Active:=True;
        if ADOConnectDM.AlarmedOrdersADOQuery.Active then
        if ADOConnectDM.AlarmedOrdersADOQuery.RecordCount>0 then
        if (IniFile.ReadString('BUSINESS_DATA','����������_������_������','NO')='YES') then begin

                            MessageBeep(MB_ICONEXCLAMATION);
                            ShellExecute(Application.Handle, 'Open', PChar(GetCurrentDir+'\SoundRecord\wlns16269.mp3'), nil, PChar(CDP), 2);

                            SendSQL('UPDATE Zakaz SET alarmed=0');

                  end;
        end;
        except  on E: Exception do
        end; }

   except on E: Exception do
      begin
        ShowMessage('��������� ���������� ������� ������ ����������! ������'+E.Message+'.'+ActiveCustADOQuery.SQL.Text);

        try
          ADOConnectDM.ActiveCustADOQuery.Active:=False;
          ADOConnectDM.ActiveCustADOQuery.Active:=True;
        except on E: Exception do
         begin
          ShowMessage('��������� ��������� ���������� ������� ������ ����������! ������'+E.Message+'.');
         end
        end;

       end
   end;

   if dr_refresh and (ADOIniFile.ReadString('BUSINESS_DATA','refresh_after_disp_manip','NO')='YES') then
        begin
          BoldModelDM.RefreshDriverData(True);
        end;

   if (IniFile.ReadString(
      'BUSINESS_DATA','�����_�����_�������',
      'NO')='YES') then
        begin
          //showmessage('11');
          Self.ReloadActiveEvents;
        end;

   finally
      RefreshBaseGrids:=False;
   end;
//����� ������� �� ��������� ������ ���������
end;

end;

procedure TADOConnectDM.RefreshMainGridSys(id: integer; dr_refresh: Boolean=True);
begin
 alarmFlag := True;
 if not RefreshBaseGrids then
 begin

   try
      RefreshBaseGrids:=True;

   try
        //���������� ����� ������������� ������
        if RefreshPerDetectNum then
          if not NotJumpWithLastChange then
             id:=DetectID;
          try

            ADOConnectDM.ActiveCustADOQuery.Active:=False;
            if (IniFile.ReadString('develop_2008_year','temporally_dbgrid_disconnect','NO')='YES') then
                ReleaseStructForm.DispDBGrid.DataSource:=nil;
            ADOConnectDM.ActiveCustADOQuery.Active:=True;

            if id>=-1 then
              if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
                begin

                  if (IniFile.ReadString('develop_2008_year','search_with_recordset_clone','NO')='NO') then
                    begin
                      ADOConnectDM.ActiveCustADOQuery.First;

                        while not ADOConnectDM.ActiveCustADOQuery.Eof
                          and (ADOConnectDM.ActiveCustADOQuery.FieldByName('Nomer_zakaza').AsInteger<>id) do
                            begin

                              if (ADOConnectDM.ActiveCustADOQuery.FieldByName('Telefon_klienta').AsString='')
                                and (ADOConnectDM.ActiveCustADOQuery.FieldByName('Adres_vyzova_vvodim').AsString='')
                                and ((CurrQueryFieldName='Uslovn_stoim') or (id=-1))
                                and ((IniFile.ReadString('BUSINESS_DATA','colored_alien_cust','NO')='NO') or
                                    (ADOConnectDM.ActiveCustADOQuery.FieldByName('otpuskaetsya_dostepcherom').AsInteger=CurrDispUserID)) then
                                 Break;

                               ADOConnectDM.ActiveCustADOQuery.Next;
                            end;

                     end
                    else
                      begin

                      end;
                end;

            finally

                if (IniFile.ReadString('develop_2008_year','temporally_dbgrid_disconnect','NO')='YES') then
                  ReleaseStructForm.DispDBGrid.DataSource:=
                    ADOConnectDM.dsActiveCust;

                if RefreshPerDetectNum then
                  begin

                    if not NotJumpWithLastChange then
                      begin

                        if (IniFile.ReadString('BUSINESS_DATA','�����_����_�������_���_��_������','NO')='NO') then
                          ReleaseStructForm.DispDBGrid.SelectedField:=
                            ReleaseStructForm.DispDBGrid.Fields[
                            ADOConnectDM.GetFieldNumByName('Region')];

                       end
                    else
                      NotJumpWithLastChange:=False;

                    RefreshPerDetectNum:=False;

                  end;

              //����� finally
            end;

            BoldOthHandleCompDM.SetCurrLabel;

        {try
        if (IniFile.ReadString('BUSINESS_DATA','����������_������_������','NO')='YES') then
        begin
        AlarmedOrdersADOQuery.Active:=False;
        AlarmedOrdersADOQuery.Active:=True;
        if ADOConnectDM.AlarmedOrdersADOQuery.Active then
        if ADOConnectDM.AlarmedOrdersADOQuery.RecordCount>0 then
        if (IniFile.ReadString('BUSINESS_DATA','����������_������_������','NO')='YES') then begin

                            MessageBeep(MB_ICONEXCLAMATION);
                            ShellExecute(Application.Handle, 'Open', PChar(GetCurrentDir+'\SoundRecord\wlns16269.mp3'), nil, PChar(CDP), 2);

                            SendSQL('UPDATE Zakaz SET alarmed=0');

                  end;
        end;
        except  on E: Exception do
        end;        }

   except on E: Exception do
      begin
        ShowMessage('��������� ���������� ������� ������ ����������! ������'+E.Message+'.'+ActiveCustADOQuery.SQL.Text);

        try
          ADOConnectDM.ActiveCustADOQuery.Active:=False;
          ADOConnectDM.ActiveCustADOQuery.Active:=True;
        except on E: Exception do
         begin
          ShowMessage('��������� ��������� ���������� ������� ������ ����������! ������'+E.Message+'.');
         end
        end;

       end
   end;


   if dr_refresh and (ADOIniFile.ReadString('BUSINESS_DATA','refresh_after_disp_manip','NO')='YES') then
        begin
          BoldModelDM.RefreshDriverData(True);
        end;

   if (IniFile.ReadString(
      'BUSINESS_DATA','�����_�����_�������',
      'NO')='YES') then
        begin
          //showmessage('11');
          Self.ReloadActiveEvents;
        end;

   finally
      RefreshBaseGrids:=False;
      BoldModelDM.ResetSelfAskAttr;
   end;
//����� ������� �� ��������� ������ ���������
end;

end;

function TADOConnectDM.AddDISPCust(ColorCheck: Boolean=False;
  SetIndParam: Integer=0; ItIsANDOrder: Boolean=False): Integer;
var res: Integer;
begin
res:=-1;
if IniFile.ReadString('BUSINESS_DATA','hybrid_SQLLEV_mode','NO')='YES' then
     begin
       res:=ReleaseStructForm.AddNewOrder(ColorCheck,
        SetIndParam, ItIsANDOrder);
       ReleaseStructForm.DispDBGrid.SetFocus;
       ReleaseStructForm.DispDBGrid.SelectedField:=
         ReleaseStructForm.DispDBGrid.Fields[
           ADOConnectDM.GetFieldNumByName('Telefon_klienta')];
     end;

  if MainADOConnection.Connected and not RefreshOnTime then
   begin
    RefreshMainGrid(-1, False);
    if ADOConnectDM.ActiveCustADOQuery.RecordCount>0 then
      ADOConnectDM.ActiveCustADOQuery.Last;
   end;
   Result:=res;
end;

procedure TADOConnectDM.CheckDriversRemoteStatus;
var status: Integer;
begin
  try
    DriversADOT.Active:=False;
    DriversADOT.Active:=True;
    if DriversADOT.RecordCount>0 then
    begin
      DriversADOT.First;
      while(not DriversADOT.Eof) do
      begin
        status := DriversADOT.
          FieldByName('REMOTE_STATUS').AsInteger;

        case status of
          0:
            begin
            end;
		  DR_IN_WORKING_ONHAND_ATTEMPT:
			begin
			end;
		  DR_ON_REST_ATTEMPT:
			begin
			end;
		  DR_OUT_FROM_LINE_ATTEMPT:
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
    ShowMessage('��������� ���������� ��������� '+
    '�������� ���������! '+E.Message);
  end;
end;

procedure TADOConnectDM.CheckOrdersRemoteStatus;
var status: Integer;
    allowOperation: Boolean;
begin

  try
    RemSetOrdersADODS.Active:=False;
    RemSetOrdersADODS.Active:=True;
    if RemSetOrdersADODS.RecordCount>0 then
    begin
      RemSetOrdersADODS.First;
      while(not RemSetOrdersADODS.Eof) do
      begin
        status := RemSetOrdersADODS.
          FieldByName('REMOTE_SET').AsInteger;

        case status of
            0:
              begin

              end;
            ORDER_IS_OCCUPED:
              begin
                allowOperation:=False;
                if (IniFile.ReadString('���������_��������',
                '����������_���_���������_����_��_�����',
                'NO')='YES') then
                  allowOperation:=PresentMessageDlg('���������� �������� '+
                    RemSetOrdersADODS.FieldByName('REMOTE_DRNUM').
                    AsString+' �� ������ '+RemSetOrdersADODS.
                    FieldByName('Nomer_zakaza').AsString+'? ��� - '+
                    '����� �� ������������.');
                 if allowOperation then
                 begin
                  RemSetOrdersADODS.Edit;
                   RemSetOrdersADODS.
                    FieldByName('REMOTE_SET').Value:=
                    ORDER_OCCUPED_ALLOW;
                   RemSetOrdersADODS.Post;
                 end
                 else
                 begin
                   RemSetOrdersADODS.Edit;
                   RemSetOrdersADODS.
                    FieldByName('REMOTE_SET').Value:=
                    ORDER_OCCUPED_DENY;
                   RemSetOrdersADODS.Post;
                 end;
              end;
            ORDER_OCCUPED_DENY:
              begin
              end;
			ORDER_BUSY:
			  begin
			  end;
      ORDER_ONHAND_ATTEPMT:
        begin
                  allowOperation:=True;
                if (IniFile.ReadString('���������_��������',
                '����������_���_����������_�_����_���������',
                'NO')='YES') then
                  allowOperation:=PresentMessageDlg('���������� �������� '+
                    RemSetOrdersADODS.FieldByName('REMOTE_DRNUM').
                    AsString+' c ���� �� ������ '+RemSetOrdersADODS.
                    FieldByName('Nomer_zakaza').AsString+'?');
                 if allowOperation then
                 begin
                  RemSetOrdersADODS.Edit;
                   RemSetOrdersADODS.
                    FieldByName('REMOTE_SET').Value:=
                    ORDER_ONHAND_ALLOW;
                   RemSetOrdersADODS.Post;
                 end
                 else
                 begin
                   RemSetOrdersADODS.Edit;
                   RemSetOrdersADODS.
                    FieldByName('REMOTE_SET').Value:=
                    ORDER_ONHAND_DENY;
                   RemSetOrdersADODS.Post;
                 end;
        end;
			ORDER_ONHAND_ACTIVE:
			  begin
			  end;
			ORDER_DISP_CANCEL_DR_INCOURSE:
			  begin
			  end;
			ORDER_DRV_CANCEL:
			  begin
			  end;
			ORDER_DRV_COMPLETE:
			  begin


			  end;
          else
            begin
            end;
        end;

        RemSetOrdersADODS.Next;
      end;
    end;
  except on E:Exception do
    ShowMessage('��������� ���������� ��������� '+
    '�������� ������! '+E.Message);
  end;
end;

procedure TADOConnectDM.RefreshRemoteData;
begin
if (IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
  begin
  end
else
 begin

  {if MainADOConnection.Connected and not RemoteRefreshOnTime then
    begin
     if BoldModelDM.HasSelfAskRemoteAttr then
     begin

      try
        RemoteRefreshOnTime:=True;

        //CheckOrdersRemoteStatus;
        //CheckDriversRemoteStatus;

        //ShowMessage(IntToStr(
        //  ADOConnectDM.ActiveCustADOQuery.FieldByName('Nomer_zakaza').AsInteger));
        //RefreshMainGrid(
        //  ADOConnectDM.ActiveCustADOQuery.FieldByName('Nomer_zakaza').AsInteger);

      finally
        //ADOConnectDM.ReloadCurrOrderOccupAttempts;
        RemoteRefreshOnTime:=False;
      end;
      
     end;
   end; }
 end;

end;

procedure TADOConnectDM.RefreshMainGridAndDriverData;
begin
if (IniFile.ReadString('BUSINESS_DATA','enable_for_allXML_DEMO','NO')='YES') then
  begin
  end
else
 begin

  if MainADOConnection.Connected and not RefreshOnTime
    and not OrdersOperationInActive then
    begin
     try
        RefreshOnTime:=True;
        OrdersOperationInActive:=True;

      if BoldModelDM.HasSelfAskAttr then
      begin

        RefreshMainGridSys(
          ADOConnectDM.ActiveCustADOQuery.
          FieldByName('Nomer_zakaza').AsInteger);

        end;

     finally
            RefreshOnTime:=False;
            OrdersOperationInActive:=False;
     end;

  end;

 end;
 
end;

function TADOConnectDM.SetCurrUserParam(SetDispID: Boolean=True): Boolean;
var res: Boolean;
    usr_cnt: Integer;
begin
  res:=False;
  usr_cnt:=0;
  try
    ADOConnectDM.UnionObjADOTable.Active:=False;
    ADOConnectDM.UnionObjADOTable.Active:=True;

    ADOConnectDM.RegionsADOQuery.Active:=False;
    ADOConnectDM.RegionsADOQuery.Active:=True;

    ADOConnectDM.CurrUserADOQuery.Active:=False;
    ADOConnectDM.CurrUserADOQuery.Active:=True;

    USRLoginADOQuery.Active:=False;
    USRLoginADOQuery.Active:=True;
    CurrUserADOQuery.Parameters[0].Value:=
      USRLoginADOQuery.FindField('curr_usr_name').AsString;
    CurrUserFirstOnLastsSysEnterADOQuery.Parameters[0].Value:=
      USRLoginADOQuery.FindField('curr_usr_name').AsString;
    CurrUserADOQuery.Active:=False;
    CurrUserADOQuery.Active:=True;

    if (IniFile.ReadString('BUSINESS_DATA',
          '��_�������_�_��_�_�����_������','NO')='YES')  then
    begin
    try
      ActiveDBConnsADODS.Active:=False;
      ActiveDBConnsADODS.Active:=True;
      if ActiveDBConnsADODS.RecordCount>0 then
      begin
        ActiveDBConnsADODS.First;
        while not ActiveDBConnsADODS.Eof do
        begin
          if ActiveDBConnsADODS.FieldByName('Login').AsString=
            BoldModelDM.CurrLogin then
            begin
              usr_cnt:=usr_cnt+1;
              if usr_cnt>1 then
              begin
              ShowMessage('������������ � ����� ������ ('+
              ActiveDBConnsADODS.FieldByName('Login').AsString+') ��������� � ���� ������!');
              res:=true;
              Break;
              end;
            end;
          ActiveDBConnsADODS.Next;
        end;
      end;
    except on E: Exception do
      ShowMessage('��������� ������ ������ �������������, ������������ � ���� ������!');
    end;
    end;

    if CurrUserADOQuery.RecordCount=1 then
      begin
       CurrDispUserID:=
         BoldModelDM.CurrUserADOQuery.FindField('BOLD_ID').AsInteger;
       if SetDispID then
        ActiveCustADOQuery.Parameters.ParamByName('disp_id').Value:=
          BoldModelDM.CurrUserADOQuery.FindField('BOLD_ID').AsInteger;

        if (IniFile.ReadString('BUSINESS_DATA',
          '��_����������_����������������_���������������_������','NO')='YES')  then
          FirstForm.PrevOrdersMenu.Enabled := True;

        if not (IniFile.ReadString('BUSINESS_DATA','filter_by_manual_ready','NO')='YES') and
           (IniFile.ReadString('BUSINESS_DATA','��_����������_����������������_���������������_������','NO')='YES')  then
          begin
           ActiveCustADOQuery.Filter:='(Predvariteljnyi=0) or (Zadeistv_predvarit=1)';
           ActiveCustADOQuery.Filtered:=
             True;
          end
        else if (IniFile.ReadString('BUSINESS_DATA','filter_by_manual_ready','NO')='YES') then
          begin
           if (IniFile.ReadString('BUSINESS_DATA','��_����������_����������������_���������������_������','NO')='YES') then
              ActiveCustADOQuery.Filter:='(Yavl_pochasovym=0) and (Predvariteljnyi=0) or (Zadeistv_predvarit=1)'
           else
              ActiveCustADOQuery.Filter:='Yavl_pochasovym=0';
           ActiveCustADOQuery.Filtered:=
             True;
          end
        else
          begin
          end;


        RefreshMainGrid(-1);

        CurrDispUserLoginName:=
          CurrUserADOQuery.FindField('login').AsString;
        
        HasNewDataADOQuery.Parameters[0].Value:=
          BoldModelDM.CurrUserADOQuery.FindField('BOLD_ID').AsInteger;
        HasNewDataADOQuery.Active:=False;
        HasNewDataADOQuery.Active:=True;
        NewMoveCustADOQuery.Parameters[0].Value:=
          BoldModelDM.CurrUserADOQuery.FindField('BOLD_ID').AsInteger;
        NewMoveCustADOQuery.Active:=False;
        NewMoveCustADOQuery.Active:=True;
      end
    else
      begin
        ShowMessage('�� ������ ��� ����� ������ ������������ � ������� '
        +USRLoginADOQuery.FindField('curr_usr_name').AsString);
      end;
  except
    ShowMessage('��������� ���������� ������� ����� �������� ������������!');
  end;
  Result:=res;
end;

function TADOConnectDM.OrderCheckToRemoteInit(OrderID: Integer; allowNoRemote: Boolean=True): Boolean;
var res: Boolean;
begin
  res:=False;
  try
    OrderHasCheckRemoteADOQuery.Active:=False;
    OrderHasCheckRemoteADOQuery.Parameters.ParamByName('BOLD_ID').Value:=
      OrderID;
    OrderHasCheckRemoteADOQuery.Active:=True;
    if OrderHasCheckRemoteADOQuery.RecordCount>0 then
      if (OrderHasCheckRemoteADOQuery.
      FindField('REMOTE_SET').AsInteger<=6)
      and ( (OrderHasCheckRemoteADOQuery.
      FindField('REMOTE_SET').AsInteger<>0)
      or allowNoRemote)
      //((OrderHasCheckRemoteADOQuery.
      //FindField('REMOTE_SET').AsInteger>=4) and
      // (OrderHasCheckRemoteADOQuery.
      // FindField('REMOTE_SET').AsInteger<=6))
      then
        res:=True;
  except
    ShowMessage('��������� ���������� ���������� �� ����� �������� ������� � ��������� ����!');
  end;
  Result:=res;
end;

function TADOConnectDM.GetOrderRemoteSetParam(OrderID: Integer): Integer;
var res: Integer;
begin
  res:=0;
  try
    OrderHasCheckRemoteADOQuery.Active:=False;
    OrderHasCheckRemoteADOQuery.Parameters.ParamByName('BOLD_ID').Value:=
      OrderID;
    OrderHasCheckRemoteADOQuery.Active:=True;
    if OrderHasCheckRemoteADOQuery.RecordCount>0 then
      res:=OrderHasCheckRemoteADOQuery.FindField('REMOTE_SET').AsInteger;
  except
    ShowMessage('��������� ���������� ���������� �� ����� �������� ������� � ��������� ����!');
  end;
  Result:=res;
end;


function TADOConnectDM.WaitOrdersOperation: Boolean;
var res: Boolean;
    StartID: Integer;
begin
  res:=False;
  //WaitCounter:=0;
  try
  if ActiveCustADOQuery.active then
  if ActiveCustADOQuery.RecordCount>0 then
  begin
    StartID:=ActiveCustADOQuery.
      FindField('BOLD_ID').AsInteger;
  try

  if ADODMUnit.OrdersOperationInActive then
  begin
    ADODMUnit.OrdersOperationAccept:=True;
    AppWaitForm.ShowModal;
    ADODMUnit.OrdersOperationAccept:=False;
    //while(OrdersOperationInActive and (WaitCounter<10)) do
    //begin
    //  sleep(500);
    //  WaitCounter:=WaitCounter+1;
    //end;
    if OrdersOperationInActive then
    begin
      //OrdersOperationInActive:=True;
      res:=True;
    end;
  end
  else
  begin
    ADODMUnit.OrdersOperationInActive:=True;
    res:=True;
  end;

  finally
    ADODMUnit.OrdersOperationAccept:=False;
    //AppWaitForm.Close;
  end;

  if ActiveCustADOQuery.active then
  begin
  if ActiveCustADOQuery.RecordCount>0 then
  begin
  if
    StartID<>ActiveCustADOQuery.
      FindField('BOLD_ID').AsInteger then
      res:=False;
  end
  else
    res:=False;
  end
  else
    res:=False;

  end;

  except on E:Exception do
    begin
      //ShowMessage(E.Message);
      res:=False;
    end;
  end;
  
  Result:=res;
end;

function TADOConnectDM.getDrActiveRemoteOrdCount(DriverID: Integer): Integer;
var res: Integer;
begin
  res:=-1;

  try
    DrRemOrdCountADODS.Active:=False;
    DrRemOrdCountADODS.Parameters.
      ParamByName('driver_id').Value:=DriverID;
    DrRemOrdCountADODS.Active:=True;
    if DrRemOrdCountADODS.Active then
    if DrRemOrdCountADODS.RecordCount>0 then
      res:=DrRemOrdCountADODS.FindField
        ('order_count').AsInteger;
  except on E:Exception do
    begin
      res:=-1;
      ShowMessage('��������� ������ ���������� �������� ��������-������! '+E.Message);
    end;
  end;

  Result:=res;
end;

function TADOConnectDM.SetDriver(DrNum: Integer): Boolean;
var res: Boolean;
    HasPrevDrv, PrevOnLaunch, DenyRemoteOrder: Boolean;
    PrevDrvNum, RemoteActDrCount: Integer;
    REMOTE_SET_SQL: string;
    SMSSendState: Integer;
    DrSMSSendState: Integer;
    DrPhone: string;
begin
res:=False;

if WaitOrdersOperation then
begin
try

DenyRemoteOrder:=False;

try

if DrNum=NULL then
	DrNum:=0;
if DrNum>0 then
    begin
		PrevOnLaunch:=False;
		if (IniFile.ReadString('BUSINESS_DATA',
		'ask_before_on_launch_driver_set',
		'YES')='YES') then
    begin
      PrevOnLaunch:=OnLaunch(DrNum);
			if PrevOnLaunch then
			begin
				ShowMessage('������ ������ ��������� �� ��������!');
                Result:=False;
			  Exit;
			end;
    end;
	
	if (IniFile.ReadString('BUSINESS_DATA',
		'�������_�����_���_���_���_��_�������_�����',
		'NO')='YES') then
    begin
			if getDriverCalcBlocked(DrNum) then
			begin
				BoldModelDM.SendSQL('UPDATE Zakaz SET Pozyvnoi_ustan=0 WHERE BOLD_ID='+
					ActiveCustADOQuery.FindField(
					'BOLD_ID').AsString);
				ShowMessage('������ �������� � ���������!');
                Result:=False;
			  Exit;
			end;
    end;

    if (IniFile.ReadString('BUSINESS_DATA',
		'�������_�����_���_���_���_��_�������������_�����',
		'NO')='YES') then
    begin
			if getDriverCalcBlockedDyn(DrNum) then
			begin
				BoldModelDM.SendSQL('UPDATE Zakaz SET Pozyvnoi_ustan=0 WHERE BOLD_ID='+
					ActiveCustADOQuery.FindField(
					'BOLD_ID').AsString);
				ShowMessage('������ �������� � ��������� �� ���. �������!');
                Result:=False;
			  Exit;
			end;
    end;

    if (ActiveCustADOQuery.
				FindField('Telefon_klienta').
				AsString='') then
				begin
          if (IniFile.ReadString('BUSINESS_DATA',
		        '��������_�_������_��������',
		        'YES')='YES') then
					ShowMessage('�� ���������� ������� - �������� � ���� ������ ����������!');
          //Exit;
				end;

		if ActiveCustADOQuery.FindField('Adres_vyzova_vvodim').AsString='' then
		begin
			ShowMessage('�� ���������� �����!');
			ActiveCustADOQuery.CancelUpdates;
      Result:=False;
      Exit;
    end
		else
		//������� ���� ���������� ���� ������ ��������
		if GetDrByNum(DrNum) then
    begin

      if (DrInfoADOQuery.FindField
      ('ITS_REMOTE_CLIENT').AsInteger=1)
      and PrevOnLaunch then
			begin
				ShowMessage('�������� �������� ���� �� �������, ����� �������� ���������� � ������!');
			  //Exit;
			end;

      HasPrevDrv:=False;
      PrevDrvNum:=0;
      //�������� �� ������� ������ � ������� �������������� ���������

			if ActiveCustADOQuery.FindField(
			'vypolnyaetsya_voditelem').AsInteger>-1 then
            begin
              HasPrevDrv:=True;
              PrevDrvNum:=
                ActiveCustADOQuery.FindField(
				'vypolnyaetsya_voditelem').AsInteger;
      end;
      if HasPrevDrv and (PrevDrvNum>0) then
      begin
      end;

      RemoteActDrCount:=getDrActiveRemoteOrdCount
        (DrInfoADOQuery.FindField('BOLD_ID').AsInteger);

      if ActiveCustADOQuery.FindField
        ('NO_TRANSMITTING').AsInteger=1 then
         DenyRemoteOrder:=True;

      if not DenyRemoteOrder then
      if ((RemoteActDrCount<0) or (RemoteActDrCount>1)) then
      begin
        DenyRemoteOrder:=True;
        if (IniFile.ReadString('���������_��������',
			    '�����_���������_��������_�����_��������','NO')='YES') and
          (DrInfoADOQuery.FindField('ITS_REMOTE_CLIENT').AsInteger=1)
			  then
          ShowMessage('����� ��������-������ ��������'+
            ' ����� 2-�, ������ ����� ��������� ��� '+
            '������� �������!');
      end
      else
      begin
        if (IniFile.ReadString('���������_��������',
			    '�����_���������_��������_�����_��������','NO')='YES') and
          (IniFile.ReadString('���������_��������',
			    '����������_�������_�������_���_����������','NO')='YES') and
          (DrInfoADOQuery.FindField('ITS_REMOTE_CLIENT').AsInteger=1)
			  then
          if not self.PresentMessageDlg('��������� ��������'+
            ' ��������? ��� - ������ ��������� ��� ������� �������.')
            then
              DenyRemoteOrder:=True;
      end;

			//���� ������������ ��� ���������� �� ���-�
			REMOTE_SET_SQL:='';
			if (IniFile.ReadString('���������_��������',
			'�����_���������_��������_�����_��������','NO')='YES') and
      (DrInfoADOQuery.FindField('ITS_REMOTE_CLIENT').AsInteger=1) and
      not DenyRemoteOrder
			then
      begin

					//if OrderCheckToRemoteInit(ActiveCustADOQuery.
					//FindField('BOLD_ID').AsInteger)
          //and
					//((ActiveCustADOQuery.FindField
					//('REMOTE_SET').AsInteger=0) or
					//(ActiveCustADOQuery.FindField
					//('REMOTE_SET').AsInteger>=4))
          //then
					//begin

            if (IniFile.ReadString('���������_��������',
						'���������_�����_����������_����_��������',
						'NO')='YES')
						then
            begin
              REMOTE_SET_SQL:=
              ', Pozyvnoi_ustan='+IntToStr(DrInfoADOQuery.FindField
				      ('Pozyvnoi').AsInteger)+', vypolnyaetsya_voditelem='+
				      IntToStr(DrInfoADOQuery.FindField('BOLD_ID').AsInteger)+
              ' , REMOTE_SET=8, REMOTE_INCOURSE=0'+
						  ', REMOTE_ACCEPTED=0, Priority_counter=0, REMOTE_DRNUM='+
						  IntToStr(DrInfoADOQuery.
						  FindField('Pozyvnoi').AsInteger)+' ';
              if (IniFile.ReadString('���������_��������',
						    '�������_�������������_�_�������_����������',
						    'NO')='YES')
						  then
                REMOTE_SET_SQL:=REMOTE_SET_SQL+', REMOTE_SYNC=1 ';
            end
            else
						  REMOTE_SET_SQL:=
              ', Pozyvnoi_ustan=0, REMOTE_SET=1, REMOTE_INCOURSE=0'+
						  ', REMOTE_ACCEPTED=0, REMOTE_SYNC=0, Priority_counter=0, REMOTE_DRNUM='+
						  IntToStr(DrInfoADOQuery.
						  FindField('Pozyvnoi').AsInteger)+' ';

						if (IniFile.ReadString('���������_��������',
						'�����_���_��������������_���_����_���������',
						'NO')='YES')
						then REMOTE_SET_SQL:=
							REMOTE_SET_SQL+', Individ_order=1 ';

            //if (IniFile.ReadString('���������_��������',
						//'������������_��������������_���������',
						//'NO')='YES')
						//then REMOTE_SET_SQL:=
						//	REMOTE_SET_SQL+', Individ_sending=0 '
            //else
            //  REMOTE_SET_SQL:=
						//	REMOTE_SET_SQL+', Individ_sending=1 ';

            if not SendSQL('UPDATE Zakaz SET otpravlyaetsya='+
				      IntToStr(BoldModelDM.CurrUserADOQuery.
              FindField('BOLD_ID').AsInteger)+', adr_manual_set=1 '+
              //IntToStr(DrInfoADOQuery.FindField
				      //('Pozyvnoi').AsInteger)+', vypolnyaetsya_voditelem='+
				      //IntToStr(DrInfoADOQuery.FindField('BOLD_ID').AsInteger)+
				      REMOTE_SET_SQL+' WHERE BOLD_ID='+IntToStr(
				      ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
					      ShowMessage('��������� ��������� �����'+
					      ' ������ � ����������� ��������, ����'+
					      ' ���������� ��������� ������, ���� �������� �� ������!');

					//end
					//else
					//	ShowMessage('������ ������ ���'+
					//	' ���������� � ���� ������! ���������'+
					//	' ���������� �������� ��� ������ � ��������� ��������.');

      end
      else
      //����� ����� ������ ����� ��-�� ���-�
      begin
      //���� �������� ��������� �������� ��� ����������
      //��� ���������

      REMOTE_SET_SQL:=', REMOTE_SET=0, REMOTE_INCOURSE=0, REMOTE_SYNC=0'+
						', REMOTE_ACCEPTED=0, adr_manual_set=1, Priority_counter=0, REMOTE_DRNUM=0';

        //���� ������� �������� ���������� ��� ���. ��� ����������
      //if not OrderCheckToRemoteInit(ActiveCustADOQuery.
			//		FindField('BOLD_ID').AsInteger) then
      //    begin
      //      ShowMessage('������ ������ ���'+
			//			' ���������� � ���� ������! ���������'+
			//			' ���������� �������� ��� ������ � ��������� ��������.');

      //    end
      //else
			if not SendSQL('UPDATE Zakaz SET otpravlyaetsya='+
				IntToStr(BoldModelDM.CurrUserADOQuery.FindField('BOLD_ID').AsInteger)+
				', Pozyvnoi_ustan='+IntToStr(DrInfoADOQuery.FindField
				('Pozyvnoi').AsInteger)+', vypolnyaetsya_voditelem='+
				IntToStr(DrInfoADOQuery.FindField('BOLD_ID').AsInteger)+
				REMOTE_SET_SQL+' WHERE BOLD_ID='+IntToStr(
				ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
					ShowMessage('��������� ��������� �����'+
					' ������ � ����������� ��������, ����'+
					' ���������� ��������� ������, ���� �������� �� ������!')
			else
            begin

                //���� �������� ��� �������
				//�� ���������� ���� ������ � ������ �������
				if (IniFile.ReadString('���������_��������',
                    '�������������_����������_SMS_�������_���_��������_���������',
					'NO')='YES') and (ActiveCustADOQuery.FindField
        ('NO_TRANSMITTING').AsInteger=0) then
                begin

					if (ActiveCustADOQuery.FindField
					('Adres_vyzova_vvodim').AsString='') or
                    not (DrInfoADOQuery.FindField('Pozyvnoi').AsInteger>0) or
                    (ActiveCustADOQuery.FindField
					('Telefon_klienta').AsString='') then
                    begin
                        ShowMessage('�� ���������� �����,'+
							' ������� ��� ��� ������ � ��������'+
							' �������� (���������� ������ ������ ��������)!');
                            //ActiveCustADOQuery.CancelUpdates;
                    end
                    else
                    begin
                        SMSSendState:=
							GetClSMSSendState(ActiveCustADOQuery.
							FindField('BOLD_ID').AsInteger);

						if (SMSSendState<>1) and
                            (ActiveCustADOQuery.FindField
							('CLIENT_SMS_SEND_STATE').
							AsInteger<>1) then
                            begin
                              //DrPhone:=GetDrPhoneByDrNum(ActiveCustADOQuery.FindField('Pozyvnoi_ustan').AsInteger);
								if	(Length(ActiveCustADOQuery.
								FindField('Telefon_klienta').
								AsString) >= 5) then
								begin
									SendSMSToClient
									(ActiveCustADOQuery.
									FindField('BOLD_ID').AsInteger);
								end
								else
									ShowMessage('������������ �����'+
									' �������� ������� ��� �������� ���!');
                            end
							else
								ShowMessage('SMS �� ������ ������'+
								' ��� ������������ ��������, ��������� ����������!');

                    end;


                end;
				//����� �������� ��� �������

                //���� �������� ��� ��������
				//�� ���������� ���� ������ � ������ �������
				if (IniFile.ReadString('���������_��������',
                    '�������������_����������_SMS_��������_���_��������_���������',
					'NO')='YES') and (ActiveCustADOQuery.FindField
        ('NO_TRANSMITTING').AsInteger=0) then
                begin

                    if (ActiveCustADOQuery.FindField
						('Adres_vyzova_vvodim').AsString='') or
                        not (DrInfoADOQuery.FindField
						('Pozyvnoi').AsInteger>0) or
                        (ActiveCustADOQuery.FindField
						('Telefon_klienta').AsString='') then
                    begin
                        ShowMessage('�� ���������� �����, '+
						'������� ��� ��� ������ � �������� '+
						'�������� (���������� ������ ������ ��������)!');
                              //ActiveCustADOQuery.CancelUpdates;
                    end
                    else
                    begin
                        DrSMSSendState:=GetDrSMSSendState(
						ActiveCustADOQuery.FindField('BOLD_ID').AsInteger);

                        if (DrSMSSendState<>1) and
							(ActiveCustADOQuery.FindField
							('DRIVER_SMS_SEND_STATE').
							AsInteger<>1) then
                        begin
                            DrPhone:=GetDrPhoneByDrNum(
							DrInfoADOQuery.FindField('Pozyvnoi').AsInteger);

							if (StrToInt64Def(DrPhone,-1)<>-1) and
								(Length(DrPhone) >= 5) then
                            begin
                                SendSMSToDriver(ActiveCustADOQuery.
								FindField('BOLD_ID').AsInteger,
                                DrPhone,'');
                            end
                            else
                                ShowMessage('������������ �����'+
								' �������� �������� ''' + DrPhone + ''', ���������'+
								' � ����������� ���������!');
                        end
                            else
                                ShowMessage('SMS �� ������ ������'+
								' ������������ ��������, ��������� ����������!');

                    end;


                end;
				//����� �������� ��� �������

            if PrevOnLaunch then
            if not SendSQL('UPDATE Voditelj SET '+
				'Zanyat_drugim_disp=1, Na_pereryve=0 '+
				' WHERE BOLD_ID='+IntToStr(DrInfoADOQuery.
				FindField('BOLD_ID').AsInteger)) then
					ShowMessage('��������� ��������� �������� ��������� ��������!')


            end;
			//����� ����� ������ ��� ����������
      end;

		end;
		//����� �������� ����� ���� ���� ������ ��������

    end
  //���� ���� ��������� ������� ��������
  else
	begin
		HasPrevDrv:=False;
    PrevDrvNum:=0;
    //�������� �� ������� ������ � ������� �������������� ���������
    //ShowMessage('0');
		if ActiveCustADOQuery.FindField
			('vypolnyaetsya_voditelem').
			AsInteger>-1 then
        begin
            HasPrevDrv:=True;
            PrevDrvNum:=
                ActiveCustADOQuery.FindField
				('vypolnyaetsya_voditelem').AsInteger;
        end;

    REMOTE_SET_SQL:=', REMOTE_SET=0, REMOTE_INCOURSE=0, REMOTE_SYNC=0'+
						', REMOTE_ACCEPTED=0, Priority_counter=0, REMOTE_DRNUM=0'+
            ', Pozyvnoi_ustan=0, adr_manual_set=1, konechnyi_sektor_raboty=-1, SECTOR_ID=-1'+
            ', WAITING=0, CLIENT_SMS_SEND_STATE=0, DRIVER_SMS_SEND_STATE=0, direct_sect_id=-1 ';

		if not SendSQL('UPDATE Zakaz SET vypolnyaetsya_voditelem=-1'+
            REMOTE_SET_SQL+' WHERE BOLD_ID='+
            IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').
            AsInteger)) then
                ShowMessage('��������� ��������� ������ ����� � ���������!');

		if HasPrevDrv then
		begin

			if not OccupateByID(PrevDrvNum) then
			begin

				if not SendSQL('UPDATE Voditelj SET Zanyat_drugim_disp=0'+
                    ' WHERE BOLD_ID='+IntToStr(PrevDrvNum)) then
                        ShowMessage('��������� ��������� ��������'+
						' ����������� �������� ��������!');

			end
			else
			begin
				if not SendSQL('UPDATE Voditelj SET Zanyat_drugim_disp=1'+
					' WHERE BOLD_ID='+IntToStr(PrevDrvNum)) then
					ShowMessage('��������� ��������� ��������'+
					' ��������� �������� ��������!');
			end;
		end;

		//if not SendSQL('UPDATE Zakaz SET'+
    //        ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.
		//	FindField('BOLD_ID').AsInteger)) then
    //            ShowMessage('��������� ��������� �������� ���������!');
	end;
	//����� ����� ��������� �������� ���������

except on E:Exception do
  ShowMessage('������ ���������� ��������! '+E.Message);
end;

finally
  OrdersOperationInActive:=False;
end;
end
else
  begin
    //����� �� ��������?????
    ActiveCustADOQuery.CancelUpdates;
    ShowMessage('�������� ��������, ��������� ������� ������!');
  end;

	Result:=res;
end;

function TADOConnectDM.OnLaunch(DrNum: Integer): Boolean;
var res: Boolean;
begin
  res:=False;
  if DrNum>0 then
    begin
      if GetDrByNum(DrNum) then
        begin
          if DrInfoADOQuery.FindField('na_pereryve').AsInteger<>0 then
            res:=True;
        end;
    end;
  Result:=res;
end;

function TADOConnectDM.OccupateByID(BID: Integer): Boolean;
var res: Boolean;
begin
  res:=False;
  try
    DriverByBoldIDADOQuery.Parameters[0].Value:=BID;
    DriverByBoldIDADOQuery.Active:=False;
    DriverByBoldIDADOQuery.Active:=True;
    res:= Ocuppate(DriverByBoldIDADOQuery.FindField('Pozyvnoi').AsInteger);
  except
    ShowMessage('��������� ����� �������� �� �����!');
  end;
  Result:=res;
end;

function TADOConnectDM.Ocuppate(DrNum: Integer): Boolean;
var res: Boolean;
begin
  res:=False;
  if DrNum>0 then
    begin
      if GetDrByNum(DrNum) then
        begin
          if GetActiveDrCustCount(DrNum)>0 then
            res:=True;
        end;
    end;
  Result:=res;
end;

function TADOConnectDM.GetActiveDrCustCount(DrNum: Integer): Integer;
var res: Integer;
begin
  res:=0;
  try
    DrActCustADOQuery.Parameters[0].Value:=
      DrNum;
    DrActCustADOQuery.Active:=False;
    DrActCustADOQuery.Active:=True;
    res:=DrActCustADOQuery.RecordCount;
  except
    ShowMessage('��������� ������ ����� ������������� ������ �� ���������� ��������!');
  end;
  Result:=res;
end;

function TADOConnectDM.GetDrByNum(DrNum: Integer): Boolean;
var res: Boolean;
begin
  res:=True;
  try
    DrInfoADOQuery.Parameters[0].Value:=
      DrNum;
    DrInfoADOQuery.Active:=False;
    DrInfoADOQuery.Active:=True;
    if DrInfoADOQuery.RecordCount<>1 then
      begin
        res:=False;
        ShowMessage('����� ��� ���� ��� �� ������ �������� � �������� '+IntToStr(DrNum));
      end;
  except
    res:=False;
    ShowMessage('��������� ������ �������� �� ��������� - '+InttoStr(DrNum));
  end;
  Result:=res;
end;

function TADOConnectDM.SetSale(Sale: Double; EnableSpecZeroSet: Boolean=False): Boolean;
var //temp_id: Integer;
    //date_prm: TParameter;
    SMSSendState, remote_set: Integer;
    sendSMS, allowRemClose: Boolean;
begin
ReleaseStructForm.CheckUsePeriod;

sendSMS:=False;
allowRemClose:=False;

if WaitOrdersOperation then
begin
try

try

if (ActiveCustADOQuery.FieldByName('Slugebnyi').AsInteger=0)
	and EnableSpecZeroSet then
    begin
        ShowMessage('������ ������ �� �������� ��� ���������!');
        Result:=False;
        Exit;
    end;
	
if Sale=NULL then
  Sale:=0;
  
if (Sale>0) or EnableSpecZeroSet then
	begin

		if True
      then
		begin
		if True
      then
		begin

      if ActiveCustADOQuery.FindField(
			'vypolnyaetsya_voditelem').AsInteger>0 then
      begin

      remote_set:=
      ActiveCustADOQuery.
					FindField('REMOTE_SET').AsInteger;

      if (IniFile.ReadString('���������_��������',
			'�����_���������_��������_�����_��������','NO')='YES') and
      (remote_set>=8) then
      begin
        if (IniFile.ReadString('���������_��������',
						'���������_�����_������_����_������',
						'NO')='YES')
        then
        begin
          if (IniFile.ReadString('���������_��������',
						'����������_���_������_���_����_������',
						'YES')='NO')
            then
            allowRemClose:=True;
          if not allowRemClose then
          if self.PresentMessageDlg('������ ������ ����������� ��������, '+
            '��������� �������?') then
            allowRemClose:=True;
          if allowRemClose then
            if not SendSQL('UPDATE Zakaz SET Zavershyon=1'+
					  ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.
					  FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ��������� '+
                '�������� ���������� ������!');
        end;
      end
      else if (IniFile.ReadString('���������_��������',
			'�����_���������_��������_�����_��������','NO')='YES') and
        (remote_set>0) and (remote_set<8) then
      begin
        ShowMessage('������ �� ����� �������!');
      end
      else
      begin
			    if not SendSQL('UPDATE Zakaz SET Zavershyon=1'+
					  ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.
					  FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ��������� '+
                '�������� ���������� ������!')
          else
            sendSMS:=True;
      end;
      end
      else
      begin
        ShowMessage('��� ����� � ���������!');
        Result:=False;
        Exit;
      end;

      //���� ��������� ��������� �������� ����� ������
			//����� ����� ��������� ��������� ��������
				
			//�������� ��� �������, ������ ������� ������������� 
			//������ � ������ ������
      if sendSMS then
			if (IniFile.ReadString('���������_��������',
                '��������_������_������_�����','NO')='YES') then
            begin

				if (ActiveCustADOQuery.FindField
					('Adres_vyzova_vvodim').AsString='') or
                    (ActiveCustADOQuery.FindField
					('Telefon_klienta').AsString='') then
                begin
                    ShowMessage('�� ���������� �����,'+
					' ������� ��� ��� ������ � ��������'+
					' �������� (���������� ������ ������ ��������)!');       
                end
                else
                begin
                    SMSSendState:=
                        GetClSMSSendState(ActiveCustADOQuery.
						FindField('BOLD_ID').AsInteger);
                          
					if ((SMSSendState<>1) and
                            (ActiveCustADOQuery.FindField
							('CLIENT_SMS_SEND_STATE').
							AsInteger<>1) and (SMSSendState<>3) and
                            (ActiveCustADOQuery.FindField
							('CLIENT_SMS_SEND_STATE').
							AsInteger<>3)) then
                    begin
                              
                        if (Length(ActiveCustADOQuery.
							FindField('Telefon_klienta').AsString) >= 5) then
                        begin
                            SendSaleToClient
                                (ActiveCustADOQuery.
								FindField('BOLD_ID').AsInteger);
                        end
                        else
                            ShowMessage('������������ �����'+
							' �������� ������� ��� �������� ���!');
                    end
                    else
                        ShowMessage('SMS �� ������ ������ ���'+
						' ������������ ��������, ��������� ����������!');

                end;
				
            end;
			//����� ����� ������� ��� �������
        end
		else
			ShowMessage('������ ������ ��� ��������� ������ �������������!');
		end
		else
			ShowMessage('������ ������ �������'+
				' �� ���� ������ �������������, ����'+
				' ��������� ������ � ����� ID!');    
       //��������� ���������� ���������� �
       //���� � ����� ��������� �������
	end;

except on E:Exception do
  ShowMessage('������ ��������� ������! '+E.Message);
end;

finally
  OrdersOperationInActive:=False;
end;
end
else
  begin
    //����� �� ��������?????
    ActiveCustADOQuery.CancelUpdates;
    ShowMessage('�������� ��������, ��������� ������� ������!');
  end;
  Result:=True;
end;

function TADOConnectDM.SendSQL(SQL: Widestring): Boolean;
var res: Boolean;
begin
  res:=True;
  try
    MainADOCommand.CommandText:=SQL;
    MainADOCommand.Execute;
  except
    res:=False;
  end;
  Result:=res;
end;

function TADOConnectDM.SendSQLModel(SQL: Widestring): Boolean;
var res: Boolean;
begin
  res:=True;
  try
    ADOCommandModel.CommandText:=SQL;
    ADOCommandModel.Execute;
  except
    res:=False;
  end;
  Result:=res;
end;

procedure PlaySnd(filename: String);
var PCh: PChar;
begin
try
StrPCopy(PCh,filename);
PlaySound(Pch,0,SND_ASYNC);
except on E:Exception do
end;
end;

procedure TADOConnectDM.DataModuleCreate(Sender: TObject);
begin
  MainADOConnection.Connected:=False;
  MainADOConnection.ConnectionString:='FILE NAME='+GetCurrentDir+'\UnionDisp.udl';
  MainADOConnection.LoginPrompt:=True;
  //PlaySnd(GetCurrentDir+'\SoundRecord\2021_32.wav');
  //FirstForm.MediaPlayer1.Play;
  ADOIniFile:=TIniFile.Create(GetCurrentDir+'\UnionDisp.ini');

  ActiveCustADOQuery.Connection:=nil;

  if IniFile.ReadString('BUSINESS_DATA',
    '�����_��������_������_���������','NO')='YES' then
   begin

    try
      ShowMessage('���� �������� ��� ���������: '+DateToStr(StrToDate(
        IniFile.ReadString('BUSINESS_DATA',
        '����_������_��������_�����_���������','NO'))));
    except
      ShowMessage('������� ���������� ���� �������� ��� ���������!');
    end;

   end;

  if IniFile.ReadString('BUSINESS_DATA','��_��������_����������_��_������������_������','NO')='YES' then
   begin

    ActiveCustADOQuery.SQL.LoadFromFile(
      CDP+'\sql_settings\main_table1_not_inum.sql');

   end
  else
    ActiveCustADOQuery.SQL.LoadFromFile(
      CDP+'\sql_settings\main_table1.sql');
  ActiveCustADOQuery.Connection:=MainADOConnection;

  MainADOConnection.Close;
  if (IniFile.ReadString('BUSINESS_DATA',
    '����������_����_��_������_��������','NO')='NO') then
    begin
      N9.Visible:=False;
    end;

  if (IniFile.ReadString('BUSINESS_DATA',
    '��������_����_������_��������','NO')='NO') then
      begin
        N12.Visible:=False;
      end;

  if (IniFile.ReadString('���������_��������',
    '���������_�������_SMS_���������','YES')='YES') then
      begin
        MainForm.FirstForm.SendSMSToDrToolButton.Enabled:=False;
      end;
end;

procedure TADOConnectDM.GetINumHistory(i_num: string);
begin
 try
  StrToInt(i_num);
  if (IniFile.ReadString('BUSINESS_DATA',
         '��������_����_������_��������','NO')='YES') then
           begin
               ReleaseStructForm.LastWeekIndOrdTabSheet.Show;
               LastWeekIndADOQuery.Active:=False;
               LastWeekIndADOQuery.Parameters.FindParam('inum').Value:=
                 i_num;
               LastWeekIndADOQuery.Active:=True;
           end;
  except
  end;
end;

procedure TADOConnectDM.ActiveCustADOQueryAfterPost(DataSet: TDataSet);
begin
if ReleaseStructForm.DispDBGrid.SelectedField<>nil then
  CurrQueryFieldName:=ReleaseStructForm.DispDBGrid.SelectedField.FieldName;

 try
 if not RefreshBaseGrids and ReleaseStructForm.DispDBGrid.CanFocus then
 begin

  if CurrQueryFieldName='Uslovn_stoim' then
    begin

      SetSale(ActiveCustADOQuery.FindField('Uslovn_stoim').AsFloat);
      RefreshMainGrid(ActiveCustADOQuery.
        FindField('Nomer_zakaza').AsInteger);

      ReleaseStructForm.DispDBGrid.SelectedField:=
         ReleaseStructForm.DispDBGrid.Fields[
           ADOConnectDM.GetFieldNumByName('Telefon_klienta')];
      BoldOthHandleCompDM.SetCustCount;
    end
   else if CurrQueryFieldName='Primechanie' then
    begin
      if (IniFile.ReadString('BUSINESS_DATA',
         '����������_��������_������','NO')='YES') then
           begin
             SetEntSectBySymb(ActiveCustADOQuery.FindField('Primechanie').AsString);
             RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger, False);

             ReleaseStructForm.DispDBGrid.SelectedField:=
               ReleaseStructForm.DispDBGrid.Fields[
                 ADOConnectDM.GetFieldNumByName('Uslovn_stoim')];
           end;
    end
  else if CurrQueryFieldName='Adres_okonchaniya_zayavki' then
    begin
     if (IniFile.ReadString('BUSINESS_DATA',
        '���������_��������_�������_�����_��������_��������_�_�������','NO')='YES') then
      begin
       RefreshMainGrid(ActiveCustADOQuery.FindField
          ('Nomer_zakaza').AsInteger, False);
       ADOConnectDM.GetINumHistory(
         ActiveCustADOQuery.FindField
         ('Adres_okonchaniya_zayavki').AsString);
      end;

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
  else if CurrQueryFieldName='Pozyvnoi_ustan' then
    begin
      SetDriver(ActiveCustADOQuery.FindField('Pozyvnoi_ustan').AsInteger);

      RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger);

      if (IniFile.ReadString('BUSINESS_DATA','����������_��_����_���_�������_�����_���������','NO')='YES') then
        ReleaseStructForm.DispDBGrid.SelectedField:=
           ReleaseStructForm.DispDBGrid.Fields[
                    ADOConnectDM.GetFieldNumByName('Primechanie')]
      else
        ReleaseStructForm.DispDBGrid.SelectedField:=
           ReleaseStructForm.DispDBGrid.Fields[
                    ADOConnectDM.GetFieldNumByName('Uslovn_stoim')];
    end
  else if CurrQueryFieldName='Adres_vyzova_vvodim' then
    begin
       HasDrChange:=False;
       SetAdress(ActiveCustADOQuery.FindField('Adres_vyzova_vvodim').AsString);
       if HasDrChange then
         RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger)
       else
         RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger, False);
       ReleaseStructForm.DispDBGrid.SelectedField:=
         ReleaseStructForm.DispDBGrid.Fields[
                  ADOConnectDM.GetFieldNumByName('Pozyvnoi_ustan')];
       end
  else if CurrQueryFieldName='Telefon_klienta' then
    begin
       HasDrChange:=False;
       if HasDrChange then
         RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger)
       else
         RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger, False);
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
    end;
    
 end
else
  begin
    ShowMessage('��� ���������� ������!');
    ActiveCustADOQuery.CancelUpdates;
  end;
except
  FirstForm.StatusBar.Panels[4].Text:=
     '������ ��������� onAfterPost!';
  if (IniFile.ReadString('BUSINESS_DATA','refresh_after_err_after_post','NO')='YES') then
    ADOConnectDM.RefreshMainGrid(-1);
end;
  if ReleaseStructForm.DispDBGrid.SelectedField<>nil then
  CurrQueryFieldName:=ReleaseStructForm.DispDBGrid.SelectedField.FieldName;
end;

procedure TADOConnectDM.DataRefreshTimerTimer(Sender: TObject);
begin
//������ ������� � ���������� ������ �������� ��������
  if GSMRING_distance_count<20 then
    GSMRING_distance_count:=
      GSMRING_distance_count+2;
  if GSM2RING_distance_count<20 then
    GSM2RING_distance_count:=
      GSM2RING_distance_count+2;
  if GSM3RING_distance_count<20 then
    GSM3RING_distance_count:=
      GSM3RING_distance_count+2;

if RefreshDelayCounter>0 then
 RefreshDelayCounter:=
  RefreshDelayCounter-1;

if ADODMUnit.OrdersOperationAccept and AppWaitForm.Showing then
begin
try
    ADODMUnit.OrdersOperationInActive:=True;
    AppWaitForm.Close;
finally
  ADODMUnit.OrdersOperationAccept:=False;
end;
end;

if (not (ADOConnectDM.dsActiveCust.State = dsEdit)) and
   (EnableManualRefresh
   or (IniFile.ReadString('BUSINESS_DATA',
   'manual_operator_refresh_mode','NO')='NO')) and
    EnableDriverRefresh then
     begin
       if RefreshDelayCounter<=0 then
         RefreshMainGridAndDriverData;
     end;
EnableManualRefresh:=
          False;
end;

procedure TADOConnectDM.N1Click(Sender: TObject);
var BCBE: TBoldElement;
begin
  if ActiveCustADOQuery.RecordCount>0 then
    begin
       if MessageDlg('����������� ����� � �����?', mtConfirmation,[mbYes,mbNo],0) = 6 then
      begin

      if MessageDlg('�������� ��� �������������?', mtConfirmation,[mbYes,mbNo],0) = 6 then
       begin
        BadReasone.ShowModal;
        BCBE:=TPlohie_Klienty.Create(nil,True);
       (BCBE as TPlohie_Klienty).Telefon_klienta:=ActiveCustADOQuery.FindField('Telefon_klienta').AsString;
       (BCBE as TPlohie_Klienty).Pozyvnoi:=ActiveCustADOQuery.FindField('Pozyvnoi_ustan').AsInteger;
       (BCBE as TPlohie_Klienty).Nachalo:=DateTimeToStr(ActiveCustADOQuery.FindField('Nachalo_zakaza_data').AsDateTime);
       (BCBE as TPlohie_Klienty).Adres_vyzova_vvodim:=BadReasone.sMemo1.Lines.Text+ActiveCustADOQuery.FindField('Adres_vyzova_vvodim').AsString;
        BoldModelDM.BoldUpdateDBAction1.Execute;
      end;

      if not SendSQL('UPDATE Zakaz SET Arhivnyi=1'+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ����������� ������ � �����!');
      if not SendSQL('UPDATE Zakaz SET Zavershyon=1, Adres_vyzova_vvodim=''������ ''+Adres_vyzova_vvodim, Konec_zakaza_data=(CAST(GETDATE() as DateTime)) '+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ����������� ������ � �����!');

      RefreshMainGrid(-1);
        
     end;
    end;

end;

procedure TADOConnectDM.dsActiveCustDataChange(Sender: TObject; Field: TField);
begin
if Field<>nil then
  CurrQueryFieldName:=Field.FieldName;
end;

procedure TADOConnectDM.RefreshPrevCustTimerTimer(Sender: TObject);
begin

if ModemSettingsForm.RxMemo.Lines.Count>300 then
   ModemSettingsForm.RxMemo.Clear;
if ModemSettingsForm.AdditRxMemo.Lines.Count>300 then
   ModemSettingsForm.AdditRxMemo.Clear;
if ModemSettingsForm.GSMMemo.Lines.Count>300 then
   ModemSettingsForm.GSMMemo.Clear;
if ModemSettingsForm.GSM2Memo.Lines.Count>300 then
   ModemSettingsForm.GSM2Memo.Clear;
if ModemSettingsForm.GSM3Memo.Lines.Count>300 then
   ModemSettingsForm.GSM3Memo.Clear;

   FindPrevCust;
   ReleaseStructForm.DispDBGrid.Repaint;

end;

procedure TADOConnectDM.N3Click(Sender: TObject);
begin
  ADOConnectDM.SetSpecCust;
end;

procedure TADOConnectDM.N2Click(Sender: TObject);
begin
  if ActiveCustADOQuery.FieldByName('Predvariteljnyi').AsInteger=0 then
        begin
    if PrevCustDatesForm.ShowModal=mrOk then
    begin
      PrevCustDatesForm.DateTimePicker2.Date:=0;
      PrevCustDatesForm.DateTimePicker1.Time:=0;
      ADOConnectDM.SetPrevCust
        (FloatToDateTime(Double(DateOf(PrevCustDatesForm.DateTimePicker1.Date))+
           TimeOf(PrevCustDatesForm.DateTimePicker2.Time)));
    end;
  end
    else
      ADOConnectDM.SetPrevCust
        (FloatToDateTime(Double(DateOf(PrevCustDatesForm.DateTimePicker1.Date))+
           TimeOf(PrevCustDatesForm.DateTimePicker2.Time)));

end;

procedure TADOConnectDM.DispCustToArhivePopupMenuPopup(Sender: TObject);
begin
  if ActiveCustADOQuery.RecordCount>0 then
    begin
      N1.Enabled:=True;
      Internet1.Enabled:=True;
      N15.Enabled:=False;
      N16.Enabled:=False;
      if not (IniFile.ReadString('���������_��������','�����_���������_��������','NO')='YES')       then
        begin
          Internet1.Enabled:=False;
        end;
      SMS1.Enabled:=True;
      SMS2.Enabled:=True;
      if (IniFile.ReadString('���������_��������','���������_�������_SMS_���������','YES')='YES') and not
      (IniFile.ReadString('���������_��������','���������_�������_����������_SMS_���������','NO')='YES')  then
        begin
          SMS2.Enabled:=False;
        end;
      if (IniFile.ReadString('���������_��������','���������_�������_����������_SMS_��������_�_����_������','NO')='NO') then
        begin
          SMS1.Enabled:=False;
        end;
      if (IniFile.ReadString('���������_��������','���������_�������_����������_SMS_���������','NO')='NO')       then
        begin
          SMS2.Enabled:=False;
        end;
      if ActiveCustADOQuery.FieldByName('Predvariteljnyi').AsInteger<>0 then
        begin
        DispCustToArhivePopupMenu.Items[1].Caption:='����� ��������������� �����...';
        if ActiveCustADOQuery.FieldByName('Zadeistv_predvarit').AsInteger=0 then
          begin
          Internet1.Enabled:=False;
          SMS1.Enabled:=False;
          SMS2.Enabled:=False;
          end;
        end
      else
        DispCustToArhivePopupMenu.Items[1].Caption:='�������� ��������������� �����...';
      if ActiveCustADOQuery.FieldByName('Slugebnyi').AsInteger<>0 then
        DispCustToArhivePopupMenu.Items[2].Caption:='����� ��������� �����...'
      else
        DispCustToArhivePopupMenu.Items[2].Caption:='�������� ��������� �����...';
      if (ActiveCustADOQuery.FieldByName('Nomer_skidki').AsInteger>0)
         or (ActiveCustADOQuery.FieldByName('Nomer_skidki').AsInteger=-100) then
         begin
           N15.Enabled:=True;
           N16.Enabled:=False;
           DispCustToArhivePopupMenu.Items[3].Enabled:=True;
         end
      else
        begin
        N15.Enabled:=False;
        N16.Enabled:=True;
        DispCustToArhivePopupMenu.Items[3].Enabled:=False;
        end;

      if (ActiveCustADOQuery.FieldByName('Telefon_klienta').AsString<>'')
         and (ActiveCustADOQuery.FieldByName('Adres_vyzova_vvodim').AsString<>'') then
           DispCustToArhivePopupMenu.Items[4].Enabled:=True
      else
        DispCustToArhivePopupMenu.Items[4].Enabled:=False;

      if (ActiveCustADOQuery.FieldByName('Telefon_klienta').AsString<>'') then
        N8.Enabled:=True;

      if (ActiveCustADOQuery.FieldByName('Zavershyon').AsInteger=0) and
         (ActiveCustADOQuery.FieldByName('Nomer_skidki').AsInteger=-1000) then
           N7.Enabled:=True
      else
           N7.Enabled:=False;
      if (BoldHandlesDM.blhDriversUnion.CurrentElement as
         TObjekt_vyborki_otchyotnosti).Vybratj_poslednie_nesk_dnei
         and (ActiveCustADOQuery.FieldByName('Nachalo_zakaza_data').AsVariant<>NULL) then
      begin
        N10.Enabled:=True;
      end;
      if ADOConnectDM.ActiveCustADOQuery.FieldByName('Predvariteljnyi').AsInteger<>0 then
      begin
        N1.Enabled:=False;
      end;
    end
  else
    begin
      DispCustToArhivePopupMenu.Items[0].Enabled:=False;
      DispCustToArhivePopupMenu.Items[1].Enabled:=False;
      DispCustToArhivePopupMenu.Items[2].Enabled:=False;
      DispCustToArhivePopupMenu.Items[3].Enabled:=False;
      N8.Enabled:=False;
      N7.Enabled:=False;
      N10.Enabled:=False;
      N11.Enabled:=False;
      N12.Enabled:=False;
      Internet1.Enabled:=False;
      SMS1.Enabled:=False;
      SMS2.Enabled:=False;
      N15.Enabled:=False;
      N16.Enabled:=False;
    end;

    if ActiveCustADOQuery.RecordCount>0 then
      N12.Enabled:=True;

end;

procedure TADOConnectDM.N4Click(Sender: TObject);
var BCBE: TBoldElement;
begin
  if EndedCustListADOQuery.RecordCount>0 then
    begin
       if MessageDlg('����������� ����� � �����?', mtConfirmation,[mbYes,mbNo],0) = 6 then
      begin
      if MessageDlg('�������� ��� �������������?', mtConfirmation,[mbYes,mbNo],0) = 6 then
       begin
        BCBE:=TPlohie_Klienty.Create(nil,True);
       (BCBE as TPlohie_Klienty).Telefon_klienta:= EndedCustListADOQuery.FindField('Telefon_klienta').AsString;
       (BCBE as TPlohie_Klienty).Pozyvnoi:= EndedCustListADOQuery.FindField('Pozyvnoi_ustan').AsInteger;
       (BCBE as TPlohie_Klienty).Nachalo:=DateTimeToStr( EndedCustListADOQuery.FindField('Nachalo_zakaza_data').AsDateTime);
       (BCBE as TPlohie_Klienty).Adres_vyzova_vvodim:= EndedCustListADOQuery.FindField('Adres_vyzova_vvodim').AsString;
        BoldModelDM.BoldUpdateDBAction1.Execute;
      end;

      if not SendSQL('UPDATE Zakaz SET Arhivnyi=1'+
              ' WHERE BOLD_ID='+IntToStr( EndedCustListADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ����������� ������ � �����!');
      if not SendSQL('UPDATE Zakaz SET Zavershyon=1'+
              ' WHERE BOLD_ID='+IntToStr( EndedCustListADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ����������� ������ � �����!');

      RefreshMainGrid(-1);
      ReleaseStructForm.QueryNotEndedCust;

     end;
    end;
end;

procedure TADOConnectDM.ActiveCustADOQueryBeforeEdit(DataSet: TDataSet);
begin
  try
  if ActiveCustADOQuery.RecordCount>0 then
   begin
    if ActiveCustADOQuery.FindField('Pozyvnoi_ustan').Value<>NULL then
     begin
       PrevPoz:=
       ActiveCustADOQuery.FindField('Pozyvnoi_ustan').AsInteger;
      end
    else
      PrevPoz:=0;

   end;
 except
   FirstForm.StatusBar.Panels[4].Text:=
     '������ ��������� onBeforeEdit!';
 end;
end;

procedure TADOConnectDM.N5Click(Sender: TObject);
begin
  if MessageDlg('�������� �������� ������?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
              if not SendSQL('UPDATE Zakaz SET Nomer_skidki=0'+
              ' WHERE BOLD_ID='+IntToStr(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger)) then
                ShowMessage('��������� ������ �������� ������ �� ������!');
              RefreshMainGrid(ActiveCustADOQuery.FindField('Nomer_zakaza').AsInteger);
              ReleaseStructForm.DispDBGrid.Repaint;
            end;
end;

procedure TADOConnectDM.ActiveCustADOQueryBeforeInsert(DataSet: TDataSet);
begin
  if IniFile.ReadString('BUSINESS_DATA','permit_disp_auto_insert','NO')='YES' then
    Abort;
end;

procedure TADOConnectDM.N6Click(Sender: TObject);
begin
  ADOConnectDM.SetNewRelateAdrPourPhone(
  ActiveCustADOQuery.FieldByName('Telefon_klienta').AsString,
  ActiveCustADOQuery.FieldByName('Adres_vyzova_vvodim').AsString);
end;

procedure TADOConnectDM.N7Click(Sender: TObject);
begin
  ADOConnectDM.DeleteFromBlackList(
    ActiveCustADOQuery.FieldByName('Telefon_klienta').AsString);
end;

procedure TADOConnectDM.N8Click(Sender: TObject);
begin
  BoldModelDM.HasBonusByNumber(ActiveCustADOQuery.FieldByName('Telefon_klienta').AsString);
  if (BoldModelDM.HasAllBonusADOQuery.FieldByName('Ispoljz_priz_1').AsInteger<>0) or
     (BoldModelDM.HasAllBonusADOQuery.FieldByName('Ispoljz_priz_2').AsInteger<>0) then
     //(BoldModelDM.HasAllBonusADOQuery.FieldByName('Ispoljz_priz_3').AsInteger<>0) then
     begin
       ReleaseStructForm.Gauge.Position:=
         Round(100.0*BonusPercent);
       ReleaseStructForm.Gauge.Repaint;

       ReleaseStructForm.sLabel1.Caption:=
         '�������� ���������� �� ���. ������: ���������-'+
         IntToStr(CallCount)+', ����� � ��������-'+
         IntToStr(BonusCount)+', �� ������ ������-'+
         IntToStr((BonusCount mod CallCount))+', ��������-'+
         IntToStr(CallCount-(BonusCount mod CallCount))+'.';
       //ShowMessage(IntToStr(Round(100.0*BonusPercent)));
     end
  else
     begin
     end;
end;

procedure TADOConnectDM.N9Click(Sender: TObject);
begin
 try
  BoldModelDM.HasBonusByIndNumber(StrToInt(ActiveCustADOQuery.FieldByName('Adres_okonchaniya_zayavki').AsString));
  if (BoldModelDM.HasAllBonusADOQuery.FieldByName('Ispoljz_priz_1').AsInteger<>0) or
     (BoldModelDM.HasAllBonusADOQuery.FieldByName('Ispoljz_priz_2').AsInteger<>0) then
     //(BoldModelDM.HasAllBonusADOQuery.FieldByName('Ispoljz_priz_3').AsInteger<>0) then
     begin
       ReleaseStructForm.Gauge.Position:=
         Round(100.0*IndBonusPercent);
       ReleaseStructForm.Gauge.Repaint;

       ReleaseStructForm.sLabel1.Caption:=
         '�������� ���������� �� ��. ������: ���������-'+
         IntToStr(IndCallCount)+', ����� � ��������-'+
         IntToStr(IndBonusCount)+', �� ������ ������-'+
         IntToStr((IndBonusCount mod IndCallCount))+', ��������-'+
         IntToStr(IndCallCount-(IndBonusCount mod IndCallCount))+'.';
       //ShowMessage(IntToStr(Round(100.0*BonusPercent)));
     end
  else
     begin
     end;
 except
   ShowMessage('������ ������ �� ��������� � ������������ ������!');
 end;
end;

procedure TADOConnectDM.N11Click(Sender: TObject);
begin
  ShowMessage('�� �������� ������������ ������ ������� ���. � ������������!');
end;

procedure TADOConnectDM.N12Click(Sender: TObject);
begin
          ADOConnectDM.GetINumHistory(ActiveCustADOQuery.FindField
                  ('Adres_okonchaniya_zayavki').AsString);
end;

procedure TADOConnectDM.ActiveCustADOQueryBeforePost(DataSet: TDataSet);
var newDN, oldDN: Integer;
begin
 if ReleaseStructForm.DispDBGrid.SelectedField.FieldName='Pozyvnoi_ustan' then
      begin
        newDN:=DataSet.FieldByName('Pozyvnoi_ustan').AsInteger;
        oldDN:=StrToInt(IntToStr(DataSet.FieldByName('Pozyvnoi_ustan').OldValue));
        //ShowMessage(IntToStr(newDN)+',old='+IntToStr(oldDN));
        if((newDN>=0) and (oldDN>0))  then
        begin

        if (IniFile.ReadString('BUSINESS_DATA',
        '��������_�����_���������','NO')='YES') then
        begin
        if MessageDlg('�������� �������� ������ ��������������?',
          mtConfirmation,[mbYes,mbNo],0) = mrYes then
          begin
          end
          else  begin
             Abort;
          end;
        end
        else if (IniFile.ReadString('BUSINESS_DATA',
        '������_�����_���������','NO')='YES') then
        begin
          Abort;
          ShowMessage('������ ��������� ������ �������������� ��������!');
        end;

        end;
      end;
 if ReleaseStructForm.DispDBGrid.SelectedField.FieldName='Uslovn_stoim' then
   begin
    if (ADOConnectDM.ActiveCustADOQuery.FieldByName('Predvariteljnyi').AsInteger<>0) and
   (ADOConnectDM.ActiveCustADOQuery.FieldByName('Zadeistv_predvarit').AsInteger=0) then
        begin
          ShowMessage('�� ��������� ���������� ����� � ����������������� ��������������� ������!');
          DataSet.FindField('Uslovn_stoim').AsFloat:=0;
        end
    else
    begin
     if (IniFile.ReadString('BUSINESS_DATA',
        '������������_����������_�����_������','NO')='YES') then
        begin
          if (DataSet.FindField('Uslovn_stoim').AsFloat>=
               IniFile.ReadFloat('BUSINESS_DATA',
                 '����������_�����_������',150)) then
             begin
                if MessageDlg('������ ����� ���� ��� ����� ����������� �������, ���������� �����?', mtConfirmation,[mbYes,mbNo],0) = mrYes then
                  begin
                  end
                else
                  begin
                    DataSet.FindField('Uslovn_stoim').AsFloat:=0;
                  end;
             end;
        end;
     end;
   end

  else
    begin

    end;


end;

procedure TADOConnectDM.ModemsCheckTimerTimer(Sender: TObject);
var AllUSBReset: Boolean;
begin
 AllUSBReset:=False;
 if BoldModelDM.bsh.Active then
  if (BoldHandlesDM.blhDriversUnion.CurrentElement as 
      TObjekt_vyborki_otchyotnosti).Regim_dispetchera then
    begin

      if not ModemSettingsForm.ModemsOnActivePhoneLine then
        begin
          ShowMessage('����� �� ��������� � �����! ��������� ������� �����, �������������� ������� � ������ � ������������� ���������!');
          FirstForm.Close;
        end;

      if not GSMCheckStart then
         GSMCheckStart:=True;
      if not GSM2CheckStart then
         GSM2CheckStart:=True;
      if not GSM3CheckStart then
         GSM3CheckStart:=True;
      
      if not ModemSettingsForm.GSMModemsOnActivePhoneLine then
        begin
          if (IniFile.ReadString('BUSINESS_DATA','���������_���������_���_����������_������','NO')='YES') then
            begin
              ShowMessage('����� �������� �������� �� ��������� � �����! ��������� �������������� ���������������� ������ �������� � ���������� ��� ���������� ������������� ����������� � ��������� � ������������� ���������!');
              FirstForm.Close;
            end
          else
            begin
              FirstForm.StatusBar.Panels[4].Text :=
                '����� GSM ����������!!!';
              if (IniFile.ReadString('BUSINESS_DATA','�����������_�������_��������������_�����_�_��������','NO')='YES') then
                begin

                  if not ModemSettingsForm.GSMApdComPort.Open and
                    (IniFile.ReadString('modems','use_gsm_modem','NO')='YES') and
                    PeriodicDevConRecovery then
                    begin
                      FirstForm.ShowAttention('�������������� ����������� � 1GSM!');
                      Sleep(100);
                      //ReleaseStructForm.AddCurrUserLog('����������� COM GSM1 ����������!');
                      while not ModemSettingsForm.Init1GSMModem do
                      begin
                        PortRecovCounter1:=PortRecovCounter1+1;
                        if PortRecovCounter1>5 then
                          begin
                            PortRecovCounter1:=0;
                            Break;
                          end;
                        FirstForm.ShowAttention('�������������� ����������� � 1GSM!');
                        Sleep(200);
                        if not ModemSettingsForm.GSMApdComPort.Open then
                          FirstForm.ShowAttention('�� �������������! ��������� �������...');
                        ModemSettingsForm.GSMApdComPort.DonePort;
                        Sleep(200);
                      end;
                      if (IniFile.ReadString('BUSINESS_DATA',
                        '�������_��������������_�����_������_������������_GSM','NO')='NO') then
                           PeriodicDevConRecovery:=False;

                      if not ModemSettingsForm.GSMApdComPort.Open and
                         (IniFile.ReadString('BUSINESS_DATA',
                         '�������������_USB_������_���_���������_��������������_�����','NO')='YES') then
                        begin
                           if (IniFile.ReadString('BUSINESS_DATA',
                             '�������������_���_USB_����������_���_���������_��������������_�����','NO')='YES') and
                             (IniFile.ReadString('BUSINESS_DATA',
                             '�������������_���_USB_����������_�����_�������','NO')='NO')
                               then
                                 begin
                                   if ChangeDeviceState(DICS_DISABLE, True) then
                                     FirstForm.ShowAttention('���������� ���������');
                                   if ChangeDeviceState(DICS_ENABLE, True) then
                                     begin
                                       AllUSBReset:=True;
                                       FirstForm.ShowAttention('���������� ��������');
                                     end;
                                 end;


                          if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            '���_�������������_����������','modem')) then
                              FirstForm.ShowAttention('���������� 1 ���������');
                          if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            '���_�������������_����������','modem')) then
                              begin
                                if (IniFile.ReadString('BUSINESS_DATA',
                                '����������������_���������_�����_����������','NO')=
                                'YES') then
                                  PeriodicDevConRecovery:=True;
                                FirstForm.ShowAttention('���������� 1 ��������');
                                //ReleaseStructForm.AddCurrUserLog('GSM1 ������ �����������!');
                              end
                          else
                           begin
                            //ReleaseStructForm.AddCurrUserLog('GSM1 ����������� ��������!');
                            ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            '���_�������������_����������','modem'));
                           end;

                        end;
                        //else
                        //ReleaseStructForm.AddCurrUserLog('����������� COM ������ �����������!');

                      PortRecovCounter1:=0;
                    end;
                  if not ModemSettingsForm.GSM2ApdComPort.Open and
                    (IniFile.ReadString('modems','use_gsm_modem2','NO')='YES') and
                    PeriodicDevConRecovery2 then
                    begin
                      FirstForm.ShowAttention('�������������� ����������� � 2GSM!');
                      Sleep(100);
                      //ReleaseStructForm.AddCurrUserLog('����������� COM GSM2 ����������!');
                      while not ModemSettingsForm.Init2GSMModem do
                      begin
                      PortRecovCounter2:=PortRecovCounter2+1;
                        if PortRecovCounter2>5 then
                          begin
                            PortRecovCounter2:=0;
                            Break;
                          end;
                      FirstForm.ShowAttention('�������������� ����������� � 2GSM!');
                      Sleep(200);
                      if not ModemSettingsForm.GSM2ApdComPort.Open then
                        FirstForm.ShowAttention('�� �������������! ��������� �������...');
                      ModemSettingsForm.GSM2ApdComPort.DonePort;
                      Sleep(200);
                      end;
                      if (IniFile.ReadString('BUSINESS_DATA',
                        '�������_��������������_�����_������_������������_2GSM','NO')='NO') then
                           PeriodicDevConRecovery2:=False;

                      if not ModemSettingsForm.GSM2ApdComPort.Open and
                         (IniFile.ReadString('BUSINESS_DATA',
                         '�������������_USB_������_���_���������_��������������_�����','NO')='YES') then
                        begin
                          if (IniFile.ReadString('BUSINESS_DATA',
                             '�������������_���_USB_����������_���_���������_��������������_�����','NO')='YES') and
                             (IniFile.ReadString('BUSINESS_DATA',
                             '�������������_���_USB_����������_�����_�������','NO')='NO') and
                             not AllUSBReset 
                               then
                                 begin
                                   if ChangeDeviceState(DICS_DISABLE, True) then
                                     FirstForm.ShowAttention('���������� ���������');
                                   if ChangeDeviceState(DICS_ENABLE, True) then
                                     begin
                                       AllUSBReset:=True;
                                       FirstForm.ShowAttention('���������� ��������');
                                     end;
                                 end;
                          if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            '���_�������������_����������2','modem')) then
                              FirstForm.ShowAttention('���������� 2 ���������');
                          if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            '���_�������������_����������2','modem')) then
                            begin
                              if (IniFile.ReadString('BUSINESS_DATA',
                                '����������������_���������_�����_����������','NO')=
                                'YES') then
                                PeriodicDevConRecovery2:=True;
                              FirstForm.ShowAttention('���������� 2 ��������');
                              //ReleaseStructForm.AddCurrUserLog('GSM2 ������ �����������!');
                            end
                          else
                           begin
                            //ReleaseStructForm.AddCurrUserLog('GSM2 ����������� ��������!');
                            ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            '���_�������������_����������2','modem'));
                           end;

                        end;
                        //else
                        //ReleaseStructForm.AddCurrUserLog('����������� COM ������ �����������!');

                      PortRecovCounter2:=0;
                    end;
                  if not ModemSettingsForm.GSM3ApdComPort.Open and
                    (IniFile.ReadString('modems','use_gsm_modem3','NO')='YES') and
                    PeriodicDevConRecovery3 then
                    begin
                      FirstForm.ShowAttention('�������������� ����������� � 3GSM!');
                      Sleep(100);
                      //ReleaseStructForm.AddCurrUserLog('����������� COM GSM3 ����������!');
                      while not ModemSettingsForm.Init3GSMModem do
                      begin
                      PortRecovCounter3:=PortRecovCounter3+1;
                        if PortRecovCounter3>5 then
                          begin
                            PortRecovCounter3:=0;
                            Break;
                          end;
                      FirstForm.ShowAttention('�������������� ����������� � 3GSM!');
                      Sleep(200);
                      if not ModemSettingsForm.GSM3ApdComPort.Open then
                        FirstForm.ShowAttention('�� �������������! ��������� �������...');
                      ModemSettingsForm.GSM3ApdComPort.DonePort;
                      Sleep(200);
                      end;
                      if (IniFile.ReadString('BUSINESS_DATA',
                        '�������_��������������_�����_������_������������_3GSM','NO')='NO') then
                           PeriodicDevConRecovery3:=False;

                      if not ModemSettingsForm.GSM3ApdComPort.Open and
                         (IniFile.ReadString('BUSINESS_DATA',
                         '�������������_USB_������_���_���������_��������������_�����','NO')='YES') then
                        begin
                           if (IniFile.ReadString('BUSINESS_DATA',
                             '�������������_���_USB_����������_���_���������_��������������_�����','NO')='YES') and
                             (IniFile.ReadString('BUSINESS_DATA',
                             '�������������_���_USB_����������_�����_�������','NO')='NO') and
                             not AllUSBReset
                               then
                                 begin
                                   if ChangeDeviceState(DICS_DISABLE, True) then
                                     FirstForm.ShowAttention('���������� ���������');
                                   if ChangeDeviceState(DICS_ENABLE, True) then
                                     begin
                                       AllUSBReset:=True;
                                       FirstForm.ShowAttention('���������� ��������');
                                     end;
                                 end;


                          if ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            '���_�������������_����������3','modem')) then
                              FirstForm.ShowAttention('���������� 3 ���������');
                          if ChangeDeviceState(DICS_ENABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            '���_�������������_����������3','modem')) then
                            begin
                              if (IniFile.ReadString('BUSINESS_DATA',
                                '����������������_���������_�����_����������','NO')=
                                'YES') then
                                  PeriodicDevConRecovery3:=True;
                              FirstForm.ShowAttention('���������� 3 ��������');
                              //ReleaseStructForm.AddCurrUserLog('GSM3 ������ �����������!');
                            end  
                          else
                           begin
                            //ReleaseStructForm.AddCurrUserLog('GSM3 ����������� ��������!');
                            ChangeDeviceState(DICS_DISABLE, False, IniFile.ReadString('BUSINESS_DATA',
                            '���_�������������_����������3','modem'));
                           end;     

                          if (IniFile.ReadString('BUSINESS_DATA',
                            '�������������_���_USB_����������_���_���������_��������������_�����','NO')='YES') then
                              RestartUSBHub:=True;
                        end;
                        //else
                        //ReleaseStructForm.AddCurrUserLog('����������� COM ������ �����������!');

                      PortRecovCounter3:=0;
                    end;  

                end;    
            end;
        end;

    end;
end;

procedure TADOConnectDM.N13Click(Sender: TObject);
begin
  ReleaseStructForm.sPanel1.Visible:=True;
  //ReleaseStructForm.Splitter2.Visible:=True;
  EndedOrderField:='nomer_zakaza';
  ReleaseStructForm.QueryNotEndedCust;
end;

procedure TADOConnectDM.SendSMSToCurrentDriver;
var DrSMSSendState: Integer;
    DrPhone: string;
begin
  if (ActiveCustADOQuery.FindField('Adres_vyzova_vvodim').AsString='') or
      not (ActiveCustADOQuery.FindField('vypolnyaetsya_voditelem').AsInteger>0) or
     not (ActiveCustADOQuery.FindField('Pozyvnoi_ustan').AsInteger>0) or
      (ActiveCustADOQuery.FindField('Telefon_klienta').AsString='') then
        begin
          ShowMessage('�� ���������� �����, ������� ��� ��� ������ � �������� �������� (���������� ������ ������ ��������)!');
          ActiveCustADOQuery.CancelUpdates;
        end
      else
        begin
          DrSMSSendState:=
            GetDrSMSSendState(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger);
          if (DrSMSSendState<>1) and
          (ActiveCustADOQuery.FindField('DRIVER_SMS_SEND_STATE').AsInteger<>1) then
            begin
              DrPhone:=GetDrPhoneByDrNum(ActiveCustADOQuery.FindField('Pozyvnoi_ustan').AsInteger);
              if (StrToInt64Def(DrPhone,-1)<>-1) and
                (Length(DrPhone) >= 5) then
                  begin
                    SendSMSToDriver(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger,
                    DrPhone,'');
                  end
              else
                ShowMessage('������������ ����� �������� �������� ''' + DrPhone + ''', ��������� � ����������� ���������!');
            end
          else
            ShowMessage('SMS �� ������ ������ ������������ ��������, ��������� ����������!');

        end;
end;

procedure TADOConnectDM.SendSMSToCurrentClient;
var SMSSendState: Integer;
    //DrPhone: string;
begin
  if (ActiveCustADOQuery.FindField('Adres_vyzova_vvodim').AsString='') or
      not (ActiveCustADOQuery.FindField('vypolnyaetsya_voditelem').AsInteger>0) or
     not (ActiveCustADOQuery.FindField('Pozyvnoi_ustan').AsInteger>0) or
      (ActiveCustADOQuery.FindField('Telefon_klienta').AsString='') then
        begin
          ShowMessage('�� ���������� �����, ������� ��� ��� ������ � �������� �������� (���������� ������ ������ ��������)!');
          ActiveCustADOQuery.CancelUpdates;
        end
      else
        begin
          SMSSendState:=
            GetClSMSSendState(ActiveCustADOQuery.FindField('BOLD_ID').AsInteger);
          if (SMSSendState<>1) and
          (ActiveCustADOQuery.FindField('CLIENT_SMS_SEND_STATE').AsInteger<>1) then
            begin
              //DrPhone:=GetDrPhoneByDrNum(ActiveCustADOQuery.FindField('Pozyvnoi_ustan').AsInteger);
              if 
                (Length(ActiveCustADOQuery.FindField('Telefon_klienta').AsString) >= 5) then
                  begin
                    SendSMSToClient
      (ActiveCustADOQuery.FindField('BOLD_ID').AsInteger
                );
                  end
              else
                ShowMessage('������������ ����� �������� �������!');
            end
          else
            ShowMessage('SMS �� ������ ������ ������������ ��������, ��������� ����������!');

        end;
end;

procedure TADOConnectDM.SMS2Click(Sender: TObject);
begin
  SendSMSToCurrentDriver;
end;

procedure TADOConnectDM.SMS1Click(Sender: TObject);
begin
  SendSMSToCurrentClient;
end;

procedure TADOConnectDM.ExportAbNumbersToFile;
begin
  try
    AbNumbersExportADODS.Active:=False;
    AbNumbersExportADODS.Active:=True;
    if ADTGSaveDlg.Execute then
    begin
      AbNumbersExportADODS.SaveToFile(ADTGSaveDlg.FileName);
      ShowMessage('�������� �����������!');
    end;
  except on E:Exception do
    ShowMessage('��������� ������ ������� ��. ������� �� �������! ���������: '+E.Message);
  end;
end;

function TADOConnectDM.ImportAbNumbersToFile: Boolean;
var res: Boolean;
begin
  res:=False;
  try
    AbNumbersImportADODS.Active:=False;
    if ADTGOpenDlg.Execute then
    begin
      AbNumbersImportADODS.LoadFromFile(ADTGOpenDlg.FileName);
    if not AbNumbersImportADODS.Active then
      AbNumbersImportADODS.Active:=True;
    
    if AbNumbersImportADODS.Active then
    begin
      if AbNumbersImportADODS.RecordCount>0 then
      begin
        ShowMessage('������ ���������!');
        res:=True;
      end
      else
        ShowMessage('�� ���������� ������ ��� ��������!');
    end
    else
      ShowMessage('���������� ����� ��� �������, ��������� ��������!');
    end;

  except on E:Exception do
    ShowMessage('��������� ������ ������� ��. ������� �� �������! ���������: '+E.Message);
  end;
  Result:=res;
end;

procedure TADOConnectDM.ExportCallPhonesToFile;
begin
  try
    CallPhonesExportADODS.Active:=False;
    CallPhonesExportADODS.Active:=True;
    if ADTGSaveDlg.Execute then
    begin
      CallPhonesExportADODS.SaveToFile(ADTGSaveDlg.FileName);
      ShowMessage('�������� �����������!');
    end;
  except on E:Exception do
    ShowMessage('��������� ������ ������� ����������� ����������� �� �������! ���������: '+E.Message);
  end;
end;

function TADOConnectDM.ImportCallPhonesToFile: Boolean;
var res: Boolean;
begin
  res:=False;
  try
    CallPhonesImportADODS.Active:=False;
    if ADTGOpenDlg.Execute then
    begin
      CallPhonesImportADODS.LoadFromFile(ADTGOpenDlg.FileName);
    if not CallPhonesImportADODS.Active then
      CallPhonesImportADODS.Active:=True;
    
    if CallPhonesImportADODS.Active then
    begin
      if CallPhonesImportADODS.RecordCount>0 then
      begin
        ShowMessage('������ ���������!');
        res:=True;
      end
      else
        ShowMessage('�� ���������� ������ ��� ��������!');
    end
    else
      ShowMessage('���������� ����� ��� �������, ��������� ��������!');
    end;

  except on E:Exception do
    ShowMessage('��������� ������ ����������� ����������� �� �������! ���������: '+E.Message);
  end;
  Result:=res;
end;

procedure TADOConnectDM.SaveDBImportedAbNumbers;
begin
  if AbNumbersImportADODS.Active then
    begin
      if AbNumbersImportADODS.RecordCount>0 then
      begin
        AbNumbersImportADODS.First;
        repeat
          pbel:=TPersona.Create(nil);
          pbel.Elektronnyi_adres:='�������������� ������';
          pbel.Familiya:=AbNumbersImportADODS.FieldByName('Familiya').AsString;
          pbel.Imya:=AbNumbersImportADODS.FieldByName('Imya').AsString;
          pbel.Otchestvo:=AbNumbersImportADODS.FieldByName('Otchestvo').AsString;
          pbel.Rabochii_telefon:=AbNumbersImportADODS.FieldByName('Rabochii_telefon').AsString;
          pbel.Ulica:=AbNumbersImportADODS.FieldByName('Ulica').AsString;
          pbel.Dom:=AbNumbersImportADODS.FieldByName('Dom').AsInteger;
          pbel.Korpus:=AbNumbersImportADODS.FieldByName('Korpus').AsInteger;
          //NewINumber:=NewIN;
          
          AbNumbersImportADODS.Next;
          if AbNumbersImportADODS.Eof then
            Break;
          ReleaseStructForm.Repaint;  
        until false;

        BoldModelDM.bsh.UpdateDatabase;
      end
      else
        ShowMessage('�� ���������� ������ ��� ��������!');
    end
    else
      ShowMessage('���������� ����� ��� �������, ��������� ��������!');

end;

procedure TADOConnectDM.SaveDBImportedCallPhones;
var spel: TSootvetstvie_parametrov_zakaza;
begin
  if CallPhonesImportADODS.Active then
    begin
      if CallPhonesImportADODS.RecordCount>0 then
      begin
        CallPhonesImportADODS.First;
        repeat
          spel:=TSootvetstvie_parametrov_zakaza.Create(nil);
          spel.Telefon_klienta:=CallPhonesImportADODS.FieldByName
            ('Telefon_klienta').AsString;
          spel.Adres_vyzova_vvodim:=CallPhonesImportADODS.FieldByName
            ('Adres_vyzova_vvodim').AsString;
          //spel.Dom:=CallPhonesImportADODS.FieldByName
          //  ('otnositsya_k_sektoru').AsInteger;
          spel.Summarn_chislo_vyzovov:=CallPhonesImportADODS.FieldByName
            ('Summarn_chislo_vyzovov').AsInteger;

          CallPhonesImportADODS.Next;
          if CallPhonesImportADODS.Eof then
            Break;
          ReleaseStructForm.Repaint;  
        until false;

        BoldModelDM.bsh.UpdateDatabase;
      end
      else
        ShowMessage('�� ���������� ������ ��� ��������!');
    end
    else
      ShowMessage('���������� ����� ��� �������, ��������� ��������!');

end;

function TADOConnectDM.ChechDriverBalanceStatus(DrNum: Integer): Boolean;
var res: Boolean;
    freeDaysCount: Integer;
    emploeeDate: TDateTime;
    start_date: TDateTime;
begin
  res:=False;

  if (IniFile.ReadString('BUSINESS_DATA',
    '�����_��������_������_���������','NO')='YES')
    and AllowWorkWithSaldo then
   begin

    try

      if ADOConnectDM.DrIDByNum(DrNum)>-1 then
      begin

      emploeeDate:=StrToDateDef(
      DrInfoADOQuery.FieldByName
      ('Klass_vodit').AsString,
      IncDay(Today));
      freeDaysCount:=StrToIntDef(
      DrInfoADOQuery.FieldByName
        ('Udostoverenie_nom').AsString,0);
      if emploeeDate>Today then
        ShowMessage('������� ���������� ���� ������ ��������!');

      start_date:=StrToDateDef(
        IniFile.ReadString('BUSINESS_DATA',
        '����_������_��������_�����_���������',
        DateToStr(IncDay(Today))),
        IncDay(Today));

      if start_date>Today then
        ShowMessage('������� ���������� '+
        '����_������_��������_�����_���������!');

      if emploeeDate<start_date then
      begin
        emploeeDate:=start_date;
      end
      else
        start_date:=emploeeDate;

      DrIncSummADODS.Active:=False;
      DrIncSummADODS.Parameters.
        ParamByName('poz').Value:=DrNum;
      DrIncSummADODS.Parameters.
        ParamByName('start').Value:=start_date;


      DrWorkSummADODS.Active:=False;
      DrWorkFixSummADODS.Active:=False;
      DrWorkSummADODS.Parameters.
        ParamByName('poz').Value:=DrNum;
      DrWorkSummADODS.Parameters.
        ParamByName('poz2').Value:=DrNum;
      DrWorkFixSummADODS.Parameters.
        ParamByName('poz3').Value:=DrNum;
      DrWorkFixSummADODS.Parameters.
        ParamByName('poz4').Value:=DrNum;
      DrWorkFixSummADODS.Parameters.
        ParamByName('dr_start_date').Value:=
        emploeeDate;
      DrWorkFixSummADODS.Parameters.
        ParamByName('dr_start_date2').Value:=
        emploeeDate;
      DrWorkFixSummADODS.Parameters.
        ParamByName('free_days_count').Value:=
        freeDaysCount;
      DrWorkSummADODS.Parameters.
        ParamByName('start').Value:=start_date;
       DrIncSummADODS.Active:=True;
       DrWorkSummADODS.Active:=True;
       DrWorkFixSummADODS.Active:=True;

       res:=True;

       ShowMessage('�������: '
       +DateToStr(Today)+'. ������� � '+
       DateToStr(emploeeDate)+' , ���������: '+
       IntToStr(freeDaysCount)+'. ���� � '+
       DateToStr(start_date)+': '+
        FloatToStr(DrIncSummADODS
        .FieldByName('DrTakeSumm').asFloat)+
        ', ������: '+
        FloatToStr(DrWorkSummADODS
        .FieldByName('DrSumm').asFloat+
        DrWorkFixSummADODS
        .FieldByName('DrSumm').asFloat)+
        ', �������: '+
        FloatToStr(DrIncSummADODS
        .FieldByName('DrTakeSumm').asFloat -
        DrWorkSummADODS
        .FieldByName('DrSumm').asFloat-
        DrWorkFixSummADODS
        .FieldByName('DrSumm').asFloat)
        );
        end
        else
          begin
            ShowMessage('��������� ������ � ������� ���������!');
          end;

    except on E:Exception do
      ShowMessage(
      '������ �������� '+
      ' �������� ��� ���������! '+
      E.Message);
    end;

   end
  else
    res:=True; 

  Result:=res;
end;

procedure TADOConnectDM.RemoteCtrlAdmADOT2AfterInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TADOConnectDM.RemoteDataRefreshTimerTimer(Sender: TObject);
begin
if IniFile.ReadString('���������_��������',
  '�����_���������_��������_�����_��������','NO')='YES' then
  begin
    if IniFile.ReadString('���������_��������',
    '����������_���������_�����_��������','NO')='YES' then
      begin
        RefreshRemoteData;
      end;  
  end;
end;

procedure TADOConnectDM.ReloadCurrOrderOccupAttempts(OrderId: Integer);
begin
  if ActiveCustADOQuery.Active then
  begin
    if ActiveCustADOQuery.RecordCount>0 then
    begin
      try
        OrdersOccupAttsADOT.Active:=False;
        OrdersOccupAttsADOT.Parameters.ParamByName(
          'order_id').Value:=OrderId;
        OrdersOccupAttsADOT.Active:=True;
      except on E:Exception do
        ShowMessage('������ ���������� �������'+
          ' ������������! '+E.Message);
      end;
    end;
  end;
end;

procedure TADOConnectDM.SetDriverFromCurrPretendents;
var count: Integer;
begin
  //count:=0;
  if OrdersOccupAttsADOT.Active then
  begin
    if OrdersOccupAttsADOT.RecordCount>0 then
    begin
      try
        SetDrFromPretendADOSP.Parameters.Refresh;
        SetDrFromPretendADOSP.Parameters.
          ParamByName('@order_id').Value:=
		OrdersOccupAttsADOT.FieldByName('ORDER_ID').
		AsInteger;
		SetDrFromPretendADOSP.Parameters.
          ParamByName('@driver_id').Value:=
		OrdersOccupAttsADOT.FieldByName('DRIVER_ID').
		AsInteger;
		SetDrFromPretendADOSP.Parameters.
                ParamByName('@count').Value:=0;
        SetDrFromPretendADOSP.ExecProc;
		count:=SetDrFromPretendADOSP.Parameters.
                ParamByName('@count').Value;
		if (count<1) then
			ShowMessage('�� ������� ������ � ����������� ��������!');
      except on E: Exception do
      end;
    end
    else
      ShowMessage('������ ������� ������������!');
  end
  else
    ShowMessage('��������� ������� ������������!');
end;

procedure TADOConnectDM.ManualSetCurrOrderRemoteStatus(orderId,
  destStatus: Integer);
var count: Integer;
begin
  //count:=0;
  if ActiveCustADOQuery.Active then
  begin
    if ActiveCustADOQuery.RecordCount>0 then
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
			  ShowMessage('�������� �� ���������!!! '+
          '�� ������� ������ � ���������� ��������!');
      except on E: Exception do
      end;
    end
    else
      ShowMessage('������ ������� ������������!');
  end
  else
    ShowMessage('��������� ������� ������������!');
end;

procedure TADOConnectDM.ActiveCustADOQueryCalcFields(DataSet: TDataSet);
var REMOTE_SET: Integer;
begin
  with ActiveCustADOQuery do
  begin

    try
        if (IniFile.ReadString('BUSINESS_DATA','����������_������_������','NO')='YES') then
        begin
        //AlarmedOrdersADOQuery.Active:=False;
        //AlarmedOrdersADOQuery.Active:=True;
        //if ADOConnectDM.AlarmedOrdersADOQuery.Active then
        if FieldByName('alarmed').AsInteger>0 then
        if (IniFile.ReadString('BUSINESS_DATA','����������_������_������','NO')='YES') then begin
              if(alarmFlag) then begin
                            alarmFlag := False;
                            MessageBeep(MB_ICONEXCLAMATION);
                            TMyThread.Create(False);
                            end;

                  end;
        end;
        except  on E: Exception do
        end;

    REMOTE_SET:=FieldByName('REMOTE_SET').AsInteger;
    FieldByName('REMOTE_INSTR').
      AsString:='.....';
    case REMOTE_SET of

      ORDER_NO_REM_STATUS: //= 0;
      begin
        FieldByName('REMOTE_INSTR').
          AsString:='.....';
      end;
      
      ORDER_INDIVID_TAKE: //= 1;
      begin
        FieldByName('REMOTE_INSTR').
          AsString:='������ ������, ����� ���������';
      end;

      ORDER_SECTOR_PUBLISHING: //= 2;
      begin
        FieldByName('REMOTE_INSTR').
          AsString:='������ �������, ����� ���������';
      end;

      ORDER_ALL_PUBLISHING: //= 3;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='������ ����, ����� ���������';
      end;

      ORDER_PUBLUSHED_WAIT: //= 4;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='������ ��������, ���������';
      end;

      ORDER_IS_OCCUPED: //= 5;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='���� �����������, ���������';
      end;

      ORDER_OCCUPED_DENY: //= 6;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='���� �����������, ���������';
      end;

      ORDER_OCCUPED_ALLOW: //= 7;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='���� ����������';
      end;

      ORDER_BUSY: //= 8; //???
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='�� ����������';
      end;

      ORDER_ONHAND_ALLOW: //= 9;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='���� ���������� � ����';
      end;

      ORDER_ONHAND_ACTIVE: //= 10;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='�� ����������';
      end;

      ORDER_DISP_CANCEL: //= 11;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='��������� ��������';
      end;

      ORDER_DISP_CANCEL_DR_INCOURSE: //= 12;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='���. �����. ������ ����.';
      end;

      ORDER_DRV_CANCEL: //= 13;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='�������� ��������';
      end;

      ORDER_DRV_CANCEL_DISP_ALLOW: //= 14;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='����. �����. ������ ���.';
      end;

      ORDER_DRV_COMPLETE: //= 15;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='�������� ���������';
      end;

      ORDER_COMLETE_ALLOW: //= 16;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='����� ������, ����...';
      end;
	  
	  //ORDER_COMPLETE_ALLOW_ASK_WAIT: // =28
	  //begin
	  //	FieldByName('REMOTE_INSTR').
      //    AsString:='����� ������, ����...';
      //end;
  
      ORDER_ALLOW_ASK_WAIT: //= 17;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='���� ����������, ����';
      end;

      ORDER_ONHAND_ALLOW_ASK_WAIT: //= 18;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='���� ���������� � ����, ����';
      end;

      ORDER_DISP_CANCEL_ASK_WAIT: //= 19;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='��������� �������, ����';
      end;

      ORDER_CLOSE_ERROR: //= 20;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='������ ������';
      end;

      ORDER_DRCANCEL_DENY: //= 21;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='������ ��������� �� �������';
      end;

      ORDER_INWORKING_WAIT: //= 22;
      begin
      end;

      ORDER_ONHAND_ATTEPMT: //= 23;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='������ � ����';
      end;

      ORDER_ONHAND_DENY: //= 24;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='�������� � ����';
      end;

      ORDER_ONHAND_ALLOW_USER_WAIT: //= 25;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='������ � ����, �����������';
      end;

      ORDER_COMPLETE_ALLOW_USER_WAIT: //= 26;
      begin
		FieldByName('REMOTE_INSTR').
          AsString:='��� �����, �����������';
      end;
	  
	  ORDER_CLOSE_ASK_WAIT:
	  begin
		FieldByName('REMOTE_INSTR').
          AsString:='����� ������, ��������...';
      end;
  
      ORDER_CLOSE: //= 100;
	  begin
		FieldByName('REMOTE_INSTR').
          AsString:='������ �������';
	  end;
	  
      else
      begin
      end;

    end;

    if FieldByName('WAITING').AsInteger>0 then
         FieldByName('REMOTE_INSTR').
          AsString:='('+IntToStr(FieldByName
          ('WAITING').AsInteger)+' ���.)'+
          FieldByName('REMOTE_INSTR').
          AsString;

    if FieldByName('call_it').AsInteger>0 then
         FieldByName('REMOTE_INSTR').
          AsString:='(�����)'+
          FieldByName('REMOTE_INSTR').
          AsString;

  end;
end;

procedure TADOConnectDM.ActiveCustADOQueryUslovn_stoimGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (ActiveCustADOQueryREMOTE_SET.AsInteger=
    ORDER_COMPLETE_ALLOW_USER_WAIT)
    then
    begin
    if
     (ActiveCustADOQueryUslovn_stoim.AsFloat=
     ActiveCustADOQueryREMOTE_SUMM.AsFloat) then
    begin
      Text:=
        '->'+ActiveCustADOQueryREMOTE_SUMM.AsString;
    end
    else
    begin

      Text:=ActiveCustADOQueryUslovn_stoim.AsString+
        '<-'+ActiveCustADOQueryREMOTE_SUMM.AsString;

    end;
    end
  else
    Text:=ActiveCustADOQueryUslovn_stoim.AsString;
  if ActiveCustADOQueryfixed_summ.AsFloat>0 then
   Text:='��='+FloatToStr(ActiveCustADOQueryfixed_summ.AsFloat)+','+Text;
  if ActiveCustADOQuerytm_summ.AsFloat>0 then
   Text:='��='+FloatToStr(ActiveCustADOQuerytm_summ.AsFloat)+','+Text;
end;

procedure TADOConnectDM.ActiveCustADOQueryPozyvnoi_ustanGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (ActiveCustADOQueryREMOTE_SET.AsInteger=
    ORDER_ONHAND_ALLOW_USER_WAIT)
    then
    begin
    if (ActiveCustADOQueryPozyvnoi_ustan.AsInteger=0) or
     (ActiveCustADOQueryREMOTE_DRNUM.AsInteger=
     ActiveCustADOQueryPozyvnoi_ustan.AsInteger) then
    begin
      Text:=
        '->'+ActiveCustADOQueryREMOTE_DRNUM.AsString;
    end
    else
    begin
      Text:=ActiveCustADOQueryPozyvnoi_ustan.AsString+
        '->'+ActiveCustADOQueryREMOTE_DRNUM.AsString;
    end;
    end
  else if (ActiveCustADOQueryREMOTE_SET.AsInteger>0) and
     (ActiveCustADOQueryREMOTE_SET.AsInteger<8) then
    Text:=
        '~'+ActiveCustADOQueryREMOTE_DRNUM.AsString
  else if (ActiveCustADOQueryREMOTE_SYNC.AsInteger>0) and
     (ActiveCustADOQueryREMOTE_SET.AsInteger=8) then
    Text:=
        '?'+ActiveCustADOQueryREMOTE_DRNUM.AsString
  else if (ActiveCustADOQueryREMOTE_SET.AsInteger<0) or
   (ActiveCustADOQueryREMOTE_SET.AsInteger=13) then
    Text:=
        '!'+ActiveCustADOQueryREMOTE_DRNUM.AsString
  else
    Text:=ActiveCustADOQueryPozyvnoi_ustan.AsString;
end;

procedure TADOConnectDM.MainADOConnectionAfterConnect(Sender: TObject);
begin
  if MainADOConnection.Connected then
  begin
    try
    SettingsADODS.Active:=False;
    SettingsADODS.Active:=True;
    if SettingsADODS.Active then
    if SettingsADODS.RecordCount>0 then
      if SettingsADODS.FieldByName('db_version').
        AsInteger<MinDBVersion then
          begin
            ShowMessage('������������ ������ ��!');
            FirstForm.Close;
          end;
    except on E:Exception do
    begin
      ShowMessage('������ ��������� ���������� �� ��! '+
        E.Message);
      FirstForm.Close;
    end;
    end;

  end;
end;

procedure TADOConnectDM.ActiveCustADOQueryAdres_vyzova_vvodimGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if ActiveCustADOQuerydirect_sect_id.AsInteger>0 then
    Text:='(->'+ActiveCustADOQuerydir_sect.AsString+') '+
       ActiveCustADOQueryAdres_vyzova_vvodim.AsString
  else
    Text:=ActiveCustADOQueryAdres_vyzova_vvodim.AsString;

  if ActiveCustADOQuerydetected_sector.AsInteger>0 then
    Text:='(~'+ActiveCustADOQuerydet_sect_name.AsString+') '+ Text;

  if ActiveCustADOQueryend_adres.AsVariant<>NULL then
     Text:= Text + ('->'+ActiveCustADOQueryend_adres.AsString);
  if ActiveCustADOQueryfixed_time.AsInteger>0 then
    Text:='(�����. '+IntToStr(ActiveCustADOQueryfixed_time.AsInteger)+
      ' ���.)'+Text;
  if ActiveCustADOQuerytm_distance.AsInteger>0 then
    Text:='(�����. '+FloatToStr(ActiveCustADOQuerytm_distance.asFloat/1000)+
      ' ��.)'+Text;
  if ActiveCustADOQueryrclient_status.AsInteger=-2 then
    Text:='(�� ������)'+Text;
  if ActiveCustADOQueryrclient_status.AsInteger=2 then
    Text:='(� ���������)'+Text;
end;

procedure TADOConnectDM.addToDynamicDrBalance(dr_num: Integer;
  summ: Double);
begin
  try
    AddToDynDrBalanceADOC.Parameters.ParamByName(
      'dr_num').Value:=dr_num;
    AddToDynDrBalanceADOC.Parameters.ParamByName(
      'summ').Value:=summ;
    AddToDynDrBalanceADOC.Execute;
  except on E:Exception do
    ShowMessage('������ ���������� � ���. ������� ��������! '+E.Message);
  end;
end;

function TADOConnectDM.GetDrUseDynBalanceDrNum
  (DrNum: Integer): Boolean;
var res: Boolean;
begin
  res:=False;
  ADODMUnit.CurrDrBalance:=0;
  try
    UseDrDBalanceADODS.Active:=False;
    UseDrDBalanceADODS.Parameters.ParamByName('dr_num').
      Value:=DrNum;
    UseDrDBalanceADODS.Parameters.ParamByName('dr_num2').
      Value:=DrNum;
    UseDrDBalanceADODS.Active:=True;
    if UseDrDBalanceADODS.RecordCount>0 then
    begin
    ADODMUnit.CurrDrBalance:=UseDrDBalanceADODS.FieldByName
      ('dr_balance').AsFloat;
    if UseDrDBalanceADODS.FieldByName
      ('use_dbalance').AsInteger=1 then
      begin
        res:=True;
      end;
    end;
  except on E:Exception do
    ShowMessage('��������� ������ �������� ���. �������� ��������! '+E.Message);
  end;
  Result:=res;
end;

procedure TADOConnectDM.CheckDrUseDynamicBalanceStatus(DrNum: Integer);
begin
  if (IniFile.ReadString('BUSINESS_DATA',
    '��������_���_�������_���_����������','NO')='YES')
     then
  if (BoldModelDM.HasAllBonusADOQuery.FieldByName(
    'use_dr_balance_counter').AsInteger=1) and
    GetDrUseDynBalanceDrNum(DrNum) then
  begin
      if (BoldModelDM.HasAllBonusADOQuery.FieldByName(
    'MIN_DEBET').AsFloat>ADODMUnit.CurrDrBalance) then
      ShowMessage('�������� � �������� '+IntToStr(DrNum)+
        ' ����� ���. ������ '+FloatToStr(ADODMUnit.CurrDrBalance)+
        '! ��� ���� ��������!');
  end;
end;

procedure TADOConnectDM.DrIncomesADOTAfterPost(DataSet: TDataSet);
begin

  if (DrIncomesADOT.FieldByName('Pozyvnoi').Value<>NULL) and
    (DrIncomesADOT.FieldByName('Summa').Value<>NULL) and
    (BoldModelDM.HasAllBonusADOQuery.FieldByName(
    'use_dr_balance_counter').AsInteger=1) then
  if (DrIncomesADOT.FieldByName('Pozyvnoi').AsInteger>0) and
    (DrIncomesADOT.FieldByName('Summa').AsFloat<>0) then
  begin
  if
    GetDrUseDynBalanceDrNum(DrIncomesADOT.
      FieldByName('Pozyvnoi').AsInteger) then
  begin
    //if MessageDlg
    ShowMessage('����� ��������� ����� '+FloatToStr
      (DrIncomesADOT.FieldByName('Summa').AsFloat)+
      ' � ������������� ������� �������� � �������� '+
      IntToStr(DrIncomesADOT.FieldByName('Pozyvnoi').AsInteger)+'?');
      //mtConfirmation,[mbYes,mbNo],0) = mrYes then
      //begin
      //  addToDynamicDrBalance(
      //    DrIncomesADOT.FieldByName('Pozyvnoi').AsInteger,
      //    DrIncomesADOT.FieldByName('Summa').AsFloat);
      //end;
  end;
  end;
end;

procedure TADOConnectDM.ActiveCustADOQueryend_dtGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if ActiveCustADOQueryon_place.AsInteger>0 then
  begin
    Text:='('+IntToStr(HourOf(ActiveCustADOQueryData_na_tochke.AsDateTime))+
    ':'+IntToStr(MinuteOf(ActiveCustADOQueryData_na_tochke.AsDateTime))+
    ')*'+ActiveCustADOQueryend_dt.AsString;
  end
  else
    Text:=ActiveCustADOQueryend_dt.AsString;
end;

procedure TADOConnectDM.editCurrentOrderOptions;
var currOrdOptComb: String;
    mod2: Integer;
    modBool: Boolean;
    optName: String;
    fl: TStringList;
    i: Integer;
begin
  fl := TStringList.Create;
  try
  try

  if ActiveCustADOQuery.Active then
  begin
  if ActiveCustADOQuery.RecordCount>0 then
  begin

  OrdOptsTblADODS.Active:=false;
  OrdOptsTblADODS.Active:=true;

  if OrdOptsTblADODS.Active then
  begin
  if OrdOptsTblADODS.RecordCount>0 then
  begin

  ReleaseStructForm.OrderOptionTabSheet.Show;
  ReleaseStructForm.SaveOOptsBitBtn.Enabled:=False;

  currOrdOptComb:=ActiveCustADOQuery.FieldByName('OPT_COMB_STR').AsString;
  currOrdOptID:=ActiveCustADOQuery.FieldByName('BOLD_ID').AsInteger;
  OrderOptionsCDS.Active:=False;
  OrderOptionsCDS.CreateDataSet;
  OrdOptsTblADODS.First;

  fl.Delimiter:='.';
  //fl.StrictDelimiter:=True;
  fl.DelimitedText:=currOrdOptComb;
  //ShowMessage(IntToStr(fl.Count));

  while(not OrdOptsTblADODS.Eof) do
  begin
      mod2:=0;
      modBool:=False;
      for i:=0 to fl.Count-1 do
      begin
        //ShowMessage(IntToStr(i));
        if (StrToIntDef(fl.Strings[i],-1)=
          OrdOptsTblADODS.FieldByName('ID').AsInteger)
            then
            begin
              mod2:=1;
              modBool:=True;
              Break;
            end;
      end;
     //mod2:=currOrdOptComb mod 2;
     //if(mod2<>0) then
     //     modBool:=True
     //else
     //   modBool:=False;
     optName:=OrdOptsTblADODS.FieldByName('OPTION_NAME').AsString;
     //ShowMessage(optName);
     OrderOptionsCDS.AppendRecord([optName,
        modBool, mod2, OrdOptsTblADODS.FieldByName('ID').AsInteger]);
     //currOrdOptComb:=currOrdOptComb div 2;
     OrdOptsTblADODS.Next;
  end;
  end
  else
    ShowMessage('������� ����� � ���������� �� �������� �����!');
  end
  else
    ShowMessage('������� ����� ���������!');
  end
  else
    ShowMessage('������� ������ �� �������� ������!');
  end
  else
    ShowMessage('������� ������ ���������!');

  except on E:Exception do
    ShowMessage('������ ��������� ������ ����� ������! '+E.Message);
  end;
  finally
    fl.Free;
  end;

end;

procedure TADOConnectDM.setOrderOptsComb( orderId: Integer;
  optsComb: String);
begin
  try
    SetOrdOptCombADOC.Parameters.ParamByName
      ('opts_comb').Value:=optsComb;
    SetOrdOptCombADOC.Parameters.ParamByName
      ('order_id').Value:=orderId;
    SetOrdOptCombADOC.Execute;
  except on E:Exception do
    ShowMessage('������ ���������� ���������� ����� ������! '+E.Message);
  end;
end;

procedure TADOConnectDM.saveCurrentOrderOptions;
var counter: Integer;
    optComb: String;
    app_counter: Integer;
begin
  if OrderOptionsCDS.Active then
  begin
  if OrderOptionsCDS.RecordCount>0 then
  begin
    OrderOptionsCDS.First;
    counter:=1;
    app_counter:=0;
    optComb:='';
    while(counter<=OrderOptionsCDS.RecordCount) do
    begin
      if OrderOptionsCDS.FieldByName
        ('OrderOptHasIntCDSF').AsInteger<>0 then
        begin
         if app_counter>0 then
            optComb:=optComb+'.';
         optComb:=optComb+IntToStr(OrderOptionsCDS.FieldByName
        ('OrderOptIDCDSF').AsInteger);
        app_counter:=app_counter+1;
        end;

      counter:=counter+1;
      if(counter<=OrderOptionsCDS.RecordCount) then
        OrderOptionsCDS.Next;
    end;
    //ShowMessage(IntToStr(currOrdOptID)+'---'+IntToStr(optComb));
    setOrderOptsComb( currOrdOptID, optComb);
  end
  else
    ShowMessage('������� ����� �����!');
  end
  else
    ShowMessage('������� ����� ���������!');
end;

procedure TADOConnectDM.N14Click(Sender: TObject);
begin
  editCurrentOrderOptions;
end;

procedure TADOConnectDM.OrderOptionsCDSAfterInsert(DataSet: TDataSet);
begin
  //Abort;
end;

procedure TADOConnectDM.OrderOptionsCDSOrderOptHasIntCDSFGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if OrderOptionsCDSOrderOptHasIntCDSF.AsInteger<>0 then
    Text:='��'
  else
    Text:='���';
end;

function TADOConnectDM.decodeOptComb(optComb: String): String;
var res: String;
    fl: TStringList;
    i: Integer;
begin
  res:='';
  fl:=TStringList.Create;
  try
  try
    fl.Delimiter:='.';
    //fl.StrictDelimiter:=True;
    fl.DelimitedText:=optComb;
    for i:=0 to fl.Count-1 do
      begin
        res:=res+getOOptNameByIDLoc(StrToIntDef(fl.Strings[i],-1));
      end;
  except on E:Exception do
    res:='������ ';
  end;
  finally
    fl.Free;
  end;
  Result:=res;
end;

function TADOConnectDM.getOOptNameByIDLoc(optId: Integer): String;
var res: String;
begin
  res:='';
  try
    if not OOptsDictADODS.Active then
       OOptsDictADODS.Active:=True;
    if OOptsDictADODS.Active then
    if OOptsDictADODS.RecordCount>0 then
    begin
      OOptsDictADODS.First;
      while(not OOptsDictADODS.Eof) do
      begin
        if(OOptsDictADODS.FieldByName('ID').AsInteger=
          optId)  then
          begin
            res:=OOptsDictADODS.FieldByName('OPTION_NAME').AsString+' ';
            Break;
          end;
        OOptsDictADODS.Next;
      end;
    end;
  except on E:Exception do
    res:='������ ';
  end;
  Result:=res;
end;

procedure TADOConnectDM.ActiveCustADOQueryOPT_COMB_STRGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text:=decodeOptComb(ActiveCustADOQueryOPT_COMB_STR.AsString);
end;

procedure TADOConnectDM.N15Click(Sender: TObject);
begin
   if MessageDlg('��������������� �������� ������?', mtConfirmation,
    [mbYes,mbNo],0) = mrYes then
   begin
      Self.reserveOrderPres(
        ActiveCustADOQuery.
        FindField('BOLD_ID').AsInteger);
   end;
end;

procedure TADOConnectDM.N16Click(Sender: TObject);
begin
   if MessageDlg('������� �������� ������ �� ��������?', mtConfirmation,
    [mbYes,mbNo],0) = mrYes then
   begin
      Self.realizeReservePres(
        ActiveCustADOQuery.
        FindField('BOLD_ID').AsInteger);
   end;
end;

procedure TADOConnectDM.DrIncomesADOTBeforeEdit(DataSet: TDataSet);
begin
  if (DrIncomesADOT.FieldByName('Summa').AsFloat<>0) and
    (DrIncomesADOT.FieldByName('Pozyvnoi').AsInteger>0) then
    begin
      //DrIncomesADOT.Cancel;
      //DataSet.FindField()
      Abort;
      ShowMessage('������ ������ ������ ����� ��� ��������� ����� � ��������!');

    end;
end;

procedure TADOConnectDM.DrIncomesADOTBeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

procedure TADOConnectDM.N17Click(Sender: TObject);
begin
  ADOConnectDM.SetOrderCallIt;
end;

procedure TADOConnectDM.N18Click(Sender: TObject);
begin
  SetOnlineOrderStatus(2);
end;

procedure TADOConnectDM.N19Click(Sender: TObject);
begin
  SetOnlineOrderStatus(-2);
end;

procedure TADOConnectDM.N20Click(Sender: TObject);
begin
  SetOnlineOrderStatus(0);
end;

function TADOConnectDM.proceedOpRequest( operationName: String;
  parameter1: Integer = -1; parameter2: Integer = -1;
  parameter3: Integer = -1; parameter4: String = '';
  parameter5: String = ''): Boolean;
var res: Widestring;
begin
  try
    ProceedOpRequestADOSP.
      Parameters.Refresh;
    ProceedOpRequestADOSP.Parameters.
      ParamByName('@opnm').Value := operationName;

    ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm1').Value := parameter1;

    ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm2').Value := parameter2;

    ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm3').Value := parameter3;

    ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm4').Value := parameter4;
    ProceedOpRequestADOSP.Parameters.
      ParamByName('@prm5').Value := parameter5;

    ProceedOpRequestADOSP.Parameters.
      ParamByName('@op_answer').Value:='';
    ProceedOpRequestADOSP.ExecProc;

    res:=ProceedOpRequestADOSP.Parameters.
      ParamValues['@op_answer'];
  except on E:Exception do
    Result := False;
  end;

  Result:=True;
end;

procedure TADOConnectDM.N21Click(Sender: TObject);
begin
  if not (ActiveCustADOQuery.FindField('vypolnyaetsya_voditelem')
    .AsInteger>0) then
    begin
      ShowMessage('��� ������ � �������� �������� ' +
        '(���������� ������ ������ ��������)!');
    end
  else
    begin
      self.proceedOpRequest('dr_order_late', ActiveCustADOQuery
        .FindField('vypolnyaetsya_voditelem').AsInteger);
    end;
end;

procedure TADOConnectDM.ActiveCustADOQueryadr_manual_setGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if ActiveCustADOQueryadr_manual_set.AsInteger>0 then
    Text:='��, ����� ������'
  else
    Text:='?�������� ��� ������� ����� ��� ��� ������������� ';
end;

end.
