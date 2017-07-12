object Doc_ZONE_PER: TDoc_ZONE_PER
  Left = 444
  Top = 353
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Накладная перемещения между зонами'
  ClientHeight = 556
  ClientWidth = 830
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
    Width = 830
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
    Top = 537
    Width = 830
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
    Width = 830
    Height = 508
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 830
      Height = 145
      Align = alTop
      TabOrder = 0
      object Label8: TLabel
        Left = 12
        Top = 92
        Width = 62
        Height = 13
        Caption = 'Основание :'
      end
      object Label10: TLabel
        Left = 258
        Top = 17
        Width = 40
        Height = 13
        Caption = 'Номер :'
      end
      object Label11: TLabel
        Left = 265
        Top = 50
        Width = 32
        Height = 13
        Caption = 'Дата :'
      end
      object Label1: TLabel
        Left = 16
        Top = 19
        Width = 58
        Height = 13
        Caption = 'Со склада :'
      end
      object Label6: TLabel
        Left = 34
        Top = 51
        Width = 42
        Height = 13
        Caption = 'С зоны :'
      end
      object ZONE_PER_OSN: TMemo
        Left = 80
        Top = 91
        Width = 454
        Height = 50
        Lines.Strings = (
          'Memo1')
        MaxLength = 250
        TabOrder = 2
        OnChange = ZONE_PER_OSNChange
      end
      object ZONE_PER_NUM: TEdit
        Left = 306
        Top = 13
        Width = 108
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = 'ZONE_PER_NUM'
      end
      object ZONE_PER_DATE: TDateEdit
        Left = 306
        Top = 46
        Width = 133
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        OnChange = ZONE_PER_DATEChange
      end
      object SKL_FROM: TRxDBLookupCombo
        Left = 85
        Top = 15
        Width = 124
        Height = 23
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DataModule1.MainDsSkl
        TabOrder = 3
        OnChange = SKL_FROMChange
      end
      object ZONE_FROM: TRxDBLookupCombo
        Left = 85
        Top = 47
        Width = 124
        Height = 24
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'ZONE_ID'
        LookupDisplay = 'ZONE_NAME'
        LookupSource = MainDSZone
        TabOrder = 4
        OnChange = ZONE_FROMChange
      end
      object RxDBGrid11: TRxDBGrid
        Left = 560
        Top = 16
        Width = 217
        Height = 105
        DataSource = ds_tw_zone_distrib
        ReadOnly = True
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ZONE_NAME'
            Title.Caption = 'Зона'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_OST'
            Title.Caption = 'Остаток'
            Width = 75
            Visible = True
          end>
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 145
      Width = 830
      Height = 363
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Содержимое накладной'
        object RxDBGrid1: TRxDBGrid
          Left = 0
          Top = 0
          Width = 822
          Height = 335
          Align = alClient
          DataSource = DsZonePERS
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColExit = RxDBGrid1ColExit
          OnDrawColumnCell = RxDBGrid1DrawColumnCell
          OnExit = RxDBGrid1Exit
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
              Visible = False
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
              FieldName = 'ZONE_TO_NAME'
              Title.Caption = 'В зону'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERS_WEIGHT'
              Title.Caption = 'Масса, кг'
              Visible = False
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
              FieldName = 'TW_SUMM'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Сумма'
              Visible = False
            end>
        end
        object in_place_combo: TRxDBLookupCombo
          Left = 616
          Top = 172
          Width = 145
          Height = 21
          DropDownCount = 8
          LookupField = 'ZONE_ID'
          LookupDisplay = 'ZONE_NAME'
          LookupSource = MainDSZone
          TabOrder = 1
          Visible = False
          OnChange = in_place_comboChange
          OnExit = in_place_comboExit
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
  object MemZonePERS: TRxMemoryData
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
        Name = 'ZONE_PERS_ID'
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
        Name = 'TW_WEIGHT'
        DataType = ftFloat
      end
      item
        Name = 'ZONE_TO_ID'
        DataType = ftInteger
      end
      item
        Name = 'ZONE_TO_NAME'
        DataType = ftString
        Size = 20
      end>
    AfterScroll = MemZonePERSAfterScroll
    Left = 376
    Top = 245
    object MemZonePERSTW_ID: TIntegerField
      FieldName = 'TW_ID'
      OnChange = MemZonePERSTW_IDChange
    end
    object MemZonePERSTW_NAM: TStringField
      FieldName = 'TW_NAM'
      OnChange = MemZonePERSTW_IDChange
      Size = 254
    end
    object MemZonePERSTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      Visible = False
      OnChange = MemZonePERSTW_IDChange
      DisplayFormat = '#0.00 руб'
    end
    object MemZonePERSTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      OnChange = MemZonePERSTW_KOLChange
      DisplayFormat = '#0.0000'
    end
    object MemZonePERSTW_SUMM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_SUMM'
      OnChange = MemZonePERSTW_IDChange
      DisplayFormat = '#0.00 руб'
      Calculated = True
    end
    object MemZonePERSED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      OnChange = MemZonePERSTW_IDChange
      Size = 32
    end
    object MemZonePERSSTS_ID: TIntegerField
      FieldName = 'ZONE_PERS_ID'
      OnChange = MemZonePERSTW_IDChange
    end
    object MemZonePERSTW_ART: TIntegerField
      FieldName = 'TW_ART'
      OnChange = MemZonePERSTW_IDChange
    end
    object MemZonePERSOST: TFloatField
      FieldName = 'OST'
      DisplayFormat = '#0.0000'
    end
    object MemZonePERSTW_COLOR: TIntegerField
      FieldName = 'TW_COLOR'
    end
    object MemZonePERSPERS_WEIGHT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PERS_WEIGHT'
      DisplayFormat = '#0.0000'
      Calculated = True
    end
    object MemZonePERSTW_WEIGHT: TFloatField
      FieldName = 'TW_WEIGHT'
    end
    object MemZonePERSZONE_TO_ID: TIntegerField
      FieldName = 'ZONE_TO_ID'
    end
    object MemZonePERSZONE_TO_NAME: TStringField
      FieldName = 'ZONE_TO_NAME'
      EditMask = '0\-00\-00\-0;1;_'
    end
  end
  object DsZonePERS: TDataSource
    DataSet = MemZonePERS
    OnDataChange = DsZonePERSDataChange
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
  object MainDSZone: TDataSource
    DataSet = MainDicZone
    Left = 212
    Top = 337
  end
  object MainDicZone: TRxMemoryData
    FieldDefs = <>
    Left = 224
    Top = 384
    object MainDicZoneZONE_ID: TIntegerField
      FieldName = 'ZONE_ID'
      Origin = 'ZONE.ZONE_ID'
      Required = True
    end
    object MainDicZoneSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Origin = 'ZONE.SKL_ID'
      Required = True
    end
    object MainDicZoneZONE_NAME: TIBStringField
      FieldName = 'ZONE_NAME'
      Origin = 'ZONE.ZONE_NAME'
      Required = True
      Size = 32
    end
    object MainDicZoneZONE_DESCR: TIBStringField
      FieldName = 'ZONE_DESCR'
      Origin = 'ZONE.ZONE_DESCR'
      Required = True
      Size = 254
    end
    object MainDicZoneTM: TDateTimeField
      FieldName = 'TM'
      Origin = 'ZONE.TM'
    end
  end
  object MainDicZone1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 10
    CachedUpdates = False
    SQL.Strings = (
      'select zone.*'
      ' from zone'
      'where skl_id = :skl_id'
      'order by zone_name')
    Left = 212
    Top = 279
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'skl_id'
        ParamType = ptUnknown
      end>
    object MainDicZone1ZONE_ID: TIntegerField
      FieldName = 'ZONE_ID'
      Origin = 'ZONE.ZONE_ID'
      Required = True
    end
    object MainDicZone1SKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Origin = 'ZONE.SKL_ID'
      Required = True
    end
    object MainDicZone1ZONE_NAME: TIBStringField
      FieldName = 'ZONE_NAME'
      Origin = 'ZONE.ZONE_NAME'
      Required = True
      Size = 32
    end
    object MainDicZone1ZONE_DESCR: TIBStringField
      FieldName = 'ZONE_DESCR'
      Origin = 'ZONE.ZONE_DESCR'
      Required = True
      Size = 254
    end
    object MainDicZone1TM: TDateTimeField
      FieldName = 'TM'
      Origin = 'ZONE.TM'
    end
  end
  object IBQuery3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.ReportTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 468
    Top = 302
  end
  object ds_tw_zone_distrib: TDataSource
    DataSet = q_tw_zone_distrib
    Left = 548
    Top = 359
  end
  object q_tw_zone_distrib: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TW_ZONE_DISTRIB(:tw_id)')
    Left = 548
    Top = 423
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'tw_id'
        ParamType = ptUnknown
      end>
    object q_tw_zone_distribZONE_ID: TIntegerField
      FieldName = 'ZONE_ID'
      Origin = 'TW_ZONE_DISTRIB.ZONE_ID'
    end
    object q_tw_zone_distribZONE_NAME: TIBStringField
      FieldName = 'ZONE_NAME'
      Origin = 'TW_ZONE_DISTRIB.ZONE_NAME'
      Size = 254
    end
    object q_tw_zone_distribTW_OST: TFloatField
      FieldName = 'TW_OST'
      Origin = 'TW_ZONE_DISTRIB.TW_OST'
      DisplayFormat = '0.000'
    end
  end
end
