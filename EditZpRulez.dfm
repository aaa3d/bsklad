object Edit_Zp_Rulez: TEdit_Zp_Rulez
  Left = 128
  Top = 155
  Width = 808
  Height = 499
  Caption = 'Расчет'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 453
    Width = 800
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 453
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 397
      Height = 453
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 397
        Height = 29
        Caption = 'ToolBar1'
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 2
          Caption = 'ToolButton1'
          ImageIndex = 0
          OnClick = ToolButton1Click
        end
        object ToolButton2: TToolButton
          Left = 23
          Top = 2
          Caption = 'ToolButton2'
          ImageIndex = 1
        end
        object ToolButton3: TToolButton
          Left = 46
          Top = 2
          Caption = 'ToolButton3'
          ImageIndex = 2
        end
      end
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 29
        Width = 397
        Height = 424
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object Panel3: TPanel
      Left = 397
      Top = 0
      Width = 403
      Height = 453
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 403
        Height = 29
        Caption = 'ToolBar2'
        TabOrder = 0
        object ToolButton4: TToolButton
          Left = 0
          Top = 2
          Caption = 'ToolButton4'
          ImageIndex = 0
        end
        object ToolButton5: TToolButton
          Left = 23
          Top = 2
          Caption = 'ToolButton5'
          ImageIndex = 1
        end
        object ToolButton6: TToolButton
          Left = 46
          Top = 2
          Caption = 'ToolButton6'
          ImageIndex = 2
        end
      end
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 29
        Width = 403
        Height = 424
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
end
