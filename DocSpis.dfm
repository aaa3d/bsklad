object Doc_SPIS: TDoc_SPIS
  Left = 188
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Акт списания'
  ClientHeight = 544
  ClientWidth = 840
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 840
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 26
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton3: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton3'
      ImageIndex = 110
      OnClick = ToolButton3Click
    end
    object ToolButton5: TToolButton
      Left = 26
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 46
      Style = tbsSeparator
    end
    object Btn_Prow: TToolButton
      Left = 34
      Top = 2
      Hint = 'Провести акт списания'
      Caption = 'Btn_Prow'
      ImageIndex = 22
      OnClick = Btn_ProwClick
    end
    object BtnKorr: TToolButton
      Left = 60
      Top = 2
      Hint = 'Разрешить коррекцию'
      Caption = 'BtnKorr'
      ImageIndex = 170
      OnClick = BtnKorrClick
    end
    object Btn_Unprow: TToolButton
      Left = 86
      Top = 2
      Hint = 'Снять с проводки акт списания'
      Caption = 'Btn_Unprow'
      ImageIndex = 23
      OnClick = Btn_UnprowClick
    end
    object ToolButton8: TToolButton
      Left = 112
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object Btn_SAVE: TToolButton
      Left = 120
      Top = 2
      Hint = 'Сохранить акт списания (Ctrl+Enter)'
      Caption = 'Btn_SAVE'
      ImageIndex = 39
      OnClick = Btn_SAVEClick
    end
    object Btn_Apply: TToolButton
      Left = 146
      Top = 2
      Hint = 'Применить'
      Caption = 'ODE'
      ImageIndex = 38
      OnClick = Btn_ApplyClick
    end
    object ToolButton4: TToolButton
      Left = 172
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Btn_Print: TToolButton
      Left = 180
      Top = 2
      Hint = 'Печать акта списания (F9)'
      Caption = 'Btn_Print'
      ImageIndex = 9
      OnClick = Btn_PrintClick
    end
    object Btn_Propertis: TToolButton
      Left = 206
      Top = 2
      Hint = 'История акта списания (F12)'
      Caption = 'Btn_Propertis'
      ImageIndex = 3
      OnClick = Btn_PropertisClick
    end
    object Btn_Subdoc: TToolButton
      Left = 232
      Top = 2
      Hint = 'Создать на основании...'
      Caption = 'Btn_Subdoc'
      ImageIndex = 24
      OnClick = Btn_SubdocClick
    end
    object ToolButton11: TToolButton
      Left = 258
      Top = 2
      Width = 99
      Caption = 'ToolButton11'
      ImageIndex = 24
      Style = tbsSeparator
    end
    object Btn_DicTow: TToolButton
      Left = 357
      Top = 2
      Hint = 'Товары по каталогу'
      Caption = 'Btn_DicTow'
      ImageIndex = 37
      OnClick = Btn_DicTowClick
    end
    object Btn_FindTow: TToolButton
      Left = 383
      Top = 2
      Hint = 'Найти товар в акте списания'
      Caption = 'Btn_FindTow'
      ImageIndex = 7
      Visible = False
      OnClick = Btn_FindTowClick
    end
    object Btn_DelTow: TToolButton
      Left = 409
      Top = 2
      Hint = 'Удалить товар из акта списания'
      Caption = 'Btn_DelTow'
      ImageIndex = 2
      OnClick = Btn_DelTowClick
    end
    object ToolButton14: TToolButton
      Left = 435
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Btn_Detal: TToolButton
      Left = 443
      Top = 2
      Hint = 'Подробная информация о товаре...'
      Caption = 'Btn_Detal'
      ImageIndex = 11
      OnClick = Btn_DetalClick
    end
    object Btn_Analiz: TToolButton
      Left = 469
      Top = 2
      Hint = 'Анализ товара...'
      Caption = 'Btn_Analiz'
      ImageIndex = 12
      OnClick = Btn_AnalizClick
    end
    object Btn_Marketing: TToolButton
      Left = 495
      Top = 2
      Hint = 'Маркетинговые исследования'
      Caption = 'Btn_Marketing'
      ImageIndex = 10
      OnClick = Btn_MarketingClick
    end
    object ToolButton1: TToolButton
      Left = 521
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object Btn_PrintCenn: TToolButton
      Left = 529
      Top = 2
      Hint = 'Напечатать ценник на выбранный товар (F9)'
      Caption = 'Btn_PrintCenn'
      ImageIndex = 40
      OnClick = Btn_PrintCennClick
    end
    object Btn_PrintCennMore: TToolButton
      Left = 555
      Top = 2
      Hint = 'Напечатать цениики на все товары из акта списания (F9)'
      Caption = 'Btn_PrintCennMore'
      ImageIndex = 41
      OnClick = Btn_PrintCennMoreClick
    end
    object ToolButton2: TToolButton
      Left = 581
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object Btn_Ost: TToolButton
      Left = 589
      Top = 2
      Hint = 'Установить количество равным остатку товара'
      Caption = 'Btn_Ost'
      ImageIndex = 130
      OnClick = Btn_OstClick
    end
    object Btn_RefreshOst: TToolButton
      Left = 615
      Top = 2
      Hint = 'Обновить информацию об остатках...(Ctrl+~)'
      ImageIndex = 44
      OnClick = Btn_RefreshOstClick
    end
    object btnFastInfo: TToolButton
      Left = 641
      Top = 2
      Hint = 'Распределение товара в магазине (~)'
      Caption = 'btnFastInfo'
      ImageIndex = 43
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 525
    Width = 840
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
    Width = 840
    Height = 496
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 840
      Height = 143
      Align = alTop
      TabOrder = 0
      object Label8: TLabel
        Left = 12
        Top = 76
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
        Left = 592
        Top = 80
        Width = 40
        Height = 13
        Caption = 'Сумма :'
      end
      object Label3: TLabel
        Left = 10
        Top = 56
        Width = 64
        Height = 13
        Caption = 'Через кого :'
      end
      object Label2: TLabel
        Left = 412
        Top = 32
        Width = 51
        Height = 13
        Caption = 'Вид акта :'
      end
      object US2_LABEL: TLabel
        Left = 404
        Top = 54
        Width = 57
        Height = 13
        Caption = 'Виновный :'
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
      object Label5: TLabel
        Left = 16
        Top = 122
        Width = 60
        Height = 13
        Caption = 'Оформлен :'
      end
      object Label6: TLabel
        Left = 32
        Top = 9
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
        Left = 18
        Top = 31
        Width = 58
        Height = 13
        Caption = 'Со склада :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SPIS_OSN: TMemo
        Left = 80
        Top = 76
        Width = 509
        Height = 41
        Lines.Strings = (
          'Memo1')
        MaxLength = 250
        TabOrder = 4
        OnChange = SPIS_OSNChange
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
        OnChange = SPIS_DATEChange
      end
      object SPIS_SUMM: TRxCalcEdit
        Left = 636
        Top = 76
        Width = 101
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
        Top = 76
        Width = 21
        Height = 21
        Hint = 'Пересчитать сумму'
        TabOrder = 2
        OnClick = Btn_RefreshSummClick
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
      object SPIS_WHO: TEdit
        Left = 80
        Top = 52
        Width = 317
        Height = 21
        TabOrder = 5
        Text = 'SPIS_WHO'
        OnChange = SPIS_WHOChange
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
        TabOrder = 6
        OnChange = SPIS_SPISVIDChange
      end
      object US2_FULL: TEdit
        Left = 468
        Top = 52
        Width = 267
        Height = 21
        TabOrder = 7
        Text = 'US2_FULL'
      end
      object SHOP: TRxDBLookupCombo
        Left = 80
        Top = 118
        Width = 349
        Height = 21
        DropDownCount = 12
        EscapeClear = False
        LookupField = 'SHOP_ID'
        LookupDisplay = 'SHOP_NAME'
        LookupSource = DataModule1.MainDsShop
        TabOrder = 8
      end
      object FRM: TRxDBLookupCombo
        Left = 80
        Top = 5
        Width = 293
        Height = 20
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'KLN_ID'
        LookupDisplay = 'KLN_FULL'
        LookupSource = DataModule1.MainDsAllFrm
        TabOrder = 9
        OnChange = FRMChange
      end
      object SKL: TRxDBLookupCombo
        Left = 80
        Top = 27
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
        TabOrder = 10
        OnChange = SKLChange
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 143
      Width = 840
      Height = 353
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Содержимое Акта списания'
        object RxDBGrid1: TRxDBGrid
          Left = 0
          Top = 0
          Width = 832
          Height = 325
          Align = alClient
          DataSource = DsPERS
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnGetCellParams = RxDBGrid1GetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'TW_ART'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Код'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_NAM'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Наименование товара'
              Width = 294
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ED_SHORT'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Ед. изм.'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_MONEY'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Цена'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_KOL'
              Title.Alignment = taCenter
              Title.Caption = 'Кол-во'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_SUMM'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Сумма'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OST'
              Title.Alignment = taCenter
              Title.Caption = 'Остаток'
              Width = 87
              Visible = True
            end>
        end
      end
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
  object MemSPISS: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'TW_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_NAM'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'TW_MONEY'
        DataType = ftFloat
      end
      item
        Name = 'TW_KOL'
        DataType = ftFloat
      end
      item
        Name = 'ED_SHORT'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'SPISS_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_ART'
        DataType = ftInteger
      end
      item
        Name = 'OST'
        DataType = ftFloat
      end
      item
        Name = 'TW_COLOR'
        DataType = ftInteger
      end
      item
        Name = 'OTG_KOL'
        DataType = ftFloat
      end>
    OnCalcFields = MemSPISSCalcFields
    Left = 376
    Top = 245
    object MemSPISSTW_ID: TIntegerField
      FieldName = 'TW_ID'
    end
    object MemSPISSTW_NAM: TStringField
      FieldName = 'TW_NAM'
      Size = 254
    end
    object MemSPISSTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      DisplayFormat = '#0.00 руб'
    end
    object MemSPISSTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      OnChange = MemSPISSTW_KOLChange
      DisplayFormat = '#0.0000'
    end
    object MemSPISSTW_SUMM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_SUMM'
      DisplayFormat = '#0.00 руб'
      Calculated = True
    end
    object MemSPISSED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      Size = 32
    end
    object MemSPISSSTS_ID: TIntegerField
      FieldName = 'SPISS_ID'
    end
    object MemSPISSTW_ART: TIntegerField
      FieldName = 'TW_ART'
    end
    object MemSPISSOST: TFloatField
      FieldName = 'OST'
      DisplayFormat = '#0.0000'
    end
    object MemSPISSTW_COLOR: TIntegerField
      FieldName = 'TW_COLOR'
    end
    object MemSPISSOTG_KOL: TFloatField
      FieldName = 'OTG_KOL'
    end
  end
  object DsPERS: TDataSource
    DataSet = MemSPISS
    OnDataChange = DsPERSDataChange
    Left = 376
    Top = 305
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
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 272
    Top = 229
    object MnProw: TMenuItem
      Caption = 'Провести Акт списания'
      OnClick = Btn_ProwClick
    end
    object MnUnprow: TMenuItem
      Caption = 'Снять с проводки Акт списания'
      OnClick = Btn_UnprowClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MnSave: TMenuItem
      Caption = 'Сохранить Акт списания и выйти... (Ctrl+Enter)'
      OnClick = Btn_SAVEClick
    end
    object MnApply: TMenuItem
      Caption = 'Сохранить Акт списания без выхода (Применить)'
      OnClick = Btn_ApplyClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать Акт списания (F9)'
      OnClick = Btn_PrintClick
    end
    object MnHistory: TMenuItem
      Caption = '"История" Акта списания'
      ShortCut = 123
      OnClick = Btn_PropertisClick
    end
    object MnSubDoc: TMenuItem
      Caption = 'Создать новый документ на основании данного акта спиания'
      OnClick = Btn_SubdocClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object MnTW: TMenuItem
      Caption = 'Товары по каталогу '
      ShortCut = 122
      OnClick = Btn_DicTowClick
    end
    object MnFind: TMenuItem
      Caption = 'Найти товар в акте списания (1..9)'
      Visible = False
      OnClick = Btn_FindTowClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить товар из Акта списания'
      OnClick = Btn_DelTowClick
    end
    object N13: TMenuItem
      Caption = '-'
      ShortCut = 189
    end
    object N4: TMenuItem
      Caption = 'Выбрать фирму по каталогу товаров'
      ImageIndex = 14
      ShortCut = 16505
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MnDetal: TMenuItem
      Caption = 'Подробная информация о товаре'
      ShortCut = 113
      OnClick = Btn_DetalClick
    end
    object MnAnaliz: TMenuItem
      Caption = 'Анализ товара'
      ShortCut = 114
      OnClick = Btn_AnalizClick
    end
    object MnMarketing: TMenuItem
      Caption = 'Маркетинговые исследования товара'
      ShortCut = 115
      OnClick = Btn_MarketingClick
    end
    object N18: TMenuItem
      Caption = '-'
    end
    object MnCenn: TMenuItem
      Caption = 'Напечатать ценник   (F9)'
      OnClick = Btn_PrintCennClick
    end
    object MnCennMore: TMenuItem
      Caption = 'Напечатать ценники на все товары из Акта списания  (F9)'
      OnClick = Btn_PrintCennMoreClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnOst: TMenuItem
      Caption = 'Установить количество товара равным остатку'
      ImageIndex = 130
      OnClick = Btn_OstClick
    end
    object MnRefreshOst: TMenuItem
      Caption = 'Обновить информацию об остатках товаров (Ctrl+~)'
      OnClick = Btn_RefreshOstClick
    end
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
end
