object SectorEnumForm: TSectorEnumForm
  Left = 0
  Top = 0
  Width = 658
  Height = 421
  Caption = #1057#1077#1082#1090#1086#1088#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 353
    Width = 650
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 129
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
    object BitBtn12: TBitBtn
      Left = 160
      Top = 8
      Width = 281
      Height = 25
      Caption = #1054#1095#1077#1088#1090#1080#1090#1100' '#1086#1073#1083#1072#1089#1090#1100' '#1079#1086#1085#1099' '#1089#1077#1082#1090#1086#1088#1072
      TabOrder = 1
      OnClick = BitBtn12Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 353
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 418
      Top = 0
      Width = 8
      Height = 353
      Align = alRight
      Color = clMedGray
      ParentColor = False
    end
    object GroupBox3: TGroupBox
      Left = 426
      Top = 0
      Width = 224
      Height = 353
      Align = alRight
      Caption = #1058#1086#1095#1082#1080' '#1079#1086#1085#1099' '#1089#1077#1082#1090#1086#1088#1072
      TabOrder = 0
      object DBGrid7: TDBGrid
        Left = 2
        Top = 18
        Width = 220
        Height = 308
        Align = alClient
        DataSource = ADOConnectDM.dsSectorsCoords
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
        Top = 326
        Width = 220
        Height = 25
        DataSource = ADOConnectDM.dsSectorsCoords
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alBottom
        TabOrder = 1
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 418
      Height = 353
      Align = alClient
      DataSource = ADOConnectDM.dsSectors
      TabOrder = 1
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
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Podskazka_na_sektore'
          Title.Caption = #1055#1086#1088#1103#1076#1086#1082
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPANY_LOOK'
          Title.Caption = #1060#1080#1088#1084#1072
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISTRICT_LOOK'
          Title.Caption = #1056#1072#1081#1086#1085
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Kommentarii'
          Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
          Width = 200
          Visible = True
        end>
    end
  end
end
