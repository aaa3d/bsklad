object INTERNET_TW_DATA: TINTERNET_TW_DATA
  Left = 322
  Top = 137
  Width = 896
  Height = 720
  Caption = 'INTERNET_TW_DATA'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 293
    Top = 0
    Width = 3
    Height = 686
    Cursor = crHSplit
  end
  object Label1: TLabel
    Left = 312
    Top = 0
    Width = 51
    Height = 13
    Caption = 'Просмотр'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 293
    Height = 686
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 1
      Top = 361
      Width = 291
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 291
      Height = 360
      Align = alTop
      Caption = 'Опубликованные данные'
      TabOrder = 0
      object DrawGrid1: TDrawGrid
        Left = 2
        Top = 15
        Width = 287
        Height = 343
        Align = alClient
        ColCount = 3
        DefaultColWidth = 10
        DefaultRowHeight = 20
        RowCount = 4
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
        PopupMenu = PopupMenu1
        TabOrder = 0
        OnClick = DrawGrid1Click
        OnDrawCell = DrawGrid1DrawCell
        ColWidths = (
          10
          125
          123)
        RowHeights = (
          20
          66
          53
          67)
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 364
      Width = 291
      Height = 321
      Align = alClient
      Caption = 'Описание'
      TabOrder = 1
      object tw_info: TMemo
        Left = 2
        Top = 15
        Width = 287
        Height = 304
        Align = alClient
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
        OnChange = tw_infoChange
      end
    end
  end
  object ATViewer1: TATViewer
    Left = 312
    Top = 32
    Width = 561
    Height = 577
    BevelOuter = bvNone
    Caption = 'ATViewer1'
    TabOrder = 1
    TextFont.Charset = DEFAULT_CHARSET
    TextFont.Color = clWindowText
    TextFont.Height = -13
    TextFont.Name = 'Courier New'
    TextFont.Style = []
    TextFontOEM.Charset = OEM_CHARSET
    TextFontOEM.Color = clWindowText
    TextFontOEM.Height = -12
    TextFontOEM.Name = 'Terminal'
    TextFontOEM.Style = []
    TextFontFooter.Charset = DEFAULT_CHARSET
    TextFontFooter.Color = clBlack
    TextFontFooter.Height = -12
    TextFontFooter.Name = 'Arial'
    TextFontFooter.Style = []
    TextFontGutter.Charset = DEFAULT_CHARSET
    TextFontGutter.Color = clBlack
    TextFontGutter.Height = -12
    TextFontGutter.Name = 'Courier New'
    TextFontGutter.Style = []
    MediaLoop = False
    MediaShowControls = True
    MediaShowTracker = True
  end
  object PopupMenu1: TPopupMenu
    Left = 104
    Top = 172
    object N1: TMenuItem
      Caption = 'Добавить изображение'
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = 'Добавить документ'
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = 'Изменить комментарий'
    end
    object N6: TMenuItem
      Caption = 'Поднять выше'
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Caption = 'Удалить'
      OnClick = N5Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 213
    Top = 137
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 213
    Top = 193
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 338
    Top = 122
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 334
    Top = 54
  end
end
