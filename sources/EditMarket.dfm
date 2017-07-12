object EDIT_MARKET: TEDIT_MARKET
  Left = 108
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Маркетинговые данные товара'
  ClientHeight = 146
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 44
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Товар :'
  end
  object Label2: TLabel
    Left = 49
    Top = 40
    Width = 32
    Height = 13
    Caption = 'Цена :'
  end
  object Label3: TLabel
    Left = 17
    Top = 64
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = 'Поставщик :'
  end
  object Label4: TLabel
    Left = 340
    Top = 40
    Width = 132
    Height = 13
    Caption = 'Дата сбора информации :'
  end
  object Label5: TLabel
    Left = 12
    Top = 88
    Width = 69
    Height = 13
    Caption = 'Примечания :'
  end
  object Image3: TImage
    Left = 2
    Top = 129
    Width = 16
    Height = 16
    Hint = 
      'Данная форма соответствует требованиям программ,'#13#10'созданным с ло' +
      'готипом Beginner(R)'
    AutoSize = True
    Picture.Data = {
      07544269746D6170F6000000424DF60000000000000076000000280000001000
      000010000000010004000000000080000000120B0000120B0000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF008888888888888888888884F8888888888888444F888888888884444F8888
      888888444F44F88888888444F8844F888888884F88884F8888888888888884F8
      888888BBBBBB884F88888000000BB884F8888800B800B8884F888800BB008888
      84F88800000BB88888488800B800B88888888800BB0088888888800000088888
      8888}
    Transparent = True
  end
  object TW_ART: TEdit
    Left = 88
    Top = 4
    Width = 65
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'TW_ART'
  end
  object TW_NAM: TEdit
    Left = 156
    Top = 4
    Width = 441
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = 'TW_NAM'
  end
  object TW_MONEY: TRxCalcEdit
    Left = 88
    Top = 36
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',#0.00 руб'
    NumGlyphs = 2
    TabOrder = 2
    OnChange = TW_MONEYChange
  end
  object TW_MONEYD: TRxCalcEdit
    Left = 212
    Top = 36
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',#0.0000 $'
    NumGlyphs = 2
    TabOrder = 3
    OnChange = TW_MONEYChange
  end
  object KLN_FULL: TEdit
    Left = 88
    Top = 60
    Width = 509
    Height = 21
    TabOrder = 5
    Text = 'KLN_FULL'
    OnChange = TW_MONEYChange
  end
  object MARKET_DATE: TDateEdit
    Left = 476
    Top = 36
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 4
    OnChange = TW_MONEYChange
  end
  object MARKET_PRIM: TEdit
    Left = 88
    Top = 84
    Width = 509
    Height = 21
    TabOrder = 6
    Text = 'MARKET_PRIM'
    OnChange = TW_MONEYChange
  end
  object BtnSAVE: TButton
    Left = 372
    Top = 116
    Width = 75
    Height = 25
    Hint = 'Ctrl+Enter'
    Caption = 'Сохранить'
    TabOrder = 7
    OnClick = BtnSAVEClick
  end
  object BtnApply: TButton
    Left = 448
    Top = 116
    Width = 75
    Height = 25
    Caption = 'Применить'
    TabOrder = 8
    OnClick = BtnApplyClick
  end
  object BtnClose: TButton
    Left = 524
    Top = 116
    Width = 75
    Height = 25
    Hint = 'ESC'
    Caption = 'Закрыть'
    TabOrder = 9
    OnClick = BtnCloseClick
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 212
    Top = 72
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    CachedUpdates = False
    Left = 280
    Top = 72
  end
end
