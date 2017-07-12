object DOC_PO: TDOC_PO
  Left = 264
  Top = 323
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Документ. Предоплата'
  ClientHeight = 429
  ClientWidth = 787
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
  object Label1: TLabel
    Left = 396
    Top = 36
    Width = 40
    Height = 13
    Caption = 'Номер :'
  end
  object Label2: TLabel
    Left = 398
    Top = 60
    Width = 32
    Height = 13
    Caption = 'Дата :'
  end
  object Label3: TLabel
    Left = 40
    Top = 148
    Width = 40
    Height = 13
    Caption = 'Сумма :'
  end
  object Label4: TLabel
    Left = 14
    Top = 90
    Width = 62
    Height = 13
    Caption = 'Основание :'
  end
  object Label5: TLabel
    Left = 34
    Top = 62
    Width = 42
    Height = 13
    Caption = 'Клиент :'
  end
  object Label6: TLabel
    Left = 346
    Top = 148
    Width = 48
    Height = 13
    Caption = 'Остаток :'
  end
  object Label8: TLabel
    Left = 32
    Top = 38
    Width = 49
    Height = 13
    AutoSize = False
    Caption = 'Фирма : '
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 787
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = ActSave
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Action = ActApply
    end
    object ToolButton3: TToolButton
      Left = 50
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 39
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 58
      Top = 2
      Action = ActKKM
    end
    object ToolButton5: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 46
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 91
      Top = 2
      Action = ActHistory
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 410
    Width = 787
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object PO_NUM: TEdit
    Left = 444
    Top = 34
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'PO_NUM'
    OnChange = PO_NUMChange
  end
  object PO_DATE: TDateEdit
    Left = 444
    Top = 60
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 3
    OnAcceptDate = PO_DATEAcceptDate
  end
  object PO_SUMM: TRxCalcEdit
    Left = 84
    Top = 148
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб##'
    MaxValue = 1000000
    MinValue = 0.01
    NumGlyphs = 2
    TabOrder = 7
    Value = 0.01
    OnChange = PO_NUMChange
  end
  object PO_OSN: TEdit
    Left = 80
    Top = 88
    Width = 309
    Height = 21
    TabOrder = 6
    Text = 'PO_OSN'
    OnChange = PO_NUMChange
  end
  object KLN_NAME: TEdit
    Left = 80
    Top = 60
    Width = 281
    Height = 21
    Enabled = False
    TabOrder = 4
    Text = 'KLN_NAME'
  end
  object BTN_KLN: TBitBtn
    Left = 362
    Top = 60
    Width = 25
    Height = 21
    Hint = 'Выбрать клиента из справочника контактов (F10)'
    TabOrder = 5
    TabStop = False
    OnClick = BTN_KLNClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
      0555088888888888805508000000000088055080FFFFFF0508800000000000F0
      F0800FFFFFFFFF0F008050F00F00FFF0F08050FFFFFFFFF0F080000FFFFFFFFF
      00000900F00000F00090090FFFFFFFFF0090000FFFFFFFFF0F00550F000F00FF
      0F05550FFFFFFFFF0005550FFF00000005555550005555555555}
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 180
    Width = 787
    Height = 212
    Align = alBottom
    DataSource = DsUse
    DefaultDrawing = False
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawDataCell = RxDBGrid1DrawDataCell
    OnDrawColumnCell = RxDBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'DOC_DATE'
        Title.Alignment = taCenter
        Title.Caption = 'Дата'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_FULL_NUM'
        Title.Alignment = taCenter
        Title.Caption = 'Номер'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма документа'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Списано с предоплаты'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_OSN'
        Title.Alignment = taCenter
        Title.Caption = 'Основание'
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KLN_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Клиент'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Кто оформил'
        Width = 153
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 392
    Width = 787
    Height = 18
    Align = alBottom
    BevelOuter = bvLowered
    Caption = 'Списание средств с предоплаты :'
    TabOrder = 9
  end
  object PO_OST: TRxCalcEdit
    Left = 402
    Top = 148
    Width = 91
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00##'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 10
  end
  object CBPaymentType: TCheckBox
    Left = 400
    Top = 92
    Width = 249
    Height = 17
    Caption = 'Безналичный расчет (по пластиковой карте)'
    TabOrder = 11
  end
  object NDSType: TComboBox
    Left = 400
    Top = 112
    Width = 241
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 12
    Items.Strings = (
      'Не выделять в чеке НДС'
      'Выделять в чеке НДС 18%'
      'Выделять в чеке НДС 20%')
  end
  object FRM: TRxDBLookupCombo
    Left = 80
    Top = 34
    Width = 308
    Height = 20
    DropDownCount = 8
    EscapeClear = False
    LookupField = 'KLN_ID'
    LookupDisplay = 'KLN_FULL'
    LookupSource = DataModule1.MainDsAllFrm
    TabOrder = 13
    OnChange = FRMChange
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 210
    Top = 276
    object ActSave: TAction
      Caption = 'Сохранить'
      Hint = 'Сохранить'
      ImageIndex = 39
      ShortCut = 16397
      OnExecute = ActSaveExecute
    end
    object ActApply: TAction
      Caption = 'Применить'
      Hint = 'Применить'
      ImageIndex = 38
      ShortCut = 16467
      OnExecute = ActApplyExecute
    end
    object ActKKM: TAction
      Caption = 'Печать чека на ККМ'
      Hint = 'Печать чека на ККМ'
      ImageIndex = 45
      ShortCut = 118
      OnExecute = ActKKMExecute
    end
    object ActHistory: TAction
      Caption = 'История документа...'
      Hint = 'История документа...'
      ImageIndex = 3
      ShortCut = 123
      OnExecute = ActHistoryExecute
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    OnIdleTimer = PO_NUMChange
    Left = 294
    Top = 212
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 292
    Top = 268
  end
  object UseTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 370
    Top = 292
  end
  object QueryUse: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = UseTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from po_use(:po_id) order by doc_date')
    Left = 424
    Top = 268
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'po_id'
        ParamType = ptUnknown
      end>
    object QueryUseDOC_TYP: TIntegerField
      FieldName = 'DOC_TYP'
      Origin = 'PO_USE.DOC_TYP'
    end
    object QueryUseDOC_ID: TIntegerField
      FieldName = 'DOC_ID'
      Origin = 'PO_USE.DOC_ID'
    end
    object QueryUseDOC_DATE: TDateTimeField
      FieldName = 'DOC_DATE'
      Origin = 'PO_USE.DOC_DATE'
    end
    object QueryUseDOC_FULL_NUM: TIBStringField
      FieldName = 'DOC_FULL_NUM'
      Origin = 'PO_USE.DOC_FULL_NUM'
      Size = 64
    end
    object QueryUseDOC_SUMM: TFloatField
      FieldName = 'DOC_SUMM'
      Origin = 'PO_USE.DOC_SUMM'
      DisplayFormat = '#0.00 руб'
    end
    object QueryUseDOC_OSN: TIBStringField
      FieldName = 'DOC_OSN'
      Origin = 'PO_USE.DOC_OSN'
      Size = 254
    end
    object QueryUseKLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Origin = 'PO_USE.KLN_FULL'
      Size = 254
    end
    object QueryUseUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'PO_USE.US_FULL'
      Size = 254
    end
    object QueryUseDOC_COLOR: TIntegerField
      FieldName = 'DOC_COLOR'
      Origin = 'PO_USE.DOC_COLOR'
    end
    object QueryUsePO_SUMM: TFloatField
      FieldName = 'PO_SUMM'
      Origin = 'PO_USE.PO_SUMM'
      DisplayFormat = '#0.00 руб'
    end
  end
  object DsUse: TDataSource
    DataSet = QueryUse
    Left = 534
    Top = 286
  end
end
