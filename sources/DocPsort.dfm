object DOC_PSORT: TDOC_PSORT
  Left = 227
  Top = 231
  Width = 857
  Height = 503
  Caption = 'Акт пересортицы'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 769
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 849
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = ActLock
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 33
      Top = 2
      Action = ActProw
    end
    object ToolButton4: TToolButton
      Left = 58
      Top = 2
      Action = ActUnProw
    end
    object ToolButton5: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 91
      Top = 2
      Action = ActSave
    end
    object ToolButton7: TToolButton
      Left = 116
      Top = 2
      Action = ActApply
    end
    object ToolButton8: TToolButton
      Left = 141
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 149
      Top = 2
      Action = ActPrint
    end
    object ToolButton10: TToolButton
      Left = 174
      Top = 2
      Action = ActHistory
    end
    object ToolButton11: TToolButton
      Left = 199
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 207
      Top = 2
      Action = ActDicTw
    end
    object ToolButton13: TToolButton
      Left = 232
      Top = 2
      Action = ActDel
    end
    object ToolButton14: TToolButton
      Left = 257
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton15: TToolButton
      Left = 265
      Top = 2
      Action = ActDetal
    end
    object ToolButton16: TToolButton
      Left = 290
      Top = 2
      Action = ActAnaliz
    end
    object ToolButton17: TToolButton
      Left = 315
      Top = 2
      Action = ActMarket
    end
    object ToolButton20: TToolButton
      Left = 340
      Top = 2
      Width = 8
      Caption = 'ToolButton20'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object ToolButton19: TToolButton
      Left = 348
      Top = 2
      Action = ActPrintCenn
    end
    object ToolButton18: TToolButton
      Left = 373
      Top = 2
      Action = ActPrintCennAll
    end
    object ToolButton22: TToolButton
      Left = 398
      Top = 2
      Width = 8
      Caption = 'ToolButton22'
      ImageIndex = 16
      Style = tbsSeparator
    end
    object ToolButton21: TToolButton
      Left = 406
      Top = 2
      Action = ActRefresh
    end
    object ToolButton23: TToolButton
      Left = 431
      Top = 2
      Width = 8
      Caption = 'ToolButton23'
      ImageIndex = 45
      Style = tbsSeparator
    end
    object BtnSetOst: TToolButton
      Left = 439
      Top = 2
      Hint = 'Выставить кол-во равным остатку'
      Caption = 'BtnSetOst'
      ImageIndex = 130
      OnClick = BtnSetOstClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 457
    Width = 849
    Height = 19
    Panels = <
      item
        Text = 'Состояние :'
        Width = 200
      end
      item
        Text = 'Списываемый :'
        Width = 120
      end
      item
        Text = 'Приходуемый :'
        Width = 120
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 849
    Height = 90
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    object Label10: TLabel
      Left = 389
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Номер :'
    end
    object Label11: TLabel
      Left = 588
      Top = 9
      Width = 32
      Height = 13
      Caption = 'Дата :'
    end
    object Label2: TLabel
      Left = 14
      Top = 56
      Width = 62
      Height = 13
      Caption = 'Основание :'
    end
    object Label3: TLabel
      Left = 372
      Top = 30
      Width = 59
      Height = 13
      Caption = 'Менеджер :'
    end
    object Label8: TLabel
      Left = 32
      Top = 10
      Width = 49
      Height = 13
      AutoSize = False
      Caption = 'Фирма : '
    end
    object Label1: TLabel
      Left = 38
      Top = 31
      Width = 37
      Height = 13
      Caption = 'Склад :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object PSORT_NUM: TEdit
      Left = 434
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
      Text = 'PSORT_NUM'
    end
    object PSORT_DATE: TDateEdit
      Left = 625
      Top = 5
      Width = 118
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
      OnChange = PSORT_DATEChange
    end
    object PSORT_OSN: TMemo
      Left = 80
      Top = 50
      Width = 657
      Height = 37
      Lines.Strings = (
        'PSORT_OSN')
      MaxLength = 250
      TabOrder = 2
      OnChange = PSORT_OSNChange
    end
    object PSORT_MEN: TRxDBLookupCombo
      Left = 435
      Top = 27
      Width = 305
      Height = 21
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'KLN_ID'
      LookupDisplay = 'KLN_FIO'
      LookupSource = DataModule1.MainDsMen
      TabOrder = 3
    end
    object FRM: TRxDBLookupCombo
      Left = 80
      Top = 6
      Width = 273
      Height = 20
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'KLN_ID'
      LookupDisplay = 'KLN_FULL'
      LookupSource = DataModule1.MainDsAllFrm
      TabOrder = 4
      OnChange = FRMChange
    end
    object SKL: TRxDBLookupCombo
      Left = 80
      Top = 27
      Width = 217
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
      TabOrder = 5
      OnChange = SKLChange
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 119
    Width = 849
    Height = 338
    Align = alClient
    DataSource = DsPsorts
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'tw_art1'
        ReadOnly = True
        Title.Caption = 'Код'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tw_nam1'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Наименование списываемого товара'
        Width = 199
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ed_short1'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Ед. изм.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tw_kol'
        Title.Caption = 'Кол-во'
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tw_art2'
        ReadOnly = True
        Title.Caption = 'Код'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tw_nam2'
        ReadOnly = True
        Title.Caption = 'Наименование приходуемого товара'
        Width = 196
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tw_kol2'
        Title.Caption = 'Кол-во'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ed_short2'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Ед. изм.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tw_ost'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Остаток'
        Width = 73
        Visible = True
      end>
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 250
    Top = 166
    object ActLock: TAction
      Caption = 'Заблокировать систему'
      Hint = 'Заблокировать систему'
      ImageIndex = 110
      OnExecute = ActLockExecute
    end
    object ActProw: TAction
      Caption = 'Провести...'
      Hint = 'Провести...'
      ImageIndex = 22
      OnExecute = ActProwExecute
    end
    object ActUnProw: TAction
      Caption = 'Снять с проводки...'
      Hint = 'Снять с проводки...'
      ImageIndex = 23
      OnExecute = ActUnProwExecute
    end
    object ActSave: TAction
      Caption = 'Сохранить...'
      Hint = 'Сохранить...'
      ImageIndex = 39
      OnExecute = ActSaveExecute
    end
    object ActApply: TAction
      Caption = 'Применить...'
      Hint = 'Применить...'
      ImageIndex = 38
      OnExecute = ActApplyExecute
    end
    object ActPrint: TAction
      Caption = 'Печать...'
      Hint = 'Печать...'
      ImageIndex = 9
      OnExecute = ActPrintExecute
    end
    object ActHistory: TAction
      Caption = 'История...'
      Hint = 'История...'
      ImageIndex = 3
      OnExecute = ActHistoryExecute
    end
    object ActDicTw: TAction
      Caption = 'Каталог товаров...'
      Hint = 'Каталог товаров...'
      ImageIndex = 37
    end
    object ActDel: TAction
      Caption = 'Удалить...'
      Hint = 'Удалить...'
      ImageIndex = 2
      OnExecute = ActDelExecute
    end
    object ActDetal: TAction
      Caption = 'Подробно о товаре...'
      Hint = 'Подробно о товаре...'
      ImageIndex = 11
      ShortCut = 113
      OnExecute = ActDetalExecute
    end
    object ActAnaliz: TAction
      Caption = 'Анализ товара...'
      Hint = 'Анализ товара...'
      ImageIndex = 12
      ShortCut = 114
      OnExecute = ActAnalizExecute
    end
    object ActMarket: TAction
      Caption = 'Маркетинговые данные...'
      Hint = 'Маркетинговые данные...'
      ImageIndex = 10
      ShortCut = 115
      OnExecute = ActMarketExecute
    end
    object ActPrintCenn: TAction
      Caption = 'Печать ценника...'
      Hint = 'Печать ценника...'
      ImageIndex = 40
      OnExecute = ActPrintCennExecute
    end
    object ActPrintCennAll: TAction
      Caption = 'Печать всех ценников...'
      Hint = 'Печать всех ценников...'
      ImageIndex = 41
      OnExecute = ActPrintCennAllExecute
    end
    object ActRefresh: TAction
      Caption = 'Обновить...'
      Hint = 'Обновить...'
      ImageIndex = 44
      OnExecute = ActRefreshExecute
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 584
    Top = 174
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 574
    Top = 226
  end
  object MemPsorts: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'psorts_id'
        DataType = ftInteger
      end
      item
        Name = 'tw_id'
        DataType = ftInteger
      end
      item
        Name = 'tw_id2'
        DataType = ftInteger
      end
      item
        Name = 'tw_art1'
        DataType = ftInteger
      end
      item
        Name = 'tw_art2'
        DataType = ftInteger
      end
      item
        Name = 'tw_nam1'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'tw_nam2'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'ed_short1'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ed_short2'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'tw_kol'
        DataType = ftFloat
      end
      item
        Name = 'tw_ost'
        DataType = ftFloat
      end
      item
        Name = 'tw_color1'
        DataType = ftInteger
      end
      item
        Name = 'tw_color2'
        DataType = ftInteger
      end
      item
        Name = 'tw_kol2'
        DataType = ftFloat
      end>
    Left = 332
    Top = 170
    object MemPsortspsorts_id: TIntegerField
      FieldName = 'psorts_id'
    end
    object MemPsortstw_id: TIntegerField
      FieldName = 'tw_id'
    end
    object MemPsortstw_id2: TIntegerField
      FieldName = 'tw_id2'
    end
    object MemPsortstw_art1: TIntegerField
      FieldName = 'tw_art1'
    end
    object MemPsortstw_art2: TIntegerField
      FieldName = 'tw_art2'
    end
    object MemPsortstw_nam1: TStringField
      FieldName = 'tw_nam1'
      Size = 128
    end
    object MemPsortstw_nam2: TStringField
      FieldName = 'tw_nam2'
      Size = 128
    end
    object MemPsortsed_short1: TStringField
      FieldName = 'ed_short1'
      Size = 6
    end
    object MemPsortsed_short2: TStringField
      FieldName = 'ed_short2'
      Size = 6
    end
    object MemPsortstw_kol: TFloatField
      FieldName = 'tw_kol'
      OnChange = MemPsortstw_kolChange
      DisplayFormat = '#0.0000'
    end
    object MemPsortstw_ost: TFloatField
      FieldName = 'tw_ost'
      DisplayFormat = '#0.0000'
    end
    object MemPsortstw_color1: TIntegerField
      FieldName = 'tw_color1'
    end
    object MemPsortstw_color2: TIntegerField
      FieldName = 'tw_color2'
    end
    object MemPsortstw_kol2: TFloatField
      FieldName = 'tw_kol2'
      DisplayFormat = '#0.0000'
    end
  end
  object DsPsorts: TDataSource
    DataSet = MemPsorts
    OnDataChange = DsPsortsDataChange
    Left = 328
    Top = 222
  end
end
