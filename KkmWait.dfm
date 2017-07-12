object KKM_WAIT: TKKM_WAIT
  Left = 340
  Top = 213
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Печать чека'
  ClientHeight = 39
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 2
    Width = 332
    Height = 32
    Caption = 
      'Нажмите ФЦ - ВВ на кассовом аппарате или '#13#10'кнопку "Отмена" для о' +
      'тказа от печати чека'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CancelButton: TButton
    Left = 348
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 0
    OnClick = CancelButtonClick
  end
end
