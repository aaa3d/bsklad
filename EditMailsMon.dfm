object Edit_Mails_mon: TEdit_Mails_mon
  Left = 175
  Top = 185
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Дополнительная цена'
  ClientHeight = 177
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 130
    Height = 13
    Caption = 'Розичная цена в валюте :'
  end
  object Label2: TLabel
    Left = 24
    Top = 68
    Width = 114
    Height = 13
    Caption = 'Новая цена в валюте :'
  end
  object Label3: TLabel
    Left = 276
    Top = 44
    Width = 49
    Height = 13
    Caption = 'в рублях :'
  end
  object Label4: TLabel
    Left = 276
    Top = 68
    Width = 49
    Height = 13
    Caption = 'в рублях :'
  end
  object Label5: TLabel
    Left = 32
    Top = 92
    Width = 104
    Height = 13
    Caption = 'Скидка от розницы :'
  end
  object Label6: TLabel
    Left = 72
    Top = 116
    Width = 65
    Height = 13
    Caption = 'Количество :'
  end
  object Label7: TLabel
    Left = 72
    Top = 140
    Width = 69
    Height = 13
    Caption = 'Примечание :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 457
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnSAVE: TToolButton
      Left = 0
      Top = 2
      Hint = 'Сохранить и выйти'
      Caption = 'BtnSAVE'
      ImageIndex = 39
      OnClick = BtnSAVEClick
    end
    object ToolButton1: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 40
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 33
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton2'
      ImageIndex = 110
      OnClick = ToolButton2Click
    end
  end
  object ROZN1: TRxCalcEdit
    Left = 144
    Top = 40
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.000##'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 1
  end
  object ROZN2: TRxCalcEdit
    Left = 332
    Top = 40
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 2
  end
  object MON1: TRxCalcEdit
    Left = 144
    Top = 64
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.000##'
    NumGlyphs = 2
    TabOrder = 3
    OnChange = MON1Change
  end
  object MON2: TRxCalcEdit
    Left = 332
    Top = 64
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 4
  end
  object PERCENT: TRxCalcEdit
    Left = 144
    Top = 88
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',#0.00000000000'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 5
  end
  object TW_KOL: TRxCalcEdit
    Left = 144
    Top = 112
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',0.0000##'
    NumGlyphs = 2
    TabOrder = 6
  end
  object TW_PRIM: TEdit
    Left = 144
    Top = 136
    Width = 309
    Height = 21
    MaxLength = 254
    TabOrder = 7
    Text = 'TW_PRIM'
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 76
    Top = 12
    object N1: TMenuItem
      Caption = 'Сохранить и выйти'
      ImageIndex = 39
      ShortCut = 16397
      OnClick = BtnSAVEClick
    end
  end
end
