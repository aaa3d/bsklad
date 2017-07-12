object REPORT_NAC_TABEL: TREPORT_NAC_TABEL
  Left = 204
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Итоговый отчет о наценке по табелям-группам-магазинам'
  ClientHeight = 490
  ClientWidth = 749
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 32
    Width = 67
    Height = 13
    Caption = 'За период с :'
  end
  object Label2: TLabel
    Left = 254
    Top = 34
    Width = 18
    Height = 13
    Caption = 'по :'
  end
  object Label3: TLabel
    Left = 40
    Top = 102
    Width = 85
    Height = 13
    Caption = 'Группа товаров :'
  end
  object Label5: TLabel
    Left = 4
    Top = 130
    Width = 121
    Height = 13
    Caption = 'Расходные накладные :'
  end
  object BtnDic: TSpeedButton
    Left = 406
    Top = 98
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
  object SpeedButton2: TSpeedButton
    Left = 406
    Top = 126
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
    OnClick = SpeedButton2Click
  end
  object BtnDynDic: TSpeedButton
    Left = 377
    Top = 98
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
  object Label8: TLabel
    Left = 80
    Top = 2
    Width = 45
    Height = 15
    AutoSize = False
    Caption = 'Фирма :'
  end
  object Label4: TLabel
    Left = 452
    Top = 4
    Width = 155
    Height = 13
    Caption = 'Диапазон измерения наценки'
  end
  object Label6: TLabel
    Left = 440
    Top = 24
    Width = 13
    Height = 13
    Caption = 'От'
  end
  object Label7: TLabel
    Left = 440
    Top = 52
    Width = 15
    Height = 13
    Caption = 'До'
  end
  object BtnOK: TButton
    Left = 666
    Top = 8
    Width = 75
    Height = 23
    Caption = 'Построить'
    TabOrder = 0
    OnClick = BtnOKClick
  end
  object DT1: TDateEdit
    Left = 128
    Top = 28
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object DT2: TDateEdit
    Left = 276
    Top = 28
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object TW: TEdit
    Left = 128
    Top = 98
    Width = 245
    Height = 21
    TabOrder = 3
    Text = 'TW'
  end
  object Edit2: TEdit
    Left = 128
    Top = 126
    Width = 273
    Height = 21
    TabOrder = 4
    Text = 'Edit2'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 156
    Width = 749
    Height = 334
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DsReport
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TABEL_TW_GROUP'
        Title.Alignment = taCenter
        Title.Caption = 'Табель-Группа-Магазин'
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nac'
        Title.Alignment = taCenter
        Title.Caption = 'Наценка в руб.'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'oborot'
        Title.Alignment = taCenter
        Title.Caption = 'Оборот, руб'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'proc'
        Title.Caption = '% наценки'
        Visible = True
      end>
  end
  object BtnPrint: TButton
    Left = 666
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Печать'
    Enabled = False
    TabOrder = 6
    OnClick = BtnPrintClick
  end
  object btnExcel: TButton
    Left = 632
    Top = 99
    Width = 109
    Height = 25
    Caption = 'Выгрузить в Excel'
    Enabled = False
    TabOrder = 7
    OnClick = btnExcelClick
  end
  object FRM: TRxDBLookupCombo
    Left = 129
    Top = 2
    Width = 224
    Height = 20
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'FRM_ID'
    LookupDisplay = 'FRM_NAME'
    LookupSource = DsFrm
    TabOrder = 8
  end
  object GroupBox1: TGroupBox
    Left = 56
    Top = 56
    Width = 373
    Height = 37
    Caption = 'Группировка'
    TabOrder = 9
    object RadioButton1: TRadioButton
      Left = 20
      Top = 12
      Width = 113
      Height = 17
      Caption = 'По табелю'
      TabOrder = 0
    end
    object RadioButton2: TRadioButton
      Left = 116
      Top = 12
      Width = 113
      Height = 17
      Caption = 'По группе товара'
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Left = 252
      Top = 12
      Width = 113
      Height = 17
      Caption = 'По магазину'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
  end
  object ComboBox1: TComboBox
    Left = 460
    Top = 20
    Width = 165
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
    Items.Strings = (
      'Оптовой цены'
      'Крупнооптовой цены'
      'Спеццены'
      'Цены перепродажи'
      'Закупки')
  end
  object ComboBox2: TComboBox
    Left = 460
    Top = 48
    Width = 165
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
    Items.Strings = (
      'Фактической цены продажи'
      'Оптовой цены'
      'Крупный опт'
      'Спеццены'
      'Цены перепродажи')
  end
  object chkNotUseRozn: TCheckBox
    Left = 456
    Top = 80
    Width = 225
    Height = 17
    Caption = 'Не учитывать закупки с розницы'
    TabOrder = 12
  end
  object Button1: TButton
    Left = 632
    Top = 127
    Width = 109
    Height = 25
    Caption = 'Подробно в Excel'
    TabOrder = 13
    OnClick = Button1Click
  end
  object ReportTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
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
      
        'select  from report_nac_tabel(:dt1, :dt2, :frm_id, :group_field,' +
        ' :start_twtree_id, :start_twtree_typ, :rntyps, :low_money, hi_mo' +
        'ney)')
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
        Name = 'frm_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'group_field'
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
        Name = 'rntyps'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'low_money'
        ParamType = ptUnknown
      end>
  end
  object MemReport: TRxMemoryData
    FieldDefs = <
      item
        Name = 'MEN_FULL'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'typ'
        DataType = ftInteger
      end
      item
        Name = 'typ_full'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'nac'
        DataType = ftFloat
      end
      item
        Name = 'nac$'
        DataType = ftFloat
      end
      item
        Name = 'valuta_id'
        DataType = ftInteger
      end
      item
        Name = 'valuta_full'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'seb'
        DataType = ftFloat
      end
      item
        Name = 'seb$'
        DataType = ftFloat
      end>
    Left = 552
    Top = 276
    object MemReportTABEL_TW_GROUP: TStringField
      DisplayWidth = 30
      FieldName = 'TABEL_TW_GROUP'
      Size = 254
    end
    object MemReportnac: TFloatField
      DisplayWidth = 12
      FieldName = 'nac'
      DisplayFormat = '#0.00 руб'
    end
    object MemReportoborot: TFloatField
      FieldName = 'oborot'
      DisplayFormat = '#0.00 руб'
    end
    object MemReportproc: TFloatField
      FieldName = 'proc'
      DisplayFormat = '#0.00'
    end
  end
  object DsReport: TDataSource
    DataSet = MemReport
    Left = 548
    Top = 326
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
    AutoStopAction = saNone
    Left = 62
    Top = 174
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ReportTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 110
    Top = 224
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 48
    Top = 290
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
      18000000D7080000180000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200D60000000B004D61737465724461746131000201000000
      00CC000000F6020000100000003000050001000000000000000000DBDBDB0000
      0000000C0066724442446174615365743100000000000000FFFF000000000002
      000000010000000000000001000000C800000014000000010000000000000200
      440100000E005265706F727453756D6D617279310002010000000030010000F6
      020000120000003000010001000000000000000000DBDBDB0000000000000000
      000000000000FFFF000000000002000000010000000000000001000000C80000
      0014000000010000000000000200B00100000C005265706F72745469746C6531
      0002010000000024000000F60200001400000031000000010000000000000000
      00DBDBDB0000000000000000000000000000FFFF000000000002000000010000
      000000000001000000C8000000140000000100000000000002001B0200000B00
      50616765486561646572310002010000000080000000F6020000120000003000
      020001000000000000000000FFFFFF1F00000000000000000000000000FFFF00
      0000000002000000010000000000000001000000C80000001400000001000000
      0000000000AB02000005004D656D6F3200020094010000CC0000005400000010
      00000043000F0001000000000000000000FFFFFF002E02030100000001001200
      5B4D656D5265706F72742E2270726F63225D00000000FFFF0000000000020000
      0001000000000500417269616C000900000000000000000001000000CC000200
      00000000FFFFFF00000000020000000000000000003D03000005004D656D6F33
      00020038010000CC0000005C0000001000000043000F00010000000000000000
      00FFFFFF002E020301000000010014005B4D656D5265706F72742E226F626F72
      6F74225D00000000FFFF00000000000200000001000000000500417269616C00
      0900000000000000000000000000CC00020000000000FFFFFF00000000020000
      00000000000000CC03000005004D656D6F34000200C8000000CC000000700000
      001000000043000F0001000000000000000000FFFFFF002E0203010000000100
      11005B4D656D5265706F72742E226E6163225D00000000FFFF00000000000200
      000001000000000500417269616C000900000000000000000000000000CC0002
      0000000000FFFFFF00000000020000000000000000006604000005004D656D6F
      3500020014000000CC000000B40000001000000043000F000100000000000000
      0000FFFFFF002E02000000000001001C005B4D656D5265706F72742E22544142
      454C5F54575F47524F5550225D00000000FFFF00000000000200000001000000
      000500417269616C000900000000000000000000000000CC00020000000000FF
      FFFF0000000002000000000000000000EB04000005004D656D6F380002001400
      000030010000800100001200000043000F000100000000000000000080808000
      2E02000000000001000700C8F2EEE3EE203A00000000FFFF0000000000020000
      0001000000000500417269616C000A0000000200FFFFFF0000000000CC000200
      00000000FFFFFF00000000020000000000000000007805000006004D656D6F31
      310002001400000024000000CC0200001400000043000F000100000000000000
      0000808080002E02000000000001000E005B5245504F52545F5449544C455D00
      000000FFFF00000000000200000001000000000500417269616C000A00000002
      00FFFFFF0000000000CC00020000000000FFFFFF000000000200000000000000
      00000606000006004D656D6F31320002001400000080000000B4000000120000
      0043000F0001000000000000000000FFFFFF002E02000000000001000F00C3F0
      F3EFEFE0202F20D2E0E1E5EBFC00000000FFFF00000000000200000001000000
      000500417269616C000A00000002000000000002000000CC00020000000000FF
      FFFF00000000020000000000000000008C06000006004D656D6F3133000200C8
      00000080000000700000001200000043000F0001000000000000000000FFFFFF
      002E02000000000001000700CDE0F6E5EDEAE000000000FFFF00000000000200
      000001000000000500417269616C000A00000002000000000002000000CC0002
      0000000000FFFFFF00000000020000000000000000001107000006004D656D6F
      313400020038010000800000005C0000001200000043000F0001000000000000
      000000FFFFFF002E02000000000001000600CEE1EEF0EEF200000000FFFF0000
      0000000200000001000000000500417269616C000A0000000200000000000000
      0000CC00020000000000FFFFFF00000000020000000000000000009907000006
      004D656D6F31350002009401000080000000540000001200000043000F000100
      0000000000000000FFFFFF002E020000000000010009002520EDE0F6E5EDEAE8
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      02000000000002000000CC00020000000000FFFFFF0000000002000000000000
      0000003208000005004D656D6F3100020038010000300100005C000000100000
      0043000F0001000000000000000000FFFFFF002E02030100000001001B005B53
      554D285B4D656D5265706F72742E226F626F726F74225D295D00000000FFFF00
      000000000200000001000000000500417269616C000900000000000000000000
      000000CC00020000000000FFFFFF0000000002000000000000000000C8080000
      05004D656D6F36000200C800000030010000700000001000000043000F000100
      0000000000000000FFFFFF002E020301000000010018005B53554D285B4D656D
      5265706F72742E226E6163225D295D00000000FFFF0000000000020000000100
      0000000500417269616C000900000000000000000000000000CC000200000000
      00FFFFFF000000000200000000000000FEFEFF000000000000000000000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = MemReport
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
    Left = 316
    Top = 283
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
    Left = 318
    Top = 335
  end
  object QueryRep2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ReportTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select '
      'tw_art, tw_nam, rns_tabel, rn_date, shop_name,'
      'frm_prefix, post_name,'
      'money_zak*tw_kol money_zak,'
      'money_spec*tw_kol money_spec,'
      'money_fact_nalog*tw_kol money_fact_nalog  '
      ''
      
        'from report_nac_tabel(:dt1, :dt2, :frm_id,  :start_twtree_id, :s' +
        'tart_twtree_typ, :rntyps, :not_use_rozn)'
      '')
    Left = 442
    Top = 340
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
        Name = 'rntyps'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'not_use_rozn'
        ParamType = ptUnknown
      end>
    object QueryRep2TW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'REPORT_NAC_TABEL.TW_ART'
    end
    object QueryRep2TW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'REPORT_NAC_TABEL.TW_NAM'
      Size = 254
    end
    object QueryRep2RNS_TABEL: TIntegerField
      FieldName = 'RNS_TABEL'
      Origin = 'REPORT_NAC_TABEL.RNS_TABEL'
    end
    object QueryRep2RN_DATE: TDateTimeField
      FieldName = 'RN_DATE'
      Origin = 'REPORT_NAC_TABEL.RN_DATE'
    end
    object QueryRep2SHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Origin = 'REPORT_NAC_TABEL.SHOP_NAME'
      Size = 254
    end
    object QueryRep2FRM_PREFIX: TIBStringField
      FieldName = 'FRM_PREFIX'
      Origin = 'REPORT_NAC_TABEL.FRM_PREFIX'
      Size = 32
    end
    object QueryRep2POST_NAME: TIBStringField
      FieldName = 'POST_NAME'
      Origin = 'REPORT_NAC_TABEL.POST_NAME'
      Size = 254
    end
    object QueryRep2MONEY_ZAK: TFloatField
      FieldName = 'MONEY_ZAK'
    end
    object QueryRep2MONEY_SPEC: TFloatField
      FieldName = 'MONEY_SPEC'
    end
    object QueryRep2MONEY_FACT_NALOG: TFloatField
      FieldName = 'MONEY_FACT_NALOG'
    end
  end
end
