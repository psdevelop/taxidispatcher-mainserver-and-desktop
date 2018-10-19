object EmptyConnForm: TEmptyConnForm
  Left = 0
  Top = 0
  Width = 534
  Height = 283
  Caption = #1056#1077#1078#1080#1084' '#1075#1086#1083#1086#1075#1086' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 526
    Height = 256
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1079#1072#1103#1074#1086#1082
      object Splitter1: TSplitter
        Left = 297
        Top = 0
        Width = 8
        Height = 190
        Align = alRight
        Color = clMedGray
        ParentColor = False
      end
      object Panel1: TPanel
        Left = 0
        Top = 190
        Width = 518
        Height = 38
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 360
          Top = 16
          Width = 31
          Height = 13
          Caption = 'Label1'
        end
        object BitBtn1: TBitBtn
          Left = 8
          Top = 8
          Width = 153
          Height = 25
          Caption = #1054#1090#1082#1088#1099#1090#1100'...'
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 184
          Top = 8
          Width = 145
          Height = 25
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
          TabOrder = 1
          OnClick = BitBtn2Click
        end
      end
      object RestoredDBGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 297
        Height = 190
        Align = alClient
        Ctl3D = False
        DataSource = RecoveryOrderDS
        ParentCtl3D = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object RestoreMemo: TMemo
        Left = 305
        Top = 0
        Width = 213
        Height = 190
        Align = alRight
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 1
      object BitBtn3: TBitBtn
        Left = 16
        Top = 16
        Width = 201
        Height = 25
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1072#1073'. '#1085#1086#1084#1077#1088#1072
        TabOrder = 0
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 16
        Top = 56
        Width = 201
        Height = 25
        Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1090#1077#1083'. '#1085#1086#1084#1077#1088#1072
        TabOrder = 1
        OnClick = BitBtn4Click
      end
    end
  end
  object RecoveryOrderDS: TDataSource
    DataSet = RecoveryOrdADOQ
    Left = 480
    Top = 96
  end
  object RecoveryOrderCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 56
  end
  object CDSOpenDialog: TOpenDialog
    Filter = #1050#1083#1080#1077#1085#1090#1089#1082#1080#1077' '#1085#1072#1073#1086#1088#1099' '#1076#1072#1085#1085#1099#1093', *.cds|*.cds'
    Left = 480
    Top = 16
  end
  object RecoveryOrderADOSP: TADOStoredProc
    Connection = BoldModelDM.ADOConnection
    ProcedureName = 'RecoveryOrder;1'
    Parameters = <>
    Left = 480
    Top = 144
  end
  object RecoveryOrdADOQ: TADOQuery
    Parameters = <>
    Left = 480
    Top = 184
  end
end
