inherited Jou_ZONE_PER: TJou_ZONE_PER
  Left = 290
  Top = 156
  Caption = 'Журнал накладных перемещения между зонами'
  ClientHeight = 427
  ClientWidth = 845
  OldCreateOrder = True
  PopupMenu = PopupMenu1
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 845
    inherited BtnProw: TToolButton
      Hint = 'Провести документ...(F5)'
      OnClick = BtnProwClick
    end
    inherited BtnUnProw: TToolButton
      Hint = 'Снять с проводки документ...(F6)'
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
    inherited BtnDel: TToolButton
      OnClick = BtnDelClick
    end
    inherited BtnPrint: TToolButton
      OnClick = BtnPrintClick
    end
    inherited BtnPropertis: TToolButton
      OnClick = BtnPropertisClick
    end
    inherited BtnAnaliz: TToolButton
      Hint = 'Анализ документа...(F3)'
      Enabled = False
      Visible = False
    end
    inherited BtnInterval: TToolButton
      OnClick = BtnIntervalClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 408
    Width = 845
    Panels = <
      item
        Width = 50
      end>
  end
  inherited Panel1: TPanel
    Width = 845
    Height = 379
    inherited StatusBar2: TStatusBar
      Top = 29
      Width = 845
    end
    inherited RxDBGrid1: TRxDBGrid
      Top = 48
      Width = 845
      Height = 331
      DataSource = DsZonePerList
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawDataCell = RxDBGrid1DrawDataCell
      OnDrawColumnCell = RxDBGrid1DrawColumnCell
      OnDblClick = RxDBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ZONE_PER_PROW'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = ' '
          Width = 16
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZONE_PER_NUM_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Номер'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZONE_PER_DATE'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZONE_FROM_NAME'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'С зоны'
          Width = 162
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZONE_PER_OSN'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Основание'
          Width = 187
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'US_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Оформил'
          Width = 143
          Visible = True
        end>
    end
    object ToolBar2: TToolBar
      Left = 0
      Top = 0
      Width = 845
      Height = 29
      ButtonHeight = 13
      Caption = 'ToolBar2'
      TabOrder = 2
      object Label2: TLabel
        Left = 0
        Top = 2
        Width = 41
        Height = 13
        Caption = 'с зоны :'
        Layout = tlCenter
      end
      object ZONE_FROM: TComboBox
        Left = 41
        Top = 2
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = ZONE_FROMChange
      end
      object Label1: TLabel
        Left = 186
        Top = 2
        Width = 44
        Height = 13
        Caption = 'на зону :'
        Layout = tlCenter
        Visible = False
      end
      object ZONE_TO: TComboBox
        Left = 230
        Top = 2
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Visible = False
        OnChange = ZONE_TOChange
      end
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ZonePerListTranSaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 24
    Top = 92
  end
  object QrZonePerList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ZonePerListTranSaction
    AfterOpen = QrZonePerListAfterOpen
    AfterScroll = QrZonePerListAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_zone_per(:DT1,:DT2,:ZONE_FROM_ID)')
    Left = 188
    Top = 97
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
        Name = 'ZONE_FROM_ID'
        ParamType = ptUnknown
      end>
    object QrZonePerListZONE_PER_ID: TIntegerField
      FieldName = 'ZONE_PER_ID'
      Origin = 'LIST_ZONE_PER.ZONE_PER_ID'
    end
    object QrZonePerListZONE_PER_NUM_FULL: TIBStringField
      FieldName = 'ZONE_PER_NUM_FULL'
      Origin = 'LIST_ZONE_PER.ZONE_PER_NUM_FULL'
      Size = 74
    end
    object QrZonePerListZONE_PER_DATE: TDateTimeField
      FieldName = 'ZONE_PER_DATE'
      Origin = 'LIST_ZONE_PER.ZONE_PER_DATE'
    end
    object QrZonePerListZONE_FROM_NAME: TIBStringField
      FieldName = 'ZONE_FROM_NAME'
      Origin = 'LIST_ZONE_PER.ZONE_FROM_NAME'
      Size = 64
    end
    object QrZonePerListZONE_PER_COLOR: TIntegerField
      FieldName = 'ZONE_PER_COLOR'
      Origin = 'LIST_ZONE_PER.ZONE_PER_COLOR'
    end
    object QrZonePerListUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'LIST_ZONE_PER.US_FULL'
      Size = 128
    end
    object QrZonePerListZONE_PER_PROW: TIBStringField
      FieldName = 'ZONE_PER_PROW'
      Origin = 'LIST_ZONE_PER.ZONE_PER_PROW'
      FixedChar = True
      Size = 1
    end
    object QrZonePerListZONE_PER_OSN: TIBStringField
      FieldName = 'ZONE_PER_OSN'
      Origin = 'LIST_ZONE_PER.ZONE_PER_OSN'
      Size = 254
    end
    object QrZonePerListZONE_PER_NUM: TIntegerField
      FieldName = 'ZONE_PER_NUM'
      Origin = 'LIST_ZONE_PER.ZONE_PER_NUM'
    end
    object QrZonePerListZONE_FROM_ID1: TIntegerField
      FieldName = 'ZONE_FROM_ID1'
      Origin = 'LIST_ZONE_PER.ZONE_FROM_ID1'
    end
  end
  object DsZonePerList: TDataSource
    DataSet = QrZonePerList
    Left = 188
    Top = 153
  end
  object ZonePerListTranSaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 64
    Top = 201
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 324
    Top = 117
    object MnProw: TMenuItem
      Caption = 'Провести накладную перемещения'
      ImageIndex = 22
      ShortCut = 116
      OnClick = BtnProwClick
    end
    object MnUnprow: TMenuItem
      Caption = 'Снять с проводки накладную перемещения'
      ImageIndex = 24
      ShortCut = 117
      OnClick = BtnUnProwClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnNew: TMenuItem
      Caption = 'Новая накладная перемещения'
      ImageIndex = 0
      ShortCut = 45
      OnClick = BtnNewClick
    end
    object MnOpen: TMenuItem
      Caption = 'Открыть накладную перемещения'
      ImageIndex = 1
      ShortCut = 13
      OnClick = BtnOpenClick
    end
    object MnCopy: TMenuItem
      Caption = 'Копировать накладную перемещения'
      ImageIndex = 4
      ShortCut = 16451
    end
    object MnDel: TMenuItem
      Caption = 'Удалить накладую перемещения'
      ImageIndex = 2
      ShortCut = 46
      OnClick = BtnDelClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object MnPrint: TMenuItem
      Caption = 'Печатать накладную перемещения'
      ImageIndex = 9
      ShortCut = 120
      OnClick = BtnPrintClick
    end
    object MnHistory: TMenuItem
      Caption = '"История" накладной перемещения'
      ImageIndex = 3
      ShortCut = 123
      OnClick = BtnPropertisClick
    end
    object MnFind: TMenuItem
      Caption = 'Найти накладную перемещения по номеру (0...9)'
      ImageIndex = 6
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object MnSubDoc: TMenuItem
      Caption = 'Создать документ на основании накладной перемещения'
      ImageIndex = 24
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object MnInterval: TMenuItem
      Caption = 'Интервал дат в журнале (I)'
      ImageIndex = 36
      OnClick = BtnIntervalClick
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object MnAdm: TMenuItem
      Caption = 'Администрирование накладной перемещения'
      ImageIndex = 25
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 602
    Top = 209
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 600
    Top = 261
  end
end
