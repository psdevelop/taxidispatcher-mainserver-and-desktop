object PrSettForm: TPrSettForm
  Left = 0
  Top = 0
  Width = 800
  Height = 450
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  Color = clBtnFace
  Constraints.MinHeight = 450
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 792
    Height = 423
    ActivePage = TabSheet19
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1047#1072#1088#1087#1083#1072#1090#1072
      object Label1: TLabel
        Left = 6
        Top = 12
        Width = 254
        Height = 16
        Caption = #1042#1077#1083#1080#1095#1080#1085#1072' '#1087#1088#1086#1094#1077#1085#1090#1072' '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1103' (0,01 -1%)'
      end
      object Label2: TLabel
        Left = 510
        Top = 204
        Width = 171
        Height = 16
        Caption = #1042#1088#1077#1084#1103' '#1074#1099#1073#1086#1088#1082#1080' '#1087#1086' '#1087#1086#1089#1083'. '#1076#1085#1102
      end
      object Label9: TLabel
        Left = 6
        Top = 204
        Width = 168
        Height = 16
        Caption = #1057#1084#1077#1085#1072' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1086#1074' (!!!'#1091#1090#1088#1086')'
      end
      object Label10: TLabel
        Left = 262
        Top = 204
        Width = 173
        Height = 16
        Caption = #1042#1088#1077#1084#1103' '#1074#1099#1073#1086#1088#1082#1080' '#1076#1083#1103' '#1087#1086#1076#1089#1095#1077#1090#1072
      end
      object Label31: TLabel
        Left = 6
        Top = 60
        Width = 220
        Height = 16
        Caption = #1060#1080#1082#1089'. '#1086#1090#1095#1080#1089#1083#1077#1085#1080#1077' '#1079#1072' '#1083#1102#1073#1091#1102' '#1087#1086#1077#1079#1076#1082#1091' '
      end
      object Label67: TLabel
        Left = 6
        Top = 108
        Width = 258
        Height = 16
        Caption = #1052#1072#1082#1089'. '#1094#1077#1085#1072' '#1079#1072#1082#1072#1079#1072' '#1073#1077#1079' '#1074#1099#1095#1077#1090#1072' % (0 - '#1074#1099#1082#1083')'
      end
      object Label68: TLabel
        Left = 6
        Top = 156
        Width = 269
        Height = 16
        Caption = #1060#1080#1082#1089'.'#1086#1090#1095#1080#1089#1083'.'#1087#1088#1080' '#1085#1072#1083#1080#1095'.'#1084#1072#1082#1089'.'#1094#1077#1085#1099' '#1073#1077#1079' '#1074#1099#1095'.%'
      end
      object BoldEdit1: TBoldEdit
        Left = 6
        Top = 32
        Width = 251
        Height = 22
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'procent_otchisleniya'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object BoldEdit2: TBoldEdit
        Left = 512
        Top = 224
        Width = 209
        Height = 22
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'cvet_nachavshihsya'
        BoldProperties.ApplyPolicy = bapChange
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        Enabled = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object BoldEdit9: TBoldEdit
        Left = 6
        Top = 224
        Width = 211
        Height = 22
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'vr_smeny_dispetcherov'
        BoldProperties.ApplyPolicy = bapChange
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        Enabled = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object BoldEdit10: TBoldEdit
        Left = 264
        Top = 224
        Width = 209
        Height = 22
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'cvet_prinyatyh'
        BoldProperties.ApplyPolicy = bapChange
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        Enabled = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object BoldEdit34: TBoldEdit
        Left = 6
        Top = 80
        Width = 251
        Height = 22
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'kolich_vyd_benzina'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object GroupBox1: TGroupBox
        Left = 288
        Top = 0
        Width = 433
        Height = 201
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1072#1074#1072#1085#1089#1086#1074#1086#1075#1086' '#1088#1072#1089#1095#1077#1090#1072
        TabOrder = 5
        object Label35: TLabel
          Left = 24
          Top = 16
          Width = 397
          Height = 16
          Caption = #1057#1091#1090#1086#1095#1085#1072#1103'  '#1087#1083#1072#1090#1072'  '#1086#1073#1097#1072#1103' (0='#1085#1077#1090' '#1086#1073#1097#1077#1075#1086', '#1090#1086#1083#1100#1082#1086' '#1080#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1077' )'
        end
        object Label36: TLabel
          Left = 24
          Top = 64
          Width = 246
          Height = 16
          Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086' '#1076#1086#1087#1091#1089#1090#1080#1084#1072#1103' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100
        end
        object Label41: TLabel
          Left = 24
          Top = 112
          Width = 142
          Height = 16
          Caption = #1057#1090#1086#1080#1084'. 1 '#1084#1080#1085'. '#1087#1086' '#1091#1084#1086#1083#1095'.'
        end
        object Label43: TLabel
          Left = 224
          Top = 112
          Width = 130
          Height = 16
          Caption = #1057#1090#1086#1080#1084'. 1 '#1082#1084' '#1087#1086' '#1091#1084#1086#1083#1095'.'
        end
        object DBEdit5: TDBEdit
          Left = 24
          Top = 80
          Width = 393
          Height = 22
          Ctl3D = False
          DataField = 'MIN_DEBET'
          DataSource = BoldModelDM.HasAllBonusDS
          ParentCtl3D = False
          TabOrder = 0
        end
        object BitBtn4: TBitBtn
          Left = 320
          Top = 160
          Width = 97
          Height = 33
          Action = BoldModelDM.DriversPrmDSP
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 1
        end
        object DBEdit9: TDBEdit
          Left = 24
          Top = 128
          Width = 169
          Height = 22
          Ctl3D = False
          DataField = 'ftime_tariff'
          DataSource = BoldModelDM.HasAllBonusDS
          ParentCtl3D = False
          TabOrder = 2
        end
        object DBEdit11: TDBEdit
          Left = 224
          Top = 128
          Width = 193
          Height = 22
          Ctl3D = False
          DataField = 'tmeter_tariff'
          DataSource = BoldModelDM.HasAllBonusDS
          ParentCtl3D = False
          TabOrder = 3
        end
        object DBEdit12: TDBEdit
          Left = 24
          Top = 32
          Width = 393
          Height = 22
          Ctl3D = False
          DataField = 'day_payment'
          DataSource = BoldModelDM.HasAllBonusDS
          ParentCtl3D = False
          TabOrder = 4
        end
        object DBCheckBox6: TDBCheckBox
          Left = 24
          Top = 160
          Width = 161
          Height = 17
          Caption = #1044#1080#1085'. '#1073#1072#1083#1072#1085#1089' '#1074#1086#1076#1080#1090#1077#1083#1077#1081
          DataField = 'use_dr_balance_counter'
          DataSource = BoldModelDM.HasAllBonusDS
          Enabled = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
      end
      object DBCheckBox9: TDBCheckBox
        Left = 8
        Top = 248
        Width = 697
        Height = 25
        Caption = 
          #1045#1078#1077#1076#1085'.+'#1092#1080#1082#1089'. '#1087#1083#1072#1090#1077#1078' '#1079#1072' '#1087#1086#1077#1079#1076#1082#1091' ('#1077#1089#1083#1080' '#1085#1077#1090' => '#1092#1080#1082#1089#1080#1088'. '#1085#1077' '#1074#1099#1095#1080#1090#1072#1077#1090#1089 +
          #1103', '#1077#1089#1083#1080' '#1077#1078#1077#1076#1085#1077#1074#1085#1099#1081' '#1074#1099#1095#1077#1090' > 0)'
        DataField = 'fix_order_pay_with_daily_pay'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object Panel8: TPanel
        Left = 0
        Top = 344
        Width = 784
        Height = 48
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 7
        object BitBtn1: TBitBtn
          Left = 560
          Top = 7
          Width = 217
          Height = 33
          Caption = #1054#1050
          TabOrder = 0
          OnClick = BitBtn1Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
        end
      end
      object DBEdit29: TDBEdit
        Left = 8
        Top = 128
        Width = 249
        Height = 22
        Ctl3D = False
        DataField = 'no_percent_before_summ'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 8
      end
      object DBEdit30: TDBEdit
        Left = 8
        Top = 176
        Width = 249
        Height = 22
        Ctl3D = False
        DataField = 'no_percent_before_payment'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 9
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1088#1086#1095#1080#1077
      ImageIndex = 1
      TabVisible = False
      object BoldCheckBox1: TBoldCheckBox
        Left = 16
        Top = 8
        Width = 433
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'zapros_nach_sektora'
        BoldProperties.ApplyPolicy = bapChange
        Caption = #1047#1072#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1089#1077#1082#1090#1086#1088
        ReadOnly = False
        TabOrder = 0
      end
      object BoldCheckBox2: TBoldCheckBox
        Left = 16
        Top = 40
        Width = 433
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'zapros_konech_sektora'
        BoldProperties.ApplyPolicy = bapChange
        Caption = #1047#1072#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1082#1086#1085#1077#1095#1085#1099#1081' '#1089#1077#1082#1090#1086#1088
        ReadOnly = False
        TabOrder = 1
      end
      object BoldCheckBox3: TBoldCheckBox
        Left = 16
        Top = 72
        Width = 490
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'avtozap_nach_sektora'
        BoldProperties.ApplyPolicy = bapChange
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1091#1089#1090#1072#1085#1072#1074#1083#1080#1074#1072#1090#1100' '#1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1089#1077#1082#1090#1086#1088' '
        ReadOnly = False
        TabOrder = 2
      end
      object BoldCheckBox4: TBoldCheckBox
        Left = 16
        Top = 138
        Width = 433
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'avtozap_konechn_sekt'
        BoldProperties.ApplyPolicy = bapChange
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1091#1089#1090#1072#1085#1072#1074#1083#1080#1074#1072#1090#1100' '#1082#1086#1085#1077#1095#1085#1099#1081' '#1089#1077#1082#1090#1086#1088
        Enabled = False
        ReadOnly = False
        TabOrder = 3
      end
      object BoldCheckBox8: TBoldCheckBox
        Left = 16
        Top = 245
        Width = 456
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'regim_dispetchera'
        BoldProperties.ApplyPolicy = bapChange
        Caption = #1055#1088#1086#1074#1077#1088#1103#1090#1100' '#1072#1082#1090#1080#1074#1085#1086#1089#1090#1100' '#1083#1080#1085#1080#1080' ('#1087#1086#1082#1072' '#1076#1083#1103' '#1089#1086#1090#1086#1074#1099#1093' '#1090#1077#1083#1077#1092#1086#1085#1086#1074')'
        ReadOnly = False
        TabOrder = 4
      end
      object BoldCheckBox9: TBoldCheckBox
        Left = 16
        Top = 209
        Width = 382
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'ne_uchit_zanyat_drug_disp'
        BoldProperties.ApplyPolicy = bapChange
        Caption = #1053#1077' '#1088#1072#1079#1088#1077#1096#1072#1090#1100' '#1084#1077#1085#1103#1090#1100' '#1086#1076#1085#1072#1078#1076#1099' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
        ReadOnly = False
        TabOrder = 5
      end
      object BoldCheckBox11: TBoldCheckBox
        Left = 16
        Top = 173
        Width = 578
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'schit_okon_posl_kon_sekt'
        BoldProperties.ApplyPolicy = bapChange
        Caption = 
          #1059#1076#1072#1083#1103#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1099#1077' '#1077#1089#1083#1080' '#1080#1093' '#1090#1077#1083#1077#1092#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1089#1086#1074#1087#1072#1076#1072#1077#1090' '#1089' '#1086#1076#1085#1080#1084' '#1080#1079 +
          ' '#1085#1077#1086#1082#1086#1085#1095#1077#1085#1085#1099#1093
        ReadOnly = False
        TabOrder = 6
      end
      object BoldCheckBox7: TBoldCheckBox
        Left = 16
        Top = 317
        Width = 726
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'naznach_iz_obsh__spiska'
        BoldProperties.ApplyPolicy = bapChange
        Caption = #1040#1074#1090#1086#1074#1099#1073#1086#1088' '#1080#1079' '#1086#1073#1097#1077#1075#1086' '#1089#1087#1080#1089#1082#1072
        ReadOnly = False
        TabOrder = 7
      end
      object BoldCheckBox12: TBoldCheckBox
        Left = 16
        Top = 104
        Width = 726
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'avtozapoln_sektorov'
        BoldProperties.ApplyPolicy = bapChange
        Caption = #1040#1074#1090#1086#1074#1099#1073#1086#1088' '#1074#1086#1076#1080#1090#1077#1083#1103' '#1076#1083#1103' '#1085#1072#1095#1072#1083#1100#1085#1086#1075#1086' '#1089#1077#1082#1090#1086#1088#1072
        ReadOnly = False
        TabOrder = 8
      end
      object BoldCheckBox13: TBoldCheckBox
        Left = 16
        Top = 352
        Width = 726
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'simv_avtom_ustan'
        BoldProperties.ApplyPolicy = bapChange
        Caption = #1057#1080#1084#1074#1086#1083#1100#1085#1086#1077' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1089#1077#1082#1090#1086#1088#1086#1074
        ReadOnly = False
        TabOrder = 9
      end
      object BoldCheckBox14: TBoldCheckBox
        Left = 16
        Top = 280
        Width = 456
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'vybratj_poslednie_nesk_dnei'
        BoldProperties.ApplyPolicy = bapChange
        Caption = #1047#1072#1087#1080#1089#1099#1074#1072#1090#1100' '#1088#1072#1079#1075#1086#1074#1086#1088#1099
        ReadOnly = False
        TabOrder = 10
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1055#1088#1080#1079#1099', '#1089#1082#1080#1076#1082#1080', '#1073#1086#1085#1091#1089#1099
      ImageIndex = 2
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 784
        Height = 392
        ActivePage = TabSheet10
        Align = alClient
        TabOrder = 0
        TabPosition = tpBottom
        object TabSheet9: TTabSheet
          Caption = #1054#1073#1097#1077#1087#1088#1080#1079#1086#1074#1072#1103' '#1089#1080#1089#1090#1077#1084#1072
          object Label29: TLabel
            Left = 8
            Top = 83
            Width = 139
            Height = 16
            Caption = #1062#1074#1077#1090' '#1086#1090#1076#1077#1083#1100#1085#1099#1093' '#1089#1082#1080#1076#1086#1082
          end
          object Label28: TLabel
            Left = 8
            Top = 51
            Width = 121
            Height = 16
            Caption = #1062#1074#1077#1090' '#1086#1073#1097#1077#1087#1088#1080#1079#1086#1074#1099#1093
          end
          object Label27: TLabel
            Left = 8
            Top = 16
            Width = 224
            Height = 16
            Caption = #1054#1073#1097#1077#1087#1088#1080#1079'. '#1095#1080#1089#1083#1086' '#1079#1072#1103#1074'. (0-'#1079#1072#1087#1088#1077#1090#1080#1090#1100')'
          end
          object BoldEdit33: TBoldEdit
            Left = 248
            Top = 77
            Width = 73
            Height = 19
            BoldHandle = BoldHandlesDM.blhDriversUnion
            BoldProperties.Expression = 'cvet_so_skidkoi'
            ReadOnly = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Alignment = taLeftJustify
            ButtonStyle = bbsNone
            Ctl3D = False
            MaxLength = 0
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnDblClick = BoldEdit33DblClick
          end
          object BoldEdit32: TBoldEdit
            Left = 248
            Top = 45
            Width = 73
            Height = 19
            BoldHandle = BoldHandlesDM.blhDriversUnion
            BoldProperties.Expression = 'cvet_obshepriz'
            ReadOnly = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Alignment = taLeftJustify
            ButtonStyle = bbsNone
            Ctl3D = False
            MaxLength = 0
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            OnDblClick = BoldEdit32DblClick
          end
          object BoldEdit31: TBoldEdit
            Left = 248
            Top = 13
            Width = 73
            Height = 19
            BoldHandle = BoldHandlesDM.blhDriversUnion
            BoldProperties.Expression = 'obshepriz_chislo'
            ReadOnly = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Alignment = taLeftJustify
            ButtonStyle = bbsNone
            Ctl3D = False
            MaxLength = 0
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
          end
        end
        object TabSheet10: TTabSheet
          Caption = #1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1072#1103' '#1086#1094#1077#1085#1082#1072
          ImageIndex = 1
          object Label8: TLabel
            Left = 408
            Top = 288
            Width = 84
            Height = 16
            Caption = #1057#1083#1072#1075#1072#1077#1084#1086#1077' (0)'
            Enabled = False
            Visible = False
          end
          object Label7: TLabel
            Left = 360
            Top = 288
            Width = 59
            Height = 16
            Caption = #1052#1085#1086#1078'. (1)'
            Enabled = False
            Visible = False
          end
          object Label6: TLabel
            Left = 40
            Top = 48
            Width = 135
            Height = 16
            Caption = #1055#1088#1080#1079'. '#1095#1080#1089#1083#1086'  '#1074#1099#1079#1086#1074#1086#1074'2'
          end
          object Label5: TLabel
            Left = 408
            Top = 272
            Width = 84
            Height = 16
            Caption = #1057#1083#1072#1075#1072#1077#1084#1086#1077' (0)'
            Enabled = False
            Visible = False
          end
          object Label4: TLabel
            Left = 360
            Top = 272
            Width = 59
            Height = 16
            Caption = #1052#1085#1086#1078'. (1)'
            Enabled = False
            Visible = False
          end
          object Label3: TLabel
            Left = 40
            Top = 8
            Width = 135
            Height = 16
            Caption = #1055#1088#1080#1079'. '#1095#1080#1089#1083#1086'  '#1074#1099#1079#1086#1074#1086#1074'1'
          end
          object Label32: TLabel
            Left = 40
            Top = 88
            Width = 135
            Height = 16
            Caption = #1055#1088#1080#1079'. '#1095#1080#1089#1083#1086'  '#1074#1099#1079#1086#1074#1086#1074'3'
          end
          object Label33: TLabel
            Left = 360
            Top = 304
            Width = 59
            Height = 16
            Caption = #1052#1085#1086#1078'. (1)'
            Enabled = False
            Visible = False
          end
          object Label34: TLabel
            Left = 408
            Top = 304
            Width = 84
            Height = 16
            Caption = #1057#1083#1072#1075#1072#1077#1084#1086#1077' (0)'
            Enabled = False
            Visible = False
          end
          object Label11: TLabel
            Left = 40
            Top = 128
            Width = 135
            Height = 16
            Caption = #1055#1088#1080#1079'. '#1095#1080#1089#1083#1086'  '#1074#1099#1079#1086#1074#1086#1074'4'
          end
          object Label69: TLabel
            Left = 264
            Top = 8
            Width = 215
            Height = 16
            Caption = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1089#1095#1077#1090' '#1089' '#1087#1088#1080#1079#1086#1074#1086#1081' '#1087#1086#1077#1079#1076#1082#1080
          end
          object Label70: TLabel
            Left = 264
            Top = 48
            Width = 202
            Height = 16
            Caption = #1051#1080#1084#1080#1090' '#1088#1077#1079#1077#1088#1074#1072' '#1087#1088#1080#1079#1086#1074#1099#1093' ('#1082#1086#1083'-'#1074#1086')'
          end
          object Label65: TLabel
            Left = 40
            Top = 192
            Width = 158
            Height = 16
            Caption = #1041#1086#1085#1091#1089#1099' '#1079#1072' '#1087#1077#1088#1074#1091#1102' '#1087#1086#1077#1079#1076#1082#1091
          end
          object Label66: TLabel
            Left = 40
            Top = 240
            Width = 177
            Height = 16
            Caption = #1052#1080#1085'. '#1089#1091#1084#1084#1072' %'#1073#1086#1085#1091#1089#1072' (0 '#1074#1099#1082#1083')'
          end
          object Label71: TLabel
            Left = 264
            Top = 192
            Width = 197
            Height = 16
            Caption = #1041#1086#1085#1091#1089#1099' '#1079#1072' '#1087#1086#1089#1083#1077#1076#1091#1102#1097#1080#1077' '#1087#1086#1077#1079#1076#1082#1080
          end
          object Label72: TLabel
            Left = 264
            Top = 240
            Width = 191
            Height = 16
            Caption = #1042#1077#1083#1080#1095#1080#1085#1072' % '#1073#1086#1085#1091#1089#1072' (0,1 = 10%)'
          end
          object BoldEdit8: TBoldEdit
            Left = 432
            Top = 288
            Width = 17
            Height = 19
            BoldHandle = BoldHandlesDM.blhDriversUnion
            BoldProperties.Expression = 'velichina_priz_sbavki_2'
            ReadOnly = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Alignment = taLeftJustify
            ButtonStyle = bbsNone
            Ctl3D = False
            Enabled = False
            MaxLength = 0
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            Visible = False
          end
          object BoldEdit7: TBoldEdit
            Left = 384
            Top = 288
            Width = 17
            Height = 19
            BoldHandle = BoldHandlesDM.blhDriversUnion
            BoldProperties.Expression = 'koeff_prizov_sbavki_2'
            ReadOnly = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Alignment = taLeftJustify
            ButtonStyle = bbsNone
            Ctl3D = False
            Enabled = False
            MaxLength = 0
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            Visible = False
          end
          object BoldCheckBox6: TBoldCheckBox
            Left = 8
            Top = 70
            Width = 25
            Height = 17
            BoldHandle = BoldHandlesDM.blhDriversUnion
            BoldProperties.Expression = 'ispoljz_priz_2'
            BoldProperties.ApplyPolicy = bapChange
            ReadOnly = False
            TabOrder = 2
          end
          object BoldEdit5: TBoldEdit
            Left = 432
            Top = 272
            Width = 17
            Height = 19
            BoldHandle = BoldHandlesDM.blhDriversUnion
            BoldProperties.Expression = 'velichina_priz_sbavki_1'
            ReadOnly = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Alignment = taLeftJustify
            ButtonStyle = bbsNone
            Ctl3D = False
            Enabled = False
            MaxLength = 0
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
            Visible = False
          end
          object BoldEdit4: TBoldEdit
            Left = 384
            Top = 272
            Width = 17
            Height = 19
            BoldHandle = BoldHandlesDM.blhDriversUnion
            BoldProperties.Expression = 'koeff_prizov_sbavki_1'
            ReadOnly = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Alignment = taLeftJustify
            ButtonStyle = bbsNone
            Ctl3D = False
            Enabled = False
            MaxLength = 0
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 4
            Visible = False
          end
          object BoldCheckBox5: TBoldCheckBox
            Left = 8
            Top = 30
            Width = 25
            Height = 17
            BoldHandle = BoldHandlesDM.blhDriversUnion
            BoldProperties.Expression = 'ispoljz_priz_1'
            BoldProperties.ApplyPolicy = bapChange
            ReadOnly = False
            TabOrder = 5
          end
          object BoldEdit36: TBoldEdit
            Left = 384
            Top = 304
            Width = 17
            Height = 19
            BoldHandle = BoldHandlesDM.blhDriversUnion
            BoldProperties.Expression = 'koeff_prizov_sbavki_3'
            ReadOnly = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Alignment = taLeftJustify
            ButtonStyle = bbsNone
            Ctl3D = False
            Enabled = False
            MaxLength = 0
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 6
            Visible = False
          end
          object BoldEdit37: TBoldEdit
            Left = 432
            Top = 304
            Width = 17
            Height = 19
            BoldHandle = BoldHandlesDM.blhDriversUnion
            BoldProperties.Expression = 'velichina_priz_sbavki_3'
            ReadOnly = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Alignment = taLeftJustify
            ButtonStyle = bbsNone
            Ctl3D = False
            Enabled = False
            MaxLength = 0
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 7
            Visible = False
          end
          object DBEdit3: TDBEdit
            Left = 40
            Top = 144
            Width = 209
            Height = 22
            BiDiMode = bdLeftToRight
            Ctl3D = False
            DataField = 'Prizovoe_kolichestvo_4'
            DataSource = BoldModelDM.HasAllBonusDS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 8
          end
          object BitBtn5: TBitBtn
            Left = 24
            Top = 296
            Width = 241
            Height = 33
            Action = BoldModelDM.DriversPrmDSP
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            TabOrder = 9
          end
          object DBCheckBox1: TDBCheckBox
            Left = 496
            Top = 16
            Width = 249
            Height = 17
            Caption = #1057#1095#1080#1090#1072#1090#1100' '#1087#1088#1080#1079#1099' '#1087#1086' '#1085#1086#1084#1077#1088#1091' '#1090#1077#1083#1077#1092#1086#1085#1072
            DataField = 'view_bonuses'
            DataSource = BoldModelDM.HasAllBonusDS
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 496
            Top = 40
            Width = 217
            Height = 17
            Caption = #1057#1095#1080#1090#1072#1090#1100' '#1087#1088#1080#1079#1099' '#1087#1086' '#1072#1073'. '#1085#1086#1084#1077#1088#1072#1084
            DataField = 'view_ab_bonuses'
            DataSource = BoldModelDM.HasAllBonusDS
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 496
            Top = 64
            Width = 217
            Height = 17
            Caption = #1042#1077#1089#1090#1080' '#1091#1095'. '#1087#1086' '#1072#1073'. '#1085#1086#1084#1077#1088#1072#1084
            DataField = 'use_ab_account'
            DataSource = BoldModelDM.HasAllBonusDS
            TabOrder = 12
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox4: TDBCheckBox
            Left = 8
            Top = 144
            Width = 25
            Height = 17
            DataField = 'use_bonus4'
            DataSource = BoldModelDM.HasAllBonusDS
            TabOrder = 13
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox5: TDBCheckBox
            Left = 8
            Top = 104
            Width = 25
            Height = 17
            DataField = 'use_bonus3'
            DataSource = BoldModelDM.HasAllBonusDS
            TabOrder = 14
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit32: TDBEdit
            Left = 264
            Top = 24
            Width = 217
            Height = 22
            Ctl3D = False
            DataField = 'prize_reward_summ'
            DataSource = BoldModelDM.HasAllBonusDS
            ParentCtl3D = False
            TabOrder = 15
          end
          object DBEdit31: TDBEdit
            Left = 40
            Top = 104
            Width = 209
            Height = 22
            BiDiMode = bdLeftToRight
            Ctl3D = False
            DataField = 'Prizovoe_kolichestvo_3'
            DataSource = BoldModelDM.HasAllBonusDS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 16
          end
          object DBEdit33: TDBEdit
            Left = 40
            Top = 64
            Width = 209
            Height = 22
            BiDiMode = bdLeftToRight
            Ctl3D = False
            DataField = 'Prizovoe_kolichestvo_2'
            DataSource = BoldModelDM.HasAllBonusDS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 17
          end
          object DBEdit34: TDBEdit
            Left = 40
            Top = 24
            Width = 209
            Height = 22
            BiDiMode = bdLeftToRight
            Ctl3D = False
            DataField = 'Prizovoe_kolichestvo_1'
            DataSource = BoldModelDM.HasAllBonusDS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 18
          end
          object DBEdit35: TDBEdit
            Left = 264
            Top = 64
            Width = 217
            Height = 22
            Ctl3D = False
            DataField = 'prize_reserved_limit'
            DataSource = BoldModelDM.HasAllBonusDS
            ParentCtl3D = False
            TabOrder = 19
          end
          object DBEdit36: TDBEdit
            Left = 40
            Top = 208
            Width = 209
            Height = 22
            Ctl3D = False
            DataField = 'first_trip_bonus'
            DataSource = BoldModelDM.HasAllBonusDS
            ParentCtl3D = False
            TabOrder = 20
          end
          object DBEdit37: TDBEdit
            Left = 264
            Top = 208
            Width = 225
            Height = 22
            Ctl3D = False
            DataField = 'trip_bonus'
            DataSource = BoldModelDM.HasAllBonusDS
            ParentCtl3D = False
            TabOrder = 21
          end
          object DBEdit38: TDBEdit
            Left = 40
            Top = 256
            Width = 209
            Height = 22
            Ctl3D = False
            DataField = 'percent_bonus_min_summ'
            DataSource = BoldModelDM.HasAllBonusDS
            ParentCtl3D = False
            TabOrder = 22
          end
          object DBEdit39: TDBEdit
            Left = 264
            Top = 256
            Width = 225
            Height = 22
            Ctl3D = False
            DataField = 'bonus_percent'
            DataSource = BoldModelDM.HasAllBonusDS
            ParentCtl3D = False
            TabOrder = 23
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1099
      ImageIndex = 3
      object Label12: TLabel
        Left = 256
        Top = 8
        Width = 136
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1077#1078'. '#1075#1088#1091#1087#1087
      end
      object Label13: TLabel
        Left = 256
        Top = 56
        Width = 127
        Height = 16
        Caption = #1058#1077#1082#1091#1097#1072#1103' '#1076#1077#1078'. '#1075#1088#1091#1087#1087#1072
      end
      object Label14: TLabel
        Left = 16
        Top = 8
        Width = 182
        Height = 16
        Caption = #1042#1088#1077#1084#1103' '#1086#1073#1085#1091#1083'. '#1086#1073#1099#1095#1085'. '#1074#1086#1076#1080#1090#1077#1083#1103
      end
      object Label15: TLabel
        Left = 16
        Top = 56
        Width = 204
        Height = 16
        Caption = #1042#1088#1077#1084#1103' '#1086#1073#1085#1091#1083'. '#1076#1077#1078#1091#1088#1085#1086#1075#1086' '#1074#1086#1076#1080#1090#1077#1083#1103
      end
      object Label16: TLabel
        Left = 16
        Top = 104
        Width = 164
        Height = 16
        Caption = #1057#1091#1090#1082#1080' '#1090#1077#1082#1091#1097#1077#1081' '#1076#1077#1078'. '#1075#1088#1091#1087#1087#1099
      end
      object Label17: TLabel
        Left = 16
        Top = 152
        Width = 145
        Height = 16
        Caption = #1042#1088#1077#1084#1103' '#1089#1084#1077#1085#1099' '#1076#1077#1078'. '#1075#1088#1091#1087#1087
      end
      object BoldEdit12: TBoldEdit
        Left = 16
        Top = 24
        Width = 193
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'per_obnovl_obychn_vod'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object BoldEdit13: TBoldEdit
        Left = 16
        Top = 72
        Width = 193
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'per_obnovl_deg'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object BoldEdit14: TBoldEdit
        Left = 16
        Top = 120
        Width = 193
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'sutki_deg_gruppy'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Color = clInfoBk
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object BoldEdit15: TBoldEdit
        Left = 16
        Top = 168
        Width = 193
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'vr_smeny_deg_grupp'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object BoldEdit16: TBoldEdit
        Left = 256
        Top = 24
        Width = 193
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'kolich_deg_grupp'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
      end
      object BoldEdit17: TBoldEdit
        Left = 256
        Top = 72
        Width = 193
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'tek_deg_gruppa'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1054#1073#1097#1080#1077
      ImageIndex = 4
      object Label18: TLabel
        Left = 6
        Top = 4
        Width = 164
        Height = 16
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      end
      object Label54: TLabel
        Left = 8
        Top = 24
        Width = 497
        Height = 16
        Caption = 
          #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1074#1086#1076#1080#1090#1077#1083#1100#1089#1082#1080#1093' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1081' ('#1086#1095#1077#1085#1100' '#1072#1082#1082#1091#1088#1072#1090#1085#1086', '#1083#1091#1095#1096#1077' ' +
          #1085#1077' '#1090#1088#1086#1075#1072#1081#1090#1077')'
        Visible = False
      end
      object Label61: TLabel
        Left = 184
        Top = 176
        Width = 214
        Height = 16
        Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090' '#1087#1086#1080#1089#1082#1072' '#1087#1086' '#1050#1051#1040#1044#1056
      end
      object Label37: TLabel
        Left = 288
        Top = 232
        Width = 259
        Height = 16
        Caption = #1042#1088#1077#1084#1103' '#1086#1078#1080#1076#1072#1085#1080#1103' '#1087#1077#1088#1077#1076' '#1072#1074#1090#1086#1088#1072#1089#1089#1099#1083#1086#1084' ('#1089#1077#1082')'
      end
      object Label58: TLabel
        Left = 288
        Top = 280
        Width = 260
        Height = 16
        Caption = #1042#1088'. '#1086#1078#1080#1076#1072#1085#1080#1103' '#1087#1077#1088#1077#1076' '#1072#1074#1090#1086#1088#1072#1089#1089'. '#1086#1085#1083#1072#1081#1085' ('#1089#1077#1082')'
      end
      object Label100: TLabel
        Left = 8
        Top = 304
        Width = 182
        Height = 16
        Caption = #1041#1077#1089#1087#1083#1072#1090#1085#1086#1077' '#1074#1088'. '#1087#1086#1077#1079#1076#1082#1080' ('#1084#1080#1085'.)'
      end
      object Label101: TLabel
        Left = 320
        Top = 304
        Width = 217
        Height = 16
        Caption = #1041#1077#1089#1087#1083#1072#1090#1085#1086#1077' '#1088#1072#1089#1089#1090#1086#1103#1085#1080#1077' '#1087#1086#1077#1079#1076#1082#1080' ('#1084'.)'
      end
      object BoldEdit18: TBoldEdit
        Left = 8
        Top = 20
        Width = 761
        Height = 22
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'namen_organizacii'
        BoldProperties.ApplyPolicy = bapChange
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object DBEdit23: TDBEdit
        Left = 8
        Top = 16
        Width = 761
        Height = 22
        Ctl3D = False
        DataField = 'addit_rem_params'
        DataSource = BoldModelDM.HasAllBonusDS
        Enabled = False
        ParentCtl3D = False
        TabOrder = 1
        Visible = False
      end
      object BitBtn10: TBitBtn
        Left = 16
        Top = 344
        Width = 241
        Height = 33
        Action = BoldModelDM.DriversPrmDSP
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 2
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 408
        Top = 168
        Width = 217
        Height = 24
        DataField = 'kladr_object_code'
        DataSource = BoldModelDM.HasAllBonusDS
        DropDownRows = 30
        DropDownWidth = 350
        KeyField = #1057#1090#1086#1083#1073#1077#1094' 2'
        ListField = #1057#1090#1086#1083#1073#1077#1094' 0'
        ListSource = BoldModelDM.KLADRCITYDS
        TabOrder = 3
      end
      object BitBtn11: TBitBtn
        Left = 632
        Top = 168
        Width = 33
        Height = 25
        Caption = '>>'
        TabOrder = 4
        OnClick = BitBtn11Click
      end
      object DBCheckBox7: TDBCheckBox
        Left = 368
        Top = 120
        Width = 209
        Height = 17
        Caption = #1055#1077#1088#1077#1085#1072#1079#1085'. '#1090#1072#1088'. '#1087#1086' '#1074#1086#1076#1080#1090#1077#1083#1102
        DataField = 'overtar_by_driver'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox8: TDBCheckBox
        Left = 8
        Top = 120
        Width = 177
        Height = 17
        Caption = #1042#1099#1089#1090'. '#1090#1072#1088'. '#1087#1086' '#1074#1086#1076#1080#1090#1077#1083#1102
        DataField = 'autotarif_by_driver'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox10: TDBCheckBox
        Left = 368
        Top = 144
        Width = 313
        Height = 17
        Caption = #1057#1086#1086#1073#1097'. '#1082#1083#1080#1077#1085#1090#1091' '#1087#1086' '#1085#1072#1078#1072#1090#1080#1102' '#1053#1072' '#1090#1086#1095#1082#1077
        DataField = 'clsms_onplaceto'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox11: TDBCheckBox
        Left = 8
        Top = 144
        Width = 353
        Height = 17
        Caption = #1057#1086#1086#1073#1097'. '#1082#1083#1080#1077#1085#1090#1091' '#1087#1086' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1102' '#1079#1072#1082#1072#1079#1072' '#1074#1086#1076#1080#1090#1077#1083#1077#1084
        DataField = 'clsms_ordground'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox12: TDBCheckBox
        Left = 8
        Top = 176
        Width = 153
        Height = 17
        Caption = #1048#1089#1082#1072#1090#1100' '#1087#1086' '#1050#1051#1040#1044#1056
        DataField = 'use_kladr'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 9
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox13: TDBCheckBox
        Left = 184
        Top = 120
        Width = 169
        Height = 17
        Caption = #1042#1099#1089#1090'. '#1090#1072#1088#1080#1092#1072' '#1087#1086' '#1087#1083#1072#1085#1091
        DataField = 'autotarif_by_tplan'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 10
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox14: TDBCheckBox
        Left = 8
        Top = 208
        Width = 713
        Height = 17
        Caption = #1053#1077' '#1089#1073#1088#1072#1089#1099#1074#1072#1090#1100' '#1074#1088#1077#1084#1103' '#1087#1088#1086#1089#1090#1086#1103'  '#1074#1086#1076#1080#1090#1077#1083#1103' '#1087#1088#1080' '#1087#1077#1088#1077#1085#1086#1089#1077' '#1085#1072' '#1089#1077#1082#1090#1086#1088
        DataField = 'dont_reset_dr_queue'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 11
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit1: TDBEdit
        Left = 552
        Top = 224
        Width = 113
        Height = 22
        Ctl3D = False
        DataField = 'auto_bsector_longtime'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 12
      end
      object DBCheckBox15: TDBCheckBox
        Left = 8
        Top = 232
        Width = 265
        Height = 17
        Caption = #1040#1074#1090#1086#1088#1072#1089#1089#1099#1083' '#1074' '#1072#1091#1082#1094#1080#1086#1085' '#1087#1088#1080' '#1085#1077#1086#1073#1088#1072#1073#1086#1090#1082#1077
        DataField = 'auto_bsector_longorders'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 13
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox16: TDBCheckBox
        Left = 8
        Top = 256
        Width = 393
        Height = 17
        Caption = #1054#1090#1089#1099#1083#1072#1090#1100' '#1057#1052#1057' '#1076#1083#1103' '#1086#1092#1092#1083#1072#1081#1085'-'#1079#1072#1103#1074#1082#1080' ('#1076#1086#1073#1072#1074#1083#1103#1077#1090#1089#1103' '#1095#1077#1088#1077#1079' F3)'
        DataField = 'clsms_offlinedr_assign'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 14
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox23: TDBCheckBox
        Left = 8
        Top = 280
        Width = 265
        Height = 17
        Caption = #1040#1074#1090#1086#1088#1072#1089#1089#1099#1083' '#1086#1085#1083#1072#1081#1085' '#1074' '#1072#1091#1082#1094#1080#1086#1085' '#1087#1088#1080' '#1085#1077#1086#1073#1088'.'
        DataField = 'auto_bsector_onlineorders'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 15
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit25: TDBEdit
        Left = 552
        Top = 272
        Width = 113
        Height = 22
        Ctl3D = False
        DataField = 'auto_bsector_onlinetime'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 16
      end
      object DBCheckBox39: TDBCheckBox
        Left = 368
        Top = 48
        Width = 297
        Height = 17
        Caption = #1055#1086#1082#1072#1079'. '#1072#1091#1082#1094#1080#1086#1085' '#1089' '#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077#1084' '#1087#1086'  '#1089#1077#1082#1090#1086#1088#1072#1084
        DataField = 'wait_dlg_with_sectors'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 17
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox40: TDBCheckBox
        Left = 368
        Top = 72
        Width = 321
        Height = 17
        Caption = #1055#1086#1082#1072#1079'. '#1072#1091#1082#1094#1086#1080#1085' '#1090#1086#1083#1100#1082#1086' '#1089#1074#1086#1077#1075#1086' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1089#1077#1082#1090#1086#1088#1072
        DataField = 'hide_other_sect_wait_orders'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 18
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox41: TDBCheckBox
        Left = 8
        Top = 96
        Width = 361
        Height = 17
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1072#1091#1082#1094#1080#1086#1085' '#1074#1089#1077#1093' '#1089#1077#1082#1090#1086#1088#1086#1074' '#1087#1088#1080' '#1088#1091#1095#1085#1086#1084' '#1086#1090#1082#1088#1099#1090#1080#1080
        DataField = 'show_all_sectwait_manual'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 19
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox42: TDBCheckBox
        Left = 8
        Top = 48
        Width = 329
        Height = 17
        Caption = #1053#1077' '#1087#1086#1082#1072#1079'. '#1072#1091#1082#1094#1080#1086#1085' '#1076#1088#1091#1075#1080#1093' '#1092#1080#1088#1084' ('#1087#1086' '#1088#1072#1081#1086#1085#1091' '#1079#1072#1082#1072#1079#1072')'
        DataField = 'dnts_wait_oth_company'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 20
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox43: TDBCheckBox
        Left = 8
        Top = 72
        Width = 329
        Height = 17
        Caption = #1053#1077' '#1087#1086#1082#1072#1079'. '#1072#1091#1082#1094'. '#1073#1077#1079' '#1092#1080#1088#1084#1099' ('#1087#1086' '#1088#1072#1081#1086#1085#1091' '#1079#1072#1082#1072#1079#1072')'
        DataField = 'dnts_wait_wtout_company'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 21
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit66: TDBEdit
        Left = 200
        Top = 304
        Width = 113
        Height = 22
        Ctl3D = False
        DataField = 'start_free_time'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 22
      end
      object DBEdit67: TDBEdit
        Left = 552
        Top = 304
        Width = 113
        Height = 22
        Ctl3D = False
        DataField = 'start_free_distance'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 23
      end
    end
    object TabSheet6: TTabSheet
      Caption = #1055#1091#1090#1077#1074#1086#1081' '#1083#1080#1089#1090
      ImageIndex = 5
      object Label19: TLabel
        Left = 6
        Top = 12
        Width = 89
        Height = 16
        Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' 1'
      end
      object Label20: TLabel
        Left = 6
        Top = 60
        Width = 89
        Height = 16
        Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' 2'
      end
      object Label21: TLabel
        Left = 6
        Top = 108
        Width = 89
        Height = 16
        Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077' 3'
      end
      object Label22: TLabel
        Left = 6
        Top = 156
        Width = 127
        Height = 16
        Caption = #1047#1072#1084#1077#1095#1072#1085#1080#1103' '#1087#1086' '#1088#1072#1073#1086#1090#1077
      end
      object BoldEdit19: TBoldEdit
        Left = 6
        Top = 32
        Width = 211
        Height = 22
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'napravlenie_1'
        BoldProperties.ApplyPolicy = bapChange
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object BoldEdit20: TBoldEdit
        Left = 6
        Top = 80
        Width = 211
        Height = 22
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'napravlenie_2'
        BoldProperties.ApplyPolicy = bapChange
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object BoldEdit21: TBoldEdit
        Left = 6
        Top = 128
        Width = 211
        Height = 22
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'napravlenie_3'
        BoldProperties.ApplyPolicy = bapChange
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object BoldEdit22: TBoldEdit
        Left = 6
        Top = 176
        Width = 603
        Height = 22
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'komment_k_rabote'
        BoldProperties.ApplyPolicy = bapChange
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object TabSheet7: TTabSheet
      Caption = #1069#1092#1092#1077#1082#1090#1080#1074#1085#1086#1089#1090#1100
      ImageIndex = 6
      object Label23: TLabel
        Left = 408
        Top = 8
        Width = 115
        Height = 16
        Caption = #1042#1088'. '#1087#1086#1076#1072#1095#1072' - '#1086#1082#1086#1085#1095'.'
        Enabled = False
      end
      object Label24: TLabel
        Left = 216
        Top = 8
        Width = 118
        Height = 16
        Caption = #1042#1088'. '#1085#1072#1079#1085#1072#1095' - '#1087#1086#1076#1072#1095#1072
        Enabled = False
      end
      object Label25: TLabel
        Left = 16
        Top = 8
        Width = 130
        Height = 16
        Caption = #1042#1088'. '#1087#1086#1089#1090#1091#1087#1083'. - '#1085#1072#1079#1085#1072#1095'.'
        Enabled = False
      end
      object SpeedButton1: TSpeedButton
        Left = 144
        Top = 24
        Width = 23
        Height = 22
        Caption = '...'
        Enabled = False
      end
      object SpeedButton2: TSpeedButton
        Left = 336
        Top = 24
        Width = 23
        Height = 22
        Caption = '...'
        Enabled = False
      end
      object SpeedButton3: TSpeedButton
        Left = 528
        Top = 24
        Width = 23
        Height = 22
        Caption = '...'
        Enabled = False
      end
      object SpeedButton4: TSpeedButton
        Left = 712
        Top = 24
        Width = 23
        Height = 22
        Caption = '...'
        Enabled = False
      end
      object Label26: TLabel
        Left = 600
        Top = 8
        Width = 118
        Height = 16
        Caption = #1042#1088'. '#1085#1072#1079#1085#1072#1095'. - '#1086#1082#1086#1085#1095'.'
        Enabled = False
      end
      object Label73: TLabel
        Left = 16
        Top = 56
        Width = 191
        Height = 16
        Caption = #1064#1090#1088#1072#1092' '#1079#1072' '#1086#1087#1086#1079#1076'. '#1085#1072' '#1079#1072#1082'. ('#1088#1077#1081#1090'.)'
      end
      object Label74: TLabel
        Left = 16
        Top = 136
        Width = 189
        Height = 16
        Caption = #1064#1090#1088#1072#1092' '#1086#1090#1082#1072#1079#1072' '#1086#1090' '#1079#1072#1082'. ('#1088#1077#1081#1090#1080#1085#1075')'
      end
      object Label75: TLabel
        Left = 16
        Top = 216
        Width = 184
        Height = 16
        Caption = #1064#1090#1088#1072#1092' '#1086#1090#1082#1072#1079#1072' '#1086#1090' '#1079#1072#1082'. ('#1073#1072#1083#1072#1085#1089')'
      end
      object Label76: TLabel
        Left = 216
        Top = 56
        Width = 177
        Height = 16
        Caption = #1056#1077#1092#1077#1072#1083#1100#1085'. '#1073#1086#1085#1091#1089' ('#1088#1077#1081#1090',1 '#1074#1086#1076')'
      end
      object Label77: TLabel
        Left = 216
        Top = 136
        Width = 171
        Height = 16
        Caption = #1044#1083#1080#1090'. '#1088#1077#1092#1077#1088'. '#1073#1086#1085#1091#1089#1072' ('#1095#1072#1089#1086#1074')'
      end
      object Label78: TLabel
        Left = 16
        Top = 96
        Width = 171
        Height = 16
        Caption = #1044#1083#1080#1090'. '#1096#1090#1088'. '#1079#1072' '#1086#1087#1086#1079#1076'. ('#1084#1080#1085#1091#1090')'
      end
      object Label79: TLabel
        Left = 16
        Top = 176
        Width = 165
        Height = 16
        Caption = #1044#1083#1080#1090'. '#1096#1090#1088'. '#1079#1072' '#1086#1090#1082#1072#1079' ('#1084#1080#1085#1091#1090')'
      end
      object Label80: TLabel
        Left = 216
        Top = 176
        Width = 162
        Height = 16
        Caption = #1041#1086#1085#1091#1089' '#1088#1077#1081#1090'. '#1086#1073#1099#1095#1085#1099#1081' '#1079#1072#1082#1072#1079
      end
      object Label81: TLabel
        Left = 216
        Top = 216
        Width = 170
        Height = 16
        Caption = #1042#1088'. '#1073#1086#1085#1091#1089#1072' '#1086#1073#1099#1095#1085'. '#1079#1072#1082'. ('#1084#1080#1085')'
      end
      object Label82: TLabel
        Left = 16
        Top = 256
        Width = 187
        Height = 16
        Caption = #1042#1088'. '#1092#1080#1082#1089#1072#1094#1080#1080' '#1087#1086#1074#1080#1089#1096'. '#1079#1072#1082'.('#1089#1077#1082')'
      end
      object Label83: TLabel
        Left = 216
        Top = 256
        Width = 167
        Height = 16
        Caption = #1041#1086#1085#1091#1089' '#1088#1077#1081#1090'. '#1087#1086#1074#1080#1089#1096#1080#1081' '#1079#1072#1082#1072#1079
      end
      object Label84: TLabel
        Left = 216
        Top = 296
        Width = 177
        Height = 16
        Caption = #1042#1088'. '#1073#1086#1085#1091#1089#1072' '#1087#1086#1074#1080#1089#1096'. '#1079#1072#1082'. ('#1084#1080#1085')'
      end
      object Label85: TLabel
        Left = 216
        Top = 96
        Width = 162
        Height = 16
        Caption = #1056#1077#1092#1077#1088#1072#1083#1100#1085'. '#1082#1077#1096#1073#1101#1082' (1 '#1074#1086#1076')'
      end
      object Label86: TLabel
        Left = 408
        Top = 56
        Width = 132
        Height = 16
        Caption = #1063#1072#1089'-'#1087#1080#1082'1 '#1085#1072#1095#1072#1083#1086' '#1093#1093':'#1093#1093
      end
      object Label87: TLabel
        Left = 408
        Top = 96
        Width = 174
        Height = 16
        Caption = #1063#1072#1089'-'#1087#1080#1082'1 '#1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' ('#1084#1080#1085')'
      end
      object Label88: TLabel
        Left = 408
        Top = 136
        Width = 140
        Height = 16
        Caption = #1063#1072#1089'-'#1087#1080#1082'1 '#1073#1086#1085#1091#1089' '#1088#1077#1081#1090#1080#1085#1075
      end
      object Label89: TLabel
        Left = 408
        Top = 176
        Width = 165
        Height = 16
        Caption = #1063#1087'1 '#1073#1086#1085#1091#1089' '#1074#1088'. '#1076#1077#1081#1089#1090#1074'. ('#1084#1080#1085')'
      end
      object Label90: TLabel
        Left = 408
        Top = 216
        Width = 132
        Height = 16
        Caption = #1063#1072#1089'-'#1087#1080#1082'2 '#1085#1072#1095#1072#1083#1086' '#1093#1093':'#1093#1093
      end
      object Label91: TLabel
        Left = 408
        Top = 256
        Width = 174
        Height = 16
        Caption = #1063#1072#1089'-'#1087#1080#1082'2 '#1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' ('#1084#1080#1085')'
      end
      object Label92: TLabel
        Left = 408
        Top = 296
        Width = 140
        Height = 16
        Caption = #1063#1072#1089'-'#1087#1080#1082'2 '#1073#1086#1085#1091#1089' '#1088#1077#1081#1090#1080#1085#1075
      end
      object Label93: TLabel
        Left = 600
        Top = 56
        Width = 165
        Height = 16
        Caption = #1063#1087'2 '#1073#1086#1085#1091#1089' '#1074#1088'. '#1076#1077#1081#1089#1090#1074'. ('#1084#1080#1085')'
      end
      object Label94: TLabel
        Left = 600
        Top = 96
        Width = 132
        Height = 16
        Caption = #1063#1072#1089'-'#1087#1080#1082'3 '#1085#1072#1095#1072#1083#1086' '#1093#1093':'#1093#1093
      end
      object Label95: TLabel
        Left = 600
        Top = 136
        Width = 174
        Height = 16
        Caption = #1063#1072#1089'-'#1087#1080#1082'3 '#1076#1083#1080#1090#1077#1083#1100#1085#1086#1089#1090#1100' ('#1084#1080#1085')'
      end
      object Label96: TLabel
        Left = 600
        Top = 176
        Width = 140
        Height = 16
        Caption = #1063#1072#1089'-'#1087#1080#1082'3 '#1073#1086#1085#1091#1089' '#1088#1077#1081#1090#1080#1085#1075
      end
      object Label97: TLabel
        Left = 600
        Top = 216
        Width = 165
        Height = 16
        Caption = #1063#1087'3 '#1073#1086#1085#1091#1089' '#1074#1088'. '#1076#1077#1081#1089#1090#1074'. ('#1084#1080#1085')'
      end
      object Label98: TLabel
        Left = 616
        Top = 288
        Width = 70
        Height = 16
        Caption = #1087#1086' '#1088#1077#1081#1090#1080#1085#1075#1091
      end
      object BoldEdit23: TBoldEdit
        Left = 408
        Top = 24
        Width = 121
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'betweenOnEnd.formatDateTime('#39'hh:mm:ss'#39')'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        Enabled = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object BoldEdit24: TBoldEdit
        Left = 216
        Top = 24
        Width = 121
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'betweenSetOn.formatDateTime('#39'hh:mm:ss'#39')'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        Enabled = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object BoldEdit25: TBoldEdit
        Left = 16
        Top = 24
        Width = 129
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'betweenStartSet.formatDateTime('#39'hh:mm:ss'#39')'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        Enabled = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object BoldEdit26: TBoldEdit
        Left = 168
        Top = 24
        Width = 25
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'betweenStartSetColor'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
        OnDblClick = BoldEdit26DblClick
      end
      object BoldEdit27: TBoldEdit
        Left = 360
        Top = 24
        Width = 25
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'betweenSetOnColor'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnDblClick = BoldEdit27DblClick
      end
      object BoldEdit28: TBoldEdit
        Left = 552
        Top = 24
        Width = 25
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'betweenOnEndColor'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
      end
      object BoldCheckBox10: TBoldCheckBox
        Left = 600
        Top = 312
        Width = 171
        Height = 17
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'viewSetEndLong'
        BoldProperties.ApplyPolicy = bapChange
        Caption = #1057#1095#1080#1090#1072#1090#1100' '#1085#1077#1091#1095#1090'. '#1087#1088#1080#1073#1099#1090#1080#1077
        Ctl3D = True
        Enabled = False
        ParentCtl3D = False
        ReadOnly = False
        TabOrder = 6
        Visible = False
      end
      object BoldEdit29: TBoldEdit
        Left = 736
        Top = 24
        Width = 25
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'betweenSetEndColor'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnDblClick = BoldEdit29DblClick
      end
      object BoldEdit30: TBoldEdit
        Left = 600
        Top = 24
        Width = 113
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'betweenSetEnd.formatDateTime('#39'hh:mm:ss'#39')'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        Enabled = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 8
      end
      object DBEdit40: TDBEdit
        Left = 16
        Top = 72
        Width = 177
        Height = 22
        Ctl3D = False
        DataField = 'order_late_rating_fine'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 9
      end
      object DBEdit41: TDBEdit
        Left = 16
        Top = 152
        Width = 177
        Height = 22
        Ctl3D = False
        DataField = 'order_refusal_rating_fine'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 10
      end
      object DBEdit42: TDBEdit
        Left = 16
        Top = 232
        Width = 177
        Height = 22
        Ctl3D = False
        DataField = 'order_refusal_balance_fine'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 11
      end
      object DBEdit43: TDBEdit
        Left = 216
        Top = 72
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'base_referral_bonus'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 12
      end
      object DBEdit44: TDBEdit
        Left = 216
        Top = 152
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'base_ref_bonus_interval'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 13
      end
      object DBEdit45: TDBEdit
        Left = 16
        Top = 112
        Width = 177
        Height = 22
        Ctl3D = False
        DataField = 'order_late_rating_time'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 14
      end
      object DBEdit46: TDBEdit
        Left = 16
        Top = 192
        Width = 177
        Height = 22
        Ctl3D = False
        DataField = 'order_refusal_rating_time'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 15
      end
      object DBEdit47: TDBEdit
        Left = 216
        Top = 192
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'order_rating_bonus'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 16
      end
      object DBEdit48: TDBEdit
        Left = 216
        Top = 232
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'order_rating_bonus_time'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 17
      end
      object DBEdit49: TDBEdit
        Left = 216
        Top = 312
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'old_order_rbonus_time'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 18
      end
      object DBEdit50: TDBEdit
        Left = 216
        Top = 272
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'old_order_rating_bonus'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 19
      end
      object DBEdit51: TDBEdit
        Left = 16
        Top = 272
        Width = 177
        Height = 22
        Ctl3D = False
        DataField = 'old_order_time'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 20
      end
      object DBCheckBox30: TDBCheckBox
        Left = 16
        Top = 312
        Width = 185
        Height = 17
        Caption = #1048#1089#1087#1086#1083#1100#1079'. '#1088#1077#1081#1090#1080#1085#1075'. '#1073#1086#1085#1091#1089#1099
        DataField = 'use_drivers_rating'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 21
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit52: TDBEdit
        Left = 408
        Top = 72
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'peak_one_start'
        DataSource = BoldModelDM.HasAllBonusDS
        MaxLength = 5
        ParentCtl3D = False
        TabOrder = 22
      end
      object DBEdit53: TDBEdit
        Left = 408
        Top = 112
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'peak_one_lenght'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 23
      end
      object DBEdit54: TDBEdit
        Left = 408
        Top = 152
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'peak_one_bonus'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 24
      end
      object DBEdit55: TDBEdit
        Left = 408
        Top = 192
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'peak_one_bonus_time'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 25
      end
      object DBEdit56: TDBEdit
        Left = 408
        Top = 232
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'peak_two_start'
        DataSource = BoldModelDM.HasAllBonusDS
        MaxLength = 5
        ParentCtl3D = False
        TabOrder = 26
      end
      object DBEdit57: TDBEdit
        Left = 408
        Top = 312
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'peak_two_bonus'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 27
      end
      object DBEdit58: TDBEdit
        Left = 408
        Top = 272
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'peak_two_lenght'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 28
      end
      object DBEdit59: TDBEdit
        Left = 600
        Top = 72
        Width = 161
        Height = 22
        Ctl3D = False
        DataField = 'peak_two_bonus_time'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 29
      end
      object DBEdit60: TDBEdit
        Left = 600
        Top = 112
        Width = 161
        Height = 22
        Ctl3D = False
        DataField = 'peak_three_start'
        DataSource = BoldModelDM.HasAllBonusDS
        MaxLength = 5
        ParentCtl3D = False
        TabOrder = 30
      end
      object DBEdit61: TDBEdit
        Left = 600
        Top = 152
        Width = 161
        Height = 22
        Ctl3D = False
        DataField = 'peak_three_lenght'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 31
      end
      object DBEdit62: TDBEdit
        Left = 600
        Top = 192
        Width = 161
        Height = 22
        Ctl3D = False
        DataField = 'peak_three_bonus'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 32
      end
      object DBEdit63: TDBEdit
        Left = 600
        Top = 232
        Width = 161
        Height = 22
        Ctl3D = False
        DataField = 'peak_three_bonus_time'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 33
      end
      object DBEdit64: TDBEdit
        Left = 216
        Top = 112
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'base_referral_cashback'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 34
      end
      object BitBtn14: TBitBtn
        Left = 520
        Top = 344
        Width = 241
        Height = 33
        Action = BoldModelDM.DriversPrmDSP
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 35
      end
      object DBCheckBox31: TDBCheckBox
        Left = 600
        Top = 272
        Width = 161
        Height = 17
        Caption = #1057#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1072#1091#1082#1094#1080#1086#1085
        DataField = 'rating_pretendent_sorting'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 36
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object CtrlTabSheet: TTabSheet
      Caption = #1050#1086#1085#1090#1088#1086#1083#1100
      ImageIndex = 7
      TabVisible = False
      object Label30: TLabel
        Left = 16
        Top = 8
        Width = 252
        Height = 16
        Caption = #1055#1072#1088#1086#1083#1100' '#1086#1090#1089#1099#1083#1082#1080' '#1082#1086#1085#1090#1088#1086#1083#1100#1085#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
      end
      object BoldEdit11: TBoldEdit
        Left = 16
        Top = 24
        Width = 265
        Height = 19
        BoldHandle = BoldHandlesDM.blhDriversUnion
        BoldProperties.Expression = 'betweenOnEndColor'
        ReadOnly = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Alignment = taLeftJustify
        ButtonStyle = bbsNone
        Ctl3D = False
        MaxLength = 0
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheet11: TTabSheet
      Caption = #1060#1080#1088#1084#1099
      ImageIndex = 8
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 392
        Align = alClient
        BevelOuter = bvNone
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object BoldGrid1: TBoldGrid
          Left = 0
          Top = 0
          Width = 784
          Height = 352
          AddNewAtEnd = False
          Align = alClient
          BoldAutoColumns = False
          BoldShowConstraints = False
          BoldHandle = BoldHandlesDM.blhAllDrGroups
          BoldProperties.NilElementMode = neNone
          Columns = <
            item
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -17
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
            end
            item
              BoldProperties.Expression = 'identifikator'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = #1048#1085#1076#1077#1082#1089
              Title.Color = clWindow
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
            end
            item
              BoldProperties.Expression = 'naimenovanie'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Title.Color = clWindow
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
            end
            item
              BoldProperties.Expression = 'kommentarii'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
              Title.Color = clWindow
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
            end>
          Ctl3d = False
          DefaultRowHeight = 17
          EnableColAdjust = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          ColWidths = (
            17
            64
            346
            294)
        end
        object Panel1: TPanel
          Left = 0
          Top = 352
          Width = 784
          Height = 40
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object BitBtn2: TBitBtn
            Left = 8
            Top = 8
            Width = 209
            Height = 25
            Action = BoldHandlesDM.BoldListHandleAddNewActionAllGroups
            Caption = #1053#1086#1074#1072#1103' '#1075#1088#1091#1087#1087#1072' ('#1092#1080#1088#1084#1072')...'
            TabOrder = 0
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333FF33333333FF333993333333300033377F3333333777333993333333
              300033F77FFF3333377739999993333333333777777F3333333F399999933333
              33003777777333333377333993333333330033377F3333333377333993333333
              3333333773333333333F333333333333330033333333F33333773333333C3333
              330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
              993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
              333333333337733333FF3333333C333330003333333733333777333333333333
              3000333333333333377733333333333333333333333333333333}
            NumGlyphs = 2
          end
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = #1058#1072#1088#1080#1092#1099
      ImageIndex = 9
      object Splitter2: TSplitter
        Left = 552
        Top = 0
        Width = 8
        Height = 351
        Align = alRight
        Color = clMedGray
        ParentColor = False
      end
      object Panel2: TPanel
        Left = 0
        Top = 351
        Width = 784
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object BitBtn6: TBitBtn
          Left = 8
          Top = 8
          Width = 161
          Height = 25
          Action = ADOConnectDM.OrderTarifDSI
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1088#1080#1092
          TabOrder = 0
        end
        object BitBtn12: TBitBtn
          Left = 184
          Top = 8
          Width = 281
          Height = 25
          Caption = #1054#1095#1077#1088#1090#1080#1090#1100' '#1086#1073#1083#1072#1089#1090#1100'('#1090#1086#1095#1082#1080') '#1079#1086#1085#1099' '#1090#1072#1088#1080#1092#1072
          TabOrder = 1
          OnClick = BitBtn12Click
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 552
        Height = 351
        Align = alClient
        Ctl3D = False
        DataSource = ADOConnectDM.OrdTariffsDS
        ParentCtl3D = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ID'
            Title.Caption = '#'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TARIF_NAME'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1072#1088#1080#1092#1072
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIME_TARIF'
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' 1'#1084#1080#1085'.'
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TMETER_TARIF'
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' 1'#1082#1084
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TPLAN_LOOK'
            Title.Caption = #1058#1072#1088'. '#1087#1083#1072#1085
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHORT_NAME'
            Title.Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IF_DEF'
            Title.Caption = #1059#1084#1086#1083#1095'.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IN_RATING'
            Title.Caption = #1042' '#1088#1077#1081#1090#1080#1085#1075#1077
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RATING_SUMM'
            Title.Caption = #1056#1077#1081#1090'. '#1089#1091#1084#1084#1072
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RATING_PRIORITY'
            Title.Caption = #1056#1077#1081#1090'. '#1087#1088'-'#1090
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DISTANCE_START'
            Title.Caption = #1057#1090#1072#1088#1090'. '#1076#1080#1089#1090#1072#1085#1094#1080#1103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DISTANCE_PART'
            Title.Caption = #1056#1072#1079#1084#1077#1088' '#1076#1080#1089#1090#1072#1085#1094#1080#1080
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DPART_TARIF'
            Title.Caption = #1044#1080#1089#1090#1072#1085#1094'. '#1090#1072#1088#1080#1092
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOP_TARIF'
            Title.Caption = #1054#1089#1090#1072#1085#1086#1074#1086#1095#1085'. '#1090#1072#1088#1080#1092
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTR_LOOK'
            Title.Caption = #1058#1072#1088#1080#1092' '#1074#1085#1077' '#1079#1086#1085#1099
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTP_LOOK'
            Title.Caption = #1058#1072#1088'. '#1087#1083#1072#1085' '#1074#1085#1077' '#1079#1086#1085#1099
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'miss_every_nkm'
            Title.Caption = #1055#1088#1086#1087#1091#1089#1082' n '#1082#1084' (0 - '#1074#1099#1082#1083')'
            Visible = True
          end>
      end
      object GroupBox3: TGroupBox
        Left = 560
        Top = 0
        Width = 224
        Height = 351
        Align = alRight
        Caption = #1058#1086#1095#1082#1080' '#1079#1086#1085#1099' '#1090#1077#1082'. '#1090#1072#1088#1080#1092#1072
        TabOrder = 2
        object DBGrid7: TDBGrid
          Left = 2
          Top = 18
          Width = 220
          Height = 306
          Align = alClient
          DataSource = ADOConnectDM.dsTrAreaCoords
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'order_num'
              Title.Caption = #1055#1086#1088#1103#1076#1086#1082
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lat'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'lon'
              Width = 75
              Visible = True
            end>
        end
        object DBNavigator2: TDBNavigator
          Left = 2
          Top = 324
          Width = 220
          Height = 25
          DataSource = ADOConnectDM.dsTrAreaCoords
          VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
          Align = alBottom
          TabOrder = 1
        end
      end
    end
    object TabSheet12: TTabSheet
      Caption = #1054#1087#1094#1080#1080' '#1079#1072#1082#1072#1079#1072
      ImageIndex = 10
      object Panel3: TPanel
        Left = 0
        Top = 351
        Width = 784
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object BitBtn7: TBitBtn
          Left = 16
          Top = 8
          Width = 153
          Height = 25
          Action = ADOConnectDM.OrderOptionDSI
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1087#1094#1080#1102
          TabOrder = 0
        end
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 351
        Align = alClient
        Ctl3D = False
        DataSource = ADOConnectDM.OrdOptsDS
        ParentCtl3D = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = '#'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPTION_NAME'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1087#1094#1080#1080
            Width = 189
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OSUMM_COEFF'
            Title.Caption = #1050#1086#1101#1092'. '#1089#1091#1084#1084#1099
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OS_COMPOSED'
            Title.Caption = #1057#1083#1072#1075#1072#1077#1084#1086#1077' '#1089#1091#1084#1084#1099
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TPLAN_LOOK'
            Title.Caption = #1058#1072#1088'. '#1087#1083#1072#1085
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SHORT_NAME'
            Title.Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IF_DEF'
            Title.Caption = #1059#1084#1086#1083#1095'.'
            Visible = True
          end>
      end
    end
    object TabSheet13: TTabSheet
      Caption = #1058#1072#1088#1080#1092#1085#1099#1077' '#1087#1083#1072#1085#1099
      ImageIndex = 11
      object Splitter1: TSplitter
        Left = 0
        Top = 225
        Width = 784
        Height = 8
        Cursor = crVSplit
        Align = alTop
        Color = clMedGray
        ParentColor = False
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 225
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Panel5: TPanel
          Left = 0
          Top = 184
          Width = 784
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object BitBtn8: TBitBtn
            Left = 8
            Top = 8
            Width = 153
            Height = 25
            Action = ADOConnectDM.TarifPlanDSI
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1088'. '#1087#1083#1072#1085
            TabOrder = 0
          end
        end
        object DBGrid3: TDBGrid
          Left = 0
          Top = 0
          Width = 784
          Height = 184
          Align = alClient
          Ctl3D = False
          DataSource = ADOConnectDM.TarifPlansDS
          ParentCtl3D = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Color = clScrollBar
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POLICY_NAME'
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1083#1072#1085#1072
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHORT_NAME'
              Title.Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
              Width = 100
              Visible = True
            end>
        end
      end
      object PageControl3: TPageControl
        Left = 0
        Top = 233
        Width = 784
        Height = 159
        ActivePage = TabSheet14
        Align = alClient
        TabOrder = 1
        object TabSheet14: TTabSheet
          Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1082' '#1075#1088#1091#1087#1087#1072#1084' '#1074#1086#1076#1080#1090#1077#1083#1077#1081
          object DBGrid4: TDBGrid
            Left = 0
            Top = 0
            Width = 776
            Height = 128
            Align = alClient
            Ctl3D = False
            DataSource = ADOConnectDM.DrGroupsWthTPDS
            ParentCtl3D = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'Naimenovanie'
                Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GRTP_LOOK'
                Title.Caption = #1058#1072#1088'. '#1087#1083#1072#1085
                Width = 200
                Visible = True
              end>
          end
        end
        object TabSheet15: TTabSheet
          Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1082' '#1074#1086#1076#1080#1090#1077#1083#1103#1084
          ImageIndex = 1
          object DBGrid5: TDBGrid
            Left = 0
            Top = 0
            Width = 776
            Height = 124
            Align = alClient
            Ctl3D = False
            DataSource = ADOConnectDM.DrWithTPDS
            ParentCtl3D = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'Pozyvnoi'
                Title.Caption = #1055#1086#1079#1099#1074#1085#1086#1081
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DRTP_LOOK'
                Title.Caption = #1058#1072#1088'. '#1087#1083#1072#1085
                Width = 200
                Visible = True
              end>
          end
        end
      end
    end
    object TabSheet16: TTabSheet
      Caption = #1062#1080#1092#1088#1086#1074#1072#1103' '#1040#1058#1057
      ImageIndex = 12
      object Label44: TLabel
        Left = 24
        Top = 8
        Width = 159
        Height = 16
        Caption = #1058#1077#1089#1090#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
      end
      object Label45: TLabel
        Left = 24
        Top = 56
        Width = 171
        Height = 16
        Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072
      end
      object Label46: TLabel
        Left = 24
        Top = 104
        Width = 129
        Height = 16
        Caption = #1053#1086#1084#1077#1088' '#1091#1087#1088#1072#1074#1083#1103#1102#1097#1077#1075#1086
      end
      object Label47: TLabel
        Left = 24
        Top = 152
        Width = 125
        Height = 16
        Caption = 'ID '#1096#1083#1102#1079#1072' '#1074' '#1083#1086#1082'. '#1089#1077#1090#1080
      end
      object Label48: TLabel
        Left = 24
        Top = 200
        Width = 132
        Height = 16
        Caption = 'ID '#1096#1083#1102#1079#1072' '#1074' '#1080#1085#1090#1077#1088#1085#1077#1090#1077
      end
      object Label49: TLabel
        Left = 24
        Top = 248
        Width = 126
        Height = 16
        Caption = #1050#1086#1085#1090#1077#1082#1089#1090' '#1080#1089#1093'. '#1074#1099#1079#1086#1074#1072
      end
      object Label50: TLabel
        Left = 24
        Top = 296
        Width = 171
        Height = 16
        Caption = #1042#1080#1088#1090'. '#1085#1086#1084#1077#1088' '#1080#1089#1093'. '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
      end
      object Label51: TLabel
        Left = 224
        Top = 8
        Width = 136
        Height = 16
        Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090' '#1080#1089#1093'. '#1074#1099#1079#1086#1074#1072
      end
      object Label52: TLabel
        Left = 224
        Top = 56
        Width = 123
        Height = 16
        Caption = #1058#1072#1081#1084#1072#1091#1090' '#1080#1089#1093'. '#1074#1099#1079#1086#1074#1072
      end
      object Label53: TLabel
        Left = 224
        Top = 104
        Width = 155
        Height = 16
        Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1080#1089#1093'. '#1072#1073'-'#1090#1072
      end
      object Label60: TLabel
        Left = 224
        Top = 248
        Width = 283
        Height = 16
        Caption = #1050#1086#1076' '#1087#1077#1088#1074#1086#1081' '#1084#1077#1083#1086#1076#1080#1080' '#1087#1088#1080' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1086#1081' '#1084#1072#1096#1080#1085#1077
      end
      object Label62: TLabel
        Left = 224
        Top = 296
        Width = 257
        Height = 16
        Caption = #1050#1086#1076' '#1087#1077#1088#1074#1086#1081' '#1084#1077#1083#1086#1076#1080#1080' '#1087#1086' '#1087#1088#1080#1073#1099#1090#1080#1102' '#1085#1072' '#1090#1086#1095#1082#1091
      end
      object Label63: TLabel
        Left = 224
        Top = 200
        Width = 276
        Height = 16
        Caption = #1042#1088#1077#1084#1077#1085#1085#1072#1103' '#1092#1091#1085#1082#1094#1080#1103', '#1085#1091#1078#1085#1072#1103' '#1087#1088#1080' '#1074#1082#1083#1102#1095#1077#1085#1085#1099#1093' '
        Enabled = False
      end
      object Label64: TLabel
        Left = 224
        Top = 216
        Width = 275
        Height = 16
        Caption = #1074' '#1083#1086#1082#1072#1083#1100#1085#1099#1093' '#1085#1072#1089#1090#1088#1086#1081#1082#1072#1093' '#1086#1087#1094#1080#1103#1093' '#1087#1086#1076#1084#1077#1085#1099' '#1057#1052#1057
        Enabled = False
      end
      object DBEdit13: TDBEdit
        Left = 24
        Top = 24
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'test_phone'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 0
      end
      object DBEdit14: TDBEdit
        Left = 24
        Top = 72
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'disp_phone'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 1
      end
      object DBEdit15: TDBEdit
        Left = 24
        Top = 168
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'call_demon_locsip_name'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 2
      end
      object DBEdit16: TDBEdit
        Left = 24
        Top = 120
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'manager_phone'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 3
      end
      object DBEdit17: TDBEdit
        Left = 24
        Top = 216
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'call_demon_netsip_name'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 4
      end
      object DBEdit18: TDBEdit
        Left = 24
        Top = 264
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'demon_call_ctx'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 5
      end
      object DBEdit19: TDBEdit
        Left = 24
        Top = 312
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'demon_call_virtext'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 6
      end
      object DBEdit20: TDBEdit
        Left = 224
        Top = 24
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'demon_call_priority'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 7
      end
      object DBEdit21: TDBEdit
        Left = 224
        Top = 72
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'demon_call_timeout'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 8
      end
      object DBEdit22: TDBEdit
        Left = 224
        Top = 120
        Width = 169
        Height = 22
        Ctl3D = False
        DataField = 'demon_callerid'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 9
      end
      object BitBtn9: TBitBtn
        Left = 504
        Top = 24
        Width = 169
        Height = 25
        Action = BoldModelDM.DriversPrmDSP
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 10
      end
      object DBCheckBox28: TDBCheckBox
        Left = 224
        Top = 176
        Width = 289
        Height = 25
        Caption = #1047#1072#1076#1077#1088#1078#1082#1072' '#1084#1077#1078#1076#1091' '#1079#1074#1086#1085#1082#1072#1084#1080' '#1087#1088#1080' '#1079#1072#1084#1077#1085#1077' '#1057#1052#1057
        DataField = 'replace_sms_with_robot'
        DataSource = BoldModelDM.HasAllBonusDS
        Enabled = False
        TabOrder = 11
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit27: TDBEdit
        Left = 224
        Top = 264
        Width = 257
        Height = 22
        Ctl3D = False
        DataField = 'start_first_song_code'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 12
      end
      object DBCheckBox29: TDBCheckBox
        Left = 224
        Top = 152
        Width = 145
        Height = 25
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1086#1090#1079#1074#1086#1085
        DataField = 'use_call_robot'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 13
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit28: TDBEdit
        Left = 224
        Top = 312
        Width = 257
        Height = 22
        Ctl3D = False
        DataField = 'onplace_first_song_code'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 14
      end
    end
    object TabSheet17: TTabSheet
      Caption = #1059#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1089#1074#1103#1079#1080
      ImageIndex = 13
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 361
        Height = 392
        Align = alLeft
        Caption = #1057#1086#1086#1090#1074#1077#1090#1074#1080#1077' '#1082#1086#1076#1086#1074' '#1080' '#1091#1089#1090#1088#1086#1081#1089#1090#1074
        TabOrder = 0
        object Panel6: TPanel
          Left = 2
          Top = 349
          Width = 357
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object DBNavigator1: TDBNavigator
            Left = 8
            Top = 8
            Width = 240
            Height = 25
            DataSource = ADOConnectDM.PhoneCodesDS
            TabOrder = 0
          end
        end
        object DBGrid6: TDBGrid
          Left = 2
          Top = 18
          Width = 357
          Height = 331
          Align = alClient
          Ctl3D = False
          DataSource = ADOConnectDM.PhoneCodesDS
          ParentCtl3D = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'code'
              Title.Caption = #1050#1086#1076' '#1090#1077#1083'. '#1085#1086#1084#1077#1088#1072
              Width = 141
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'device_num'
              Title.Caption = #1053#1086#1084#1077#1088' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
              Width = 167
              Visible = True
            end>
        end
      end
    end
    object TabSheet18: TTabSheet
      Caption = 'GPS '#1058#1088#1077#1082#1080#1085#1075
      ImageIndex = 14
      object Label38: TLabel
        Left = 16
        Top = 8
        Width = 367
        Height = 16
        Caption = #1040#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072' '#1090#1088#1077#1082#1080#1085#1075#1072'  OpenGTS ('#1087#1088#1080#1084#1077#1088' 00.00.00.00:8080)'
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 32
        Width = 369
        Height = 22
        Ctl3D = False
        DataField = 'GPS_SRV_ADR'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 0
      end
      object BitBtn3: TBitBtn
        Left = 16
        Top = 320
        Width = 241
        Height = 33
        Action = BoldModelDM.DriversPrmDSP
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 1
      end
      object DBCheckBox34: TDBCheckBox
        Left = 16
        Top = 64
        Width = 353
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1090#1088#1077#1082#1080#1085#1075' ('#1086#1090#1089#1099#1083' '#1082#1086#1086#1088#1076#1080#1085#1072#1090' '#1089#1077#1088#1074#1077#1088#1091' '#1054'penGTS)'
        Ctl3D = False
        DataField = 'use_opengts_monitoring'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox35: TDBCheckBox
        Left = 16
        Top = 88
        Width = 353
        Height = 17
        Caption = #1055#1086#1089#1090#1086#1103#1085#1085#1086#1077' '#1086#1073#1085#1086#1074#1083'.  '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1074#1086#1076#1080#1090#1077#1083#1103' '#1074' '#1086#1089#1085'. '#1073#1072#1079#1077
        Ctl3D = False
        DataField = 'on_gps_signaling'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object TabSheet19: TTabSheet
      Caption = #1054#1073#1084#1077#1085' '#1089' '#1074#1086#1076#1080#1090#1077#1083#1103#1084#1080
      ImageIndex = 15
      object Label39: TLabel
        Left = 16
        Top = 8
        Width = 243
        Height = 16
        Caption = #1058#1077#1082'. '#1074#1077#1088#1089#1080#1103' '#1084#1086#1073'. '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103' '#1074#1086#1076#1080#1090#1077#1083#1077#1081
        Enabled = False
      end
      object Label40: TLabel
        Left = 16
        Top = 56
        Width = 246
        Height = 16
        Caption = #1052#1080#1085'. '#1074#1077#1088#1089#1080#1103' '#1084#1086#1073'. '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103' '#1074#1086#1076#1080#1090#1077#1083#1077#1081
        Enabled = False
      end
      object Label56: TLabel
        Left = 16
        Top = 224
        Width = 177
        Height = 16
        Caption = #1042#1072#1083#1102#1090#1072' '#1086#1073#1084#1077#1085#1072' ('#1089#1086#1082#1088#1072#1097#1077#1085#1085#1086')'
      end
      object Label57: TLabel
        Left = 296
        Top = 8
        Width = 146
        Height = 16
        Caption = #1058#1077#1083#1077#1092#1086#1085#1085#1099#1081' '#1082#1086#1076' '#1089#1090#1088#1072#1085#1099
      end
      object Label59: TLabel
        Left = 296
        Top = 152
        Width = 225
        Height = 16
        Caption = #1042#1088#1077#1084#1103' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1086#1090#1084#1077#1085' '#1082#1083#1080#1077#1085#1090#1086#1074' ('#1089#1077#1082')'
      end
      object Label99: TLabel
        Left = 296
        Top = 224
        Width = 238
        Height = 16
        Caption = #1055#1088#1077#1092#1080#1082#1089' '#1075#1077#1086#1082#1086#1076#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      end
      object Label104: TLabel
        Left = 552
        Top = 224
        Width = 214
        Height = 16
        Caption = #1086#1090' '#1074#1074#1077#1076#1077#1085#1085#1086#1075#1086' '#1072#1076#1088'. '#1080#1083#1080' '#1082#1083#1080#1077#1085#1090#1089#1082#1086#1075#1086
      end
      object Label105: TLabel
        Left = 552
        Top = 248
        Width = 73
        Height = 16
        Caption = #1087#1088#1080#1083#1086#1078#1077#1085#1080#1103
      end
      object Label106: TLabel
        Left = 552
        Top = 272
        Width = 171
        Height = 16
        Caption = #1052#1072#1082#1089'. '#1088#1072#1076#1080#1091#1089' '#1085#1072#1079#1085'. '#1074#1086#1076#1080#1090#1077#1083#1103
      end
      object DBEdit4: TDBEdit
        Left = 16
        Top = 24
        Width = 249
        Height = 22
        Ctl3D = False
        DataField = 'curr_mob_version'
        DataSource = BoldModelDM.HasAllBonusDS
        Enabled = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object DBEdit6: TDBEdit
        Left = 16
        Top = 72
        Width = 249
        Height = 22
        Ctl3D = False
        DataField = 'min_mob_version'
        DataSource = BoldModelDM.HasAllBonusDS
        Enabled = False
        ParentCtl3D = False
        TabOrder = 1
      end
      object DBCheckBox17: TDBCheckBox
        Left = 16
        Top = 104
        Width = 177
        Height = 17
        Caption = #1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
        DataField = 'mandatory_update'
        DataSource = BoldModelDM.HasAllBonusDS
        Enabled = False
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox18: TDBCheckBox
        Left = 16
        Top = 128
        Width = 177
        Height = 17
        Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1088#1080#1086#1088#1080#1090#1077#1090#1099
        DataField = 'use_dr_priority'
        DataSource = BoldModelDM.HasAllBonusDS
        Enabled = False
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox19: TDBCheckBox
        Left = 16
        Top = 152
        Width = 177
        Height = 17
        Caption = #1055#1088#1103#1084'. '#1085#1072#1079#1085#1072#1095'. '#1086#1087#1088'.'
        DataField = 'dir_dr_autoset'
        DataSource = BoldModelDM.HasAllBonusDS
        Enabled = False
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox20: TDBCheckBox
        Left = 16
        Top = 176
        Width = 177
        Height = 17
        Caption = #1059#1095'. '#1087#1086#1076#1090#1074'. '#1079#1072#1085#1103#1090#1086#1089#1090#1080
        DataField = 'sync_busy_accounting'
        DataSource = BoldModelDM.HasAllBonusDS
        Enabled = False
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox21: TDBCheckBox
        Left = 16
        Top = 200
        Width = 177
        Height = 17
        Caption = #1057#1077#1082#1090'. '#1088#1072#1089#1089#1099#1083
        DataField = 'use_sect_wbroadcast'
        DataSource = BoldModelDM.HasAllBonusDS
        Enabled = False
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit10: TDBEdit
        Left = 16
        Top = 240
        Width = 249
        Height = 22
        Ctl3D = False
        DataField = 'currency_short'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 7
      end
      object BitBtn13: TBitBtn
        Left = 16
        Top = 328
        Width = 241
        Height = 33
        Action = BoldModelDM.DriversPrmDSP
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 8
      end
      object DBEdit24: TDBEdit
        Left = 296
        Top = 24
        Width = 249
        Height = 22
        Ctl3D = False
        DataField = 'state_phone_code'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 9
      end
      object DBCheckBox24: TDBCheckBox
        Left = 296
        Top = 56
        Width = 313
        Height = 17
        Caption = #1057#1087#1088#1072#1096#1080#1074#1072#1090#1100' '#1074#1088#1077#1084#1103' '#1087#1088#1080' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1080' '#1079#1072#1082#1072#1079#1072
        DataField = 'send_wait_info'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 10
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox25: TDBCheckBox
        Left = 296
        Top = 80
        Width = 449
        Height = 17
        Caption = 
          #1055#1077#1088#1077#1084#1077#1097#1072#1090#1100' '#1085#1072' '#1089#1077#1082#1090#1086#1088' '#1087#1088#1080' '#1091#1082#1072#1079'. '#1089#1077#1082#1090#1086#1088#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103' ('#1086#1089#1074#1086#1073#1086#1078#1076#1077#1085#1080#1103 +
          ')'
        DataField = 'odirect_to_dsect'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 11
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox26: TDBCheckBox
        Left = 296
        Top = 104
        Width = 313
        Height = 17
        Caption = #1040#1074#1090#1086#1088#1072#1089#1089#1099#1083' '#1079#1072#1103#1074#1086#1082' '#1085#1077#1090#1088#1086#1085#1091#1090#1099#1093' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1086#1084
        DataField = 'auto_bsect_notmanual_ord'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 12
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox27: TDBCheckBox
        Left = 296
        Top = 128
        Width = 361
        Height = 17
        Caption = #1040#1074#1090#1086#1079#1072#1082#1088#1099#1090#1080#1077' '#1086#1090#1084#1077#1085' '#1082#1083#1080#1077#1085#1090#1086#1084' '#1089' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103' ('#1054#1053#1051#1040#1049#1053')'
        DataField = 'auto_close_client_canceling'
        DataSource = BoldModelDM.HasAllBonusDS
        TabOrder = 13
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit26: TDBEdit
        Left = 296
        Top = 168
        Width = 249
        Height = 22
        Ctl3D = False
        DataField = 'auto_close_clcancel_time'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 14
      end
      object DBCheckBox32: TDBCheckBox
        Left = 296
        Top = 200
        Width = 289
        Height = 17
        Caption = #1040#1074#1090#1086#1086#1087#1088'. '#1089#1077#1082#1090#1086#1088#1086#1074' '#1087#1086' '#1072#1076#1088'. '#1079#1072#1082#1072#1079#1072
        Ctl3D = False
        DataField = 'auto_detect_sector_by_addr'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 15
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit65: TDBEdit
        Left = 296
        Top = 240
        Width = 249
        Height = 22
        Ctl3D = False
        DataField = 'geocode_default_prefix'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 16
      end
      object DBCheckBox33: TDBCheckBox
        Left = 296
        Top = 272
        Width = 249
        Height = 17
        Caption = #1040#1074#1090#1086#1087#1077#1088#1077#1084#1077#1097'. '#1074#1086#1076#1080#1090#1077#1083#1077#1081' '#1087#1086' '#1089#1077#1082#1090#1086#1088#1072#1084
        Ctl3D = False
        DataField = 'auto_detect_driver_sector'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 17
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox36: TDBCheckBox
        Left = 16
        Top = 272
        Width = 249
        Height = 17
        Caption = #1057#1087#1088#1072#1096'. '#1086' '#1089#1085#1103#1090#1080#1080' '#1089' '#1083#1080#1085#1080#1080' '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077
        Ctl3D = False
        DataField = 'confirm_lineout_on_exit'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 18
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox37: TDBCheckBox
        Left = 16
        Top = 296
        Width = 265
        Height = 17
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095'. '#1087#1086#1082#1072#1079'. '#1072#1091#1082#1094#1080#1086#1085' '#1087#1088#1080' '#1086#1073#1085#1086#1074#1083'.'
        Ctl3D = False
        DataField = 'auto_show_wait_dialog'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 19
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox38: TDBCheckBox
        Left = 296
        Top = 296
        Width = 281
        Height = 17
        Caption = #1053#1077' '#1087#1086#1082#1072#1079'. '#1072#1091#1082#1094#1080#1086#1085' '#1087#1088#1080' '#1074#1099#1087#1086#1083#1085'. '#1079#1072#1082#1072#1079#1072
        Ctl3D = False
        DataField = 'dont_wait_in_busy_state'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 20
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox44: TDBCheckBox
        Left = 552
        Top = 200
        Width = 289
        Height = 17
        Caption = #1040#1074#1090#1086#1085#1072#1079#1085#1072#1095'. '#1074#1086#1076#1080#1090#1077#1083#1103' '#1087#1086' '#1082#1086#1086#1088#1076'.'
        Ctl3D = False
        DataField = 'auto_assign_driver_by_coords'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 21
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit70: TDBEdit
        Left = 552
        Top = 288
        Width = 217
        Height = 22
        Ctl3D = False
        DataField = 'aass_driver_max_radius'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 22
      end
    end
    object TabSheet20: TTabSheet
      Caption = #1061#1088#1072#1085#1080#1083#1080#1097#1077
      ImageIndex = 16
      object Label42: TLabel
        Left = 16
        Top = 32
        Width = 202
        Height = 16
        Caption = #1050#1086#1076' '#1079#1072#1097#1080#1090#1099' '#1076#1083#1103' WEB-'#1080#1085#1090#1077#1088#1092#1077#1081#1089#1072
      end
      object Label55: TLabel
        Left = 16
        Top = 80
        Width = 62
        Height = 16
        Caption = #1042#1077#1088#1089#1080#1103' '#1041#1044
        Enabled = False
      end
      object Label102: TLabel
        Left = 16
        Top = 128
        Width = 125
        Height = 16
        Caption = #1058#1077#1083#1077#1092#1086#1085' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072
      end
      object Label103: TLabel
        Left = 16
        Top = 176
        Width = 79
        Height = 16
        Caption = #1056#1077#1079#1077#1088#1074#1085#1099#1081' IP'
      end
      object DBCheckBox22: TDBCheckBox
        Left = 16
        Top = 8
        Width = 297
        Height = 17
        Caption = #1042#1082#1083'. '#1072#1074#1090#1086#1072#1088#1093#1080#1074'. '#1085#1077#1079#1072#1076#1077#1081#1089#1090#1074#1086#1074#1072#1085#1085#1099#1093' '#1079#1072#1082#1072#1079#1086#1074
        DataField = 'auto_arh_empty_orders'
        DataSource = BoldModelDM.HasAllBonusDS
        Enabled = False
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit7: TDBEdit
        Left = 16
        Top = 48
        Width = 281
        Height = 22
        Ctl3D = False
        DataField = 'web_protected_code'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 1
      end
      object DBEdit8: TDBEdit
        Left = 16
        Top = 96
        Width = 281
        Height = 22
        Ctl3D = False
        DataField = 'db_version'
        DataSource = BoldModelDM.HasAllBonusDS
        Enabled = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object DBEdit68: TDBEdit
        Left = 16
        Top = 144
        Width = 281
        Height = 22
        Ctl3D = False
        DataField = 'disp_phone'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 3
      end
      object DBEdit69: TDBEdit
        Left = 16
        Top = 192
        Width = 281
        Height = 22
        Ctl3D = False
        DataField = 'reserved_ip'
        DataSource = BoldModelDM.HasAllBonusDS
        ParentCtl3D = False
        TabOrder = 4
      end
    end
  end
  object cd: TColorDialog
    Left = 752
    Top = 32
  end
  object BoldAsStringRenderer1: TBoldAsStringRenderer
    Left = 480
    Top = 104
  end
end