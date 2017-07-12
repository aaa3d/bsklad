object Whats_NEW: TWhats_NEW
  Left = 325
  Top = 183
  Width = 638
  Height = 425
  BorderIcons = [biSystemMenu]
  Caption = 'Что нового в программе'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 357
    Width = 630
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 254
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Закрыть'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object RichEdit1: TRxRichEdit
    Left = 0
    Top = 0
    Width = 630
    Height = 357
    Align = alClient
    Lines.Strings = (
      'Файл с описаниями изменений "WhatsNew.rtf" не обнаружен')
    TabOrder = 1
  end
end
