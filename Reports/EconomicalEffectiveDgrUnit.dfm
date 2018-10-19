object EconomicalEffectDgrForm: TEconomicalEffectDgrForm
  Left = 0
  Top = 0
  Width = 537
  Height = 398
  Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1072' '#1076#1086#1093#1086#1076#1086#1074' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
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
  object Panel1: TPanel
    Left = 0
    Top = 320
    Width = 529
    Height = 51
    Align = alBottom
    TabOrder = 0
    object Panel2: TPanel
      Left = 216
      Top = 1
      Width = 312
      Height = 49
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 168
        Top = 16
        Width = 137
        Height = 25
        Caption = #1055#1077#1095#1072#1090#1100
        Enabled = False
        TabOrder = 0
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 23
        Top = 16
        Width = 137
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 1
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
          BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
          BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
          BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
          BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
          EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
          EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
          EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
          EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
        NumGlyphs = 2
      end
    end
  end
  object DBChart1: TDBChart
    Left = 0
    Top = 0
    Width = 529
    Height = 320
    BackWall.Brush.Color = clWhite
    Title.Text.Strings = (
      #1044#1080#1072#1075#1088#1072#1084#1084#1072' '#1076#1086#1093#1086#1076#1085#1086#1089#1090#1080' '#1079#1072' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076)
    Legend.LegendStyle = lsValues
    Legend.TextStyle = ltsRightValue
    Legend.Visible = False
    View3D = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    Align = alClient
    TabOrder = 1
    object Series1: TFastLineSeries
      ColorEachPoint = True
      Marks.ArrowLength = 8
      Marks.Style = smsValue
      Marks.Visible = True
      DataSource = EffDgrADOQuery
      SeriesColor = clRed
      XLabelsSource = 'dist'
      LinePen.Color = clRed
      LinePen.Width = 5
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      XValues.ValueSource = 'stdt'
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      YValues.ValueSource = 'dt'
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'bmp'
    Filter = #1060#1072#1081#1083#1099'  '#1088#1080#1089#1091#1085#1082#1086#1074' *.bmp|*.bmp'
    Title = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' '#1088#1080#1089#1091#1085#1086#1082
    Left = 432
  end
  object EffDgrADOQuery: TADOQuery
    Connection = BoldModelDM.ADOConnection
    CursorType = ctStatic
    CommandTimeout = 3000
    Parameters = <
      item
        Name = 'st_dt'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'en_dt'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select dist,  dbo.GetSDSumm(dist) as dt, stdt   from'
      '('
      'select '
      'DISTINCT( '
      '(CAST(DATEPART(yyyy, nachalo_zakaza_data)as varchar(4))+'#39'.'#39'+'
      'CAST(DATEPART(mm, nachalo_zakaza_data)as varchar(2))+'#39'.'#39'+'
      
        'CAST(DATEPART(dd, nachalo_zakaza_data)as varchar(2))) ) as dist ' +
        ','
      '(DATEPART(yyyy, nachalo_zakaza_data)*400+'
      'DATEPART(mm, nachalo_zakaza_data)*40+'
      'DATEPART(dd, nachalo_zakaza_data)) as stdt '
      ' from Zakaz'
      'where (arhivnyi=0) and (soobsheno_voditelyu=0) and'
      '(nachalo_zakaza_data>=:st_dt) '
      ' and (nachalo_zakaza_data<=:en_dt) '
      ''
      ') t '
      'where (dist<>'#39'1899.12.30'#39') '
      'order by stdt ASC ')
    Left = 472
  end
end
