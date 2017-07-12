object Doc_PER: TDoc_PER
  Left = 507
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Накладная перемещения'
  ClientHeight = 704
  ClientWidth = 1038
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
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
  PixelsPerInch = 120
  TextHeight = 16
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1038
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
      Hint = 'Провести накладную'
      Caption = 'Btn_Prow'
      ImageIndex = 22
      OnClick = Btn_ProwClick
    end
    object Btn_Unprow: TToolButton
      Left = 60
      Top = 2
      Hint = 'Снять с проводки накладную'
      Caption = 'Btn_Unprow'
      ImageIndex = 23
      OnClick = Btn_UnprowClick
    end
    object ToolButton8: TToolButton
      Left = 86
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object Btn_SAVE: TToolButton
      Left = 94
      Top = 2
      Hint = 'Сохранить накладную перемещения (Ctrl+Enter)'
      Caption = 'Btn_SAVE'
      ImageIndex = 39
      OnClick = Btn_SAVEClick
    end
    object Btn_Apply: TToolButton
      Left = 120
      Top = 2
      Hint = 'Применить '
      Caption = 'Btn_Apply'
      ImageIndex = 38
      OnClick = Btn_ApplyClick
    end
    object ToolButton4: TToolButton
      Left = 146
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Btn_Print: TToolButton
      Left = 154
      Top = 2
      Hint = 'Печать накладной (F9)'
      Caption = 'Btn_Print'
      ImageIndex = 9
      OnClick = Btn_PrintClick
    end
    object Btn_Propertis: TToolButton
      Left = 180
      Top = 2
      Hint = 'История накладной (F12)'
      Caption = 'Btn_Propertis'
      ImageIndex = 3
      OnClick = Btn_PropertisClick
    end
    object Btn_Subdoc: TToolButton
      Left = 206
      Top = 2
      Hint = 'Создать на основании...'
      Caption = 'Btn_Subdoc'
      ImageIndex = 24
      OnClick = Btn_SubdocClick
    end
    object ToolButton11: TToolButton
      Left = 232
      Top = 2
      Width = 99
      Caption = 'ToolButton11'
      ImageIndex = 24
      Style = tbsSeparator
    end
    object Btn_DicTow: TToolButton
      Left = 331
      Top = 2
      Hint = 'Товары по каталогу'
      Caption = 'Btn_DicTow'
      ImageIndex = 37
      OnClick = Btn_DicTowClick
    end
    object Btn_FindTow: TToolButton
      Left = 357
      Top = 2
      Hint = 'Найти товар в накладной'
      Caption = 'Btn_FindTow'
      ImageIndex = 7
      Visible = False
      OnClick = Btn_FindTowClick
    end
    object Btn_DelTow: TToolButton
      Left = 383
      Top = 2
      Hint = 'Удалить товар из накладной'
      Caption = 'Btn_DelTow'
      ImageIndex = 2
      OnClick = Btn_DelTowClick
    end
    object ToolButton14: TToolButton
      Left = 409
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Btn_Detal: TToolButton
      Left = 417
      Top = 2
      Hint = 'Подробная информация о товаре...'
      Caption = 'Btn_Detal'
      ImageIndex = 11
      OnClick = Btn_DetalClick
    end
    object Btn_Analiz: TToolButton
      Left = 443
      Top = 2
      Hint = 'Анализ товара...'
      Caption = 'Btn_Analiz'
      ImageIndex = 12
      OnClick = Btn_AnalizClick
    end
    object Btn_Marketing: TToolButton
      Left = 469
      Top = 2
      Hint = 'Маркетинговые исследования'
      Caption = 'Btn_Marketing'
      ImageIndex = 10
      OnClick = Btn_MarketingClick
    end
    object ToolButton1: TToolButton
      Left = 495
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object Btn_PrintCenn: TToolButton
      Left = 503
      Top = 2
      Hint = 'Напечатать ценник на выбранный товар (F9)'
      Caption = 'Btn_PrintCenn'
      ImageIndex = 40
      OnClick = Btn_PrintCennClick
    end
    object Btn_PrintCennMore: TToolButton
      Left = 529
      Top = 2
      Hint = 'Напечатать цениики на все товары из накладной (F9)'
      Caption = 'Btn_PrintCennMore'
      ImageIndex = 41
      OnClick = Btn_PrintCennMoreClick
    end
    object ToolButton2: TToolButton
      Left = 555
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object Btn_Ost: TToolButton
      Left = 563
      Top = 2
      Hint = 'Установить количество равным остатку'
      Caption = 'Btn_Ost'
      ImageIndex = 130
      OnClick = Btn_OstClick
    end
    object Btn_RefreshOst: TToolButton
      Left = 589
      Top = 2
      Hint = 'Обновить информацию об остатках...(Ctrl+~)'
      ImageIndex = 44
      OnClick = Btn_RefreshOstClick
    end
    object btnFastInfo: TToolButton
      Left = 615
      Top = 2
      Hint = 'Распределение товара в магазине (~)'
      Caption = 'btnFastInfo'
      ImageIndex = 43
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 685
    Width = 1038
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
    Width = 1038
    Height = 656
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1038
      Height = 178
      Align = alTop
      TabOrder = 0
      object Label8: TLabel
        Left = 15
        Top = 129
        Width = 79
        Height = 16
        Caption = 'Основание :'
      end
      object Label10: TLabel
        Left = 518
        Top = 69
        Width = 49
        Height = 16
        Caption = 'Номер :'
      end
      object Label11: TLabel
        Left = 726
        Top = 69
        Width = 38
        Height = 16
        Caption = 'Дата :'
      end
      object Label14: TLabel
        Left = 522
        Top = 98
        Width = 49
        Height = 16
        Caption = 'Сумма :'
      end
      object Label1: TLabel
        Left = 20
        Top = 39
        Width = 72
        Height = 16
        Caption = 'Со склада :'
      end
      object Label3: TLabel
        Left = 12
        Top = 69
        Width = 79
        Height = 16
        Caption = 'Через кого :'
      end
      object Label4: TLabel
        Left = 39
        Top = 10
        Width = 50
        Height = 16
        Caption = 'Фирма :'
      end
      object Label6: TLabel
        Left = 266
        Top = 39
        Width = 65
        Height = 16
        Caption = 'На склад :'
      end
      object Label7: TLabel
        Left = 729
        Top = 98
        Width = 66
        Height = 16
        Caption = 'Масса, кг :'
      end
      object Label2: TLabel
        Left = 512
        Top = 10
        Width = 54
        Height = 16
        Caption = 'Фирма2:'
      end
      object frm2: TLabel
        Left = 576
        Top = 10
        Width = 3
        Height = 16
      end
      object PER_OSN: TMemo
        Left = 98
        Top = 128
        Width = 834
        Height = 46
        Lines.Strings = (
          'Memo1')
        MaxLength = 250
        TabOrder = 4
        OnChange = PER_OSNChange
      end
      object PER_NUM: TEdit
        Left = 576
        Top = 64
        Width = 134
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = 'PER_NUM'
      end
      object PER_DATE: TDateEdit
        Left = 768
        Top = 64
        Width = 164
        Height = 26
        ButtonWidth = 26
        NumGlyphs = 2
        TabOrder = 3
        OnChange = PER_DATEChange
      end
      object PER_SUMM: TRxCalcEdit
        Left = 576
        Top = 94
        Width = 114
        Height = 25
        AutoSize = False
        DisplayFormat = '#,0.00'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
      end
      object Btn_RefreshSumm: TBitBtn
        Left = 689
        Top = 94
        Width = 26
        Height = 25
        Hint = 'Пересчитать сумму и вес'
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
      object SKL_FROM: TRxDBLookupCombo
        Left = 98
        Top = 34
        Width = 159
        Height = 29
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DataModule1.MainDsSkl
        TabOrder = 5
        OnChange = SKL_FROMChange
      end
      object PER_WHO: TEdit
        Left = 98
        Top = 64
        Width = 391
        Height = 21
        TabOrder = 6
        Text = 'PER_WHO'
        OnChange = PER_WHOChange
      end
      object SKL_TO: TRxDBLookupCombo
        Left = 335
        Top = 34
        Width = 154
        Height = 29
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DataModule1.MainDsSkl
        TabOrder = 7
        OnChange = SKL_TOChange
      end
      object PER_WEIGHT: TRxCalcEdit
        Left = 793
        Top = 94
        Width = 114
        Height = 25
        AutoSize = False
        DisplayFormat = '#,0.00'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 8
      end
      object BitBtn1: TBitBtn
        Left = 906
        Top = 94
        Width = 26
        Height = 25
        Hint = 'Пересчитать сумму и вес'
        TabOrder = 9
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
      object FRM: TRxDBLookupCombo
        Left = 98
        Top = 7
        Width = 391
        Height = 29
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'KLN_ID'
        LookupDisplay = 'KLN_FULL'
        LookupSource = DataModule1.MainDsAllFrm
        TabOrder = 10
        OnChange = FRMChange
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 178
      Width = 1038
      Height = 478
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Содержимое накладной'
        object RxDBGrid1: TRxDBGrid
          Left = 0
          Top = 0
          Width = 1030
          Height = 447
          Align = alClient
          DataSource = DsPERS
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -14
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
              Title.Caption = 'Цена, розн.'
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OST'
              Title.Alignment = taCenter
              Title.Caption = 'Остаток'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERS_WEIGHT'
              Title.Caption = 'Масса, кг'
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
  object MemPERS: TRxMemoryData
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
        Name = 'PERS_ID'
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
      end
      item
        Name = 'POL_KOL'
        DataType = ftFloat
      end
      item
        Name = 'TW_WEIGHT'
        DataType = ftFloat
      end>
    OnCalcFields = MemPERSCalcFields
    Left = 376
    Top = 245
    object MemPERSTW_ID: TIntegerField
      FieldName = 'TW_ID'
      OnChange = MemPERSTW_IDChange
    end
    object MemPERSTW_NAM: TStringField
      FieldName = 'TW_NAM'
      OnChange = MemPERSTW_IDChange
      Size = 254
    end
    object MemPERSTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      OnChange = MemPERSTW_IDChange
      DisplayFormat = '#0.00 руб'
    end
    object MemPERSTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      OnChange = MemPERSTW_KOLChange
      DisplayFormat = '#0.0000'
    end
    object MemPERSTW_SUMM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_SUMM'
      OnChange = MemPERSTW_IDChange
      DisplayFormat = '#0.00 руб'
      Calculated = True
    end
    object MemPERSED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      OnChange = MemPERSTW_IDChange
      Size = 32
    end
    object MemPERSSTS_ID: TIntegerField
      FieldName = 'PERS_ID'
      OnChange = MemPERSTW_IDChange
    end
    object MemPERSTW_ART: TIntegerField
      FieldName = 'TW_ART'
      OnChange = MemPERSTW_IDChange
    end
    object MemPERSOST: TFloatField
      FieldName = 'OST'
      DisplayFormat = '#0.0000'
    end
    object MemPERSTW_COLOR: TIntegerField
      FieldName = 'TW_COLOR'
    end
    object MemPERSOTG_KOL: TFloatField
      FieldName = 'OTG_KOL'
    end
    object MemPERSPOL_KOL: TFloatField
      FieldName = 'POL_KOL'
    end
    object MemPersPERS_WEIGHT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PERS_WEIGHT'
      DisplayFormat = '#0.0000'
      Calculated = True
    end
    object MemPERSTW_WEIGHT: TFloatField
      FieldName = 'TW_WEIGHT'
    end
  end
  object DsPERS: TDataSource
    DataSet = MemPERS
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
      Caption = 'Провести накладную перемещения'
      OnClick = Btn_ProwClick
    end
    object MnUnprow: TMenuItem
      Caption = 'Снять с проводки накладную перемещения'
      OnClick = Btn_UnprowClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MnSave: TMenuItem
      Caption = 'Сохранить накладную перемещения и выйти... (Ctrl+Enter)'
      OnClick = Btn_SAVEClick
    end
    object MnApply: TMenuItem
      Caption = 'Сохранить накладную перемещения без выхода '
      OnClick = Btn_ApplyClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать накладную перемещения (F9)'
      OnClick = Btn_PrintClick
    end
    object MnHistory: TMenuItem
      Caption = '"История" накладной перемещения'
      ShortCut = 123
      OnClick = Btn_PropertisClick
    end
    object MnSubDoc: TMenuItem
      Caption = 'Создать новый документ на основании данной накладной'
      OnClick = Btn_SubdocClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object MnFRM: TMenuItem
      Caption = 'Поменять фирму '
      ImageIndex = 14
      ShortCut = 16505
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MnTW: TMenuItem
      Caption = 'Товары по каталогу '
      ShortCut = 122
      OnClick = Btn_DicTowClick
    end
    object MnFind: TMenuItem
      Caption = 'Найти товар в накладной (1..9)'
      Visible = False
      OnClick = Btn_FindTowClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить товар из накладной'
      OnClick = Btn_DelTowClick
    end
    object N13: TMenuItem
      Caption = '-'
      ShortCut = 189
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
      Caption = 'Напечатать ценники на все товары из накладной   (F9)'
      OnClick = Btn_PrintCennMoreClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnOst: TMenuItem
      Caption = 'Установить количество товара равным остатку'
      Hint = 'Установить количество равным остатку'
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
