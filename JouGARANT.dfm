inherited Jou_GARANT: TJou_GARANT
  Left = 221
  Top = 253
  Caption = 'Журнал Гарантийных талонов'
  ClientWidth = 787
  OldCreateOrder = True
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 787
    inherited Image1: TImage
      Width = 21
    end
    inherited ToolButton1: TToolButton
      Left = 21
    end
    inherited ToolButton3: TToolButton
      Left = 46
    end
    inherited BtnProw: TToolButton
      Left = 54
      Visible = False
    end
    inherited BtnUnProw: TToolButton
      Left = 79
      Visible = False
    end
    inherited ToolButton5: TToolButton
      Left = 104
      Visible = False
    end
    inherited BtnNew: TToolButton
      Left = 112
      OnClick = BtnNewClick
    end
    inherited BtnOpen: TToolButton
      Left = 137
      OnClick = BtnOpenClick
    end
    inherited btnOpenSale: TToolButton
      Left = 162
      Visible = False
    end
    inherited BtnCopy: TToolButton
      Left = 187
      Visible = False
    end
    inherited BtnDel: TToolButton
      Left = 212
      OnClick = BtnDelClick
    end
    inherited ToolButton8: TToolButton
      Left = 237
    end
    inherited BtnPrint: TToolButton
      Left = 245
      OnClick = BtnPrintClick
    end
    inherited BtnPropertis: TToolButton
      Left = 270
      Visible = False
    end
    inherited BtnFind: TToolButton
      Left = 295
      OnClick = BtnFindClick
    end
    inherited ToolButton14: TToolButton
      Left = 320
    end
    inherited BtnAnaliz: TToolButton
      Left = 328
      Visible = False
    end
    inherited BtnSubDoc: TToolButton
      Left = 353
      Visible = False
    end
    inherited ToolButton16: TToolButton
      Left = 378
      Visible = False
    end
    inherited BtnInterval: TToolButton
      Left = 386
      OnClick = BtnIntervalClick
    end
    inherited ToolButton2: TToolButton
      Left = 411
    end
    inherited BtnAdm: TToolButton
      Left = 419
      Visible = False
    end
  end
  inherited StatusBar1: TStatusBar
    Width = 787
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
    Width = 787
    inherited StatusBar2: TStatusBar
      Width = 787
    end
    inherited RxDBGrid1: TRxDBGrid
      Width = 787
      DataSource = DsGarantList
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      OnDrawDataCell = RxDBGrid1DrawDataCell
      OnDrawColumnCell = RxDBGrid1DrawColumnCell
      OnDblClick = RxDBGrid1DblClick
      OnKeyPress = RxDBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'GARANT_FULL_NUM'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Номер'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GARANT_DT'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TW_NAM'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Наименование товара'
          Width = 158
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TW_NUM'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Заводской номер'
          Width = 144
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NAKL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Наклейка'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TW_MONEY'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Цена'
          Width = 88
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'GARANT_MES'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Срок, мес.'
          Width = 60
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
        end>
    end
  end
  object QrGarantList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = GarantListTranSaction
    AfterOpen = QrGarantListAfterOpen
    AfterScroll = QrGarantListAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_garant(:DT1,:DT2)')
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
      end>
    object QrGarantListGARANT_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'GARANT_ID'
      ReadOnly = True
    end
    object QrGarantListGARANT_FULL_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'GARANT_FULL_NUM'
      ReadOnly = True
      Size = 74
    end
    object QrGarantListGARANT_DT: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'GARANT_DT'
      ReadOnly = True
    end
    object QrGarantListGARANT_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'GARANT_COLOR'
      ReadOnly = True
    end
    object QrGarantListTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object QrGarantListTW_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NUM'
      ReadOnly = True
      Size = 254
    end
    object QrGarantListTW_MONEY: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MONEY'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrGarantListGARANT_MES: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'GARANT_MES'
      ReadOnly = True
    end
    object QrGarantListUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrGarantListNAKL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NAKL'
      ReadOnly = True
      Size = 4
    end
  end
  object DsGarantList: TDataSource
    DataSet = QrGarantList
    Left = 96
    Top = 201
  end
  object GarantListTranSaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 96
    Top = 97
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = GarantListTranSaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 180
    Top = 157
  end
  object PopupMenu1: TPopupMenu
    Left = 348
    Top = 121
    object MnNEW: TMenuItem
      Caption = 'Новый счёт'
      ShortCut = 45
      OnClick = BtnNewClick
    end
    object MnOPEN: TMenuItem
      Caption = 'Открыть счёт  (ENTER)'
      OnClick = BtnOpenClick
    end
    object MnCopy: TMenuItem
      Caption = 'Создать копию счёта'
      ShortCut = 16451
    end
    object MnDEL: TMenuItem
      Caption = 'Удалить счёт'
      ShortCut = 46
      OnClick = BtnDelClick
    end
    object N8: TMenuItem
      Caption = '-'
      ShortCut = 189
    end
    object MnPRINT: TMenuItem
      Caption = 'Напечатать счёт'
      ShortCut = 120
      OnClick = BtnPrintClick
    end
    object MnFind: TMenuItem
      Caption = 'Найти счёт по номеру (1...9)'
      OnClick = BtnFindClick
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object MnInterval: TMenuItem
      Caption = 'Интервал дат в журнале (I)'
      OnClick = BtnIntervalClick
    end
  end
end
