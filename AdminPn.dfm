object Admin_PN: TAdmin_PN
  Left = 229
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Администрирование приходной накладной'
  ClientHeight = 65
  ClientWidth = 385
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
    Width = 164
    Height = 13
    Caption = 'Изменить номер накладной на :'
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 149
    Height = 13
    Caption = 'Изменить тип накладной на :'
  end
  object TYP: TComboBox
    Left = 180
    Top = 28
    Width = 73
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'TYP'
  end
  object BtnOK: TButton
    Left = 300
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 1
    OnClick = BtnOKClick
  end
  object BtnClose: TButton
    Left = 300
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    OnClick = BtnCloseClick
  end
  object NUM: TRxCalcEdit
    Left = 180
    Top = 4
    Width = 113
    Height = 21
    AutoSize = False
    DisplayFormat = '#0000000000'
    NumGlyphs = 2
    TabOrder = 3
  end
end
