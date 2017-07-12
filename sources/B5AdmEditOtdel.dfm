inherited B5Adm_Edit_Otdel: TB5Adm_Edit_Otdel
  Caption = 'B5Adm_Edit_Otdel'
  ClientHeight = 84
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 6
    Top = 42
    Width = 159
    Height = 13
    Caption = 'Полное наименование отдела :'
  end
  inherited ToolBar1: TToolBar
    object BtnSave: TToolButton
      Left = 0
      Top = 2
      Hint = 'Сохранить и выйти'
      Caption = 'BtnSave'
      ImageIndex = 4
      OnClick = BtnSaveClick
    end
    object BtnApply: TToolButton
      Left = 23
      Top = 2
      Hint = 'Применить'
      Caption = 'BtnApply'
      ImageIndex = 7
      OnClick = BtnApplyClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 65
  end
  object OTDEL_FULL: TEdit
    Left = 170
    Top = 38
    Width = 415
    Height = 21
    MaxLength = 128
    TabOrder = 2
    Text = 'OTDEL_FULL'
    OnChange = OTDEL_FULLChange
  end
end
