object SetIndividNumForm: TSetIndividNumForm
  Left = 0
  Top = 0
  Width = 657
  Height = 446
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1048#1085#1076#1080#1074#1080#1076#1091#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088' '#1082#1083#1080#1077#1085#1090#1072' ('#1082#1085#1086#1087#1082#1072'-'#1085#1086#1074#1099#1081')...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 33
    Align = alTop
    AutoSize = True
    TabOrder = 0
    object Panel1: TPanel
      Left = 606
      Top = 1
      Width = 42
      Height = 31
      Align = alRight
      BevelInner = bvLowered
      Caption = '...'
      TabOrder = 0
      OnClick = Panel1Click
    end
    object sEdit1: TEdit
      Left = 0
      Top = 1
      Width = 457
      Height = 31
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnKeyUp = sEdit1KeyUp
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 33
    Width = 649
    Height = 386
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    TabPosition = tpBottom
    object TabSheet1: TTabSheet
      TabVisible = False
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 641
        Height = 378
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 71
          Height = 21
          Caption = #1060#1072#1084#1080#1083#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 288
          Top = 8
          Width = 31
          Height = 21
          Caption = #1048#1084#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 64
          Width = 72
          Height = 21
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 120
          Width = 69
          Height = 21
          Caption = #1058#1077#1083#1077#1092#1086#1085
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 176
          Width = 46
          Height = 21
          Caption = #1040#1076#1088#1077#1089
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Edit1: TEdit
          Left = 8
          Top = 33
          Width = 241
          Height = 31
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnKeyPress = Edit1KeyPress
        end
        object Edit2: TEdit
          Left = 288
          Top = 33
          Width = 193
          Height = 31
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnKeyPress = Edit2KeyPress
        end
        object Edit3: TEdit
          Left = 8
          Top = 89
          Width = 241
          Height = 31
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnKeyPress = Edit3KeyPress
        end
        object Edit4: TEdit
          Left = 8
          Top = 145
          Width = 241
          Height = 31
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
          OnKeyPress = Edit4KeyPress
        end
        object Edit5: TEdit
          Left = 8
          Top = 201
          Width = 473
          Height = 31
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
          OnKeyPress = Edit5KeyPress
        end
        object Button1: TButton
          Left = 192
          Top = 240
          Width = 121
          Height = 33
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = Button1Click
        end
      end
    end
    object TabSheet2: TTabSheet
      ImageIndex = 1
      TabVisible = False
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 490
        Height = 277
        Align = alClient
        DataSource = BoldModelDM.IPersPerINumDS
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'Korpus'
            ReadOnly = True
            Title.Caption = 'ID'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Familiya'
            ReadOnly = True
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Imya'
            ReadOnly = True
            Title.Caption = #1048#1084#1103
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Otchestvo'
            ReadOnly = True
            Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Dom'
            Title.Caption = #1042#1099#1079'.'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Rabochii_telefon'
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ulica'
            ReadOnly = True
            Title.Caption = #1040#1076#1088#1077#1089
            Width = 150
            Visible = True
          end>
      end
    end
  end
end
