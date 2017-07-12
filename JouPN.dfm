inherited Jou_PN: TJou_PN
  Left = 384
  Top = 195
  Caption = 'Журнал приходных накладных'
  ClientHeight = 414
  ClientWidth = 1181
  OldCreateOrder = True
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1181
    inherited Image1: TImage
      Visible = True
    end
    inherited BtnProw: TToolButton
      OnClick = BtnProwClick
    end
    inherited BtnUnProw: TToolButton
      OnClick = BtnUnProwClick
    end
    inherited BtnNew: TToolButton
      OnClick = BtnNewClick
    end
    inherited BtnOpen: TToolButton
      OnClick = BtnOpenClick
    end
    inherited btnOpenSale: TToolButton
      Visible = False
    end
    inherited BtnCopy: TToolButton
      OnClick = BtnCopyClick
    end
    inherited BtnDel: TToolButton
      OnClick = BtnDelClick
    end
    inherited BtnPrint: TToolButton
      OnClick = BtnPrintClick
    end
    inherited BtnPropertis: TToolButton
      OnClick = BtnPropertisClick
    end
    inherited BtnFind: TToolButton
      OnClick = BtnFindClick
    end
    inherited BtnAnaliz: TToolButton
      Hint = 'Анализ документа...(F3)'
      OnClick = BtnAnalizClick
    end
    inherited BtnSubDoc: TToolButton
      OnClick = BtnSubDocClick
    end
    inherited BtnInterval: TToolButton
      OnClick = BtnIntervalClick
    end
    inherited BtnAdm: TToolButton
      OnClick = BtnAdmClick
    end
    object ToolButton15: TToolButton
      Left = 452
      Top = 2
      Action = MnPnNakl
    end
    object ToolButton4: TToolButton
      Left = 477
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 26
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 485
      Top = 2
      Hint = 'Проверить состояние продаж с накладной немедленно'
      Caption = 'ToolButton6'
      ImageIndex = 124
      OnClick = ToolButton6Click
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 395
    Width = 1181
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
    Width = 1181
    Height = 366
    inherited StatusBar2: TStatusBar
      Top = 29
      Width = 1181
    end
    inherited RxDBGrid1: TRxDBGrid
      Top = 48
      Width = 1181
      Height = 318
      DataSource = DsPnList
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      OnDrawDataCell = RxDBGrid1DrawDataCell
      OnDrawColumnCell = RxDBGrid1DrawColumnCell
      OnDblClick = RxDBGrid1DblClick
      OnKeyPress = RxDBGrid1KeyPress
      TitleButtons = True
      OnGetBtnParams = RxDBGrid1GetBtnParams
      OnTitleBtnClick = RxDBGrid1TitleBtnClick
      OnContextPopup = RxDBGrid1ContextPopup
      Columns = <
        item
          Expanded = False
          FieldName = 'PN$_PROW'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = ' '
          Width = 16
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PN$_DOCS'
          PickList.Strings = ()
          Title.Caption = 'Документы'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PN$_PRIM'
          PickList.Strings = ()
          Title.Caption = 'Примечание бухгалтера'
          Width = 143
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KLN_PREFIX'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Фирма'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PN$_NUM_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Номер'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OWNER_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Владелец'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KLN_ORG'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Поставщик'
          Width = 127
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PN$_DATE'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PN$_DATE_OPL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Дата оплаты'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PN$_OST'
          PickList.Strings = ()
          Title.Alignment = taRightJustify
          Title.Caption = ' '
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PN$_SUMM'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Сумма'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NDS_SUMM_ALL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Сумма НДС'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PN$_NAKL_MET'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = ' '
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PN$_SUMM2_ALL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Расходы '
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PN$_SUMM2'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Расходы распред.'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SKL_SHORT'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Склад'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PN$_KURS'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Курс'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PNVID_NAM'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Вид накладной'
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'US_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Кто оформил'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PN$_OSN'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Основание'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PN$_STFAKT'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Дата-номер счета фактуры'
          Width = 136
          Visible = True
        end>
    end
    object ToolBar2: TToolBar
      Left = 0
      Top = 0
      Width = 1181
      Height = 29
      ButtonHeight = 12
      Caption = 'ToolBar2'
      TabOrder = 2
      object ToolButton7: TToolButton
        Left = 0
        Top = 2
        Width = 8
        Caption = 'ToolButton7'
        Style = tbsSeparator
      end
      object Label1: TLabel
        Left = 8
        Top = 2
        Width = 34
        Height = 12
        Caption = 'Фирма :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object ToolButton9: TToolButton
        Left = 42
        Top = 2
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object FRM: TRxDBLookupCombo
        Left = 50
        Top = 2
        Width = 151
        Height = 19
        DropDownCount = 8
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ListStyle = lsDelimited
        LookupField = 'FRM_ID'
        LookupDisplay = 'FRM_NAME'
        LookupSource = DsFrm
        ParentFont = False
        TabOrder = 0
        OnChange = FRMChange
      end
      object ToolButton10: TToolButton
        Left = 201
        Top = 2
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object Label2: TLabel
        Left = 209
        Top = 2
        Width = 22
        Height = 12
        Caption = 'Вид :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object ToolButton11: TToolButton
        Left = 231
        Top = 2
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object VID: TRxDBLookupCombo
        Left = 239
        Top = 2
        Width = 126
        Height = 19
        DropDownCount = 8
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        LookupField = 'PNVID_ID'
        LookupDisplay = 'PNVID_NAME'
        LookupSource = DsPnVid
        ParentFont = False
        TabOrder = 1
        OnChange = VIDChange
      end
      object ToolButton12: TToolButton
        Left = 365
        Top = 2
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object Label3: TLabel
        Left = 373
        Top = 2
        Width = 47
        Height = 12
        Caption = 'Владелец :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object ToolButton13: TToolButton
        Left = 420
        Top = 2
        Width = 9
        Caption = 'ToolButton13'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object OWN: TRxDBLookupCombo
        Left = 429
        Top = 2
        Width = 111
        Height = 19
        DropDownCount = 8
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        LookupField = 'OWNER_ID'
        LookupDisplay = 'OWNER_NAME'
        LookupSource = DsOwner
        ParentFont = False
        TabOrder = 2
        OnChange = OWNChange
      end
      object ToolButton18: TToolButton
        Left = 540
        Top = 2
        Width = 10
        Caption = 'ToolButton18'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object Label4: TLabel
        Left = 550
        Top = 2
        Width = 32
        Height = 12
        Caption = 'Склад :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object ToolButton17: TToolButton
        Left = 582
        Top = 2
        Width = 8
        Caption = 'ToolButton17'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object SKL: TRxDBLookupCombo
        Left = 590
        Top = 2
        Width = 115
        Height = 19
        DropDownCount = 8
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_FULL'
        LookupSource = DsSKL
        ParentFont = False
        TabOrder = 3
        OnChange = OWNChange
      end
      object KLN_NAME: TEdit
        Left = 705
        Top = 2
        Width = 249
        Height = 12
        AutoSize = False
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Text = 'Все клиенты'
      end
      object BitBtn2: TBitBtn
        Left = 954
        Top = 2
        Width = 24
        Height = 12
        Hint = 'Выбрать клиента из справочника контактов (F10)'
        TabOrder = 6
        TabStop = False
        OnClick = BitBtn2Click
        Glyph.Data = {
          46050000424D4605000000000000360000002800000012000000120000000100
          2000000000001005000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000000000000000000000FF00FF00FF00FF00000000000000
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000000000000000000000FF00FF00FF00FF0000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00}
      end
      object BitBtn1: TBitBtn
        Left = 978
        Top = 2
        Width = 24
        Height = 12
        Hint = 'Выбрать клиента из справочника контактов (F10)'
        TabOrder = 5
        TabStop = False
        OnClick = BitBtn1Click
        Glyph.Data = {
          EE000000424DEE0000000000000076000000280000000F0000000F0000000100
          0400000000007800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555008000000000085505080FFFFFF0505500000000000F0F5500FFFFFFFFF0F
          055050F00F00FFF0F55050FFFFFFFFF0F550000FFFFFFFFF00000900F00000F0
          0900090FFFFFFFFF0900000F0000F00F0000550FFFFFFFFF0550550FFF000000
          0000555000FFFFFFFF005555550000000000}
      end
    end
  end
  object QrPnList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PnListTranSaction
    AfterOpen = QrPnListAfterOpen
    AfterScroll = QrPnListAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from list_pn2$(:DT1,:DT2,:PNTYP_ID,:FRM_ID,:PNVID_ID,:P' +
        'N_OWNER,:SKL,:kln_id)'
      ''
      '')
    Left = 94
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
        DataType = ftInteger
        Name = 'PNTYP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FRM_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNVID_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PN_OWNER'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SKL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kln_id'
        ParamType = ptUnknown
      end>
    object QrPnListPN_ID: TIntegerField
      FieldName = 'PN$_ID'
      Origin = 'LIST_PN$.PN$_ID'
    end
    object QrPnListPN_PROW: TIBStringField
      FieldName = 'PN$_PROW'
      Origin = 'LIST_PN$.PN$_PROW'
      FixedChar = True
      Size = 1
    end
    object QrPnListPN_NUM_FULL: TIBStringField
      FieldName = 'PN$_NUM_FULL'
      Origin = 'LIST_PN$.PN$_NUM_FULL'
      Size = 74
    end
    object QrPnListPN_DATE: TDateTimeField
      FieldName = 'PN$_DATE'
      Origin = 'LIST_PN$.PN$_DATE'
    end
    object QrPnListPN_DATE_OPL: TDateTimeField
      FieldName = 'PN$_DATE_OPL'
      Origin = 'LIST_PN$.PN$_DATE_OPL'
    end
    object QrPnListSKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'LIST_PN$.SKL_SHORT'
      Size = 32
    end
    object QrPnListPN_SUMM: TFloatField
      FieldName = 'PN$_SUMM'
      Origin = 'LIST_PN$.PN$_SUMM'
      DisplayFormat = '#0.00'
    end
    object QrPnListPN_SUMM2: TFloatField
      FieldName = 'PN$_SUMM2'
      Origin = 'LIST_PN$.PN$_SUMM2'
      DisplayFormat = '#0.00'
    end
    object QrPnListPN_COLOR: TIntegerField
      FieldName = 'PN$_COLOR'
      Origin = 'LIST_PN$.PN$_COLOR'
    end
    object QrPnListUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'LIST_PN$.US_FULL'
      Size = 32
    end
    object QrPnListPNVID_NAM: TIBStringField
      FieldName = 'PNVID_NAM'
      Origin = 'LIST_PN$.PNVID_NAM'
      Size = 64
    end
    object QrPnListOWNER_FULL: TIBStringField
      FieldName = 'OWNER_FULL'
      Origin = 'LIST_PN$.OWNER_FULL'
      Size = 32
    end
    object QrPnListKLN_ORG: TIBStringField
      FieldName = 'KLN_ORG'
      Origin = 'LIST_PN$.KLN_ORG'
      Size = 64
    end
    object QrPnListPN_KURS: TFloatField
      FieldName = 'PN$_KURS'
      Origin = 'LIST_PN$.PN$_KURS'
      DisplayFormat = '#0.00 р/$'
    end
    object QrPnListKLN_PREFIX: TIBStringField
      FieldName = 'KLN_PREFIX'
      Origin = 'LIST_PN$.KLN_PREFIX'
      Size = 32
    end
    object QrPnListPN_NUM: TIBStringField
      FieldName = 'PN$_NUM'
      Origin = 'LIST_PN$.PN$_NUM'
      Size = 32
    end
    object QrPnListPN_OST: TFloatField
      FieldName = 'PN$_OST'
      Origin = 'LIST_PN$.PN$_OST'
    end
    object QrPnListPN_OSN: TIBStringField
      FieldName = 'PN$_OSN'
      Origin = 'LIST_PN$.PN$_OSN'
      Size = 64
    end
    object QrPnListPN_NAKL_MET: TIntegerField
      FieldName = 'PN$_NAKL_MET'
      Origin = 'LIST_PN$.PN$_NAKL_MET'
    end
    object QrPnListWOZW_MET: TIntegerField
      FieldName = 'WOZW_MET'
    end
    object QrPnListPN_SUMM2_ALL: TFloatField
      FieldName = 'PN$_SUMM2_ALL'
      Origin = 'LIST_PN2$.PN$_SUMM2_ALL'
      DisplayFormat = '#0.00 р'
    end
    object QrPnListNDS_SUMM_ALL: TFloatField
      FieldName = 'NDS_SUMM_ALL'
      Origin = 'LIST_PN2$.NDS_SUMM_ALL'
      DisplayFormat = '#0.00 р'
    end
    object QrPnListPN_STFAKT: TIBStringField
      FieldName = 'PN$_STFAKT'
      Origin = 'LIST_PN2$.PN$_STFAKT'
      Size = 250
    end
    object QrPnListPN_PRIM: TIBStringField
      FieldName = 'PN$_PRIM'
      Origin = 'LIST_PN2$.PN$_PRIM'
      Size = 254
    end
    object QrPnListPN_DOCS: TStringField
      FieldName = 'PN$_DOCS'
      Size = 32
    end
    object QrPnListpn_weight: TFloatField
      FieldName = 'pn_weight'
    end
  end
  object DsPnList: TDataSource
    DataSet = QrPnList
    Left = 96
    Top = 201
  end
  object PnListTranSaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 96
    Top = 97
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PnListTranSaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 176
    Top = 157
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 348
    Top = 121
    object N2: TMenuItem
      Caption = 'Помощь'
      ShortCut = 112
      OnClick = N2Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MnProw: TMenuItem
      Caption = 'Провести накладную'
      ShortCut = 116
      OnClick = BtnProwClick
    end
    object MnUnprow: TMenuItem
      Caption = 'Снять с проводки накладную'
      ShortCut = 117
      OnClick = BtnUnProwClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnNEW: TMenuItem
      Caption = 'Новая накладная'
      ShortCut = 45
      OnClick = BtnNewClick
    end
    object MnOPEN: TMenuItem
      Caption = 'Открыть накладную'
      ShortCut = 13
      OnClick = BtnOpenClick
    end
    object MnCopy: TMenuItem
      Caption = 'Создать копию накладной'
      ShortCut = 16451
      OnClick = BtnCopyClick
    end
    object MnDEL: TMenuItem
      Caption = 'Удалить накладную'
      ShortCut = 46
      OnClick = BtnDelClick
    end
    object N8: TMenuItem
      Caption = '-'
      ShortCut = 189
    end
    object MnPRINT: TMenuItem
      Caption = 'Напечатать накладную'
      ShortCut = 120
      OnClick = BtnPrintClick
    end
    object MnHistory: TMenuItem
      Caption = '"История" приходной накладной'
      ShortCut = 123
      OnClick = BtnPropertisClick
    end
    object N4: TMenuItem
      Action = MnPnNakl
    end
    object MnFind: TMenuItem
      Caption = 'Найти накладную по номеру (1...9)'
      OnClick = BtnFindClick
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object MnAnaliz: TMenuItem
      Caption = 'Анализ приходной накладной'
      ShortCut = 114
      OnClick = BtnAnalizClick
    end
    object MnSubDoc: TMenuItem
      Caption = 'Создать новый документ на основании приходной накладной...'
      OnClick = BtnSubDocClick
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object MnInterval: TMenuItem
      Caption = 'Интервал дат в журнале'
      ShortCut = 73
      OnClick = BtnIntervalClick
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object MnAdm: TMenuItem
      Caption = 'Администрирование приходной накладной'
      ShortCut = 16449
      OnClick = BtnAdmClick
    end
    object mnu_pn_docs: TMenuItem
      Caption = 'Первичные документы'
      object mnuSFAKT: TMenuItem
        Caption = 'Счет фактура'
        OnClick = mnuSFAKTClick
      end
      object mnuTTN: TMenuItem
        Caption = 'Товарно-транспортная накладная'
        OnClick = mnuTTNClick
      end
      object mnuPrim: TMenuItem
        Caption = 'Примечание'
        OnClick = mnuPrimClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuAllDocs: TMenuItem
        Caption = 'Все документы имеются'
        OnClick = mnuAllDocsClick
      end
    end
  end
  object PipPnList: TppDBPipeline
    DataSource = DsPnList
    UserName = 'PipPnList'
    Left = 184
    Top = 209
    object PipPnListppField1: TppField
      FieldAlias = 'PN$_ID'
      FieldName = 'PN$_ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PipPnListppField2: TppField
      FieldAlias = 'PN$_PROW'
      FieldName = 'PN$_PROW'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PipPnListppField3: TppField
      FieldAlias = 'PN$_NUM_FULL'
      FieldName = 'PN$_NUM_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PipPnListppField4: TppField
      FieldAlias = 'PN$_DATE'
      FieldName = 'PN$_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PipPnListppField5: TppField
      FieldAlias = 'PN$_DATE_OPL'
      FieldName = 'PN$_DATE_OPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PipPnListppField6: TppField
      FieldAlias = 'SKL_SHORT'
      FieldName = 'SKL_SHORT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PipPnListppField7: TppField
      FieldAlias = 'PN$_SUMM'
      FieldName = 'PN$_SUMM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PipPnListppField8: TppField
      FieldAlias = 'PN$_SUMM2'
      FieldName = 'PN$_SUMM2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PipPnListppField9: TppField
      FieldAlias = 'PN$_COLOR'
      FieldName = 'PN$_COLOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PipPnListppField10: TppField
      FieldAlias = 'US_FULL'
      FieldName = 'US_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PipPnListppField11: TppField
      FieldAlias = 'PNVID_NAM'
      FieldName = 'PNVID_NAM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PipPnListppField12: TppField
      FieldAlias = 'OWNER_FULL'
      FieldName = 'OWNER_FULL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PipPnListppField13: TppField
      FieldAlias = 'KLN_ORG'
      FieldName = 'KLN_ORG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PipPnListppField14: TppField
      FieldAlias = 'PN$_KURS'
      FieldName = 'PN$_KURS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PipPnListppField15: TppField
      FieldAlias = 'KLN_PREFIX'
      FieldName = 'KLN_PREFIX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PipPnListppField16: TppField
      FieldAlias = 'PN$_NUM'
      FieldName = 'PN$_NUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PipPnListppField17: TppField
      FieldAlias = 'PN$_OST'
      FieldName = 'PN$_OST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PipPnListppField18: TppField
      FieldAlias = 'PN$_OSN'
      FieldName = 'PN$_OSN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PipPnListppField19: TppField
      FieldAlias = 'PN$_NAKL_MET'
      FieldName = 'PN$_NAKL_MET'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PN_WEIGHT: TppField
      FieldAlias = 'PN_WEIGHT'
      FieldName = 'PN_WEIGHT'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
  end
  object PpPNLIST: TppReport
    AutoStop = False
    DataPipeline = PipPnList
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Журнал приходных накладных'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    UserName = 'Report'
    CachePages = True
    DeviceType = 'Screen'
    OnPreviewFormCreate = PpPNLISTPreviewFormCreate
    Left = 184
    Top = 262
    Version = '5.0'
    mmColumnWidth = 0
    object ppTitleBand12: TppTitleBand
      BeforeGenerate = ppTitleBand12BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppImage23: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 7673
        mmLeft = 241565
        mmTop = 0
        mmWidth = 22754
        BandType = 1
      end
      object ppRegion66: TppRegion
        UserName = 'Region1'
        Brush.Color = clGray
        Caption = 'Region1'
        ParentWidth = False
        Stretch = True
        mmHeight = 8467
        mmLeft = 0
        mmTop = 0
        mmWidth = 241036
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label6'
          Caption = 'Журнал '
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial Cyr'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 1588
          mmTop = 1058
          mmWidth = 17463
          BandType = 1
        end
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
          mmLeft = 210873
          mmTop = 265
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
          mmLeft = 191559
          mmTop = 265
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
          mmLeft = 219869
          mmTop = 3704
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
          mmLeft = 215371
          mmTop = 3704
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
          mmLeft = 211138
          mmTop = 3704
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
          mmLeft = 195263
          mmTop = 3704
          mmWidth = 14552
          BandType = 1
        end
        object PnListTitle1: TppMemo
          UserName = 'PnListTitle1'
          Caption = 'PnListTitle1'
          CharWrap = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial Cyr'
          Font.Size = 12
          Font.Style = [fsBold]
          Stretch = True
          Transparent = True
          mmHeight = 5027
          mmLeft = 19844
          mmTop = 1058
          mmWidth = 170392
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
        mmHeight = 8467
        mmLeft = 0
        mmTop = 8996
        mmWidth = 266171
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
          mmLeft = 3704
          mmTop = 11642
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
          mmLeft = 14288
          mmTop = 11642
          mmWidth = 8731
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
          mmLeft = 238919
          mmTop = 11907
          mmWidth = 17992
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
          mmLeft = 159544
          mmTop = 11907
          mmWidth = 9260
          BandType = 1
        end
        object ppLabel443: TppLabel
          UserName = 'Label16'
          ShiftWithParent = True
          Caption = 'Поставщик'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 61383
          mmTop = 11642
          mmWidth = 15081
          BandType = 1
        end
        object ppLabel482: TppLabel
          UserName = 'Label482'
          ShiftWithParent = True
          Caption = 'Владелец'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 38365
          mmTop = 11642
          mmWidth = 12965
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
          mmLeft = 89165
          mmTop = 11642
          mmWidth = 6879
          BandType = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label11'
          ShiftWithParent = True
          Caption = 'Дата оплаты'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 117475
          mmTop = 11907
          mmWidth = 17727
          BandType = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label17'
          ShiftWithParent = True
          Caption = 'Расходы'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 172509
          mmTop = 11642
          mmWidth = 11642
          BandType = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label27'
          ShiftWithParent = True
          Caption = 'Склад'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 190500
          mmTop = 11907
          mmWidth = 7938
          BandType = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label28'
          ShiftWithParent = True
          Caption = 'Основание'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 210609
          mmTop = 11907
          mmWidth = 15081
          BandType = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label30'
          ShiftWithParent = True
          Caption = 'Курс'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Cyr'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 136261
          mmTop = 11907
          mmWidth = 6615
          BandType = 1
        end
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
        mmWidth = 266436
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
        mmLeft = 3704
        mmTop = 9790
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
        mmLeft = 14552
        mmTop = 9790
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
        mmLeft = 238390
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
        mmLeft = 159544
        mmTop = 9790
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel450: TppLabel
        UserName = 'Label25'
        ShiftWithParent = True
        Caption = 'Поставщик'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 61383
        mmTop = 10054
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel461: TppLabel
        UserName = 'Label461'
        ShiftWithParent = True
        Caption = 'Владелец'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 38629
        mmTop = 9790
        mmWidth = 12965
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
        mmLeft = 89429
        mmTop = 10054
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label12'
        ShiftWithParent = True
        Caption = 'Дата оплаты'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 117475
        mmTop = 9790
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label19'
        ShiftWithParent = True
        Caption = 'Расходы'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 9790
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label26'
        ShiftWithParent = True
        Caption = 'Склад'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 191030
        mmTop = 9790
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label29'
        ShiftWithParent = True
        Caption = 'Основание'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 210609
        mmTop = 9790
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label31'
        Alignment = taRightJustify
        Caption = 'Курс'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 139965
        mmTop = 9790
        mmWidth = 6615
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
      object ppLabel457: TppLabel
        UserName = 'Label3'
        Caption = 'Документ :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 58473
        mmTop = 794
        mmWidth = 15081
        BandType = 0
      end
      object PpPnListUser: TppLabel
        UserName = 'PpRnUser'
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
      object PnListTitle2: TppLabel
        UserName = 'PpRnTitle'
        Caption = 'PnListTitle2'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 80698
        mmTop = 529
        mmWidth = 17198
        BandType = 0
      end
      object ppImage24: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = True
        Stretch = True
        Picture.Data = {
          07544269746D617066490000424D664900000000000036010000280000004F01
          0000370000000100080000000000304800000000000000000000400000004000
          0000000000000000800000800000008080008000000080008000808000008080
          8000040404008484840044444400C4C4C40024242400A4A4A40064646400E4E4
          E400141414009494940054545400D4D4D40034343400B4B4B40074747400F4F4
          F4000C0C0C008C8C8C004C4C4C00CCCCCC002C2C2C00ACACAC006C6C6C00ECEC
          EC001C1C1C009C9C9C005C5C5C00DCDCDC003C3C3C00BCBCBC007C7C7C00FCFC
          FC00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272723231F27132727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727270B0B250D272727272727272727272727272727272727272727
          272727272727272727272727272727271F250B15272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727270A0A0A0A0A0A0A0A1A1A1A1A1A1A1A1A0A1A1A1A121A190E0D27
          232727272727272727272727261A1A1A1A1A1A1A1A1A121A121212121212121A
          1A1A1A1A1A1A1A0A1A0A0A0A0A0A1A1127272727272727272727272727272727
          272713220C20201C242414141C0C0C20101C272727272727272727272727271D
          1A1A1212121A1A1A1A1A1A1A1A1A0A24240A1A0A1A1C0A121212221222121212
          121212121A2627272727272727272727272727272727121A220E262727271B22
          121212121212121212121A1A1A12122727272727272727272727272727272727
          24161E1A272727272712121212122222222222221212121212121A1A1A1A1A0A
          1A1A1A1A1A1A1A0A141C0C2027270A0E22220E22222222121222121212121212
          1A1A0A0A0A0D27272727272714141C0C0C200C200C0C200C0C0C202727272727
          27272727272727272727272727272727270027272727201C1C0C1414141C1414
          14240A1A0A0A0A0A24141C1C240C0C0C2010182627272727272727271C1C1414
          1414141414242424240A24240A1216161626092626161E0E221212122222141E
          27272727272727272727272727272727120C2421230B1D090919261E0E1E2611
          0916140C1012172727272727272727261A122226110909090926161E0E0E1E16
          19212111191C241E1E220E19110D1D150D110926161427272727272727272727
          27272727270B261616222627272725221E26151B0B2515151D21191111211E27
          2727272727272727272727272727271419121A1A27272727270A21131B0B0B0B
          251D0D0D1D1D250B1B1B1B252525251515151D21210D1D15150B1B2027270C09
          1F1F0F231B1B1B1B0F1F17170F2313131B2525151419272727272727220D2121
          0D25231B1F0B0D1D151D0C272727272727272727272727272727272727272727
          2700272727270C1A2020202020202020202020200C0C1C140C0C201C1C0E1919
          1E1E141010101727272727271C2420202020200C0C0C0C1C241C0C0C14241414
          14141A1E11111111191622121A1A1A1A2727272727272727272727272727250C
          092624121121110D1D1525250D111119261622220D220C200E17272727272726
          140C0C1C1C140A221E0919260E2212221E2626161E0C1C0A222616160921160E
          220E12121E1427272727272727272727272727270F22261E1A221E2727271514
          0E1E1926121222121222221E2619122727272727272727272727272727271A09
          0E220A1A2727272727101212221E1E1E161609190D15150D111919191111191E
          121A0A1A0A0A0A1A1A1A110C15270C14122222221E2619191111211919262616
          161619252419272727272714122424240A0A161A221909161E250C2727272727
          272727272727272727272727272727272700272727270C240C0C202020202020
          202020202024141C242020200C1C2014221E1E111A0C201C272727270C140C0C
          202020200C0C1C0C0C0C0C14200C0A1E11111A1C14241A0E16221A0A0A0A2424
          272727272727272727272727271C1E0D12120916091527271B2327232527271B
          0909090D1D0D161D14140A2727272716140E192123190E1A0A1A1A121212220E
          0E26091612221C0A160916151B130F1F0F261626221C27272727272727272727
          272727271419190922120E2727270D0C12112127272727272727271B1B1D0927
          272727272727272727272727272316261A1C0A0A2727272727101E2621091725
          25250D110916160E22221E0911161E0E120E1E121A1A1A2222120D0C16270C1C
          19251125272727272727271F0D26221216261926091927272727261C24141C14
          14140A1A2209090E09260E272727272727272727272727272727272727272727
          2700272727272222241C0C1010101010101020200C0C0D0F09240C141420200C
          240A201C221624202427272712220A140C1020200C20200C0C140C1411221F27
          2727170F260A0D0B1E1C1C141412240A27272727272727272727270D121D1A22
          220C2221230E2727151E221A1A0A0E1A1A240A0A0A0E2125131A242727272726
          16221224141424260A0A1A122222221A0E270E1A1A141E221A240A0A220B1723
          26270D161E0A2727272727272727272727272724251909092212122727270D26
          161E1212110B1F1B25170D27111E0E27272727272727272727272727271E1626
          0A1C1A242727272727091D111526221B0E26111D25251D091611162727272727
          272709260E161511221A1A1414270C0B251B2727161F0B150D0D2111260E1211
          27172715261127272727120E241C1C140A241A0E110E22261F0D0E2727272727
          2727272727272727272727272727272727002727272727271327130810101010
          202020200C142427240C1C1020141C20200C190A0C22161E0C0C27271F131323
          1F20100C20200C200C0C141A112712240A0A0A14141C0C142127111A1A121A1A
          0F272727272727272727241E091624240C09151B09272626250F130F23261C18
          0A14241A0A0A0E11091A24272727271F2323230F1C141D1D12121A0A12091519
          1921270F0F1F2713131C2012241E1A0B251D1F0F0F0F27272727272727272727
          2727091D1922161E22121A2727272727231709201C2626262125221B1F1F1F27
          272727272727272727272727240E091612241A1427272727270F0F1F0F091024
          22220E1E0E120A0A1E220E1612121226221E0D172712241E0E0A0A1220272727
          2323131C1409220E1E0E12121211251419272317272727272724121424141C1C
          242422161E0A1D241D2727272727272727272727272727272727272727272727
          2700272727272727272727101C0C1020202020200C1C0A122727272518100C1C
          10200A2124240A1A220C2227272727272726201C200C0C0C0C0C0C1A0A222727
          2727272727231620200C271D1A141E0A0D272727272727272724261216141C0C
          121D231E270D1F272727272727270B0C210A24140A1A0A0A1612142727272727
          272727270F0C211522121A1A2219151E14272727272727272727080C0C1A241E
          1A272727272727272727272727272727271716260916121A0E120A2727272727
          27272721100A1A0A22191327272727272727272727272727272727140E161A12
          0E0E1A142727272727272727272718140E1E2609090E221E110A262727272727
          27270D14221B19140E0A0A1E2027272727272716201A121E26160E0E220D0D1C
          2727272727272727121C121E0A24141C240A0E16121E24272727272727272727
          272727272727272727272727272727272700272727272727272727201C0C1020
          101020200C0C1A24272727272718201C10202426120A1A0A0A12142727272727
          27191C142020200C1C0C0A240A0A2727272727272727272721182017151C0A24
          1E27272727272727241D220E140C0C0C1523242723272727272727272727250C
          13111A240A1A0A14242224272727272727272727270C1A26121A0A0A0A0A0A1A
          1427272727272727272720201C091A241E272727272727272727272727272727
          171A09272321222412120A27272727272727272710140A1A1E14272727272727
          27272727272727272727191E090A24241E260A1427272727272727272727180C
          2212220E0E1A24241E1416272727272727272727171C141214220A2220272727
          2727271D201A220E1E0E240A0A220D0C27272727272727271A0E26111A0A2412
          0A140E091A0E2527272727272727272727272727272727272727272727272727
          27002727272727272727271C140C1010202020201C1C0A14272727272727181C
          14201C161A14141A1A161C0A2727272727191C1C202020201C201A0A1A242727
          272727272727272727271820270E0A140A2727272727270E091A0E1C201A0C0A
          1309111927272727272727272727150C171D260E221A0A0A0A1E242727272727
          27272727170C0C0A2414240A0A1A0A121C2727272727272727270C200C260A24
          222727272727272727272727272727271C152727170B0D09161A0A2727272727
          27272727181C0E120E1C272727272727272727272727272727270E161E121A12
          16160A1C27272727272727272727180C14240A1222120A0A1A140E2727272727
          2727272727270C1A0E2422220C2727272727271510140E1E09090E0A0A1A120C
          272727272727272222110909120A0A220A1416121D1227272727272727272727
          2727272727272727272727272727272727002727272727272727271C1C0C1020
          101020201C0C2414272727272727201024200C24121414240A1A0A1427272727
          2719200C202020201C2014121A24272727271B1B1B1B15272727271812132624
          1427272727271516221E0A20140C1C0D1B1A1D2727272727272727272727150C
          170F2119091919190E0924272727272727272727170C1C0E141414240A1A1A0E
          1C2727272727272727270C0C0C21090A1E272727272727272727272727272712
          1B1B271F131313230F1A24272727272727272727180C1D09261C272727272727
          272727272727272727121E0B0D19091921090A1C27272727272727272727180C
          12221E191119221A0A14222727270F1B1B1B1B272727271C1A1D1A121C1B2727
          2727270F1014111111091119261E0A0C27272727272724142113150D220A121A
          1216240914272727272727272727272727272727272727272727272727272727
          27002727272727272727271C141C1010202020201C0C24142727272727271120
          242020140E1111090916220A152727272709201C0C100C200C201C0E1A242727
          27271C0A1214122727272716102717221427272727270C160E120C1A240C2123
          1B22262727272727272727272727152027170F0F1B1D11191911242727272727
          272727271F0C141E141C14240A1212121C2727272727272727270C20241F250A
          1E272727272727272727272727271311121D2111091919210B12242727272727
          2727272718142717261C27272727272727272727272727271C0E1B1B1B130F0F
          0F250A1C27272727272727272727080C150D1D1D150D21191E14122727271612
          191610272727271C0C1A2422140927272727270F100A2317170D0E0E1E260E0C
          27272727271F240D090E19111E1E120A161A121A232727272727272727272727
          2727272727272727272727272727272727002727272727272727270C14242020
          101020201C0C24242727272727271F201C0C1426132727272323122426272727
          2709100A1C20200C1C0C14090A24272727171C220E1C1A2727272727181F2709
          14272727270E120A1E1C24120C16230F1E221327272727272727272727271520
          272727272727271B1611242727272727272727271F0C0C0E1E261E1626092612
          142727272727272727270C0C19270F241E272727272727272727272727270E0E
          1521110909091919111A24272727272727272727182427270D1C272727272727
          27272727272727121E1E0926190D1B1727271A1C27272727272727272727180C
          2727272715190909151412272727141A241D10272727272710140B090A0A2727
          2727271F100E272727271E2412160E0C27272727270E0E1D15262222240A2212
          221A151E27272727272727272727272727272727272727272727272727272727
          27002727272727272727270C141A201010202020140C140A2727272727271320
          0A121D27272727272727091A1E2727272719201A0C1C0C0C24201A110A0A2727
          27211422260A1A272727272726260F0E2427272727200A1E121416190A0B2313
          261A272727272727272727272727152027272727272727272726142727272727
          272727271F0C1A21230F1B15151D1E1A142727272727272727270C200F272724
          0E27272727272727272727271714211D0D212121210D250B1B1A242727272727
          27272727181A27270F14272727272727272727272727131E1209190909191121
          15271A1C27272727272727272727181C2727272727252609191412272727200A
          111E1027272727270E0C0A1F110C27272727271710221727272727271D111A1C
          2727272724242121191116220A240A0922151427272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C221020
          202020201A1C240A2727272727270F0C1E1E2727272727272727170B16272727
          27192022200A0A14220C11150A0A2727271A1215211A1A2727272727270C2722
          141D272722140A0E1A1226150B0F131B230A2727272727272727272727271D20
          27272727272727272719142727272727272727271F0C1B272727272727272722
          242727272727272727270C202727270A0E27272727272727272727271C1B111B
          0F171F1F0B1B1D0D0D1A14272727272727272727181E27272714272727272727
          2727272727271E220D0D0D250B0B0B1B1D21121C27272727272727272727080C
          2727272727272719261412272727181C0E1E1027272727272710222323202727
          27272717100E172727272727270D121C2727270D24161626262619190B1D0D1D
          09141F2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C1C0E20202020200C1624140A2727272727271524
          271D2727272727272727151D212727272709200E201C161E211C15231A0A2727
          271C0E2713220A2727272727270C12241C26272710241E1A0A1611220F17130F
          23262727272727272727272727271514272727272727272727211C2727272727
          272727271F0C27272727272727272719142727272727272727270C0C27272724
          0E27272727272727272727090B1D272723250D11090909092612142727272727
          2727272718192727271C272727272727272727271724161F0F0B250D21211921
          1325121C27272727272727272727181C272727272727271F1924122727270C1E
          09222027272727272720210A1D2427272727271710212727272727272727161C
          2727270E22150D0D1523130B1327272719112727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C222020
          2010200C090A140A2727272727270E0A27272727272727272727261E1B272727
          2709200E0C141E19270A13230A0A272727100E2727220A2727272727270A121A
          140A272720241224121927111F232313151D272727272727271D0F2327210C1A
          27272727170F1B1D21210C20210B1B13272727271F0C27272727272727272715
          142727272727272727271C20272727240E27272727272727272717111D272727
          272727231B0B1D11191214272727272727272727182127272714272727272727
          272727271C090D1109090926262626261113121C272727272727272727271814
          27272727272727272724122727151227250A20272727272727261A13231D2727
          27272717101B2727272727272727231C27270A142727272727272727271F2715
          2427272727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C140E20201020200C1112240A2727272727271C1A
          1527272727272727270E1E1E272727272709201E1A24121627211713140A2727
          0D240B2727220A272727272727131717171F27250C1A1A1C2226270D1F232323
          2627272727272727271C140A241E191212120E0E0E162609262624261A0A240A
          272727271F0C27272727272727272727142727272727272727271C1C2727270A
          0E272727272727272727220B2727272727272727272727272712142727272727
          27272727100D2727271427272727272727272711091727271723232521190909
          11210A1C272727272727272727271824272727272727272727241227271C1227
          0F0E202727272727272723131B1B27272727271710232727272727272727171C
          2709242727272727272727272727271427272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1C0E2020
          20202020260E0A0A272727272715121727272727272727270D11271B27272727
          27090C160A141C14271727270A0A27151E15272727160A272727272727272727
          272727141A1E141C2616270D0F230F230A27272727272727271C0D2727272727
          27272727272727272727272727272724272727271F1C27272727272727272727
          142727272727272727271C1A272727220E27272727272727270C272727272727
          2727272727272727270A24272727272727272727100D27272724272727272727
          27271419272727272727272727271B192127241C27272727272727272727101A
          2727272727272727270A22270E14272727272027272727272727272727272727
          2727271F101327272727272727271B120E24170F1B150D0B2727272727271427
          2727272727272727272727272727272727272727272727272727272727272727
          2700272727272727272727201C1E2020202020200E1E0A0A27271727160C2711
          2727272727272727272719272727272727090C1E0A140C0C111527270E0E241C
          1F27272727190A2727272727272727272727272012120C0C1E092311230F1F13
          1427272727272727271C14220E16111119211D150B0B231F0F0B25150B151224
          272727271F1C27272727272727272727142727272727272727271C0A2727270E
          1E27272727272727162327272727272727272727231527272724142727272727
          27272727182127272724272727272727272519272727272727272727271D090A
          09130A1C27272727272727272727181227272727272727272712140C1E211F27
          272720272727272727272727272727272727271F1013272727272727270B211D
          261B0B0D191E1E191D27272727240F2727272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727270C1A0E2020
          202020201A220C180C20200C0E0F272727272727272719272713272727272727
          2719141E24140C0C160927271E0C0D271727272727190A272727272727272727
          272727101A12200C22192109230F1F131427272727272727270E2222220E0E0E
          22121A1A1A1A221E0E0E22121A121A0A272727271F2427272727272727272727
          142727272727272727271C0A2727270E1E272727272727131D1F272727272727
          27270B1121141D2717141427272727272727272710192727270A272727272727
          27262727272727272727271509261A0E1E191A1C272727272727272727270822
          2727272727272727270D272725231F0F231F2027272727272727272727272727
          2727271F201B27272727271F211E16111A261E121A0A121E21131F0F0A242727
          2727272727272727272727272727272727272727272727272727272727272727
          270027272727272727272720120E20101010202020241C202226162717132727
          27272727251D2723152727272727272727110A1E240A220E1E1E232627272727
          27272727270F0A272727272727272727272727101A0A200C1A0926260F0F0F15
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272727271F142727272727272727271C1A27272716
          1E2727272727130E27272727272727170B0D1121260C091D0914142727272727
          27272727101E2727271A27272727271F1A23272727272727270D09262616231E
          1A1A221C272727272727272727271822272727272727272727272727130D261E
          0E211A272727272727272727272727272727271F1C1527272727270B26121A0E
          0A0A0A1A241A12260D230F232719141027272727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012221010
          2014241A221E1A24190A11272727272727272716270D22252727272727272727
          27110A22241A0E22151E271F112523272727272727131A272727272727272727
          272727201424200C240E0E26130F0F151C272727272727272727272727272727
          27272727272727272727272727272727272727271F12272727272727270F2525
          14272727272727272727141A272727090E272727271F1C27272727270F0B250B
          2525151D271C16160A0A2427272727272727272710122727271A272727272714
          15272727170B11091E16262626092026141C161C27272727272727272727081A
          27272727232509161E1E0E22221212121A091627272727272727272727272727
          2727271F14191F1D261E0E0A141414220E26112224141414142426130B27270E
          1A13272727272727272727272727272727272727272727272727272727272727
          27002727272727272727272012122020100C1C0A0A2414202220241F27272727
          2727170F1C1C1927272727272727272727110A1A0A120E22250E1F151B232116
          16110B2727130A2727272727272727272727270C0C0A0C0C0C12121123230F1D
          1427272727272727272727272727272727272727272727272727272727272727
          2727272717122727272727272723211D142727272727272727271C2427272711
          1E272727271C272727271713251525230F231B271614220A1C1A242727272727
          27272727101A2727271A272727271F1D2727271D0E0A0A221E162626221E1826
          0C1C091C2727272727272727272708242727270F0B1D16222212270B1E0A0A0A
          240919272727272727272727272727272727271F1C26271F0B2121111111240E
          2727272727272721220A1C1C090B2327191C2727272727272727272727272727
          2727272727272727272727272727272727002727272727272727272012122020
          20200C201A1C171C0C1422240E0A1E15172713130F0E0C182727272727272727
          270D0A0A240C20201214252619140C201A16092527250A272727272727272727
          2727271A2012200C201A1A261313131514272727272727272727272727272727
          2727272727272727272727272727272727272727171A272727272727271F1D15
          242727272727272727271C14272727150E272727190F1F272727231B25150B0F
          1F13270B121C0A1C1C1624272727272727272727101A27270F1A2727271F1C27
          2725161A2414141A1E1626160B23180E1C1C211C27272727272727272727181C
          27272717171F1B21191C1A26270B192224091E27272727272727272727272727
          2727271F142225150D1926091911241A171B0B21121621271B260E241C091B27
          27220C2727272727272727272727272727272727272727272727272727272727
          27002727272727272727270C121A1020101020201A1C1D14121C0C2020121116
          21172727131B0D0C1C27272727272727271D24240A202020120C160E190A1F20
          101216090D0D0A2727272727272727272727270E200E0C0C2014120E0B25151D
          1427272727272727272727272727272727272727272727272727272727272727
          272727271712171F132727270F1F0B2514272727272727272727141C2727270B
          1E272713090F0F0F230F0B1D0D211D1B232721271A140A0C1415242727272727
          27272727101A27270B1A272727242315211916221A0A0A12161619271B271812
          1C0C211C27272727272727272727180C131511191D251D19111C221E141E0E24
          1C090A272727272727272727272727272727271F1C1A2111260E120E16262414
          272727272727140A2719091A1C140B132727240A272727272727272727272727
          27272727272727272727272727272727270027272727272727272720220A1020
          1010200C121C261A2727271518101C191E260D1B0F2325250C0E272727272727
          270D2424240C202012201A1A262427270820161E16110A272727272727272727
          272727152016200C201C1A221921110D14272727272727272727272727272727
          27272727272727272727272727272727272727271712190919251B1D0D0B0B0D
          14272727272727272727140C2717171B1E271F14271B1B1B1B1519090909111D
          270B1F271224120C141514272727272727272727100A17271D1A272721212121
          0D2111260E1A1A12160927152727181A1C0C1D1C27272727272727272727180C
          21090E2216261E12161C0E270E0C12241C091427272727272727272727272727
          2727271F1C240926262214142424241C27272727272727202409160E1214250F
          270F0D0C27272727272727272727272727272727272727272727272727272727
          2700272727272727272727200E14102010102020121C0E1A272727272710100A
          091E1E161E152521141427272727272727112414141C20201A20140A1E242727
          112022161E111A27272727272727272727272727101A240C20201A1E22220E16
          141D27272727272727272727272727272727272727270B220E0E262727272727
          2727272717120A1A1A220E221E190D2614272727272727272727140C23151513
          1E270C27231B2511261E1E161626090B272527271A0A120C2425242727272727
          27272727100A0D1F211A27251E1511210D0D2126162212121E2321272727180A
          1C0C0B1427272727272727272727180C0E120A1A1E260E1A0E240E2727182412
          1C090C272727272727272727272727272727271F1414220E161E141C141C1214
          272727272727271F20262609260E260F1F171F21212727272727272727272727
          272727272727272727272727272727272700272727272727272727200E0C1020
          102020201214220A272727272727181C11221A0A2422190909141A2727272727
          2719241C1C140C201A201C241624272727180A0E0E091A272727210C0C202227
          27272727100C121C0C201A0E24140A1A141E2727272727272727272727272727
          2727272727270A1927211A27272727272727272717121C1C141414140A0E2622
          14272727272727272727140C190E26130E12271325090E1A0A1A220E0E1E2627
          25272727120A221C241B2427272727272727272718240E1D191A0F140F092609
          11212119260E22221B1117272727180A1C0C1B1427272727272727272727181C
          0A24240A1E092612220A0E2727241C1C14261C272727270C1C0C141F27272727
          2727271F141C0A121E1E24141C140E1A2727272727272727180E192616121613
          0F0D17231C272727272727272727272727272727272727272727272727272727
          270027272727272727272720220C10102020202012140E0A2727272727271420
          220A1C0C0C1C1414241A1C27272727272719241C0C240C0C0A200C1C260A2727
          27100C1A1A211A272727241527221A27272727271E0C0E240C201A241A1C1C24
          0A1C27272727272727272727272727272727272727270C272222242727272727
          27272727171A0C0C0C0C0C0C1C0A1E1A1427272727272727272714201A1A1A23
          0E271D1922241414241A22220E1E271127272727220A0E1C2413242727272727
          2727272718141A16161A0C271E22221E0911211109160E0B171B27272727180A
          1C0C1D1427272727272727272727181C1424240A1619091E2212222727230C0C
          141E0A27272727121B270C1F2727272727272717241C140A0E1E0A1414142622
          272727272727272718121116160E220D0F1227150C2727272727272727272711
          1C1615130D190A141F2727272727272727002727272727272727272012201010
          101020201A141E0A2727272727271D10141C2020202020202011242727272727
          2709240C200A1C200A0C200C192427272712201424150A272727102709141A27
          27272727270C0A0A140C0A200A240C1C1E0C2727272727272727272727272727
          272727272726191D1E122427272727272727272717240C1C0C0C1C1C1C140E0A
          1427272727272727272714201C1424231E0D12241C1C1C14241A12220E270F27
          272727270E0A22140A1D242727272727272727271814141A220A27120A0A0A22
          1E0911210916192725272727272718241C0C091427272727272727272727180C
          2424241A1611111612220E2727271814241E1A2727270F141426201F27272727
          2727271F141C140A0E161A241424160927272727272727271C0A11160E1A1216
          0B1A1F110C272727272727272727241609191119221A14161D0C272727272727
          2700272727272727272727201A0C101010100C201A1C16242727272727270B20
          241C202020200C2020241A132727272727260A1C200A14200A0C0C0C11242727
          27161C0A24130A27272710121C140A2727272727271420220A141420140A140C
          0914232727272727272727272727272727272727270C271E0E1A242727272727
          2727272717140C0C0C0C1C0C1C14222414272727272727272727240C1C1C1C26
          27141C1C1C1C1C14240A122227271B2727272727222412240A21142727272727
          27272727101C1C141A0F0A14141424120E1619190916270D2727272727271814
          1C0C1E1427272727272727272727180C240A0A1A162121160A0E222727270816
          140E222727270E2114220A1F272727272727271F140C14242216122424242419
          27272727272727272414091E120A120E250A211A0C2727272727272709221A15
          26161F27271F1E2319110E09272727272700272727272727272727200A0C1020
          202020200A1C1E242727272727271320140C202020202020201C1A2327272727
          2726240C0C0A1420240C200C0D2427272715140D260F242727260A140C122427
          27272727272718142414240C1A0C24140A241A27272727272727272727272727
          27272727112616120E122427272727272727272717140C0C1C0C1C0C1C1C1214
          14272727272727272727240C0C0C1C0F1C1C1C1C1C1C1C1C240A121727252727
          2727272712141A0A0A2624272727272727272727101C1C1C0A221C141414140A
          121E260926270F272727272727271814141C121C27272727272727272727180C
          0A1A0A1A1E1111160A22222727271023191D112727271426141A091F27272727
          2727271F1C0C142412260E0A240A14162727272727272727200C260E24241222
          0D241A24142727272727272212232123161B2727170D1A2723271D250E272727
          27002727272727272727272024201020200C2020241C0D242727272727271120
          0C0C202020200C2020141227272727272726240C0C241420141C0C20110A2727
          27270E161E122427272019140C2624272727272727271A20221C14121C0C0C14
          1C0E2427272727272727272727272727272727230C270A24220A242727272727
          27272727271C0C0C0C0C0C0C1C1C1A1414272727272727272727240C0C0C0C1C
          0C0C0C1C1C1C1C1C140A11271527272727272727121C0A1A0A0E142727272727
          27272727100C1C1C141C1C14141C1424120E1609271B1F27272727272727180C
          140C0A1C27272727272727272727180C0A0A1A121E111116240E122727272011
          1D252627271F201C140A0D1F272727272727271F1C0C14241A161E1A1A1A1C1A
          2727272727272727180C162214240A1A191A1414142727272727150A271D191D
          151D1D211127091E20232323161D272727002727272727272727271024202010
          20202020240C0D24272727272727142614202020202020201416122727272727
          2716140C0C141C201C0C2020090A272727271B131313132721241E0C0C220A27
          27272727272727180C240C1424240C0C1C091C24272727272727272727272727
          2727271A271A1C24222424272727272727272727271C0C20200C0C0C0C1C0A14
          14272727272727272727241C1C1C1C1C0C0C0C0C0C0C1C140A12271F27272727
          27272727120C241A0A2214272727272727272727200C1C1C1C1C14141424241A
          120E160F0F252727272727272727180C140C1A1C27272727272727272727180C
          0A1A1A120E091116242222272727270F0F0F0F27271D141C1424221F27272727
          2727271F0C0C14141A1616121A1A141C272727272727272718261A0A140A1A1A
          220A1A241D27272727271C2727271F150D0D152509242619160E1E0F1A242727
          2700272727272727272727201420201020102020141C0E0A2727272727170C0B
          122020102020202012272227272727272716140C0C141C0C0C0C2020160A2727
          272727272727270B200F240C20240A27272727272727272718140C0C0C0A140C
          0C0C092023272727272727272727272727270E251E1C1C2412140A2727272727
          272727271B0C0C20200C0C0C0C1C241C142727272727272727270A1C0C1C0C0C
          1C0C0C0C0C1C1C241A250F2727272727272727271A200A1224221C2727272727
          27272727201C1C141C1C1C1C1C24241A121E21271D272727272727272727100C
          141C0A0C27272727272727272727180C0A0A1A120E09191E2422122727272727
          272727271312122424240A1F2727272727272715200C14141A1E09221A1A240C
          27272727272727231C192414141A0A1A12141A24272727272720131F0E27270E
          1E16160F1F26272727271B27170B0A27270027272727272727272720140C1010
          10102020141C1A1A2727272709200D09202020202020201C2709272727272727
          2719200C200C0C1C0C1C0C200E0A2727272727131B151C0909240C0C0C140A27
          272727272727272727180C1A1C0C1C1C0C1C0C0D0C2427272727272727272727
          1524231A1C0C1C141A1C242727272727272727271B0C0C0C0C0C0C1C1C1C1414
          2427272727272727272724141C0C0C0C0C0C0C0C1C1C0A1A2709272727272727
          27272727101C1A12141E0C2727272727272727270C1C141C1C1C0C1C240A0A0A
          221F131527272727272727272723100A1C0C1A0C27272727272727272727180C
          0A1A1A1A1216090E0A0E12272727271B1B21142417141A241A240C0F27272727
          27272715101C14241A1E191E1A0A1610272727272727212226141414121A2424
          0A16111727272727171427122727141612160F1B0A130F27271A270C21171E27
          2700272727272727272727200A0C2020102020201C240A2627160E200C092620
          10101020200C0C2727152727272727272724141C201C1C1C20140C2022102020
          10200C0C1C1D09091C0C200C1C241A272727272727272727272710200E1C140C
          0C0C0C0C210C101D272727272727231E1C27141C1C1C1C142414242727272727
          2727272709140C0C0C0C0C1C0C1C1424140D27272727272727111C091C0C0C0C
          0C1C1C1C1C240A23231B27272727272727272725141A2222141C1C1C27272727
          2727172216241C1C1C0C1C14240A0A12092715272727272727272727271D1222
          1C0C0A0A20272727272727272727100C1A1A0A1A2226091E241614140C0C1C24
          1A2527121A1A0A1A14240A0F2727272727272719101C24241216191E121A1110
          1B1B1126140C091914140A1A0E24242422272527272727271023211A27271E1A
          241A0F14091E0D271127271F1A1D1D16270027272727091A1224202009201020
          101020200C0A1A0820141A26191410202020200C1C0A2727112727271E12120E
          1C20111C1C1C20202014200C200C1426161616260E0A1C0C200C1C1414161A27
          2727272727272727272727240C0E1C120C0C0C0C201A1E0C2010120A1C100C0B
          111A141C1C1C1C1424120A272727270E2222221A1C1E0C0C0C0C1C1C1C14141A
          12201C220E0C22121C1A151C1C0C0C0C0C0C0C140A141E27152727272727271A
          0E221C14271609220A24191C0C0C181E160C1C251E242414141414240A1A1A22
          270F2727272727271B1E12141C0D1E0A1C1C241D0A20140C1C220E221E141912
          0A1A0A1A1A120E1E160F0F130B151D21121A121A0A121E241414121F27270A22
          0E1E1C140E0A1A0E0911260E121A21252619090B1B260A121A0A121614141426
          27262727272727271409161A27271E2414141314240A1B271E27272714111F14
          27002727272710121A20201C1420201C1C0C2010100C200C2616141010200C1C
          0C20200C17230921272727270C0A220C201E221A240C201C0A1A24201C1C0C0C
          0C2020202020200C1C142424240F0A27272727272727272727272727220C141E
          1E1A1A1C0C0C0C0E1B231D0B1509190A0C1C142327270C0A0A220A2727272712
          0E111926091A0A0A0A0A0A0A1A121A0A220D15152624140B11191C1C0C0C0C0C
          0C140A141C142721272727272727271027171F132619090E1A0A242619211E0C
          0F0F1D0A1C141414140A1A120A1414271617272727272727130E271F131A241C
          1C141C1411152317140A231F170F0A14240A220E1E2609091119261E1A24141C
          1C1C1C0A2216161414141E0F27271C1E2727271D1E161E1E1E160926160E1911
          0916221A0A0E0909161A24140A1A27150D272727272727271424120927271E14
          14141F0A14142319272727270C21171A270027272727200A2010102020202020
          0C1C241C1C0A091A151512121A1A161E21231F1722220B27272727271C241C20
          200C1C1C201C201C200C090C20200C0C1C1C1C1C14141C1C0C20202020271A27
          272727272727272727272727272324141E09121A12121A1C0C2020200C0C0C0C
          14272721121C0A121A190A27272727120A141C0C1C1414141414140C1C1C1C14
          140A1A220E20201C0C0C1C1C14242424141C0C0C1C270E1B2727272727272710
          2422220E1609190916121A0A0A1A1C101C1C1C1C1C140A24141C1C1C1C1C0A16
          1B2727272727272713201A161E221A241414241A22161A0A0C100A0A0A0A1A12
          220E0E221E2611211D151D0D11092626161616161E120A1C14241D0F27271C14
          1A0E1E1E1E1E0E1626091111210D211926221A0A24141414141A160B271F1E0B
          272727272727272714242411272716141414150A141A0F27242727270C1B2726
          2700272727270C0A1020202010202020200C0C0C0C24120D2727251513231526
          1622240A1D1B2727272727271C240C202020200C0C241414140A151B27272727
          27272727272727272727272727270A272727272727272727272727272727270B
          0C241A2527231515210D211D151B2727271622190B1318260A0F0A2727272712
          1A0A22191D27272727272727272727272727272727151C0A0A1E252727272727
          2727272727221D2727272727272727202727272727272727272727271F230B20
          12191B272727272727272727272727252727272727272727131C272727272727
          2727170F23250B1F160C251F2727272727272727272727272727272727272727
          27271F0F1F13251B13271F1F27271C0C27272727272727272727272727272727
          272727271727172727171F270D15272727272727272727271C1A142627271624
          1414111A2709162727222727101D272427002727272722220A0A0A0A0A0A0A0A
          0A0A0A1A0A0A0A0A0A0A0A240A1A1A12261D25272727272727272727121E1212
          12222222222212121A1A1A1A0A0A0A240A1A120E0E2222121A1A0A2424241A27
          2727272727272727272727272727272727151A1C0A1222261B25150D0D1E0A1A
          261527272727081B272724272727272216220E0E160909090926160E22221222
          2222121A0A1422161E0E220E0E0E0E0E220E222222192727272727272727270A
          0E22222222220E0E0E0E0E0E1E0E2422260919111909161616161E0E0E222227
          2727272727272727131E162616161616162626090909091922261D1D0D211111
          191921210D21211111211111112111210D0D1D0D0D0D0D1D1D1D190F27271C25
          151D1D1D250B0B0B152515151D1D1D0D0D0D0D0D0D2119261119251B27272727
          27272727272727271412241C27272624141C210F140D261D272227271009270A
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727230B11090E1E1E26161D252727272727272711111121112727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272710240A1227272624
          141C090F26092621271627272417171527002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272711241A0A162724141414220F19112621231427121D1F2427
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272714220A22241214
          141C111222241A26160F271C15111A2727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727271212160D1224141424240A221609272527142219222727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          27272727272727272727272727272727272727272727272727271C250A1A120B
          151D151D0D112527270A1A19121D272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727121B24091419272727272727241E0A160E1E272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272722272422
          1B110A14240E1124121A091E2727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727270A0F1E240A121E262624242213132727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727271716
          272713251D13270B112727272727272727002727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727152119112327272727272727272727
          2700272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          2727272727272727272727272727272727272727272727272727272727272727
          272727272727272727272727272727272700}
        mmHeight = 2910
        mmLeft = 223573
        mmTop = 265
        mmWidth = 16404
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
        mmLeft = 240507
        mmTop = 0
        mmWidth = 18785
        BandType = 0
      end
      object PpPnListVers: TppLabel
        UserName = 'RN_VERS'
        Caption = '3.1.01'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 4
        Font.Style = []
        Transparent = True
        mmHeight = 1588
        mmLeft = 262203
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
        mmLeft = 240771
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
        DataField = 'PN$_DATE'
        DataPipeline = PipPnList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 89694
        mmTop = 0
        mmWidth = 29104
        BandType = 4
      end
      object PpSumm1: TppDBText
        UserName = 'DBText6'
        Alignment = taRightJustify
        DataField = 'PN$_SUMM'
        DataPipeline = PipPnList
        DisplayFormat = '#0.00 руб'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object ppDBMemo91: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'PN$_NUM_FULL'
        DataPipeline = PipPnList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 13494
        mmTop = 0
        mmWidth = 24342
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object PpKln_Org: TppDBMemo
        UserName = 'PpKln_Org'
        CharWrap = False
        DataField = 'KLN_ORG'
        DataPipeline = PipPnList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 61913
        mmTop = 0
        mmWidth = 27252
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo93: TppDBMemo
        UserName = 'DBMemo93'
        CharWrap = False
        DataField = 'PN$_OSN'
        DataPipeline = PipPnList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 210873
        mmTop = 0
        mmWidth = 30956
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'SKL_SHORT'
        DataPipeline = PipPnList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 190236
        mmTop = 0
        mmWidth = 19844
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
        DataPipeline = PipPnList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 242359
        mmTop = 0
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
        Transparent = True
        AutoSize = True
        Picture.Data = {
          07544269746D6170E6000000424DE60000000000000076000000280000000C00
          00000E0000000100040000000000700000000000000000000000100000000000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF00F0000000000F00007FFFFFFFFFF000007FFFDDFFFFF000007FFF1DDFFFF0
          00007FF111DDFFF000007F11F11DFFF000007FFFFF17DFF000007FFFFFF1DDF0
          00007FFFFFFF1DF000007FFFFFFFF1F000007FFFFFFFFFF000007FF000000FF0
          0000F770FDDD077F0000FFFF7777FFFF0000}
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 266171
        BandType = 4
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = 'KLN_PREFIX'
        DataPipeline = PipPnList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 265
        mmWidth = 8996
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo5'
        CharWrap = False
        DataField = 'OWNER_FULL'
        DataPipeline = PipPnList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 38365
        mmTop = 0
        mmWidth = 23019
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PN$_DATE_OPL'
        DataPipeline = PipPnList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 119327
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object PpSumm2: TppDBText
        UserName = 'PpSumm2'
        Alignment = taRightJustify
        DataField = 'PN$_SUMM2_ALL'
        DataPipeline = PipPnList
        DisplayFormat = '#0.00 руб'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 169069
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText4'
        Alignment = taRightJustify
        DataField = 'PN$_KURS'
        DataPipeline = PipPnList
        DisplayFormat = '#0.000'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 134673
        mmTop = 0
        mmWidth = 12965
        BandType = 4
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
        mmWidth = 266701
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
        DataPipeline = PipPnList
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
        Caption = 'приходных накладных на сумму'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 15875
        mmTop = 1588
        mmWidth = 47625
        BandType = 7
      end
      object ppDBCalc40: TppDBCalc
        UserName = 'DBCalc4'
        Alignment = taRightJustify
        DataField = 'PN$_SUMM'
        DataPipeline = PipPnList
        DisplayFormat = '#0.00 руб'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 1588
        mmWidth = 22225
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        Alignment = taRightJustify
        DataField = 'PN$_SUMM2_ALL'
        DataPipeline = PipPnList
        DisplayFormat = '#0.00 руб'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 169069
        mmTop = 1588
        mmWidth = 20902
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc3'
        Alignment = taRightJustify
        DataField = 'PN_WEIGHT'
        DataPipeline = PipPnList
        DisplayFormat = '#0.00 кг'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 225425
        mmTop = 1588
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label10'
        Caption = 'Масса: '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Cyr'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 203730
        mmTop = 1588
        mmWidth = 10583
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
    Left = 500
    Top = 143
    object MemFrmFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
    end
    object MemFrmFRM_NAME: TStringField
      FieldName = 'FRM_NAME'
      Size = 128
    end
  end
  object MemPnVid: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'PNVID_ID'
        DataType = ftInteger
      end
      item
        Name = 'PNVID_NAME'
        DataType = ftString
        Size = 250
      end>
    Left = 586
    Top = 139
    object MemPnVidPNVID_ID: TIntegerField
      FieldName = 'PNVID_ID'
    end
    object MemPnVidPNVID_NAME: TStringField
      FieldName = 'PNVID_NAME'
      Size = 250
    end
  end
  object MemOwner: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'OWNER_ID'
        DataType = ftInteger
      end
      item
        Name = 'OWNER_NAME'
        DataType = ftString
        Size = 128
      end>
    Left = 670
    Top = 139
    object MemOwnerOWNER_ID: TIntegerField
      FieldName = 'OWNER_ID'
    end
    object MemOwnerOWNER_NAME: TStringField
      FieldName = 'OWNER_NAME'
      Size = 128
    end
  end
  object DsFrm: TDataSource
    DataSet = MemFrm
    Left = 502
    Top = 195
  end
  object DsPnVid: TDataSource
    DataSet = MemPnVid
    Left = 582
    Top = 199
  end
  object DsOwner: TDataSource
    DataSet = MemOwner
    Left = 670
    Top = 197
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 292
    Top = 205
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 298
    Top = 263
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 408
    Top = 193
    object MnPnNakl: TAction
      Caption = 'Показать подчиненные документы...'
      Hint = 'Показать подчиненные документы...'
      ImageIndex = 145
      OnExecute = MnPnNaklExecute
    end
  end
  object MemSkl: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'SKL_ID'
        DataType = ftInteger
      end
      item
        Name = 'SKL_FULL'
        DataType = ftString
        Size = 250
      end>
    Left = 504
    Top = 257
    object MemSklSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
    end
    object MemSklSKL_FULL: TStringField
      FieldName = 'SKL_FULL'
      Size = 250
    end
  end
  object DsSKL: TDataSource
    DataSet = MemSkl
    Left = 502
    Top = 311
  end
  object QrPnList2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PnListTranSaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from list_pn2$(:DT1,:DT2,:PNTYP_ID,:FRM_ID,:PNVID_ID,:P' +
        'N_OWNER,:SKL,:kln_id)'
      'where pn$_docs <> '#39'ТТН Сч.фактура'#39
      '')
    Left = 82
    Top = 281
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
        DataType = ftInteger
        Name = 'PNTYP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FRM_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNVID_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PN_OWNER'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'SKL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kln_id'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'PN$_ID'
      Origin = 'LIST_PN$.PN$_ID'
    end
    object IBStringField1: TIBStringField
      FieldName = 'PN$_PROW'
      Origin = 'LIST_PN$.PN$_PROW'
      FixedChar = True
      Size = 1
    end
    object IBStringField2: TIBStringField
      FieldName = 'PN$_NUM_FULL'
      Origin = 'LIST_PN$.PN$_NUM_FULL'
      Size = 74
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'PN$_DATE'
      Origin = 'LIST_PN$.PN$_DATE'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'PN$_DATE_OPL'
      Origin = 'LIST_PN$.PN$_DATE_OPL'
    end
    object IBStringField3: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'LIST_PN$.SKL_SHORT'
      Size = 32
    end
    object FloatField1: TFloatField
      FieldName = 'PN$_SUMM'
      Origin = 'LIST_PN$.PN$_SUMM'
      DisplayFormat = '#0.00'
    end
    object FloatField2: TFloatField
      FieldName = 'PN$_SUMM2'
      Origin = 'LIST_PN$.PN$_SUMM2'
      DisplayFormat = '#0.00'
    end
    object IntegerField2: TIntegerField
      FieldName = 'PN$_COLOR'
      Origin = 'LIST_PN$.PN$_COLOR'
    end
    object IBStringField4: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'LIST_PN$.US_FULL'
      Size = 32
    end
    object IBStringField5: TIBStringField
      FieldName = 'PNVID_NAM'
      Origin = 'LIST_PN$.PNVID_NAM'
      Size = 64
    end
    object IBStringField6: TIBStringField
      FieldName = 'OWNER_FULL'
      Origin = 'LIST_PN$.OWNER_FULL'
      Size = 32
    end
    object IBStringField7: TIBStringField
      FieldName = 'KLN_ORG'
      Origin = 'LIST_PN$.KLN_ORG'
      Size = 64
    end
    object FloatField3: TFloatField
      FieldName = 'PN$_KURS'
      Origin = 'LIST_PN$.PN$_KURS'
      DisplayFormat = '#0.00 р/$'
    end
    object IBStringField8: TIBStringField
      FieldName = 'KLN_PREFIX'
      Origin = 'LIST_PN$.KLN_PREFIX'
      Size = 32
    end
    object IBStringField9: TIBStringField
      FieldName = 'PN$_NUM'
      Origin = 'LIST_PN$.PN$_NUM'
      Size = 32
    end
    object FloatField4: TFloatField
      FieldName = 'PN$_OST'
      Origin = 'LIST_PN$.PN$_OST'
    end
    object IBStringField10: TIBStringField
      FieldName = 'PN$_OSN'
      Origin = 'LIST_PN$.PN$_OSN'
      Size = 64
    end
    object IntegerField3: TIntegerField
      FieldName = 'PN$_NAKL_MET'
      Origin = 'LIST_PN$.PN$_NAKL_MET'
    end
    object IntegerField4: TIntegerField
      FieldName = 'WOZW_MET'
    end
    object FloatField5: TFloatField
      FieldName = 'PN$_SUMM2_ALL'
      Origin = 'LIST_PN2$.PN$_SUMM2_ALL'
      DisplayFormat = '#0.00 р'
    end
    object FloatField6: TFloatField
      FieldName = 'NDS_SUMM_ALL'
      Origin = 'LIST_PN2$.NDS_SUMM_ALL'
      DisplayFormat = '#0.00 р'
    end
    object IBStringField11: TIBStringField
      FieldName = 'PN$_STFAKT'
      Origin = 'LIST_PN2$.PN$_STFAKT'
      Size = 50
    end
    object IBStringField12: TIBStringField
      FieldName = 'PN$_PRIM'
      Origin = 'LIST_PN2$.PN$_PRIM'
      Size = 254
    end
    object StringField1: TStringField
      FieldName = 'PN$_DOCS'
      Size = 32
    end
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnGetValue = frReport1GetValue
    Left = 32
    Top = 253
    ReportForm = {
      18000000C60D0000180000000001000100FFFFFFFFFF090000009A0B00003408
      0000240000005A000000240000002400000001FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000C005265706F72745469746C65310002010000
      00005C0000002F0400002A0000003100000001000000000000000000FFFFFF1F
      00000000000000000000000000FFFF0000000000020000000100000000000000
      01000000C800000014000000010000000000000200380100000D004D61737465
      724865616465723100020100000000B40000002F040000120000003000040001
      000000000000000000FFFFFF1F00000000000000000000000000FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200A80100000B004D6173746572446174613100020100000000DC0000002F04
      0000120000003100050001000000000000000000FFFFFF1F0000000005005BCD
      E5F25D00000000000000FFFF0000000000020000000100000000000000010000
      00C800000014000000010000000000000200150200000D004D6173746572466F
      6F7465723100020100000000640200002F040000200000003000060001000000
      000000000000FFFFFF1F00000000000000000000000000FFFF00000000000200
      0000010000000000000001000000C800000014000000010000000000000000C6
      02000005004D656D6F3100020024000000DC000000600000001200000043000A
      0064000000000000000000FFFFFF1F2E020000000000010033005B5172506E4C
      697374322E224B4C4E5F505245464958225D205B5172506E4C697374322E2250
      4E245F4E554D5F46554C4C225D00000000FFFF00000000000200000001000000
      000500417269616C000800000000000000000000000000CC00020000000000FF
      FFFF00000000020000000000000000005A03000005004D656D6F320002008400
      0000DC000000500000001200000043000A0064000000000000000000FFFFFF1F
      2C000102000000010016005B5172506E4C697374322E22504E245F4441544522
      5D00000000FFFF00000000000200000001000000000500417269616C00080000
      0000000000000000000000CC00020000000000FFFFFF00000000020000000000
      00000000ED03000005004D656D6F33000200D4000000DC000000A00000001200
      000043000A0064000000000000000000FFFFFF1F2E020000000000010015005B
      5172506E4C697374322E224B4C4E5F4F5247225D00000000FFFF000000000002
      00000001000000000500417269616C000800000000000000000000000000CC00
      020000000000FFFFFF00000000020000000000000000008304000005004D656D
      6F3400020074010000DC000000640000001200000043000A0064000000000000
      000000FFFFFF1F2E020000000000010018005B5172506E4C697374322E224F57
      4E45525F46554C4C225D00000000FFFF00000000000200000001000000000500
      417269616C000800000000000000000000000000CC00020000000000FFFFFF00
      000000020000000000000000001805000005004D656D6F35000200D8010000DC
      000000440000001200000043000A0064000000000000000000FFFFFF1F2E0200
      00000000010017005B5172506E4C697374322E22534B4C5F53484F5254225D00
      000000FFFF00000000000200000001000000000500417269616C000800000000
      000000000000000000CC00020000000000FFFFFF000000000200000000000000
      0000AC05000005004D656D6F360002001C020000DC0000004400000012000000
      43000A0064000000000000000000FFFFFF1F2E020301000000010016005B5172
      506E4C697374322E22504E245F53554D4D225D00000000FFFF00000000000200
      000001000000000500417269616C000800000000000000000001000000CC0002
      0000000000FFFFFF00000000020000000000000000004006000005004D656D6F
      3700020060020000DC000000E00000001200000043000A006400000000000000
      0000FFFFFF1F2E020000000000010016005B5172506E4C697374322E22504E24
      5F5052494D225D00000000FFFF00000000000200000001000000000500417269
      616C000800000000000000000000000000CC00020000000000FFFFFF00000000
      02000000000000000000D406000005004D656D6F3800020040030000DC000000
      700000001200000043000A0064000000000000000000FFFFFF1F2E0200000000
      00010016005B5172506E4C697374322E22504E245F444F4353225D00000000FF
      FF00000000000200000001000000000500417269616C00080000000000000000
      0000000000CC00020000000000FFFFFF00000000020000000000000000008207
      000005004D656D6F39000200240000005C000000E40300002A00000043000000
      01000000000000000000FFFFFF1F2E02000000000002001F00C6F3F0EDE0EB20
      EDE5EEF4EEF0ECEBE5EDEDFBF520E4EEEAF3ECE5EDF2EEE20D0E005B5245504F
      52545F5449544C455D00000000FFFF0000000000020000000100000000050041
      7269616C000A00000000000000000000000000CC00020000000000FFFFFF0000
      0000020000000000000000003508000006004D656D6F31310002000403000064
      020000040100001E0000004300000064000000000000000000FFFFFF1F2E0200
      0000000002001D00CFEE20F1EEF1F2EEFFEDE8FE20EDE0205B444154455D205B
      54494D455D0D1400CDE0EFE5F7E0F2E0EB3A205B5553455246494F5D00000000
      FFFF00000000000200000001000000000500417269616C000800000000000000
      000001000000CC00020000000000FFFFFF0000000002000000000000000000BD
      08000006004D656D6F313000020024000000B400000060000000120000004300
      0A0064000000000000000000FFFFFF1F2E02000000000001000900CDE0EAEBE0
      E4EDE0FF00000000FFFF00000000000200000001000000000500417269616C00
      0800000000000000000000000000CC00020000000000FFFFFF00000000020000
      000000000000004009000006004D656D6F313200020084000000B40000005000
      00001200000043000A0064000000000000000000FFFFFF1F2C00010200000001
      000400C4E0F2E000000000FFFF00000000000200000001000000000500417269
      616C000800000000000000000000000000CC00020000000000FFFFFF00000000
      02000000000000000000C809000006004D656D6F3133000200D4000000B40000
      00A00000001200000043000A0064000000000000000000FFFFFF1F2E02000000
      000001000900CFEEF1F2E0E2F9E8EA00000000FFFF0000000000020000000100
      0000000500417269616C000800000000000000000000000000CC000200000000
      00FFFFFF00000000020000000000000000004F0A000006004D656D6F31340002
      0074010000B4000000640000001200000043000A0064000000000000000000FF
      FFFF1F2E02000000000001000800CCE5EDE5E4E6E5F000000000FFFF00000000
      000200000001000000000500417269616C000800000000000000000000000000
      CC00020000000000FFFFFF0000000002000000000000000000D30A000006004D
      656D6F3135000200D8010000B4000000440000001200000043000A0064000000
      000000000000FFFFFF1F2E02000000000001000500D1EAEBE0E400000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      00000000CC00020000000000FFFFFF0000000002000000000000000000570B00
      0006004D656D6F31360002001C020000B4000000440000001200000043000A00
      64000000000000000000FFFFFF1F2E02030100000001000500D1F3ECECE00000
      0000FFFF00000000000200000001000000000500417269616C00080000000000
      0000000000000000CC00020000000000FFFFFF00000000020000000000000000
      00E00B000006004D656D6F313700020060020000B4000000E000000012000000
      43000A0064000000000000000000FFFFFF1F2E02000000000001000A00CFF0E8
      ECE5F7E0EDE8E500000000FFFF00000000000200000001000000000500417269
      616C000800000000000000000000000000CC00020000000000FFFFFF00000000
      02000000000000000000680C000006004D656D6F313800020040030000B40000
      00700000001200000043000A0064000000000000000000FFFFFF1F2E02000000
      000001000900C4EEEAF3ECE5EDF2FB00000000FFFF0000000000020000000100
      0000000500417269616C000800000000000000000000000000CC000200000000
      00FFFFFF0000000002000000000000000000FF0C000006004D656D6F31390002
      00B0030000DC000000580000001200000043000A0064000000000000000000FF
      FFFF1F2E020000000000010018005B5172506E4C697374322E22504E245F5354
      46414B54225D00000000FFFF0000000000020000000100000000050041726961
      6C000800000000000000000000000000CC00020000000000FFFFFF0000000002
      000000000000000000880D000006004D656D6F3230000200B0030000B4000000
      580000001200000043000A0064000000000000000000FFFFFF1F2E0200000000
      0001000A00D1F72EF4E0EAF2F3F0E000000000FFFF0000000000020000000100
      0000000500417269616C000800000000000000000000000000CC000200000000
      00FFFFFF000000000200000000000000FEFEFF030000000A002043617465676F
      727931000000000C005245504F52545F5449544C450000000007005553455246
      494F000000000000000000000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = QrPnList2
    Left = 28
    Top = 317
  end
  object frRTFExport1: TfrRTFExport
    ScaleX = 1.3
    ScaleY = 1
    Left = 88
    Top = 341
  end
  object frCSVExport1: TfrCSVExport
    ScaleX = 1
    ScaleY = 1
    Delimiter = ';'
    Left = 144
    Top = 345
  end
  object frHTMExport1: TfrHTMExport
    ScaleX = 1
    ScaleY = 1
    Left = 204
    Top = 345
  end
end
