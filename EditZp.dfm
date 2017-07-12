object EDIT_ZP: TEDIT_ZP
  Left = 63
  Top = 144
  BorderStyle = bsSingle
  Caption = 'Изменение штатного расписания'
  ClientHeight = 59
  ClientWidth = 296
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
  object RadioButton1: TRadioButton
    Left = 4
    Top = 4
    Width = 199
    Height = 17
    Caption = 'Изменить дату приема на работу'
    TabOrder = 0
  end
  object RadioButton2: TRadioButton
    Left = 4
    Top = 26
    Width = 163
    Height = 17
    Caption = 'Перевести в другой отдел'
    Checked = True
    TabOrder = 1
    TabStop = True
  end
  object BtnOk: TButton
    Left = 218
    Top = 2
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 2
    OnClick = BtnOkClick
  end
  object BtnClose: TButton
    Left = 218
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 3
    OnClick = BtnCloseClick
  end
end
