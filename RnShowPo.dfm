object RN_SHOW_PO: TRN_SHOW_PO
  Left = 111
  Top = 100
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Информация о предоплатах и сторно по накладной'
  ClientHeight = 538
  ClientWidth = 757
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
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 757
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 519
    Width = 757
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel3: TPanel
    Left = 0
    Top = 29
    Width = 757
    Height = 74
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 6
      Width = 76
      Height = 13
      Caption = 'Накладная № :'
    end
    object Label2: TLabel
      Left = 532
      Top = 10
      Width = 97
      Height = 13
      Caption = 'Сумма накладной :'
    end
    object Label3: TLabel
      Left = 518
      Top = 52
      Width = 111
      Height = 13
      Caption = 'Предоплат на сумму :'
    end
    object Label4: TLabel
      Left = 40
      Top = 28
      Width = 42
      Height = 13
      Caption = 'Клиент :'
    end
    object Label5: TLabel
      Left = 498
      Top = 30
      Width = 131
      Height = 13
      Caption = 'Сторнировано товара на :'
    end
    object Label6: TLabel
      Left = 20
      Top = 50
      Width = 62
      Height = 13
      Caption = 'Основание :'
    end
    object Label7: TLabel
      Left = 244
      Top = 6
      Width = 17
      Height = 13
      Caption = 'от :'
    end
    object RN_SUMM: TRxCalcEdit
      Left = 632
      Top = 4
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 руб##'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 0
    end
    object STORNO_SUMM: TRxCalcEdit
      Left = 632
      Top = 26
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 руб##'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 1
    end
    object PO_SUMM: TRxCalcEdit
      Left = 632
      Top = 48
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 руб##'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 2
    end
    object RN_NUM: TEdit
      Left = 84
      Top = 2
      Width = 155
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = 'RN_NUM'
    end
    object KLN_FULL: TEdit
      Left = 84
      Top = 24
      Width = 399
      Height = 21
      Enabled = False
      TabOrder = 4
      Text = 'KLN_FULL'
    end
    object RN_OSN: TEdit
      Left = 84
      Top = 46
      Width = 399
      Height = 21
      Enabled = False
      TabOrder = 5
      Text = 'RN_OSN'
    end
    object RN_DATE: TEdit
      Left = 268
      Top = 2
      Width = 155
      Height = 21
      Enabled = False
      TabOrder = 6
      Text = 'RN_DATE'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 103
    Width = 757
    Height = 416
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Список товаров'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 749
        Height = 388
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 749
          Height = 388
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel_Storno: TPanel
            Left = 0
            Top = 247
            Width = 749
            Height = 141
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 0
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 749
              Height = 17
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Список сторно'
              TabOrder = 0
            end
            object RxDBGrid3: TRxDBGrid
              Left = 0
              Top = 17
              Width = 749
              Height = 124
              Align = alClient
              DataSource = DsListRNS
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'DOC_DATE'
                  Title.Alignment = taCenter
                  Title.Caption = 'Дата'
                  Width = 105
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DOC_FULLNUM'
                  Title.Alignment = taCenter
                  Title.Caption = 'Номер'
                  Width = 123
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SKL_FULL'
                  Title.Alignment = taCenter
                  Title.Caption = 'Склад'
                  Width = 132
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TW_KOL'
                  Title.Alignment = taCenter
                  Title.Caption = 'Кол-во'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'US_FULL'
                  Title.Alignment = taCenter
                  Title.Caption = 'Кто оформил'
                  Width = 149
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RN_OSN'
                  Title.Alignment = taCenter
                  Title.Caption = 'Основание'
                  Visible = True
                end>
            end
          end
          object RxDBGrid2: TRxDBGrid
            Left = 0
            Top = 0
            Width = 749
            Height = 247
            Align = alClient
            DataSource = DsListRN
            TabOrder = 1
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
                Title.Alignment = taCenter
                Title.Caption = 'Код'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_NAM'
                Title.Alignment = taCenter
                Title.Caption = 'Наименование товара'
                Width = 396
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ED_SHORT'
                Title.Alignment = taCenter
                Title.Caption = 'Ед.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_MONEY'
                Title.Alignment = taCenter
                Title.Caption = 'Цена'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_KOL'
                Title.Alignment = taCenter
                Title.Caption = 'Кол-во'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TW_STORNO'
                Title.Alignment = taCenter
                Title.Caption = 'Сторнировано'
                Visible = True
              end>
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Предоплаты'
      ImageIndex = 1
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 749
        Height = 388
        Align = alClient
        DataSource = DsListPO
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'PO_FULL_NUM'
            Title.Alignment = taCenter
            Title.Caption = 'Номер'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PO_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Дата'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PO_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STORNO_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сторно'
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KLN_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Клиент'
            Width = 131
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PO_OSN'
            Title.Alignment = taCenter
            Title.Caption = 'Основание'
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'US_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Кто оформил'
            Width = 137
            Visible = True
          end>
      end
    end
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 194
    Top = 131
  end
  object ShowTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 426
    Top = 130
  end
  object QrListRN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ShowTransaction
    AfterOpen = QrListRNAfterOpen
    AfterScroll = QrListRNAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from rns_list_storno1(:rn_id) order by tw_nam')
    Left = 250
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rn_id'
        ParamType = ptUnknown
      end>
    object QrListRNRNS_ID: TIntegerField
      FieldName = 'RNS_ID'
      Origin = 'RNS_LIST_STORNO1.RNS_ID'
    end
    object QrListRNTW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'RNS_LIST_STORNO1.TW_ID'
    end
    object QrListRNTW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'RNS_LIST_STORNO1.TW_ART'
    end
    object QrListRNTW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'RNS_LIST_STORNO1.TW_NAM'
      Size = 128
    end
    object QrListRNED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Origin = 'RNS_LIST_STORNO1.ED_SHORT'
      Size = 6
    end
    object QrListRNTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'RNS_LIST_STORNO1.TW_KOL'
      DisplayFormat = '#0.0000'
    end
    object QrListRNTW_STORNO: TFloatField
      FieldName = 'TW_STORNO'
      Origin = 'RNS_LIST_STORNO1.TW_STORNO'
      DisplayFormat = '#0.0000'
    end
    object QrListRNTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      Origin = 'RNS_LIST_STORNO1.TW_MONEY'
      DisplayFormat = '#0.00 руб'
    end
  end
  object QrListRns: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ShowTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from rns_list_storno2(:rns_id) order by doc_date desc')
    Left = 322
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rns_id'
        ParamType = ptUnknown
      end>
    object QrListRnsSTORNO_ID: TIntegerField
      FieldName = 'STORNO_ID'
      Origin = 'RNS_LIST_STORNO2.STORNO_ID'
    end
    object QrListRnsSTORNOS_ID: TIntegerField
      FieldName = 'STORNOS_ID'
      Origin = 'RNS_LIST_STORNO2.STORNOS_ID'
    end
    object QrListRnsDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
      Origin = 'RNS_LIST_STORNO2.DOC_DATE'
    end
    object QrListRnsDOC_FULLNUM: TIBStringField
      FieldName = 'DOC_FULLNUM'
      Origin = 'RNS_LIST_STORNO2.DOC_FULLNUM'
      Size = 64
    end
    object QrListRnsSHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'RNS_LIST_STORNO2.SHOP_COLOR'
    end
    object QrListRnsUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'RNS_LIST_STORNO2.US_FULL'
      Size = 254
    end
    object QrListRnsSKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Origin = 'RNS_LIST_STORNO2.SKL_FULL'
      Size = 254
    end
    object QrListRnsTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'RNS_LIST_STORNO2.TW_KOL'
      DisplayFormat = '#0.0000'
    end
    object QrListRnsRN_OSN: TIBStringField
      FieldName = 'RN_OSN'
      Origin = 'RNS_LIST_STORNO2.RN_OSN'
      Size = 254
    end
  end
  object QrListPO: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ShowTransaction
    AfterOpen = QrListPOAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from rn_list_po(:rn_id) order by po_date desc')
    Left = 390
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rn_id'
        ParamType = ptUnknown
      end>
    object QrListPOPO_ID: TIntegerField
      FieldName = 'PO_ID'
      Origin = 'RN_LIST_PO.PO_ID'
    end
    object QrListPOPO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
      Origin = 'RN_LIST_PO.PO_DATE'
    end
    object QrListPOPO_FULL_NUM: TIBStringField
      FieldName = 'PO_FULL_NUM'
      Origin = 'RN_LIST_PO.PO_FULL_NUM'
      Size = 64
    end
    object QrListPOPO_SUMM: TFloatField
      FieldName = 'PO_SUMM'
      Origin = 'RN_LIST_PO.PO_SUMM'
      DisplayFormat = '#0.00 руб'
    end
    object QrListPOSTORNO_SUMM: TFloatField
      FieldName = 'STORNO_SUMM'
      Origin = 'RN_LIST_PO.STORNO_SUMM'
      DisplayFormat = '#0.00 руб'
    end
    object QrListPOPO_OSN: TIBStringField
      FieldName = 'PO_OSN'
      Origin = 'RN_LIST_PO.PO_OSN'
      Size = 254
    end
    object QrListPOKLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Origin = 'RN_LIST_PO.KLN_FULL'
      Size = 254
    end
    object QrListPOUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'RN_LIST_PO.US_FULL'
      Size = 254
    end
    object QrListPOSHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'RN_LIST_PO.SHOP_COLOR'
    end
  end
  object DsListRN: TDataSource
    DataSet = QrListRN
    Left = 250
    Top = 236
  end
  object DsListRNS: TDataSource
    DataSet = QrListRns
    Left = 320
    Top = 238
  end
  object DsListPO: TDataSource
    DataSet = QrListPO
    Left = 390
    Top = 238
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 110
    Top = 205
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 110
    Top = 253
  end
end
