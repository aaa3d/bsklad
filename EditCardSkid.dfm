object EDIT_CARDSKID: TEDIT_CARDSKID
  Left = 162
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Накопительная скидка'
  ClientHeight = 69
  ClientWidth = 354
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 110
    Height = 13
    Caption = 'Накопленная сумма :'
  end
  object Label2: TLabel
    Left = 32
    Top = 36
    Width = 88
    Height = 13
    Caption = 'Процент скидки :'
  end
  object SUMM: TRxCalcEdit
    Left = 128
    Top = 8
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб##'
    NumGlyphs = 2
    TabOrder = 0
  end
  object PERCENT: TRxCalcEdit
    Left = 128
    Top = 32
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 3
    DisplayFormat = ',0.000%##'
    NumGlyphs = 2
    TabOrder = 1
  end
  object Button1: TButton
    Left = 272
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 36
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 3
    OnClick = Button2Click
  end
end
