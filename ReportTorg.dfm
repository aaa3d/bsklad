object Report_torg: TReport_torg
  Left = 27
  Top = 138
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Отчёт о продажах'
  ClientHeight = 265
  ClientWidth = 704
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
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 189
    Height = 265
    Align = alLeft
    BevelOuter = bvLowered
    Caption = 'Panel2'
    Color = 14548223
    TabOrder = 0
    object Image2: TImage
      Left = 0
      Top = 2
      Width = 16
      Height = 16
      AutoSize = True
      Picture.Data = {
        07544269746D6170F6000000424DF60000000000000076000000280000001000
        000010000000010004000000000080000000120B0000120B0000100000001000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFF
        FF00DADADADADADA0ADAADADADADADA00DADDADA7777770B07DAADA0000000FF
        007DDA0FFFBFBFBFFF07AD0FBFFF44FFBF07DA0FFFBFFFBFFF07AD0FBFFF47FF
        BF07DA0FFFBF748FFF07AD0FBFFFB747BF07DA0FFF47FF44FF07AD0FBF44B844
        BF07DA0FFF844448FF07AD0FBFFFBFFFBF07DA0FFFBFFFBFFF0AADA000000000
        00AD}
      Transparent = True
    end
    object RichEdit1: TRichEdit
      Left = 16
      Top = 1
      Width = 172
      Height = 263
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        'Данный отчёт предназначен '
        'для '
        'определения выручки, '
        'принесённой магазинами или '
        'товарами за определённый '
        'период времени.'
        'Этот отчёт не показывает '
        'принесённой прибыли, а лишь '
        'отображает сумму продаж тех '
        'или иных товаров.'
        'Использование фильтров '
        'позволяет получить '
        'выборочную '
        'информацию.'
        'Если вы часто пользуютесь '
        'одими и теми же фильтрами, '
        'рекомендуется их сохранять, '
        'для '
        'последующего '
        'использования.'
        'Установка флажка '
        '"Группировать продажи по '
        'артикулам ...." приведёт к '
        'отображению общего '
        'количество '
        'продаж каждого артикула '
        'товара '
        'и общей суммы этих продаж,'
        'снятый же флажок приведёт к '
        'подробному отображению '
        'каждого факта продажи '
        'каждого '
        'наименования.')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 189
    Top = 0
    Width = 515
    Height = 265
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 212
      Width = 67
      Height = 13
      Caption = 'За период с :'
    end
    object Label4: TLabel
      Left = 208
      Top = 212
      Width = 18
      Height = 13
      Caption = 'по :'
    end
    object Label1: TLabel
      Left = 29
      Top = 8
      Width = 45
      Height = 13
      Caption = 'Товары :'
    end
    object Label6: TLabel
      Left = 12
      Top = 92
      Width = 62
      Height = 26
      Caption = 'Расходные'#13#10'накладные :'
    end
    object Label2: TLabel
      Left = 8
      Top = 180
      Width = 64
      Height = 13
      Caption = 'Магазином :'
    end
    object Panel3: TPanel
      Left = 79
      Top = 4
      Width = 425
      Height = 81
      BevelOuter = bvLowered
      TabOrder = 0
      object TW1: TRadioButton
        Left = 8
        Top = 4
        Width = 113
        Height = 17
        Caption = 'Все'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = TW1Click
      end
      object TW2: TRadioButton
        Left = 8
        Top = 28
        Width = 381
        Height = 17
        Caption = 'Группа или один :'
        TabOrder = 1
        OnClick = TW1Click
      end
      object Edit1: TEdit
        Left = 120
        Top = 24
        Width = 273
        Height = 21
        Enabled = False
        TabOrder = 2
        Text = 'Все'
      end
      object BtnDicTowar: TButton
        Left = 392
        Top = 24
        Width = 25
        Height = 21
        Hint = 'Выбрать из справочника товаров...'
        Caption = '...'
        Enabled = False
        TabOrder = 3
        OnClick = BtnDicTowarClick
      end
      object TW3: TRadioButton
        Left = 8
        Top = 52
        Width = 113
        Height = 17
        Caption = 'Фильтр '
        TabOrder = 4
        OnClick = TW1Click
      end
      object Edit2: TEdit
        Left = 120
        Top = 52
        Width = 273
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object BtnTwFilter: TButton
        Left = 392
        Top = 52
        Width = 25
        Height = 21
        Hint = 'Отобрать товары по фильтру :'
        Caption = '...'
        Enabled = False
        TabOrder = 6
        OnClick = BtnTwFilterClick
      end
    end
    object Panel5: TPanel
      Left = 79
      Top = 88
      Width = 425
      Height = 81
      BevelOuter = bvLowered
      TabOrder = 1
      object RN1: TRadioButton
        Left = 8
        Top = 4
        Width = 113
        Height = 17
        Caption = 'Все'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RN3Click
      end
      object RN2: TRadioButton
        Left = 8
        Top = 28
        Width = 113
        Height = 17
        Caption = 'Один вид :'
        TabOrder = 1
        OnClick = RN3Click
      end
      object RN3: TRadioButton
        Left = 8
        Top = 52
        Width = 113
        Height = 17
        Caption = 'Фильтр '
        TabOrder = 2
        OnClick = RN3Click
      end
      object Edit4: TEdit
        Left = 88
        Top = 52
        Width = 305
        Height = 21
        Enabled = False
        TabOrder = 3
        Text = 'Все'
      end
      object BtnRnFilter: TButton
        Left = 392
        Top = 52
        Width = 25
        Height = 21
        Hint = 'Отобрать накладные по фильтру :'
        Caption = '...'
        Enabled = False
        TabOrder = 4
        OnClick = BtnRnFilterClick
      end
      object RNTYP: TRxDBLookupCombo
        Left = 88
        Top = 24
        Width = 329
        Height = 21
        DropDownCount = 8
        Enabled = False
        LookupField = 'RNTYP_ID'
        LookupDisplay = 'RNTYP_FULL'
        LookupSource = DsRnTyp
        TabOrder = 5
      end
    end
    object DT1: TDateEdit
      Left = 80
      Top = 208
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
    object DT2: TDateEdit
      Left = 231
      Top = 208
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 3
    end
    object BtnRun: TButton
      Left = 428
      Top = 208
      Width = 75
      Height = 25
      Caption = 'Построить'
      TabOrder = 4
      OnClick = BtnRunClick
    end
    object BtnClose: TButton
      Left = 428
      Top = 236
      Width = 75
      Height = 25
      Caption = 'Закрыть'
      TabOrder = 5
      OnClick = BtnCloseClick
    end
    object CheckBox1: TCheckBox
      Left = 80
      Top = 232
      Width = 321
      Height = 17
      Caption = 'Группировать продажи по артикулам и группам товаров'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object Panel4: TPanel
      Left = 80
      Top = 172
      Width = 425
      Height = 29
      BevelOuter = bvLowered
      TabOrder = 7
      object SHOP1: TRadioButton
        Left = 8
        Top = 8
        Width = 61
        Height = 17
        Caption = 'Все'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = SHOP1Click
      end
      object SHOP2: TRadioButton
        Left = 76
        Top = 8
        Width = 61
        Height = 17
        Caption = 'Один :'
        TabOrder = 1
        OnClick = SHOP1Click
      end
      object SHOP: TRxDBLookupCombo
        Left = 132
        Top = 4
        Width = 285
        Height = 21
        DropDownCount = 8
        Enabled = False
        LookupField = 'SHOP_ID'
        LookupDisplay = 'SHOP_NAME'
        LookupSource = DsShop
        TabOrder = 2
      end
    end
  end
  object QrRnTyp: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TorgTransaction
    CachedUpdates = False
    SQL.Strings = (
      'select rntyp_id,rntyp_full from rntyp order by rntyp_id')
    Left = 128
    Top = 20
    object QrRnTypRNTYP_ID: TIntegerField
      FieldName = 'RNTYP_ID'
      Required = True
    end
    object QrRnTypRNTYP_FULL: TIBStringField
      FieldName = 'RNTYP_FULL'
      Required = True
      Size = 254
    end
  end
  object DsRnTyp: TDataSource
    DataSet = QrRnTyp
    Left = 128
    Top = 72
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 40
    Top = 16
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    CachedUpdates = False
    Left = 36
    Top = 72
  end
  object QrSHOP: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TorgTransaction
    CachedUpdates = False
    SQL.Strings = (
      'select * from SHOP order by SHOP_OFFICE, SHOP_NAME')
    Left = 128
    Top = 132
  end
  object TorgTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 36
    Top = 140
  end
  object DsShop: TDataSource
    DataSet = QrSHOP
    Left = 128
    Top = 184
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Расширенный отчет о продажах'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    Units = utMillimeters
    UserName = 'Report'
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    Left = 580
    Top = 8
    Version = '5.0'
    mmColumnWidth = 0
    object ppTitleBand1: TppTitleBand
      BeforeGenerate = ppTitleBand1BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Расширенный отчёт о продажах  :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 4498
        mmWidth = 38365
        BandType = 1
      end
      object TORG1_TITLE2: TppMemo
        UserName = 'TORG1_TITLE2'
        Caption = 'TORG1_TITLE2'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 39158
        mmTop = 4498
        mmWidth = 91811
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 132027
        mmTop = 4498
        mmWidth = 22490
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Страница'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 155840
        mmTop = 4498
        mmWidth = 10848
        BandType = 1
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 4498
        mmWidth = 1323
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'из'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 171186
        mmTop = 4498
        mmWidth = 2381
        BandType = 1
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageCount
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 174890
        mmTop = 4498
        mmWidth = 1323
        BandType = 1
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 7673
        mmLeft = 178859
        mmTop = 0
        mmWidth = 22754
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Расширенный отчёт о продажах  :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 54504
        BandType = 0
      end
      object TORG1_TITLE1: TppMemo
        UserName = 'TORG1_TITLE1'
        Caption = 'TORG1_TITLE1'
        CharWrap = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 0
        mmWidth = 145521
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 4498
        mmWidth = 202671
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = '№ п/п'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 4763
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Наладная'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 8996
        mmTop = 4763
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Код товара'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41010
        mmTop = 4763
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Наименование товара'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 55563
        mmTop = 4763
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Ед.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 108215
        mmTop = 4763
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Цена, руб.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 119592
        mmTop = 4763
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Цена, $'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 141288
        mmTop = 4763
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label11'
        Caption = 'Количество'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 151077
        mmTop = 4763
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label102'
        Caption = 'Сумма, руб.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 168011
        mmTop = 4763
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Сумма, $'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 190500
        mmTop = 4763
        mmWidth = 10848
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'RN_NUM_FULL'
        DataPipeline = ppDBPipeline1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 7408
        mmTop = 0
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'TW_ART'
        DataPipeline = ppDBPipeline1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 40217
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'TW_NAME'
        DataPipeline = ppDBPipeline1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 54769
        mmTop = 0
        mmWidth = 50800
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        Alignment = taRightJustify
        DataField = 'TW_SUMMD'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#0.00 USD'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 183092
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        Alignment = taRightJustify
        DataField = 'TW_SUMM'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#0.00р'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 164571
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        Alignment = taRightJustify
        DataField = 'TW_KOL'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#0.0000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 151077
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        Alignment = taRightJustify
        DataField = 'TW_MONEYD'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#0.00 USD'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 132027
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        Alignment = taRightJustify
        DataField = 'TW_MONEY'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#0.00р'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 113506
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        Alignment = taCenter
        DataField = 'ED_SHORT'
        DataPipeline = ppDBPipeline1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 106098
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDBPipeline1
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'Label13'
        Caption = 
          'Подготовлено и отпечатано в системе "АРМ-Склад" ver 3.30, ® Begi' +
          'nner. Бритвин Сергей. 1997-2000, E-mail: Beginner@inbox.ru'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 4
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 1588
        mmLeft = 119063
        mmTop = 0
        mmWidth = 82550
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        UserName = 'Label12'
        Caption = 'Итого :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 529
        mmTop = 1588
        mmWidth = 8731
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        Alignment = taRightJustify
        DataField = 'TW_SUMM'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#0.00р'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 1323
        mmWidth = 17727
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        Alignment = taRightJustify
        DataField = 'TW_SUMMD'
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#0.00 USD'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 182827
        mmTop = 1323
        mmWidth = 17992
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 265
        mmTop = 0
        mmWidth = 201613
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label15'
        Caption = 'Отчет построил и напечатал :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 529
        mmTop = 5292
        mmWidth = 35719
        BandType = 7
      end
      object USER_FIO: TppLabel
        UserName = 'Label16'
        Caption = 'Label16'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 37571
        mmTop = 5292
        mmWidth = 9260
        BandType = 7
      end
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataModule1.DsTorg1
    UserName = 'DBPipeline1'
    Left = 508
    Top = 8
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'TW_ID'
      FieldName = 'TW_ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TW_ART'
      FieldName = 'TW_ART'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'TW_NAME'
      FieldName = 'TW_NAME'
      FieldLength = 254
      DisplayWidth = 254
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'ED_SHORT'
      FieldName = 'ED_SHORT'
      FieldLength = 32
      DisplayWidth = 32
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'RN_NUM_FULL'
      FieldName = 'RN_NUM_FULL'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'SKL_FULL'
      FieldName = 'SKL_FULL'
      FieldLength = 254
      DisplayWidth = 254
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TW_KOL'
      FieldName = 'TW_KOL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TW_MONEY'
      FieldName = 'TW_MONEY'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TW_MONEYD'
      FieldName = 'TW_MONEYD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TW_SUMM'
      FieldName = 'TW_SUMM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'TW_SUMMD'
      FieldName = 'TW_SUMMD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'US_FULL'
      FieldName = 'US_FULL'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
  end
end
