inherited JOU_PO: TJOU_PO
  Left = 303
  Top = 287
  Caption = 'Журнал Предоплат'
  ClientHeight = 474
  ClientWidth = 1035
  OldCreateOrder = True
  PopupMenu = PopupMenu1
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    Width = 1035
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
      Action = ActSelect
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 455
    Width = 1035
    Panels = <
      item
        Width = 50
      end>
  end
  inherited Panel1: TPanel
    Top = 55
    Width = 1035
    Height = 400
    TabOrder = 3
    inherited StatusBar2: TStatusBar
      Top = 25
      Width = 1035
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
      Width = 1035
      Height = 356
      DataSource = DsPoList
      OnDrawDataCell = RxDBGrid1DrawDataCell
      OnDrawColumnCell = RxDBGrid1DrawColumnCell
      OnDblClick = RxDBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'PO_NUM_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Номер'
          Width = 135
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PO_DATE'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PO_SUMM'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Сумма'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PO_OST'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Не погашено'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KLN_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Покупатель'
          Width = 133
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PO_OSN'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Основание'
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'US_FULL'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Title.Caption = 'Кто оформил'
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KASSIR_FIO'
          PickList.Strings = ()
          Title.Caption = 'Кассир'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KASSA_NAME'
          PickList.Strings = ()
          Title.Caption = 'Касса'
          Width = 89
          Visible = True
        end>
    end
    object ToolBar3: TToolBar
      Left = 0
      Top = 0
      Width = 1035
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
      object Label3: TLabel
        Left = 461
        Top = 2
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = '             Сумма :'
      end
      object PoSumm: TRxCalcEdit
        Left = 540
        Top = 2
        Width = 136
        Height = 18
        AutoSize = False
        DisplayFormat = '0.00р'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 2
      end
      object Label4: TLabel
        Left = 676
        Top = 2
        Width = 72
        Height = 13
        Caption = 'Не погашено :'
      end
      object PoOst: TRxCalcEdit
        Left = 748
        Top = 2
        Width = 121
        Height = 18
        AutoSize = False
        DisplayFormat = '0.00р'
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 3
      end
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 29
    Width = 1035
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
      TabOrder = 2
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
    object Label6: TLabel
      Left = 473
      Top = 2
      Width = 73
      Height = 20
      AutoSize = False
      Caption = '  Состояние : '
      Layout = tlCenter
    end
    object STAT: TComboBox
      Left = 546
      Top = 2
      Width = 135
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'STAT'
      OnChange = STATChange
      Items.Strings = (
        'Все'
        'Погашенные'
        'Непогашенные')
    end
  end
  object PoListTranSaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 94
    Top = 97
  end
  object QrPoList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PoListTranSaction
    AfterOpen = QrPoListAfterOpen
    AfterScroll = QrPoListAfterScroll
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from list_po(:DT1,:DT2,:SHOP_ID2,:STAT,:kassir_id, :kas' +
        'sa_id, :FRM_ID) order by po_date')
    Left = 190
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
        Name = 'SHOP_ID2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'STAT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kassir_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kassa_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end>
    object QrPoListPO_ID: TIntegerField
      FieldName = 'PO_ID'
      Origin = 'LIST_PO.PO_ID'
    end
    object QrPoListPO_NUM_FULL: TIBStringField
      FieldName = 'PO_NUM_FULL'
      Origin = 'LIST_PO.PO_NUM_FULL'
      Size = 74
    end
    object QrPoListPO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
      Origin = 'LIST_PO.PO_DATE'
    end
    object QrPoListPO_SUMM: TFloatField
      FieldName = 'PO_SUMM'
      Origin = 'LIST_PO.PO_SUMM'
      DisplayFormat = '#0.00 руб'
    end
    object QrPoListPO_OST: TFloatField
      FieldName = 'PO_OST'
      Origin = 'LIST_PO.PO_OST'
      DisplayFormat = '#0.00 руб'
    end
    object QrPoListPO_COLOR: TIntegerField
      FieldName = 'PO_COLOR'
      Origin = 'LIST_PO.PO_COLOR'
    end
    object QrPoListKLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Origin = 'LIST_PO.KLN_FULL'
      Size = 128
    end
    object QrPoListUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'LIST_PO.US_FULL'
      Size = 128
    end
    object QrPoListPO_OSN: TIBStringField
      FieldName = 'PO_OSN'
      Origin = 'LIST_PO.PO_OSN'
      Size = 252
    end
    object QrPoListPO_NUM: TIntegerField
      FieldName = 'PO_NUM'
      Origin = 'LIST_PO.PO_NUM'
    end
    object QrPoListWOZW_ID: TIntegerField
      FieldName = 'WOZW_ID'
      Origin = 'LIST_PO.WOZW_ID'
    end
    object QrPoListKASSIR_FIO: TIBStringField
      FieldName = 'KASSIR_FIO'
      Origin = 'LIST_PO.KASSIR_FIO'
      Size = 32
    end
    object QrPoListKASSA_NAME: TIBStringField
      FieldName = 'KASSA_NAME'
      Origin = 'LIST_PO.KASSA_NAME'
      Size = 32
    end
  end
  object DsPoList: TDataSource
    DataSet = QrPoList
    Left = 188
    Top = 153
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 384
    Top = 97
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
      OnExecute = ActSelectExecute
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
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    Left = 144
    Top = 287
    ReportForm = {
      180000000C0D0000180000000025005C5C7365727665725C43616E6F6E204D46
      3539303020536572696573205546524949204C5400FFFFFFFFFF090000003408
      0000990B00000000000000000000000000000000000000FFFF00000000FFFF00
      0000000000000000000000030400466F726D000F000080DC000000780000007C
      0100002C010000040000000200FA0000000B004D617374657244617461310002
      010000000090000000F50200000E0000003100050001000000000000000000FF
      FFFF1F000000000C0066724442446174615365743100000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200670100000D004D617374657248656164657231000201000000005400
      0000F50200000E0000003000040001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000200D40100000D004D6173746572466F6F
      7465723100020100000000F0000000F50200000E000000310006000100000000
      0000000000FFFFFF1F00000000000000000000000000FFFF0000000000020000
      00010000000000000001000000C8000000140000000100000000000002004002
      00000C005265706F72745469746C6531000201000000001C000000F502000012
      0000003000000001000000000000000000FFFFFF1F0000000000000000000000
      0000FFFF000000000002000000010000000000000001000000C8000000140000
      00010000000000000000D302000005004D656D6F310002009400000090000000
      740000000E0000004300020001000000000000000000FFFFFF1F2C0200000000
      00010014005B5172506F4C6973742E22504F5F44415445225D00000000FFFF00
      0000000002000000010000000006005461686F6D610008000000000000000000
      000000000100020000000000FFFFFF00000000020000000000000000006A0300
      0005004D656D6F320002001400000090000000800000000E0000004300020001
      000000000000000000FFFFFF1F2C020000000000010018005B5172506F4C6973
      742E22504F5F4E554D5F46554C4C225D00000000FFFF00000000000200000001
      0000000006005461686F6D610008000000000000000000000000000100020000
      000000FFFFFF0000000002000000000000000000FD03000005004D656D6F3300
      02000801000090000000440000000E0000004300020001000000000000000000
      FFFFFF1F2C020301000000010014005B5172506F4C6973742E22504F5F53554D
      4D225D00000000FFFF000000000002000000010000000006005461686F6D6100
      08000000000000000000000000000100020000000000FFFFFF00000000020000
      000000000000008F04000005004D656D6F340002004C01000090000000440000
      000E0000004300020001000000000000000000FFFFFF1F2C0203010000000100
      13005B5172506F4C6973742E22504F5F4F5354225D00000000FFFF0000000000
      02000000010000000006005461686F6D61000800000000000000000000000000
      0100020000000000FFFFFF00000000020000000000000000002305000005004D
      656D6F350002004002000090000000600000000E000000430002000100000000
      0000000000FFFFFF1F2C020000000000010015005B5172506F4C6973742E224B
      4C4E5F46554C4C225D00000000FFFF0000000000020000000100000000060054
      61686F6D610008000000000000000000000000000100020000000000FFFFFF00
      00000002000000000000000000B505000005004D656D6F360002009001000090
      000000B00000000E0000004300020001000000000000000000FFFFFF1F2C0200
      00000000010013005B5172506F4C6973742E22504F5F4F534E225D00000000FF
      FF000000000002000000010000000006005461686F6D61000800000000000000
      0000000000000100020000000000FFFFFF000000000200000000000000000048
      06000005004D656D6F37000200A002000090000000400000000E000000410002
      0001000000000000000000FFFFFF1F2C020000000000010014005B5172506F4C
      6973742E2255535F46554C4C225D00000000FFFF000000000002000000010000
      000006005461686F6D6100080000000000000000000000000001000200000000
      00FFFFFF0000000002000000000000000000D106000005004D656D6F38000200
      9400000054000000740000000E0000004300020001000000000000000000FFFF
      FF1F2C02000000000001000A00C4E0F2E02DE2F0E5ECFF00000000FFFF000000
      000002000000010000000006005461686F6D6100080000000000000000000000
      00000100020000000000FFFFFF00000000020000000000000000005507000005
      004D656D6F390002001400000054000000800000000E00000043000200010000
      00000000000000FFFFFF1F2C02000000000001000500CDEEECE5F000000000FF
      FF000000000002000000010000000006005461686F6D61000800000000000000
      0000000000000100020000000000FFFFFF0000000002000000000000000000DA
      07000006004D656D6F31300002000801000054000000440000000E0000004300
      020001000000000000000000FFFFFF1F2C02030100000001000500D1F3ECECE0
      00000000FFFF000000000002000000010000000006005461686F6D6100080000
      00000000000000000000000100020000000000FFFFFF00000000020000000000
      000000006108000006004D656D6F31310002004C01000054000000440000000E
      0000004300020001000000000000000000FFFFFF1F2C02030100000001000700
      CEF1F2E0F2EEEA00000000FFFF00000000000200000001000000000600546168
      6F6D610008000000000000000000000000000100020000000000FFFFFF000000
      0002000000000000000000EB08000006004D656D6F3132000200400200005400
      0000600000000E0000004300020001000000000000000000FFFFFF1F2C020000
      00000001000A00CFEEEAF3EFE0F2E5EBFC00000000FFFF000000000002000000
      010000000006005461686F6D6100080000000000000000000000000001000200
      00000000FFFFFF00000000020000000000000000007509000006004D656D6F31
      330002009001000054000000B00000000E000000430002000100000000000000
      0000FFFFFF1F2C02000000000001000A00CFF0E8ECE5F7E0EDE8E500000000FF
      FF000000000002000000010000000006005461686F6D61000800000000000000
      0000000000000100020000000000FFFFFF000000000200000000000000000001
      0A000006004D656D6F3134000200A002000054000000400000000E0000004300
      020001000000000000000000FFFFFF1F2C02000000000001000C00CFEEEBFCE7
      EEE2E0F2E5EBFC00000000FFFF00000000000200000001000000000600546168
      6F6D610008000000000000000000000000000100020000000000FFFFFF000000
      0002000000000000000000AB0A000006004D656D6F313500020014000000F000
      0000800000000E0000004300000001000000000000000000FFFFFF1F2C020000
      00000001002A00C8F2EEE3EE3A205B434F554E54285B5172506F4C6973742E22
      504F5F4944225D295D20E7E0EFE8F1E5E900000000FFFF000000000002000000
      010000000006005461686F6D6100080000000200000000000000000001000200
      00000000FFFFFF0000000002000000000000000000460B000006004D656D6F31
      3600020008010000F0000000440000000E000000430000000100000000000000
      0000FFFFFF1F2C02030100000001001B005B53554D285B5172506F4C6973742E
      22504F5F53554D4D225D295D00000000FFFF0000000000020000000100000000
      06005461686F6D610008000000020000000000000000000100020000000000FF
      FFFF0000000002000000000000000000E00B000006004D656D6F31370002004C
      010000F0000000440000000E0000004300000001000000000000000000FFFFFF
      1F2C02030100000001001A005B53554D285B5172506F4C6973742E22504F5F4F
      5354225D295D00000000FFFF000000000002000000010000000006005461686F
      6D610008000000020000000000000000000100020000000000FFFFFF00000000
      020000000000000000006D0C000006004D656D6F3138000200800200001C0000
      00600000000A0000004300000001000000000000000000FFFFFF1F2C02000000
      000001000D005B444154455D205B54494D455D00000000FFFF00000000000200
      0000010000000006005461686F6D610006000000020000000000000000000100
      020000000000FFFFFF0000000002000000000000000000FD0C000006004D656D
      6F3139000200140000001C000000680200000E00000043000000010000000000
      00000000FFFFFF1F2C02000000000001001000C6F3F0EDE0EB20EFF0E5E4EEEF
      EBE0F200000000FFFF000000000002000000010000000006005461686F6D6100
      08000000020000000000000000000100020000000000FFFFFF00000000020000
      0000000000FEFEFF000000000000000000000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = DsPoList
    Left = 208
    Top = 295
  end
end
