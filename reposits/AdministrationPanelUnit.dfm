object AdminPanelForm: TAdminPanelForm
  Left = 0
  Top = 0
  Width = 635
  Height = 557
  Caption = #1055#1072#1085#1077#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 308
    Width = 627
    Height = 8
    Cursor = crVSplit
    Align = alBottom
    Color = clMedGray
    ParentColor = False
  end
  object BoldGrid7: TBoldGrid
    Left = 0
    Top = 0
    Width = 627
    Height = 308
    AddNewAtEnd = False
    Align = alClient
    BoldAutoColumns = False
    BoldShowConstraints = False
    BoldHandle = BoldHandlesDM.blhUsersList
    BoldProperties.NilElementMode = neNone
    Columns = <
      item
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
      end
      item
        BoldProperties.Expression = 'familiya'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      item
        BoldProperties.Expression = 'imya'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1048#1084#1103
      end
      item
        BoldProperties.Expression = 'otchestvo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      end
      item
        BoldProperties.Expression = 'login'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1051#1086#1075#1080#1085
      end
      item
        BoldProperties.Expression = 'ident_dispetchera.asString+'#39' : '#39'+imya_dispetchera'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1044#1080#1089#1087#1077#1090#1095#1077#1088
        LookUpProperties.Expression = 'polnoe_imya'
        LookupHandle = BoldHandlesDM.blhUsersList
        OnLookupChange = BoldGrid7Columns5LookupChange
      end
      item
        BoldProperties.Expression = 'domashnii_telefon'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'IP-'#1082#1072#1085#1072#1083
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
      end
      item
        BoldProperties.Expression = 'razresh_administr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1056#1072#1079#1088#1077#1096' '#1072#1076#1084#1080#1085#1080#1089#1090#1088
        AllowCheckBox = True
      end
      item
        BoldProperties.Expression = 'razresh_nastroiku_raboty'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1056#1072#1079#1088#1077#1096' '#1085#1072#1089#1090#1088#1086#1081#1082#1091' '#1088#1072#1073#1086#1090#1099
        AllowCheckBox = True
      end
      item
        BoldProperties.Expression = 'razreshitj_prosmotr_logov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1083#1086#1075#1086#1074
        AllowCheckBox = True
      end
      item
        BoldProperties.Expression = 'razr_rabotu_s_arhivom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1056#1072#1079#1088'. '#1088#1072#1073#1086#1090#1091' '#1089' '#1072#1088#1093#1080#1074#1086#1084
        AllowCheckBox = True
      end
      item
        BoldProperties.Expression = 'rolj_dispetchera'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1056#1086#1083#1100' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        AllowCheckBox = True
      end
      item
        BoldProperties.Expression = 'vidit_vseh'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1042#1080#1076#1080#1090' '#1074#1089#1077#1093
        AllowCheckBox = True
      end
      item
        BoldProperties.Expression = 'razreshitj_vsyo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1074#1089#1105
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        AllowCheckBox = True
      end
      item
        BoldProperties.Expression = 'razr_prav_oper_razdelov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1044#1086#1087#1091#1089#1082#1072#1090#1100' '#1082' '#1086#1089#1085'. '#1087#1072#1085#1077#1083#1103#1084
        AllowCheckBox = True
      end
      item
        BoldProperties.Expression = 'razreshitj_udalenie_vypuskov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1088#1072#1073#1086#1090#1091' '#1089' '#1082#1072#1089#1089#1086#1081
        AllowCheckBox = True
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
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    ColWidths = (
      17
      64
      47
      64
      50
      94
      80
      160
      165
      148
      144
      132
      147
      179
      142
      64)
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 316
    Width = 627
    Height = 210
    ActivePage = TabSheet1
    Align = alBottom
    Images = ImageListsDM.AdminIL
    TabOrder = 1
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 619
        Height = 167
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label7: TLabel
          Left = 2
          Top = 108
          Width = 83
          Height = 16
          Caption = #1052#1086#1073'. '#1090#1077#1083#1077#1092#1086#1085
        end
        object Label6: TLabel
          Left = 266
          Top = 76
          Width = 57
          Height = 16
          Caption = #1069#1083'. '#1072#1076#1088#1077#1089
        end
        object Label5: TLabel
          Left = 6
          Top = 76
          Width = 80
          Height = 16
          Caption = #1056#1072#1073'. '#1090#1077#1083#1077#1092#1086#1085
        end
        object Label4: TLabel
          Left = 418
          Top = 44
          Width = 32
          Height = 16
          Caption = #1054#1092#1080#1089
        end
        object Label3: TLabel
          Left = 320
          Top = 44
          Width = 40
          Height = 16
          Caption = #1050#1086#1088#1087#1091#1089
        end
        object Label2: TLabel
          Left = 242
          Top = 44
          Width = 24
          Height = 16
          Caption = #1044#1086#1084
        end
        object Label1: TLabel
          Left = 6
          Top = 44
          Width = 35
          Height = 16
          Caption = #1059#1083#1080#1094#1072
        end
        object Label9: TLabel
          Left = 6
          Top = 12
          Width = 42
          Height = 16
          Caption = #1057#1090#1088#1072#1085#1072
        end
        object Label10: TLabel
          Left = 196
          Top = 12
          Width = 49
          Height = 16
          Caption = #1054#1073#1083#1072#1089#1090#1100
        end
        object Label11: TLabel
          Left = 350
          Top = 12
          Width = 35
          Height = 16
          Caption = #1043#1086#1088#1086#1076
        end
        object BitBtn23: TBitBtn
          Left = 162
          Top = 134
          Width = 127
          Height = 25
          Action = BoldHandlesDM.BoldListHandleDeleteActionAllUsers
          Caption = #1059#1076#1072#1083#1080#1090#1100
          TabOrder = 0
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            300033FFFFFF3333377739999993333333333777777F3333333F399999933333
            3300377777733333337733333333333333003333333333333377333333333333
            3333333333333333333F333333333333330033333F33333333773333C3333333
            330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
            333333377F33333333FF3333C333333330003333733333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
        end
        object BitBtn21: TBitBtn
          Left = 6
          Top = 134
          Width = 131
          Height = 25
          Action = BoldHandlesDM.BoldListHandleAddNewActionAllUsers
          Caption = #1053#1086#1074#1099#1081
          TabOrder = 1
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
        object BoldEdit7: TBoldEdit
          Left = 96
          Top = 102
          Width = 129
          Height = 22
          BoldHandle = BoldHandlesDM.blhUsersList
          BoldProperties.Expression = 'mobiljnyi_telefon'
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
        object BoldEdit6: TBoldEdit
          Left = 356
          Top = 70
          Width = 133
          Height = 22
          BoldHandle = BoldHandlesDM.blhUsersList
          BoldProperties.Expression = 'elektronnyi_adres'
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
        object BoldEdit5: TBoldEdit
          Left = 96
          Top = 70
          Width = 129
          Height = 22
          BoldHandle = BoldHandlesDM.blhUsersList
          BoldProperties.Expression = 'rabochii_telefon'
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
        object BoldEdit4: TBoldEdit
          Left = 456
          Top = 38
          Width = 37
          Height = 22
          BoldHandle = BoldHandlesDM.blhUsersList
          BoldProperties.Expression = 'kvartira'
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
          TabOrder = 5
        end
        object BoldEdit3: TBoldEdit
          Left = 364
          Top = 38
          Width = 37
          Height = 22
          BoldHandle = BoldHandlesDM.blhUsersList
          BoldProperties.Expression = 'korpus'
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
          TabOrder = 6
        end
        object BoldEdit2: TBoldEdit
          Left = 272
          Top = 38
          Width = 37
          Height = 22
          BoldHandle = BoldHandlesDM.blhUsersList
          BoldProperties.Expression = 'dom'
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
          TabOrder = 7
        end
        object BoldEdit1: TBoldEdit
          Left = 96
          Top = 38
          Width = 129
          Height = 22
          BoldHandle = BoldHandlesDM.blhUsersList
          BoldProperties.Expression = 'ulica'
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
          TabOrder = 8
        end
        object BoldEdit9: TBoldEdit
          Left = 96
          Top = 6
          Width = 89
          Height = 22
          BoldHandle = BoldHandlesDM.blhUsersList
          BoldProperties.Expression = 'strana'
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
          TabOrder = 9
        end
        object BoldEdit10: TBoldEdit
          Left = 254
          Top = 6
          Width = 91
          Height = 22
          BoldHandle = BoldHandlesDM.blhUsersList
          BoldProperties.Expression = 'oblastj'
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
          TabOrder = 10
        end
        object BoldEdit11: TBoldEdit
          Left = 396
          Top = 6
          Width = 97
          Height = 22
          BoldHandle = BoldHandlesDM.blhUsersList
          BoldProperties.Expression = 'gorod'
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
          TabOrder = 11
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1086#1089#1077#1097#1077#1085#1080#1077' '#1089#1080#1089#1090#1077#1084#1099
      ImageIndex = 1
      object BoldGrid1: TBoldGrid
        Left = 0
        Top = 0
        Width = 619
        Height = 167
        AddNewAtEnd = False
        Align = alClient
        BoldAutoColumns = False
        BoldShowConstraints = False
        BoldHandle = BoldHandlesDM.blhUserInOutEvents
        BoldProperties.NilElementMode = neNone
        Columns = <
          item
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -10
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            BoldProperties.Expression = 'data'
            ColReadOnly = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -10
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = #1044#1072#1090#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
          end
          item
            BoldProperties.Expression = 'vhod'
            ColReadOnly = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -10
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = #1042#1093#1086#1076
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            AllowCheckBox = True
          end
          item
            BoldProperties.Expression = 'vyhod'
            ColReadOnly = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -10
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = #1042#1099#1093#1086#1076
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            AllowCheckBox = True
          end
          item
            BoldProperties.Expression = 'v_roli_operatora'
            ColReadOnly = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -10
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = #1042' '#1088#1086#1083#1080' '#1086#1087#1077#1088#1072#1090#1086#1088#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            AllowCheckBox = True
          end
          item
            BoldProperties.Expression = 'v_roli_dispetchera'
            ColReadOnly = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -10
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = #1042' '#1088#1086#1083#1080' '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            AllowCheckBox = True
          end
          item
            BoldProperties.Expression = 'skoljko_chasov'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -10
            Font.Name = 'Tahoma'
            Font.Style = []
            Title.Caption = #1063#1072#1089#1086#1074
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
        Font.Height = -10
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
          118
          92
          91
          127
          134
          118)
      end
    end
  end
end
