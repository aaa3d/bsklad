object TW_SHOW_OST: TTW_SHOW_OST
  Left = 313
  Top = 226
  BorderStyle = bsDialog
  Caption = 'TW_SHOW_OST'
  ClientHeight = 214
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BtnTW: TSpeedButton
    Left = 401
    Top = 10
    Width = 23
    Height = 21
    Glyph.Data = {
      4E010000424D4E01000000000000760000002800000012000000120000000100
      040000000000D800000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDD00000000DDDDDD000000DDD0
      999999900DDDDD000000DD099999999010DDDD000000D00111111110110DDD00
      0000D000000000000110DD000000DD070FFFFFF0F0110D000000DDD00FFFFFF0
      FF010D000000DDDD0FF7000088F00D000000DDDDD000888888F00D000000DDDD
      DD00000000F0DD000000DDDDDD0FFFFFF0F0DD000000DDDDDD0F000FF000DD00
      0000DDDDDD0FFFFFF0DDDD000000DDDDDD0FF70000DDDD000000DDDDDDD000DD
      DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
  end
  object Label1: TLabel
    Left = 36
    Top = 13
    Width = 37
    Height = 13
    Caption = 'Товар :'
  end
  object Label2: TLabel
    Left = 23
    Top = 42
    Width = 50
    Height = 13
    Caption = 'Магазин :'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 195
    Width = 439
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object TW: TEdit
    Left = 80
    Top = 10
    Width = 312
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = 'Все товары'
  end
  object SHOP: TComboBox
    Left = 81
    Top = 39
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'SHOP'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 417
    Height = 121
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dsList: TDataSource
    Left = 64
    Top = 136
  end
  object IBList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ListTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsList
    Left = 16
    Top = 136
  end
  object ListTransaction: TIBTransaction
    Active = False
    AutoStopAction = saNone
    Left = 136
    Top = 136
  end
end
