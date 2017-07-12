object Detal_real: TDetal_real
  Left = 380
  Top = 231
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Подробная информация о реализации'
  ClientHeight = 348
  ClientWidth = 477
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
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 477
    Height = 57
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Товар :'
    end
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 133
      Height = 13
      Caption = 'Реализация за последние'
    end
    object Label3: TLabel
      Left = 228
      Top = 32
      Width = 44
      Height = 13
      Caption = 'месяцев'
    end
    object TW_NAM: TEdit
      Left = 48
      Top = 4
      Width = 421
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'TW_NAM'
    end
    object MES: TRxSpinEdit
      Left = 152
      Top = 28
      Width = 69
      Height = 21
      Decimal = 3
      ValueType = vtFloat
      Enabled = False
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 329
    Width = 477
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 477
    Height = 272
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 0
      Width = 185
      Height = 272
      Align = alLeft
      DataSource = DsReal1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'RNTYP_SHORT'
          Title.Alignment = taCenter
          Title.Caption = 'Тип'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TW_KOL'
          Title.Alignment = taCenter
          Title.Caption = 'Кол-во'
          Width = 74
          Visible = True
        end>
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 264
    Top = 97
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 268
    Top = 149
  end
  object QueryReal1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select rntyp_id,rntyp_short,sum(tw_kol) as tw_kol'
      'from detal_real1(:tw_id,:mes)'
      'group by rntyp_id,rntyp_short'
      'order by 1')
    Left = 268
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tw_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'mes'
        ParamType = ptInput
      end>
    object QueryReal1RNTYP_ID: TIntegerField
      FieldName = 'RNTYP_ID'
    end
    object QueryReal1RNTYP_SHORT: TIBStringField
      FieldName = 'RNTYP_SHORT'
      Size = 32
    end
    object QueryReal1TW_KOL: TFloatField
      FieldName = 'TW_KOL'
      DisplayFormat = '#0.0000'
    end
  end
  object DsReal1: TDataSource
    DataSet = QueryReal1
    Left = 320
    Top = 201
  end
end
