object WEBBrowserForm: TWEBBrowserForm
  Left = 0
  Top = 0
  Width = 658
  Height = 504
  Caption = 'WEB-'#1073#1088#1072#1091#1079#1077#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 650
    Height = 432
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C0000002E430000A62C00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 432
    Width = 650
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 24
      Top = 8
      Width = 233
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' ('#1087#1088#1080' '#1087#1086#1074#1090#1086#1088#1103#1102#1097#1080#1093#1089#1103' '#1089#1089#1099#1083#1082#1072#1093')'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 280
      Top = 8
      Width = 177
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1082#1086#1086#1088#1076'. '#1074#1086#1076#1080#1090#1077#1083#1077#1081
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object Button1: TButton
      Left = 472
      Top = 8
      Width = 145
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Edit1: TEdit
    Left = 0
    Top = 0
    Width = 640
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
  end
end
