inherited Jou_REMON: TJou_REMON
  Caption = 'Журнал актов переоценки'
  OldCreateOrder = True
  PopupMenu = PopupMenu1
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited BtnProw: TToolButton
      OnClick = BtnProwClick
    end
    inherited BtnUnProw: TToolButton
      Enabled = False
      Visible = False
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
      Enabled = False
      Visible = False
      OnClick = BtnCopyClick
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
    inherited ToolButton14: TToolButton
      Visible = False
    end
    inherited BtnAnaliz: TToolButton
      Enabled = False
      Visible = False
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
  end
  inherited StatusBar1: TStatusBar
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
    inherited RxDBGrid1: TRxDBGrid
      DataSource = DsREMON
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OnDrawDataCell = RxDBGrid1DrawDataCell
      OnDrawColumnCell = RxDBGrid1DrawColumnCell
      OnDblClick = RxDBGrid1DblClick
      OnKeyPress = RxDBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'REMON_PROW'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = ' '
          Width = 18
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REMON_FULL_NUM'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Номер'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REMON_DATE'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OWNER_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Владелец товара'
          Width = 129
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REMON_OSN'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Основание'
          Width = 187
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REMON_SHOP'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Смена цены по...'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'US_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Кто оформил'
          Width = 128
          Visible = True
        end>
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 276
    Top = 97
    object MnProw: TMenuItem
      Caption = 'Провести Акт'
      ShortCut = 116
      OnClick = BtnProwClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MnNew: TMenuItem
      Caption = 'Новый Акт'
      ShortCut = 45
      OnClick = BtnNewClick
    end
    object MnOpen: TMenuItem
      Caption = 'Открыть Акт'
      ShortCut = 13
      OnClick = BtnOpenClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить Акт'
      ShortCut = 46
      OnClick = BtnDelClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать Акт'
      ShortCut = 120
      OnClick = BtnPrintClick
    end
    object MnFIND: TMenuItem
      Caption = 'Найти Акт по номеру (0..9)'
      OnClick = BtnFindClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnCopy: TMenuItem
      Caption = 'Создать копию акта переоценки'
      ShortCut = 16451
      OnClick = BtnCopyClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object MnInterval: TMenuItem
      Caption = 'Период журнала'
      ShortCut = 73
      OnClick = BtnIntervalClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object MnAdm: TMenuItem
      Caption = 'Администрирование Акта'
    end
  end
  object REMONTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 388
    Top = 97
  end
  object ListREMON: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = REMONTransaction
    AfterOpen = ListREMONAfterOpen
    AfterScroll = ListREMONAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_remon(:dt1,:dt2)'
      'order by remon_date')
    Left = 388
    Top = 149
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dt1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt2'
        ParamType = ptInput
      end>
    object ListREMONREMON_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'REMON_ID'
      ReadOnly = True
    end
    object ListREMONREMON_PROW: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'REMON_PROW'
      ReadOnly = True
      Size = 1
    end
    object ListREMONREMON_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'REMON_DATE'
      ReadOnly = True
    end
    object ListREMONREMON_FULL_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'REMON_FULL_NUM'
      ReadOnly = True
      Size = 90
    end
    object ListREMONREMON_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'REMON_COLOR'
      ReadOnly = True
    end
    object ListREMONUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object ListREMONREMON_OSN: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'REMON_OSN'
      ReadOnly = True
      Size = 254
    end
    object ListREMONOWNER_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'OWNER_FULL'
      ReadOnly = True
      Size = 254
    end
    object ListREMONREMON_SHOP: TIBStringField
      FieldName = 'REMON_SHOP'
      Origin = 'LIST_REMON.REMON_SHOP'
      Size = 64
    end
    object ListREMONREMON_SHOP_MET: TIBStringField
      FieldName = 'REMON_SHOP_MET'
      Origin = 'LIST_REMON.REMON_SHOP_MET'
      FixedChar = True
      Size = 1
    end
  end
  object DsREMON: TDataSource
    DataSet = ListREMON
    Left = 388
    Top = 201
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 572
    Top = 105
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 572
    Top = 157
  end
end
