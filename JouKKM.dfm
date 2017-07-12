inherited JOU_KKM: TJOU_KKM
  Left = 398
  Top = 257
  Caption = 'Журнал кассовых отчетов'
  ClientHeight = 474
  ClientWidth = 1034
  OldCreateOrder = True
  PopupMenu = PopupMenu1
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1034
    inherited ToolButton3: TToolButton
      Visible = False
    end
    inherited BtnProw: TToolButton
      Visible = False
    end
    inherited BtnUnProw: TToolButton
      Visible = False
    end
    inherited BtnNew: TToolButton
      Action = ActNew
    end
    inherited BtnOpen: TToolButton
      Action = ActOpen
    end
    inherited btnOpenSale: TToolButton
      Visible = False
    end
    inherited BtnCopy: TToolButton
      Action = ActCopy
    end
    inherited BtnDel: TToolButton
      Action = ActDel
    end
    inherited BtnPrint: TToolButton
      Action = ActPrint
    end
    inherited BtnPropertis: TToolButton
      Action = ActHistory
    end
    inherited ToolButton14: TToolButton
      Visible = False
    end
    inherited BtnAnaliz: TToolButton
      Visible = False
    end
    inherited BtnSubDoc: TToolButton
      Visible = False
    end
    inherited BtnInterval: TToolButton
      Action = ActInterval
    end
    inherited ToolButton2: TToolButton
      Visible = False
    end
    inherited BtnAdm: TToolButton
      Action = ActAdmin
    end
    object ToolButton4: TToolButton
      Left = 452
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 26
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 460
      Top = 2
      Hint = 'Объединить отчеты по магазинам'
      Caption = 'ToolButton9'
      ImageIndex = 123
      OnClick = ToolButton9Click
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 455
    Width = 1034
    Panels = <
      item
        Width = 50
      end>
  end
  inherited Panel1: TPanel
    Top = 55
    Width = 1034
    Height = 400
    TabOrder = 3
    inherited StatusBar2: TStatusBar
      Top = 25
      Width = 1034
      Panels = <
        item
          Text = 'За период с 01-Янв-1999 по 20-Фев-1999'
          Width = 320
        end
        item
          Width = 50
        end>
    end
    inherited RxDBGrid1: TRxDBGrid
      Top = 44
      Width = 1034
      Height = 356
      DataSource = DsKKMList
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      OnDblClick = RxDBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'SHOP_NAME'
          PickList.Strings = ()
          Width = 155
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KKM_DATE'
          PickList.Strings = ()
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALDO1'
          PickList.Strings = ()
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALDO2'
          PickList.Strings = ()
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROBITO'
          PickList.Strings = ()
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INKASS'
          PickList.Strings = ()
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RN_SUMM'
          PickList.Strings = ()
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TERMINAL_SUMM'
          PickList.Strings = ()
          Title.Caption = 'ПСБ'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TERMINAL_SUMM_1'
          PickList.Strings = ()
          Title.Caption = 'ККБ'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TERMINAL_SUMM_2'
          PickList.Strings = ()
          Title.Caption = 'СБЕР'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PO_SUMM'
          PickList.Strings = ()
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PO_SUMM_1'
          PickList.Strings = ()
          Width = 60
          Visible = True
        end>
    end
    object ToolBar3: TToolBar
      Left = 0
      Top = 0
      Width = 1034
      Height = 25
      ButtonHeight = 13
      Caption = 'ToolBar2'
      EdgeBorders = []
      TabOrder = 2
      object Label9: TLabel
        Left = 0
        Top = 2
        Width = 85
        Height = 13
        Caption = '                Касса :'
      end
      object cmbKassa: TComboBox
        Left = 85
        Top = 2
        Width = 168
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'cmbKassa'
        OnChange = cmbKassaChange
      end
      object Label7: TLabel
        Left = 253
        Top = 2
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = '         Кассир :'
      end
      object cmbKassir: TComboBox
        Left = 323
        Top = 2
        Width = 138
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cmbKassirChange
      end
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 29
    Width = 1034
    Height = 26
    ButtonHeight = 20
    Caption = 'ToolBar2'
    Color = clBtnFace
    ParentColor = False
    TabOrder = 2
    object Label2: TLabel
      Left = 0
      Top = 2
      Width = 85
      Height = 20
      AutoSize = False
      Caption = '               Фирма : '
    end
    object FRM: TRxDBLookupCombo
      Left = 85
      Top = 2
      Width = 168
      Height = 20
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'FRM_ID'
      LookupDisplay = 'FRM_NAME'
      LookupSource = DsFrm
      TabOrder = 1
      OnChange = FRMChange
    end
    object ToolButton6: TToolButton
      Left = 253
      Top = 2
      Width = 13
      Caption = 'ToolButton6'
      Style = tbsSeparator
    end
    object Label1: TLabel
      Left = 266
      Top = 2
      Width = 63
      Height = 20
      AutoSize = False
      Caption = '  Магазин :'
      Layout = tlCenter
    end
    object SHOP: TRxDBLookupCombo
      Left = 329
      Top = 2
      Width = 136
      Height = 20
      DropDownCount = 8
      LookupField = 'SHOP_ID'
      LookupDisplay = 'SHOP_NAME'
      LookupSource = DsShop
      TabOrder = 0
      OnChange = SHOPChange
    end
    object ToolButton7: TToolButton
      Left = 465
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object CheckBox1: TCheckBox
      Left = 473
      Top = 2
      Width = 152
      Height = 20
      Caption = 'Показать скрытые'
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object ListTranSaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 102
    Top = 145
  end
  object QrKKMList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ListTranSaction
    AfterOpen = QrKKMListAfterOpen
    AfterScroll = QrKKMListAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from list_kkm_report(:DT1,:DT2,:SHOP_ID,:FRM_ID, :show_' +
        'all) order by kkm_date')
    Left = 242
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
        DataType = ftUnknown
        Name = 'SHOP_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'show_all'
        ParamType = ptUnknown
      end>
    object QrKKMListKKM_ID: TIntegerField
      FieldName = 'KKM_ID'
      Origin = 'LIST_KKM_REPORT.KKM_ID'
    end
    object QrKKMListKKM_DATE: TDateTimeField
      DisplayLabel = 'Дата'
      FieldName = 'KKM_DATE'
      Origin = 'LIST_KKM_REPORT.KKM_DATE'
    end
    object QrKKMListSHOP_NAME: TIBStringField
      DisplayLabel = 'Магазин'
      FieldName = 'SHOP_NAME'
      Origin = 'LIST_KKM_REPORT.SHOP_NAME'
      Size = 254
    end
    object QrKKMListSALDO1: TFloatField
      DisplayLabel = 'Остаток на начало дня'
      FieldName = 'SALDO1'
      Origin = 'LIST_KKM_REPORT.SALDO1'
      DisplayFormat = '0.00'
    end
    object QrKKMListSALDO2: TFloatField
      DisplayLabel = 'Остаток на конец дня'
      FieldName = 'SALDO2'
      Origin = 'LIST_KKM_REPORT.SALDO2'
      DisplayFormat = '0.00'
    end
    object QrKKMListPROBITO: TFloatField
      DisplayLabel = 'Пробито'
      FieldName = 'PROBITO'
      Origin = 'LIST_KKM_REPORT.PROBITO'
      DisplayFormat = '0.00'
    end
    object QrKKMListINKASS: TFloatField
      DisplayLabel = 'Инкассировано'
      FieldName = 'INKASS'
      Origin = 'LIST_KKM_REPORT.INKASS'
      DisplayFormat = '0.00'
    end
    object QrKKMListRN_SUMM: TFloatField
      DisplayLabel = 'Сумма накладных'
      FieldName = 'RN_SUMM'
      Origin = 'LIST_KKM_REPORT.RN_SUMM'
      DisplayFormat = '0.00'
    end
    object QrKKMListTERMINAL_SUMM: TFloatField
      DisplayLabel = 'STB'
      FieldName = 'TERMINAL_SUMM'
      Origin = 'LIST_KKM_REPORT.TERMINAL_SUMM'
      DisplayFormat = '0.00'
    end
    object QrKKMListTERMINAL_SUMM_1: TFloatField
      DisplayLabel = 'Зол. корона'
      FieldName = 'TERMINAL_SUMM_1'
      Origin = 'LIST_KKM_REPORT.TERMINAL_SUMM_1'
      DisplayFormat = '0.00'
    end
    object QrKKMListTERMINAL_SUMM_2: TFloatField
      DisplayLabel = 'Югра'
      FieldName = 'TERMINAL_SUMM_2'
      Origin = 'LIST_KKM_REPORT.TERMINAL_SUMM_2'
      DisplayFormat = '0.00'
    end
    object QrKKMListPO_SUMM: TFloatField
      DisplayLabel = 'Предоплат'
      FieldName = 'PO_SUMM'
      Origin = 'LIST_KKM_REPORT.PO_SUMM'
      DisplayFormat = '0.00'
    end
    object QrKKMListPO_SUMM_1: TFloatField
      DisplayLabel = 'Списано предоплат'
      FieldName = 'PO_SUMM_1'
      Origin = 'LIST_KKM_REPORT.PO_SUMM_1'
      DisplayFormat = '0.00'
    end
  end
  object DsKKMList: TDataSource
    DataSet = QrKKMList
    Left = 184
    Top = 153
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 368
    Top = 137
    object ActOpen: TAction
      Caption = 'Открыть...'
      Hint = 'Открыть...'
      ImageIndex = 1
      OnExecute = ActOpenExecute
    end
    object ActNew: TAction
      Caption = 'Новый...'
      Hint = 'Новый...'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = ActNewExecute
    end
    object ActInterval: TAction
      Caption = 'Установить интервал дат в журнале...(I)'
      Hint = 'Установить интервал дат в журнале...(I)'
      ImageIndex = 36
      OnExecute = ActIntervalExecute
    end
    object ActHistory: TAction
      Caption = 'История документа...'
      Hint = 'История документа...'
      ImageIndex = 3
      ShortCut = 123
      OnExecute = ActHistoryExecute
    end
    object ActDel: TAction
      Caption = 'Удалить..'
      Hint = 'Удалить...'
      ImageIndex = 2
      OnExecute = ActDelExecute
    end
    object ActPrint: TAction
      Caption = 'Печать приходного ордера...'
      Hint = 'Печать приходного ордера...'
      ImageIndex = 9
      ShortCut = 120
      OnExecute = ActPrintExecute
    end
    object ActAdmin: TAction
      Caption = 'Администрирование...'
      Hint = 'Администрирование...'
      ImageIndex = 25
      OnExecute = ActAdminExecute
    end
    object ActFind: TAction
      Caption = 'Найти документ по номеру...'
      Hint = 'Найти документ по номеру...'
      ImageIndex = 6
      OnExecute = ActFindExecute
    end
    object ActCopy: TAction
      Caption = 'Создать копию документа...'
      Hint = 'Создать копию документа...'
      ImageIndex = 4
      OnExecute = ActCopyExecute
    end
    object ActSelect: TAction
      Caption = 'ActSelect'
      Hint = 'Выбрать для возврата'
      ImageIndex = 16
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 318
    Top = 161
    object N1: TMenuItem
      Action = ActNew
    end
    object N2: TMenuItem
      Action = ActOpen
    end
    object N3: TMenuItem
      Action = ActDel
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Action = ActPrint
    end
    object N6: TMenuItem
      Action = ActHistory
    end
    object N7: TMenuItem
      Action = ActFind
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object I1: TMenuItem
      Action = ActInterval
    end
    object N9: TMenuItem
      Action = ActAdmin
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 516
    Top = 105
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 518
    Top = 157
  end
  object MemShop: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'SHOP_ID'
        DataType = ftInteger
      end
      item
        Name = 'SHOP_NAME'
        DataType = ftString
        Size = 64
      end>
    Left = 404
    Top = 168
    object MemShopSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object MemShopSHOP_NAME: TStringField
      FieldName = 'SHOP_NAME'
      Size = 64
    end
  end
  object DsShop: TDataSource
    DataSet = MemShop
    Left = 404
    Top = 223
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
    Left = 74
    Top = 209
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
    Left = 76
    Top = 261
  end
end
