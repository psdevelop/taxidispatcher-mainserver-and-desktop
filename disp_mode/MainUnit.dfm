object MainForm: TMainForm
  Left = 0
  Top = 0
  Width = 923
  Height = 560
  Caption = #1044#1080#1089#1087#1077#1090#1095#1077#1088' '#1086#1090#1087#1088#1072#1074#1082#1080' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 185
    Top = 59
    Width = 8
    Height = 455
    Beveled = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 59
    Width = 185
    Height = 455
    Align = alLeft
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 183
      Height = 453
      ActivePage = TabSheet2
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabPosition = tpLeft
      object TabSheet1: TTabSheet
        Caption = #1054#1073#1097#1072#1103' '#1086#1095#1077#1088#1077#1076#1100
        object Panel3: TPanel
          Left = 0
          Top = 404
          Width = 155
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object DBCheckBox1: TDBCheckBox
            Left = 16
            Top = 16
            Width = 121
            Height = 17
            Caption = #1053#1072' '#1087#1077#1088#1077#1088#1099#1074#1077
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 155
          Height = 404
          Align = alClient
          Ctl3D = False
          DataSource = ADOConnectDM.dsAllActDrNum
          Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'dr_comment'
              Width = 200
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = #1057#1077#1082#1090#1086#1088#1072
        ImageIndex = 1
        object Splitter2: TSplitter
          Left = 0
          Top = 263
          Width = 155
          Height = 8
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
        end
        object Panel6: TPanel
          Left = 0
          Top = 271
          Width = 155
          Height = 174
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object DBGrid3: TDBGrid
            Left = 0
            Top = 0
            Width = 155
            Height = 174
            Align = alClient
            Ctl3D = False
            DataSource = ADOConnectDM.dsAllSectorDrivers
            Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'dr_comment'
                Width = 200
                Visible = True
              end>
          end
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 155
          Height = 263
          Align = alClient
          TabOrder = 1
          object DBCtrlGrid1: TDBCtrlGrid
            Left = 1
            Top = 1
            Width = 153
            Height = 261
            Align = alClient
            DataSource = ADOConnectDM.dsAllSectors
            PanelHeight = 65
            PanelWidth = 137
            TabOrder = 0
            RowCount = 4
            SelectedColor = clGradientActiveCaption
            OnClick = DBCtrlGrid1Click
            object Image1: TImage
              Left = 10
              Top = 18
              Width = 33
              Height = 33
              Picture.Data = {
                055449636F6E0000010001002020000000000000A80C00001600000028000000
                20000000400000000100180000000000800C0000000000000000000000000000
                0000000000000000000000000000000000000000000077777777777777777777
                7777777777777777777777777777777777777777777777777777777777777777
                7777777777777777777777777777777777777777777777770000000000000000
                0000000000000000000077777777777777777777777777777777777777777777
                7777777777777777777777777777777777777777777777777777777777777777
                7777777777777777777777777777777777777777777777777777777777777777
                7700000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000005500007700007700007700007700007700005500
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000550077777700
                7700007700007700007700007700007700007700007700007700007700007700
                0077000077000077000077007777770055000000000000000000000000000000
                00000000000000000000000000444444444444444444444444444444DDDDDD44
                4444444444444444444444444444444444444444444444444444444444444444
                444444444444444444444444DDDDDD4444444444444444444444444444440000
                00000000000000000000000000444444F0FBFFF0FBFFF0FBFFF0FBFFDDDDDDF0
                FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF
                F0FBFFF0FBFFF0FBFFF0FBFFDDDDDDF0FBFFF0FBFFF0FBFFF0FBFF4444440000
                00000000000000000000005500005500005500005500005500007700DDDDDD00
                770000770000770000770000AA0000AA0000AA00DDDDDD00AA0000AA0000AA00
                007700007700007700007700DDDDDD0077000077000077000077000077000055
                0000000000000000550000550000550000770000770000770000770000770000
                770000770000AA0000770000AA0000AA0000AA00DDDDDD00AA0000AA0000AA00
                00770000AA000077000077000077000077000077000077000077000077000077
                0000550000000000550000550000770000770000770000770000770000770000
                770000AA0000770000AA0000FF0000FF0000AA00DDDDDD00AA00005500005500
                00AA0000770000AA000077000077000077000077000077000077000077000077
                00007700000000005500005500007700FFFFFFFFFFFF00770000770000770000
                770000AA0000770000AA0000FF0000AA0000550000AA0000FF0000AA00005500
                00AA0000770000AA00007700007700007700007700FFFFFFFFFFFF0077000077
                00007700000000005500007700FFFFFF000000444444FFFFFF00770000770000
                AA0000770000AA0000FF0000AA0000AA0000550000AA0000FF0000AA0000AA00
                00550000AA0000770000FF00007700007700FFFFFF000000444444FFFFFF0077
                00007700000000005500007700FFFFFFFFFFFF000000FFFFFF00770000770000
                AA0000770000AA0000FF0000AA0000AA0000550000AA0000FF0000AA0000AA00
                00550000AA0000770000FF00007700007700FFFFFFFFFFFF000000FFFFFF0077
                0000770000000000550000AA00007700FFFFFFFFFFFF00AA0000AA0000AA0000
                770000AA0000FF0000AA0000AA0000AA0000550000AA0000FF0000AA0000AA00
                00AA0000550000FF0000770000FF0000AA0000AA00FFFFFFFFFFFF00AA000077
                0000770000000000550000FF0000AA0000AA0000AA0000AA0000FF0000770000
                AA0000FF0000AA0000AA0000AA0000AA0000550000AA0000FF0000AA0000AA00
                00AA0000AA0000550000FF0000770000FF0000AA0000AA0000AA0000AA0000FF
                0000770000000000770000550000FF0000FF0000FF0000FF0000770000AA0000
                FF0000AA0000AA0000AA0000AA0000AA0000550000AA0000FF0000AA0000AA00
                00AA0000AA0000AA0000550000FF0000770000FF0000FF0000FF0000FF000055
                0000770000000000000000770000550000550000FF0000770000AA0000FF0000
                AA0000FF0000AA0000AA0000AA0000AA0000550000AA0000FF0000AA0000AA00
                00AA0000AA0000FF0000AA0000550000FF0000770000FF000055000077000077
                0000000000000000000000000000000000550000770000AA0000AA0000FF0000
                550000FF0000FF0000FF0000FF0000FF0000550000AA0000FF0000FF0000FF00
                00FF0000FF0000FF0000FF0000550000AA0000FF000055000077000000000000
                0000000000000000000000000000000000000000770000AA0000FF0000550000
                550000AA0000FF0000FF0000FF0000FF0000550000AA0000FF0000FF0000FF00
                00FF0000FF0000AA0000550000550000AA0000FF000077000000000000000000
                0000000000000000000000000000000000000000770000AA0000550000FF0000
                FF0000550000550000550000550000550000550000AA0000FF00005500005500
                00550000550000550000FF0000FF000055000077000077000000000000000000
                0000000000000000000000000000000000000000770000550000550000550000
                AA0000FF0000FF0000FF0000FF0000FF0000550000550000FF0000FF0000FF00
                00FF0000FF0000FF0000FF0000AA000055000055000077000000000000000000
                00000000000000000000000000000000000000007700FFFFFF44444444444444
                4444005500005500005500005500005500005500005500005500005500005500
                005500005500005500005500444444444444FFFFFF0077000000000000000000
                00000000000000000000000000000000000000007700FFFFFF44444444444444
                4444444444444444FFFFFFFFFFFFFFFFFFFFFFFF444444FFFFFF000000FFFFFF
                FFFFFF444444000000444444444444444444FFFFFF0077000000000000000000
                0000000000000000000000000000000000000000AA0033FF0044444444444444
                4444444444444444444444FFFFFFFFFFFFFFFFFF444444FFFFFFFFFFFF000000
                00000000000044444444444444444444444400FF0000AA000000000000000000
                0000000000000000000000000000000000000000AA0000770044444444444444
                4444444444444444444444444444444444444444444444444444444444444444
                44444444444444444444444444444444444400770000AA000000000000000000
                0000000000000000000000000000000000000000000000AA0033FF0044444444
                4444444444444444444444444444444444C0C0C0C0C0C0C0C0C0444444444444
                44444444444444444444444444444400FF0000AA000000000000000000000000
                0000000000000000000000000000000000000000000000AA0000770033FF0044
                4444444444444444444444444444444444444444C0C0C0444444444444444444
                44444444444444444444444400FF0000770000AA000000000000000000000000
                0000000000000000000000000000000000000000000000000000AA0000AA0000
                770033FF0033FF0033FF0033FF0033FF0033FF0033FF0000FF0000FF0000FF00
                00FF0000FF0000FF0000770000AA0000AA000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                AA00007700007700007700007700007700007700007700007700007700007700
                00770000770000770000AA000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000AA0000AA00007700007700007700007700007700007700007700
                00AA0000AA000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000FC00000FC0000001C3FFFFE1C3F80FE1C2000021C0000001C0000001
                C000000180000000800000008000000080000000800000008000000080000000
                80000000C0000001F0000007F800000FF800000FF800000FF800000FF800000F
                F800000FF800000FFC00001FFC00001FFE00003FFF8000FFFFE003FFFFFFFFFF
                FFFFFFFF}
            end
            object DBText1: TDBText
              Left = 56
              Top = 16
              Width = 300
              Height = 17
              DataField = 'Podskazka_na_sektore'
              DataSource = ADOConnectDM.dsAllSectors
            end
            object DBText2: TDBText
              Left = 56
              Top = 40
              Width = 300
              Height = 17
              DataField = 'nomer_sektora'
              DataSource = ADOConnectDM.dsAllSectors
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 193
    Top = 59
    Width = 722
    Height = 455
    Align = alClient
    TabOrder = 1
    object PageControl2: TPageControl
      Left = 1
      Top = 1
      Width = 720
      Height = 453
      ActivePage = TabSheet3
      Align = alClient
      TabOrder = 0
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        TabVisible = False
        object Panel4: TPanel
          Left = 0
          Top = 402
          Width = 712
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 712
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
        end
        object DBGrid2: TDBGrid
          Left = 0
          Top = 41
          Width = 712
          Height = 361
          Align = alClient
          Ctl3D = False
          DataSource = ADOConnectDM.dsActiveCust
          ParentCtl3D = False
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnKeyUp = DBGrid2KeyUp
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Nomer_zakaza'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #8470
              Title.Color = clOlive
              Width = 50
              Visible = True
            end
            item
              Color = clSkyBlue
              Expanded = False
              FieldName = 'Telefon_klienta'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1058#1045#1051#1045#1060#1054#1053
              Title.Color = clGradientActiveCaption
              Width = 94
              Visible = True
            end
            item
              Color = clMoneyGreen
              Expanded = False
              FieldName = 'Adres_vyzova_vvodim'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1040#1044#1056#1045#1057' '#1042#1067#1047#1054#1042#1040
              Title.Color = clGreen
              Width = 161
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Nachalo_zakaza_data'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1053#1040#1063#1040#1051#1054
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'Konec_zakaza_data'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1054#1050#1054#1053#1063#1040#1053#1048#1045
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Pozyvnoi_ustan'
              Title.Caption = #1055#1054#1047#1067#1042#1053#1054#1049
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Uslovn_stoim'
              Title.Alignment = taCenter
              Title.Caption = #1054#1058#1063#1025#1058
              Title.Color = clBackground
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Kolichestvo_chasov'
              Title.Caption = #1063#1040#1057#1054#1042
              Title.Color = clBackground
              Width = 60
              Visible = True
            end>
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'TabSheet4'
        ImageIndex = 1
        TabVisible = False
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 915
    Height = 59
    AutoSize = True
    ButtonHeight = 55
    Caption = 'ToolBar1'
    TabOrder = 2
    object ToolBar2: TToolBar
      Left = 0
      Top = 2
      Width = 207
      Height = 55
      Align = alLeft
      AutoSize = True
      BorderWidth = 2
      ButtonHeight = 38
      ButtonWidth = 39
      Caption = 'ToolBar1'
      Color = clBtnFace
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      Images = ImageListsDM.MainToolBarImageList
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      Transparent = False
      object ActivateToolButton: TToolButton
        Left = 0
        Top = 2
        Caption = 'Update DB'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = ActivateToolButtonClick
      end
      object ToolButton1: TToolButton
        Left = 39
        Top = 2
        Enabled = False
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = ToolButton1Click
      end
      object ProgrammSettingsToolButton: TToolButton
        Left = 78
        Top = 2
        Hint = #1055#1072#1085#1077#1083' '#1085#1072#1089#1090#1088#1086#1077#1082' '#1088#1072#1073#1086#1090#1099' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103
        Caption = 'ProgrammSettingsToolButton'
        Enabled = False
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
      end
      object DBConnectSettingsToolButton: TToolButton
        Left = 117
        Top = 2
        Hint = #1044#1080#1072#1083#1086#1075' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103' '#1089' '#1089#1077#1088#1074#1077#1088#1086#1084' '#1073#1072#1079' '#1076#1072#1085#1085#1099#1093
        Caption = 'DBConnectSettingsToolButton'
        ImageIndex = 2
        ParentShowHint = False
        ShowHint = True
      end
      object AdministrationPanelToolButton: TToolButton
        Left = 156
        Top = 2
        Hint = #1055#1072#1085#1077#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1103
        Caption = 'AdministrationPanelToolButton'
        Enabled = False
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
      end
    end
    object ToolBar3: TToolBar
      Left = 207
      Top = 2
      Width = 90
      Height = 55
      Align = alLeft
      AutoSize = True
      BorderWidth = 2
      ButtonHeight = 38
      ButtonWidth = 39
      Caption = 'ToolBar1'
      Color = clBtnFace
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      Images = ImageListsDM.MainToolBarImageList
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      Transparent = False
      object QuitToolButton: TToolButton
        Left = 0
        Top = 2
        Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        Caption = 'Add New'
        ImageIndex = 11
        ParentShowHint = False
        ShowHint = True
        OnClick = QuitToolButtonClick
      end
      object DBDataRefreshToolButton: TToolButton
        Left = 39
        Top = 2
        Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1089' '#1089#1077#1088#1074#1077#1088#1072
        Caption = 'DBDataRefreshToolButton'
        Enabled = False
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        OnClick = DBDataRefreshToolButtonClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 514
    Width = 915
    Height = 19
    Panels = <
      item
        Text = #1053#1077#1090' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1103
        Width = 100
      end
      item
        Text = #1044#1080#1089#1087#1077#1090#1095#1077#1088':'
        Width = 200
      end
      item
        Width = 50
      end>
  end
end
