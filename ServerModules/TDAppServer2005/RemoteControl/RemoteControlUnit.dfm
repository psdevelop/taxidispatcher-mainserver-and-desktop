object RemoteControlForm: TRemoteControlForm
  Left = 0
  Top = 0
  Width = 696
  Height = 612
  Caption = #1052#1086#1076#1091#1083#1100' '#1089#1074#1103#1079#1080' '#1089' '#1074#1086#1076#1080#1090#1077#1083#1103#1084#1080' '#1095#1077#1088#1077#1079' Internet'
  Color = clBtnFace
  Constraints.MaxHeight = 650
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 688
    Height = 525
    Align = alClient
    Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1086#1087#1086#1074#1077#1097#1077#1085#1080#1081' '#1074#1086#1076#1080#1090#1077#1083#1077#1081
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 2
      Top = 169
      Width = 684
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Color = clMedGray
      ParentColor = False
    end
    object PageControl1: TPageControl
      Left = 2
      Top = 173
      Width = 684
      Height = 350
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = #1057#1086#1093#1088#1072#1085#1077#1085#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        ImageIndex = 1
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 676
          Height = 346
          Align = alClient
          Ctl3D = False
          DataSource = LocalMSGDS
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Color = clHotLight
              Expanded = False
              FieldName = 'MSG_ID'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ReadOnly = False
              Title.Caption = 'ID '#1089#1086#1086#1073#1097#1077#1085#1080#1103
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'OPERATION_NAME'
              Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'SOURCE_ID'
              Title.Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'DEST_ID'
              Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'IN_DEST'
              Title.Caption = #1044#1086#1096#1083#1086
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'ANSWER'
              Title.Caption = #1054#1090#1074#1077#1095#1077#1085#1086
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'OBJ_ID'
              Title.Caption = #1054#1073#1098#1077#1082#1090
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STR_PARAM_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STR_PARAM_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STR_PARAM_3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INT_PARAM_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INT_PARAM_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INT_PARAM_3'
              Visible = True
            end>
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1051#1086#1075' '#1089#1086#1082#1077#1090'-'#1089#1077#1088#1074#1077#1088#1072
        ImageIndex = 2
        object SocketLogMemo: TMemo
          Left = 0
          Top = 0
          Width = 676
          Height = 322
          Align = alClient
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          OnChange = SocketLogMemoChange
        end
      end
      object TabSheet3: TTabSheet
        Caption = #1058#1077#1089#1090#1080#1088#1086#1074#1072#1085#1080#1077
        ImageIndex = 2
        object BitBtn1: TBitBtn
          Left = 384
          Top = 30
          Width = 201
          Height = 25
          Caption = #1069#1084#1091#1083#1080#1088#1086#1074#1072#1090#1100' '#1074#1093#1086#1076#1103#1097#1077#1077
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object InputJSONTestEdit: TComboBox
          Left = 8
          Top = 8
          Width = 577
          Height = 21
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 1
          Text = 
            '{"command":"accept_order","order_id":"3779350","client_id":"568"' +
            ',"msg_end":"ok"}'
          Items.Strings = (
            
              '{"command":"accept_order","order_id":"3779350","client_id":"568"' +
              ',"msg_end":"ok"}')
        end
        object OutputJSONTestEdit: TComboBox
          Left = 8
          Top = 56
          Width = 577
          Height = 21
          Ctl3D = False
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 2
          Text = 
            '{"command":"take_order","order_id":"3779350","order_data":"mayak' +
            '","client_id":"568","msg_end":"ok"}'
          Items.Strings = (
            
              '{"command":"take_order","order_id":"3779350","order_data":"mayak' +
              '","client_id":"568","msg_end":"ok"}')
        end
        object BitBtn2: TBitBtn
          Left = 384
          Top = 80
          Width = 201
          Height = 25
          Caption = #1069#1084#1091#1083#1080#1088#1086#1074#1072#1090#1100' '#1080#1089#1093#1086#1076#1103#1097#1077#1077
          TabOrder = 3
          OnClick = BitBtn2Click
        end
        object ClientIdEdit: TEdit
          Left = 248
          Top = 80
          Width = 121
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
          Text = '568'
        end
      end
      object TabSheet8: TTabSheet
        Caption = #1058#1077#1089#1090' 2'
        ImageIndex = 3
        object Panel2: TPanel
          Left = 0
          Top = 281
          Width = 676
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Test2Memo: TMemo
          Left = 0
          Top = 0
          Width = 676
          Height = 281
          Align = alClient
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
        end
      end
      object TabSheet9: TTabSheet
        Caption = #1057#1090#1072#1090#1091#1089' '#1089#1086#1082#1077#1090#1086#1074'...'
        ImageIndex = 4
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 676
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object SocksStatusLabel: TLabel
            Left = 8
            Top = 8
            Width = 83
            Height = 13
            Caption = 'SocksStatusLabel'
          end
        end
        object SocksListView: TMemo
          Left = 0
          Top = 33
          Width = 676
          Height = 289
          Align = alClient
          Ctl3D = False
          Lines.Strings = (
            'SocksListView')
          ParentCtl3D = False
          TabOrder = 1
        end
      end
    end
    object PageControl2: TPageControl
      Left = 2
      Top = 15
      Width = 684
      Height = 154
      ActivePage = TabSheet7
      Align = alTop
      TabOrder = 1
      object TabSheet4: TTabSheet
        Caption = #1054#1073#1088#1072#1073#1072#1090#1099#1074#1072#1077#1084#1099#1077' '#1079#1072#1103#1074#1082#1080' '#1073#1072#1079#1099
        object RemoteOrdersDBGrid: TDBGrid
          Left = 0
          Top = 0
          Width = 676
          Height = 126
          Align = alClient
          Ctl3D = False
          DataSource = RemoteProcessedOrdersDS
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Color = clHotLight
              Expanded = False
              FieldName = 'BOLD_ID'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = 'ID '#1079#1072#1082#1072#1079#1072
              Title.Color = clHighlight
              Width = 54
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'Telefon_klienta'
              Title.Caption = #1058#1077#1083#1077#1092#1086#1085
              Width = 86
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'Adres_vyzova_vvodim'
              Title.Caption = #1040#1076#1088#1077#1089
              Width = 96
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'Pozyvnoi_ustan'
              Title.Caption = #1055#1086#1079'.'
              Width = 49
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'REMOTE_DRNUM'
              Title.Caption = #1050#1090#1086' '#1087#1088#1080#1085#1103#1083
              Width = 72
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'REMOTE_SET'
              Width = 71
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'SECTOR_ID'
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'PRIORITY'
              Width = 81
              Visible = True
            end>
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'HTTP-'#1088#1077#1078#1080#1084' ('#1085#1077' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103')'
        ImageIndex = 1
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 676
          Height = 126
          Align = alClient
          Ctl3D = False
          DataSource = TDMessagesDS
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Color = clHotLight
              Expanded = False
              FieldName = 'MSG_ID'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ReadOnly = False
              Title.Caption = 'ID '#1089#1086#1086#1073#1097#1077#1085#1080#1103
              Visible = True
            end
            item
              Color = clNavy
              Expanded = False
              FieldName = 'CREATE_DT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindow
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1086
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'OPERATION_NAME'
              Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
              Width = 80
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'SOURCE_ID'
              Title.Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'DEST_ID'
              Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'IN_DEST'
              Title.Caption = #1044#1086#1096#1083#1086
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'ANSWER'
              Title.Caption = #1054#1090#1074#1077#1095#1077#1085#1086
              Visible = True
            end
            item
              Color = 8454143
              Expanded = False
              FieldName = 'OBJ_ID'
              Title.Caption = #1054#1073#1098#1077#1082#1090
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STR_PARAM_1'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STR_PARAM_2'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STR_PARAM_3'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INT_PARAM_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INT_PARAM_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INT_PARAM_3'
              Visible = True
            end>
        end
      end
      object TabSheet6: TTabSheet
        Caption = #1042#1086#1076#1080#1090#1077#1083#1080', '#1088#1072#1073#1086#1090#1072#1097#1080#1077' '#1095'-'#1079' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077
        ImageIndex = 2
        object DBGrid3: TDBGrid
          Left = 0
          Top = 0
          Width = 676
          Height = 126
          Align = alClient
          DataSource = DriversDS
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Color = clMenuHighlight
              Expanded = False
              FieldName = 'BOLD_ID'
              ReadOnly = True
              Title.Caption = 'ID'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Pozyvnoi'
              Title.Caption = #1055#1086#1079#1099#1074#1085#1086#1081
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'V_rabote'
              Title.Caption = #1053#1072' '#1083#1080#1085#1080#1080
              Width = 57
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Na_pereryve'
              Title.Caption = #1055#1077#1088#1077#1088#1099#1074
              Width = 53
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Zanyat_drugim_disp'
              Title.Caption = #1047#1072#1085#1103#1090
              Width = 42
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REMOTE_STATUS'
              Width = 93
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ITS_REMOTE_CLIENT'
              Title.Caption = #1056#1072#1073'. '#1091#1076#1072#1083#1077#1085#1085#1086
              Width = 83
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LAST_STATUS_TIME'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SYNC_STATUS'
              Visible = True
            end>
        end
      end
      object TabSheet7: TTabSheet
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' (DBV>3)'
        ImageIndex = 3
        OnShow = TabSheet7Show
        object Label6: TLabel
          Left = 8
          Top = 0
          Width = 52
          Height = 13
          Caption = #1042#1077#1088#1089#1080#1103' '#1041#1044
          Enabled = False
        end
        object Label13: TLabel
          Left = 8
          Top = 40
          Width = 85
          Height = 13
          Caption = #1058#1077#1082'. '#1084#1086#1073'. '#1074#1077#1088#1089#1080#1103
          Enabled = False
        end
        object Label14: TLabel
          Left = 8
          Top = 80
          Width = 83
          Height = 13
          Caption = #1052#1080#1085'. '#1084#1086#1073' '#1074#1077#1088#1089#1080#1103
          Enabled = False
        end
        object DBEdit4: TDBEdit
          Left = 8
          Top = 16
          Width = 185
          Height = 19
          Ctl3D = False
          DataField = 'db_version'
          DataSource = SettingsDS
          Enabled = False
          ParentCtl3D = False
          TabOrder = 0
        end
        object DBEdit12: TDBEdit
          Left = 8
          Top = 56
          Width = 185
          Height = 19
          Ctl3D = False
          DataField = 'curr_mob_version'
          DataSource = SettingsDS
          Enabled = False
          ParentCtl3D = False
          TabOrder = 1
        end
        object DBEdit13: TDBEdit
          Left = 8
          Top = 96
          Width = 265
          Height = 19
          Ctl3D = False
          DataField = 'min_mob_version'
          DataSource = SettingsDS
          Enabled = False
          ParentCtl3D = False
          TabOrder = 2
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 525
    Width = 688
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 168
      Top = 16
      Width = 61
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
    end
    object Label2: TLabel
      Left = 328
      Top = 16
      Width = 58
      Height = 13
      Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
    end
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 137
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      TabOrder = 0
      OnClick = Button1Click
    end
    object DEST_ID: TEdit
      Left = 240
      Top = 8
      Width = 73
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = '1'
    end
    object MSGText: TEdit
      Left = 400
      Top = 8
      Width = 201
      Height = 19
      Ctl3D = False
      MaxLength = 255
      ParentCtl3D = False
      TabOrder = 2
      Text = #1058#1077#1089#1090#1086#1074#1086#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
    end
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 8
    object N1: TMenuItem
      Caption = #1056#1072#1073#1086#1090#1072
      object N2: TMenuItem
        Caption = #1040#1082#1090#1080#1074#1085#1086#1089#1090#1100' '#1088#1072#1073#1086#1090#1099
      end
      object N3: TMenuItem
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'...'
      end
      object N4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      end
    end
    object N5: TMenuItem
      Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100' '#1089#1086#1082#1077#1090'-'#1089#1077#1088#1074#1077#1088
      OnClick = N5Click
    end
  end
  object RemoteServerADOC: TADOConnection
    LoginPrompt = False
    Provider = 
      'C:\DEVELOP\TD_7_0_2_6\TaxiManager\ServerModules\TDAppServer2005\' +
      'TaxiDispatcherServer.udl'
    Left = 640
    Top = 16
  end
  object TDMessagesADOT: TADOTable
    Connection = RemoteServerADOC
    CursorType = ctStatic
    TableName = 'TD_MESSAGES'
    Left = 640
    Top = 48
  end
  object TDMessagesDS: TDataSource
    DataSet = TDMessagesADOT
    Left = 608
    Top = 80
  end
  object AddOperationADOC: TADOCommand
    CommandText = 
      'INSERT INTO TD_MESSAGES  (OPERATION_NAME, OPERATION_ID, SOURCE_I' +
      'D, DEST_ID, DEST_NAME, OBJ_ID, STR_PARAM_1, STR_PARAM_2, STR_PAR' +
      'AM_3, INT_PARAM_1, INT_PARAM_2, INT_PARAM_3, CREATE_DT)  VALUES(' +
      ':OPERATION_NAME, :OPERATION_ID, :SOURCE_ID, :DEST_ID, :DEST_NAME' +
      ', :OBJ_ID, :STR_PARAM_1, :STR_PARAM_2, :STR_PARAM_3, :INT_PARAM_' +
      '1, :INT_PARAM_2, :INT_PARAM_3, :CREATE_DT)'
    Connection = RemoteServerADOC
    Parameters = <
      item
        Name = 'OPERATION_NAME'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'OPERATION_ID'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'SOURCE_ID'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'DEST_ID'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'DEST_NAME'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'OBJ_ID'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'STR_PARAM_1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'STR_PARAM_2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'STR_PARAM_3'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'INT_PARAM_1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'INT_PARAM_2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'INT_PARAM_3'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'CREATE_DT'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = Null
      end>
    Left = 640
    Top = 144
  end
  object LocalMessageTableCDS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'MSGTableDSP'
    Left = 640
    Top = 208
  end
  object MSGTableDSP: TDataSetProvider
    DataSet = TDMessagesADOT
    Left = 640
    Top = 176
  end
  object LocalMSGDS: TDataSource
    DataSet = LocalMessageTableCDS
    Left = 640
    Top = 240
  end
  object RemoteProcessedOrdersADOQ: TADOQuery
    Connection = ServerMainForm.MainBASEADOC
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT ord.*, ISNULL(op.PRIORITY,-1) as PRIORITY'
      'FROM (SELECT * FROM Zakaz WHERE '
      '(REMOTE_SET<>0) AND (REMOTE_SET<99) '
      'AND (Arhivnyi=0) AND (Zavershyon=0) AND '
      '(Soobsheno_voditelyu=0)) ord LEFT JOIN ORDER_PRIORITY op'
      'ON ord.BOLD_ID=op.ORDER_ID')
    Left = 24
    Top = 64
  end
  object RemoteProcessedOrdersDS: TDataSource
    DataSet = RemoteProcessedOrdersADOQ
    Left = 24
    Top = 96
  end
  object SetOrderParamADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetOrderParam;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@bold_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@param_name'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@int_value'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@str_value'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@float_value'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@res'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 24
    Top = 128
  end
  object ConnectionCheckTimer: TTimer
    Interval = 60000
    OnTimer = ConnectionCheckTimerTimer
    Left = 120
    Top = 8
  end
  object RDataStateADODS: TADODataSet
    Connection = RemoteServerADOC
    CursorType = ctStatic
    CommandText = 'select COUNT(*) as tdm_count  from td_messages'
    Parameters = <>
    Left = 640
    Top = 112
  end
  object RequestIdHTTP: TIdHTTP
    AuthRetries = 0
    AuthProxyRetries = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 464
    Top = 8
  end
  object SMSServiceIdHTTP: TIdHTTP
    AuthRetries = 0
    AuthProxyRetries = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 432
    Top = 8
  end
  object SocketCheckTimer: TTimer
    Interval = 5000
    OnTimer = SocketCheckTimerTimer
    Left = 80
    Top = 8
  end
  object AutorizedVerifyADODS: TADODataSet
    Connection = ServerMainForm.MainBASEADOC
    CursorType = ctStatic
    CommandText = 
      'select BOLD_ID, Pozyvnoi, V_rabote, Na_pereryve, rabotaet_na_sek' +
      'tore from Voditelj '#13#10'WHERE REMOTE_LOGIN=:login AND REMOTE_PASSWO' +
      'RD=:psw and ITS_REMOTE_CLIENT=1 and '#13#10'((dbo.GetDriversMinBalance' +
      '()< DRIVER_BALANCE) or '#13#10'(dbo.GetUseDrBCounter()<>1) '#13#10'or (use_d' +
      'yn_balance<>1))'
    Parameters = <
      item
        Name = 'login'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'psw'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    Left = 64
    Top = 64
  end
  object IncOrdersPriorityADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'IncrementOrdersPriority;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@max_priority'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 24
    Top = 160
  end
  object AllActiveDriversADODS: TADODataSet
    Connection = ServerMainForm.MainBASEADOC
    CommandText = 
      'select BOLD_ID, Pozyvnoi from Voditelj '#13#10'where V_rabote=1 AND '#13#10 +
      '((Zanyat_drugim_disp=0 ) OR (1=:include_all) )'#13#10'AND Na_pereryve=' +
      '0 AND '#13#10' Priority=:order_priority AND ITS_REMOTE_CLIENT=1 '#13#10'AND ' +
      'REMOTE_STATUS>0'
    Parameters = <
      item
        Name = 'include_all'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'order_priority'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 64
    Top = 96
  end
  object AllActDrOnSectADODS: TADODataSet
    Connection = ServerMainForm.MainBASEADOC
    CommandText = 
      'select BOLD_ID, Pozyvnoi from Voditelj '#13#10'where V_rabote=1 AND ((' +
      'Zanyat_drugim_disp=0) OR (1=:include_all) )'#13#10'AND Na_pereryve=0 A' +
      'ND rabotaet_na_sektore=:sector_id AND '#13#10' Priority=:order_priorit' +
      'y AND ITS_REMOTE_CLIENT=1 '#13#10'AND REMOTE_STATUS>0'
    Parameters = <
      item
        Name = 'include_all'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'sector_id'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'order_priority'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 64
    Top = 128
  end
  object SetDriverOnLineADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetDriverOnLine;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@driver_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 24
    Top = 192
  end
  object SetOrderRemoteStatusADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetOrderRemoteStatus;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@status'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 24
    Top = 224
  end
  object DriverByNumADODS: TADODataSet
    Connection = ServerMainForm.MainBASEADOC
    CommandText = 'select *  from Voditelj '#13#10'where Pozyvnoi>0 and Pozyvnoi=:poz'
    Parameters = <
      item
        Name = 'poz'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 104
    Top = 64
  end
  object SetIndOrderSendADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetIndOrderSendStatus;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@indiv_priority'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 24
    Top = 256
  end
  object SetOrdOcAtStatADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetOrderOccupAttemptStatus;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@dr_num'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 24
    Top = 288
  end
  object SetOnHandOrdGoADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetOnHandOrderGoStatus;1'
    Parameters = <>
    Left = 64
    Top = 192
  end
  object SetOrderGoADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetOrderGoStatus;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@dr_num'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 64
    Top = 160
  end
  object AllowOrdDispCancelADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetOrderDispCancelAllowStatus;1'
    Parameters = <>
    Left = 64
    Top = 224
  end
  object AttOrdCompleteADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetOrderCompleteAttemptStatus;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@dr_num'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@summ'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 64
    Top = 256
  end
  object AllDriversADOT: TADOTable
    Connection = ServerMainForm.MainBASEADOC
    TableName = 'Voditelj'
    Left = 104
    Top = 96
  end
  object GetDrQueuePosADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'GetDriverQueuePosition;1'
    Parameters = <>
    Left = 104
    Top = 128
  end
  object SetDrRemStatusADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetDriverRemoteStatus;1'
    Parameters = <>
    Left = 104
    Top = 160
  end
  object InsOrdWithStatusADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'InsertOrderWithStatus;1'
    Parameters = <>
    Left = 104
    Top = 192
  end
  object AutoSetDriverADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'AutoSetFromPretendents;1'
    Parameters = <>
    Left = 104
    Top = 224
  end
  object AutoSetOrdFinishADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'AutoSetOrderFinished;1'
    Parameters = <>
    Left = 104
    Top = 256
  end
  object SetDrSectorADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetDriverSector;1'
    Parameters = <>
    Left = 64
    Top = 288
  end
  object GetJSONSectorListADOQ: TADOQuery
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <
      item
        Name = 'driver_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.GetJSONSectorList(:driver_id) as sector_list')
    Left = 144
    Top = 64
  end
  object GetDrSectorNameADOQ: TADOQuery
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <
      item
        Name = 'driver_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dict.Naimenovanie as sector_name'
      'FROM Voditelj dr JOIN Sektor_raboty wsc '
      'ON dr.rabotaet_na_sektore=wsc.BOLD_ID '
      'JOIN Spravochnik dict ON '
      'wsc.BOLD_ID=dict.BOLD_ID'
      'WHERE dr.BOLD_ID=:driver_id')
    Left = 144
    Top = 96
  end
  object AcceptingsSelADODS: TADODataSet
    Connection = ServerMainForm.MainBASEADOC
    CommandText = 
      'select oa.DRIVER_NUM, oa.DRIVER_ID  '#13#10'from ORDER_ACCEPTING oa LE' +
      'FT JOIN  Voditelj dr '#13#10'ON oa.DRIVER_ID=dr.BOLD_ID '#13#10'WHERE oa.ORD' +
      'ER_ID=:order_id AND '#13#10'((oa.DRIVER_ID=:driver_id) OR (0>:driver_i' +
      'd2))'
    Parameters = <
      item
        Name = 'order_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'driver_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'driver_id2'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 144
    Top = 128
  end
  object GetDrStatusJSONADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'GetJSONDriverStatus;1'
    Parameters = <>
    Left = 104
    Top = 288
  end
  object DriversADOT: TADODataSet
    Connection = ServerMainForm.MainBASEADOC
    CursorType = ctStatic
    CommandText = 'select *  from Voditelj '#13#10'where ITS_REMOTE_CLIENT=1'
    Parameters = <>
    Left = 144
    Top = 160
  end
  object DriversDS: TDataSource
    DataSet = DriversADOT
    Left = 144
    Top = 192
  end
  object SetDrSyncStatusADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetDriverStatSyncStatus;1'
    Parameters = <>
    Left = 144
    Top = 224
  end
  object SettingsADODS: TADODataSet
    Connection = ServerMainForm.MainBASEADOC
    CursorType = ctStatic
    CommandText = 
      'select TOP 1 *  from Objekt_vyborki_otchyotnosti'#13#10'WHERE Tip_obje' +
      'kta='#39'for_drivers'#39
    Parameters = <>
    Left = 144
    Top = 256
    object SettingsADODSBOLD_ID: TIntegerField
      FieldName = 'BOLD_ID'
    end
    object SettingsADODSBOLD_TYPE: TSmallintField
      FieldName = 'BOLD_TYPE'
    end
    object SettingsADODSTip_objekta: TStringField
      FieldName = 'Tip_objekta'
      Size = 255
    end
    object SettingsADODSData_nachala: TDateTimeField
      FieldName = 'Data_nachala'
    end
    object SettingsADODSData_konca: TDateTimeField
      FieldName = 'Data_konca'
    end
    object SettingsADODSProcent_otchisleniya: TBCDField
      FieldName = 'Procent_otchisleniya'
      Precision = 28
      Size = 10
    end
    object SettingsADODSFiljtr_pozyvnoi: TIntegerField
      FieldName = 'Filjtr_pozyvnoi'
    end
    object SettingsADODSFiljtr_data_nachala: TDateTimeField
      FieldName = 'Filjtr_data_nachala'
    end
    object SettingsADODSFiljtr_data_konca: TDateTimeField
      FieldName = 'Filjtr_data_konca'
    end
    object SettingsADODSCvet_prinyatyh: TStringField
      FieldName = 'Cvet_prinyatyh'
      Size = 255
    end
    object SettingsADODSCvet_nachavshihsya: TStringField
      FieldName = 'Cvet_nachavshihsya'
      Size = 255
    end
    object SettingsADODSCvet_okonchivshihsya: TStringField
      FieldName = 'Cvet_okonchivshihsya'
      Size = 255
    end
    object SettingsADODSVybratj_poslednie_nesk_dnei: TIntegerField
      FieldName = 'Vybratj_poslednie_nesk_dnei'
    end
    object SettingsADODSKol_posl_dnei: TBCDField
      FieldName = 'Kol_posl_dnei'
      Precision = 28
      Size = 10
    end
    object SettingsADODSData_minus_vybir_dni: TDateTimeField
      FieldName = 'Data_minus_vybir_dni'
    end
    object SettingsADODSNomer_pozyvnoi_filjtr: TIntegerField
      FieldName = 'Nomer_pozyvnoi_filjtr'
    end
    object SettingsADODSCvet_predvarit: TStringField
      FieldName = 'Cvet_predvarit'
      Size = 255
    end
    object SettingsADODSData_po_umolchaniyu: TDateTimeField
      FieldName = 'Data_po_umolchaniyu'
    end
    object SettingsADODSAvtozapoln_sektorov: TIntegerField
      FieldName = 'Avtozapoln_sektorov'
    end
    object SettingsADODSNaznach_iz_obsh__spiska: TIntegerField
      FieldName = 'Naznach_iz_obsh__spiska'
    end
    object SettingsADODSrep_time: TDateTimeField
      FieldName = 'rep_time'
    end
    object SettingsADODSAvtozap_konechn_sekt: TIntegerField
      FieldName = 'Avtozap_konechn_sekt'
    end
    object SettingsADODSAvtozap_nach_sektora: TIntegerField
      FieldName = 'Avtozap_nach_sektora'
    end
    object SettingsADODSSoobsh_o_netochn_sekt_reg: TIntegerField
      FieldName = 'Soobsh_o_netochn_sekt_reg'
    end
    object SettingsADODSZapros_konech_sektora: TIntegerField
      FieldName = 'Zapros_konech_sektora'
    end
    object SettingsADODSZapros_nach_sektora: TIntegerField
      FieldName = 'Zapros_nach_sektora'
    end
    object SettingsADODSIspoljz_priz_1: TIntegerField
      FieldName = 'Ispoljz_priz_1'
    end
    object SettingsADODSIspoljz_priz_2: TIntegerField
      FieldName = 'Ispoljz_priz_2'
    end
    object SettingsADODSIspoljz_priz_3: TIntegerField
      FieldName = 'Ispoljz_priz_3'
    end
    object SettingsADODSKoeff_prizov_sbavki_1: TBCDField
      FieldName = 'Koeff_prizov_sbavki_1'
      Precision = 28
      Size = 10
    end
    object SettingsADODSKoeff_prizov_sbavki_2: TBCDField
      FieldName = 'Koeff_prizov_sbavki_2'
      Precision = 28
      Size = 10
    end
    object SettingsADODSKoeff_prizov_sbavki_3: TBCDField
      FieldName = 'Koeff_prizov_sbavki_3'
      Precision = 28
      Size = 10
    end
    object SettingsADODSPrizovoe_kolichestvo_1: TIntegerField
      FieldName = 'Prizovoe_kolichestvo_1'
    end
    object SettingsADODSPrizovoe_kolichestvo_2: TIntegerField
      FieldName = 'Prizovoe_kolichestvo_2'
    end
    object SettingsADODSPrizovoe_kolichestvo_3: TIntegerField
      FieldName = 'Prizovoe_kolichestvo_3'
    end
    object SettingsADODSVelichina_priz_sbavki_1: TBCDField
      FieldName = 'Velichina_priz_sbavki_1'
      Precision = 28
      Size = 10
    end
    object SettingsADODSVelichina_priz_sbavki_2: TBCDField
      FieldName = 'Velichina_priz_sbavki_2'
      Precision = 28
      Size = 10
    end
    object SettingsADODSVelichina_priz_sbavki_3: TBCDField
      FieldName = 'Velichina_priz_sbavki_3'
      Precision = 28
      Size = 10
    end
    object SettingsADODSRegim_dispetchera: TIntegerField
      FieldName = 'Regim_dispetchera'
    end
    object SettingsADODSEstj_nachatye: TIntegerField
      FieldName = 'Estj_nachatye'
    end
    object SettingsADODSEstj_otpravlennye: TIntegerField
      FieldName = 'Estj_otpravlennye'
    end
    object SettingsADODSNe_uchit_zanyat_drug_disp: TIntegerField
      FieldName = 'Ne_uchit_zanyat_drug_disp'
    end
    object SettingsADODSKolich_deg_grupp: TIntegerField
      FieldName = 'Kolich_deg_grupp'
    end
    object SettingsADODSPer_obnovl_deg: TStringField
      FieldName = 'Per_obnovl_deg'
      Size = 255
    end
    object SettingsADODSPer_obnovl_obychn_vod: TStringField
      FieldName = 'Per_obnovl_obychn_vod'
      Size = 255
    end
    object SettingsADODSSutki_deg_gruppy: TDateTimeField
      FieldName = 'Sutki_deg_gruppy'
    end
    object SettingsADODSTek_deg_gruppa: TIntegerField
      FieldName = 'Tek_deg_gruppa'
    end
    object SettingsADODSVr_smeny_deg_grupp: TStringField
      FieldName = 'Vr_smeny_deg_grupp'
      Size = 255
    end
    object SettingsADODSKolich_vyd_benzina: TBCDField
      FieldName = 'Kolich_vyd_benzina'
      Precision = 28
      Size = 10
    end
    object SettingsADODSKomment_k_rabote: TStringField
      FieldName = 'Komment_k_rabote'
      Size = 255
    end
    object SettingsADODSNamen_organizacii: TStringField
      FieldName = 'Namen_organizacii'
      Size = 255
    end
    object SettingsADODSNapravlenie_1: TStringField
      FieldName = 'Napravlenie_1'
      Size = 255
    end
    object SettingsADODSNapravlenie_2: TStringField
      FieldName = 'Napravlenie_2'
      Size = 255
    end
    object SettingsADODSNapravlenie_3: TStringField
      FieldName = 'Napravlenie_3'
      Size = 255
    end
    object SettingsADODSNom_putevogo_lista: TIntegerField
      FieldName = 'Nom_putevogo_lista'
    end
    object SettingsADODSPutev_list_seriya: TStringField
      FieldName = 'Putev_list_seriya'
      Size = 255
    end
    object SettingsADODSBetweenOnEnd: TDateTimeField
      FieldName = 'BetweenOnEnd'
    end
    object SettingsADODSBetweenSetOn: TDateTimeField
      FieldName = 'BetweenSetOn'
    end
    object SettingsADODSBetweenStartSet: TDateTimeField
      FieldName = 'BetweenStartSet'
    end
    object SettingsADODSBetweenOnEndColor: TStringField
      FieldName = 'BetweenOnEndColor'
      Size = 255
    end
    object SettingsADODSBetweenSetOnColor: TStringField
      FieldName = 'BetweenSetOnColor'
      Size = 255
    end
    object SettingsADODSBetweenStartSetColor: TStringField
      FieldName = 'BetweenStartSetColor'
      Size = 255
    end
    object SettingsADODSBetweenSetEnd: TDateTimeField
      FieldName = 'BetweenSetEnd'
    end
    object SettingsADODSBetweenSetEndColor: TStringField
      FieldName = 'BetweenSetEndColor'
      Size = 255
    end
    object SettingsADODSViewSetEndLong: TIntegerField
      FieldName = 'ViewSetEndLong'
    end
    object SettingsADODScvet_obshepriz: TStringField
      FieldName = 'cvet_obshepriz'
      Size = 255
    end
    object SettingsADODScvet_so_skidkoi: TStringField
      FieldName = 'cvet_so_skidkoi'
      Size = 255
    end
    object SettingsADODSobshepriz_chislo: TIntegerField
      FieldName = 'obshepriz_chislo'
    end
    object SettingsADODSobshepriz_schyotchik: TIntegerField
      FieldName = 'obshepriz_schyotchik'
    end
    object SettingsADODSsimv_avtom_ustan: TIntegerField
      FieldName = 'simv_avtom_ustan'
    end
    object SettingsADODSschit_okon_posl_kon_sekt: TIntegerField
      FieldName = 'schit_okon_posl_kon_sekt'
    end
    object SettingsADODSvr_smeny_dispetcherov: TStringField
      FieldName = 'vr_smeny_dispetcherov'
      Size = 255
    end
    object SettingsADODSuse_bonus3: TIntegerField
      FieldName = 'use_bonus3'
    end
    object SettingsADODSuse_bonus4: TIntegerField
      FieldName = 'use_bonus4'
    end
    object SettingsADODSPrizovoe_kolichestvo_4: TIntegerField
      FieldName = 'Prizovoe_kolichestvo_4'
    end
    object SettingsADODSDAYLY_SALE: TBCDField
      FieldName = 'DAYLY_SALE'
      Precision = 28
      Size = 10
    end
    object SettingsADODSMIN_DEBET: TBCDField
      FieldName = 'MIN_DEBET'
      Precision = 28
      Size = 10
    end
    object SettingsADODSview_bonuses: TIntegerField
      FieldName = 'view_bonuses'
    end
    object SettingsADODSview_ab_bonuses: TIntegerField
      FieldName = 'view_ab_bonuses'
    end
    object SettingsADODSuse_ab_account: TIntegerField
      FieldName = 'use_ab_account'
    end
    object SettingsADODSdb_version: TIntegerField
      FieldName = 'db_version'
    end
    object SettingsADODSuse_dr_priority: TIntegerField
      FieldName = 'use_dr_priority'
    end
    object SettingsADODSdir_dr_autoset: TIntegerField
      FieldName = 'dir_dr_autoset'
    end
    object SettingsADODSauto_order_arhive: TIntegerField
      FieldName = 'auto_order_arhive'
    end
    object SettingsADODSlast_arh_date: TDateTimeField
      FieldName = 'last_arh_date'
    end
    object SettingsADODSmin_days_delta: TIntegerField
      FieldName = 'min_days_delta'
    end
    object SettingsADODSsectors_wbroadcast: TStringField
      FieldName = 'sectors_wbroadcast'
      Size = 5000
    end
    object SettingsADODSuse_sect_wbroadcast: TIntegerField
      FieldName = 'use_sect_wbroadcast'
    end
    object SettingsADODShas_sect_wbroadcast: TIntegerField
      FieldName = 'has_sect_wbroadcast'
    end
    object SettingsADODSsync_busy_accounting: TIntegerField
      FieldName = 'sync_busy_accounting'
    end
    object SettingsADODScurr_mob_version: TIntegerField
      FieldName = 'curr_mob_version'
    end
    object SettingsADODSmin_mob_version: TIntegerField
      FieldName = 'min_mob_version'
    end
    object SettingsADODSmandatory_update: TIntegerField
      FieldName = 'mandatory_update'
    end
    object SettingsADODSaddit_rem_params: TStringField
      FieldName = 'addit_rem_params'
      Size = 500
    end
    object SettingsADODSGPS_SRV_ADR: TStringField
      FieldName = 'GPS_SRV_ADR'
      Size = 255
    end
    object SettingsADODSforders_wbroadcast: TStringField
      FieldName = 'forders_wbroadcast'
      Size = 5000
    end
    object SettingsADODSuse_ford_wbroadcast: TIntegerField
      FieldName = 'use_ford_wbroadcast'
    end
    object SettingsADODShas_ford_wbroadcast: TIntegerField
      FieldName = 'has_ford_wbroadcast'
    end
    object SettingsADODSto_show_fords: TSmallintField
      FieldName = 'to_show_fords'
    end
    object SettingsADODSclsms_ordground: TSmallintField
      FieldName = 'clsms_ordground'
    end
    object SettingsADODSsend_wait_info: TSmallintField
      FieldName = 'send_wait_info'
    end
    object SettingsADODSsend_prev_wait: TSmallintField
      FieldName = 'send_prev_wait'
    end
    object SettingsADODSuse_dr_balance_counter: TIntegerField
      FieldName = 'use_dr_balance_counter'
    end
    object SettingsADODSdont_reset_dr_queue: TSmallintField
      FieldName = 'dont_reset_dr_queue'
    end
    object SettingsADODSodirect_to_dsect: TSmallintField
      FieldName = 'odirect_to_dsect'
    end
    object SettingsADODSftime_tariff: TBCDField
      FieldName = 'ftime_tariff'
      Precision = 28
      Size = 10
    end
    object SettingsADODSrecalc_on_timeset: TSmallintField
      FieldName = 'recalc_on_timeset'
    end
    object SettingsADODSdrcalc_start_date: TWideStringField
      FieldName = 'drcalc_start_date'
      Size = 10
    end
    object SettingsADODSorder_sort_dr_assign: TSmallintField
      FieldName = 'order_sort_dr_assign'
    end
    object SettingsADODStmeter_tariff: TBCDField
      FieldName = 'tmeter_tariff'
      Precision = 28
      Size = 10
    end
    object SettingsADODStaropt_accounting: TSmallintField
      FieldName = 'taropt_accounting'
    end
    object SettingsADODSautotarif_by_driver: TSmallintField
      FieldName = 'autotarif_by_driver'
    end
    object SettingsADODSovertar_by_driver: TSmallintField
      FieldName = 'overtar_by_driver'
    end
    object SettingsADODSautotarif_by_tplan: TSmallintField
      FieldName = 'autotarif_by_tplan'
    end
    object SettingsADODSday_payment: TBCDField
      FieldName = 'day_payment'
      Precision = 28
      Size = 10
    end
    object SettingsADODSmanual_day_sale: TSmallintField
      FieldName = 'manual_day_sale'
    end
    object SettingsADODSdayli_pay_time_offset: TIntegerField
      FieldName = 'dayli_pay_time_offset'
    end
    object SettingsADODSnew_wperiod_opercent: TBCDField
      FieldName = 'new_wperiod_opercent'
      Precision = 28
      Size = 10
    end
    object SettingsADODScheck_net_time: TSmallintField
      FieldName = 'check_net_time'
    end
    object SettingsADODSlast_net_time: TDateTimeField
      FieldName = 'last_net_time'
    end
    object SettingsADODStest_phone: TStringField
      FieldName = 'test_phone'
      Size = 50
    end
    object SettingsADODSdisp_phone: TStringField
      FieldName = 'disp_phone'
      Size = 50
    end
    object SettingsADODSmanager_phone: TStringField
      FieldName = 'manager_phone'
      Size = 50
    end
    object SettingsADODScall_demon_locsip_name: TStringField
      FieldName = 'call_demon_locsip_name'
      Size = 50
    end
    object SettingsADODScall_demon_netsip_name: TStringField
      FieldName = 'call_demon_netsip_name'
      Size = 50
    end
    object SettingsADODSdemon_call_ctx: TStringField
      FieldName = 'demon_call_ctx'
      Size = 50
    end
    object SettingsADODSdemon_call_virtext: TStringField
      FieldName = 'demon_call_virtext'
      Size = 50
    end
    object SettingsADODSdemon_call_priority: TStringField
      FieldName = 'demon_call_priority'
    end
    object SettingsADODSdemon_call_timeout: TStringField
      FieldName = 'demon_call_timeout'
    end
    object SettingsADODSdemon_callerid: TStringField
      FieldName = 'demon_callerid'
      Size = 50
    end
    object SettingsADODSclord_sort_dassign: TSmallintField
      FieldName = 'clord_sort_dassign'
    end
    object SettingsADODSmax_clrereg_cnt: TSmallintField
      FieldName = 'max_clrereg_cnt'
    end
    object SettingsADODSfix_order_pay_with_daily_pay: TSmallintField
      FieldName = 'fix_order_pay_with_daily_pay'
    end
    object SettingsADODSclsms_onplaceto: TSmallintField
      FieldName = 'clsms_onplaceto'
    end
    object SettingsADODSdont_show_auto_count: TSmallintField
      FieldName = 'dont_show_auto_count'
    end
    object SettingsADODSdont_show_auto_coords: TSmallintField
      FieldName = 'dont_show_auto_coords'
    end
    object SettingsADODSdont_show_driver_info: TSmallintField
      FieldName = 'dont_show_driver_info'
    end
    object SettingsADODSauto_bsector_longorders: TSmallintField
      FieldName = 'auto_bsector_longorders'
    end
    object SettingsADODSauto_bsectorid_longorders: TIntegerField
      FieldName = 'auto_bsectorid_longorders'
    end
    object SettingsADODSauto_bsector_longtime: TIntegerField
      FieldName = 'auto_bsector_longtime'
    end
    object SettingsADODSauto_bsector_onlineorders: TSmallintField
      FieldName = 'auto_bsector_onlineorders'
    end
    object SettingsADODSauto_bsectorid_onlineorders: TIntegerField
      FieldName = 'auto_bsectorid_onlineorders'
    end
    object SettingsADODSauto_bsector_onlinetime: TIntegerField
      FieldName = 'auto_bsector_onlinetime'
    end
    object SettingsADODSauto_neardriver_onlineorders: TSmallintField
      FieldName = 'auto_neardriver_onlineorders'
    end
    object SettingsADODSauto_neardriver_onlinetime: TIntegerField
      FieldName = 'auto_neardriver_onlinetime'
    end
    object SettingsADODSneardriver_online_byord_geocode: TSmallintField
      FieldName = 'neardriver_online_byord_geocode'
    end
    object SettingsADODSauto_neardriver_allorders: TSmallintField
      FieldName = 'auto_neardriver_allorders'
    end
    object SettingsADODSauto_neardriver_alltime: TIntegerField
      FieldName = 'auto_neardriver_alltime'
    end
    object SettingsADODSneardriver_all_byord_geocode: TSmallintField
      FieldName = 'neardriver_all_byord_geocode'
    end
    object SettingsADODSclsms_offlinedr_assign: TSmallintField
      FieldName = 'clsms_offlinedr_assign'
    end
    object SettingsADODSuse_kladr: TSmallintField
      FieldName = 'use_kladr'
    end
    object SettingsADODSkladr_object_code: TStringField
      FieldName = 'kladr_object_code'
      Size = 50
    end
    object SettingsADODScurrency_short: TStringField
      FieldName = 'currency_short'
      Size = 50
    end
    object SettingsADODSstate_phone_code: TStringField
      FieldName = 'state_phone_code'
      Size = 50
    end
    object SettingsADODSuse_fordbroadcast_priority: TSmallintField
      FieldName = 'use_fordbroadcast_priority'
    end
    object SettingsADODSauto_bsect_notmanual_ord: TSmallintField
      FieldName = 'auto_bsect_notmanual_ord'
    end
    object SettingsADODSauto_close_client_canceling: TSmallintField
      FieldName = 'auto_close_client_canceling'
    end
    object SettingsADODSauto_close_clcancel_time: TIntegerField
      FieldName = 'auto_close_clcancel_time'
    end
    object SettingsADODSsip1_robot_active_time: TDateTimeField
      FieldName = 'sip1_robot_active_time'
    end
    object SettingsADODSsip2_robot_active_time: TDateTimeField
      FieldName = 'sip2_robot_active_time'
    end
    object SettingsADODSrobot_active_time_interval: TIntegerField
      FieldName = 'robot_active_time_interval'
    end
    object SettingsADODSreplace_sms_with_robot: TSmallintField
      FieldName = 'replace_sms_with_robot'
    end
    object SettingsADODSuse_call_robot: TSmallintField
      FieldName = 'use_call_robot'
    end
    object SettingsADODSstart_first_song_code: TIntegerField
      FieldName = 'start_first_song_code'
    end
    object SettingsADODSonplace_first_song_code: TIntegerField
      FieldName = 'onplace_first_song_code'
    end
    object SettingsADODSweb_protected_code: TStringField
      FieldName = 'web_protected_code'
      Size = 50
    end
    object SettingsADODSauto_arh_empty_orders: TSmallintField
      FieldName = 'auto_arh_empty_orders'
    end
    object SettingsADODSno_percent_before: TSmallintField
      FieldName = 'no_percent_before'
    end
    object SettingsADODSno_percent_before_summ: TBCDField
      FieldName = 'no_percent_before_summ'
      Precision = 28
      Size = 10
    end
    object SettingsADODSno_percent_before_payment: TBCDField
      FieldName = 'no_percent_before_payment'
      Precision = 28
      Size = 10
    end
    object SettingsADODSuse_prize_reserved_limit: TSmallintField
      FieldName = 'use_prize_reserved_limit'
    end
    object SettingsADODSprize_reserved_limit: TIntegerField
      FieldName = 'prize_reserved_limit'
    end
    object SettingsADODSprize_reward_summ: TBCDField
      FieldName = 'prize_reward_summ'
      Precision = 28
      Size = 10
    end
    object SettingsADODSlock_reserv_on_limit: TSmallintField
      FieldName = 'lock_reserv_on_limit'
    end
  end
  object SettingsDS: TDataSource
    DataSet = SettingsADODS
    Left = 144
    Top = 288
  end
  object RModuleAL: TActionList
    Left = 184
    Top = 64
    object SettingsDSP: TDataSetPost
      Category = 'Dataset'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      DataSource = SettingsDS
    end
  end
  object RemoteModIdAntiFreeze: TIdAntiFreeze
    OnlyWhenIdle = False
    Left = 400
    Top = 8
  end
  object IdTCPServer1: TIdTCPServer
    Bindings = <>
    DefaultPort = 0
    Left = 400
    Top = 40
  end
  object GetJSONDriversListADOQ: TADOQuery
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <>
    Left = 184
    Top = 96
  end
  object OneMinuteTaskADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'OneMinuteTask;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@success'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 184
    Top = 128
  end
  object AutoArhADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'MoveOrdPortionToArhived2V;1'
    Parameters = <>
    Left = 184
    Top = 160
  end
  object AutoArhivedTimer: TTimer
    Interval = 20000
    OnTimer = AutoArhivedTimerTimer
    Left = 168
    Top = 8
  end
  object SetDrSectStatADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetDriverSectWBrodcastStatus;1'
    Parameters = <>
    Left = 184
    Top = 192
  end
  object ResetSectBroadcastADOC: TADOCommand
    CommandText = 'UPDATE Objekt_vyborki_otchyotnosti '#13#10'SET has_sect_wbroadcast=0'
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <>
    Left = 184
    Top = 224
  end
  object DriverSettingsADODS: TADODataSet
    Connection = ServerMainForm.MainBASEADOC
    CommandText = 'SELECT dbo.GetJSONDriverSettings(:driver_id) as driver_sets'
    Parameters = <
      item
        Name = 'driver_id'
        Size = -1
        Value = Null
      end>
    Left = 184
    Top = 256
  end
  object ResetOrdBroadcastADOC: TADOCommand
    CommandText = 'UPDATE Objekt_vyborki_otchyotnosti '#13#10'SET has_ford_wbroadcast=0'
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <>
    Left = 184
    Top = 288
  end
  object ProceedOpRequestADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'ProceedOperationRequest;1'
    Parameters = <>
    Left = 224
    Top = 64
  end
  object SetOrdOcAtStat2ADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetOrderOccupAttemptStatus2;1'
    Parameters = <>
    Left = 224
    Top = 96
  end
  object SetOrdDrCAttStADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetOrderDriverCancelAttStatus;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@dr_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 224
    Top = 128
  end
  object InsertEventADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'InsertEvent;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@etype_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@driver_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@sector_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@edate'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@description'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2000
        Value = Null
      end
      item
        Name = '@adres'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@phone'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@dr_num'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 224
    Top = 160
  end
  object SetSectDirectionADOC: TADOCommand
    CommandText = 
      'UPDATE Zakaz '#13#10'SET direct_sect_id=:sector_id'#13#10'WHERE BOLD_ID=:ord' +
      'er_id'
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <
      item
        Name = 'sector_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'order_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 224
    Top = 192
  end
  object InsertOrdWithParamADOOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'InsertOrderWithParams;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@adres'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@phone'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@disp_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@status'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@color_check'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@op_order'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@gsm_detect_code'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@deny_duplicate'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@colored_new'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@ab_num'
        Attributes = [paNullable]
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = '@ord_num'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 224
    Top = 224
  end
  object SMSServiceIdHTTPPOST: TIdHTTP
    AuthRetries = 0
    AuthProxyRetries = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 432
    Top = 40
  end
  object OnPlaceADOC: TADOCommand
    CommandText = 
      'UPDATE Zakaz SET on_place=1, Data_na_tochke=GETDATE() '#13#10'WHERE BO' +
      'LD_ID=:order_id'
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <
      item
        Name = 'order_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 224
    Top = 256
  end
  object AttOrdCompleteADOSP2: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetOrderCompleteAttemptStatus2;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@driver_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@summ'
        Attributes = [paNullable]
        DataType = ftFloat
        Precision = 15
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end
      item
        Name = '@status'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@order_time'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 224
    Top = 288
  end
  object GetDrLockOnCalcDebtADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'GetDrLockOnCalcDebt;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@dr_num'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@res'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 264
    Top = 64
  end
  object SetDriverOutLineADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetDriverOutLine;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@driver_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 264
    Top = 96
  end
  object InsertEvent2ADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'InsertEvent2;1'
    Parameters = <>
    Left = 264
    Top = 128
  end
  object SetDrGPSRequStatusADOC: TADOCommand
    CommandText = 
      'UPDATE Voditelj SET GPSC_REQU_FLAG=:status '#13#10'WHERE BOLD_ID=:driv' +
      'er_id'
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <
      item
        Name = 'status'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'driver_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 264
    Top = 160
  end
  object AttOrdCompleteADOSP3: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetOrderCompleteAttemptStatus3;1'
    Parameters = <>
    Left = 264
    Top = 192
  end
  object GetTOListADOQ: TADOQuery
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <>
    SQL.Strings = (
      'select dbo.GetJSONTarifAndOptionsList() as to_list')
    Left = 264
    Top = 224
  end
  object SetTarifADOC: TADOCommand
    CommandText = 'UPDATE Zakaz SET TARIFF_ID=:tarif_id '#13#10'WHERE BOLD_ID=:order_id'
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <
      item
        Name = 'tarif_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'order_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 264
    Top = 256
  end
  object SetOptCombADOC: TADOCommand
    CommandText = 
      'UPDATE Zakaz SET OPT_COMB_STR=:opts_comb '#13#10'WHERE BOLD_ID=:order_' +
      'id'
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <
      item
        Name = 'opts_comb'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'order_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 264
    Top = 288
  end
  object SetDrPaymentStatusADOC: TADOCommand
    CommandText = 
      'UPDATE Voditelj SET daily_paym_status=:dpstat WHERE BOLD_ID=:dri' +
      'ver_id'
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <
      item
        Name = 'dpstat'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'driver_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 304
    Top = 160
  end
  object SetDrDailyPStatusADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'SetDriverDailyPaymStatus;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@driver_id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@pstatus'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@count'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 304
    Top = 96
  end
  object One10SecTaskADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'One10SecTask;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@success'
        Attributes = [paNullable]
        DataType = ftInteger
        Direction = pdInputOutput
        Precision = 10
        Value = Null
      end>
    Left = 304
    Top = 128
  end
  object Timer10Sec: TTimer
    Interval = 10000
    OnTimer = Timer10SecTimer
    Left = 208
    Top = 8
  end
  object DecrementOrdersPriorityADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'DecrementDrOrdPriorities;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end>
    Left = 304
    Top = 64
  end
  object PriorityDriversADODS: TADODataSet
    Connection = ServerMainForm.MainBASEADOC
    CommandText = 'select BOLD_ID, Pozyvnoi, forders_wbroadcast from Voditelj'
    Parameters = <>
    Left = 304
    Top = 192
  end
  object SetOrderEmptyDriverADOC: TADOCommand
    CommandText = 
      'UPDATE Zakaz '#13#10'SET Pozyvnoi_ustan=0, vypolnyaetsya_voditelem=-1,' +
      ' REMOTE_SET=0, REMOTE_DRNUM=0, CLIENT_SMS_SEND_STATE=0, Individ_' +
      'order=0, SECTOR_ID=-1, WAITING=0, OPT_COMB_STR='#39'-'#39', TARIFF_ID=-1' +
      ', PR_POLICY_ID=-1'#13#10'WHERE BOLD_ID=:order_id'
    Connection = ServerMainForm.MainBASEADOC
    Parameters = <
      item
        Name = 'order_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 304
    Top = 224
  end
  object ManualSetOrdRemStatADOSP: TADOStoredProc
    Connection = ServerMainForm.MainBASEADOC
    ProcedureName = 'ManualSetOrderRemoteStatus;1'
    Parameters = <>
    Left = 304
    Top = 256
  end
  object SputnikApiHTTP: TIdHTTP
    AuthRetries = 0
    AuthProxyRetries = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 464
    Top = 40
  end
end