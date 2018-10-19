object Form1: TForm1
  Left = 260
  Top = 103
  Width = 378
  Height = 215
  Caption = 'TCP '#1089#1077#1088#1074#1077#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bStartServer: TButton
    Left = 144
    Top = 24
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100
    TabOrder = 0
    OnClick = bStartServerClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 72
    Width = 370
    Height = 110
    Align = alBottom
    TabOrder = 1
  end
  object SocketCheckTimer: TTimer
    Interval = 3000
    OnTimer = SocketCheckTimerTimer
    Left = 328
    Top = 8
  end
end
