object COPY_PROP: TCOPY_PROP
  Left = 142
  Top = 220
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Копирование свойств и скидок товара'
  ClientHeight = 228
  ClientWidth = 559
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 6
    Top = 4
    Width = 549
    Height = 77
    Caption = ' Цена на брак '
    TabOrder = 0
    object Label1: TLabel
      Left = 260
      Top = 38
      Width = 85
      Height = 13
      Caption = 'В валюте товара'
    end
    object RadioButton1: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Не изменять'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 8
      Top = 36
      Width = 135
      Height = 17
      Caption = 'Установить равной :'
      TabOrder = 1
      OnClick = RadioButton1Click
    end
    object RadioButton3: TRadioButton
      Left = 8
      Top = 56
      Width = 377
      Height = 17
      Caption = 'Установить равной минимальной из скидок от количества и минус :'
      TabOrder = 2
      OnClick = RadioButton1Click
    end
    object MON1: TRxCalcEdit
      Left = 134
      Top = 34
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = ',0.000000'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 3
    end
    object PERCENT1: TRxCalcEdit
      Left = 378
      Top = 52
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.0000%##'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 6
    Top = 88
    Width = 549
    Height = 101
    Caption = ' Минимальная цена при продаже (Свойства) '
    TabOrder = 1
    object Label2: TLabel
      Left = 260
      Top = 38
      Width = 85
      Height = 13
      Caption = 'В валюте товара'
    end
    object RadioButton4: TRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Не изменять'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton4Click
    end
    object RadioButton5: TRadioButton
      Left = 8
      Top = 36
      Width = 135
      Height = 17
      Caption = 'Установить равной :'
      TabOrder = 1
      OnClick = RadioButton4Click
    end
    object RadioButton6: TRadioButton
      Left = 8
      Top = 56
      Width = 377
      Height = 17
      Caption = 'Установить равной минимальной из скидок от количества и минус :'
      TabOrder = 2
      OnClick = RadioButton4Click
    end
    object MON2: TRxCalcEdit
      Left = 134
      Top = 34
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 6
      DisplayFormat = ',0.000000'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 3
    end
    object PERCENT2: TRxCalcEdit
      Left = 378
      Top = 52
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.0000%##'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 4
    end
    object RadioButton7: TRadioButton
      Left = 8
      Top = 76
      Width = 113
      Height = 17
      Caption = 'Копировать'
      TabOrder = 5
      OnClick = RadioButton4Click
    end
  end
  object Button1: TButton
    Left = 396
    Top = 196
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 476
    Top = 196
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 3
    OnClick = Button2Click
  end
end
