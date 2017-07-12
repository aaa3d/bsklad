object LIST_DOC_INFORMER: TLIST_DOC_INFORMER
  Left = 258
  Top = 349
  Width = 1318
  Height = 555
  Caption = 'Документы для отгрузки клиенту'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1302
    Height = 33
    ButtonHeight = 24
    ButtonWidth = 28
    Caption = 'ToolBar1'
    EdgeInner = esNone
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnOpen: TToolButton
      Left = 0
      Top = 2
      Hint = 'Открыть документ...(Enter)'
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object ToolButton8: TToolButton
      Left = 28
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 36
      Top = 2
      Caption = 'ToolButton2'
      ImageIndex = 125
      OnClick = ToolButton2Click
    end
    object ToolButton14: TToolButton
      Left = 64
      Top = 2
      Width = 17
      Caption = 'ToolButton14'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 81
      Top = 2
      Caption = 'ToolButton6'
      ImageIndex = 202
      OnClick = ToolButton6Click
    end
    object ToolButton7: TToolButton
      Left = 109
      Top = 2
      Width = 36
      Caption = 'ToolButton7'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object BtnPropertis: TToolButton
      Left = 145
      Top = 2
      Hint = '"История" документа (F12)'
      Caption = 'BtnPropertis'
      ImageIndex = 3
      OnClick = BtnPropertisClick
    end
    object ToolButton16: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton16'
      ImageIndex = 25
      Style = tbsSeparator
    end
    object BtnInterval: TToolButton
      Left = 181
      Top = 2
      Hint = 'Установить интервал дат в журнале...(I)'
      Caption = 'BtnInterval'
      ImageIndex = 36
      OnClick = BtnIntervalClick
    end
    object ToolButton1: TToolButton
      Left = 209
      Top = 2
      Width = 41
      Caption = 'ToolButton1'
      ImageIndex = 37
      Style = tbsSeparator
    end
    object DOC_STATUS: TComboBox
      Left = 250
      Top = 3
      Width = 228
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = DOC_STATUSChange
      Items.Strings = (
        '<Все>'
        'Отправленные в набор'
        'Принятые в набор'
        'Готовые к отгрузке'
        'Отгруженные'
        'Снятые с проводки'
        'В работе'
        'В работе и снятые с проводки'
        'Только перемещения'
        '')
    end
    object ToolButton3: TToolButton
      Left = 478
      Top = 2
      Hint = 'Обновить'
      Caption = 'ToolButton3'
      ImageIndex = 205
      OnClick = ToolButton3Click
    end
    object ToolButton5: TToolButton
      Left = 506
      Top = 2
      Width = 95
      Caption = 'ToolButton5'
      ImageIndex = 207
      Style = tbsSeparator
    end
    object btnAutoPrint: TCheckBox
      Left = 601
      Top = 2
      Width = 97
      Height = 24
      Caption = 'Авто печать'
      TabOrder = 1
    end
    object ToolButton4: TToolButton
      Left = 698
      Top = 2
      Width = 68
      Caption = 'ToolButton4'
      ImageIndex = 10
      Style = tbsSeparator
    end
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 89
    Width = 1302
    Height = 19
    Align = alTop
    Panels = <
      item
        Text = 'За период с 01-Янв-1999 по 20-Фев-1999'
        Width = 276
      end
      item
        Width = 50
      end>
    SimplePanel = False
    SizeGrip = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 108
    Width = 1302
    Height = 409
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = RxDBGrid1GetCellParams
    OnContextPopup = RxDBGrid1ContextPopup
    Columns = <
      item
        Expanded = False
        FieldName = 'DOC_TEXT'
        Title.Caption = 'Документ'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RN_SUMM'
        Title.Caption = 'Сумма'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_STATUS_DESC'
        Title.Caption = 'Состояние'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKL_SHORT'
        Title.Caption = 'Склад'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_DATE'
        Title.Caption = 'Проведен'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FIO'
        Title.Caption = 'Проведен'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM0'
        Title.Caption = 'Взят в набор'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FIO0'
        Title.Caption = 'Взят в набор'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM1'
        Title.Caption = 'Подобран'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FIO1'
        Title.Caption = 'Подобран'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM2'
        Title.Caption = 'Выдан'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FIO2'
        Title.Caption = 'Выдан'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 1302
    Height = 56
    Align = alTop
    TabOrder = 3
    object US_FIO: TLabel
      Left = 568
      Top = 16
      Width = 5
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 40
      Top = 8
      Width = 113
      Height = 33
      Caption = '1. Взять в набор'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 240
      Top = 8
      Width = 113
      Height = 33
      Caption = '2. Собрано'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 440
      Top = 8
      Width = 113
      Height = 33
      Caption = '3. Выдано'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 768
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Button4'
      TabOrder = 3
      Visible = False
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 856
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Button5'
      TabOrder = 4
      Visible = False
      OnClick = Button5Click
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 124
    Top = 164
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    AfterScroll = IBQuery1AfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT * FROM LIST_DOC_INFORMER(:dt1, :dt2, :show_status, :shop_' +
        'id, :ADD_DOC_ID)')
    Left = 128
    Top = 220
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'show_status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'shop_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADD_DOC_ID'
        ParamType = ptUnknown
      end>
    object IBQuery1INFORMER_DATA_ID: TIntegerField
      FieldName = 'INFORMER_DATA_ID'
      Origin = 'LIST_DOC_INFORMER.INFORMER_DATA_ID'
    end
    object IBQuery1DOC_TEXT: TIBStringField
      FieldName = 'DOC_TEXT'
      Origin = 'LIST_DOC_INFORMER.DOC_TEXT'
      Size = 254
    end
    object IBQuery1TM0: TDateTimeField
      FieldName = 'TM0'
      Origin = 'LIST_DOC_INFORMER.TM0'
    end
    object IBQuery1TM1: TDateTimeField
      FieldName = 'TM1'
      Origin = 'LIST_DOC_INFORMER.TM1'
    end
    object IBQuery1TM2: TDateTimeField
      FieldName = 'TM2'
      Origin = 'LIST_DOC_INFORMER.TM2'
    end
    object IBQuery1US_FIO0: TIBStringField
      FieldName = 'US_FIO0'
      Origin = 'LIST_DOC_INFORMER.US_FIO0'
      Size = 254
    end
    object IBQuery1US_FIO1: TIBStringField
      FieldName = 'US_FIO1'
      Origin = 'LIST_DOC_INFORMER.US_FIO1'
      Size = 254
    end
    object IBQuery1US_FIO2: TIBStringField
      FieldName = 'US_FIO2'
      Origin = 'LIST_DOC_INFORMER.US_FIO2'
      Size = 254
    end
    object IBQuery1DOC_STATUS: TIntegerField
      FieldName = 'DOC_STATUS'
      Origin = 'LIST_DOC_INFORMER.DOC_STATUS'
    end
    object IBQuery1DOC_STATUS_DESC: TIBStringField
      FieldName = 'DOC_STATUS_DESC'
      Origin = 'LIST_DOC_INFORMER.DOC_STATUS_DESC'
      Size = 32
    end
    object IBQuery1SKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'LIST_DOC_INFORMER.SKL_SHORT'
      Size = 32
    end
    object IBQuery1DOC_ID: TIntegerField
      FieldName = 'DOC_ID'
    end
    object IBQuery1shop_color: TIntegerField
      FieldName = 'shop_color'
    end
    object IBQuery1status_color: TIntegerField
      FieldName = 'status_color'
    end
    object IBQuery1STATUS_TM: TDateTimeField
      FieldName = 'STATUS_TM'
      Origin = 'LIST_DOC_INFORMER.STATUS_TM'
    end
    object IBQuery1DOC_TM: TIBStringField
      FieldName = 'DOC_TM'
      Origin = 'LIST_DOC_INFORMER.DOC_TM'
      Size = 32
    end
    object IBQuery1RN_US_ID: TIntegerField
      FieldName = 'RN_US_ID'
      Origin = 'LIST_DOC_INFORMER.RN_US_ID'
    end
    object IBQuery1US_FIO: TIBStringField
      FieldName = 'US_FIO'
      Origin = 'LIST_DOC_INFORMER.US_FIO'
      Size = 254
    end
    object IBQuery1DOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
      Origin = 'LIST_DOC_INFORMER.DOC_DATE'
    end
    object IBQuery1RN_SUMM: TFloatField
      FieldName = 'RN_SUMM'
      Origin = 'LIST_DOC_INFORMER.RN_SUMM'
      DisplayFormat = '0.00'
    end
    object IBQuery1DOC_TYPE: TIBStringField
      FieldName = 'DOC_TYPE'
      Origin = 'LIST_DOC_INFORMER.DOC_TYPE'
      Size = 32
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 120
    Top = 276
  end
  object PopupMenu1: TPopupMenu
    Left = 436
    Top = 120
    object mnuSet1: TMenuItem
      Caption = 'Принят в набор'
      object invis11: TMenuItem
        Caption = 'invis1'
        Visible = False
        OnClick = invis11Click
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuSet2: TMenuItem
      Caption = 'Готов к отгрузке'
      object invis21: TMenuItem
        Caption = 'invis2'
        Visible = False
        OnClick = invis21Click
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuSet3: TMenuItem
      Caption = 'Выдан клиенту'
      object invis31: TMenuItem
        Caption = 'invis3'
        Visible = False
        OnClick = invis31Click
      end
    end
  end
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 560
    Top = 124
  end
  object IBQuery2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 252
    Top = 136
  end
  object old_list: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'DOC_ID'
        DataType = ftInteger
      end>
    Left = 236
    Top = 228
    object old_listDOC_ID: TIntegerField
      FieldName = 'DOC_ID'
    end
  end
  object new_list: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'DOC_ID'
        DataType = ftInteger
      end>
    Left = 296
    Top = 228
    object new_listDOC_ID: TIntegerField
      FieldName = 'DOC_ID'
    end
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 392
    Top = 224
  end
end
