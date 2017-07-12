object Admin_STFAKT: TAdmin_STFAKT
  Left = 229
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Администрирование счёта-фактуры'
  ClientHeight = 63
  ClientWidth = 408
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
    Left = 8
    Top = 8
    Width = 185
    Height = 13
    Caption = 'Изменить номер счета-фактуры на :'
  end
  object BtnOK: TButton
    Left = 324
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 0
    OnClick = BtnOKClick
  end
  object BtnClose: TButton
    Left = 324
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 1
    OnClick = BtnCloseClick
  end
  object NUM: TRxCalcEdit
    Left = 200
    Top = 4
    Width = 113
    Height = 21
    AutoSize = False
    DisplayFormat = '#0000000000'
    NumGlyphs = 2
    TabOrder = 2
  end
end
