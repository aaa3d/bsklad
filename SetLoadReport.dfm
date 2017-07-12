object SET_LOAD_REPORT: TSET_LOAD_REPORT
  Left = 61
  Top = 128
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Отобразить отчет о прибыли'
  ClientHeight = 295
  ClientWidth = 527
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
  object RadioButton1: TRadioButton
    Left = 4
    Top = 88
    Width = 145
    Height = 17
    Caption = 'Подробный в рублях'
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 527
    Height = 85
    Align = alTop
    Enabled = False
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object RadioButton2: TRadioButton
    Left = 4
    Top = 109
    Width = 145
    Height = 17
    Caption = 'Суммарный в рублях'
    TabOrder = 2
  end
  object RadioButton3: TRadioButton
    Left = 4
    Top = 129
    Width = 153
    Height = 17
    Caption = 'Подробный в долларах'
    TabOrder = 3
  end
  object RadioButton4: TRadioButton
    Left = 4
    Top = 150
    Width = 165
    Height = 17
    Caption = 'Суммарный в долларах'
    TabOrder = 4
  end
  object RadioButton5: TRadioButton
    Left = 4
    Top = 170
    Width = 261
    Height = 17
    Caption = 'Подробный в рублях, товаров давших убытки'
    TabOrder = 5
  end
  object RadioButton6: TRadioButton
    Left = 4
    Top = 191
    Width = 261
    Height = 17
    Caption = 'Суммарный в рублях, товаров давших убытки'
    TabOrder = 6
  end
  object RadioButton7: TRadioButton
    Left = 4
    Top = 211
    Width = 273
    Height = 17
    Caption = 'Подробный в долларах, товаров давших убытки'
    TabOrder = 7
  end
  object RadioButton8: TRadioButton
    Left = 4
    Top = 232
    Width = 273
    Height = 17
    Caption = 'Суммарный в долларах, товаров давших убытки'
    TabOrder = 8
  end
  object Button1: TButton
    Left = 448
    Top = 236
    Width = 75
    Height = 25
    Caption = 'Вывести'
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 448
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 10
  end
  object RadioButton9: TRadioButton
    Left = 4
    Top = 252
    Width = 285
    Height = 17
    Caption = 'Подробный рублевый в порядке убывания прибыли'
    TabOrder = 11
  end
  object RadioButton10: TRadioButton
    Left = 4
    Top = 272
    Width = 309
    Height = 17
    Caption = 'Подробный долларовый в порядке убывания прибыли'
    TabOrder = 12
  end
end
