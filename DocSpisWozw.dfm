object DOC_SPIS_WOZW: TDOC_SPIS_WOZW
  Left = 243
  Top = 215
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'DOC_SPIS_WOZW'
  ClientHeight = 513
  ClientWidth = 933
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDefault
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 494
    Width = 933
    Height = 19
    Panels = <
      item
        Text = 'Состояние :'
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 933
    Height = 465
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 933
      Height = 161
      Align = alTop
      TabOrder = 0
      object Label8: TLabel
        Left = 12
        Top = 84
        Width = 62
        Height = 13
        Caption = 'Основание :'
      end
      object Label10: TLabel
        Left = 421
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Номер :'
      end
      object Label11: TLabel
        Left = 600
        Top = 8
        Width = 32
        Height = 13
        Caption = 'Дата :'
      end
      object Label14: TLabel
        Left = 608
        Top = 104
        Width = 40
        Height = 13
        Caption = 'Сумма :'
      end
      object Label2: TLabel
        Left = 412
        Top = 32
        Width = 51
        Height = 13
        Caption = 'Вид акта :'
      end
      object Label5: TLabel
        Left = 13
        Top = 58
        Width = 60
        Height = 13
        Caption = 'Оформлен :'
      end
      object US2_Btn: TSpeedButton
        Left = 734
        Top = 52
        Width = 23
        Height = 22
        Hint = 'Выбор виновного'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
          0555088888888888805508000000000088055080FFFFFF0508800000000000F0
          F0800FFFFFFFFF0F008050F00F00FFF0F08050FFFFFFFFF0F080000FFFFFFFFF
          00000900F00000F00090090FFFFFFFFF0090000FFFFFFFFF0F00550F000F00FF
          0F05550FFFFFFFFF0005550FFF00000005555550005555555555}
        OnClick = US2_BtnClick
      end
      object US2_LABEL: TLabel
        Left = 404
        Top = 54
        Width = 57
        Height = 13
        Caption = 'Виновный :'
      end
      object Label6: TLabel
        Left = 34
        Top = 10
        Width = 43
        Height = 13
        Caption = 'Фирма :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 23
        Top = 30
        Width = 53
        Height = 13
        Caption = 'На склад :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SPIS_OSN: TMemo
        Left = 80
        Top = 84
        Width = 509
        Height = 41
        Lines.Strings = (
          'Memo1')
        MaxLength = 250
        TabOrder = 4
      end
      object SPIS_NUM: TEdit
        Left = 468
        Top = 4
        Width = 121
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = 'SPIS_NUM'
      end
      object SPIS_DATE: TDateEdit
        Left = 636
        Top = 4
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 3
      end
      object SPIS_SUMM: TRxCalcEdit
        Left = 656
        Top = 100
        Width = 81
        Height = 21
        AutoSize = False
        DisplayFormat = '#,0.00'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
      end
      object Btn_RefreshSumm: TBitBtn
        Left = 736
        Top = 100
        Width = 21
        Height = 21
        Hint = 'Пересчитать сумму'
        TabOrder = 2
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          0400000000007800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFFF000000000000FFFF0FEFEFEFEFE0F00F0E000E0000F0FB000FEFEF0F
          F0E0F7B00E000E0000F0F7FB00EFEFEFEFE0FF7FB0000E0000F00000FB00FF0F
          F0E07FBBBBB00E0000F0F7FB00EFEFEFEFE0FF7BB00000000000FF7FBB00FFFF
          FFFFFFF7FBB00FFFFFFFFFFF7FBB00FFFFFF}
      end
      object SPIS_SPISVID: TRxDBLookupCombo
        Left = 468
        Top = 28
        Width = 289
        Height = 21
        DropDownCount = 8
        LookupField = 'SPISVID_ID'
        LookupDisplay = 'SPISVID_NAM'
        LookupSource = DataModule1.MainDsSpisVid
        TabOrder = 5
        OnChange = SPIS_SPISVIDChange
      end
      object SHOP: TRxDBLookupCombo
        Left = 80
        Top = 54
        Width = 315
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'SHOP_ID'
        LookupDisplay = 'SHOP_NAME'
        LookupSource = DataModule1.MainDsShop
        TabOrder = 6
      end
      object US2_FULL: TEdit
        Left = 468
        Top = 52
        Width = 267
        Height = 21
        TabOrder = 7
        Text = 'US2_FULL'
      end
      object FRM: TRxDBLookupCombo
        Left = 80
        Top = 4
        Width = 313
        Height = 20
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'KLN_ID'
        LookupDisplay = 'KLN_FULL'
        LookupSource = DataModule1.MainDsDopFrm
        TabOrder = 8
        OnChange = FRMChange
      end
      object SKL: TRxDBLookupCombo
        Left = 80
        Top = 26
        Width = 143
        Height = 21
        DropDownCount = 12
        EscapeClear = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DataModule1.MainDsSkl
        ParentFont = False
        TabOrder = 9
        OnChange = SKLChange
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 161
      Width = 933
      Height = 304
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Содержимое Акта списания'
        object RxDBGrid2: TRxDBGrid
          Left = 0
          Top = 0
          Width = 925
          Height = 276
          Align = alClient
          DataSource = DsWozw
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnGetCellParams = RxDBGrid2GetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'TW_ART'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Код'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_NAME'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Наименование'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NAME'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Документ'
              Width = 161
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_DATE'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Дата списания'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ED_SHORT'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Ед.'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RNS_MONEY'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Цена'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RNS_KOL'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Списано'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RNS_OST'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Для возврата'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RNS_SUMM'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Сумма'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WOZW_KOL'
              Title.Alignment = taCenter
              Title.Caption = 'Возврат'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'WOZW_SUMM'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Сумма возврата'
              Width = 94
              Visible = True
            end>
        end
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 933
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    EdgeBorders = [ebBottom]
    Images = DataModule1.ImageList1
    TabOrder = 2
    object ToolButton6: TToolButton
      Left = 0
      Top = 2
      Action = MnLock
    end
    object ToolButton7: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 33
      Top = 2
      Action = MnProw
    end
    object ToolButton2: TToolButton
      Left = 58
      Top = 2
      Action = MnUnprow
    end
    object ToolButton3: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 91
      Top = 2
      Action = MnSave
    end
    object ToolButton5: TToolButton
      Left = 116
      Top = 2
      Action = MnApply
    end
    object ToolButton8: TToolButton
      Left = 141
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 149
      Top = 2
      Action = MnPrint
    end
    object ToolButton10: TToolButton
      Left = 174
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 182
      Top = 2
      Action = MnDicTw
    end
    object ToolButton12: TToolButton
      Left = 207
      Top = 2
      Action = MnDel
    end
    object ToolButton13: TToolButton
      Left = 232
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton17: TToolButton
      Left = 240
      Top = 2
      Width = 8
      Caption = 'ToolButton17'
      ImageIndex = 11
      Style = tbsSeparator
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 72
    Top = 241
  end
  object SpisDocTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 432
    Top = 237
  end
  object Query1Transaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 68
    Top = 301
  end
  object IBQuery2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 12
    Top = 241
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 616
    Top = 234
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 606
    Top = 286
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 142
    Top = 250
  end
  object DsWozw: TDataSource
    DataSet = MemWozw
    Left = 198
    Top = 336
  end
  object MemWozw: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'TW_ID'
        DataType = ftInteger
      end
      item
        Name = 'RNS_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_ART'
        DataType = ftInteger
      end
      item
        Name = 'TW_NAME'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'WOZW_ID'
        DataType = ftInteger
      end
      item
        Name = 'DOC_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DOC_DATE'
        DataType = ftDate
      end
      item
        Name = 'ED_SHORT'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'RNS_MONEY'
        DataType = ftFloat
      end
      item
        Name = 'RNS_KOL'
        DataType = ftFloat
      end
      item
        Name = 'RNS_OST'
        DataType = ftFloat
      end
      item
        Name = 'WOZW_KOL'
        DataType = ftFloat
      end
      item
        Name = 'SHOP_ID'
        DataType = ftInteger
      end
      item
        Name = 'SHOP_NAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RNS_TABEL'
        DataType = ftInteger
      end
      item
        Name = 'TW_SHORT_NAM'
        DataType = ftString
        Size = 35
      end>
    OnCalcFields = MemWozwCalcFields
    Left = 190
    Top = 216
    object MemWozwTW_ID: TIntegerField
      FieldName = 'TW_ID'
    end
    object MemWozwRNS_ID: TIntegerField
      FieldName = 'RNS_ID'
    end
    object MemWozwTW_ART: TIntegerField
      DisplayLabel = 'ART'
      FieldName = 'TW_ART'
    end
    object MemWozwTW_NAME: TStringField
      FieldName = 'TW_NAME'
      Size = 252
    end
    object MemWozwWOZW_ID: TIntegerField
      FieldName = 'WOZW_ID'
    end
    object MemWozwDOC_NAME: TStringField
      FieldName = 'DOC_NAME'
      Size = 100
    end
    object MemWozwDOC_DATE: TDateField
      FieldName = 'DOC_DATE'
    end
    object MemWozwED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      Size = 12
    end
    object MemWozwRNS_MONEY: TFloatField
      FieldName = 'RNS_MONEY'
      DisplayFormat = '#0.00'
    end
    object MemWozwRNS_KOL: TFloatField
      FieldName = 'RNS_KOL'
      DisplayFormat = '#0.0000'
    end
    object MemWozwRNS_OST: TFloatField
      FieldName = 'RNS_OST'
      DisplayFormat = '#0.0000'
    end
    object MemWozwRNS_SUMM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RNS_SUMM'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemWozwWOZW_KOL: TFloatField
      FieldName = 'WOZW_KOL'
      OnChange = MemWozwWOZW_KOLChange
      DisplayFormat = '#0.0000'
    end
    object MemWozwWOZW_SUMM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'WOZW_SUMM'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemWozwSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object MemWozwSHOP_NAME: TStringField
      FieldName = 'SHOP_NAME'
      Size = 64
    end
    object MemWozwRNS_TABEL: TIntegerField
      FieldName = 'RNS_TABEL'
    end
    object MemWozwTW_SHORT_NAM: TStringField
      FieldName = 'TW_SHORT_NAM'
      Size = 35
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 368
    Top = 208
    object MnLock1: TMenuItem
      Action = MnLock
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Action = MnProw
    end
    object N3: TMenuItem
      Action = MnUnprow
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Action = MnSave
    end
    object N6: TMenuItem
      Action = MnApply
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Action = MnPrint
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = MnDicTw
    end
    object N11: TMenuItem
      Action = MnDel
    end
    object N12: TMenuItem
      Caption = '-'
    end
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 262
    Top = 208
    object MnLock: TAction
      Caption = 'Заблокировать систему...'
      Hint = 'Заблокировать систему...'
      ImageIndex = 110
      OnExecute = MnLockExecute
    end
    object MnProw: TAction
      Caption = 'Провести...'
      Hint = 'Провести...'
      ImageIndex = 22
      ShortCut = 116
      OnExecute = MnProwExecute
    end
    object MnUnprow: TAction
      Caption = 'Снять с проводки...'
      Hint = 'Снять с проводки...'
      ImageIndex = 23
      ShortCut = 117
      OnExecute = MnUnprowExecute
    end
    object MnSave: TAction
      Caption = 'Сохранить...'
      Hint = 'Сохранить...'
      ImageIndex = 39
      OnExecute = MnSaveExecute
    end
    object MnApply: TAction
      Caption = 'Применить...'
      Hint = 'Применить...'
      ImageIndex = 38
      OnExecute = MnApplyExecute
    end
    object MnPrint: TAction
      Caption = 'Печать...'
      Hint = 'Печать...'
      ImageIndex = 9
      ShortCut = 120
      OnExecute = MnPrintExecute
    end
    object MnDicTw: TAction
      Caption = 'Товары по каталогу...'
      Hint = 'Товары по каталогу...'
      ImageIndex = 37
      OnExecute = MnDicTwExecute
    end
    object MnDel: TAction
      Caption = 'Удалить...'
      Hint = 'Удалить...'
      ImageIndex = 2
      OnExecute = MnDelExecute
    end
    object MnDetal: TAction
      Caption = 'Подробно о товаре...'
      Enabled = False
      Hint = 'Подробно о товаре...'
      ImageIndex = 11
      ShortCut = 113
    end
    object MnAnaliz: TAction
      Caption = 'Анализ товара...'
      Enabled = False
      Hint = 'Анализ товара...'
      ImageIndex = 12
      ShortCut = 114
    end
    object MnMarket: TAction
      Caption = 'Маркетинговые данные товара...'
      Enabled = False
      Hint = 'Маркетинговые данные товара...'
      ImageIndex = 10
      ShortCut = 115
    end
    object ActKKM: TAction
      Caption = 'Печать чека возврата...'
      Hint = 'Печать чека возврата...'
      ImageIndex = 45
      ShortCut = 118
    end
  end
end
