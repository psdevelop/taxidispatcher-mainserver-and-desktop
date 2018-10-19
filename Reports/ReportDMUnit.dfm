object ReportDM: TReportDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 368
  Width = 556
  object RvProject: TRvProject
    ProjectFile = 'C:\DEVELOP\TD_6_0_1_4\TaxiManager\Reports\TaxiDispatcher.rav'
    Left = 32
    Top = 8
  end
  object RvDataSetConnectionAllTaxSumm: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = AllTaxSummCDS
    Left = 32
    Top = 64
  end
  object AllTaxSummBoldDataSet: TBoldDataSet
    FieldDescriptions = <
      item
        BoldProperties.Expression = 'familiya'
      end
      item
        BoldProperties.Expression = 'imya'
      end
      item
        BoldProperties.Expression = 'otchestvo'
      end
      item
        BoldProperties.Expression = 'ulica'
      end
      item
        BoldProperties.Expression = 'dom'
      end
      item
        BoldProperties.Expression = 'kvartira'
      end
      item
        BoldProperties.Expression = 'korpus'
      end
      item
        BoldProperties.Expression = 'mobiljnyi_telefon'
      end
      item
        BoldProperties.Expression = 'rabochii_telefon'
      end
      item
        BoldProperties.Expression = 'domashnii_telefon'
      end
      item
        BoldProperties.Expression = 'elektronnyi_adres'
      end
      item
        BoldProperties.Expression = 'polnoe_imya'
      end
      item
        BoldProperties.Expression = 'strana'
      end
      item
        BoldProperties.Expression = 'oblastj'
      end
      item
        BoldProperties.Expression = 'gorod'
      end
      item
        BoldProperties.Expression = 'bIK'
      end
      item
        BoldProperties.Expression = 'naimenovanie'
      end
      item
        BoldProperties.Expression = 'yavlyaetsyaVlad'
      end
      item
        BoldProperties.Expression = 'rukovoditelj'
      end
      item
        BoldProperties.Expression = 'glBuhgalter'
      end
      item
        BoldProperties.Expression = 'iNN'
      end
      item
        BoldProperties.Expression = 'rasch__schet'
      end
      item
        BoldProperties.Expression = 'kPP'
      end
      item
        BoldProperties.Expression = 'tip_organizacii'
      end
      item
        BoldProperties.Expression = 'kor_schet'
      end
      item
        BoldProperties.Expression = 'naim__banka'
      end
      item
        BoldProperties.Expression = 'nachalo_intervala_raschyota'
      end
      item
        BoldProperties.Expression = 'konec_intervala_raschyota'
        FieldName = 'konec_intervala_raschyota'
      end
      item
        BoldProperties.Expression = 
          'vypolnyaet_zakazy->select(zavershyon)->select(not arhivnyi)->col' +
          'lect(stoimostj_zakaza)->sum'
        FieldName = 'zarabotal_vsego'
      end
      item
        BoldProperties.Expression = 
          'vypolnyaet_zakazy->select(not arhivnyi)->select(zavershyon)->sel' +
          'ect((konec_zakaza_data>=self.nachalo_intervala_raschyota))->sele' +
          'ct(konec_zakaza_data<self.konec_intervala_raschyota)->collect(st' +
          'oimostj_zakaza)->sum'
        FieldName = 'zarabotal_za_period'
      end
      item
        BoldProperties.Expression = 
          'velichina_procenta*'#13'vypolnyaet_zakazy->select(zavershyon)->selec' +
          't(not arhivnyi)->collect(stoimostj_zakaza)->sum'
        FieldName = 'proc_vsego'
      end
      item
        BoldProperties.Expression = 
          'velichina_procenta*'#13'vypolnyaet_zakazy->select(not arhivnyi)->sel' +
          'ect(zavershyon)'#13'->select((konec_zakaza_data>=self.nachalo_interv' +
          'ala_raschyota))'#13'->select(konec_zakaza_data<self.konec_intervala_' +
          'raschyota)->collect(stoimostj_zakaza)->sum'
        FieldName = 'proc_za_period'
      end
      item
        BoldProperties.Expression = 'prinyos_vsego'
      end
      item
        BoldProperties.Expression = 'prinyos_za_period'
      end
      item
        BoldProperties.Expression = 
          'prinyos_vsego-vypolnyaet_zakazy->select(zavershyon)->select(not ' +
          'arhivnyi)->collect(stoimostj_zakaza)->sum'
        FieldName = 'dolg_vsego'
      end
      item
        BoldProperties.Expression = 
          'prinyos_za_period-vypolnyaet_zakazy->select(not arhivnyi)->selec' +
          't(zavershyon)'#13'->select((konec_zakaza_data>=self.nachalo_interval' +
          'a_raschyota))'#13'->select(konec_zakaza_data<self.konec_intervala_ra' +
          'schyota)->collect(stoimostj_zakaza)->sum'
        FieldName = 'dolg_za_period'
      end
      item
        BoldProperties.Expression = 'velichina_procenta'
      end
      item
        BoldProperties.Expression = 'pozyvnoi'
      end
      item
        BoldProperties.Expression = 
          'vypolnyaet_zakazy->select(not arhivnyi)->select(zavershyon)'#13'->se' +
          'lect((konec_zakaza_data>=self.nachalo_intervala_raschyota))'#13'->se' +
          'lect(konec_zakaza_data<self.konec_intervala_raschyota)'#13'->select(' +
          '(nomer_skidki>0) or (nomer_skidki=-100))->size'
        FieldName = 'present_count'
      end
      item
        BoldProperties.Expression = 
          'vypolnyaet_zakazy->select(not arhivnyi)->select(zavershyon)'#13'->se' +
          'lect((konec_zakaza_data>=self.nachalo_intervala_raschyota))'#13'->se' +
          'lect(konec_zakaza_data<self.konec_intervala_raschyota)'#13'->select(' +
          'slugebnyi)->size'
        FieldName = 'spec_count'
      end
      item
        BoldProperties.Expression = 
          'vypolnyaet_zakazy->select(not arhivnyi)->select(zavershyon and n' +
          'ot soobsheno_voditelyu)'#13'->select((konec_zakaza_data>=self.nachal' +
          'o_intervala_raschyota))'#13'->select(konec_zakaza_data<self.konec_in' +
          'tervala_raschyota)'#13'->size'
        FieldName = 'all_count'
      end
      item
        BoldProperties.Expression = 
          'vypolnyaet_zakazy->select(not arhivnyi)->select(zavershyon)'#13'->se' +
          'lect((konec_zakaza_data>=self.nachalo_intervala_raschyota))'#13'->se' +
          'lect(konec_zakaza_data<self.konec_intervala_raschyota)'#13'->select(' +
          '(nomer_skidki=-2000) and soobsheno_voditelyu)->size'
        FieldName = 'self_count'
      end
      item
        BoldProperties.Expression = 
          'vypolnyaet_zakazy->select(not arhivnyi)->select(zavershyon)'#13'->se' +
          'lect((konec_zakaza_data>=self.nachalo_intervala_raschyota))'#13'->se' +
          'lect(konec_zakaza_data<self.konec_intervala_raschyota)'#13'->select(' +
          '(nomer_skidki=-3000))->size'
        FieldName = 'service_count'
      end
      item
        BoldProperties.Expression = 
          '(vypolnyaet_zakazy->select(not arhivnyi)->select(zavershyon and ' +
          'not soobsheno_voditelyu)'#13'->select((konec_zakaza_data>=self.nacha' +
          'lo_intervala_raschyota))'#13'->select(konec_zakaza_data<self.konec_i' +
          'ntervala_raschyota)->select(not self.D_klass)'#13'->size).oclAsType(' +
          'Float)*Objekt_vyborki_otchyotnosti.allInstances'#13'->select(tip_obj' +
          'ekta='#39'for_drivers'#39')->first.kolich_vyd_benzina'
        FieldName = 'za_kolvo_period'
      end
      item
        BoldProperties.Expression = 
          'velichina_procenta*'#13'vypolnyaet_zakazy->select(not arhivnyi)->sel' +
          'ect(zavershyon)'#13'->select((konec_zakaza_data>=self.nachalo_interv' +
          'ala_raschyota))'#13'->select(konec_zakaza_data<self.konec_intervala_' +
          'raschyota)->collect(stoimostj_zakaza)->sum'#13'+'#13'(vypolnyaet_zakazy-' +
          '>select(not arhivnyi)->select(zavershyon and not soobsheno_vodit' +
          'elyu)'#13'->select((konec_zakaza_data>=self.nachalo_intervala_raschy' +
          'ota))'#13'->select(konec_zakaza_data<self.konec_intervala_raschyota)' +
          '->select(not self.D_klass)'#13'->size).oclAsType(Float)*Objekt_vybor' +
          'ki_otchyotnosti.allInstances'#13'->select(tip_objekta='#39'for_drivers'#39')' +
          '->first.kolich_vyd_benzina'
        FieldName = 'za_period'
      end
      item
        BoldProperties.Expression = 'garagn_nomer'
        FieldName = 'days_fixed_summ'
      end>
    AutoOpen = False
    Left = 64
    Top = 304
  end
  object rdscOneTaxOnDaysMoving: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = DriverOrdersADODS
    Left = 136
    Top = 48
  end
  object rdscDispatchActivity: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    Left = 224
    Top = 32
  end
  object AllTaxSummCDS: TClientDataSet
    Aggregates = <>
    Filter = 'zarabotal_za_period<>0'
    FieldDefs = <
      item
        Name = 'familiya'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'imya'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'otchestvo'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ulica'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'dom'
        DataType = ftInteger
      end
      item
        Name = 'kvartira'
        DataType = ftInteger
      end
      item
        Name = 'korpus'
        DataType = ftInteger
      end
      item
        Name = 'mobiljnyi_telefon'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'rabochii_telefon'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'domashnii_telefon'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'elektronnyi_adres'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'polnoe_imya'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'strana'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'oblastj'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'gorod'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'bIK'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'naimenovanie'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'yavlyaetsyaVlad'
        DataType = ftBoolean
      end
      item
        Name = 'rukovoditelj'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'glBuhgalter'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'iNN'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'rasch__schet'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'kPP'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'tip_organizacii'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'kor_schet'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'naim__banka'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'nachalo_intervala_raschyota'
        DataType = ftDateTime
      end
      item
        Name = 'konec_intervala_raschyota'
        DataType = ftDateTime
      end
      item
        Name = 'zarabotal_vsego'
        DataType = ftFloat
      end
      item
        Name = 'zarabotal_za_period'
        DataType = ftFloat
      end
      item
        Name = 'proc_vsego'
        DataType = ftFloat
      end
      item
        Name = 'proc_za_period'
        DataType = ftFloat
      end
      item
        Name = 'prinyos_vsego'
        DataType = ftFloat
      end
      item
        Name = 'prinyos_za_period'
        DataType = ftFloat
      end
      item
        Name = 'dolg_vsego'
        DataType = ftFloat
      end
      item
        Name = 'dolg_za_period'
        DataType = ftFloat
      end
      item
        Name = 'velichina_procenta'
        DataType = ftFloat
      end
      item
        Name = 'pozyvnoi'
        DataType = ftInteger
      end
      item
        Name = 'present_count'
        DataType = ftInteger
      end
      item
        Name = 'spec_count'
        DataType = ftInteger
      end
      item
        Name = 'all_count'
        DataType = ftInteger
      end
      item
        Name = 'self_count'
        DataType = ftInteger
      end
      item
        Name = 'service_count'
        DataType = ftInteger
      end
      item
        Name = 'za_kolvo_period'
        DataType = ftFloat
      end
      item
        Name = 'za_period'
        DataType = ftFloat
      end
      item
        Name = 'days_fixed_summ'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'AllTaxSummDataSetProvider'
    StoreDefs = True
    Left = 32
    Top = 128
  end
  object AllTaxSummDataSetProvider: TDataSetProvider
    DataSet = AllTaxSummBoldDataSet
    Left = 32
    Top = 232
  end
  object RvRenderRTF: TRvRenderRTF
    DisplayName = 'Rich Text Format (RTF)'
    FileExtension = '*.rtf'
    Left = 472
    Top = 16
  end
  object RvSystem: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 88
    Top = 8
  end
  object NDROpenDialog: TOpenDialog
    Filter = #1060#1072#1081#1083#1099' '#1086#1090#1095#1105#1090#1086#1074'|*.ndr'
    Title = #1054#1090#1082#1088#1099#1090#1080#1077' '#1103#1072#1081#1083#1072' '#1076#1083#1103' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103
    Left = 400
    Top = 8
  end
  object RvDataSetConnectionCustOnPeriod: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = OrdersPerPeriodADODS
    Left = 344
    Top = 48
  end
  object bdsDispStat: TBoldDataSet
    FieldDescriptions = <
      item
        BoldProperties.Expression = 'familiya'
      end
      item
        BoldProperties.Expression = 'imya'
      end
      item
        BoldProperties.Expression = 'otchestvo'
      end
      item
        BoldProperties.Expression = 'ulica'
      end
      item
        BoldProperties.Expression = 'dom'
      end
      item
        BoldProperties.Expression = 'kvartira'
      end
      item
        BoldProperties.Expression = 'korpus'
      end
      item
        BoldProperties.Expression = 'mobiljnyi_telefon'
      end
      item
        BoldProperties.Expression = 'rabochii_telefon'
      end
      item
        BoldProperties.Expression = 'domashnii_telefon'
      end
      item
        BoldProperties.Expression = 'elektronnyi_adres'
      end
      item
        BoldProperties.Expression = 'polnoe_imya'
      end
      item
        BoldProperties.Expression = 'strana'
      end
      item
        BoldProperties.Expression = 'oblastj'
      end
      item
        BoldProperties.Expression = 'gorod'
      end
      item
        BoldProperties.Expression = 'bIK'
      end
      item
        BoldProperties.Expression = 'naimenovanie'
      end
      item
        BoldProperties.Expression = 'yavlyaetsyaVlad'
      end
      item
        BoldProperties.Expression = 'rukovoditelj'
      end
      item
        BoldProperties.Expression = 'glBuhgalter'
      end
      item
        BoldProperties.Expression = 'iNN'
      end
      item
        BoldProperties.Expression = 'rasch__schet'
      end
      item
        BoldProperties.Expression = 'kPP'
      end
      item
        BoldProperties.Expression = 'tip_organizacii'
      end
      item
        BoldProperties.Expression = 'kor_schet'
      end
      item
        BoldProperties.Expression = 'naim__banka'
      end
      item
        BoldProperties.Expression = 'login'
      end
      item
        BoldProperties.Expression = 'parolj'
      end
      item
        BoldProperties.Expression = 'prava'
      end
      item
        BoldProperties.Expression = 'kommentarii'
      end
      item
        BoldProperties.Expression = 'razreshitj_vsyo'
      end
      item
        BoldProperties.Expression = 'razresh_administr'
      end
      item
        BoldProperties.Expression = 'razresh_nastroiku_raboty'
      end
      item
        BoldProperties.Expression = 'razreshitj_prosmotr_logov'
      end
      item
        BoldProperties.Expression = 'razr_rabotu_s_arhivom'
      end
      item
        BoldProperties.Expression = 'razreshitj_udalenie_vypuskov'
      end
      item
        BoldProperties.Expression = 'razr_udalenie_razdelov'
      end
      item
        BoldProperties.Expression = 'razreshitj_udalenie_objyavlenii'
      end
      item
        BoldProperties.Expression = 'razreshitj_udalenie_ostaljnogo'
      end
      item
        BoldProperties.Expression = 'razr_prav_redkomen_sprav'
      end
      item
        BoldProperties.Expression = 'razr_prav_oper_razdelov'
      end
      item
        BoldProperties.Expression = 'ident_dispetchera'
      end
      item
        BoldProperties.Expression = 'imya_dispetchera'
      end
      item
        BoldProperties.Expression = 'estj_otpravlennye'
      end
      item
        BoldProperties.Expression = 'estj_nachatye'
      end
      item
        BoldProperties.Expression = 'nachalo_intervala'
      end
      item
        BoldProperties.Expression = 'konec_intervala'
      end
      item
        BoldProperties.Expression = 'zayav_za_interval'
      end
      item
        BoldProperties.Expression = 'summa_za_interval'
      end
      item
        BoldProperties.Expression = 
          'perechenj_zakazov->select(konec_zakaza_data>=self.nachalo_interv' +
          'ala)'#13'->select(konec_zakaza_data<=self.konec_intervala)->select(n' +
          'ot arhivnyi and zavershyon and not soobsheno_voditelyu)'#13'->select' +
          '((nachalo_zakaza_data.datetimeasfloat- data_podachi.datetimeasfl' +
          'oat)>Objekt_vyborki_otchyotnosti.allInstances->first.betweenStar' +
          'tSet.datetimeasfloat)->size'
        FieldName = 'chislDolgPostPered'
      end
      item
        BoldProperties.Expression = 
          'perechenj_zakazov->select(konec_zakaza_data>=self.nachalo_interv' +
          'ala)'#13'->select(konec_zakaza_data<=self.konec_intervala)->select(n' +
          'ot arhivnyi and zavershyon and not soobsheno_voditelyu)'#13'->select' +
          '((data_pribytie.datetimeasfloat- nachalo_zakaza_data.datetimeasf' +
          'loat)>Objekt_vyborki_otchyotnosti.allInstances->first.betweenSet' +
          'On.datetimeasfloat)->size'
        FieldName = 'chislDolgPeredPrib'
      end
      item
        BoldProperties.Expression = 
          'perechenj_zakazov->select(konec_zakaza_data>=self.nachalo_interv' +
          'ala)'#13'->select(konec_zakaza_data<=self.konec_intervala)->select(n' +
          'ot arhivnyi and zavershyon and not soobsheno_voditelyu)'#13'->select' +
          '((konec_zakaza_data.datetimeasfloat- data_pribytie.datetimeasflo' +
          'at)>Objekt_vyborki_otchyotnosti.allInstances->first.betweenOnEnd' +
          '.datetimeasfloat)->size'
        FieldName = 'chislDolgPribOkonch'
      end
      item
        BoldProperties.Expression = 
          'imeet_vhody->select(v_roli_dispetchera)->select(vhod)'#13'->select(d' +
          'ata>=self.nachalo_intervala)->select(data<=self.konec_intervala)' +
          #13'->collect(skoljko_chasov)->sum'
        FieldName = 'disp_time'
      end
      item
        BoldProperties.Expression = 
          'imeet_vhody->select(v_roli_operatora)->select(vhod)'#13'->select(dat' +
          'a>=self.nachalo_intervala)->select(data<=self.konec_intervala)'#13'-' +
          '>collect(skoljko_chasov)->sum'
        FieldName = 'operator_time'
      end
      item
        BoldProperties.Expression = 
          'otpravil_zakazy->select(konec_zakaza_data>=self.nachalo_interval' +
          'a)'#13'->select(konec_zakaza_data<=self.konec_intervala)'#13'->select(no' +
          't arhivnyi and zavershyon and not soobsheno_voditelyu)->size'
        FieldName = 'disp_cust_count'
      end>
    AutoOpen = False
    Left = 472
    Top = 320
  end
  object dspDispStat: TDataSetProvider
    DataSet = bdsDispStat
    Left = 496
    Top = 272
  end
  object cdsDispStat: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDispStat'
    Left = 472
    Top = 224
  end
  object rvdsJournal: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = JournalADOQuery
    Left = 320
    Top = 224
  end
  object rvdsDispStat: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = cdsDispStat
    Left = 472
    Top = 168
  end
  object rvdsDrStat: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = DrStateADODS
    Left = 400
    Top = 120
  end
  object JournalADOQuery: TADOQuery
    Connection = BoldModelDM.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'StartDate'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'EndDate'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'enable_arh'
        DataType = ftInteger
        Precision = 4
        Size = 2
        Value = 0
      end>
    SQL.Strings = (
      
        'select * from Zakaz z  where (z.nachalo_zakaza_data>=:StartDate)' +
        ' and (z.nachalo_zakaza_data<=:EndDate) and ((z.arhivnyi=0) or (0' +
        '<>:enable_arh)) and (z.zavershyon<>0) and (z.soobsheno_voditelyu' +
        '=0) '
      '')
    Left = 320
    Top = 272
  end
  object rdsArhiveReport: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = CustDelForm.ClientDataSet1
    Left = 472
    Top = 120
  end
  object rdsPresentsCust: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = DrPresOrdersADODS
    Left = 136
    Top = 104
  end
  object rdsArhiveReport2: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOConnectDM.CustDelADOQuery
    Left = 472
    Top = 64
  end
  object RvDataSetConnectionAggrDrInfo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = AggrDrReportADOQuery
    Left = 320
    Top = 120
  end
  object AggrDrReportADOQuery: TADOQuery
    Connection = ADOConnectDM.MainADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'stdt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'enddt'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dnum'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'dnum2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select z.*, v.Pozyvnoi from Zakaz z, Voditelj v where (z.Soobshe' +
        'no_voditelyu=1) and '
      '(z.Data_podachi>=:stdt) and (z.Data_podachi<:enddt) and '
      '(z.Arhivnyi=0) and (z.vypolnyaetsya_voditelem=v.BOLD_ID) '
      'and ((v.Pozyvnoi=:dnum) or ((-1)=:dnum2)) '
      'order by v.Pozyvnoi, z.Data_podachi')
    Left = 400
    Top = 272
  end
  object AggrDrRepDS: TDataSource
    DataSet = AggrDrReportADOQuery
    Left = 320
    Top = 168
  end
  object AllTaxSummDS: TDataSource
    DataSet = AllTaxSummCDS
    Left = 32
    Top = 184
  end
  object SMSRepADODS: TADODataSet
    Connection = ADOConnectDM.MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'select dr.Pozyvnoi, '#13#10'dbo.GetIntervalDriverSuccessSMSCount(dr.Po' +
      'zyvnoi, :start_dt, :end_dt) as DR_SMS_COUNT,'#13#10'dbo.GetIntervalDrC' +
      'lientSuccessSMSCount(dr.Pozyvnoi, :start_dt2, :end_dt2) as CL_SM' +
      'S_COUNT  from Voditelj dr ORDER BY dr.Pozyvnoi ASC'
    Parameters = <
      item
        Name = 'start_dt'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'end_dt'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'start_dt2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'end_dt2'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    Left = 192
    Top = 8
  end
  object SMSRepRvDSC: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = SMSRepADODS
    Left = 336
    Top = 8
  end
  object SMSRepDS: TDataSource
    DataSet = SMSRepADODS
    Left = 264
    Top = 8
  end
  object DrStateADODS: TADODataSet
    Connection = ADOConnectDM.MainADOConnection
    CursorType = ctStatic
    OnCalcFields = DrStateADODSCalcFields
    CommandText = 
      'select Pozyvnoi_ustan, SUM(MinuteDelta) as MunutesCount '#13#10' from ' +
      'DriversActivityIntervals '#13#10'where StartDate>=:st_date and '#13#10'Start' +
      'Date<=:end_date '#13#10'group by Pozyvnoi_ustan '
    Parameters = <
      item
        Name = 'st_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'end_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 400
    Top = 168
    object DrStateADODSPozyvnoi_ustan: TIntegerField
      FieldName = 'Pozyvnoi_ustan'
    end
    object DrStateADODSMunutesCount: TIntegerField
      FieldName = 'MunutesCount'
      ReadOnly = True
    end
    object DrStateADODSDeltaStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'DeltaStr'
      Size = 255
      Calculated = True
    end
  end
  object DrStatesDS: TDataSource
    DataSet = DrStateADODS
    Left = 400
    Top = 224
  end
  object DriverOrdersADODS: TADODataSet
    Connection = ADOConnectDM.MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'select *  from Zakaz '#13#10'where Arhivnyi=0 and Slugebnyi=0 '#13#10'and Ko' +
      'nec_zakaza_data>=:start_date '#13#10'and Konec_zakaza_data<=:end_date ' +
      #13#10'and vypolnyaetsya_voditelem=:driver_id and '#13#10'not ((Nomer_skidk' +
      'i>0) or (Nomer_skidki=-100))'
    Parameters = <
      item
        Name = 'start_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'end_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'driver_id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 136
    Top = 152
  end
  object DrPresOrdersADODS: TADODataSet
    Connection = ADOConnectDM.MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'select *  from Zakaz '#13#10'where Arhivnyi=0 '#13#10'and Konec_zakaza_data>' +
      '=:start_date '#13#10'and Konec_zakaza_data<=:end_date '#13#10'and vypolnyaet' +
      'sya_voditelem=:driver_id and '#13#10'((Nomer_skidki>0) or (Nomer_skidk' +
      'i=-100) or (Slugebnyi=1))'
    Parameters = <
      item
        Name = 'start_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'end_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'driver_id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 136
    Top = 200
  end
  object OrdersPerPeriodADODS: TADODataSet
    Connection = ADOConnectDM.MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'select *  from Zakaz '#13#10'where Arhivnyi=0 and Zavershyon=1 '#13#10'and N' +
      'achalo_zakaza_data>=:start_date '#13#10'and Nachalo_zakaza_data<=:end_' +
      'date '#13#10'and vypolnyaetsya_voditelem=:driver_id and '#13#10'((adres_sekt' +
      'ora<>konechnyi_sektor_raboty) or 0=:diff_sect) and '#13#10'((adres_sek' +
      'tora=konechnyi_sektor_raboty) or 0=:equ_sect)'
    Parameters = <
      item
        Name = 'start_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'end_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'driver_id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'diff_sect'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'equ_sect'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 136
    Top = 264
    object OrdersPerPeriodADODSBOLD_ID: TIntegerField
      FieldName = 'BOLD_ID'
    end
    object OrdersPerPeriodADODSBOLD_TYPE: TSmallintField
      FieldName = 'BOLD_TYPE'
    end
    object OrdersPerPeriodADODSYavl_pochasovym: TIntegerField
      FieldName = 'Yavl_pochasovym'
    end
    object OrdersPerPeriodADODSKolichestvo_chasov: TBCDField
      FieldName = 'Kolichestvo_chasov'
      Precision = 28
      Size = 10
    end
    object OrdersPerPeriodADODSNachalo_zakaza_data: TDateTimeField
      FieldName = 'Nachalo_zakaza_data'
    end
    object OrdersPerPeriodADODSKonec_zakaza_data: TDateTimeField
      FieldName = 'Konec_zakaza_data'
    end
    object OrdersPerPeriodADODSTelefon_klienta: TStringField
      FieldName = 'Telefon_klienta'
      Size = 255
    end
    object OrdersPerPeriodADODSData_podachi: TDateTimeField
      FieldName = 'Data_podachi'
    end
    object OrdersPerPeriodADODSZavershyon: TIntegerField
      FieldName = 'Zavershyon'
    end
    object OrdersPerPeriodADODSArhivnyi: TIntegerField
      FieldName = 'Arhivnyi'
    end
    object OrdersPerPeriodADODSUslovn_stoim: TBCDField
      FieldName = 'Uslovn_stoim'
      Precision = 28
      Size = 10
    end
    object OrdersPerPeriodADODSAdres_vyzova_vvodim: TStringField
      FieldName = 'Adres_vyzova_vvodim'
      Size = 255
    end
    object OrdersPerPeriodADODSPredvariteljnyi: TIntegerField
      FieldName = 'Predvariteljnyi'
    end
    object OrdersPerPeriodADODSData_predvariteljnaya: TDateTimeField
      FieldName = 'Data_predvariteljnaya'
    end
    object OrdersPerPeriodADODSZadeistv_predvarit: TIntegerField
      FieldName = 'Zadeistv_predvarit'
    end
    object OrdersPerPeriodADODSData_po_umolchaniyu: TDateTimeField
      FieldName = 'Data_po_umolchaniyu'
    end
    object OrdersPerPeriodADODSSoobsheno_voditelyu: TIntegerField
      FieldName = 'Soobsheno_voditelyu'
    end
    object OrdersPerPeriodADODSvypolnyaetsya_voditelem: TIntegerField
      FieldName = 'vypolnyaetsya_voditelem'
    end
    object OrdersPerPeriodADODSotpuskaetsya_dostepcherom: TIntegerField
      FieldName = 'otpuskaetsya_dostepcherom'
    end
    object OrdersPerPeriodADODSocenivaetsya_cherez: TIntegerField
      FieldName = 'ocenivaetsya_cherez'
    end
    object OrdersPerPeriodADODSadres_sektora: TIntegerField
      FieldName = 'adres_sektora'
    end
    object OrdersPerPeriodADODSkonechnyi_sektor_raboty: TIntegerField
      FieldName = 'konechnyi_sektor_raboty'
    end
    object OrdersPerPeriodADODSsektor_voditelya: TIntegerField
      FieldName = 'sektor_voditelya'
    end
    object OrdersPerPeriodADODSNomer_zakaza: TBCDField
      FieldName = 'Nomer_zakaza'
      Precision = 28
      Size = 10
    end
    object OrdersPerPeriodADODSAdres_okonchaniya_zayavki: TStringField
      FieldName = 'Adres_okonchaniya_zayavki'
      Size = 255
    end
    object OrdersPerPeriodADODSPozyvnoi_ustan: TIntegerField
      FieldName = 'Pozyvnoi_ustan'
    end
    object OrdersPerPeriodADODSData_pribytie: TDateTimeField
      FieldName = 'Data_pribytie'
    end
    object OrdersPerPeriodADODSNomer_skidki: TIntegerField
      FieldName = 'Nomer_skidki'
    end
    object OrdersPerPeriodADODSUstan_pribytie: TIntegerField
      FieldName = 'Ustan_pribytie'
    end
    object OrdersPerPeriodADODSPrimechanie: TStringField
      FieldName = 'Primechanie'
      Size = 255
    end
    object OrdersPerPeriodADODSSlugebnyi: TIntegerField
      FieldName = 'Slugebnyi'
    end
    object OrdersPerPeriodADODSotpravlyaetsya: TIntegerField
      FieldName = 'otpravlyaetsya'
    end
    object OrdersPerPeriodADODSOpr_s_obsh_linii: TIntegerField
      FieldName = 'Opr_s_obsh_linii'
    end
    object OrdersPerPeriodADODSData_na_tochke: TDateTimeField
      FieldName = 'Data_na_tochke'
    end
    object OrdersPerPeriodADODSREMOTE_SET: TIntegerField
      FieldName = 'REMOTE_SET'
    end
    object OrdersPerPeriodADODSREMOTE_INCOURSE: TIntegerField
      FieldName = 'REMOTE_INCOURSE'
    end
    object OrdersPerPeriodADODSREMOTE_ACCEPTED: TIntegerField
      FieldName = 'REMOTE_ACCEPTED'
    end
    object OrdersPerPeriodADODSREMOTE_DRNUM: TIntegerField
      FieldName = 'REMOTE_DRNUM'
    end
    object OrdersPerPeriodADODSDRIVER_SMS_SEND_STATE: TIntegerField
      FieldName = 'DRIVER_SMS_SEND_STATE'
    end
    object OrdersPerPeriodADODSCLIENT_SMS_SEND_STATE: TIntegerField
      FieldName = 'CLIENT_SMS_SEND_STATE'
    end
    object OrdersPerPeriodADODSSMS_SEND_DRNUM: TStringField
      FieldName = 'SMS_SEND_DRNUM'
      Size = 50
    end
    object OrdersPerPeriodADODSSMS_SEND_CLPHONE: TStringField
      FieldName = 'SMS_SEND_CLPHONE'
      Size = 50
    end
    object OrdersPerPeriodADODSPriority_counter: TIntegerField
      FieldName = 'Priority_counter'
    end
    object OrdersPerPeriodADODSIndivid_order: TIntegerField
      FieldName = 'Individ_order'
    end
    object OrdersPerPeriodADODSIndivid_sending: TIntegerField
      FieldName = 'Individ_sending'
    end
    object OrdersPerPeriodADODSSECTOR_ID: TIntegerField
      FieldName = 'SECTOR_ID'
    end
    object OrdersPerPeriodADODSREMOTE_SUMM: TBCDField
      FieldName = 'REMOTE_SUMM'
      Precision = 28
      Size = 10
    end
    object OrdersPerPeriodADODSREMOTE_SYNC: TIntegerField
      FieldName = 'REMOTE_SYNC'
    end
    object OrdersPerPeriodADODSLAST_STATUS_TIME: TDateTimeField
      FieldName = 'LAST_STATUS_TIME'
    end
    object OrdersPerPeriodADODSNO_TRANSMITTING: TIntegerField
      FieldName = 'NO_TRANSMITTING'
    end
    object OrdersPerPeriodADODSRESTORED: TSmallintField
      FieldName = 'RESTORED'
    end
    object OrdersPerPeriodADODSAUTO_ARHIVED: TSmallintField
      FieldName = 'AUTO_ARHIVED'
    end
    object OrdersPerPeriodADODSWAITING: TIntegerField
      FieldName = 'WAITING'
    end
    object OrdersPerPeriodADODSdirect_sect_id: TIntegerField
      FieldName = 'direct_sect_id'
    end
    object OrdersPerPeriodADODSfixed_time: TIntegerField
      FieldName = 'fixed_time'
    end
    object OrdersPerPeriodADODSfixed_summ: TBCDField
      FieldName = 'fixed_summ'
      Precision = 28
      Size = 10
    end
    object OrdersPerPeriodADODSon_place: TSmallintField
      FieldName = 'on_place'
    end
    object OrdersPerPeriodADODSdr_assign_date: TDateTimeField
      FieldName = 'dr_assign_date'
    end
    object OrdersPerPeriodADODStm_distance: TIntegerField
      FieldName = 'tm_distance'
    end
    object OrdersPerPeriodADODStm_summ: TBCDField
      FieldName = 'tm_summ'
      Precision = 28
      Size = 10
    end
    object OrdersPerPeriodADODSTARIFF_ID: TIntegerField
      FieldName = 'TARIFF_ID'
    end
    object OrdersPerPeriodADODSOPT_COMB: TLargeintField
      FieldName = 'OPT_COMB'
    end
    object OrdersPerPeriodADODSOPT_COMB_STR: TStringField
      FieldName = 'OPT_COMB_STR'
      Size = 255
    end
    object OrdersPerPeriodADODSPR_POLICY_ID: TIntegerField
      FieldName = 'PR_POLICY_ID'
    end
  end
  object AbPresOrdersADODS: TADODataSet
    Connection = ADOConnectDM.MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'select *  from Zakaz '#13#10'where Arhivnyi=0 '#13#10'and Konec_zakaza_data>' +
      '=:start_date '#13#10'and Konec_zakaza_data<=:end_date '#13#10'and Adres_okon' +
      'chaniya_zayavki=:ab_id and '#13#10'((Nomer_skidki>0) or (Nomer_skidki=' +
      '-100) or (Slugebnyi=1))'
    Parameters = <
      item
        Name = 'start_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'end_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'ab_id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 232
    Top = 248
  end
  object AbOrdersADODS: TADODataSet
    Connection = ADOConnectDM.MainADOConnection
    CursorType = ctStatic
    CommandText = 
      'select *, CAST(Konec_zakaza_data as date) as vremya_podachi  fro' +
      'm Zakaz '#13#10'where Arhivnyi=0 '#13#10'and Konec_zakaza_data>=:start_date ' +
      #13#10'and Konec_zakaza_data<=:end_date '#13#10'and Adres_okonchaniya_zayav' +
      'ki=:ab_id '
    Parameters = <
      item
        Name = 'start_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'end_date'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'ab_id'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 232
    Top = 200
  end
  object AbOrdRvDSConn: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = AbOrdersADODS
    Left = 232
    Top = 104
  end
  object AbPresOrdRvDSConn: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = AbPresOrdersADODS
    Left = 232
    Top = 152
  end
end
