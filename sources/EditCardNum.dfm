object EDIT_CARDNUM: TEDIT_CARDNUM
  Left = 162
  Top = 218
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Накопительная скидка'
  ClientHeight = 134
  ClientWidth = 566
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
  object Label2: TLabel
    Left = 30
    Top = 108
    Width = 88
    Height = 13
    Caption = 'Процент скидки :'
  end
  object Label1: TLabel
    Left = 62
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Описание :'
  end
  object Label3: TLabel
    Left = 24
    Top = 32
    Width = 94
    Height = 13
    Caption = 'Действительна с :'
  end
  object Label4: TLabel
    Left = 100
    Top = 56
    Width = 18
    Height = 13
    Caption = 'по :'
  end
  object Label5: TLabel
    Left = 54
    Top = 80
    Width = 64
    Height = 13
    Caption = 'Тип скидки :'
  end
  object PERCENT: TRxCalcEdit
    Left = 124
    Top = 104
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 3
    DisplayFormat = ',0.000%##'
    NumGlyphs = 2
    TabOrder = 4
  end
  object Button1: TButton
    Left = 480
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 480
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 6
    OnClick = Button2Click
  end
  object OPIS: TEdit
    Left = 124
    Top = 4
    Width = 349
    Height = 21
    TabOrder = 0
  end
  object DT1: TDateEdit
    Left = 124
    Top = 28
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object DT2: TDateEdit
    Left = 124
    Top = 52
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object TYP: TComboBox
    Left = 124
    Top = 76
    Width = 269
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'TYP'
    Items.Strings = (
      '1 - скидка плюсуется к другим скидкам'
      '2 - процент скидки не может быть больше наибольшего')
  end
end
