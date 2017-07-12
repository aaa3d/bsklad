object Find_Towar_Abc: TFind_Towar_Abc
  Left = 32
  Top = 62
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Поиск товара по наименованию'
  ClientHeight = 465
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 446
    Width = 734
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 49
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 123
      Height = 26
      Caption = 'Наименование товара :'#13#10'(не менее 3-х символов)'
    end
    object Edit1: TEdit
      Left = 136
      Top = 12
      Width = 353
      Height = 21
      AutoSelect = False
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
    object Btn_GO: TButton
      Left = 572
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Найти в списке товаров выбранный (Enter)'
      Caption = 'Перейти'
      TabOrder = 2
      OnClick = Btn_GOClick
    end
    object Btn_CLOSE: TButton
      Left = 652
      Top = 8
      Width = 75
      Height = 25
      Hint = '(ESC)'
      Caption = 'Закрыть'
      TabOrder = 3
      OnClick = Btn_CLOSEClick
    end
    object Button1: TButton
      Left = 492
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Найти...'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 49
    Width = 734
    Height = 397
    Align = alClient
    DataSource = DsFind
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    OnKeyPress = RxDBGrid1KeyPress
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'TW_ART'
        Title.Alignment = taCenter
        Title.Caption = 'Код'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_NAM'
        Title.Alignment = taCenter
        Title.Caption = 'Наименование товара'
        Width = 397
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_MROZ'
        Title.Alignment = taCenter
        Title.Caption = 'Розн. цена'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_SHORT'
        Title.Alignment = taCenter
        Title.Caption = 'Ед. изм.'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_OST'
        Title.Alignment = taCenter
        Title.Caption = 'Остаток'
        Width = 80
        Visible = True
      end>
  end
  object QueryFind: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FindTransaction
    AfterOpen = QueryFindAfterOpen
    AfterScroll = QueryFindAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from find_tw_abc(:TW_NAM,:shop_id)')
    Left = 56
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'TW_NAM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'shop_id'
        ParamType = ptUnknown
      end>
    object QueryFindTW_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ID'
      ReadOnly = True
    end
    object QueryFindTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object QueryFindTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object QueryFindTWTREE_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TWTREE_FULL'
      ReadOnly = True
      Size = 254
    end
    object QueryFindTW_MROZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MROZ'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QueryFindTW_OST: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_OST'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QueryFindED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object QueryFindTW_KOMPL: TIBStringField
      FieldName = 'TW_KOMPL'
      Size = 1
    end
    object QueryFindMET_MONEY_SHOP: TIBStringField
      FieldName = 'MET_MONEY_SHOP'
      Origin = 'FIND_TW_ABC.MET_MONEY_SHOP'
      FixedChar = True
      Size = 1
    end
  end
  object FindTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 56
    Top = 80
  end
  object DsFind: TDataSource
    DataSet = QueryFind
    Left = 56
    Top = 188
  end
end
