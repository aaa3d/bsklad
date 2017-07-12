object SET_EXPORT_1C: TSET_EXPORT_1C
  Left = 59
  Top = 146
  Width = 668
  Height = 337
  Caption = 'Настройки экспорта данных в 1С'
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
  object Button1: TButton
    Left = 580
    Top = 10
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 580
    Top = 42
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 1
    OnClick = Button2Click
  end
  object RxDBGrid1: TRxDBGrid
    Left = 2
    Top = 0
    Width = 565
    Height = 301
    DataSource = DsFrm
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FRM_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Наименование фирмы'
        Width = 236
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PATH'
        Title.Alignment = taCenter
        Title.Caption = 'Полный путь к файлу передачи данных'
        Width = 289
        Visible = True
      end>
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
        Size = 252
      end
      item
        Name = 'PATH'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'CFG_ID'
        DataType = ftInteger
      end>
    Left = 168
    Top = 46
    object MemFrmFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
    end
    object MemFrmFRM_NAME: TStringField
      FieldName = 'FRM_NAME'
      Size = 252
    end
    object MemFrmPATH: TStringField
      FieldName = 'PATH'
      Size = 252
    end
    object MemFrmCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
    end
  end
  object DsFrm: TDataSource
    DataSet = MemFrm
    OnDataChange = DsFrmDataChange
    Left = 164
    Top = 96
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 336
    Top = 52
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 338
    Top = 104
  end
end
