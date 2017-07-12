object CHANGE_DATE: TCHANGE_DATE
  Left = 223
  Top = 149
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Изменение времени документа'
  ClientHeight = 65
  ClientWidth = 269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 10
    Width = 29
    Height = 13
    Caption = 'Дата:'
  end
  object Label2: TLabel
    Left = 14
    Top = 34
    Width = 36
    Height = 13
    Caption = 'Время:'
  end
  object DT: TDateEdit
    Left = 56
    Top = 6
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object TM: TMaskEdit
    Left = 56
    Top = 30
    Width = 51
    Height = 21
    EditMask = '!90:90:90;1;'
    MaxLength = 8
    TabOrder = 1
    Text = '  :  :  '
  end
  object BtnOK: TButton
    Left = 190
    Top = 6
    Width = 75
    Height = 25
    Caption = 'ОК'
    TabOrder = 2
    OnClick = BtnOKClick
  end
  object Button2: TButton
    Left = 190
    Top = 34
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 3
    OnClick = Button2Click
  end
end
