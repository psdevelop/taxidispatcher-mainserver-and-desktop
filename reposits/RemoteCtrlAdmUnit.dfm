object RemoteCtrlAdmForm: TRemoteCtrlAdmForm
  Left = 0
  Top = 0
  Width = 686
  Height = 442
  Caption = #1055#1072#1085#1077#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1103' '#1074#1086#1076#1080#1090#1077#1083#1077#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 374
    Width = 678
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 16
      Top = 8
      Width = 137
      Height = 25
      Action = ADOConnectDM.RemoteCtrlAdmDSP
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
    end
    object BitBtn14: TBitBtn
      Left = 162
      Top = 8
      Width = 121
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 1
      OnClick = BitBtn14Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 678
    Height = 374
    Align = alClient
    Ctl3D = False
    DataSource = ADOConnectDM.RemoteCtrlAdmDS
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnColEnter = DBGrid1ColEnter
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Color = clMenuBar
        Expanded = False
        FieldName = 'Pozyvnoi'
        Title.Caption = #1055#1086#1079#1099#1074#1085#1086#1081
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMOTE_LOGIN'
        Title.Caption = #1051#1086#1075#1080#1085' ('#1084#1086#1078#1085#1086' ='#1087#1086#1079#1099#1074#1085#1086#1081')'
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMOTE_PASSWORD'
        Title.Caption = #1055#1072#1088#1086#1083#1100' (!!!>=8'#1089#1080#1084#1074'.)'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Priority'
        Title.Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090' '
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITS_REMOTE_CLIENT'
        Title.Caption = #1056#1072#1079#1088'. '#1088#1072#1073#1086#1090#1091' '#1089#1084#1072#1088#1090#1092#1086#1085
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EN_MOVING'
        Title.Caption = #1056#1072#1079#1088'. '#1087#1077#1088#1077#1084#1077#1097'-'#1077' '#1087#1086' '#1089#1077#1082#1090#1086#1088#1072#1084
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USE_GPS'
        Title.Caption = 'GPS-'#1090#1088#1077#1082#1080#1085#1075
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTSS_ACCT_ID'
        Title.Caption = 'GTS '#1040#1082#1082#1072#1091#1085#1090' ID'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GTSS_DEV_ID'
        Title.Caption = 'GTSS ID '#1059#1089#1090#1088#1086#1081#1089#1090#1074#1072
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'use_dyn_balance'
        Title.Caption = #1048#1089#1087'. '#1076#1080#1085'. '#1073#1072#1083#1072#1085#1089
        Visible = True
      end
      item
        Color = clScrollBar
        Expanded = False
        FieldName = 'DRIVER_BALANCE'
        ReadOnly = True
        Title.Caption = #1044#1080#1085'. '#1073#1072#1083#1072#1085#1089
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rlock_on_calc_debt'
        Title.Caption = #1041#1083#1086#1082#1080#1088'. '#1087#1086' '#1087#1086#1076#1089#1095#1080#1090'. '#1073#1072#1083#1072#1085#1089#1091
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Individ_procent'
        Title.Caption = #1048#1085#1076#1080#1074'. '#1087#1088#1086#1094#1077#1085#1090' (0,1=10%, !'#1079#1072#1087#1103#1090#1072#1103')'
        Width = 193
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ftime_tariff'
        Title.Caption = #1057#1090#1086#1080#1084'. 1 '#1084#1080#1085'. '#1080#1085#1076#1080#1074'.'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tmeter_tariff'
        Title.Caption = #1057#1090#1086#1080#1084'. 1 '#1082#1084'. '#1080#1085#1076#1080#1074'.'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manual_day_sale'
        Title.Caption = #1054#1090#1095#1080#1089#1083#1103#1090#1100' '#1077#1078#1077#1076#1085#1077#1074#1085#1086
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'day_payment'
        Title.Caption = #1057#1091#1084#1084#1072' '#1077#1078#1077#1076#1085'. '#1086#1090#1095'.'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'require_gps'
        Title.Caption = #1058#1088#1077#1073#1086#1074#1072#1090#1100' GPS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avar1'
        Title.Caption = #1045#1076#1077#1090'->'#1082#1083'.'#1079#1074#1091#1082'1'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avar2'
        Title.Caption = #1045#1076'>'#1082#1083'.'#1079#1074'2'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avar3'
        Title.Caption = #1045#1076'>'#1082#1083'.'#1079#1074'3'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avar4'
        Title.Caption = #1045#1076'>'#1082#1083'.'#1079#1074'4'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avar5'
        Title.Caption = #1045#1076'>'#1082#1083'.'#1079#1074'5'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avar6'
        Title.Caption = #1045#1076'>'#1082#1083'.'#1079#1074'6'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avar7'
        Title.Caption = #1045#1076'>'#1082#1083'.'#1079#1074'7'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avar8'
        Title.Caption = #1045#1076'>'#1082#1083'.'#1079#1074'8'
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avar9'
        Title.Caption = #1045#1076'>'#1082#1083'.'#1079#1074'9'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'avar10'
        Title.Caption = #1045#1076'>'#1082#1083'.'#1079#1074'10'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'addit_rem_params'
        Title.Caption = #1044#1086#1087'. '#1087#1072#1088'-'#1088#1099' '#1080#1085#1080#1094'. '#1074#1086#1076#1080#1090#1077#1083#1103
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fix_order_pay_with_daily_pay'
        Title.Caption = #1060#1080#1082#1089'.'#1074' '#1076#1077#1085#1100'+'#1092#1080#1082#1089'.'#1079#1072#1103#1074#1082#1072
        Visible = True
      end
      item
        Color = clMenuBar
        Expanded = False
        FieldName = 'last_lat'
        ReadOnly = True
        Title.Color = clMedGray
        Width = 104
        Visible = True
      end
      item
        Color = clMenuBar
        Expanded = False
        FieldName = 'last_lon'
        Title.Color = clMedGray
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Gos_nomernoi_znak'
        Title.Caption = #1043#1086#1089'. '#1085#1086#1084#1077#1088'.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Marka_avtomobilya'
        Title.Caption = #1052#1072#1088#1082#1072', '#1094#1074#1077#1090
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Licenzionnaya_kart'
        ReadOnly = True
        Title.Caption = #1048#1085#1092'. '#1086' '#1083#1080#1094#1077#1085#1079#1080#1080' ('#1076#1086#1075#1086#1074#1086#1088', '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1085#1072#1103')'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cvet_avto'
        Title.Caption = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080' ('#1095#1072#1089#1090'., '#1085#1072#1077#1084#1085'., '#1089#1090#1072#1078#1077#1088')'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tip_nomer_racii'
        Title.Caption = #1058#1080#1087', '#1085#1086#1084'. '#1088#1072#1094#1080#1080
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone_number'
        Title.Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'drgroup'
        Title.Caption = #1060#1080#1088#1084#1072
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auto_bith_year'
        Title.Caption = #1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'auto_material'
        Title.Caption = #1050#1091#1079#1086#1074
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dr_cargo_services'
        Title.Caption = #1059#1089#1083#1091#1075#1080' '#1074#1086#1076'.'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'addit_cargo_info'
        Title.Caption = #1044#1086#1087'. '#1080#1085#1092#1086
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'is_our'
        Title.Caption = #1053#1072#1096#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'full_name'
        Title.Caption = #1055#1086#1083#1085#1086#1077' '#1080#1084#1103
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'referral_driver_id'
        Title.Caption = #1048#1076' '#1088#1077#1092#1077#1088#1072#1083#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'referral_set_date'
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1079#1085'. '#1088#1077#1092#1077#1088#1072#1083#1072
        Visible = True
      end
      item
        Color = clMenuBar
        Expanded = False
        FieldName = 'BOLD_ID'
        ReadOnly = True
        Title.Caption = #1057#1074#1086#1081' '#1048#1044
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rating'
        Title.Caption = #1055#1086#1089#1090#1086#1103#1085#1085#1099#1081' '#1088#1077#1081#1090#1080#1085#1075
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'daily_payment_expire'
        Title.Caption = #1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074'. '#1077#1078#1077#1076#1085'. '#1087#1083#1072#1090#1077#1078#1072', '#1095'. (0 - 24'#1095')'
        Visible = True
      end
      item
        Color = clMenuBar
        Expanded = False
        FieldName = 'rating_level'
        ReadOnly = True
        Title.Caption = #1057#1090#1091#1087#1077#1085#1100' '#1088#1077#1081#1090#1080#1085#1075#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dont_auto_asgn_by_radius'
        Title.Caption = #1053#1077' '#1085#1072#1079#1085'. '#1087#1086' '#1088#1072#1076#1080#1091#1089#1091' (1-'#1076#1072')'
        Visible = True
      end>
  end
end
