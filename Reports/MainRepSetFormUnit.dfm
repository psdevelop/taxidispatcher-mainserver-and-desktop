object MainRepSettForm: TMainRepSettForm
  Left = 0
  Top = 0
  Width = 259
  Height = 483
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1105#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object BitBtn1: TBitBtn
    Left = 68
    Top = 408
    Width = 117
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 251
    Height = 297
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 1
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      Caption = #1048#1085#1090#1077#1088#1074#1072#1083
      OnShow = TabSheet1Show
      object BoldComboBox1: TBoldComboBox
        Left = 24
        Top = 136
        Width = 161
        Height = 24
        Alignment = taLeftJustify
        BoldHandle = BoldHandlesDM.brhCurrDrGroup
        BoldListHandle = BoldHandlesDM.blhAllDrGroups
        BoldListProperties.DragMode = bdgSelection
        BoldListProperties.DropMode = bdpAppend
        BoldListProperties.NilElementMode = neInsertFirst
        BoldProperties.Expression = 'naimenovanie'
        BoldProperties.NilStringRepresentation = #1042#1057#1045' '#1043#1056#1059#1055#1055#1067' ('#1060#1048#1056#1052#1067')'
        BoldRowProperties.Expression = 'naimenovanie'
        BoldRowProperties.NilStringRepresentation = #1042#1057#1045' '#1043#1056#1059#1055#1055#1067' ('#1060#1048#1056#1052#1067')'
        BoldSetValueExpression = 'self'
        BoldSelectChangeAction = bdcsSetReference
        ItemHeight = 16
        TabOrder = 0
      end
      object RepModeRadioGroup: TRadioGroup
        Left = 0
        Top = 168
        Width = 241
        Height = 97
        Caption = #1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1080' '#1086#1090#1095#1077#1090#1072
        Items.Strings = (
          #1057#1090#1072#1085#1076#1072#1088#1090#1085#1099#1081' '#1074#1072#1088#1080#1072#1085#1090' ('#1087#1086' '#1091#1084#1086#1083#1095'.)'
          #1042#1072#1088'-'#1090' '#1086#1090#1095#1105#1090#1072' '#1089' '#1087#1088#1080#1079'. '#1082#1086#1083'-'#1084
          #1054#1090#1095#1077#1090' '#1089' '#1074#1099#1095'. '#1079#1072' '#1088#1072#1073'. '#1076#1080#1089#1087#1077#1090#1095#1077#1088#1072)
        TabOrder = 1
      end
      object PageControl2: TPageControl
        Left = 0
        Top = 0
        Width = 241
        Height = 129
        ActivePage = TabSheet3
        TabOrder = 2
        object TabSheet3: TTabSheet
          Caption = #1044#1072#1090#1072
          object DateTimePicker2: TDateTimePicker
            Left = 16
            Top = 50
            Width = 163
            Height = 24
            Date = 38782.433014664360000000
            Time = 38782.433014664360000000
            TabOrder = 0
          end
          object DateTimePicker1: TDateTimePicker
            Left = 16
            Top = 14
            Width = 163
            Height = 24
            Date = 38782.432962407410000000
            Time = 38782.432962407410000000
            TabOrder = 1
          end
        end
        object TabSheet4: TTabSheet
          Caption = #1042#1088#1077#1084#1103
          ImageIndex = 1
          object DateTimePicker3: TDateTimePicker
            Left = 16
            Top = 14
            Width = 163
            Height = 24
            Date = 38782.333333333340000000
            Time = 38782.333333333340000000
            Kind = dtkTime
            TabOrder = 0
          end
          object DateTimePicker4: TDateTimePicker
            Left = 16
            Top = 50
            Width = 163
            Height = 24
            Date = 38782.333333333340000000
            Time = 38782.333333333340000000
            Kind = dtkTime
            TabOrder = 1
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1042#1099#1073#1086#1088#1082#1072
      ImageIndex = 1
      OnShow = TabSheet2Show
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 248
        Height = 243
        Align = alClient
        DataSource = ReportDM.AllTaxSummDS
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'pozyvnoi'
            Title.Caption = #1055#1086#1079#1099#1074#1085#1086#1081
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'imya'
            Title.Caption = #1048#1084#1103
            Width = 300
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 243
        Width = 248
        Height = 25
        DataSource = ReportDM.AllTaxSummDS
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbCancel]
        Align = alBottom
        TabOrder = 1
      end
    end
  end
  object CheckBox2: TCheckBox
    Left = 8
    Top = 304
    Width = 233
    Height = 17
    Caption = #1053#1077' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1085#1072#1077#1084#1085#1099#1093' '#1074#1086#1076#1080#1090#1077#1083#1077#1081
    TabOrder = 2
  end
  object CheckBox3: TCheckBox
    Left = 8
    Top = 328
    Width = 233
    Height = 17
    Caption = #1053#1077' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1089#1090#1072#1078#1077#1088#1086#1074
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 352
    Width = 225
    Height = 17
    Caption = #1053#1077' '#1074#1099#1074#1086#1076#1080#1090#1100' '#1085#1091#1083#1077#1074#1099#1093
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object CalcSMSCheckBox: TCheckBox
    Left = 8
    Top = 376
    Width = 233
    Height = 17
    Caption = #1057#1095#1080#1090#1072#1090#1100' SMS'
    TabOrder = 5
  end
end
