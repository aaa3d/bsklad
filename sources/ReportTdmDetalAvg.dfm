object REPORT_TDM_DETAL_AVG: TREPORT_TDM_DETAL_AVG
  Left = 215
  Top = 251
  Width = 745
  Height = 539
  BorderIcons = [biSystemMenu]
  Caption = '����������� ��������� ����� �� �������� ������'
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
    Caption = '������ ������� :'
  end
  object BtnDic: TSpeedButton
    Left = 546
    Top = 58
    Width = 23
    Height = 22
    Hint = '������� ������ ������� �� ��������'
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
    Left = 36
    Top = 36
    Width = 44
    Height = 13
    Caption = '������ :'
  end
  object BtnDynDic: TSpeedButton
    Left = 523
    Top = 58
    Width = 23
    Height = 22
    Hint = '������� ������������ ������ �������'
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
    Left = 84
    Top = 36
    Width = 6
    Height = 13
    Caption = '�'
  end
  object Label4: TLabel
    Left = 232
    Top = 36
    Width = 12
    Height = 13
    Caption = '��'
  end
  object Label8: TLabel
    Left = 52
    Top = 6
    Width = 45
    Height = 15
    AutoSize = False
    Caption = '����� :'
  end
  object BtnOk: TButton
    Left = 598
    Top = 4
    Width = 75
    Height = 25
    Caption = '���������'
    TabOrder = 0
    OnClick = BtnOkClick
  end
  object TW: TEdit
    Left = 92
    Top = 58
    Width = 429
    Height = 21
    TabOrder = 1
    Text = 'TW'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 111
    Width = 737
    Height = 401
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DsRep1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'TW_ART'
        Title.Alignment = taCenter
        Title.Caption = '���'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_NAM'
        Title.Alignment = taCenter
        Title.Caption = '������������ ������'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OST_KOL'
        Title.Alignment = taCenter
        Title.Caption = '�������'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEB'
        Title.Alignment = taCenter
        Title.Caption = '������� � ���.'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TWTREE_FULL'
        Title.Alignment = taCenter
        Title.Caption = '������ �������'
        Width = 280
        Visible = True
      end>
  end
  object BtnPrint: TButton
    Left = 599
    Top = 36
    Width = 75
    Height = 25
    Caption = '������'
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
    AfterOpen = QueryRep1AfterOpen
    OnCalcFields = QueryRep1CalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from REPORT_ITOG_TDM_DETAL_AVG(:dt1, :dt2, :start_twtre' +
        'e_id, :start_twtree_typ, :fill_cashe, :FRM_ID)'
      'order by TWTREE_FULL')
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
        Name = 'fill_cashe'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end>
    object QueryRep1TW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'REPORT_ITOG_TDM_DETAL_AVG.TW_ID'
    end
    object QueryRep1TW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'REPORT_ITOG_TDM_DETAL_AVG.TW_ART'
    end
    object QueryRep1TW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'REPORT_ITOG_TDM_DETAL_AVG.TW_NAM'
      Size = 254
    end
    object QueryRep1TWTREE_ID: TIntegerField
      FieldName = 'TWTREE_ID'
      Origin = 'REPORT_ITOG_TDM_DETAL_AVG.TWTREE_ID'
    end
    object QueryRep1TWTREE_FULL: TIBStringField
      FieldName = 'TWTREE_FULL'
      Origin = 'REPORT_ITOG_TDM_DETAL_AVG.TWTREE_FULL'
      Size = 1000
    end
    object QueryRep1OST_KOL: TFloatField
      FieldName = 'OST_KOL'
      Origin = 'REPORT_ITOG_TDM_DETAL_AVG.OST_KOL'
      DisplayFormat = '#0.0000'
    end
    object QueryRep1SEB: TFloatField
      FieldName = 'SEB'
      Origin = 'REPORT_ITOG_TDM_DETAL_AVG.SEB'
      DisplayFormat = '#0.00'
    end
    object QueryRep1SEB2: TFloatField
      FieldName = 'SEB$'
      Origin = 'REPORT_ITOG_TDM_DETAL_AVG.SEB$'
      DisplayFormat = '#0.00'
    end
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
    Transaction = WorkTransaction
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
  object frDBDataSet1: TfrDBDataSet
    DataSet = QueryRep1
    Left = 278
    Top = 196
  end
  object DsRep1: TDataSource
    DataSet = QueryRep1
    Left = 436
    Top = 328
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    StoreInDFM = True
    OnGetValue = frReport1GetValue
    Left = 200
    Top = 194
    ReportForm = {
      18000000A40B0000180000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D60000000B004D61737465724461746131000201000000
      00E0000000F6020000100000003100050001000000000000000000DBDBDB0000
      0000000C0066724442446174615365743100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      440100000E005265706F727453756D6D617279310002010000000030010000F6
      020000120000003000010001000000000000000000DBDBDB0000000000000000
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200B00100000C005265706F72745469746C6531
      0002010000000044000000F60200004A00000030000000010000000000000000
      00DBDBDB0000000000000000000000000000FFFF000000000002000000010000
      000000000001000000C800000014000000010000000000000200330200000C00
      47726F75704865616465723100020100000000A8000000F60200001200000031
      00100001000000000000000000FFFFFF1F0000000017005B5175657279526570
      312E225457545245455F4944225D00000000000000FFFF000000000002000000
      010000000000000001000000C8000000140000000100000000000002009F0200
      000C0047726F7570466F6F746572310002010000000000010000F60200001000
      00003000110001000000000000000000FFFFFF1F000000000000000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      0100000000000000002E03000005004D656D6F3200020074020000E00000006C
      0000001000000043000F0001000000000000000000FFFFFF002E020101000000
      010011005B5175657279526570312E22534542225D00000000FFFF0000000000
      0200000001000000000500417269616C000900000000000000000001000000CC
      00020000000000FFFFFF0000000002000000000000000000C003000005004D65
      6D6F3500020068000000E0000000AC0100001000000043000F00010000000000
      00000000FFFFFF002E020000000000010014005B5175657279526570312E2254
      575F4E414D225D00000000FFFF00000000000200000001000000000500417269
      616C000800000000000000000000000000CC00020000000000FFFFFF00000000
      020000000000000000004504000005004D656D6F380002001400000030010000
      600200001200000043000F0001000000000000000000808080002E0200000000
      0001000700C8F2EEE3EE203A00000000FFFF0000000000020000000100000000
      0500417269616C000A0000000200FFFFFF0000000000CC00020000000000FFFF
      FF0000000002000000000000000000DC04000006004D656D6F31300002007402
      0000300100006C0000001200000043000F000100000000000000000080808000
      2E020101000000010018005B53554D285B5175657279526570312E2253454222
      5D295D00000000FFFF00000000000200000001000000000500417269616C000A
      0000000200FFFFFF0001000000CC00020000000000FFFFFF0000000002000000
      0000000000006905000006004D656D6F31310002001400000044000000D00200
      003800000043000F0001000000000000000000000000002E0200000000000100
      0E005B5245504F52545F5449544C455D00000000FFFF00000000000200000001
      000000000500417269616C000A0000000200FFFFFF0002000000CC0002000000
      0000FFFFFF0000000002000000000000000000E905000006004D656D6F313200
      0200140000007C000000200000001200000043000F0001000000000000000000
      FFFFFF002E02000000000001000100B900000000FFFF00000000000200000001
      000000000500417269616C000A00000002000000000002000000CC0002000000
      0000FFFFFF00000000020000000000000000007606000006004D656D6F313500
      0200780200007C0000006C0000001200000043000F0001000000000000000000
      FFFFFF002E02000000000001000E00CEF1F2E0F2EEEA20E220F0F3E12E000000
      00FFFF00000000000200000001000000000500417269616C0009000000020000
      00000002000000CC00020000000000FFFFFF0000000002000000000000000000
      0C07000005004D656D6F36000200140000000001000060020000100000004300
      0F0001000000000000000000C8FDCD002E02000000000001001800C8F2EEE3EE
      20E220E3F0F3EFEFE520F2EEE2E0F0EEE2203A00000000FFFF00000000000200
      000001000000000500417269616C000900000000000000000000000000CC0002
      0000000000FFFFFF0000000002000000000000000000A307000006004D656D6F
      313300020074020000000100006C0000001000000043000F0001000000000000
      000000C8FDCD002E020101000000010018005B53554D285B5175657279526570
      312E22534542225D295D00000000FFFF00000000000200000001000000000500
      417269616C000900000000000000000001000000CC00020000000000FFFFFF00
      000000020000000000000000004B08000006004D656D6F313400020014000000
      A8000000D0020000120000004300000001000000000000000000000080002E02
      000000000001002900C3F0F3EFEFE020F2EEE2E0F0EEE2203A5B517565727952
      6570312E225457545245455F46554C4C225D00000000FFFF0000000000020000
      0001000000000500417269616C000A0000000200FFFF000000000000CC000200
      00000000FFFFFF0000000002000000000000000000CD08000006004D656D6F31
      37000200340000007C000000340000001200000043000F000100000000000000
      0000FFFFFF002E02000000000001000300CAEEE400000000FFFF000000000002
      00000001000000000500417269616C000A00000002000000000002000000CC00
      020000000000FFFFFF00000000020000000000000000005F09000006004D656D
      6F3138000200680000007C000000B00100001200000043000F00010000000000
      00000000FFFFFF002E02000000000001001300CDE0E8ECE5EDEEE2E0EDE8E520
      F2EEE2E0F0E000000000FFFF0000000000020000000100000000050041726961
      6C000A00000002000000000002000000CC00020000000000FFFFFF0000000002
      000000000000000000E509000006004D656D6F3139000200180200007C000000
      600000001200000043000F0001000000000000000000FFFFFF002E0200000000
      0001000700CEF1F2E0F2EEEA00000000FFFF0000000000020000000100000000
      0500417269616C000900000002000000000002000000CC00020000000000FFFF
      FF0000000002000000000000000000790A000006004D656D6F32300002001402
      0000E0000000600000001000000043000F0001000000000000000000FFFFFF00
      2E020101000000010015005B5175657279526570312E224F53545F4B4F4C225D
      00000000FFFF00000000000200000001000000000500417269616C0009000000
      00000000000001000000CC00020000000000FFFFFF0000000002000000000000
      0000000C0B000006004D656D6F323100020034000000E0000000340000001000
      000043000F0001000000000000000000FFFFFF002E020000000000010014005B
      5175657279526570312E2254575F415254225D00000000FFFF00000000000200
      000001000000000500417269616C000900000000000000000000000000CC0002
      0000000000FFFFFF0000000002000000000000000000950B000006004D656D6F
      323200020014000000E0000000200000001000000043000F0001000000000000
      000000FFFFFF002E02000000000001000A005B43555252454E54235D00000000
      FFFF00000000000200000001000000000500417269616C000900000000000000
      000000000000CC00020000000000FFFFFF000000000200000000000000FEFEFF
      000000000000000000000000}
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
