object KKM_STAT: TKKM_STAT
  Left = 128
  Top = 144
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Статистика по кассе'
  ClientHeight = 423
  ClientWidth = 520
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
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 442
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 0
    Top = 0
    Width = 439
    Height = 423
    Align = alLeft
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
end
