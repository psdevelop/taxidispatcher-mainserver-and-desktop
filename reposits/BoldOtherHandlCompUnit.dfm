object BoldOthHandleCompDM: TBoldOthHandleCompDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 161
  Width = 251
  object bpcEnabledAdmin: TBoldPropertiesController
    BoldHandle = BoldHandlesDM.blhCurrUser
    BoldProperties.Expression = 'razresh_administr or razreshitj_vsyo'
    DrivenProperties = <
      item
        VCLComponent = FirstForm.AdministrationPanelToolButton
        PropertyName = 'Enabled'
        ReadOnly = False
      end
      item
        VCLComponent = FirstForm.AdminPanelMenu
        PropertyName = 'Enabled'
        ReadOnly = False
      end
      item
        VCLComponent = FirstForm.BaseCorrectRepMenu
        PropertyName = 'Enabled'
      end
      item
        VCLComponent = AnnonceArhiveFormForm.BitBtn3
        PropertyName = 'Enabled'
      end
      item
        VCLComponent = FirstForm.N33
        PropertyName = 'Enabled'
        ReadOnly = False
      end
      item
        VCLComponent = SystemEnumsForm.TabSheet1
        PropertyName = 'TabVisible'
      end>
    Left = 152
    Top = 56
  end
  object bpcEnablkedPrSettings: TBoldPropertiesController
    BoldHandle = BoldHandlesDM.blhCurrUser
    BoldProperties.Expression = 'razresh_nastroiku_raboty  or razreshitj_vsyo'
    DrivenProperties = <
      item
        VCLComponent = FirstForm.ProgrammSettingsToolButton
        PropertyName = 'Enabled'
        ReadOnly = False
      end
      item
        VCLComponent = FirstForm.SettingsMI
        PropertyName = 'Enabled'
        ReadOnly = False
      end>
    Left = 152
    Top = 104
  end
  object bpcEnabledLogView: TBoldPropertiesController
    BoldHandle = BoldHandlesDM.blhCurrUser
    BoldProperties.Expression = 'razreshitj_prosmotr_logov or razreshitj_vsyo'
    DrivenProperties = <
      item
        VCLComponent = FirstForm.LogViewPanelToolButton
        PropertyName = 'Enabled'
        ReadOnly = False
      end>
    Left = 48
    Top = 56
  end
  object basrTreeSectionNode: TBoldAsStringRenderer
    OnSetFont = basrTreeSectionNodeSetFont
    Left = 48
    Top = 8
  end
  object basrSectNum: TBoldAsStringRenderer
    OnGetAsString = basrSectNumGetAsString
    OnSetAsString = basrSectNumSetAsString
    Left = 48
    Top = 104
  end
  object bpcEnCaseAccess: TBoldPropertiesController
    BoldHandle = BoldHandlesDM.blhCurrUser
    BoldProperties.Expression = 'razreshitj_udalenie_vypuskov'
    DrivenProperties = <
      item
        VCLComponent = FirstForm.CasheN
        PropertyName = 'Enabled'
        ReadOnly = False
      end>
    Left = 152
    Top = 8
  end
end
