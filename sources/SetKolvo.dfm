object Set_KOLVO: TSet_KOLVO
  Left = 124
  Top = 118
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ввод количества товаров'
  ClientHeight = 55
  ClientWidth = 448
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
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 36
    Top = 8
    Width = 77
    Height = 13
    Caption = 'Выбран товар :'
  end
  object Label2: TLabel
    Left = 4
    Top = 32
    Width = 109
    Height = 13
    Caption = 'Введите количество :'
  end
  object NAME: TEdit
    Left = 120
    Top = 4
    Width = 325
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'NAME'
  end
  object KOL: TRxCalcEdit
    Left = 120
    Top = 28
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = '#0.0000'
    NumGlyphs = 2
    TabOrder = 1
    OnKeyPress = KOLKeyPress
  end
  object BtnOk: TButton
    Left = 292
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 2
    OnClick = BtnOkClick
  end
  object BtnClose: TButton
    Left = 368
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 3
  end
end
