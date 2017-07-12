object EXP_1C: TEXP_1C
  Left = 302
  Top = 211
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Выгрузка документов'
  ClientHeight = 333
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 520
    Top = 270
    Width = 75
    Height = 25
    Caption = 'Выгрузить'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 598
    Top = 270
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Check_CLEAR: TCheckBox
    Left = 4
    Top = 274
    Width = 193
    Height = 17
    Caption = 'Очистить перед выгрузкой!'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 2
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 314
    Width = 680
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 53
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 4
    object Label1: TLabel
      Left = 388
      Top = 32
      Width = 12
      Height = 13
      Caption = 'с :'
    end
    object Label2: TLabel
      Left = 530
      Top = 32
      Width = 18
      Height = 13
      Caption = 'по :'
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Фирма :'
    end
    object Label6: TLabel
      Left = 26
      Top = 32
      Width = 30
      Height = 13
      Caption = 'Путь :'
    end
    object DT1: TDateEdit
      Left = 404
      Top = 28
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DT2: TDateEdit
      Left = 552
      Top = 28
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object FRM: TRxDBLookupCombo
      Left = 56
      Top = 4
      Width = 213
      Height = 21
      DropDownCount = 8
      LookupField = 'FRM_ID'
      LookupDisplay = 'FRM_FULL'
      LookupSource = DsPnDicFrm
      TabOrder = 2
      OnChange = FRMChange
    end
    object PathFile: TEdit
      Left = 56
      Top = 28
      Width = 321
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = 'c:\---\test.txt'
    end
    object DBEdit1: TDBEdit
      Left = 270
      Top = 4
      Width = 401
      Height = 21
      DataField = 'FRM_REKW'
      DataSource = DsPnDicFrm
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 53
    Width = 680
    Height = 54
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 5
    object BtnPN: TSpeedButton
      Left = 386
      Top = 8
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
      OnClick = BtnPNClick
    end
    object Check_PN: TCheckBox
      Left = 38
      Top = 8
      Width = 147
      Height = 17
      Caption = 'Приходные накладные :'
      TabOrder = 0
      OnClick = Check_PNClick
    end
    object CHECK_ADM: TCheckBox
      Left = 186
      Top = 34
      Width = 127
      Height = 17
      Caption = 'Административные'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CHECK_HOZ: TCheckBox
      Left = 316
      Top = 34
      Width = 125
      Height = 17
      Caption = 'Хозяйственные'
      TabOrder = 2
    end
    object LIST_PN: TEdit
      Left = 186
      Top = 8
      Width = 199
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = 'LIST_PN'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 107
    Width = 680
    Height = 114
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 6
    object BtnRN: TSpeedButton
      Left = 386
      Top = 4
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
      OnClick = BtnRNClick
    end
    object Check_RN: TCheckBox
      Left = 36
      Top = 6
      Width = 145
      Height = 17
      Caption = 'Расходные накладные :'
      TabOrder = 0
      OnClick = Check_RNClick
    end
    object Check_SPIS: TCheckBox
      Left = 36
      Top = 32
      Width = 105
      Height = 17
      Caption = 'Акты списания'
      TabOrder = 1
    end
    object LIST_RN: TEdit
      Left = 186
      Top = 4
      Width = 199
      Height = 21
      Enabled = False
      TabOrder = 2
      Text = 'LIST_RN'
    end
    object PO_CHECK: TCheckBox
      Left = 36
      Top = 56
      Width = 97
      Height = 17
      Caption = 'Предоплаты'
      TabOrder = 3
    end
    object chkZays: TCheckBox
      Left = 36
      Top = 84
      Width = 169
      Height = 17
      Caption = 'Заявки на закупку'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 221
    Width = 680
    Height = 34
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 7
    object Check_AN: TCheckBox
      Left = 34
      Top = 8
      Width = 141
      Height = 17
      Caption = 'Выгружать аналитику '
      TabOrder = 0
    end
    object Check_PER: TCheckBox
      Left = 228
      Top = 8
      Width = 281
      Height = 17
      Caption = 'Выгрузить перемещения для логистики'
      TabOrder = 1
    end
  end
  object ClearFirms: TCheckBox
    Left = 232
    Top = 275
    Width = 233
    Height = 17
    Caption = 'Удалять накладные других фирм'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object PnDicFrm: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PnDicFrmTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from pn_dic_frm(:FRM_ID)')
    Left = 574
    Top = 61
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end>
    object PnDicFrmFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
      Origin = 'PN_DIC_FRM.FRM_ID'
    end
    object PnDicFrmFRM_FULL: TIBStringField
      FieldName = 'FRM_FULL'
      Origin = 'PN_DIC_FRM.FRM_FULL'
      Size = 5000
    end
    object PnDicFrmFRM_REKW: TIBStringField
      FieldName = 'FRM_REKW'
      Origin = 'PN_DIC_FRM.FRM_REKW'
      Size = 5000
    end
  end
  object DsPnDicFrm: TDataSource
    DataSet = PnDicFrm
    Left = 436
    Top = 61
  end
  object PnDicFrmTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 374
    Top = 9
  end
  object DualListDialog1: TDualListDialog
    Sorted = False
    Label1Caption = '&Типы накладных'
    Label2Caption = '&Типы для расчёта'
    HelpContext = 0
    Left = 262
    Top = 10
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 4
    Top = 56
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 624
    Top = 136
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 506
    Top = 62
  end
  object DualListDialog2: TDualListDialog
    Sorted = False
    Label1Caption = '&Типы накладных'
    Label2Caption = '&Типы для расчёта'
    HelpContext = 0
    Left = 464
    Top = 8
  end
  object QueryWork3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 630
    Top = 60
  end
  object QueryWork4: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 570
    Top = 10
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    Left = 486
    Top = 116
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 300
    Left = 434
    Top = 114
  end
  object KorrTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 98
    Top = 73
  end
  object QueryKorr: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = KorrTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from korr_summ_detal(:dt1,:dt2)')
    Left = 98
    Top = 121
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
      end>
  end
end
