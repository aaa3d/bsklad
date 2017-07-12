object Set_JouDate: TSet_JouDate
  Left = 114
  Top = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Установить журнал на дату...'
  ClientHeight = 69
  ClientWidth = 254
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
    Top = 12
    Width = 110
    Height = 13
    Caption = 'Новая дата журнала :'
  end
  object DateEdit1: TDateEdit
    Left = 124
    Top = 8
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
    OnKeyPress = DateEdit1KeyPress
  end
  object BtnOk: TButton
    Left = 80
    Top = 36
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 1
    OnClick = BtnOkClick
  end
  object Button2: TButton
    Left = 168
    Top = 36
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    OnClick = Button2Click
  end
end
