object REP_PN: TREP_PN
  Left = 205
  Top = 66
  Width = 369
  Height = 367
  Caption = '����� �� ��������'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 8
    Width = 67
    Height = 13
    Caption = '�� ������ � :'
  end
  object Label2: TLabel
    Left = 170
    Top = 8
    Width = 18
    Height = 13
    Caption = '�� :'
  end
  object Label8: TLabel
    Left = 8
    Top = 34
    Width = 45
    Height = 15
    AutoSize = False
    Caption = '����� :'
  end
  object DT1: TDateEdit
    Left = 72
    Top = 4
    Width = 95
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object DT2: TDateEdit
    Left = 192
    Top = 4
    Width = 95
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object GroupBox3: TGroupBox
    Left = 6
    Top = 64
    Width = 347
    Height = 43
    Caption = ' ��������� ��������� '
    TabOrder = 2
    object BtnPntyp: TSpeedButton
      Left = 312
      Top = 14
      Width = 23
      Height = 22
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777777700000007777747474747477700000007777
        7477777777777000000077774447777774777000000077777477777777777000
        00007777777777777477700000007770000007700000000000007000FBFB0000
        FBFB0000000070F0000000F000000000000070FFFFF070FFFFF07000000070F8
        88F070F888F07000000070FFFFF070FFFFF07000000070F888F070F888F07000
        000070FFFFF070FFFFF070000000700000007000000070000000777777777777
        777770000000}
      OnClick = BtnPntypClick
    end
    object Edit1: TEdit
      Left = 6
      Top = 14
      Width = 299
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
  end
  object BtnStart: TButton
    Left = 276
    Top = 306
    Width = 75
    Height = 25
    Caption = '���������'
    TabOrder = 3
    OnClick = BtnStartClick
  end
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 116
    Width = 341
    Height = 177
    DataSource = DataSource2
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PNTYP_SHORT'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMM'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDS'
        Width = 87
        Visible = True
      end>
  end
  object FRM: TRxDBLookupCombo
    Left = 73
    Top = 34
    Width = 224
    Height = 20
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'FRM_ID'
    LookupDisplay = 'FRM_NAME'
    LookupSource = DsFrm
    TabOrder = 5
  end
  object BtnPrint: TButton
    Left = 182
    Top = 306
    Width = 75
    Height = 25
    Caption = '������'
    Enabled = False
    TabOrder = 6
    OnClick = BtnPrintClick
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 380
    Top = 132
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 380
    Top = 80
  end
  object DualListDialog1: TDualListDialog
    Sorted = False
    Label1Caption = '&���������� ���������'
    Label2Caption = '&��������� ���������'
    HelpContext = 0
    Left = 316
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = IBQuery1
    Left = 128
    Top = 216
  end
  object DsFrm: TDataSource
    DataSet = MemFrm
    Left = 62
    Top = 399
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
    Left = 60
    Top = 347
    object MemFrmFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
    end
    object MemFrmFRM_NAME: TStringField
      FieldName = 'FRM_NAME'
      Size = 128
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select pntyp_short, summ, nds from rep_pn(:dt1, :dt2, :frm_id, :' +
        'pntyp_s)')
    Left = 392
    Top = 292
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
        Name = 'frm_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pntyp_s'
        ParamType = ptUnknown
      end>
    object IBQuery1PNTYP_SHORT: TIBStringField
      DisplayLabel = '��� ���������'
      FieldName = 'PNTYP_SHORT'
      Origin = 'REP_PN.PNTYP_SHORT'
      Size = 32
    end
    object IBQuery1SUMM: TFloatField
      DisplayLabel = '�����'
      FieldName = 'SUMM'
      Origin = 'REP_PN.SUMM'
      DisplayFormat = '#,0.00'
    end
    object IBQuery1NDS: TFloatField
      DisplayLabel = '���'
      FieldName = 'NDS'
      Origin = 'REP_PN.NDS'
      DisplayFormat = '#,0.00'
    end
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 392
    Top = 244
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnGetValue = frReport1GetValue
    Left = 76
    Top = 160
    ReportForm = {
      18000000CB070000180000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D60000000B004D61737465724461746131000201000000
      00A8000000F6020000100000003000050001000000000000000000DBDBDB0000
      0000000C0066724442446174615365743100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      440100000E005265706F727453756D6D6172793100020100000000E0000000F6
      020000120000003000010001000000000000000000DBDBDB0000000000000000
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200B00100000C005265706F72745469746C6531
      000201000000002C000000F60200004A00000030000000010000000000000000
      00DBDBDB0000000000000000000000000000FFFF000000000002000000010000
      000000000001000000C8000000140000000100000000000000003F0200000500
      4D656D6F32000200B8010000A8000000940000001000000043000F0001000000
      000000000000FFFFFF002E020301000000010011005B49425175657279312E22
      53554D4D225D00000000FFFF0000000000020000000100000000050041726961
      6C000900000000000000000001000000CC00020000000000FFFFFF0000000002
      000000000000000000D502000005004D656D6F3500020014000000A8000000A4
      0100001000000043000F0001000000000000000000FFFFFF002E020000000000
      010018005B49425175657279312E22504E5459505F53484F5254225D00000000
      FFFF00000000000200000001000000000500417269616C000900000000000000
      000000000000CC00020000000000FFFFFF00000000020000000000000000005A
      03000005004D656D6F3800020014000000E0000000A40100001200000043000F
      0001000000000000000000808080002E02000000000001000700C8F2EEE3EE20
      3A00000000FFFF00000000000200000001000000000500417269616C000A0000
      000200FFFFFF0000000000CC00020000000000FFFFFF00000000020000000000
      00000000E703000006004D656D6F3131000200140000002C0000004C02000038
      00000043000F0001000000000000000000808080002E02000000000001000E00
      5B5245504F52545F5449544C455D00000000FFFF000000000002000000010000
      00000500417269616C000A0000000200FFFFFF0000000000CC00020000000000
      FFFFFF00000000020000000000000000007304000006004D656D6F3132000200
      1400000064000000A40100001200000043000F0001000000000000000000FFFF
      FF002E02000000000001000D00D2E8EF20EDE0EAEBE0E4EDEEE900000000FFFF
      00000000000200000001000000000500417269616C000A000000020000000000
      02000000CC00020000000000FFFFFF0000000002000000000000000000F70400
      0006004D656D6F3135000200B801000064000000940000001200000043000F00
      01000000000000000000FFFFFF002E02000000000001000500D1F3ECECE00000
      0000FFFF00000000000200000001000000000500417269616C00090000000200
      0000000002000000CC00020000000000FFFFFF00000000020000000000000000
      008505000005004D656D6F310002004C020000A8000000940000001000000043
      000F0001000000000000000000FFFFFF002E020301000000010010005B494251
      75657279312E224E4453225D00000000FFFF0000000000020000000100000000
      0500417269616C000900000000000000000001000000CC00020000000000FFFF
      FF00000000020000000000000000000606000005004D656D6F330002004C0200
      0064000000940000001200000043000F0001000000000000000000FFFFFF002E
      02000000000001000300CDC4D100000000FFFF00000000000200000001000000
      000500417269616C000900000002000000000002000000CC00020000000000FF
      FFFF00000000020000000000000000009C06000005004D656D6F34000200B801
      0000E0000000940000001200000043000F0001000000000000000000FFFFFF00
      2E020301000000010018005B53554D285B49425175657279312E2253554D4D22
      5D295D00000000FFFF00000000000200000001000000000500417269616C0009
      00000000000000000001000000CC00020000000000FFFFFF0000000002000000
      0000000000003107000005004D656D6F360002004C020000E000000094000000
      1200000043000F0001000000000000000000FFFFFF002E020301000000010017
      005B53554D285B49425175657279312E224E4453225D295D00000000FFFF0000
      0000000200000001000000000500417269616C00090000000000000000000100
      0000CC00020000000000FFFFFF0000000002000000000000000000BC07000005
      004D656D6F37000200600200002C000000800000001200000043000000010000
      00000000000000FFFFFF1F2E02000000000001000D005B444154455D205B5449
      4D455D00000000FFFF00000000000200000001000000000500417269616C0008
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      00000000FEFEFF000000000000000000000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = IBQuery1
    Left = 180
    Top = 168
  end
end
