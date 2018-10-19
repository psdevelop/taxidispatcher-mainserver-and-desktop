object ADOConnectDM: TADOConnectDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 576
  Width = 696
  object MainADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    AfterConnect = MainADOConnectionAfterConnect
    Left = 72
    Top = 56
  end
  object ActiveCustADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Filter = 'Yavl_pochasovym=0'
    BeforeInsert = ActiveCustADOQueryBeforeInsert
    BeforeEdit = ActiveCustADOQueryBeforeEdit
    BeforePost = ActiveCustADOQueryBeforePost
    AfterPost = ActiveCustADOQueryAfterPost
    OnCalcFields = ActiveCustADOQueryCalcFields
    Parameters = <
      item
        Name = 'disp_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select  c.*,'
      '(CAST(DATEPART(hh , c.nachalo_zakaza_data) as CHAR(2))+'#39':'#39'+'
      
        'CAST(DATEPART(mm, c.nachalo_zakaza_data) as CHAR(2))) as start_d' +
        't,'
      '(CAST(DATEPART(hh, c.konec_zakaza_data) as CHAR(2))+'#39':'#39'+'
      'CAST(DATEPART(mm, c.konec_zakaza_data) as CHAR(2))) as end_dt,'
      'dbo.GetCustComment(c.nomer_zakaza,c.nachalo_zakaza_data,'
      'c.telefon_klienta+c.adres_vyzova_vvodim,'
      
        'c.otpuskaetsya_dostepcherom, c.otpravlyaetsya, c.Pozyvnoi_ustan)' +
        ' as MainCComment, '
      
        'dbo.GetOrderINumComment(c.Adres_okonchaniya_zayavki) as INumInfo' +
        ','
      'dbo.GetEndSectorNameByID(c.konechnyi_sektor_raboty) as esect,'
      'dbo.GetEndSectorNameByID(c.SECTOR_ID) as order_sect,'
      'dbo.GetEndSectorNameByID(c.direct_sect_id) as dir_sect,'
      'dbo.GetRemoteCustComment ( c.REMOTE_SET, '
      
        'c.REMOTE_INCOURSE, c.REMOTE_ACCEPTED, c.REMOTE_DRNUM) as RemCust' +
        'Comment,'
      
        'dbo.GetSendSMSCustComment ( c.DRIVER_SMS_SEND_STATE, c.CLIENT_SM' +
        'S_SEND_STATE, '
      'c.SMS_SEND_DRNUM, c.SMS_SEND_CLPHONE) as SendSMSCustComment,'
      'dbo.GetOrdTarifNameByTId(c.TARIFF_ID) as tarif_name,'
      'dbo.GetEndSectorNameByID(c.detected_sector) as det_sect_name   '
      'from Zakaz c, Personal p '
      'where '
      '(c.zavershyon=0)'
      ''
      'and '
      ''
      '((c.otpuskaetsya_dostepcherom=p.BOLD_ID)'
      'and (p.Ident_dispetchera=:disp_id))'
      ''
      'order by c.nomer_zakaza')
    Left = 24
    Top = 8
    object ActiveCustADOQueryBOLD_ID: TIntegerField
      FieldName = 'BOLD_ID'
    end
    object ActiveCustADOQueryBOLD_TYPE: TSmallintField
      FieldName = 'BOLD_TYPE'
    end
    object ActiveCustADOQueryYavl_pochasovym: TIntegerField
      FieldName = 'Yavl_pochasovym'
    end
    object ActiveCustADOQueryKolichestvo_chasov: TBCDField
      FieldName = 'Kolichestvo_chasov'
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQueryNachalo_zakaza_data: TDateTimeField
      FieldName = 'Nachalo_zakaza_data'
    end
    object ActiveCustADOQueryKonec_zakaza_data: TDateTimeField
      FieldName = 'Konec_zakaza_data'
    end
    object ActiveCustADOQueryTelefon_klienta: TStringField
      FieldName = 'Telefon_klienta'
      Size = 255
    end
    object ActiveCustADOQueryData_podachi: TDateTimeField
      FieldName = 'Data_podachi'
    end
    object ActiveCustADOQueryZavershyon: TIntegerField
      FieldName = 'Zavershyon'
    end
    object ActiveCustADOQueryArhivnyi: TIntegerField
      FieldName = 'Arhivnyi'
    end
    object ActiveCustADOQueryUslovn_stoim: TBCDField
      FieldName = 'Uslovn_stoim'
      OnGetText = ActiveCustADOQueryUslovn_stoimGetText
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQueryAdres_vyzova_vvodim: TStringField
      FieldName = 'Adres_vyzova_vvodim'
      OnGetText = ActiveCustADOQueryAdres_vyzova_vvodimGetText
      Size = 255
    end
    object ActiveCustADOQueryPredvariteljnyi: TIntegerField
      FieldName = 'Predvariteljnyi'
    end
    object ActiveCustADOQueryData_predvariteljnaya: TDateTimeField
      FieldName = 'Data_predvariteljnaya'
    end
    object ActiveCustADOQueryZadeistv_predvarit: TIntegerField
      FieldName = 'Zadeistv_predvarit'
    end
    object ActiveCustADOQueryData_po_umolchaniyu: TDateTimeField
      FieldName = 'Data_po_umolchaniyu'
    end
    object ActiveCustADOQuerySoobsheno_voditelyu: TIntegerField
      FieldName = 'Soobsheno_voditelyu'
    end
    object ActiveCustADOQueryvypolnyaetsya_voditelem: TIntegerField
      FieldName = 'vypolnyaetsya_voditelem'
    end
    object ActiveCustADOQueryotpuskaetsya_dostepcherom: TIntegerField
      FieldName = 'otpuskaetsya_dostepcherom'
    end
    object ActiveCustADOQueryocenivaetsya_cherez: TIntegerField
      FieldName = 'ocenivaetsya_cherez'
    end
    object ActiveCustADOQueryadres_sektora: TIntegerField
      FieldName = 'adres_sektora'
    end
    object ActiveCustADOQuerykonechnyi_sektor_raboty: TIntegerField
      FieldName = 'konechnyi_sektor_raboty'
    end
    object ActiveCustADOQuerysektor_voditelya: TIntegerField
      FieldName = 'sektor_voditelya'
    end
    object ActiveCustADOQueryNomer_zakaza: TBCDField
      FieldName = 'Nomer_zakaza'
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQueryAdres_okonchaniya_zayavki: TStringField
      FieldName = 'Adres_okonchaniya_zayavki'
      Size = 255
    end
    object ActiveCustADOQueryPozyvnoi_ustan: TIntegerField
      FieldName = 'Pozyvnoi_ustan'
      OnGetText = ActiveCustADOQueryPozyvnoi_ustanGetText
    end
    object ActiveCustADOQueryData_pribytie: TDateTimeField
      FieldName = 'Data_pribytie'
    end
    object ActiveCustADOQueryNomer_skidki: TIntegerField
      FieldName = 'Nomer_skidki'
    end
    object ActiveCustADOQueryUstan_pribytie: TIntegerField
      FieldName = 'Ustan_pribytie'
    end
    object ActiveCustADOQueryPrimechanie: TStringField
      FieldName = 'Primechanie'
      Size = 255
    end
    object ActiveCustADOQuerySlugebnyi: TIntegerField
      FieldName = 'Slugebnyi'
    end
    object ActiveCustADOQueryotpravlyaetsya: TIntegerField
      FieldName = 'otpravlyaetsya'
    end
    object ActiveCustADOQueryOpr_s_obsh_linii: TIntegerField
      FieldName = 'Opr_s_obsh_linii'
    end
    object ActiveCustADOQueryData_na_tochke: TDateTimeField
      FieldName = 'Data_na_tochke'
    end
    object ActiveCustADOQuerystart_dt: TStringField
      FieldName = 'start_dt'
      ReadOnly = True
      Size = 5
    end
    object ActiveCustADOQueryend_dt: TStringField
      FieldName = 'end_dt'
      ReadOnly = True
      OnGetText = ActiveCustADOQueryend_dtGetText
      Size = 5
    end
    object ActiveCustADOQueryMainCComment: TStringField
      FieldName = 'MainCComment'
      ReadOnly = True
      Size = 255
    end
    object ActiveCustADOQueryRegion: TStringField
      FieldKind = fkLookup
      FieldName = 'Region'
      LookupDataSet = RegionsADOQuery
      LookupKeyFields = 'Naimenovanie'
      LookupResultField = 'Naimenovanie'
      KeyFields = 'Adres_okonchaniya_zayavki'
      Size = 255
      Lookup = True
    end
    object ActiveCustADOQueryINumInfo: TStringField
      FieldName = 'INumInfo'
      ReadOnly = True
      Size = 255
    end
    object ActiveCustADOQueryesect: TStringField
      FieldName = 'esect'
      ReadOnly = True
      Size = 255
    end
    object ActiveCustADOQueryRemCustComment: TStringField
      FieldName = 'RemCustComment'
      ReadOnly = True
      Size = 255
    end
    object ActiveCustADOQueryREMOTE_SET: TIntegerField
      FieldName = 'REMOTE_SET'
    end
    object ActiveCustADOQueryREMOTE_INCOURSE: TIntegerField
      FieldName = 'REMOTE_INCOURSE'
    end
    object ActiveCustADOQueryREMOTE_ACCEPTED: TIntegerField
      FieldName = 'REMOTE_ACCEPTED'
    end
    object ActiveCustADOQueryREMOTE_DRNUM: TIntegerField
      FieldName = 'REMOTE_DRNUM'
    end
    object ActiveCustADOQueryDRIVER_SMS_SEND_STATE: TIntegerField
      FieldName = 'DRIVER_SMS_SEND_STATE'
    end
    object ActiveCustADOQueryCLIENT_SMS_SEND_STATE: TIntegerField
      FieldName = 'CLIENT_SMS_SEND_STATE'
    end
    object ActiveCustADOQuerySMS_SEND_DRNUM: TStringField
      FieldName = 'SMS_SEND_DRNUM'
      Size = 50
    end
    object ActiveCustADOQuerySMS_SEND_CLPHONE: TStringField
      FieldName = 'SMS_SEND_CLPHONE'
      Size = 50
    end
    object ActiveCustADOQuerySendSMSCustComment: TStringField
      FieldName = 'SendSMSCustComment'
      ReadOnly = True
      Size = 255
    end
    object ActiveCustADOQueryPriority_counter: TIntegerField
      FieldName = 'Priority_counter'
    end
    object ActiveCustADOQueryIndivid_order: TIntegerField
      FieldName = 'Individ_order'
    end
    object ActiveCustADOQueryIndivid_sending: TIntegerField
      FieldName = 'Individ_sending'
    end
    object ActiveCustADOQuerySECTOR_ID: TIntegerField
      FieldName = 'SECTOR_ID'
    end
    object ActiveCustADOQueryREMOTE_SUMM: TBCDField
      FieldName = 'REMOTE_SUMM'
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQueryREMOTE_INSTR: TStringField
      FieldKind = fkCalculated
      FieldName = 'REMOTE_INSTR'
      Size = 255
      Calculated = True
    end
    object ActiveCustADOQueryREMOTE_SYNC: TIntegerField
      FieldName = 'REMOTE_SYNC'
    end
    object ActiveCustADOQueryLAST_STATUS_TIME: TDateTimeField
      FieldName = 'LAST_STATUS_TIME'
    end
    object ActiveCustADOQueryorder_sect: TStringField
      FieldName = 'order_sect'
      ReadOnly = True
      Size = 255
    end
    object ActiveCustADOQueryNO_TRANSMITTING: TIntegerField
      FieldName = 'NO_TRANSMITTING'
    end
    object ActiveCustADOQueryRESTORED: TSmallintField
      FieldName = 'RESTORED'
    end
    object ActiveCustADOQueryAUTO_ARHIVED: TSmallintField
      FieldName = 'AUTO_ARHIVED'
    end
    object ActiveCustADOQueryWAITING: TIntegerField
      FieldName = 'WAITING'
    end
    object ActiveCustADOQuerydirect_sect_id: TIntegerField
      FieldName = 'direct_sect_id'
    end
    object ActiveCustADOQuerydir_sect: TStringField
      FieldName = 'dir_sect'
      ReadOnly = True
      Size = 255
    end
    object ActiveCustADOQueryfixed_time: TIntegerField
      FieldName = 'fixed_time'
    end
    object ActiveCustADOQueryfixed_summ: TBCDField
      FieldName = 'fixed_summ'
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQueryon_place: TSmallintField
      FieldName = 'on_place'
    end
    object ActiveCustADOQuerydr_assign_date: TDateTimeField
      FieldName = 'dr_assign_date'
    end
    object ActiveCustADOQuerytm_distance: TIntegerField
      FieldName = 'tm_distance'
    end
    object ActiveCustADOQuerytm_summ: TBCDField
      FieldName = 'tm_summ'
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQueryOPT_COMB: TLargeintField
      FieldName = 'OPT_COMB'
    end
    object ActiveCustADOQuerytarif_name: TStringField
      FieldName = 'tarif_name'
      ReadOnly = True
      Size = 255
    end
    object ActiveCustADOQueryOTAR_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'OTAR_LOOK'
      LookupDataSet = OrdersTarTblADODS
      LookupKeyFields = 'ID'
      LookupResultField = 'TARIF_NAME'
      KeyFields = 'TARIFF_ID'
      Size = 255
      Lookup = True
    end
    object ActiveCustADOQueryOPT_COMB_STR: TStringField
      FieldName = 'OPT_COMB_STR'
      ReadOnly = True
      OnGetText = ActiveCustADOQueryOPT_COMB_STRGetText
      Size = 255
    end
    object ActiveCustADOQueryPR_POLICY_ID: TIntegerField
      FieldName = 'PR_POLICY_ID'
    end
    object ActiveCustADOQueryTPLAN_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'TPLAN_LOOK'
      LookupDataSet = TarifPlansTblADODS
      LookupKeyFields = 'ID'
      LookupResultField = 'POLICY_NAME'
      KeyFields = 'PR_POLICY_ID'
      Size = 255
      Lookup = True
    end
    object ActiveCustADOQueryTARIFF_ID: TIntegerField
      FieldName = 'TARIFF_ID'
    end
    object ActiveCustADOQuerycall_it: TSmallintField
      FieldName = 'call_it'
    end
    object ActiveCustADOQueryrclient_id: TIntegerField
      FieldName = 'rclient_id'
    end
    object ActiveCustADOQueryrclient_status: TIntegerField
      FieldName = 'rclient_status'
    end
    object ActiveCustADOQueryclsync: TSmallintField
      FieldName = 'clsync'
    end
    object ActiveCustADOQuerytmsale: TBCDField
      FieldName = 'tmsale'
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQuerytmhistory: TStringField
      FieldName = 'tmhistory'
      Size = 1000
    end
    object ActiveCustADOQueryalarmed: TSmallintField
      FieldName = 'alarmed'
    end
    object ActiveCustADOQuerystatus_accumulate: TStringField
      FieldName = 'status_accumulate'
      Size = 2000
    end
    object ActiveCustADOQueryrclient_lat: TStringField
      FieldName = 'rclient_lat'
      Size = 50
    end
    object ActiveCustADOQueryrclient_lon: TStringField
      FieldName = 'rclient_lon'
      Size = 50
    end
    object ActiveCustADOQueryadr_manual_set: TSmallintField
      FieldName = 'adr_manual_set'
    end
    object ActiveCustADOQueryprev_price: TBCDField
      FieldName = 'prev_price'
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQuerycargo_desc: TStringField
      FieldName = 'cargo_desc'
      Size = 5000
    end
    object ActiveCustADOQueryend_adres: TStringField
      FieldName = 'end_adres'
      Size = 1000
    end
    object ActiveCustADOQueryclient_name: TStringField
      FieldName = 'client_name'
      Size = 500
    end
    object ActiveCustADOQueryprev_distance: TBCDField
      FieldName = 'prev_distance'
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQueryCLIENT_CALL_STATE: TIntegerField
      FieldName = 'CLIENT_CALL_STATE'
    end
    object ActiveCustADOQuerysrc: TIntegerField
      FieldName = 'src'
    end
    object ActiveCustADOQuerysrc_id: TStringField
      FieldName = 'src_id'
      Size = 50
    end
    object ActiveCustADOQuerysrc_state: TStringField
      FieldName = 'src_state'
      Size = 50
    end
    object ActiveCustADOQuerypassengers: TIntegerField
      FieldName = 'passengers'
    end
    object ActiveCustADOQueryluggage: TStringField
      FieldName = 'luggage'
      Size = 1000
    end
    object ActiveCustADOQuerysrc_status_code: TIntegerField
      FieldName = 'src_status_code'
    end
    object ActiveCustADOQuerysrc_on_place: TSmallintField
      FieldName = 'src_on_place'
    end
    object ActiveCustADOQuerysrc_wait_sended: TSmallintField
      FieldName = 'src_wait_sended'
    end
    object ActiveCustADOQuerybonus_add: TBCDField
      FieldName = 'bonus_add'
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQuerybonus_use: TBCDField
      FieldName = 'bonus_use'
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQuerybonus_all: TBCDField
      FieldName = 'bonus_all'
      Precision = 28
      Size = 10
    end
    object ActiveCustADOQuerydriver_rating_diff: TBCDField
      FieldName = 'driver_rating_diff'
      Precision = 18
      Size = 5
    end
    object ActiveCustADOQuerydriver_rating_expire_date: TDateTimeField
      FieldName = 'driver_rating_expire_date'
    end
    object ActiveCustADOQuerydriver_rating_bonus_code: TStringField
      FieldName = 'driver_rating_bonus_code'
      Size = 255
    end
    object ActiveCustADOQueryadr_detect_lat: TStringField
      FieldName = 'adr_detect_lat'
      Size = 50
    end
    object ActiveCustADOQueryadr_detect_lon: TStringField
      FieldName = 'adr_detect_lon'
      Size = 50
    end
    object ActiveCustADOQueryfailed_adr_coords_detect: TSmallintField
      FieldName = 'failed_adr_coords_detect'
    end
    object ActiveCustADOQuerydetected_sector: TIntegerField
      FieldName = 'detected_sector'
    end
    object ActiveCustADOQuerydet_sect_name: TStringField
      FieldName = 'det_sect_name'
      ReadOnly = True
      Size = 255
    end
    object ActiveCustADOQueryis_coordinates_upd: TSmallintField
      FieldName = 'is_coordinates_upd'
    end
    object ActiveCustADOQueryfor_all_sectors: TSmallintField
      FieldName = 'for_all_sectors'
    end
    object ActiveCustADOQueryfail_app_coords_geocode: TSmallintField
      FieldName = 'fail_app_coords_geocode'
    end
    object ActiveCustADOQuerydistrict_id: TIntegerField
      FieldName = 'district_id'
    end
    object ActiveCustADOQueryDISTRICT_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'DISTRICT_LOOK'
      LookupDataSet = DistrictsADODS
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'district_id'
      Size = 255
      Lookup = True
    end
  end
  object dsActiveCust: TDataSource
    DataSet = ActiveCustADOQuery
    OnDataChange = dsActiveCustDataChange
    Left = 72
    Top = 8
  end
  object SectByCodeADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'sect_code'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = 'sk'
      end>
    SQL.Strings = (
      'select * from Sektor_raboty where kod_sektora=:sect_code')
    Left = 24
    Top = 56
  end
  object DriverByBoldIDADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'boldid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from Voditelj where BOLD_ID=:boldid ')
    Left = 24
    Top = 104
  end
  object MainADOCommand: TADOCommand
    CommandTimeout = 3000
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'date_prm'
        DataType = ftDateTime
        Value = Null
      end>
    Left = 24
    Top = 152
  end
  object DrInfoADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dr_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from Voditelj where pozyvnoi=:dr_num')
    Left = 24
    Top = 200
  end
  object DrActCustADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dr_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from Zakaz c, Voditelj dr where (c.zavershyon=0) and '
      '(c.vypolnyaetsya_voditelem=dr.BOLD_ID) and (dr.pozyvnoi=:dr_num)'
      'and (c.Arhivnyi=0)')
    Left = 24
    Top = 248
  end
  object HistoryADOTable: TADOTable
    Connection = MainADOConnection
    CursorType = ctStatic
    TableName = 'Sootvetstvie_parametrov_zakaza'
    Left = 24
    Top = 296
  end
  object TypeByNAMEADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'typename'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = 'empty'
      end>
    SQL.Strings = (
      'select * from BOLD_TYPE where CLASSNAME=:typename')
    Left = 120
    Top = 104
  end
  object BoldIDADOTable: TADOTable
    Connection = MainADOConnection
    CursorType = ctStatic
    TableName = 'BOLD_ID'
    Left = 72
    Top = 200
  end
  object USRLoginADOQuery: TADOQuery
    Connection = BoldModelDM.ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select system_user as curr_usr_name')
    Left = 24
    Top = 344
  end
  object CurrUserADOQuery: TADOQuery
    Connection = BoldModelDM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'login'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = 'sa'
      end>
    SQL.Strings = (
      'select * from Personal where login = :login')
    Left = 120
    Top = 152
  end
  object HasNewDataADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'disp_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select Estj_nachatye  from Personal where Ident_dispetchera=:dis' +
        'p_id')
    Left = 72
    Top = 344
  end
  object NewMoveCustADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'disp_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select Estj_otpravlennye from Personal where Ident_dispetchera=:' +
        'disp_id')
    Left = 168
    Top = 152
  end
  object UnionObjADOTable: TADOTable
    Connection = MainADOConnection
    CursorType = ctStatic
    TableName = 'Objekt_vyborki_otchyotnosti'
    Left = 72
    Top = 152
  end
  object DataRefreshTimer: TTimer
    Interval = 2000
    OnTimer = DataRefreshTimerTimer
    Left = 72
    Top = 104
  end
  object DispCustToArhivePopupMenu: TPopupMenu
    Images = ImageListsDM.MainGridPopupImageList
    OnPopup = DispCustToArhivePopupMenuPopup
    Left = 168
    Top = 56
    object N1: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1072' '#1079#1072#1082#1072#1079#1072'...'
      ImageIndex = 0
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1082#1072#1082' '#1087#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081'...'
      ImageIndex = 1
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1055#1086#1084#1077#1090#1080#1090#1100' '#1082#1072#1082' '#1089#1083#1091#1078#1077#1073#1085#1099#1081'...'
      ImageIndex = 2
      OnClick = N3Click
    end
    object N5: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1072' '#1087#1088#1080#1079#1086#1074#1086#1081' '#1079#1072#1103#1074#1082#1080'...'
      ImageIndex = 0
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1072#1076#1088#1077#1089' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077'...'
      ImageIndex = 4
      OnClick = N6Click
    end
    object N8: TMenuItem
      Caption = #1057#1095#1080#1090#1072#1090#1100' '#1087#1086' '#1090#1077#1083#1077#1092#1086#1085#1085#1086#1084#1091' '#1085#1086#1084#1077#1088#1091'...'
      ImageIndex = 6
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #1057#1095#1080#1090#1072#1090#1100' '#1087#1086' '#1085#1086#1084#1077#1088#1091' '#1072#1073'-'#1090#1072'...'
      ImageIndex = 5
      OnClick = N9Click
    end
    object N7: TMenuItem
      Caption = #1059#1073#1088#1072#1090#1100' '#1080#1079' '#1095#1077#1088#1085#1086#1075#1086' '#1089#1087#1080#1089#1082#1072'...'
      ImageIndex = 7
      OnClick = N7Click
    end
    object N10: TMenuItem
      Caption = #1048#1089#1082#1072#1090#1100' '#1079#1074#1091#1082#1086#1074#1086#1081' '#1088#1086#1083#1080#1082' '#1087#1086' '#1076#1072#1090#1077' '#1079#1072#1103#1074#1082#1080'...'
      Enabled = False
      ImageIndex = 9
    end
    object N11: TMenuItem
      Caption = #1048#1089#1082#1072#1090#1100' '#1074#1080#1076#1077#1086#1088#1086#1083#1080#1082' '#1087#1086' '#1076#1072#1090#1077' '#1079#1072#1103#1074#1082#1080'...'
      Enabled = False
      ImageIndex = 8
      OnClick = N11Click
    end
    object N12: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1079#1072#1103#1074#1082#1080' '#1072#1073#1086#1085#1077#1085#1090#1072'...'
      Enabled = False
      ImageIndex = 10
      OnClick = N12Click
    end
    object N13: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1086#1082#1086#1085#1095#1077#1085#1099#1093' '#1079#1072#1103#1074#1086#1082'...'
      ImageIndex = 12
      OnClick = N13Click
    end
    object Internet1: TMenuItem
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1074' '#1073#1072#1079#1091' '#1086#1073#1084#1077#1085#1072'...'
      Enabled = False
    end
    object SMS1: TMenuItem
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' SMS '#1082#1083#1080#1077#1085#1090#1091' '#1086#1073' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1086#1081' '#1084#1072#1096#1080#1085#1077'...'
      OnClick = SMS1Click
    end
    object SMS2: TMenuItem
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' SMS '#1074#1086#1076#1080#1090#1077#1083#1102'...'
      ImageIndex = 11
      OnClick = SMS2Click
    end
    object N14: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1087#1094#1080#1080' '#1079#1072#1082#1072#1079#1072'...'
      OnClick = N14Click
    end
    object N15: TMenuItem
      Caption = #1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1079#1086#1074#1091#1102'...'
      OnClick = N15Click
    end
    object N16: TMenuItem
      Caption = #1048#1089#1087'-'#1090#1100' '#1087#1088#1080#1079#1086#1074#1086#1081' '#1088#1077#1079#1077#1088#1074' '#1072#1073'-'#1090#1072'...'
      OnClick = N16Click
    end
    object N17: TMenuItem
      Caption = #1053#1072#1073#1088#1072#1090#1100' '#1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1077'...'
      OnClick = N17Click
    end
    object N18: TMenuItem
      Caption = #1057#1090#1072#1090#1091#1089' '#39#1054#1041#1056#1040#1041#1054#1058#1050#1040#39' '#1086#1085#1083#1072#1081#1085'-'#1079#1072#1082#1072#1079#1072
      OnClick = N18Click
    end
    object N19: TMenuItem
      Caption = #1057#1090#1072#1090#1091#1089' '#39#1053#1045' '#1055#1056#1048#1053#1071#1058#39' '#1086#1085#1083#1072#1081#1085'-'#1079#1072#1082#1072#1079#1072
      OnClick = N19Click
    end
    object N20: TMenuItem
      Caption = #1057#1090#1072#1090#1091#1089' '#39#1055#1056#1048#1053#1071#1058#39' '#1086#1085#1083#1072#1081#1085'-'#1079#1072#1082#1072#1079#1072
      OnClick = N20Click
    end
    object N21: TMenuItem
      Caption = #1054#1087#1086#1079#1076#1072#1083' '#1085#1072' '#1079#1072#1082#1072#1079
      OnClick = N21Click
    end
  end
  object PrevCustADOQuery: TADOQuery
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'date_prm'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from Zakaz where (Predvariteljnyi<>0) and'
      '(Zadeistv_predvarit=0) and (Data_predvariteljnaya<=:date_prm)')
    Left = 120
    Top = 200
  end
  object RefreshPrevCustTimer: TTimer
    Interval = 60000
    OnTimer = RefreshPrevCustTimerTimer
    Left = 72
    Top = 248
  end
  object DrSummADOQuery: TADOQuery
    Connection = BoldModelDM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'date_prm1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'date_prm2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dr_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select SUM(Uslovn_stoim) as dr_summ '
      'from Zakaz c, Voditelj dr where'
      '(c.Zavershyon<>0) and (c.Konec_zakaza_data>=:date_prm1)'
      'and (c.Konec_zakaza_data<=:date_prm2) and'
      ' (dr.Pozyvnoi=:dr_num) and '
      '(c.vypolnyaetsya_voditelem=dr.BOLD_ID)')
    Left = 72
    Top = 296
  end
  object CurrCustParamADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'cust_id'
        DataType = ftInteger
        Size = 1
        Value = 0
      end>
    SQL.Strings = (
      'select dbo.GetCustComment(c.nomer_zakaza) as MainCComment,'
      'dbo.GetPrevCustComment(c.nomer_zakaza) as PrevComment,'
      'dbo.GetSpecCustComment(c.nomer_zakaza) as SpecComment,'
      'dbo.GetStartSector(c.nomer_zakaza) as StartSector,'
      'dbo.GetEndSector(c.nomer_zakaza) as EndSector, c.*'
      'from Zakaz c'
      'where  (c.BOLD_ID=:cust_id) ')
    Left = 120
    Top = 344
  end
  object dsCurrCustParam: TDataSource
    DataSet = CurrCustParamADOQuery
    Left = 264
    Top = 200
  end
  object cdsSpec: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TryFalse'
        DataType = ftInteger
      end
      item
        Name = 'Prev'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Spec'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'cdsSpecIndex1'
      end>
    MasterSource = dsActiveCust
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 120
    Top = 248
  end
  object ArhiveADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select  c.*'
      'from Zakaz c'
      'where '
      '(c.arhivnyi=1)'
      ''
      'order by c.nomer_zakaza')
    Left = 264
    Top = 248
  end
  object dsArhiveCust: TDataSource
    DataSet = ArhiveADOQuery
    Left = 216
    Top = 296
  end
  object CurrCustValuesADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select dbo.GetStartSector(c.nomer_zakaza) as StartSector,'
      'dbo.GetEndSector(c.nomer_zakaza) as EndSector, c.*'
      'from Zakaz c where c.BOLD_ID=:id')
    Left = 264
    Top = 296
  end
  object dsCurrCustVal: TDataSource
    DataSet = CurrCustValuesADOQuery
    Left = 312
    Top = 296
  end
  object CustDelADOQuery: TADODataSet
    Connection = BoldModelDM.ADOConnection
    CursorType = ctStatic
    CommandText = 
      'select  c.nomer_zakaza,'#13#10'c.pozyvnoi_ustan as pozyvnoi, c.telefon' +
      '_klienta,'#13#10'c.adres_vyzova_vvodim, c.nachalo_zakaza_data,'#13#10'c.kone' +
      'c_zakaza_data, c.uslovn_stoim as stoimostj_zakaza,'#13#10'c.kolichestv' +
      'o_chasov,'#13#10'dbo.GetCustComment(c.nomer_zakaza,c.nachalo_zakaza_da' +
      'ta,'#13#10'c.telefon_klienta+c.adres_vyzova_vvodim, c.otpuskaetsya_dos' +
      'tepcherom, '#13#10'c.otpravlyaetsya, c.Pozyvnoi_ustan) as poln_imya_di' +
      'sp '#13#10'from Zakaz c'#13#10'where '#13#10'(c.zavershyon=1)'#13#10'and '#13#10'(c.arhivnyi=0' +
      ')'#13#10'and'#13#10'(c.nachalo_zakaza_data<=:end_del_date)'#13#10'order by c.nomer' +
      '_zakaza'
    CommandTimeout = 3000
    Parameters = <
      item
        Name = 'end_del_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 168
    Top = 344
  end
  object CustAggregateADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'enddt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'stdt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select COUNT(*) as ccount,'
      ' SUM(c.uslovn_stoim) as csum'
      'from Zakaz c'
      'where '
      '(c.zavershyon=1)'
      'and '
      '(c.arhivnyi=0)'
      'and'
      '(c.konec_zakaza_data<:enddt) and'
      '(c.konec_zakaza_data>=:stdt)'
      'and'
      '(Soobsheno_voditelyu=0)')
    Left = 216
    Top = 344
  end
  object EndedCustListADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandTimeout = 3000
    Parameters = <
      item
        Name = 'date_prm'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select  c.* '
      'from Zakaz c'
      'where '
      ''
      '(c.nachalo_zakaza_data>=:date_prm) and'
      '(Soobsheno_voditelyu=0) and '
      '(arhivnyi=0)'
      ''
      'order by c.nomer_zakaza desc')
    Left = 264
    Top = 344
  end
  object dsEndedCust: TDataSource
    DataSet = EndedCustListADOQuery
    Left = 312
    Top = 344
  end
  object EndedPopupMenu: TPopupMenu
    Images = ImageListsDM.MainGridPopupImageList
    Left = 360
    Top = 248
    object N4: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074' '#1072#1088#1093#1080#1074'...'
      ImageIndex = 0
      OnClick = N4Click
    end
  end
  object RegionsADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Spravochnik where (BOLD_TYPE=14)')
    Left = 360
    Top = 296
  end
  object CustAggregateSummADOQuery: TADOQuery
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'enddt'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'stdt'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select COUNT(*) as ccount,'
      ' SUM(c.uslovn_stoim) as csum'
      'from Zakaz c'
      'where '
      '(c.zavershyon=1)'
      'and '
      '(c.arhivnyi=0)'
      'and'
      '(c.konec_zakaza_data<:enddt) and'
      '(c.konec_zakaza_data>=:stdt)'
      'and'
      '(Soobsheno_voditelyu=0)')
    Left = 72
    Top = 392
  end
  object CurrUserFirstOnLastsSysEnterADOQuery: TADOQuery
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'login'
        DataType = ftString
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'select MAX(pe.Data) as late_enter from Personal p, '
      'Vhody_poljz pe where (p.login = :login) and '
      '(p.BOLD_ID=pe.imeet_vhody) and (pe.Vhod=1)')
    Left = 24
    Top = 392
  end
  object FictOrderDelADOCommand: TADOCommand
    CommandText = 
      'delete from Zakaz where (Soobsheno_voditelyu=1) and (Data_podach' +
      'i<=:del_date)'
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'del_date'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    Left = 120
    Top = 440
  end
  object ServerTimeADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select CAST(GETDATE() as DateTime) as SRV_TIME')
    Left = 120
    Top = 392
  end
  object SetNewRelateAdressPourPhoneADOCommand: TADOCommand
    CommandText = 
      'update Sootvetstvie_parametrov_zakaza set'#13#10'Adres_vyzova_vvodim=:' +
      'adress'#13#10'where '#13#10'Telefon_klienta=:phone'
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'adress'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'phone'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 72
    Top = 440
  end
  object RelateAdrCountADOQuery: TADOQuery
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'phone'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'select * from Sootvetstvie_parametrov_zakaza where '
      'Telefon_klienta=:phone')
    Left = 120
    Top = 488
  end
  object LastDriverOrderADOQuery: TADOQuery
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'dr_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select TOP 10 *, v.BOLD_ID as dr_id from Voditelj v, Zakaz z '
      'where (v.Pozyvnoi=:dr_num) and '
      '(v.BOLD_ID=z.vypolnyaetsya_voditelem) '
      'order by z.Data_podachi DESC')
    Left = 24
    Top = 488
  end
  object DeleteFromBlackListADOCommand: TADOCommand
    CommandText = 'DELETE FROM Plohie_klienty '#13#10'WHERE Telefon_klienta=:phone'
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'phone'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 72
    Top = 488
  end
  object UnCompleteOrdersByPhoneADOQuery: TADOQuery
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'phone'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'select Nomer_zakaza from Zakaz where '
      '(Zavershyon=0) and (Telefon_klienta=:phone)')
    Left = 408
    Top = 392
  end
  object LastWeekIndADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'inum'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = #39'0'#39
      end>
    SQL.Strings = (
      
        'select Nachalo_zakaza_data, Telefon_klienta, Adres_vyzova_vvodim' +
        ', Nomer_skidki '
      'from LastWeekOrdersView '
      'WHERE (Adres_okonchaniya_zayavki=:inum) and'
      '(Soobsheno_voditelyu=0) ')
    Left = 408
    Top = 344
  end
  object Last30MinDrMailInfoADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dr_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select COUNT(*) as ord_count, '
      'SUM(Uslovn_stoim) as ord_summ from Zakaz z, Voditelj v '
      'where (v.BOLD_ID=z.vypolnyaetsya_voditelem) and'
      '(v.Pozyvnoi=:dr_num) and'
      '(z.nachalo_zakaza_data>=(GetDate()-0.021)) and'
      '(z.Soobsheno_voditelyu=0) and '
      '(z.arhivnyi=0)')
    Left = 312
    Top = 392
  end
  object Last3HourseDrMailADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dr_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select COUNT(*) as ord_count, '
      'SUM(Uslovn_stoim) as ord_summ from Zakaz z, Voditelj v '
      'where (v.BOLD_ID=z.vypolnyaetsya_voditelem) and'
      '(v.Pozyvnoi=:dr_num) and'
      '(z.nachalo_zakaza_data>=(GetDate()-0.125)) and'
      '(z.Soobsheno_voditelyu=0) and '
      '(z.arhivnyi=0)')
    Left = 216
    Top = 440
  end
  object Last8HourseDrMailADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dr_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select COUNT(*) as ord_count, '
      'SUM(Uslovn_stoim) as ord_summ from Zakaz z, Voditelj v '
      'where (v.BOLD_ID=z.vypolnyaetsya_voditelem) and'
      '(v.Pozyvnoi=:dr_num) and'
      '(z.nachalo_zakaza_data>=(GetDate()-0.333)) and'
      '(z.Soobsheno_voditelyu=0) and '
      '(z.arhivnyi=0)')
    Left = 360
    Top = 488
  end
  object dsLastWeekIndOrd: TDataSource
    DataSet = LastWeekIndADOQuery
    Left = 408
    Top = 296
  end
  object SectByStrADOQuery: TADOQuery
    Connection = MainADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from Spravochnik ')
    Left = 360
    Top = 392
  end
  object Last8HourseArhADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select  COUNT(*) as arh_count '
      'from Zakaz '
      'where '
      '(arhivnyi=1) and '
      '(nachalo_zakaza_data>=(GetDate()-0.333))'
      '')
    Left = 408
    Top = 440
  end
  object Last8HoursePresentADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select COUNT(*) as presents_count '
      'from Zakaz z '
      'where (z.nachalo_zakaza_data>=(GetDate()-0.333)) and'
      '(z.Soobsheno_voditelyu=0) and '
      '(z.arhivnyi=0) and ((z.Nomer_skidki>0) or (z.Nomer_skidki=-100))')
    Left = 216
    Top = 488
  end
  object RestoreUnlinkOrdersADOC: TADOCommand
    CommandText = 
      'update Zakaz  '#13#10'set vypolnyaetsya_voditelem=dbo.GetDrIDByNum(Poz' +
      'yvnoi_ustan) '#13#10'where  '#13#10' (Pozyvnoi_ustan>0) '#13#10'and ((vypolnyaetsy' +
      'a_voditelem=-1) '#13#10'or (vypolnyaetsya_voditelem=NULL))'#13#10
    Connection = MainADOConnection
    Parameters = <>
    Left = 312
    Top = 440
  end
  object ModemsCheckTimer: TTimer
    Interval = 15000
    OnTimer = ModemsCheckTimerTimer
    Left = 408
    Top = 248
  end
  object IsDuplicateRINGADOQuery: TADOQuery
    Connection = MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'tnum'
        DataType = ftString
        Size = 12
        Value = #39'0000000000'#39
      end>
    SQL.Strings = (
      'select c.telefon_klienta '
      'from Zakaz c '
      'where '
      '(c.zavershyon=0) '
      'and '
      '(c.telefon_klienta=:tnum) '
      'order by c.nomer_zakaza')
    Left = 264
    Top = 392
  end
  object OrderHasCheckRemoteADOQuery: TADOQuery
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'BOLD_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT REMOTE_SET FROM ZAKAZ WHERE BOLD_ID=:BOLD_ID')
    Left = 504
    Top = 248
  end
  object OrderSMSStatesADOQuery: TADOQuery
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'BOLD_ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT DRIVER_SMS_SEND_STATE, '
      'CLIENT_SMS_SEND_STATE, SMS_SEND_DRNUM, '
      'SMS_SEND_CLPHONE FROM ZAKAZ WHERE BOLD_ID=:BOLD_ID')
    Left = 168
    Top = 488
  end
  object DrPhoneByNumADOQuery: TADOQuery
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'dr_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT p.mobiljnyi_telefon, dr.phone_number FROM Voditelj dr, Pe' +
        'rsona p '
      'WHERE Pozyvnoi=:dr_num AND dr.BOLD_ID=p.BOLD_ID')
    Left = 264
    Top = 440
  end
  object AbNumbersExportADODS: TADODataSet
    Connection = BoldModelDM.ADOConnection
    CommandText = 
      'select Familiya, Imya, Otchestvo, Rabochii_telefon, Ulica, Dom, ' +
      'Korpus from Persona where Elektronnyi_adres='#39#1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1081' '#1082#1083#1080#1077 +
      #1085#1090#39
    Parameters = <>
    Left = 504
    Top = 392
  end
  object ADTGSaveDlg: TSaveDialog
    DefaultExt = '*.adtg'
    Filter = #1060#1072#1081#1083#1099' '#1076#1072#1085#1085#1099#1093' ADTG *.adtg|*.adtg'
    Left = 456
    Top = 488
  end
  object ADTGOpenDlg: TOpenDialog
    DefaultExt = '*.adtg'
    Filter = #1060#1072#1081#1083#1099' '#1076#1072#1085#1085#1099#1093' ADTG, *.adtg|*.adtg|'#1042#1089#1077' '#1092#1072#1081#1083#1099', *.*|*.*'
    Left = 504
    Top = 440
  end
  object AbNumbersImportADODS: TADODataSet
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandType = cmdFile
    Parameters = <>
    Left = 464
    Top = 248
  end
  object AbNumbersImportDS: TDataSource
    DataSet = AbNumbersImportADODS
    Left = 600
    Top = 248
  end
  object DrIncomesADOT: TADOTable
    Connection = MainADOConnection
    CursorType = ctStatic
    BeforeInsert = DrIncomesADOTBeforeInsert
    BeforeEdit = DrIncomesADOTBeforeEdit
    AfterPost = DrIncomesADOTAfterPost
    TableName = 'Vyruchka_ot_voditelya'
    Left = 312
    Top = 488
    object DrIncomesADOTBOLD_ID: TIntegerField
      FieldName = 'BOLD_ID'
    end
    object DrIncomesADOTBOLD_TYPE: TSmallintField
      FieldName = 'BOLD_TYPE'
    end
    object DrIncomesADOTSumma: TBCDField
      FieldName = 'Summa'
      Precision = 28
      Size = 10
    end
    object DrIncomesADOTkem_prinositsya: TIntegerField
      FieldName = 'kem_prinositsya'
    end
    object DrIncomesADOTData_postupleniya: TDateTimeField
      FieldName = 'Data_postupleniya'
    end
    object DrIncomesADOTPozyvnoi: TIntegerField
      FieldName = 'Pozyvnoi'
    end
  end
  object DrIncomesDS: TDataSource
    DataSet = DrIncomesADOT
    Left = 456
    Top = 296
  end
  object ConnDMActL: TActionList
    Left = 408
    Top = 200
    object DrIncomeDSD: TDataSetDelete
      Category = 'Dataset'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Enabled = False
      DataSource = DrIncomesDS
    end
    object RemoteCtrlAdmDSP: TDataSetPost
      Category = 'Dataset'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      DataSource = RemoteCtrlAdmDS
    end
    object OrderTarifDSI: TDataSetInsert
      Category = 'Dataset'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1088#1080#1092
      Enabled = False
      DataSource = OrdTariffsDS
    end
    object OrderOptionDSI: TDataSetInsert
      Category = 'Dataset'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1087#1094#1080#1102
      Enabled = False
      DataSource = OrdOptsDS
    end
    object TarifPlanDSI: TDataSetInsert
      Category = 'Dataset'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1088'. '#1087#1083#1072#1085
      Enabled = False
      DataSource = TarifPlansDS
    end
    object DrIncomeDSP: TDataSetPost
      Category = 'Dataset'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      DataSource = DrIncomesDS
    end
  end
  object DrIncSummADODS: TADODataSet
    Connection = MainADOConnection
    CommandText = 
      'select ISNULL(SUM(Summa),0) as DrTakeSumm from  Vyruchka_ot_vodi' +
      'telya '#13#10'where Pozyvnoi=:poz and Data_postupleniya>=:start'#13#10
    Parameters = <
      item
        Name = 'poz'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'start'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 312
    Top = 248
  end
  object DrWorkSummADODS: TADODataSet
    Connection = MainADOConnection
    CommandText = 
      'select ISNULL((SUM(Uslovn_stoim)*dbo.GetDrTakePercent(:poz)),0) ' +
      'as DrSumm'#13#10' from Zakaz where Nachalo_zakaza_data>:start and'#13#10' Po' +
      'zyvnoi_ustan=:poz2 AND Arhivnyi=0 and Zavershyon=1 AND'#13#10' Soobshe' +
      'no_voditelyu=0'
    Parameters = <
      item
        Name = 'poz'
        Size = -1
        Value = Null
      end
      item
        Name = 'start'
        Size = -1
        Value = Null
      end
      item
        Name = 'poz2'
        Size = -1
        Value = Null
      end>
    Left = 168
    Top = 392
  end
  object RemoteCtrlAdmADOT2: TADOTable
    Connection = MainADOConnection
    CursorType = ctStatic
    AfterInsert = RemoteCtrlAdmADOT2AfterInsert
    TableName = 'Voditelj'
    Left = 504
    Top = 488
  end
  object RemoteCtrlAdmDS: TDataSource
    DataSet = RemoteCtrlAdmADOT
    Left = 24
    Top = 440
  end
  object DriversADOT: TADOTable
    Connection = MainADOConnection
    TableName = 'Voditelj'
    Left = 360
    Top = 8
  end
  object RemSetOrdersADODS: TADODataSet
    Connection = MainADOConnection
    CommandText = 'select *  from Zakaz '#13#10'WHERE REMOTE_SET>0 and '#13#10' REMOTE_SET<100'
    Parameters = <>
    Left = 312
    Top = 200
  end
  object RemoteDataRefreshTimer: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = RemoteDataRefreshTimerTimer
    Left = 216
    Top = 8
  end
  object dsOrdersOccupAtts: TDataSource
    DataSet = OrdersOccupAttsADOT
    Left = 456
    Top = 344
  end
  object RemOrderByIdADODS: TADODataSet
    Connection = MainADOConnection
    CommandText = 'SELECT * FROM Zakaz WHERE BOLD_ID=:order_id'
    Parameters = <
      item
        Name = 'order_id'
        Size = -1
        Value = Null
      end>
    Left = 168
    Top = 200
  end
  object DrWorkDetailSummADODS: TADODataSet
    Connection = MainADOConnection
    CommandText = 
      'SELECT  '#13#10'dbo.GetDrDaysIntervalFixedSumm(:poz3, :dr_start_date, ' +
      ':dr_end_date, :free_days_count) as days_fixed_summ,'#13#10'dbo.GetDrOr' +
      'derFixedSumm('#13#10':poz4, :dr_start_date2) as order_fixed_summ'
    Parameters = <
      item
        Name = 'poz3'
        Size = -1
        Value = Null
      end
      item
        Name = 'dr_start_date'
        Size = -1
        Value = Null
      end
      item
        Name = 'dr_end_date'
        Size = -1
        Value = Null
      end
      item
        Name = 'free_days_count'
        Size = -1
        Value = Null
      end
      item
        Name = 'poz4'
        Size = -1
        Value = Null
      end
      item
        Name = 'dr_start_date2'
        Size = -1
        Value = Null
      end>
    Left = 216
    Top = 152
  end
  object OrdersOccupAttsADOT: TADODataSet
    Connection = MainADOConnection
    CommandText = 'select *  from ORDER_ACCEPTING '#13#10'WHERE ORDER_ID=:order_id'
    Parameters = <
      item
        Name = 'order_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 360
    Top = 200
  end
  object SetDrFromPretendADOSP: TADOStoredProc
    Connection = MainADOConnection
    ProcedureName = 'SetDriverFromPretendents;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@driver_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 312
    Top = 104
  end
  object DrWorkFixSummADODS: TADODataSet
    Connection = MainADOConnection
    CommandText = 
      'select ISNULL((dbo.GetDriverDaysFixedSumm(:poz3, :dr_start_date,' +
      ' :free_days_count) + dbo.GetDrOrderFixedSumm('#13#10':poz4, :dr_start_' +
      'date2)),0) as DrSumm'#13#10
    Parameters = <
      item
        Name = 'poz3'
        Size = -1
        Value = Null
      end
      item
        Name = 'dr_start_date'
        Size = -1
        Value = Null
      end
      item
        Name = 'free_days_count'
        Size = -1
        Value = Null
      end
      item
        Name = 'poz4'
        Size = -1
        Value = Null
      end
      item
        Name = 'dr_start_date2'
        Size = -1
        Value = Null
      end>
    Left = 168
    Top = 440
  end
  object ManualSetOrdRemStatADOSP: TADOStoredProc
    Connection = MainADOConnection
    ProcedureName = 'ManualSetOrderRemoteStatus;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@dest_status'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 168
    Top = 248
  end
  object DrParamsADOQuery: TADOQuery
    Connection = BoldModelDM.ADOConnection
    Parameters = <
      item
        Name = 'dr_num'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select dr.*'
      'from Voditelj dr where'
      'dr.Pozyvnoi=:dr_num')
    Left = 168
    Top = 104
  end
  object RemoteCtrlAdmADOT: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select *  from Voditelj order by Pozyvnoi asc'
    Parameters = <>
    Left = 360
    Top = 152
    object RemoteCtrlAdmADOTBOLD_ID: TIntegerField
      FieldName = 'BOLD_ID'
    end
    object RemoteCtrlAdmADOTBOLD_TYPE: TSmallintField
      FieldName = 'BOLD_TYPE'
    end
    object RemoteCtrlAdmADOTPozyvnoi: TIntegerField
      FieldName = 'Pozyvnoi'
    end
    object RemoteCtrlAdmADOTV_rabote: TIntegerField
      FieldName = 'V_rabote'
    end
    object RemoteCtrlAdmADOTNa_pereryve: TIntegerField
      FieldName = 'Na_pereryve'
    end
    object RemoteCtrlAdmADOTIndeks_ocheryodnosti: TIntegerField
      FieldName = 'Indeks_ocheryodnosti'
    end
    object RemoteCtrlAdmADOTData_po_umolchaniyu: TDateTimeField
      FieldName = 'Data_po_umolchaniyu'
    end
    object RemoteCtrlAdmADOTrabotaet_na: TIntegerField
      FieldName = 'rabotaet_na'
    end
    object RemoteCtrlAdmADOTchem_uchityvaetsya_voditelj: TIntegerField
      FieldName = 'chem_uchityvaetsya_voditelj'
    end
    object RemoteCtrlAdmADOTrabotaet_na_sektore: TIntegerField
      FieldName = 'rabotaet_na_sektore'
    end
    object RemoteCtrlAdmADOTNomer_posl_sektora: TIntegerField
      FieldName = 'Nomer_posl_sektora'
    end
    object RemoteCtrlAdmADOTZanyat_drugim_disp: TIntegerField
      FieldName = 'Zanyat_drugim_disp'
    end
    object RemoteCtrlAdmADOTVremya_poslednei_zayavki: TDateTimeField
      FieldName = 'Vremya_poslednei_zayavki'
    end
    object RemoteCtrlAdmADOTNomer_deg_gruppy: TIntegerField
      FieldName = 'Nomer_deg_gruppy'
    end
    object RemoteCtrlAdmADOTA_klass: TIntegerField
      FieldName = 'A_klass'
    end
    object RemoteCtrlAdmADOTB_klass: TIntegerField
      FieldName = 'B_klass'
    end
    object RemoteCtrlAdmADOTD_klass: TIntegerField
      FieldName = 'D_klass'
    end
    object RemoteCtrlAdmADOTE_klass: TIntegerField
      FieldName = 'E_klass'
    end
    object RemoteCtrlAdmADOTGaragn_nomer: TStringField
      FieldName = 'Garagn_nomer'
      Size = 255
    end
    object RemoteCtrlAdmADOTGos_nomernoi_znak: TStringField
      FieldName = 'Gos_nomernoi_znak'
      Size = 255
    end
    object RemoteCtrlAdmADOTKlass_vodit: TStringField
      FieldName = 'Klass_vodit'
      Size = 255
    end
    object RemoteCtrlAdmADOTLicenzionnaya_kart: TStringField
      FieldName = 'Licenzionnaya_kart'
      Size = 255
    end
    object RemoteCtrlAdmADOTMarka_avtomobilya: TStringField
      FieldName = 'Marka_avtomobilya'
      Size = 255
    end
    object RemoteCtrlAdmADOTS_klass: TIntegerField
      FieldName = 'S_klass'
    end
    object RemoteCtrlAdmADOTUdostoverenie_nom: TStringField
      FieldName = 'Udostoverenie_nom'
      Size = 255
    end
    object RemoteCtrlAdmADOTIzm_haraktrist: TIntegerField
      FieldName = 'Izm_haraktrist'
    end
    object RemoteCtrlAdmADOTcvet_avto: TStringField
      FieldName = 'cvet_avto'
      Size = 255
    end
    object RemoteCtrlAdmADOTtip_nomer_racii: TStringField
      FieldName = 'tip_nomer_racii'
      Size = 255
    end
    object RemoteCtrlAdmADOTotnositsya_k_gruppe: TIntegerField
      FieldName = 'otnositsya_k_gruppe'
    end
    object RemoteCtrlAdmADOTIndivid_procent: TBCDField
      FieldName = 'Individ_procent'
      Precision = 28
      Size = 10
    end
    object RemoteCtrlAdmADOTPriority: TIntegerField
      FieldName = 'Priority'
    end
    object RemoteCtrlAdmADOTREMOTE_LOGIN: TStringField
      FieldName = 'REMOTE_LOGIN'
      Size = 50
    end
    object RemoteCtrlAdmADOTREMOTE_PASSWORD: TStringField
      FieldName = 'REMOTE_PASSWORD'
      Size = 50
    end
    object RemoteCtrlAdmADOTREMOTE_STATUS: TIntegerField
      FieldName = 'REMOTE_STATUS'
    end
    object RemoteCtrlAdmADOTACCEPT_RSTATUS: TIntegerField
      FieldName = 'ACCEPT_RSTATUS'
    end
    object RemoteCtrlAdmADOTSTAT_ORDER_ID: TIntegerField
      FieldName = 'STAT_ORDER_ID'
    end
    object RemoteCtrlAdmADOTREMOTE_SYNC: TIntegerField
      FieldName = 'REMOTE_SYNC'
    end
    object RemoteCtrlAdmADOTLAST_STATUS_TIME: TDateTimeField
      FieldName = 'LAST_STATUS_TIME'
    end
    object RemoteCtrlAdmADOTITS_REMOTE_CLIENT: TIntegerField
      FieldName = 'ITS_REMOTE_CLIENT'
    end
    object RemoteCtrlAdmADOTSYNC_STATUS: TIntegerField
      FieldName = 'SYNC_STATUS'
    end
    object RemoteCtrlAdmADOTDR_SUMM: TBCDField
      FieldName = 'DR_SUMM'
      Precision = 28
      Size = 10
    end
    object RemoteCtrlAdmADOTSEND_WBROADCAST: TIntegerField
      FieldName = 'SEND_WBROADCAST'
    end
    object RemoteCtrlAdmADOTEN_MOVING: TIntegerField
      FieldName = 'EN_MOVING'
    end
    object RemoteCtrlAdmADOTUSE_GPS: TSmallintField
      FieldName = 'USE_GPS'
    end
    object RemoteCtrlAdmADOTGTSS_ACCT_ID: TStringField
      FieldName = 'GTSS_ACCT_ID'
      Size = 50
    end
    object RemoteCtrlAdmADOTGTSS_DEV_ID: TStringField
      FieldName = 'GTSS_DEV_ID'
      Size = 50
    end
    object RemoteCtrlAdmADOThas_sect_fords: TSmallintField
      FieldName = 'has_sect_fords'
    end
    object RemoteCtrlAdmADOThas_forall_fords: TSmallintField
      FieldName = 'has_forall_fords'
    end
    object RemoteCtrlAdmADOTDRIVER_BALANCE: TBCDField
      FieldName = 'DRIVER_BALANCE'
      Precision = 28
      Size = 10
    end
    object RemoteCtrlAdmADOTuse_dyn_balance: TSmallintField
      FieldName = 'use_dyn_balance'
    end
    object RemoteCtrlAdmADOThas_active_events: TSmallintField
      FieldName = 'has_active_events'
    end
    object RemoteCtrlAdmADOTrlock_on_calc_debt: TSmallintField
      FieldName = 'rlock_on_calc_debt'
    end
    object RemoteCtrlAdmADOTWAS_REMOTE_CLIENT: TIntegerField
      FieldName = 'WAS_REMOTE_CLIENT'
    end
    object RemoteCtrlAdmADOTftime_tariff: TBCDField
      FieldName = 'ftime_tariff'
      Precision = 28
      Size = 10
    end
    object RemoteCtrlAdmADOTtmeter_tariff: TBCDField
      FieldName = 'tmeter_tariff'
      Precision = 28
      Size = 10
    end
    object RemoteCtrlAdmADOTGPSC_REQU_FLAG: TSmallintField
      FieldName = 'GPSC_REQU_FLAG'
    end
    object RemoteCtrlAdmADOTuse_tmeter: TSmallintField
      FieldName = 'use_tmeter'
    end
    object RemoteCtrlAdmADOTuse_nlocserv: TSmallintField
      FieldName = 'use_nlocserv'
    end
    object RemoteCtrlAdmADOTuse_bloc: TSmallintField
      FieldName = 'use_bloc'
    end
    object RemoteCtrlAdmADOTPR_POLICY_ID: TIntegerField
      FieldName = 'PR_POLICY_ID'
    end
    object RemoteCtrlAdmADOTday_payment: TBCDField
      FieldName = 'day_payment'
      Precision = 28
      Size = 10
    end
    object RemoteCtrlAdmADOTmanual_day_sale: TSmallintField
      FieldName = 'manual_day_sale'
    end
    object RemoteCtrlAdmADOTdaily_paym_status: TSmallintField
      FieldName = 'daily_paym_status'
    end
    object RemoteCtrlAdmADOTonline_set_uname: TStringField
      FieldName = 'online_set_uname'
      Size = 255
    end
    object RemoteCtrlAdmADOTpaym_check_date: TDateTimeField
      FieldName = 'paym_check_date'
    end
    object RemoteCtrlAdmADOTrequire_gps: TSmallintField
      FieldName = 'require_gps'
    end
    object RemoteCtrlAdmADOTavar1: TSmallintField
      FieldName = 'avar1'
    end
    object RemoteCtrlAdmADOTavar2: TSmallintField
      FieldName = 'avar2'
    end
    object RemoteCtrlAdmADOTavar3: TSmallintField
      FieldName = 'avar3'
    end
    object RemoteCtrlAdmADOTavar4: TSmallintField
      FieldName = 'avar4'
    end
    object RemoteCtrlAdmADOTavar5: TSmallintField
      FieldName = 'avar5'
    end
    object RemoteCtrlAdmADOTavar6: TSmallintField
      FieldName = 'avar6'
    end
    object RemoteCtrlAdmADOTavar7: TSmallintField
      FieldName = 'avar7'
    end
    object RemoteCtrlAdmADOTavar8: TSmallintField
      FieldName = 'avar8'
    end
    object RemoteCtrlAdmADOTavar9: TSmallintField
      FieldName = 'avar9'
    end
    object RemoteCtrlAdmADOTavar10: TSmallintField
      FieldName = 'avar10'
    end
    object RemoteCtrlAdmADOTaddit_rem_params: TStringField
      FieldName = 'addit_rem_params'
      Size = 500
    end
    object RemoteCtrlAdmADOTfix_order_pay_with_daily_pay: TSmallintField
      FieldName = 'fix_order_pay_with_daily_pay'
    end
    object RemoteCtrlAdmADOTlast_lat: TStringField
      FieldName = 'last_lat'
      Size = 50
    end
    object RemoteCtrlAdmADOTlast_lon: TStringField
      FieldName = 'last_lon'
      Size = 50
    end
    object RemoteCtrlAdmADOTphone_number: TStringField
      FieldName = 'phone_number'
      Size = 50
    end
    object RemoteCtrlAdmADOTdrgroup: TStringField
      FieldKind = fkLookup
      FieldName = 'drgroup'
      LookupDataSet = DrGroupsADODS
      LookupKeyFields = 'BOLD_ID'
      LookupResultField = 'Naimenovanie'
      KeyFields = 'otnositsya_k_gruppe'
      Size = 255
      Lookup = True
    end
    object RemoteCtrlAdmADOTlast_speed: TStringField
      FieldName = 'last_speed'
      Size = 50
    end
    object RemoteCtrlAdmADOTlast_cctime: TDateTimeField
      FieldName = 'last_cctime'
    end
    object RemoteCtrlAdmADOTits_manager: TSmallintField
      FieldName = 'its_manager'
    end
    object RemoteCtrlAdmADOTforders_wbroadcast: TMemoField
      FieldName = 'forders_wbroadcast'
      BlobType = ftMemo
    end
    object RemoteCtrlAdmADOTauto_bith_year: TIntegerField
      FieldName = 'auto_bith_year'
    end
    object RemoteCtrlAdmADOTauto_material: TStringField
      FieldName = 'auto_material'
      Size = 255
    end
    object RemoteCtrlAdmADOTdr_cargo_services: TStringField
      FieldName = 'dr_cargo_services'
      Size = 1500
    end
    object RemoteCtrlAdmADOTaddit_cargo_info: TStringField
      FieldName = 'addit_cargo_info'
      Size = 3000
    end
    object RemoteCtrlAdmADOTis_our: TSmallintField
      FieldName = 'is_our'
    end
    object RemoteCtrlAdmADOTdont_reset_time: TSmallintField
      FieldName = 'dont_reset_time'
    end
    object RemoteCtrlAdmADOTfull_name: TStringField
      FieldName = 'full_name'
      Size = 500
    end
    object RemoteCtrlAdmADOTcc_updated: TSmallintField
      FieldName = 'cc_updated'
    end
    object RemoteCtrlAdmADOTrating: TBCDField
      FieldName = 'rating'
      Precision = 18
      Size = 5
    end
    object RemoteCtrlAdmADOTreferral_driver_id: TIntegerField
      FieldName = 'referral_driver_id'
    end
    object RemoteCtrlAdmADOTreferral_set_date: TDateTimeField
      FieldName = 'referral_set_date'
      EditMask = '!99/99/00;1;_'
    end
  end
  object DrRemOrdCountADODS: TADODataSet
    Connection = MainADOConnection
    CommandText = 
      'select COUNT(*) as order_count from Zakaz'#13#10'WHERE  '#13#10' REMOTE_SET ' +
      'IN (8,11,13,15,19,20,21,29) AND'#13#10'NO_TRANSMITTING=0 AND '#13#10' Zavers' +
      'hyon=0 AND '#13#10'vypolnyaetsya_voditelem=:driver_id'
    Parameters = <
      item
        Name = 'driver_id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 120
    Top = 296
  end
  object SettingsADODS: TADODataSet
    Connection = MainADOConnection
    CommandText = 
      'select TOP 1 *  from Objekt_vyborki_otchyotnosti '#13#10'WHERE Tip_obj' +
      'ekta='#39'for_drivers'#39
    Parameters = <>
    Left = 168
    Top = 8
  end
  object InsertNewOrderADOSP: TADOStoredProc
    Connection = MainADOConnection
    Parameters = <>
    Left = 216
    Top = 56
  end
  object InsertOrdWithParamADOOSP: TADOStoredProc
    Connection = MainADOConnection
    ProcedureName = 'InsertOrderWithParams;1'
    Parameters = <>
    Left = 216
    Top = 104
  end
  object SetNoTransmitADOC: TADOCommand
    CommandText = 'UPDATE Zakaz SET NO_TRANSMITTING=1 '#13#10'WHERE BOLD_ID=:order_id'
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'order_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 456
    Top = 200
  end
  object CallPhonesExportADODS: TADODataSet
    Connection = BoldModelDM.ADOConnection
    CommandText = 'select *  from Sootvetstvie_parametrov_zakaza'
    Parameters = <>
    Left = 504
    Top = 296
  end
  object CallPhonesImportADODS: TADODataSet
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'C:\DEVELOP(1)\TD_5_5_0_1\Datas\call_phones.adtg'
    CommandType = cmdFile
    Parameters = <>
    Left = 504
    Top = 344
  end
  object CallPhonesImportDS: TDataSource
    DataSet = CallPhonesImportADODS
    Left = 504
    Top = 56
  end
  object ActiveEventsDS: TDataSource
    DataSet = ActiveEventsADODS
    Left = 456
    Top = 8
  end
  object ActiveEventsADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select *  from EVENTS_VIEW '#13#10'WHERE CLOSED<=0'
    Parameters = <>
    Left = 600
    Top = 344
  end
  object CloseEventADOC: TADOCommand
    CommandText = 'UPDATE  TD_EVENTS SET CLOSED=1 WHERE EVENT_ID=:eid'
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'eid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 552
    Top = 8
  end
  object AddToDynDrBalanceADOC: TADOCommand
    CommandText = 
      'UPDATE Voditelj SET DRIVER_BALANCE=DRIVER_BALANCE+:summ '#13#10'WHERE ' +
      'Pozyvnoi=:dr_num'
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'summ'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 10
        Precision = 28
        Size = 19
        Value = Null
      end
      item
        Name = 'dr_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 552
    Top = 248
  end
  object UseDrDBalanceADODS: TADODataSet
    Connection = MainADOConnection
    CommandText = 
      'SELECT dbo.GetDrUseDynBByNum(:dr_num) as use_dbalance, '#13#10'dbo.Get' +
      'DrDynBalanceByNum(:dr_num2) as dr_balance'
    Parameters = <
      item
        Name = 'dr_num'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'dr_num2'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    Left = 504
    Top = 152
  end
  object GetDrLockOnCalcDebtADOSP: TADOStoredProc
    Connection = MainADOConnection
    ProcedureName = 'GetDrLockOnCalcDebt;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@dr_num'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@res'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 600
    Top = 296
  end
  object ResetRemDrFlADOSP: TADOStoredProc
    Connection = MainADOConnection
    ProcedureName = 'ResetRemoteDriversFlags;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 456
    Top = 104
  end
  object RestoreRemDrFlagsADOSP: TADOStoredProc
    Connection = MainADOConnection
    ProcedureName = 'RestoreRemoteDriversFlags;1'
    Parameters = <>
    Left = 552
    Top = 392
  end
  object SetGPSCRequStatusADOC: TADOCommand
    CommandText = 
      'UPDATE Voditelj SET GPSC_REQU_FLAG=:status '#13#10'WHERE Pozyvnoi=:dri' +
      'ver_num'
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'status'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'driver_num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 456
    Top = 152
  end
  object OrdTariffsADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select *  from ORDER_TARIF'
    Parameters = <>
    Left = 408
    Top = 152
    object OrdTariffsADODSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object OrdTariffsADODSTARIF_NAME: TStringField
      FieldName = 'TARIF_NAME'
      Size = 255
    end
    object OrdTariffsADODSTIME_TARIF: TBCDField
      FieldName = 'TIME_TARIF'
      Precision = 28
      Size = 10
    end
    object OrdTariffsADODSTMETER_TARIF: TBCDField
      FieldName = 'TMETER_TARIF'
      Precision = 28
      Size = 10
    end
    object OrdTariffsADODSPR_POLICY_ID: TIntegerField
      FieldName = 'PR_POLICY_ID'
    end
    object OrdTariffsADODSTPLAN_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'TPLAN_LOOK'
      LookupDataSet = TarifPlansTblADODS
      LookupKeyFields = 'ID'
      LookupResultField = 'POLICY_NAME'
      KeyFields = 'PR_POLICY_ID'
      Size = 255
      Lookup = True
    end
    object OrdTariffsADODSSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
    end
    object OrdTariffsADODSIF_DEF: TSmallintField
      FieldName = 'IF_DEF'
    end
    object OrdTariffsADODSRATING_SUMM: TBCDField
      FieldName = 'RATING_SUMM'
      Precision = 28
      Size = 10
    end
    object OrdTariffsADODSIN_RATING: TSmallintField
      FieldName = 'IN_RATING'
    end
    object OrdTariffsADODSRATING_PRIORITY: TIntegerField
      FieldName = 'RATING_PRIORITY'
    end
    object OrdTariffsADODSDISTANCE_PART: TIntegerField
      FieldName = 'DISTANCE_PART'
    end
    object OrdTariffsADODSDPART_TARIF: TBCDField
      FieldName = 'DPART_TARIF'
      Precision = 28
      Size = 10
    end
    object OrdTariffsADODSSTOP_TARIF: TBCDField
      FieldName = 'STOP_TARIF'
      Precision = 28
      Size = 10
    end
    object OrdTariffsADODSDISTANCE_START: TIntegerField
      FieldName = 'DISTANCE_START'
    end
    object OrdTariffsADODSouther_tarid: TIntegerField
      FieldName = 'outher_tarid'
    end
    object OrdTariffsADODSouther_tplid: TIntegerField
      FieldName = 'outher_tplid'
    end
    object OrdTariffsADODSOTR_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'OTR_LOOK'
      LookupDataSet = TarifsTblADODS
      LookupKeyFields = 'ID'
      LookupResultField = 'TARIF_NAME'
      KeyFields = 'outher_tarid'
      Lookup = True
    end
    object OrdTariffsADODSOTP_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'OTP_LOOK'
      LookupDataSet = TarifPlansTblADODS
      LookupKeyFields = 'ID'
      LookupResultField = 'POLICY_NAME'
      KeyFields = 'outher_tplid'
      Lookup = True
    end
    object OrdTariffsADODSmiss_every_nkm: TIntegerField
      FieldName = 'miss_every_nkm'
    end
  end
  object OrdTariffsDS: TDataSource
    DataSet = OrdTariffsADODS
    Left = 504
    Top = 104
  end
  object OrdOptsADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select *  from ORDER_OPTION'
    Parameters = <>
    Left = 552
    Top = 296
    object OrdOptsADODSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object OrdOptsADODSOPTION_NAME: TStringField
      FieldName = 'OPTION_NAME'
      Size = 255
    end
    object OrdOptsADODSOSUMM_COEFF: TBCDField
      FieldName = 'OSUMM_COEFF'
      Precision = 28
      Size = 10
    end
    object OrdOptsADODSOS_COMPOSED: TBCDField
      FieldName = 'OS_COMPOSED'
      Precision = 28
      Size = 10
    end
    object OrdOptsADODSPR_POLICY_ID: TIntegerField
      FieldName = 'PR_POLICY_ID'
    end
    object OrdOptsADODSTPLAN_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'TPLAN_LOOK'
      LookupDataSet = TarifPlansTblADODS
      LookupKeyFields = 'ID'
      LookupResultField = 'POLICY_NAME'
      KeyFields = 'PR_POLICY_ID'
      Size = 255
      Lookup = True
    end
    object OrdOptsADODSSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
    end
    object OrdOptsADODSIF_DEF: TSmallintField
      FieldName = 'IF_DEF'
    end
  end
  object OrdOptsDS: TDataSource
    DataSet = OrdOptsADODS
    Left = 552
    Top = 488
  end
  object OrdersTarTblADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select *  from ORDER_TARIF'
    Parameters = <>
    Left = 600
    Top = 152
  end
  object OrderOptSetDS: TDataSource
    DataSet = OrderOptionsCDS
    Left = 408
    Top = 56
  end
  object OrdOptsTblADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select * from ORDER_OPTION ORDER BY ID ASC'
    Parameters = <>
    Left = 408
    Top = 104
    object OrdOptsTblADODSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object OrdOptsTblADODSOPTION_NAME: TStringField
      FieldName = 'OPTION_NAME'
      Size = 255
    end
    object OrdOptsTblADODSOSUMM_COEFF: TBCDField
      FieldName = 'OSUMM_COEFF'
      Precision = 28
      Size = 10
    end
    object OrdOptsTblADODSOS_COMPOSED: TBCDField
      FieldName = 'OS_COMPOSED'
      Precision = 28
      Size = 10
    end
  end
  object OrderOptionsCDS: TADODataSet
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterInsert = OrderOptionsCDSAfterInsert
    FieldDefs = <
      item
        Name = 'OrderOptionsNameCDSF'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'OrderOptionsHasCDSF'
        Attributes = [faFixed]
        DataType = ftBoolean
      end
      item
        Name = 'OrderOptHasIntCDSF'
        Attributes = [faFixed]
        DataType = ftInteger
      end
      item
        Name = 'OrderOptIDCDSF'
        Attributes = [faFixed]
        DataType = ftInteger
      end>
    Parameters = <>
    StoreDefs = True
    Left = 456
    Top = 56
    object OrderOptionsCDSOrderOptionsNameCDSF: TStringField
      FieldName = 'OrderOptionsNameCDSF'
      Size = 255
    end
    object OrderOptionsCDSOrderOptionsHasCDSF: TBooleanField
      FieldName = 'OrderOptionsHasCDSF'
    end
    object OrderOptionsCDSOrderOptHasIntCDSF: TIntegerField
      FieldName = 'OrderOptHasIntCDSF'
      OnGetText = OrderOptionsCDSOrderOptHasIntCDSFGetText
    end
    object OrderOptionsCDSOrderOptIDCDSF: TIntegerField
      FieldName = 'OrderOptIDCDSF'
    end
  end
  object SetOrdOptCombADOC: TADOCommand
    CommandText = 
      'UPDATE Zakaz SET OPT_COMB_STR=:opts_comb '#13#10'WHERE BOLD_ID=:order_' +
      'id'
    Connection = MainADOConnection
    Parameters = <
      item
        Name = 'opts_comb'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'order_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 552
    Top = 344
  end
  object OOptsDictADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select * from ORDER_OPTION'
    Parameters = <>
    Left = 504
    Top = 200
  end
  object TarifPlansADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select *  from PRICE_POLICY ORDER BY ID ASC'
    Parameters = <>
    Left = 552
    Top = 440
    object TarifPlansADODSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object TarifPlansADODSPOLICY_NAME: TStringField
      FieldName = 'POLICY_NAME'
      Size = 255
    end
    object TarifPlansADODSSHORT_NAME: TStringField
      FieldName = 'SHORT_NAME'
    end
    object TarifPlansADODSIF_DEF: TSmallintField
      FieldName = 'IF_DEF'
    end
  end
  object TarifPlansTblADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select *  from PRICE_POLICY'
    Parameters = <>
    Left = 456
    Top = 440
    object TarifPlansTblADODSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object TarifPlansTblADODSPOLICY_NAME: TStringField
      FieldName = 'POLICY_NAME'
      Size = 255
    end
  end
  object TarifPlansDS: TDataSource
    DataSet = TarifPlansADODS
    Left = 600
    Top = 200
  end
  object DrGroupsWthTPADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'select gr.BOLD_ID, gr.PR_POLICY_ID, dc.Naimenovanie '#13#10'  from Gru' +
      'ppa_voditelei gr, Spravochnik dc '#13#10'WHERE gr.BOLD_ID=dc.BOLD_ID'
    Parameters = <>
    Left = 360
    Top = 440
    object DrGroupsWthTPADODSBOLD_ID: TIntegerField
      FieldName = 'BOLD_ID'
    end
    object DrGroupsWthTPADODSPR_POLICY_ID: TIntegerField
      FieldName = 'PR_POLICY_ID'
    end
    object DrGroupsWthTPADODSNaimenovanie: TStringField
      FieldName = 'Naimenovanie'
      Size = 255
    end
    object DrGroupsWthTPADODSGRTP_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'GRTP_LOOK'
      LookupDataSet = TarifPlansTblADODS
      LookupKeyFields = 'ID'
      LookupResultField = 'POLICY_NAME'
      KeyFields = 'PR_POLICY_ID'
      Size = 255
      Lookup = True
    end
  end
  object DrsWthTPADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select *  from Voditelj'
    Parameters = <>
    Left = 264
    Top = 488
    object DrsWthTPADODSPozyvnoi: TIntegerField
      FieldName = 'Pozyvnoi'
    end
    object DrsWthTPADODSPR_POLICY_ID: TIntegerField
      FieldName = 'PR_POLICY_ID'
    end
    object DrsWthTPADODSDRTP_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'DRTP_LOOK'
      LookupDataSet = TarifPlansTblADODS
      LookupKeyFields = 'ID'
      LookupResultField = 'POLICY_NAME'
      KeyFields = 'PR_POLICY_ID'
      Size = 255
      Lookup = True
    end
  end
  object DrGroupsWthTPDS: TDataSource
    DataSet = DrGroupsWthTPADODS
    Left = 456
    Top = 392
  end
  object DrWithTPDS: TDataSource
    DataSet = DrsWthTPADODS
    Left = 408
    Top = 488
  end
  object DrWrkRatingsADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT DRIVER_RATING,Pozyvnoi,Vremya_poslednei_zayavki, CAST(Vre' +
      'mya_poslednei_zayavki as DATE) as dt,  '#13#10'CAST(Vremya_poslednei_z' +
      'ayavki as TIME) as tm  FROM DRIVER_RATINGS'#13#10'ORDER BY DRIVER_RATI' +
      'NG ASC, Vremya_poslednei_zayavki ASC'
    Parameters = <>
    Left = 360
    Top = 104
  end
  object DrWrkRatingsDS: TDataSource
    DataSet = DrWrkRatingsADODS
    Left = 408
    Top = 8
  end
  object AdrLiveSearchADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT Adres_vyzova_vvodim FROM Sootvetstvie_parametrov_zakaza W' +
      'HERE Adres_vyzova_vvodim LIKE '#39'www%'#39
    Parameters = <>
    Left = 264
    Top = 8
  end
  object ActiveDBConnsADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'EXEC sp_who2'
    Parameters = <>
    Left = 264
    Top = 56
  end
  object ADOCommandModel: TADOCommand
    CommandTimeout = 3000
    Connection = BoldModelDM.ADOConnection
    Parameters = <>
    Left = 264
    Top = 104
  end
  object RealizeEventADOSP: TADOStoredProc
    Connection = MainADOConnection
    ProcedureName = 'RealizeTDEvent;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@event_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 264
    Top = 152
  end
  object ReservePrOrdADOSP: TADOStoredProc
    Connection = MainADOConnection
    ProcedureName = 'ReserveOrderPresent;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 216
    Top = 200
  end
  object RealizeAbPresADOSP: TADOStoredProc
    Connection = MainADOConnection
    ProcedureName = 'RealizeReservePresent;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 216
    Top = 248
  end
  object PhonesCodesADOT: TADOTable
    Connection = MainADOConnection
    CursorType = ctStatic
    TableName = 'DEVICE_CODES'
    Left = 312
    Top = 8
  end
  object PhoneCodesDS: TDataSource
    DataSet = PhonesCodesADOT
    Left = 312
    Top = 56
  end
  object TarifsTblADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select *  from ORDER_TARIF'
    Parameters = <>
    Left = 360
    Top = 56
  end
  object TarAreaCoordsADOT: TADOTable
    Connection = MainADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'tarif_id'
    MasterFields = 'ID'
    MasterSource = OrdTariffsDS
    TableName = 'AREA_LINES'
    Left = 216
    Top = 392
  end
  object dsTrAreaCoords: TDataSource
    DataSet = TarAreaCoordsADOT
    Left = 360
    Top = 344
  end
  object DrOnMapHttpParamsADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select dbo.GetDriversCCHTTPParams() as prms'
    Parameters = <>
    Left = 312
    Top = 152
  end
  object GetDrLockOnCalcDebtDynADOSP: TADOStoredProc
    Connection = MainADOConnection
    ProcedureName = 'GetDrLockOnCalcDebtDyn;1'
    Parameters = <>
    Left = 504
    Top = 8
  end
  object AlarmedOrdersADOQuery: TADOQuery
    Connection = MainADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from Zakaz where alarmed=1')
    Left = 120
    Top = 8
  end
  object DrGroupsADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'select s.*  from Spravochnik s INNER JOIN  Gruppa_voditelei g '#13#10 +
      'ON s.BOLD_ID=g.BOLD_ID '
    Parameters = <>
    Left = 168
    Top = 296
    object DrGroupsADODSBOLD_ID: TIntegerField
      FieldName = 'BOLD_ID'
    end
    object DrGroupsADODSBOLD_TYPE: TSmallintField
      FieldName = 'BOLD_TYPE'
    end
    object DrGroupsADODSNaimenovanie: TStringField
      FieldName = 'Naimenovanie'
      Size = 255
    end
    object DrGroupsADODSKommentarii: TStringField
      FieldName = 'Kommentarii'
      Size = 255
    end
    object DrGroupsADODSIdentifikator: TIntegerField
      FieldName = 'Identifikator'
    end
  end
  object ProceedOpRequestADOSP: TADOStoredProc
    Connection = MainADOConnection
    ProcedureName = 'ProceedOperationRequest;1'
    Parameters = <>
    Left = 120
    Top = 56
  end
  object SectorsADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'select sc.*, dc.Naimenovanie, dc.Kommentarii  from Sektor_raboty' +
      ' sc INNER JOIN Spravochnik dc ON sc.BOLD_ID = dc.BOLD_ID'
    Parameters = <>
    Left = 552
    Top = 56
    object SectorsADODSBOLD_ID: TIntegerField
      FieldName = 'BOLD_ID'
    end
    object SectorsADODSBOLD_TYPE: TSmallintField
      FieldName = 'BOLD_TYPE'
    end
    object SectorsADODSNomer_sektora: TIntegerField
      FieldName = 'Nomer_sektora'
    end
    object SectorsADODSOblastj_sverhu: TBCDField
      FieldName = 'Oblastj_sverhu'
      Precision = 28
      Size = 10
    end
    object SectorsADODSOblastj_sleva: TBCDField
      FieldName = 'Oblastj_sleva'
      Precision = 28
      Size = 10
    end
    object SectorsADODSShirina: TBCDField
      FieldName = 'Shirina'
      Precision = 28
      Size = 10
    end
    object SectorsADODSVysota: TBCDField
      FieldName = 'Vysota'
      Precision = 28
      Size = 10
    end
    object SectorsADODSPodskazka_na_sektore: TStringField
      FieldName = 'Podskazka_na_sektore'
      Size = 1000
    end
    object SectorsADODSKod_sektora: TStringField
      FieldName = 'Kod_sektora'
      Size = 255
    end
    object SectorsADODSford_count: TIntegerField
      FieldName = 'ford_count'
    end
    object SectorsADODSford_json: TStringField
      FieldName = 'ford_json'
      Size = 5000
    end
    object SectorsADODShas_fords: TSmallintField
      FieldName = 'has_fords'
    end
    object SectorsADODSto_show_fords: TSmallintField
      FieldName = 'to_show_fords'
    end
    object SectorsADODScompany_id: TIntegerField
      FieldName = 'company_id'
    end
    object SectorsADODSdistrict_id: TIntegerField
      FieldName = 'district_id'
    end
    object SectorsADODSNaimenovanie: TStringField
      FieldName = 'Naimenovanie'
      Size = 255
    end
    object SectorsADODSKommentarii: TStringField
      FieldName = 'Kommentarii'
      Size = 255
    end
    object SectorsADODSCOMPANY_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'COMPANY_LOOK'
      LookupDataSet = DistrictCompaniesADODS
      LookupKeyFields = 'BOLD_ID'
      LookupResultField = 'Naimenovanie'
      KeyFields = 'company_id'
      Size = 255
      Lookup = True
    end
    object SectorsADODSDISTRICT_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'DISTRICT_LOOK'
      LookupDataSet = DistrictsADODS
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'district_id'
      Size = 255
      Lookup = True
    end
  end
  object SectorsCoordsADOT: TADOTable
    Connection = MainADOConnection
    CursorType = ctStatic
    IndexFieldNames = 'sector_id'
    MasterFields = 'BOLD_ID'
    MasterSource = dsSectors
    TableName = 'AREA_LINES'
    Left = 552
    Top = 104
  end
  object dsSectors: TDataSource
    DataSet = SectorsADODS
    Left = 552
    Top = 152
  end
  object dsSectorsCoords: TDataSource
    DataSet = SectorsCoordsADOT
    Left = 552
    Top = 200
  end
  object DistrictsADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 'select * from DISTRICTS'
    Parameters = <>
    Left = 600
    Top = 8
    object DistrictsADODSid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object DistrictsADODSname: TStringField
      FieldName = 'name'
      Size = 500
    end
    object DistrictsADODScompany_id: TIntegerField
      FieldName = 'company_id'
    end
    object DistrictsADODSaddress: TStringField
      FieldName = 'address'
      Size = 2000
    end
    object DistrictsADODSdefault_sector_id: TIntegerField
      FieldName = 'default_sector_id'
    end
  end
  object DistrictsADOT: TADOTable
    Connection = MainADOConnection
    CursorType = ctStatic
    TableName = 'DISTRICTS'
    Left = 600
    Top = 56
    object DistrictsADOTid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object DistrictsADOTname: TStringField
      FieldName = 'name'
      Size = 500
    end
    object DistrictsADOTcompany_id: TIntegerField
      FieldName = 'company_id'
    end
    object DistrictsADOTaddress: TStringField
      FieldName = 'address'
      Size = 2000
    end
    object DistrictsADOTdefault_sector_id: TIntegerField
      FieldName = 'default_sector_id'
    end
    object DistrictsADOTCOMPANY_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'COMPANY_LOOK'
      LookupDataSet = DistrictCompaniesADODS
      LookupKeyFields = 'BOLD_ID'
      LookupResultField = 'Naimenovanie'
      KeyFields = 'company_id'
      Size = 255
      Lookup = True
    end
    object DistrictsADOTDEF_SECTOR_LOOK: TStringField
      FieldKind = fkLookup
      FieldName = 'DEF_SECTOR_LOOK'
      LookupDataSet = DistrictSectorsADODS
      LookupKeyFields = 'BOLD_ID'
      LookupResultField = 'Naimenovanie'
      KeyFields = 'default_sector_id'
      Size = 255
      Lookup = True
    end
  end
  object DistrictsADOTDS: TDataSource
    DataSet = DistrictsADOT
    Left = 600
    Top = 104
  end
  object DistrictCompaniesADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'select org.BOLD_ID, sp.Naimenovanie  from Gruppa_voditelei org I' +
      'NNER JOIN Spravochnik sp ON org.BOLD_ID = sp.BOLD_ID'
    Parameters = <>
    Left = 600
    Top = 392
    object DistrictCompaniesADODSBOLD_ID: TIntegerField
      FieldName = 'BOLD_ID'
    end
    object DistrictCompaniesADODSNaimenovanie: TStringField
      FieldName = 'Naimenovanie'
      Size = 255
    end
  end
  object DistrictSectorsADODS: TADODataSet
    Connection = MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'select sr.BOLD_ID, sp.Naimenovanie  from Sektor_raboty sr INNER ' +
      'JOIN  Spravochnik sp ON sr.BOLD_ID = sp.BOLD_ID'
    Parameters = <>
    Left = 600
    Top = 440
    object DistrictSectorsADODSBOLD_ID: TIntegerField
      FieldName = 'BOLD_ID'
    end
    object DistrictSectorsADODSNaimenovanie: TStringField
      FieldName = 'Naimenovanie'
      Size = 255
    end
  end
end
