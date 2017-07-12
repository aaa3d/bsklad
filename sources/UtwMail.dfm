object UTW_MAIL: TUTW_MAIL
  Left = 181
  Top = 219
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Утверждение заявки на закупку'
  ClientHeight = 275
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
  object Button1: TButton
    Left = 404
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 482
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 1
    OnClick = Button2Click
  end
  object UTW1: TCheckBox
    Left = 6
    Top = 4
    Width = 273
    Height = 17
    Caption = 'Менеджер по розничным продажам. Утверждаю'
    TabOrder = 2
  end
  object UTW2: TCheckBox
    Left = 4
    Top = 128
    Width = 267
    Height = 17
    Caption = 'Менеджер по оптовым продажам. Утверждаю'
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 2
    Top = 24
    Width = 557
    Height = 97
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object Memo2: TMemo
    Left = 2
    Top = 148
    Width = 555
    Height = 95
    Lines.Strings = (
      'Memo2')
    TabOrder = 5
  end
end
