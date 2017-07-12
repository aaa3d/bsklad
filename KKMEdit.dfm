object KKM_EDIT: TKKM_EDIT
  Left = 223
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Редактирование информации на чеке'
  ClientHeight = 58
  ClientWidth = 344
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 40
    Height = 13
    Caption = 'Шрифт :'
  end
  object Label2: TLabel
    Left = 12
    Top = 32
    Width = 36
    Height = 13
    Caption = 'Текст :'
  end
  object RadioButton1: TRadioButton
    Left = 120
    Top = 8
    Width = 81
    Height = 17
    Caption = 'Широкий'
    TabOrder = 0
    OnClick = RadioButton2Click
  end
  object RadioButton2: TRadioButton
    Left = 52
    Top = 8
    Width = 61
    Height = 17
    Caption = 'Узкий'
    Checked = True
    TabOrder = 1
    TabStop = True
    OnClick = RadioButton2Click
  end
  object Edit1: TEdit
    Left = 56
    Top = 28
    Width = 201
    Height = 22
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button2: TButton
    Left = 264
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 264
    Top = 1
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 4
    OnClick = Button1Click
  end
end
