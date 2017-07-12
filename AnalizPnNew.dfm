object ANALIZ_PN_NEW: TANALIZ_PN_NEW
  Left = 44
  Top = 130
  Width = 696
  Height = 480
  Caption = 'Анализ приходной накладной'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 69
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 69
    Width = 688
    Height = 365
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 231
      Top = 0
      Width = 3
      Height = 365
      Cursor = crHSplit
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 231
      Height = 365
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 234
      Top = 0
      Width = 454
      Height = 365
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 434
    Width = 688
    Height = 19
    Panels = <>
    SimplePanel = False
  end
end
