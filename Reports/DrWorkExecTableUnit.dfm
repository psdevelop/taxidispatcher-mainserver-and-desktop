object DrWorkExecTableForm: TDrWorkExecTableForm
  Left = 0
  Top = 0
  Width = 689
  Height = 470
  Caption = #1058#1072#1073#1083#1080#1094#1072' '#1074#1099#1093#1086#1076#1086#1074' '#1074#1086#1076#1080#1090#1077#1083#1077#1081' '#1079#1072' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 681
    Height = 355
    Align = alClient
    Ctl3D = False
    DataSource = ReportDM.AggrDrRepDS
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
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
        FieldName = 'Data_podachi'
        Title.Caption = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Adres_vyzova_vvodim'
        Title.Caption = #1058#1080#1087' '#1092#1080#1082#1090#1080#1074#1085#1086#1081' '#1079#1072#1103#1074#1082#1080
        Width = 267
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 355
    Width = 681
    Height = 88
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Label3: TLabel
      Left = 360
      Top = 59
      Width = 111
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1087#1086#1079#1099#1074#1085#1086#1084#1091
    end
    object Label2: TLabel
      Left = 232
      Top = 16
      Width = 13
      Height = 13
      Caption = #1055#1086
    end
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 7
      Height = 13
      Caption = 'C'
    end
    object BitBtn1: TBitBtn
      Left = 456
      Top = 8
      Width = 145
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086' '#1087#1077#1088#1080#1086#1076#1091
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object Edit1: TEdit
      Left = 480
      Top = 51
      Width = 121
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnChange = Edit1Change
    end
    object DateTimePicker2: TDateTimePicker
      Left = 360
      Top = 8
      Width = 73
      Height = 21
      Date = 40209.000000000000000000
      Time = 40209.000000000000000000
      Enabled = False
      Kind = dtkTime
      TabOrder = 2
    end
    object DateTimePicker1: TDateTimePicker
      Left = 128
      Top = 8
      Width = 73
      Height = 21
      Date = 40209.000000000000000000
      Time = 40209.000000000000000000
      Enabled = False
      Kind = dtkTime
      TabOrder = 3
    end
    object sDateEdit1: TDateTimePicker
      Left = 40
      Top = 8
      Width = 81
      Height = 21
      Date = 40897.300767500000000000
      Time = 40897.300767500000000000
      TabOrder = 4
    end
    object sDateEdit2: TDateTimePicker
      Left = 272
      Top = 8
      Width = 81
      Height = 21
      Date = 40897.300767500000000000
      Time = 40897.300767500000000000
      TabOrder = 5
    end
    object sCheckBox1: TCheckBox
      Left = 8
      Top = 40
      Width = 113
      Height = 17
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1085#1072' '#1089#1077#1082#1090#1086#1088
      TabOrder = 6
      OnClick = sCheckBox1Click
    end
    object sCheckBox2: TCheckBox
      Left = 8
      Top = 64
      Width = 97
      Height = 17
      Caption = #1055#1086#1089#1090'. '#1085#1072' '#1083#1080#1085#1080#1102
      TabOrder = 7
      OnClick = sCheckBox1Click
    end
    object sCheckBox3: TCheckBox
      Left = 120
      Top = 40
      Width = 97
      Height = 17
      Caption = #1055#1077#1088#1077#1088#1099#1074
      TabOrder = 8
      OnClick = sCheckBox1Click
    end
    object sCheckBox4: TCheckBox
      Left = 120
      Top = 64
      Width = 97
      Height = 17
      Caption = #1055#1077#1088#1077#1088#1099#1074' '#1089' '#1088#1091#1082#1080
      TabOrder = 9
      OnClick = sCheckBox1Click
    end
    object sCheckBox5: TCheckBox
      Left = 232
      Top = 40
      Width = 97
      Height = 17
      Caption = #1057' '#1087#1077#1088#1077#1088#1099#1074#1072
      TabOrder = 10
      OnClick = sCheckBox1Click
    end
    object sCheckBox6: TCheckBox
      Left = 232
      Top = 64
      Width = 97
      Height = 17
      Caption = #1057#1085#1103#1090#1080#1077' '#1089' '#1083#1080#1085#1080#1080
      TabOrder = 11
      OnClick = sCheckBox1Click
    end
  end
end
