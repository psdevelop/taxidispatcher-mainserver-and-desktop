object DrExecRepSettForm: TDrExecRepSettForm
  Left = 0
  Top = 0
  Width = 339
  Height = 250
  Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1102' '#1074#1099#1093#1086#1076#1086#1074'...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 32
    Width = 100
    Height = 13
    Caption = #1057' 00:00 '#1089#1091#1090#1086#1082' '#1076#1072#1090#1099
  end
  object Label2: TLabel
    Left = 80
    Top = 88
    Width = 107
    Height = 13
    Caption = #1044#1086' 23:59 '#1089#1091#1090#1086#1082' '#1076#1072#1090#1099
  end
  object Button1: TButton
    Left = 104
    Top = 152
    Width = 129
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object sDateEdit1: TDateTimePicker
    Left = 72
    Top = 48
    Width = 201
    Height = 21
    Date = 40897.285678159720000000
    Time = 40897.285678159720000000
    TabOrder = 1
  end
  object sDateEdit2: TDateTimePicker
    Left = 72
    Top = 104
    Width = 201
    Height = 21
    Date = 40897.286593958340000000
    Time = 40897.286593958340000000
    TabOrder = 2
  end
end
