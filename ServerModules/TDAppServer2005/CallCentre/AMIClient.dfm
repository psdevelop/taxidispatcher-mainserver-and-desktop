object AMIClientForm: TAMIClientForm
  Left = 0
  Top = 0
  Width = 627
  Height = 369
  Caption = #1050#1083#1080#1077#1085#1090' Asterisk Managment Interface'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 161
    Width = 619
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Color = clMedGray
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 161
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 249
      Top = 0
      Width = 8
      Height = 104
      Color = clMedGray
      ParentColor = False
    end
    object Panel3: TPanel
      Left = 0
      Top = 104
      Width = 619
      Height = 57
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 584
        Top = 32
        Width = 23
        Height = 22
        Visible = False
        OnClick = SpeedButton1Click
      end
      object Edit1: TEdit
        Left = 96
        Top = 32
        Width = 441
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object Button1: TButton
        Left = 544
        Top = 32
        Width = 33
        Height = 19
        Caption = 'OK'
        TabOrder = 1
        OnClick = Button1Click
      end
      object ComboBox1: TComboBox
        Left = 96
        Top = 8
        Width = 353
        Height = 21
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        OnChange = ComboBox1Change
      end
      object BitBtn1: TBitBtn
        Left = 456
        Top = 8
        Width = 75
        Height = 17
        Caption = 'Save'
        TabOrder = 3
        OnClick = BitBtn1Click
      end
      object Button2: TButton
        Left = 8
        Top = 32
        Width = 75
        Height = 25
        Caption = #1042' '#1080#1085#1092#1086
        TabOrder = 4
        OnClick = Button2Click
      end
      object BitBtn2: TBitBtn
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = #1042' '#1080#1085#1092#1086
        TabOrder = 5
        OnClick = BitBtn2Click
      end
      object BitBtn3: TBitBtn
        Left = 544
        Top = 8
        Width = 75
        Height = 25
        Caption = #1042' '#1080#1085#1092#1086
        TabOrder = 6
        OnClick = BitBtn3Click
      end
    end
    object AMIInputMemo: TMemo
      Left = 0
      Top = 0
      Width = 249
      Height = 104
      Align = alLeft
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object AnalyseMemo: TMemo
      Left = 257
      Top = 0
      Width = 362
      Height = 104
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object StreamAnalyseMemo: TMemo
      Left = 257
      Top = 0
      Width = 362
      Height = 104
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 169
    Width = 619
    Height = 154
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object AMIOutputMemo: TMemo
      Left = 0
      Top = 0
      Width = 619
      Height = 135
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object StatusBar1: TStatusBar
      Left = 0
      Top = 135
      Width = 619
      Height = 19
      Panels = <
        item
          Width = 500
        end
        item
          Width = 50
        end
        item
          Width = 50
        end>
    end
  end
  object MainMenu1: TMainMenu
    Left = 400
    Top = 48
    object N1: TMenuItem
      Caption = #1050#1086#1084#1072#1085#1076#1099
      object N2: TMenuItem
        Caption = #1058#1077#1089#1090#1086#1074#1072#1103' '#1082#1086#1084#1072#1085#1076#1072'...'
      end
    end
  end
  object AMIRecvTimer: TTimer
    Enabled = False
    OnTimer = AMIRecvTimerTimer
    Left = 400
    Top = 8
  end
end
