object FIND_DOCNUM: TFIND_DOCNUM
  Left = 473
  Top = 170
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Поиск документа по номеру '
  ClientHeight = 398
  ClientWidth = 630
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 379
    Width = 630
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 33
    Width = 630
    Height = 346
    Align = alClient
    DataSource = DsFindNum
    DefaultDrawing = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawDataCell = RxDBGrid1DrawDataCell
    OnDrawColumnCell = RxDBGrid1DrawColumnCell
    OnDblClick = RxDBGrid1DblClick
    OnKeyPress = RxDBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'PROW'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = ' '
        Width = 19
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FULL_NUM'
        Title.Alignment = taCenter
        Title.Caption = 'Номер'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_DATE'
        Title.Alignment = taCenter
        Title.Caption = 'Дата'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_OPIS'
        Title.Alignment = taCenter
        Title.Caption = 'Описание'
        Width = 451
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 630
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 97
      Height = 13
      Caption = 'Номер документа :'
    end
    object BtnGo: TButton
      Left = 244
      Top = 4
      Width = 85
      Height = 25
      Caption = 'Перейти...'
      TabOrder = 0
      OnClick = BtnGoClick
    end
    object Edit1: TEdit
      Left = 108
      Top = 4
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 1
      OnChange = Edit1Change
    end
  end
  object FindNumQuery: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FindNumTransaction
    AfterOpen = FindNumQueryAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from FIND_NUM_PN(:NUM,:TYP)')
    Left = 80
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TYP'
        ParamType = ptInput
      end>
    object FindNumQueryID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'ID'
      ReadOnly = True
    end
    object FindNumQueryFULL_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'FULL_NUM'
      ReadOnly = True
      Size = 70
    end
    object FindNumQueryDOC_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'DOC_DATE'
      ReadOnly = True
    end
    object FindNumQueryDOC_OPIS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'DOC_OPIS'
      ReadOnly = True
      Size = 254
    end
    object FindNumQueryPROW: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PROW'
      ReadOnly = True
    end
    object FindNumQueryDOC_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DOC_COLOR'
      ReadOnly = True
    end
  end
  object FindNumTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 84
    Top = 116
  end
  object DsFindNum: TDataSource
    DataSet = FindNumQuery
    Left = 80
    Top = 232
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 180
    Top = 116
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FindNumTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 184
    Top = 184
  end
end
