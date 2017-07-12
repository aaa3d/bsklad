inherited Jou_STFAKT: TJou_STFAKT
  Left = 176
  Top = 227
  Caption = 'Журнал счетов-фактур'
  ClientWidth = 955
  OldCreateOrder = True
  OnKeyPress = FormKeyPress
  PixelsPerInch = 120
  TextHeight = 16
  inherited ToolBar1: TToolBar
    Width = 955
    inherited Image1: TImage
      Visible = True
    end
    inherited BtnProw: TToolButton
      Visible = False
    end
    inherited BtnUnProw: TToolButton
      Visible = False
    end
    inherited ToolButton5: TToolButton
      Visible = False
    end
    inherited BtnNew: TToolButton
      Visible = False
    end
    inherited BtnOpen: TToolButton
      OnClick = BtnOpenClick
    end
    inherited btnOpenSale: TToolButton
      Visible = False
    end
    inherited BtnCopy: TToolButton
      Visible = False
    end
    inherited BtnDel: TToolButton
      OnClick = BtnDelClick
    end
    inherited BtnPrint: TToolButton
      OnClick = BtnPrintClick
    end
    inherited BtnPropertis: TToolButton
      Visible = False
    end
    inherited BtnFind: TToolButton
      OnClick = BtnFindClick
    end
    inherited BtnAnaliz: TToolButton
      Hint = 'Анализ документа...(F3)'
      Enabled = False
      Visible = False
    end
    inherited BtnSubDoc: TToolButton
      Enabled = False
      Visible = False
    end
    inherited ToolButton16: TToolButton
      Visible = False
    end
    inherited BtnInterval: TToolButton
      OnClick = BtnIntervalClick
    end
    inherited BtnAdm: TToolButton
      OnClick = BtnAdmClick
    end
    object BtnError: TToolButton
      Left = 452
      Top = 2
      Hint = 'Анализ ошибок'
      Caption = 'BtnError'
      ImageIndex = 49
      OnClick = BtnErrorClick
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 955
    Panels = <
      item
        Width = 200
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  inherited Panel1: TPanel
    Width = 955
    inherited StatusBar2: TStatusBar
      Width = 955
    end
    inherited RxDBGrid1: TRxDBGrid
      Top = 48
      Width = 955
      Height = 332
      DataSource = DsSTFAKTList
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      OnDrawDataCell = RxDBGrid1DrawDataCell
      OnDrawColumnCell = RxDBGrid1DrawColumnCell
      OnDblClick = RxDBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'STFAKT_ERR'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = ' '
          Width = 16
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KLN_PREFIX'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Фирма'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STFAKT_NUM_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Номер'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KLN_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Клиент'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GP_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Грузополучатель'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STFAKT_DATE'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STFAKT_SUMM'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Сумма'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'US_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Кто оформил'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STFAKT_DOW'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Доверенность'
          Visible = True
        end>
    end
    object ToolBar2: TToolBar
      Left = 0
      Top = 19
      Width = 955
      Height = 29
      ButtonHeight = 23
      Caption = 'ToolBar2'
      TabOrder = 2
      object Label1: TLabel
        Left = 0
        Top = 2
        Width = 57
        Height = 23
        AutoSize = False
        Caption = 'Магазин :'
        Layout = tlCenter
      end
      object SHOP: TRxDBLookupCombo
        Left = 57
        Top = 2
        Width = 164
        Height = 23
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'SHOP_ID'
        LookupDisplay = 'SHOP_NAME'
        LookupSource = DsShop
        TabOrder = 0
        OnChange = SHOPChange
      end
      object Label2: TLabel
        Left = 221
        Top = 2
        Width = 93
        Height = 23
        AutoSize = False
        Caption = '               Фирма : '
      end
      object FRM: TRxDBLookupCombo
        Left = 314
        Top = 2
        Width = 159
        Height = 23
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'FRM_ID'
        LookupDisplay = 'FRM_NAME'
        LookupSource = DsFrm
        TabOrder = 1
        OnChange = FRMChange
      end
    end
  end
  object QrSTFAKTList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = STFAKTListTranSaction
    AfterOpen = QrSTFAKTListAfterOpen
    AfterScroll = QrSTFAKTListAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_stfakt(:DT1,:DT2,:SHOP_ID, :FRM_ID)')
    Left = 96
    Top = 149
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SHOP_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end>
    object QrSTFAKTListKLN_PREFIX: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_PREFIX'
      ReadOnly = True
      Size = 32
    end
    object QrSTFAKTListSTFAKT_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_ID'
      ReadOnly = True
    end
    object QrSTFAKTListSTFAKT_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_DATE'
      ReadOnly = True
    end
    object QrSTFAKTListSTFAKT_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_NUM_FULL'
      ReadOnly = True
      Size = 74
    end
    object QrSTFAKTListSTFAKT_ERR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_ERR'
      ReadOnly = True
      Size = 1
    end
    object QrSTFAKTListSTFAKT_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_SUMM'
      ReadOnly = True
      DisplayFormat = '#0.00 руб'
    end
    object QrSTFAKTListSTFAKT_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'STFAKT_COLOR'
      ReadOnly = True
    end
    object QrSTFAKTListUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 128
    end
    object QrSTFAKTListKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrSTFAKTListSTFAKT_NUM: TIntegerField
      FieldName = 'STFAKT_NUM'
      Origin = 'LIST_STFAKT.STFAKT_NUM'
    end
    object QrSTFAKTListSTFAKT_DOW: TIBStringField
      FieldName = 'STFAKT_DOW'
      Origin = 'LIST_STFAKT.STFAKT_DOW'
      Size = 254
    end
    object QrSTFAKTListSTFAKT_NP: TFloatField
      FieldName = 'STFAKT_NP'
      Origin = 'LIST_STFAKT.STFAKT_NP'
    end
    object QrSTFAKTListSTFAKT_NDS: TFloatField
      FieldName = 'STFAKT_NDS'
      Origin = 'LIST_STFAKT.STFAKT_NDS'
    end
    object QrSTFAKTListGP_FULL: TIBStringField
      FieldName = 'GP_FULL'
      Origin = 'LIST_STFAKT.GP_FULL'
      Size = 254
    end
  end
  object DsSTFAKTList: TDataSource
    DataSet = QrSTFAKTList
    Left = 96
    Top = 201
  end
  object STFAKTListTranSaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 96
    Top = 97
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = STFAKTListTranSaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 192
    Top = 97
  end
  object PopupMenu1: TPopupMenu
    Left = 348
    Top = 121
    object MnNEW: TMenuItem
      Caption = 'Новый счёт-фактура'
      ShortCut = 45
    end
    object MnDEL: TMenuItem
      Caption = 'Удалить счёт-фактуру'
      ShortCut = 46
      OnClick = BtnDelClick
    end
    object N8: TMenuItem
      Caption = '-'
      ShortCut = 189
    end
    object MnPRINT: TMenuItem
      Caption = 'Напечатать счёт-фактуру (ENTER)'
      ShortCut = 120
      OnClick = BtnPrintClick
    end
    object MnFind: TMenuItem
      Caption = 'Найти счёт-фактуру по номеру (1...9)'
      OnClick = BtnFindClick
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object MnInterval: TMenuItem
      Caption = 'Интервал дат в журнале (I)'
      OnClick = BtnIntervalClick
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object MnAdm: TMenuItem
      Caption = 'Администрирование счёта-фактуры'
      ShortCut = 16449
      OnClick = BtnAdmClick
    end
    object MnERR: TMenuItem
      Caption = 'Анализ ошибок в счёте-фактуре'
      OnClick = BtnErrorClick
    end
  end
  object MemShop: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'SHOP_ID'
        DataType = ftInteger
      end
      item
        Name = 'SHOP_NAME'
        DataType = ftString
        Size = 64
      end>
    Left = 458
    Top = 122
    object MemShopSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object MemShopSHOP_NAME: TStringField
      FieldName = 'SHOP_NAME'
      Size = 64
    end
  end
  object DsShop: TDataSource
    DataSet = MemShop
    Left = 458
    Top = 177
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 556
    Top = 129
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 556
    Top = 179
  end
  object PipStFaktList: TppDBPipeline
    DataSource = DsSTFAKTList
    UserName = 'PipStFaktList'
    Left = 196
    Top = 175
    object PipStFaktListppField1: TppField
      FieldAlias = 'KLN_PREFIX'
      FieldName = 'KLN_PREFIX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField2: TppField
      FieldAlias = 'STFAKT_ID'
      FieldName = 'STFAKT_ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField3: TppField
      FieldAlias = 'STFAKT_DATE'
      FieldName = 'STFAKT_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField4: TppField
      FieldAlias = 'STFAKT_NUM_FULL'
      FieldName = 'STFAKT_NUM_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField5: TppField
      FieldAlias = 'STFAKT_ERR'
      FieldName = 'STFAKT_ERR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField6: TppField
      FieldAlias = 'STFAKT_SUMM'
      FieldName = 'STFAKT_SUMM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField7: TppField
      FieldAlias = 'STFAKT_COLOR'
      FieldName = 'STFAKT_COLOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField8: TppField
      FieldAlias = 'US_FULL'
      FieldName = 'US_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField9: TppField
      FieldAlias = 'KLN_FULL'
      FieldName = 'KLN_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField10: TppField
      FieldAlias = 'STFAKT_NDS'
      FieldName = 'STFAKT_NDS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField11: TppField
      FieldAlias = 'STFAKT_NALOG5'
      FieldName = 'STFAKT_NALOG5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField12: TppField
      FieldAlias = 'STFAKT_NUM'
      FieldName = 'STFAKT_NUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PipStFaktListppField13: TppField
      FieldAlias = 'STFAKT_DOW'
      FieldName = 'STFAKT_DOW'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object PpStFaktLIST: TppReport
    AutoStop = False
    DataPipeline = PipStFaktList
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Журнал расходных накладных'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    UserName = 'Report'
    CachePages = True
    DeviceType = 'Screen'
    OnPreviewFormCreate = PpStFaktLISTPreviewFormCreate
    Left = 196
    Top = 230
    Version = '5.0'
    mmColumnWidth = 0
    object ppTitleBand12: TppTitleBand
      BeforeGenerate = ppTitleBand12BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppRegion66: TppRegion
        UserName = 'Region1'
        Brush.Color = clGray
        Caption = 'Region1'
        ParentWidth = False
        Stretch = True
        mmHeight = 8467
        mmLeft = 0
        mmTop = 0
        mmWidth = 179917
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppSystemVariable1: TppSystemVariable
          UserName = 'SystemVariable4'
          VarType = vtPrintDateTime
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 152929
          mmTop = 529
          mmWidth = 26194
          BandType = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label32'
          Caption = 'Дата/время :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 133615
          mmTop = 529
          mmWidth = 17992
          BandType = 1
        end
        object ppSystemVariable3: TppSystemVariable
          UserName = 'SystemVariable6'
          VarType = vtPageCount
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 161925
          mmTop = 3969
          mmWidth = 1588
          BandType = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label34'
          Caption = 'из'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 157427
          mmTop = 3969
          mmWidth = 3175
          BandType = 1
        end
        object ppSystemVariable2: TppSystemVariable
          UserName = 'SystemVariable5'
          VarType = vtPageNo
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 153194
          mmTop = 3969
          mmWidth = 1588
          BandType = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label33'
          Caption = 'Страница :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 137319
          mmTop = 3969
          mmWidth = 14552
          BandType = 1
        end
        object StFaktListTitle1: TppMemo
          UserName = 'StFaktListTitle1'
          Caption = 'StFaktListTitle1'
          CharWrap = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial Cyr'
          Font.Size = 12
          Font.Style = [fsBold]
          Stretch = True
          Transparent = True
          mmHeight = 5556
          mmLeft = 1058
          mmTop = 794
          mmWidth = 131763
          BandType = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object ppRegion79: TppRegion
        UserName = 'Region10'
        Caption = 'Region10'
        ParentWidth = False
        ShiftRelativeTo = ppRegion66
        Stretch = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8996
        mmWidth = 203200
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel439: TppLabel
          UserName = 'Label13'
          ShiftWithParent = True
          Caption = 'Фирма'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 4763
          mmTop = 9790
          mmWidth = 8996
          BandType = 1
        end
        object ppLabel440: TppLabel
          UserName = 'Label14'
          ShiftWithParent = True
          Caption = 'Номер'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 19050
          mmTop = 9790
          mmWidth = 8731
          BandType = 1
        end
        object ppLabel443: TppLabel
          UserName = 'Label16'
          ShiftWithParent = True
          Caption = 'Клиент'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 42333
          mmTop = 9790
          mmWidth = 9790
          BandType = 1
        end
        object ppLabel483: TppLabel
          UserName = 'Label483'
          ShiftWithParent = True
          Caption = 'Дата'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 84667
          mmTop = 9790
          mmWidth = 6879
          BandType = 1
        end
        object ppLabel442: TppLabel
          UserName = 'Label15'
          ShiftWithParent = True
          Caption = 'Сумма'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 120650
          mmTop = 9790
          mmWidth = 9260
          BandType = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label28'
          ShiftWithParent = True
          Caption = 'Доверенность'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 132821
          mmTop = 9790
          mmWidth = 19844
          BandType = 1
        end
        object ppLabel441: TppLabel
          UserName = 'Label7'
          ShiftWithParent = True
          Caption = 'Кто оформил'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 178065
          mmTop = 9790
          mmWidth = 17992
          BandType = 1
        end
      end
      object ppImage23: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 7673
        mmLeft = 180446
        mmTop = 0
        mmWidth = 22754
        BandType = 1
      end
    end
    object ppHeaderBand15: TppHeaderBand
      PrintOnFirstPage = False
      mmBottomOffset = 0
      mmHeight = 15346
      mmPrintPosition = 0
      object ppShape21: TppShape
        UserName = 'Shape3'
        Brush.Color = 15263976
        ReprintOnOverFlow = True
        ShiftWithParent = True
        mmHeight = 7144
        mmLeft = 0
        mmTop = 8202
        mmWidth = 202936
        BandType = 0
      end
      object ppLabel446: TppLabel
        UserName = 'Label21'
        ShiftWithParent = True
        Caption = 'Фирма'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 10054
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel447: TppLabel
        UserName = 'Label22'
        ShiftWithParent = True
        Caption = 'Номер'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 10054
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel448: TppLabel
        UserName = 'Label23'
        ShiftWithParent = True
        Caption = 'Кто оформил'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 178330
        mmTop = 9790
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel449: TppLabel
        UserName = 'Label24'
        ShiftWithParent = True
        Caption = 'Сумма'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 10319
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel450: TppLabel
        UserName = 'Label25'
        ShiftWithParent = True
        Caption = 'Клиент'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 42333
        mmTop = 9790
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel465: TppLabel
        UserName = 'Label465'
        ShiftWithParent = True
        Caption = 'Дата'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 84931
        mmTop = 9790
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label29'
        ShiftWithParent = True
        Caption = 'Доверенность'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 132557
        mmTop = 10319
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel453: TppLabel
        UserName = 'Label1'
        Caption = 'Дата/время :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 17992
        BandType = 0
      end
      object ppSystemVariable34: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 794
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel454: TppLabel
        UserName = 'Label4'
        Caption = 'Страница :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 4498
        mmWidth = 14552
        BandType = 0
      end
      object ppSystemVariable35: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 4233
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel455: TppLabel
        UserName = 'Label5'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23283
        mmTop = 4233
        mmWidth = 3175
        BandType = 0
      end
      object ppSystemVariable36: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 27781
        mmTop = 4498
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel456: TppLabel
        UserName = 'Label2'
        Caption = 'Пользователь :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 58473
        mmTop = 4233
        mmWidth = 20902
        BandType = 0
      end
      object PpStUser: TppLabel
        UserName = 'PpStUser'
        Caption = 'PpSTFAKTUser'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 80963
        mmTop = 4233
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel460: TppLabel
        UserName = 'Label18'
        Caption = 'Система "Арм-Склад" версия'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 169334
        mmTop = 0
        mmWidth = 18785
        BandType = 0
      end
      object ST_VERS: TppLabel
        UserName = 'ST_VERS'
        Caption = '3.1.01'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 191030
        mmTop = 0
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel462: TppLabel
        UserName = 'Label20'
        Caption = 'Бритвин Сергей beginner@inbox.ru'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 169598
        mmTop = 1588
        mmWidth = 22490
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      BeforeGenerate = ppDetailBand15BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText145: TppDBText
        UserName = 'DBText3'
        DataField = 'STFAKT_DATE'
        DataPipeline = PipStFaktList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 84931
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText148: TppDBText
        UserName = 'DBText6'
        Alignment = taRightJustify
        DataField = 'STFAKT_SUMM'
        DataPipeline = PipStFaktList
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 112184
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBMemo91: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'STFAKT_NUM_FULL'
        DataPipeline = PipStFaktList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 0
        mmWidth = 22754
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo92: TppDBMemo
        UserName = 'DBMemo92'
        CharWrap = False
        DataField = 'KLN_FULL'
        DataPipeline = PipStFaktList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 42333
        mmTop = 0
        mmWidth = 42333
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo93: TppDBMemo
        UserName = 'DBMemo93'
        CharWrap = False
        DataField = 'STFAKT_DOW'
        DataPipeline = PipStFaktList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 0
        mmWidth = 45773
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'US_FULL'
        DataPipeline = PipStFaktList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 265
        mmWidth = 24342
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppImage1: TppImage
        UserName = 'Image3'
        MaintainAspectRatio = False
        Stretch = True
        AutoSize = True
        Picture.Data = {
          07544269746D6170EE000000424DEE0000000000000076000000280000000F00
          00000F0000000100040000000000780000000000000000000000100000000000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00FFFF7000007FFFF0FFF019999910FFF0FF09999999990FF0F09999999999
          90F071999999999991700999FF999FF9990009999FF9FF999900099999FFF999
          9900099999FFF999990009999FF9FF9999007199FF999FF99170F09999999999
          90F0FF09999999990FF0FFF019999910FFF0FFFF7000007FFFF0}
        mmHeight = 3302
        mmLeft = 0
        mmTop = 265
        mmWidth = 3302
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 4
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = 'KLN_PREFIX'
        DataPipeline = PipStFaktList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 0
        mmWidth = 13494
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand12: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine60: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 7
      end
      object ppLabel463: TppLabel
        UserName = 'Label8'
        Caption = 'Итого'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1588
        mmWidth = 8202
        BandType = 7
      end
      object ppDBCalc38: TppDBCalc
        UserName = 'DBCalc2'
        Alignment = taCenter
        DataPipeline = PipStFaktList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 9260
        mmTop = 1588
        mmWidth = 5027
        BandType = 7
      end
      object ppLabel464: TppLabel
        UserName = 'Label9'
        Caption = 'Счетов-фактур на сумму'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 15875
        mmTop = 1588
        mmWidth = 35983
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        Alignment = taRightJustify
        DataField = 'STFAKT_SUMM'
        DataPipeline = PipStFaktList
        DisplayFormat = '#0.00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 1588
        mmWidth = 20902
        BandType = 7
      end
    end
  end
  object MemFrm: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'FRM_ID'
        DataType = ftInteger
      end
      item
        Name = 'FRM_NAME'
        DataType = ftString
        Size = 128
      end>
    Left = 382
    Top = 189
    object MemFrmFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
    end
    object MemFrmFRM_NAME: TStringField
      FieldName = 'FRM_NAME'
      Size = 128
    end
  end
  object DsFrm: TDataSource
    DataSet = MemFrm
    Left = 384
    Top = 241
  end
end
