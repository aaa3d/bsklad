object Set_DATA: TSet_DATA
  Left = 158
  Top = 165
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Set_DATA'
  ClientHeight = 63
  ClientWidth = 371
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
    Left = 124
    Top = 12
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Label1'
  end
  object DT: TDateEdit
    Left = 160
    Top = 8
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object Button1: TButton
    Left = 288
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 2
    OnClick = Button2Click
  end
end
