object ReleaseStructForm: TReleaseStructForm
  Left = 0
  Top = 0
  AutoScroll = False
  Caption = 
    ' (F2-'#1072#1088#1093#1080#1074' ('#1089#1087#1088#1072#1074'.), F5-'#1087#1086#1076#1090#1074'. '#1086#1090#1095#1077#1090#1072' '#1080#1083#1080' '#1079#1072#1087#1088#1086#1089#1072', F7, Insert-'#1085#1086 +
    #1074'.'#1079#1072#1082#1072#1079', F8-'#1085#1086#1074'. '#1089'  '#1085#1086#1084'. '#1072#1073'-'#1090#1072', F11->'#1076#1080#1089#1087'. '#1086#1073' '#1080#1079#1084'.)'
  ClientHeight = 574
  ClientWidth = 875
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Enabled = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010002002020100001000400E80200002600000010101000010004002801
    00000E0300002800000020000000400000000100040000000000800200000000
    0000000000000000000000000000000000000000800000800000008080008000
    0000800080008080000080808000C0C0C0000000FF0000FF000000FFFF00FF00
    0000FF00FF00FFFF0000FFFFFF00000000000000000000000000000000000088
    88888888888888800000000000000000000000000000008000000000000007FF
    FFFFFFFFFFFFF08000000000000007FFFFFFFFFFFFFFF08000000000000007FF
    444F4444447FF08000000000000007FFFFFFFFFFFFF8808888888888888007FF
    444F44444400000000000000008007FFFFFFFFFFFF7FFFFFFFFFFFFFF08007FF
    444F4444447F770003737377F08007FFFFFFFFFFFF7F370A07373737F08007FF
    444F4444447F730A03737377F08007FFFFFFFFFFFF7F370A07773773F08007FF
    444F4444447F000AA0000000F08007FFFFFFFFFFFF7FE0AAAA0EEEEEF08007FF
    444F4444447F0AAA0AA0EEEEF08007FFFFFFFFFFFF7F0A0A00A0EE00F08007FF
    FFFFFFFFFF7FE00A0E0EE0BBF080077777777777777FEEEA0EEEE0BBF0800000
    07F8F8F8F87FEEE0EEEEEE00F0800000078F77777F7FFFFFFFFFFFFFF0800000
    07F8F8F8F87777777777777770000000078F8F8F8F8F8F8F8F8F080000000000
    07F8F8F8F8F888888888080000000000078F77777F87FFFFFF8F080000000000
    07F8F8F8F8F777777788080000000000078F8F8F8F8F8F8F8F8F080000000000
    07F8F8F8F8F8F8F8F8F808000000000004444444444444444444480000000000
    0444444444444444444440000000000004444444444444444444400000000000
    0000000000000000000000000000FFFFFFFFC0001FFF80001FFF80001FFF8000
    1FFF80001FFF8000000180000001800000018000000180000001800000018000
    0001800000018000000180000001800000018000000180000001F8000001F800
    0001F8000003F800003FF800003FF800003FF800003FF800003FF800003FF800
    003FF800007FF800007FFFFFFFFF280000001000000020000000010004000000
    0000C00000000000000000000000000000000000000000000000000080000080
    00000080800080000000800080008080000080808000C0C0C0000000FF0000FF
    000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
    000000000000078888888000000007FFFFFF8000000007F7F7F00000000007FF
    FFF13131310007F7F7F38777830007FFFFF18778E10007777773E8EEE300007F
    8881EEEBB100007FF883EEEBB300007FFFF13131310000444444440000000044
    44444400000000000000000000000000000000000000FFFF0000803F0000803F
    0000803F00008001000080010000800100008001000080010000C0010000C001
    0000C0010000C01F0000C01F0000FFFF0000FFFF0000}
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 875
    Height = 555
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinHeight = 150
    TabOrder = 0
    object Splitter3: TSplitter
      Left = 0
      Top = 461
      Width = 875
      Height = 7
      Cursor = crVSplit
      Align = alBottom
      Color = clMedGray
      ParentColor = False
    end
    object MainPanel: TPanel
      Left = 0
      Top = 0
      Width = 875
      Height = 461
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 185
        Top = 0
        Width = 6
        Height = 461
        Color = clMedGray
        ParentColor = False
      end
      object Panel2: TPanel
        Left = 191
        Top = 0
        Width = 684
        Height = 461
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 684
          Height = 0
          Align = alTop
          Color = clBtnFace
          Ctl3D = False
          Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Visible = False
          Columns = <
            item
              Expanded = False
              FieldName = 'naimenovanie'
              Width = 151
              Visible = True
            end>
        end
        object PageControl5: TPageControl
          Left = 0
          Top = 0
          Width = 684
          Height = 461
          ActivePage = DispModeTabSheet
          Align = alClient
          TabOrder = 1
          object DispModeTabSheet: TTabSheet
            Caption = 'DispModeTabSheet'
            TabVisible = False
            object Splitter4: TSplitter
              Left = 0
              Top = 326
              Width = 676
              Height = 10
              Cursor = crVSplit
              Align = alBottom
              Color = clMedGray
              ParentColor = False
            end
            object DispModePanel: TPanel
              Left = 0
              Top = 0
              Width = 676
              Height = 326
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object sPanel1: TPanel
                Left = 0
                Top = 68
                Width = 676
                Height = 258
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 0
                Visible = False
                object Panel6: TPanel
                  Left = 0
                  Top = 217
                  Width = 676
                  Height = 41
                  Align = alBottom
                  BevelOuter = bvNone
                  TabOrder = 0
                  object Label5: TLabel
                    Left = 576
                    Top = 16
                    Width = 37
                    Height = 16
                    Caption = 'Label5'
                  end
                  object sLabel6: TLabel
                    Left = 8
                    Top = 14
                    Width = 163
                    Height = 19
                    Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1087#1086#1079#1099#1074#1085#1086#1084#1091
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object sLabel7: TLabel
                    Left = 248
                    Top = 14
                    Width = 154
                    Height = 19
                    Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1077#1083#1077#1092#1086#1085#1091
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object sEdit4: TEdit
                    Left = 176
                    Top = 8
                    Width = 65
                    Height = 27
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnKeyDown = sEdit4KeyDown
                  end
                  object sEdit5: TEdit
                    Left = 408
                    Top = 6
                    Width = 153
                    Height = 27
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 1
                    OnKeyDown = sEdit5KeyDown
                  end
                end
                object EndedCustDBGrid: TDBGrid
                  Left = 0
                  Top = 41
                  Width = 676
                  Height = 176
                  Align = alClient
                  Ctl3D = False
                  DataSource = ADOConnectDM.dsEndedCust
                  FixedColor = clMoneyGreen
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -21
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = []
                  Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                  ParentCtl3D = False
                  ParentFont = False
                  PopupMenu = ADOConnectDM.EndedPopupMenu
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -13
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = EndedCustDBGridDrawColumnCell
                  OnTitleClick = EndedCustDBGridTitleClick
                  Columns = <
                    item
                      Expanded = False
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -21
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ReadOnly = True
                      Width = 50
                      Visible = True
                    end
                    item
                      Color = clMoneyGreen
                      Expanded = False
                      FieldName = 'Nomer_zakaza'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clGreen
                      Font.Height = -21
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = #8470
                      Width = 63
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Telefon_klienta'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -21
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      Title.Caption = #1058#1077#1083#1077#1092#1086#1085' '#1082#1083#1080#1077#1085#1090#1072
                      Width = 115
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Adres_vyzova_vvodim'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clGradientActiveCaption
                      Font.Height = -21
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      Title.Caption = #1040#1076#1088#1077#1089' '#1074#1099#1079#1086#1074#1072
                      Width = 237
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'Nachalo_zakaza_data'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clOlive
                      Font.Height = -21
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = #1053#1040#1063#1040#1051#1054
                      Width = 100
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'Konec_zakaza_data'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clOlive
                      Font.Height = -21
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = #1050#1054#1053#1045#1062
                      Width = 100
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Color = clSkyBlue
                      Expanded = False
                      FieldName = 'Pozyvnoi_ustan'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -21
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = #1055#1054#1047#1067#1042#1053#1054#1049
                      Title.Color = clSkyBlue
                      Width = 80
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Color = clMoneyGreen
                      Expanded = False
                      FieldName = 'Uslovn_stoim'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clGradientActiveCaption
                      Font.Height = -21
                      Font.Name = 'Tahoma'
                      Font.Style = []
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = #1054#1058#1063#1025#1058
                      Width = 70
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'tmhistory'
                      Title.Caption = #1044#1077#1090#1072#1083#1080' '#1090#1072#1082#1089#1086#1084#1077#1090#1088#1072
                      Visible = True
                    end>
                end
                object TopEndCPanel: TPanel
                  Left = 0
                  Top = 0
                  Width = 676
                  Height = 41
                  Align = alTop
                  BevelOuter = bvNone
                  TabOrder = 2
                  object sLabel2: TLabel
                    Left = 8
                    Top = 16
                    Width = 152
                    Height = 19
                    Caption = #1047#1072#1103#1074#1082#1080' '#1079#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1077
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label2: TLabel
                    Left = 240
                    Top = 14
                    Width = 41
                    Height = 19
                    Caption = #1095#1072#1089#1086#1074
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label3: TLabel
                    Left = 368
                    Top = 14
                    Width = 35
                    Height = 19
                    Caption = #1076#1085#1077#1081
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label4: TLabel
                    Left = 480
                    Top = 14
                    Width = 58
                    Height = 19
                    Caption = #1084#1077#1089#1103#1094#1077#1074
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object OnlySpecCustCheckBox: TCheckBox
                    Left = 504
                    Top = 16
                    Width = 113
                    Height = 17
                    Caption = #1057#1083#1091#1078#1077#1073#1085#1099#1077
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    OnClick = OnlySpecCustCheckBoxClick
                  end
                  object UpDown3: TUpDown
                    Left = 457
                    Top = 8
                    Width = 16
                    Height = 27
                    Associate = sEdit3
                    Max = 10000
                    TabOrder = 1
                    OnClick = UpDown3Click
                  end
                  object UpDown2: TUpDown
                    Left = 337
                    Top = 6
                    Width = 16
                    Height = 27
                    Associate = sEdit2
                    Max = 31
                    TabOrder = 2
                    OnClick = UpDown2Click
                  end
                  object UpDown1: TUpDown
                    Left = 217
                    Top = 6
                    Width = 16
                    Height = 27
                    Associate = sEdit1
                    Min = 1
                    Max = 23
                    Position = 3
                    TabOrder = 3
                    OnClick = UpDown1Click
                  end
                  object sEdit3: TEdit
                    Left = 408
                    Top = 8
                    Width = 49
                    Height = 27
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 4
                    Text = '0'
                  end
                  object sEdit2: TEdit
                    Left = 288
                    Top = 6
                    Width = 49
                    Height = 27
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 5
                    Text = '0'
                  end
                  object sEdit1: TEdit
                    Left = 168
                    Top = 6
                    Width = 49
                    Height = 27
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -16
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 6
                    Text = '3'
                  end
                end
              end
              object TopOrdersPanel: TPanel
                Left = 0
                Top = 0
                Width = 676
                Height = 32
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object DBText1: TDBText
                  Left = 0
                  Top = 0
                  Width = 676
                  Height = 33
                  Align = alTop
                  Color = clBtnFace
                  DataField = 'MainCComment'
                  DataSource = ADOConnectDM.dsActiveCust
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -24
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end
              end
              object DispDBGrid: TDBGrid
                Left = 0
                Top = 32
                Width = 676
                Height = 36
                Align = alClient
                Ctl3D = False
                DataSource = ADOConnectDM.dsActiveCust
                FixedColor = clMoneyGreen
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Microsoft Sans Serif'
                Font.Style = []
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
                ParentFont = False
                PopupMenu = ADOConnectDM.DispCustToArhivePopupMenu
                TabOrder = 2
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -13
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnCellClick = DispDBGridCellClick
                OnColEnter = DispDBGridColEnter
                OnColExit = DispDBGridColExit
                OnColumnMoved = DispDBGridColumnMoved
                OnDrawColumnCell = DispDBGridDrawColumnCell
                OnDblClick = DispDBGridDblClick
                OnKeyDown = DispDBGridKeyDown
                OnMouseDown = DispDBGridMouseDown
                Columns = <
                  item
                    Expanded = False
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -21
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ReadOnly = True
                    Width = 50
                    Visible = True
                  end
                  item
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'Nomer_zakaza'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -21
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ReadOnly = True
                    Title.Alignment = taCenter
                    Title.Caption = #8470
                    Width = 63
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Telefon_klienta'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -21
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Title.Caption = #1058#1077#1083#1077#1092#1086#1085' '#1082#1083#1080#1077#1085#1090#1072
                    Width = 112
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Region'
                    Title.Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DISTRICT_LOOK'
                    Title.Caption = #1056#1072#1081#1086#1085' '#1074#1099#1079#1086#1074#1072
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Adres_vyzova_vvodim'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -21
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Title.Caption = #1040#1076#1088#1077#1089' '#1074#1099#1079#1086#1074#1072
                    Width = 211
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'start_dt'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -21
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #1053#1040#1063#1040#1051#1054
                    Width = 80
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Color = clSkyBlue
                    Expanded = False
                    FieldName = 'Pozyvnoi_ustan'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Height = -21
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #1055#1054#1047#1067#1042#1053#1054#1049
                    Title.Color = clSkyBlue
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Primechanie'
                    Title.Caption = 'C'#1077#1082#1090#1086#1088
                    Width = 80
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Color = clMoneyGreen
                    Expanded = False
                    FieldName = 'Uslovn_stoim'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -21
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #1054#1058#1063#1025#1058
                    Width = 70
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'end_dt'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Height = -21
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Title.Alignment = taCenter
                    Title.Caption = #1054#1050#1054#1053#1063#1040#1053#1048#1045
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TPLAN_LOOK'
                    Title.Caption = #1058#1072#1088'. '#1087#1083#1072#1085
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OTAR_LOOK'
                    Title.Caption = #1058#1072#1088#1080#1092
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OPT_COMB_STR'
                    Title.Caption = #1054#1087#1094#1080#1080
                    Width = 45
                    Visible = True
                  end
                  item
                    Color = clRed
                    Expanded = False
                    FieldName = 'REMOTE_INSTR'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clYellow
                    Font.Height = -21
                    Font.Name = 'Microsoft Sans Serif'
                    Font.Style = []
                    Title.Caption = 'Internet-'#1089#1090#1072#1090#1091#1089', '#1076#1077#1081#1089#1090#1074#1080#1103' '#1089' JAVA2ME-'#1082#1083#1080#1077#1085#1090#1072#1084#1080
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SendSMSCustComment'
                    Title.Caption = 'SMS '#1054#1090#1087#1088#1072#1074#1082#1072
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'tmhistory'
                    Title.Caption = #1044#1077#1090#1072#1083#1080' '#1090#1072#1082#1089#1086#1084#1077#1090#1088#1072
                    Visible = True
                  end>
              end
              object FEditor: TDBComboBox
                Left = 216
                Top = 40
                Width = 145
                Height = 33
                AutoComplete = False
                AutoDropDown = True
                Ctl3D = False
                DataField = 'Adres_vyzova_vvodim'
                DataSource = ADOConnectDM.dsActiveCust
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -21
                Font.Name = 'Tahoma'
                Font.Style = []
                ItemHeight = 25
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 3
                Visible = False
                OnKeyDown = FEditorKeyDown
              end
            end
            object AdditDispPageControl: TPageControl
              Left = 0
              Top = 336
              Width = 676
              Height = 115
              ActivePage = TabSheet5
              Align = alBottom
              TabOrder = 1
              TabPosition = tpBottom
              object sTabSheet4: TTabSheet
                Caption = #1044#1080#1089#1082#1086#1085#1090
                object DBText2: TDBText
                  Left = 8
                  Top = 54
                  Width = 585
                  Height = 14
                  DataField = 'INumInfo'
                  DataSource = ADOConnectDM.dsActiveCust
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Visible = False
                end
                object sLabel1: TLabel
                  Left = 8
                  Top = -2
                  Width = 161
                  Height = 19
                  Caption = #1055#1088#1080#1079#1086#1074#1086#1077' '#1085#1072#1082#1086#1087#1083#1077#1085#1080#1077
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -16
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Gauge: TProgressBar
                  Left = 8
                  Top = 19
                  Width = 585
                  Height = 33
                  TabOrder = 0
                end
              end
              object TabSheet5: TTabSheet
                Caption = #1044#1086#1087'. '#1093#1072#1088#1072#1082#1090#1077#1088#1080#1089#1090#1080#1082#1080
                ImageIndex = 10
                object Label6: TLabel
                  Left = 8
                  Top = 0
                  Width = 90
                  Height = 16
                  Caption = #1061#1072#1088#1072#1082#1090#1077#1088' '#1075#1088#1091#1079#1072
                end
                object Label7: TLabel
                  Left = 8
                  Top = 40
                  Width = 104
                  Height = 16
                  Caption = #1055#1088#1077#1076#1074'. '#1089#1090#1086#1080#1084#1086#1089#1090#1100
                end
                object Label8: TLabel
                  Left = 128
                  Top = 40
                  Width = 116
                  Height = 16
                  Caption = #1055#1088#1077#1076#1074'. '#1082#1080#1083#1086#1084#1077#1090#1088#1072#1078
                end
                object Label9: TLabel
                  Left = 264
                  Top = 0
                  Width = 41
                  Height = 16
                  Caption = #1050#1083#1080#1077#1085#1090
                end
                object Label10: TLabel
                  Left = 384
                  Top = 0
                  Width = 108
                  Height = 16
                  Caption = #1040#1076#1088#1077#1089' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
                end
                object Label11: TLabel
                  Left = 536
                  Top = 0
                  Width = 43
                  Height = 16
                  Caption = #1055#1086#1076#1072#1095#1072
                end
                object Label12: TLabel
                  Left = 264
                  Top = 64
                  Width = 53
                  Height = 16
                  Caption = #1041#1086#1085#1091#1089#1086#1074':'
                end
                object Label13: TLabel
                  Left = 384
                  Top = 64
                  Width = 72
                  Height = 16
                  Caption = #1048#1089#1087#1086#1083#1100#1079#1091#1077#1090':'
                end
                object DBText9: TDBText
                  Left = 320
                  Top = 64
                  Width = 57
                  Height = 17
                  DataField = 'bonus_all'
                  DataSource = ADOConnectDM.dsActiveCust
                end
                object DBEdit1: TDBEdit
                  Left = 8
                  Top = 16
                  Width = 249
                  Height = 22
                  Ctl3D = False
                  DataField = 'cargo_desc'
                  DataSource = ADOConnectDM.dsActiveCust
                  ParentCtl3D = False
                  TabOrder = 0
                end
                object DBEdit2: TDBEdit
                  Left = 8
                  Top = 56
                  Width = 113
                  Height = 22
                  Ctl3D = False
                  DataField = 'prev_price'
                  DataSource = ADOConnectDM.dsActiveCust
                  ParentCtl3D = False
                  TabOrder = 1
                end
                object DBEdit3: TDBEdit
                  Left = 128
                  Top = 56
                  Width = 129
                  Height = 22
                  Ctl3D = False
                  DataField = 'prev_distance'
                  DataSource = ADOConnectDM.dsActiveCust
                  ParentCtl3D = False
                  TabOrder = 2
                end
                object DBEdit4: TDBEdit
                  Left = 264
                  Top = 16
                  Width = 113
                  Height = 22
                  Ctl3D = False
                  DataField = 'client_name'
                  DataSource = ADOConnectDM.dsActiveCust
                  ParentCtl3D = False
                  TabOrder = 3
                end
                object DBEdit5: TDBEdit
                  Left = 384
                  Top = 16
                  Width = 145
                  Height = 22
                  Ctl3D = False
                  DataField = 'end_adres'
                  DataSource = ADOConnectDM.dsActiveCust
                  ParentCtl3D = False
                  TabOrder = 4
                end
                object DBNavigator1: TDBNavigator
                  Left = 568
                  Top = 56
                  Width = 97
                  Height = 25
                  DataSource = ADOConnectDM.dsActiveCust
                  VisibleButtons = [nbPost]
                  TabOrder = 5
                end
                object DBEdit6: TDBEdit
                  Left = 536
                  Top = 16
                  Width = 129
                  Height = 22
                  Ctl3D = False
                  DataField = 'Data_predvariteljnaya'
                  DataSource = ADOConnectDM.dsActiveCust
                  ParentCtl3D = False
                  TabOrder = 6
                end
                object DBEdit7: TDBEdit
                  Left = 464
                  Top = 56
                  Width = 65
                  Height = 22
                  Ctl3D = False
                  DataField = 'bonus_use'
                  DataSource = ADOConnectDM.dsActiveCust
                  ParentCtl3D = False
                  TabOrder = 7
                end
              end
              object sTabSheet6: TTabSheet
                Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
                ImageIndex = 1
                object DBMemo1: TDBMemo
                  Left = 0
                  Top = 0
                  Width = 668
                  Height = 86
                  Align = alClient
                  Ctl3D = False
                  DataField = 'Primechanie'
                  DataSource = ADOConnectDM.dsActiveCust
                  ParentCtl3D = False
                  TabOrder = 0
                end
              end
              object LastWeekIndOrdTabSheet: TTabSheet
                Caption = #1048#1089#1090#1086#1088#1080#1103' '#1072#1073'. '#1085#1086#1084#1077#1088#1072
                ImageIndex = 2
                object DBGrid2: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 668
                  Height = 86
                  Align = alClient
                  DataSource = ADOConnectDM.dsLastWeekIndOrd
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -13
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDrawColumnCell = DBGrid2DrawColumnCell
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Nachalo_zakaza_data'
                      Title.Caption = #1053#1072#1095#1072#1083#1086' '#1079#1072#1082#1072#1079#1072
                      Width = 128
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Telefon_klienta'
                      Title.Caption = #1058#1077#1083#1077#1092#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088
                      Width = 200
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Adres_vyzova_vvodim'
                      Title.Caption = #1040#1076#1088#1077#1089
                      Width = 361
                      Visible = True
                    end>
                end
              end
              object AbNumberImportTabSheet: TTabSheet
                Caption = #1048#1084#1087#1086#1088#1090' '#1072#1073'. '#1085#1086#1084#1077#1088#1086#1074
                ImageIndex = 3
                TabVisible = False
                object DBGrid3: TDBGrid
                  Left = 105
                  Top = 0
                  Width = 492
                  Height = 76
                  Align = alClient
                  Ctl3D = False
                  DataSource = ADOConnectDM.AbNumbersImportDS
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
                      FieldName = 'Familiya'
                      Title.Caption = #1060#1072#1084#1080#1083#1080#1103
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Imya'
                      Title.Caption = #1048#1084#1103
                      Width = 70
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Otchestvo'
                      Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Dom'
                      Title.Caption = #1042#1099#1079#1086#1074#1099
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Korpus'
                      Title.Caption = #1040#1073'. '#1085#1086#1084#1077#1088
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Rabochii_telefon'
                      Title.Caption = #1058#1077#1083#1077#1092#1086#1085
                      Width = 80
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Ulica'
                      Title.Caption = #1040#1076#1088#1077#1089
                      Visible = True
                    end>
                end
                object Panel5: TPanel
                  Left = 0
                  Top = 0
                  Width = 105
                  Height = 76
                  Align = alLeft
                  BevelOuter = bvNone
                  TabOrder = 1
                  object BitBtn4: TBitBtn
                    Left = 8
                    Top = 8
                    Width = 89
                    Height = 25
                    Caption = #1048#1084#1087#1086#1088#1090
                    TabOrder = 0
                    OnClick = BitBtn4Click
                  end
                end
              end
              object TabSheet2: TTabSheet
                Caption = #1058#1077#1089#1090#1086#1074#1099#1081
                ImageIndex = 4
                TabVisible = False
                object DBGrid4: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 597
                  Height = 76
                  Align = alClient
                  Ctl3D = False
                  DataSource = ReportDM.DrStatesDS
                  ParentCtl3D = False
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -13
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                end
              end
              object PretendsTabSheet: TTabSheet
                Caption = #1055#1088#1077#1090#1077#1085#1076#1077#1085#1090#1099
                ImageIndex = 5
                object PretendsDBGrid: TDBGrid
                  Left = 0
                  Top = 0
                  Width = 668
                  Height = 86
                  Align = alClient
                  Ctl3D = False
                  DataSource = ADOConnectDM.dsOrdersOccupAtts
                  ParentCtl3D = False
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -13
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDblClick = PretendsDBGridDblClick
                  OnKeyDown = PretendsDBGridKeyDown
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'ACCEPT_DATE'
                      Title.Caption = #1044#1072#1090#1072'-'#1074#1088#1077#1084#1103' '#1087#1086#1076#1072#1095#1080
                      Width = 169
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DRIVER_NUM'
                      Title.Caption = #1055#1086#1079#1099#1074#1085#1086#1081
                      Width = 71
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COMMENT'
                      Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
                      Width = 313
                      Visible = True
                    end>
                end
              end
              object ImportCallPhonesTabSheet: TTabSheet
                Caption = 'ImportCallPhonesTabSheet'
                ImageIndex = 6
                TabVisible = False
                object Panel7: TPanel
                  Left = 0
                  Top = 0
                  Width = 113
                  Height = 76
                  Align = alLeft
                  BevelOuter = bvNone
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 0
                  object BitBtn1: TBitBtn
                    Left = 8
                    Top = 8
                    Width = 97
                    Height = 25
                    Caption = #1048#1084#1087#1086#1088#1090
                    TabOrder = 0
                    OnClick = BitBtn1Click
                  end
                end
                object DBGrid5: TDBGrid
                  Left = 113
                  Top = 0
                  Width = 484
                  Height = 76
                  Align = alClient
                  DataSource = ADOConnectDM.CallPhonesImportDS
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -13
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'BOLD_ID'
                      Title.Caption = #1048#1044
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Telefon_klienta'
                      Title.Caption = #1058#1077#1083#1077#1092#1086#1085
                      Width = 100
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Adres_vyzova_vvodim'
                      Title.Caption = #1040#1076#1088#1077#1089
                      Width = 169
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'otnositsya_k_sektoru'
                      Title.Caption = #1048#1044' '#1057#1077#1082#1090#1086#1088#1072
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Summarn_chislo_vyzovov'
                      Title.Caption = #1063#1080#1089#1083#1086' '#1074#1099#1079#1086#1074#1086#1074
                      Width = 97
                      Visible = True
                    end>
                end
              end
              object OrderOptionTabSheet: TTabSheet
                Caption = #1054#1087#1094#1080#1080' '#1079#1072#1082#1072#1079#1072
                ImageIndex = 7
                TabVisible = False
                object Panel8: TPanel
                  Left = 0
                  Top = 0
                  Width = 97
                  Height = 86
                  Align = alLeft
                  BevelOuter = bvNone
                  TabOrder = 0
                  object SaveOOptsBitBtn: TBitBtn
                    Left = 8
                    Top = 8
                    Width = 75
                    Height = 25
                    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
                    TabOrder = 0
                    OnClick = SaveOOptsBitBtnClick
                  end
                end
                object DBGrid6: TDBGrid
                  Left = 97
                  Top = 0
                  Width = 500
                  Height = 86
                  Align = alClient
                  Ctl3D = False
                  DataSource = ADOConnectDM.OrderOptSetDS
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -13
                  TitleFont.Name = 'Tahoma'
                  TitleFont.Style = []
                  OnDblClick = DBGrid6DblClick
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'OrderOptionsNameCDSF'
                      Title.Caption = #1054#1087#1094#1080#1103
                      Width = 200
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'OrderOptHasIntCDSF'
                      Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
                      Visible = True
                    end>
                end
              end
              object TabSheet3: TTabSheet
                Caption = #1056#1077#1081#1090#1080#1085#1075' '#1079#1072#1088#1072#1073#1086#1090#1082#1072
                ImageIndex = 8
                object DBCtrlGrid2: TDBCtrlGrid
                  Left = 0
                  Top = 0
                  Width = 660
                  Height = 86
                  Align = alClient
                  ColCount = 15
                  DataSource = ADOConnectDM.DrWrkRatingsDS
                  Orientation = goHorizontal
                  PanelHeight = 70
                  PanelWidth = 44
                  TabOrder = 0
                  RowCount = 1
                  SelectedColor = clSkyBlue
                  object DBText5: TDBText
                    Left = 2
                    Top = 8
                    Width = 43
                    Height = 25
                    DataField = 'Pozyvnoi'
                    DataSource = ADOConnectDM.DrWrkRatingsDS
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -20
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    ParentFont = False
                  end
                  object DBText6: TDBText
                    Left = 2
                    Top = 32
                    Width = 65
                    Height = 17
                    DataField = 'dt'
                    DataSource = ADOConnectDM.DrWrkRatingsDS
                  end
                  object DBText7: TDBText
                    Left = 2
                    Top = 48
                    Width = 65
                    Height = 17
                    DataField = 'tm'
                    DataSource = ADOConnectDM.DrWrkRatingsDS
                  end
                  object DBText8: TDBText
                    Left = 45
                    Top = 16
                    Width = 65
                    Height = 17
                    DataField = 'DRIVER_RATING'
                    DataSource = ADOConnectDM.DrWrkRatingsDS
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clMenuHighlight
                    Font.Height = -13
                    Font.Name = 'Tahoma'
                    Font.Style = [fsBold, fsUnderline]
                    ParentFont = False
                  end
                end
              end
              object TabSheet4: TTabSheet
                Caption = #1044#1077#1090#1072#1083#1080' '#1090#1072#1082#1089#1086#1084#1077#1090#1088#1072
                ImageIndex = 9
                object DBMemo3: TDBMemo
                  Left = 0
                  Top = 0
                  Width = 668
                  Height = 86
                  Align = alClient
                  Ctl3D = False
                  DataField = 'tmhistory'
                  DataSource = ADOConnectDM.dsActiveCust
                  ParentCtl3D = False
                  TabOrder = 0
                end
              end
            end
          end
          object StartTabSheet: TTabSheet
            Caption = 'StartTabSheet'
            ImageIndex = 2
            TabVisible = False
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 605
              Height = 447
              Align = alClient
              BevelOuter = bvNone
              Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077'...'
              TabOrder = 0
            end
          end
        end
      end
      object LeftPageControl: TPageControl
        Left = 0
        Top = 0
        Width = 185
        Height = 461
        ActivePage = TabSheet1
        Align = alLeft
        Constraints.MinWidth = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Images = ImageListsDM.DriversPanelImageList
        MultiLine = True
        ParentFont = False
        TabOrder = 1
        TabPosition = tpBottom
        object TabSheet1: TTabSheet
          Caption = #1057#1086#1073#1099#1090#1080#1103
          object DBCtrlGrid1: TDBCtrlGrid
            Left = 0
            Top = 48
            Width = 177
            Height = 357
            Align = alClient
            AllowDelete = False
            AllowInsert = False
            DataSource = ADOConnectDM.ActiveEventsDS
            PanelHeight = 71
            PanelWidth = 161
            PopupMenu = PopUpDM.EventsPopupMenu
            TabOrder = 0
            RowCount = 5
            object DBMemo2: TDBMemo
              Left = 0
              Top = 25
              Width = 161
              Height = 46
              Align = alClient
              Ctl3D = False
              DataField = 'DESCRIPT'
              DataSource = ADOConnectDM.ActiveEventsDS
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 161
              Height = 25
              Align = alTop
              TabOrder = 1
              object Label1: TLabel
                Left = 104
                Top = 8
                Width = 24
                Height = 13
                Caption = #1055#1086#1079'.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText4: TDBText
                Left = 4
                Top = 8
                Width = 95
                Height = 17
                DataField = 'CDATE'
                DataSource = ADOConnectDM.ActiveEventsDS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DBText3: TDBText
                Left = 128
                Top = 8
                Width = 25
                Height = 17
                DataField = 'DR_NUM'
                DataSource = ADOConnectDM.ActiveEventsDS
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
            end
          end
          object Memo1: TMemo
            Left = 0
            Top = 0
            Width = 177
            Height = 48
            Align = alTop
            Color = clBtnFace
            Ctl3D = False
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              #1044#1083#1103' '#1079#1072#1082#1088#1099#1090#1080#1103' '
              #1089#1086#1073#1099#1090#1080#1081'/'#1079#1074#1091#1082#1086#1074' '#1085#1072#1078#1084#1080#1090#1077' '
              #1087#1088#1072#1074#1086#1081' '#1082#1085#1086#1087#1082#1086#1081' '#1087#1086' '#1085#1080#1084)
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
        end
        object SectorsTabSheet: TTabSheet
          Caption = #1057#1077#1082#1090#1086#1088#1072
          ImageIndex = 2
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 177
            Height = 405
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Panel17: TPanel
              Left = 0
              Top = 369
              Width = 177
              Height = 36
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              object OnLanchOnTreeBitBtn: TBitBtn
                Left = 8
                Top = 8
                Width = 81
                Height = 25
                Caption = #1055#1077#1088#1077#1088#1099#1074
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = OnLanchOnTreeBitBtnClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333FF3333333333333003333333333333377F333333333333
                  30003FFFFFFFFFFFF77707777777777777707777777777777777033333333333
                  33307FFFFFFFFFFFFFF707777777700777707777777777777777030333333000
                  33307F7FFFFFF777FFF707770077777077707777777777777777030300033330
                  33307F7F777FFFF7FFF707777707777077777777777777777777033333033330
                  33337FFFFF7FFFF7FFFF07777707777077777777777777777777333333000000
                  3333333333777777F33333333303333033333333337FFFF7F333333333000000
                  3333333333777777333333333333333333333333333333333333}
                NumGlyphs = 2
              end
              object BitBtn3: TBitBtn
                Left = 96
                Top = 8
                Width = 81
                Height = 25
                Caption = #1057#1085#1103#1090#1100
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnClick = BitBtn3Click
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  04000000000000010000120B0000120B00001000000000000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
                  0EEE333377777777777733330FF00FBFB0EE33337F37733F377733330F0BFB0B
                  FB0E33337F73FF73337733330FF000BFBFB033337F377733333733330FFF0BFB
                  FBF033337FFF733F333733300000BF0FBFB03FF77777F3733F37000FBFB0F0FB
                  0BF077733FF7F7FF7337E0FB00000000BF0077F377777777F377E0BFBFBFBFB0
                  F0F077F3333FFFF7F737E0FBFB0000000FF077F3337777777337E0BFBFBFBFB0
                  FFF077F3333FFFF73FF7E0FBFB00000F000077FF337777737777E00FBFBFB0FF
                  0FF07773FFFFF7337F37003000000FFF0F037737777773337F7333330FFFFFFF
                  003333337FFFFFFF773333330000000003333333777777777333}
                NumGlyphs = 2
              end
            end
            object BoldTreeView1: TBoldTreeView
              Left = 0
              Top = 0
              Width = 177
              Height = 369
              Align = alClient
              AutoExpandLevels = 2
              BoldHandle = BoldModelDM.bsh
              BoldProperties.Parts = <
                item
                  ElementExpression = 'Sektor_raboty.allInstances->orderby(podskazka_na_sektore)'
                  ControllerExpression = 'self.oclType'
                  InterpretAsList = True
                end>
              BoldProperties.NodeDescriptions = <
                item
                  Name = 'Sektor_raboty'
                  ContextTypeName = 'Sektor_raboty'
                  HideNodeWithNoChildren = False
                  ListController.Parts = <
                    item
                      ElementExpression = 
                        'self.yavl_sekt_raboty_dlya->select(v_rabote and not s_klass)->or' +
                        'derby(vremya_poslednei_zayavki)'
                      ControllerExpression = 'self.oclType'
                      InterpretAsList = True
                    end>
                  IconController.Expression = '0'
                  TextController.Expression = 'naimenovanie'
                  TextController.Renderer = BoldOthHandleCompDM.basrTreeSectionNode
                end
                item
                  Name = 'Voditelj'
                  ContextTypeName = 'Voditelj'
                  HideNodeWithNoChildren = False
                  ListController.Parts = <>
                  IconController.Expression = '-1'
                  IconController.Renderer = FirstForm.bairDrIcon
                  TextController.Renderer = FirstForm.basrDrList
                end>
              Ctl3D = False
              DragMode = dmAutomatic
              Images = ImageListsDM.SectorTreeImageList
              Indent = 19
              ParentCtl3D = False
              SelectedIndexDelta = 0
              SelectInserted = False
              TabOrder = 1
              OnClick = BoldTreeView1Click
              OnDragDrop = BoldTreeView1DragDrop
              OnDragOver = BoldTreeView1DragOver
              OnEndDrag = BoldTreeView1EndDrag
              OnStartDrag = BoldTreeView1StartDrag
            end
          end
        end
      end
    end
    object StacksPanel: TPanel
      Left = 0
      Top = 468
      Width = 875
      Height = 87
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object DrStackStringGrid: TStringGrid
        Left = 0
        Top = 0
        Width = 875
        Height = 87
        Align = alClient
        Ctl3D = False
        DefaultColWidth = 40
        DefaultRowHeight = 35
        FixedCols = 0
        RowCount = 2
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -33
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Visible = False
        OnClick = DrStackStringGridClick
        OnDblClick = DrStackStringGridDblClick
        OnDrawCell = DrStackStringGridDrawCell
      end
    end
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 555
    Width = 875
    Height = 19
    Panels = <
      item
        Text = #1053#1077#1090' '#1085#1080' '#1086#1076#1085#1086#1075#1086' '#1088#1072#1073#1086#1090#1072#1102#1097#1077#1075#1086' '#1074#1086#1076#1080#1090#1077#1083#1103
        Width = 360
      end
      item
        Text = #1053#1077#1090' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1079#1072#1082#1072#1079#1072
        Width = 180
      end
      item
        Text = #1053#1077#1090' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1079#1072#1082#1072#1079#1072
        Width = 400
      end
      item
        Text = #1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1105#1085' '#1085#1072#1095'. '#1089#1077#1082#1090'. '#1074#1086#1076#1080#1090#1077#1083#1103
        Width = 50
      end>
  end
end
