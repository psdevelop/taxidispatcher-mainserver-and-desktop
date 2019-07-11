object ModemSettingsForm: TModemSettingsForm
  Left = 257
  Top = 131
  Width = 501
  Height = 522
  Caption = 'Write/Read Modem Command Test'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 493
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Edit1: TEdit
      Left = 8
      Top = 8
      Width = 201
      Height = 21
      TabOrder = 0
      Text = 'CALLER'#39'S NUMBER: 09184362311RING'
    end
    object BitBtn1: TBitBtn
      Left = 224
      Top = 8
      Width = 257
      Height = 25
      Caption = #1055#1088#1086#1090#1077#1089#1090#1080#1088#1086#1074#1072#1090#1100' '#1074#1093'. '#1087#1086#1089#1083#1077#1076#1086#1074#1072#1090#1077#1083#1100#1085#1086#1089#1090#1100
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 41
    Width = 493
    Height = 105
    Align = alTop
    Caption = #1055#1077#1088#1074#1099#1081' '#1084#1086#1076#1077#1084
    TabOrder = 1
    object Panel2: TPanel
      Left = 361
      Top = 15
      Width = 130
      Height = 88
      Align = alRight
      TabOrder = 0
      object Label1: TLabel
        Left = 17
        Top = 8
        Width = 88
        Height = 13
        Caption = 'Modem Command:'
      end
      object BtnSend: TButton
        Left = 16
        Top = 55
        Width = 105
        Height = 25
        Caption = 'Send Command'
        TabOrder = 0
        OnClick = BtnSendClick
      end
      object Command: TEdit
        Left = 16
        Top = 24
        Width = 105
        Height = 21
        TabOrder = 1
      end
    end
    object RxMemo: TMemo
      Left = 2
      Top = 15
      Width = 359
      Height = 88
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 146
    Width = 493
    Height = 105
    Align = alTop
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1084#1086#1076#1077#1084
    TabOrder = 2
    object Panel3: TPanel
      Left = 361
      Top = 15
      Width = 130
      Height = 88
      Align = alRight
      TabOrder = 0
      object Label2: TLabel
        Left = 17
        Top = 8
        Width = 88
        Height = 13
        Caption = 'Modem Command:'
      end
      object Button1: TButton
        Left = 16
        Top = 56
        Width = 105
        Height = 25
        Caption = 'Send Command'
        TabOrder = 0
        OnClick = Button1Click
      end
      object AdditCommand: TEdit
        Left = 16
        Top = 24
        Width = 105
        Height = 21
        TabOrder = 1
      end
    end
    object AdditRxMemo: TMemo
      Left = 2
      Top = 15
      Width = 359
      Height = 88
      Align = alClient
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 251
    Width = 493
    Height = 244
    Align = alClient
    Caption = 'GSM - '#1090#1077#1083#1077#1092#1086#1085
    TabOrder = 3
    object PageControl1: TPageControl
      Left = 2
      Top = 15
      Width = 489
      Height = 227
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #1089#1086#1090' 1'
        object GSMMemo: TMemo
          Left = 0
          Top = 0
          Width = 360
          Height = 199
          Align = alClient
          Ctl3D = False
          Lines.Strings = (
            '')
          ParentCtl3D = False
          TabOrder = 0
        end
        object Panel4: TPanel
          Left = 360
          Top = 0
          Width = 121
          Height = 199
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object Label3: TLabel
            Left = 17
            Top = 0
            Width = 88
            Height = 13
            Caption = 'Modem Command:'
          end
          object Button3: TButton
            Left = 16
            Top = 43
            Width = 105
            Height = 25
            Caption = 'Send Command'
            TabOrder = 0
            OnClick = Button3Click
          end
          object GSMCommand: TEdit
            Left = 16
            Top = 16
            Width = 105
            Height = 21
            TabOrder = 1
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1089#1086#1090' 2'
        ImageIndex = 1
        object GSM2Memo: TMemo
          Left = 0
          Top = 0
          Width = 360
          Height = 199
          Align = alClient
          Ctl3D = False
          Lines.Strings = (
            '')
          ParentCtl3D = False
          TabOrder = 0
        end
        object Panel5: TPanel
          Left = 360
          Top = 0
          Width = 121
          Height = 199
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object Label4: TLabel
            Left = 17
            Top = 8
            Width = 88
            Height = 13
            Caption = 'Modem Command:'
          end
          object Button2: TButton
            Left = 16
            Top = 48
            Width = 105
            Height = 25
            Caption = 'Send Command'
            TabOrder = 0
            OnClick = Button2Click
          end
          object GSM2Command: TEdit
            Left = 16
            Top = 24
            Width = 105
            Height = 21
            TabOrder = 1
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1089#1086#1090' 3'
        ImageIndex = 2
        object GSM3Memo: TMemo
          Left = 0
          Top = 0
          Width = 360
          Height = 199
          Align = alClient
          Ctl3D = False
          Lines.Strings = (
            '')
          ParentCtl3D = False
          TabOrder = 0
        end
        object Panel6: TPanel
          Left = 360
          Top = 0
          Width = 121
          Height = 199
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object Label5: TLabel
            Left = 17
            Top = 8
            Width = 88
            Height = 13
            Caption = 'Modem Command:'
          end
          object Button4: TButton
            Left = 16
            Top = 48
            Width = 105
            Height = 25
            Caption = 'Send Command'
            TabOrder = 0
            OnClick = Button4Click
          end
          object GSM3Command: TEdit
            Left = 16
            Top = 24
            Width = 105
            Height = 21
            TabOrder = 1
          end
        end
      end
    end
  end
  object ApdComPort: TApdComPort
    ComNumber = 1
    AutoOpen = False
    BufferFull = 3686
    BufferResume = 409
    Tracing = tlOn
    TraceName = 'APD.TRC'
    Logging = tlOn
    LogName = 'APD.LOG'
    UseEventWord = False
    OnTriggerAvail = ApdComPortTriggerAvail
    Left = 309
    Top = 103
  end
  object AdditionalApdComPort: TApdComPort
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    OnTriggerAvail = AdditionalApdComPortTriggerAvail
    Left = 312
    Top = 240
  end
  object GSMApdComPort: TApdComPort
    ComNumber = 3
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    OnTriggerAvail = GSMApdComPortTriggerAvail
    Left = 160
    Top = 400
  end
  object GSM2ApdComPort: TApdComPort
    ComNumber = 4
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    OnTriggerAvail = GSM2ApdComPortTriggerAvail
    Left = 192
    Top = 400
  end
  object GSM3ApdComPort: TApdComPort
    ComNumber = 5
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    OnTriggerAvail = GSM3ApdComPortTriggerAvail
    Left = 224
    Top = 400
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 56
    object N1: TMenuItem
      Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
      object N2: TMenuItem
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1084#1086#1076#1077#1084#1099' '#1085#1072' '#1072#1082#1090#1080#1074#1085#1086#1089#1090#1100'...'
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1058#1077#1089#1090#1086#1074#1099#1081' '#1074#1099#1079#1086#1074'...'
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1058#1077#1089#1090#1086#1074#1099#1081' '#1074#1099#1079#1086#1074' '#1085#1072' '#1087#1077#1088#1074#1099#1081' '#1089#1086#1090#1086#1074#1099#1081'...'
        OnClick = N4Click
      end
    end
  end
end
