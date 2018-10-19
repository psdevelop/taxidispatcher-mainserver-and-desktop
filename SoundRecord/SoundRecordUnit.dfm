object SoundRecForm: TSoundRecForm
  Left = 220
  Top = 204
  Width = 643
  Height = 241
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'SoundRecForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 154
    Width = 18
    Height = 13
    Caption = '000'
  end
  object Image1: TImage
    Left = 5
    Top = 6
    Width = 625
    Height = 137
  end
  object Label2: TLabel
    Left = 372
    Top = 154
    Width = 44
    Height = 13
    Caption = #1047#1072#1087#1080#1089#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Button3: TButton
    Left = 8
    Top = 176
    Width = 75
    Height = 25
    Caption = #1042#1093#1086#1076#1099
    TabOrder = 0
    OnClick = Button3Click
  end
  object BitBtn1: TBitBtn
    Left = 370
    Top = 176
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object CheckBox1: TCheckBox
    Left = 101
    Top = 180
    Width = 97
    Height = 17
    Caption = #1052#1072#1089#1096#1090#1072#1073' 1:1'
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 451
    Top = 179
    Width = 97
    Height = 17
    Caption = #1053#1086#1088#1084#1072#1083#1080#1079#1072#1094#1080#1103
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 176
    Width = 147
    Height = 25
    Caption = #1040#1074#1090#1086#1079#1072#1087#1080#1089#1100
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object RecordTimer: TTimer
    Interval = 5000
    OnTimer = RecordTimerTimer
    Left = 544
    Top = 24
  end
end
