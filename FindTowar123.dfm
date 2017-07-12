object Find_Towar_123: TFind_Towar_123
  Left = 279
  Top = 212
  Width = 231
  Height = 121
  BorderIcons = [biSystemMenu]
  Caption = 'Поиск товара по коду'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 4
    Top = 4
    Width = 16
    Height = 16
    AutoSize = True
    Picture.Data = {
      07544269746D6170F6000000424DF60000000000000076000000280000001000
      000010000000010004000000000080000000120B0000120B0000100000001000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFF
      FF00DADADADADADADADAADADADADADADADAD00000ADADA00000A0F000DADAD0F
      000D0F000ADADA0F000A0000000D0000000D00F000000F00000A00F000A00F00
      000D00F000D00F00000AA0000000000000ADDA0F000A0F000ADAAD00000D0000
      0DADDAD000DAD000DADAADA0F0ADA0F0ADADDAD000DAD000DADAADADADADADAD
      ADAD}
    Transparent = True
  end
  object Label1: TLabel
    Left = 4
    Top = 28
    Width = 63
    Height = 13
    Caption = 'Код товара :'
  end
  object Btn_Find: TButton
    Left = 64
    Top = 56
    Width = 75
    Height = 25
    Hint = '(Enter)'
    Caption = 'Найти'
    TabOrder = 0
    OnClick = Btn_FindClick
  end
  object Btn_Close: TButton
    Left = 144
    Top = 56
    Width = 75
    Height = 25
    Hint = '(ESC)'
    Caption = 'Закрыть'
    TabOrder = 1
    OnClick = Btn_CloseClick
  end
  object MaskEdit1: TRxSpinEdit
    Left = 72
    Top = 24
    Width = 121
    Height = 21
    AutoSelect = False
    TabOrder = 2
    OnKeyPress = MaskEdit1KeyPress
  end
end
