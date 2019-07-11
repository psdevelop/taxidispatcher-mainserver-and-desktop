object USBAccessForm: TUSBAccessForm
  Left = 0
  Top = 0
  Width = 490
  Height = 298
  Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1094#1080#1103' USB'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 219
    Width = 482
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 304
      Top = 16
      Width = 169
      Height = 25
      Caption = #1056#1077#1089#1090#1072#1088#1090' '#1084#1086#1076#1077#1084#1072' Philips'
      TabOrder = 0
      Visible = False
    end
    object Button1: TButton
      Left = 8
      Top = 16
      Width = 121
      Height = 25
      Caption = #1056#1077#1089#1090#1072#1088#1090' USB-'#1093#1072#1073#1072
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 136
      Top = 16
      Width = 137
      Height = 25
      Caption = 'ALL-'#1088#1077#1089#1090#1072#1088#1090
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 482
    Height = 219
    Align = alClient
    Ctl3D = False
    Lines.Strings = (
      '')
    ParentCtl3D = False
    TabOrder = 1
  end
end
