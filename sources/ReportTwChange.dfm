object REPORT_TW_CHANGE: TREPORT_TW_CHANGE
  Left = 15
  Top = 103
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Перечень товаров, измененных за период'
  ClientHeight = 371
  ClientWidth = 765
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 765
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object Label2: TLabel
      Left = 0
      Top = 2
      Width = 27
      Height = 24
      Caption = '   c :  '
      Layout = tlCenter
    end
    object DT1: TDateEdit
      Left = 27
      Top = 2
      Width = 121
      Height = 24
      NumGlyphs = 2
      TabOrder = 0
      OnChange = DT2Change
    end
    object Label1: TLabel
      Left = 148
      Top = 2
      Width = 33
      Height = 24
      Caption = '   по :  '
      Layout = tlCenter
    end
    object DT2: TDateEdit
      Left = 181
      Top = 2
      Width = 121
      Height = 24
      NumGlyphs = 2
      TabOrder = 1
      OnChange = DT2Change
    end
    object ToolButton1: TToolButton
      Left = 302
      Top = 2
      Width = 19
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object BtnRefresh: TToolButton
      Left = 321
      Top = 2
      Hint = 'Обновить'
      Caption = 'BtnRefresh'
      ImageIndex = 44
      OnClick = BtnRefreshClick
    end
    object ToolButton3: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BtnCenn: TToolButton
      Left = 354
      Top = 2
      Hint = 'Напечатать один ценник'
      Caption = 'BtnCenn'
      Enabled = False
      ImageIndex = 40
      OnClick = BtnCennClick
    end
    object BtnCennAll: TToolButton
      Left = 379
      Top = 2
      Hint = 'Напечатать все ценники'
      Caption = 'BtnCennAll'
      Enabled = False
      ImageIndex = 41
      OnClick = BtnCennAllClick
    end
    object ToolButton2: TToolButton
      Left = 404
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object BtnHistory: TToolButton
      Left = 412
      Top = 2
      Hint = '"История" товара'
      Caption = 'BtnHistory'
      Enabled = False
      ImageIndex = 3
      OnClick = BtnHistoryClick
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 765
    Height = 342
    Align = alClient
    DataSource = DsH
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TM'
        Title.Alignment = taCenter
        Title.Caption = 'Когда'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_ART'
        Title.Alignment = taCenter
        Title.Caption = 'Код'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_NAM'
        Title.Alignment = taCenter
        Title.Caption = 'Наименование товара'
        Width = 358
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_MROZ'
        Title.Alignment = taCenter
        Title.Caption = 'Розн. цена'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OST'
        Title.Alignment = taCenter
        Title.Caption = 'Остаток'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_SHORT'
        Title.Alignment = taCenter
        Title.Caption = 'Ед.'
        Width = 32
        Visible = True
      end>
  end
  object HTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 332
    Top = 144
  end
  object QueryH: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = HTransaction
    AfterOpen = QueryHAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from change_tw(:dt1,:dt2)'
      'order by tm desc'
      '')
    Left = 268
    Top = 144
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
    object QueryHTW_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ID'
      ReadOnly = True
    end
    object QueryHTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object QueryHTW_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TW_NAM'
      ReadOnly = True
      Size = 254
    end
    object QueryHTW_MROZ: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MROZ'
      ReadOnly = True
      DisplayFormat = '#0.00 руб'
    end
    object QueryHOST: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QueryHED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object QueryHTM: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'TM'
      ReadOnly = True
    end
  end
  object DsH: TDataSource
    DataSet = QueryH
    Left = 268
    Top = 196
  end
end
