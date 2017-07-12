object ANALIZ_TW: TANALIZ_TW
  Left = 219
  Top = 134
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Анализ товара'
  ClientHeight = 513
  ClientWidth = 788
  Color = clBtnFace
  Constraints.MinHeight = 540
  Constraints.MinWidth = 796
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 494
    Width = 788
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 788
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Caption = 'ToolButton1'
      ImageIndex = 9
    end
    object ToolButton5: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 33
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton2'
      ImageIndex = 110
      OnClick = ToolButton2Click
    end
    object Label1: TLabel
      Left = 58
      Top = 2
      Width = 100
      Height = 24
      Alignment = taCenter
      Caption = ' Текущий остаток : '
      Layout = tlCenter
    end
    object KOL: TRxCalcEdit
      Left = 158
      Top = 2
      Width = 121
      Height = 24
      AutoSize = False
      DisplayFormat = ',0.0000##'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 0
    end
    object Label8: TLabel
      Left = 279
      Top = 2
      Width = 45
      Height = 24
      AutoSize = False
      Caption = 'Фирма :'
    end
    object FRM: TRxDBLookupCombo
      Left = 324
      Top = 2
      Width = 224
      Height = 24
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'FRM_ID'
      LookupDisplay = 'FRM_NAME'
      LookupSource = DsFrm
      TabOrder = 1
      OnChange = FRMChange
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 788
    Height = 465
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Анализ поставок и продаж'
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 780
        Height = 345
        Align = alTop
        TabOrder = 0
        object RxDBGrid2: TRxDBGrid
          Left = 1
          Top = 1
          Width = 778
          Height = 343
          Align = alClient
          DataSource = DsAnaliz_TW
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = RxDBGrid2DblClick
          OnKeyPress = RxDBGrid2KeyPress
          OnGetCellParams = RxDBGrid2GetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'PP_TYP_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Документ'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PP_FULLNUM'
              Title.Alignment = taCenter
              Title.Caption = 'Номер'
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PP_DT'
              Title.Alignment = taCenter
              Title.Caption = 'Дата'
              Width = 111
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PP_POST_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Поставщик'
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PP_SKL_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Склад'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_KOL'
              Title.Alignment = taCenter
              Title.Caption = 'Кол-во'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PP_OST'
              Title.Alignment = taCenter
              Title.Caption = 'Остаток'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PP_MEN_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Менеджер-владелец'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SEB'
              Title.Alignment = taCenter
              Title.Caption = 'Себест. в руб'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEB$'
              Title.Alignment = taCenter
              Title.Caption = 'Себест в $'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NDS'
              Title.Alignment = taCenter
              Title.Caption = 'НДС в руб.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NDS$'
              Title.Alignment = taCenter
              Title.Caption = 'НДС в $'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'MONEY'
              Title.Alignment = taCenter
              Title.Caption = 'Цена в руб.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONEY$'
              Title.Alignment = taCenter
              Title.Caption = 'Цена в $'
              Visible = False
            end>
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 345
        Width = 780
        Height = 92
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 780
          Height = 19
          Align = alTop
          Caption = 'Реализация'
          TabOrder = 0
        end
        object RxDBGrid3: TRxDBGrid
          Left = 0
          Top = 19
          Width = 780
          Height = 73
          Align = alClient
          DataSource = DsAnaliz
          DefaultDrawing = False
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawDataCell = RxDBGrid3DrawDataCell
          OnDrawColumnCell = RxDBGrid3DrawColumnCell
          OnDblClick = RxDBGrid3DblClick
          OnKeyPress = RxDBGrid3KeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'TYP_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Документ'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FULLNUM'
              Title.Alignment = taCenter
              Title.Caption = 'Номер'
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT'
              Title.Alignment = taCenter
              Title.Caption = 'Дата'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KLN_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Клиент'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_KOL'
              Title.Alignment = taCenter
              Title.Caption = 'Кол-во'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONEY'
              Title.Alignment = taCenter
              Title.Caption = 'Цена'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tw_summ'
              Title.Alignment = taCenter
              Title.Caption = 'Сумма'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAC'
              Title.Alignment = taCenter
              Title.Caption = 'Наценка, руб.'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAC$'
              Title.Alignment = taCenter
              Title.Caption = 'Наценка, $'
              Width = -1
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PERCENT'
              Title.Alignment = taCenter
              Title.Caption = 'Наценка в %, руб'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERCENT$'
              Title.Alignment = taCenter
              Title.Caption = 'Наценка в %, $'
              Visible = False
            end>
        end
      end
    end
  end
  object AnalizTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 504
    Top = 113
  end
  object QrAnaliz_TW: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = AnalizTransaction
    AfterOpen = QrAnaliz_TWAfterOpen
    AfterScroll = QrAnaliz_TWAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from A0_ANALIZ_TW1(:tw_id, :FRM_ID)')
    Left = 198
    Top = 119
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TW_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end>
    object QrAnaliz_TWPP_ID: TIntegerField
      FieldName = 'PP_ID'
      Origin = 'A0_ANALIZ_TW1.PP_ID'
    end
    object QrAnaliz_TWPP_IDS: TIntegerField
      FieldName = 'PP_IDS'
      Origin = 'A0_ANALIZ_TW1.PP_IDS'
    end
    object QrAnaliz_TWPP_TYP: TIntegerField
      FieldName = 'PP_TYP'
      Origin = 'A0_ANALIZ_TW1.PP_TYP'
    end
    object QrAnaliz_TWPP_TYP_FULL: TIBStringField
      FieldName = 'PP_TYP_FULL'
      Origin = 'A0_ANALIZ_TW1.PP_TYP_FULL'
      Size = 32
    end
    object QrAnaliz_TWPP_PNTYP_ID: TIntegerField
      FieldName = 'PP_PNTYP_ID'
      Origin = 'A0_ANALIZ_TW1.PP_PNTYP_ID'
    end
    object QrAnaliz_TWPP_SHOP_ID: TIntegerField
      FieldName = 'PP_SHOP_ID'
      Origin = 'A0_ANALIZ_TW1.PP_SHOP_ID'
    end
    object QrAnaliz_TWPP_SKL_ID: TIntegerField
      FieldName = 'PP_SKL_ID'
      Origin = 'A0_ANALIZ_TW1.PP_SKL_ID'
    end
    object QrAnaliz_TWPP_DT: TDateTimeField
      FieldName = 'PP_DT'
      Origin = 'A0_ANALIZ_TW1.PP_DT'
    end
    object QrAnaliz_TWTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'A0_ANALIZ_TW1.TW_KOL'
      DisplayFormat = '#0.0000'
    end
    object QrAnaliz_TWMEN_ID: TIntegerField
      FieldName = 'MEN_ID'
      Origin = 'A0_ANALIZ_TW1.MEN_ID'
    end
    object QrAnaliz_TWPP_POST: TIntegerField
      FieldName = 'PP_POST'
      Origin = 'A0_ANALIZ_TW1.PP_POST'
    end
    object QrAnaliz_TWPP_FULLNUM: TIBStringField
      FieldName = 'PP_FULLNUM'
      Origin = 'A0_ANALIZ_TW1.PP_FULLNUM'
      Size = 64
    end
    object QrAnaliz_TWPP_POST_FULL: TIBStringField
      FieldName = 'PP_POST_FULL'
      Origin = 'A0_ANALIZ_TW1.PP_POST_FULL'
      Size = 254
    end
    object QrAnaliz_TWPP_SKL_FULL: TIBStringField
      FieldName = 'PP_SKL_FULL'
      Origin = 'A0_ANALIZ_TW1.PP_SKL_FULL'
      Size = 254
    end
    object QrAnaliz_TWPP_MEN_FULL: TIBStringField
      FieldName = 'PP_MEN_FULL'
      Origin = 'A0_ANALIZ_TW1.PP_MEN_FULL'
      Size = 254
    end
    object QrAnaliz_TWPP_OST: TFloatField
      FieldName = 'PP_OST'
      Origin = 'A0_ANALIZ_TW1.PP_OST'
      DisplayFormat = '#0.0000'
    end
    object QrAnaliz_TWSHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'A0_ANALIZ_TW1.SHOP_COLOR'
    end
    object QrAnaliz_TWMONEY: TFloatField
      FieldName = 'MONEY'
      Origin = 'A0_ANALIZ_TW1.MONEY'
      DisplayFormat = '#0.00 руб'
    end
    object QrAnaliz_TWMONEY2: TFloatField
      FieldName = 'MONEY$'
      Origin = 'A0_ANALIZ_TW1.MONEY$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnaliz_TWSEB: TFloatField
      FieldName = 'SEB'
      Origin = 'A0_ANALIZ_TW1.SEB'
      DisplayFormat = '#0.00 руб'
    end
    object QrAnaliz_TWSEB2: TFloatField
      FieldName = 'SEB$'
      Origin = 'A0_ANALIZ_TW1.SEB$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnaliz_TWNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'A0_ANALIZ_TW1.NDS'
      DisplayFormat = '#0.00 руб'
    end
    object QrAnaliz_TWNDS2: TFloatField
      FieldName = 'NDS$'
      Origin = 'A0_ANALIZ_TW1.NDS$'
      DisplayFormat = '#0.00 USD'
    end
  end
  object QrAnaliz_PNS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = AnalizTransaction
    OnCalcFields = QrAnaliz_PNSCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from A0_ANALIZ_TW2(:PP_TYP,:PP_IDS) ')
    Filtered = True
    Left = 368
    Top = 117
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PP_TYP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PP_IDS'
        ParamType = ptUnknown
      end>
    object QrAnaliz_PNSID: TIntegerField
      FieldName = 'ID'
      Origin = 'A0_ANALIZ_TW2.ID'
    end
    object QrAnaliz_PNSIDS: TIntegerField
      FieldName = 'IDS'
      Origin = 'A0_ANALIZ_TW2.IDS'
    end
    object QrAnaliz_PNSTYP: TIntegerField
      FieldName = 'TYP'
      Origin = 'A0_ANALIZ_TW2.TYP'
    end
    object QrAnaliz_PNSTYP_FULL: TIBStringField
      FieldName = 'TYP_FULL'
      Origin = 'A0_ANALIZ_TW2.TYP_FULL'
      Size = 32
    end
    object QrAnaliz_PNSRNTYP_ID: TIntegerField
      FieldName = 'RNTYP_ID'
      Origin = 'A0_ANALIZ_TW2.RNTYP_ID'
    end
    object QrAnaliz_PNSSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'A0_ANALIZ_TW2.SHOP_ID'
    end
    object QrAnaliz_PNSSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Origin = 'A0_ANALIZ_TW2.SKL_ID'
    end
    object QrAnaliz_PNSDT: TDateTimeField
      FieldName = 'DT'
      Origin = 'A0_ANALIZ_TW2.DT'
    end
    object QrAnaliz_PNSTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'A0_ANALIZ_TW2.TW_KOL'
      DisplayFormat = '#0.0000'
    end
    object QrAnaliz_PNSKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'A0_ANALIZ_TW2.KLN_ID'
    end
    object QrAnaliz_PNSFULLNUM: TIBStringField
      FieldName = 'FULLNUM'
      Origin = 'A0_ANALIZ_TW2.FULLNUM'
      Size = 64
    end
    object QrAnaliz_PNSKLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Origin = 'A0_ANALIZ_TW2.KLN_FULL'
      Size = 254
    end
    object QrAnaliz_PNSSKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Origin = 'A0_ANALIZ_TW2.SKL_FULL'
      Size = 254
    end
    object QrAnaliz_PNSSHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'A0_ANALIZ_TW2.SHOP_COLOR'
    end
    object QrAnaliz_PNSNAC: TFloatField
      FieldName = 'NAC'
      Origin = 'A0_ANALIZ_TW2.NAC'
      DisplayFormat = '#0.00 р'
    end
    object QrAnaliz_PNSNAC2: TFloatField
      FieldName = 'NAC$'
      Origin = 'A0_ANALIZ_TW2.NAC$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnaliz_PNSPERCENT: TFloatField
      FieldName = 'PERCENT'
      Origin = 'A0_ANALIZ_TW2.PERCENT'
      DisplayFormat = '#0.00%'
    end
    object QrAnaliz_PNSPERCENT2: TFloatField
      FieldName = 'PERCENT$'
      Origin = 'A0_ANALIZ_TW2.PERCENT$'
      DisplayFormat = '#0.00%'
    end
    object QrAnaliz_PNSMONEY: TFloatField
      FieldName = 'MONEY'
      Origin = 'A0_ANALIZ_TW2.MONEY'
      DisplayFormat = '#0.00 руб'
    end
    object QrAnaliz_PNSMONEY2: TFloatField
      FieldName = 'MONEY$'
      Origin = 'A0_ANALIZ_TW2.MONEY$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnaliz_PNStw_summ: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tw_summ'
      DisplayFormat = '#0.00 руб'
      Calculated = True
    end
  end
  object DsAnaliz_TW: TDataSource
    DataSet = QrAnaliz_TW
    Left = 200
    Top = 169
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 640
    Top = 113
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 636
    Top = 171
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 356
    Top = 306
  end
  object DsAnaliz: TDataSource
    DataSet = QrAnaliz_PNS
    Left = 372
    Top = 169
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
    Left = 136
    Top = 279
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
    Left = 138
    Top = 331
  end
end
