object Move_tree: TMove_tree
  Left = 98
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Выбор раздела для перемещения.'
  ClientHeight = 388
  ClientWidth = 354
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 354
    Height = 41
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 369
    Width = 354
    Height = 19
    Panels = <>
    SimplePanel = False
    SizeGrip = False
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 41
    Width = 273
    Height = 328
    Align = alLeft
    Images = DataModule1.ImageList1
    Indent = 21
    TabOrder = 2
    OnDblClick = TreeView1DblClick
  end
  object BtnSelect: TButton
    Left = 276
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Выбрать'
    TabOrder = 3
    OnClick = BtnSelectClick
  end
  object BtnClose: TButton
    Left = 276
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 4
    OnClick = BtnCloseClick
  end
end
