object REPORT_TDM_ITOG_SHOP_AVG: TREPORT_TDM_ITOG_SHOP_AVG
  Left = 281
  Top = 244
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Усредненый итоговый отчет об остатках по складам'
  ClientHeight = 461
  ClientWidth = 699
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 4
    Top = 62
    Width = 85
    Height = 13
    Caption = 'Группа товаров :'
  end
  object BtnDic: TSpeedButton
    Left = 546
    Top = 58
    Width = 23
    Height = 22
    Hint = 'Выбрать группу товаров из каталога'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555000000005555555099999990055555099999999010555001111111101
      105500000000000011055080FFFFFF0F01105500FFFFFF0FF0105550FF800007
      7F005555000777777F005555500000000F05555550FFFFFF0F05555550F000FF
      0005555550FFFFFF0555555550FF800005555555550005555555}
    OnClick = BtnDicClick
  end
  object Label1: TLabel
    Left = 40
    Top = 36
    Width = 44
    Height = 13
    Caption = 'Период :'
  end
  object BtnDynDic: TSpeedButton
    Left = 523
    Top = 58
    Width = 23
    Height = 22
    Hint = 'Выбрать динамическую группу товаров'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555550000000055555550AAAAAAA00555550AAAAAAAA020555002222222202
      205500000000000022055080FFFFFF0F02205500FFFFFF0FF0205550FF800007
      7F005555000777777F005555500000000F05555550FFFFFF0F05555550F000FF
      0005555550FFFFFF0555555550FF800005555555550005555555}
    OnClick = BtnDynDicClick
  end
  object Label2: TLabel
    Left = 88
    Top = 36
    Width = 6
    Height = 13
    Caption = 'с'
  end
  object Label4: TLabel
    Left = 224
    Top = 36
    Width = 12
    Height = 13
    Caption = 'по'
  end
  object Label8: TLabel
    Left = 52
    Top = 6
    Width = 45
    Height = 15
    AutoSize = False
    Caption = 'Фирма :'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 104
    Width = 699
    Height = 357
    Align = alBottom
    DataSource = DsReport
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SKL_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Склад хранения'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OST'
        Title.Alignment = taCenter
        Title.Caption = 'Остаток в руб.'
        Width = 127
        Visible = True
      end>
  end
  object BtnOk: TButton
    Left = 598
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Построить'
    TabOrder = 1
    OnClick = BtnOkClick
  end
  object TW: TEdit
    Left = 92
    Top = 58
    Width = 429
    Height = 21
    TabOrder = 2
    Text = 'TW'
  end
  object BtnPrint: TButton
    Left = 599
    Top = 36
    Width = 75
    Height = 25
    Caption = 'Печать'
    Enabled = False
    TabOrder = 3
    OnClick = BtnPrintClick
  end
  object DT1: TDateEdit
    Left = 100
    Top = 32
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 4
  end
  object btnExcel: TButton
    Left = 600
    Top = 67
    Width = 74
    Height = 25
    Caption = 'Excel'
    TabOrder = 5
    OnClick = btnExcelClick
  end
  object dt2: TDateEdit
    Left = 248
    Top = 32
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 6
  end
  object FRM: TRxDBLookupCombo
    Left = 100
    Top = 6
    Width = 269
    Height = 20
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'FRM_ID'
    LookupDisplay = 'FRM_NAME'
    LookupSource = DsFrm
    TabOrder = 7
  end
  object ReportTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 438
    Top = 222
  end
  object QueryRep1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ReportTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from REPORT_ITOG_TDM_SHOP_AVG(:dt1, :dt2, :start_twtree' +
        '_id, :start_twtree_typ, :frm_id)'
      'order by skl_name')
    Left = 438
    Top = 276
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
        Name = 'start_twtree_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'start_twtree_typ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'frm_id'
        ParamType = ptUnknown
      end>
    object QueryRep1SKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Origin = 'REPORT_ITOG_TDM_SHOP_AVG.SKL_ID'
    end
    object QueryRep1SKL_NAME: TIBStringField
      FieldName = 'SKL_NAME'
      Origin = 'REPORT_ITOG_TDM_SHOP_AVG.SKL_NAME'
      Size = 254
    end
    object QueryRep1OST_KOL: TFloatField
      FieldName = 'OST_KOL'
      Origin = 'REPORT_ITOG_TDM_SHOP_AVG.OST_KOL'
      DisplayFormat = '#0.0000'
    end
    object QueryRep1OST: TFloatField
      FieldName = 'OST'
      Origin = 'REPORT_ITOG_TDM_SHOP_AVG.OST'
      DisplayFormat = '#0.00'
    end
    object QueryRep1OST2: TFloatField
      FieldName = 'OST$'
      Origin = 'REPORT_ITOG_TDM_SHOP_AVG.OST$'
      DisplayFormat = '#0.00'
    end
    object QueryRep1CNT: TIntegerField
      FieldName = 'CNT'
      Origin = 'REPORT_ITOG_TDM_SHOP_AVG.CNT'
    end
  end
  object DsReport: TDataSource
    DataSet = QueryRep1
    Left = 548
    Top = 326
  end
  object DualListDialog1: TDualListDialog
    Sorted = False
    Label1Caption = '&Типы накладных'
    Label2Caption = '&Типы для расчета'
    HelpContext = 0
    Left = 154
    Top = 308
  end
  object DualListDialog2: TDualListDialog
    Sorted = False
    Label1Caption = '&Типы накладных'
    Label2Caption = '&Типы для расчета'
    HelpContext = 0
    Left = 222
    Top = 312
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 62
    Top = 150
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ReportTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 62
    Top = 200
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 60
    Top = 250
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnGetValue = frReport1GetValue
    Left = 200
    Top = 194
    ReportForm = {
      18000000A5050000180000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D60000000B004D61737465724461746131000201000000
      00E0000000F6020000100000003000050001000000000000000000DBDBDB0000
      0000000C0066724442446174615365743100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      440100000E005265706F727453756D6D617279310002010000000014010000F6
      020000120000003000010001000000000000000000DBDBDB0000000000000000
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200B00100000C005265706F72745469746C6531
      0002010000000044000000F60200004A00000030000000010000000000000000
      00DBDBDB0000000000000000000000000000FFFF000000000002000000010000
      000000000001000000C8000000140000000100000000000000003F0200000500
      4D656D6F3200020038020000E0000000A80000001000000043000F0001000000
      000000000000FFFFFF002E020101000000010011005B5175657279526570312E
      224F5354225D00000000FFFF0000000000020000000100000000050041726961
      6C000900000000000000000001000000CC00020000000000FFFFFF0000000002
      000000000000000000D302000005004D656D6F3500020014000000E000000023
      0200001000000043000F0001000000000000000000FFFFFF002E020000000000
      010016005B5175657279526570312E22534B4C5F4E414D45225D00000000FFFF
      00000000000200000001000000000500417269616C0009000000000000000000
      00000000CC00020000000000FFFFFF0000000002000000000000000000580300
      0005004D656D6F380002001400000014010000240200001200000043000F0001
      000000000000000000808080002E02000000000001000700C8F2EEE3EE203A00
      000000FFFF00000000000200000001000000000500417269616C000A00000002
      00FFFFFF0000000000CC00020000000000FFFFFF000000000200000000000000
      0000EF03000006004D656D6F31300002003802000014010000A8000000120000
      0043000F0001000000000000000000808080002E020101000000010018005B53
      554D285B5175657279526570312E226F7374225D295D00000000FFFF00000000
      000200000001000000000500417269616C000A0000000200FFFFFF0001000000
      CC00020000000000FFFFFF00000000020000000000000000007C04000006004D
      656D6F31310002001400000044000000D00200003800000043000F0001000000
      000000000000808080002E02000000000001000E005B5245504F52545F544954
      4C455D00000000FFFF00000000000200000001000000000500417269616C000A
      0000000200FFFFFF0002000000CC00020000000000FFFFFF0000000002000000
      0000000000000905000006004D656D6F3132000200140000007C000000230200
      001200000043000F0001000000000000000000FFFFFF002E0200000000000100
      0E00D1EAEBE0E420F5F0E0EDE5EDE8FF00000000FFFF00000000000200000001
      000000000500417269616C000A00000002000000000002000000CC0002000000
      0000FFFFFF00000000020000000000000000009605000006004D656D6F313500
      0200380200007C000000A80000001200000043000F0001000000000000000000
      FFFFFF002E02000000000001000E00CEF1F2E0F2EEEA20E220F0F3E12E000000
      00FFFF00000000000200000001000000000500417269616C0009000000020000
      00000002000000CC00020000000000FFFFFF000000000200000000000000FEFE
      FF000000000000000000000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = QueryRep1
    Left = 278
    Top = 196
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
    Left = 56
    Top = 375
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
    Left = 110
    Top = 379
  end
end
