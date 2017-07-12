object SELECT_REPORT_SHOP: TSELECT_REPORT_SHOP
  Left = 106
  Top = 141
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Выбор отображения отчета о прибыли магазинов'
  ClientHeight = 222
  ClientWidth = 536
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
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 536
    Height = 73
    Align = alTop
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    TabOrder = 0
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 73
    Width = 536
    Height = 149
    Align = alClient
    Items.Strings = (
      'Подробный в рублях'
      'Подробный в долларах США'
      'По группам товаров в рублях'
      'По группам товаров в долларах США'
      'Итоговый по магазинам  в рублях'
      'Итоговый по магазинам  в долларах США'
      'Итоговый отчет о прибыли менеджеров в установленной валюте')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 456
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 456
    Top = 188
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 3
    OnClick = Button2Click
  end
end
