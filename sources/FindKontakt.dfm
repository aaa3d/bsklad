object Find_Kontakt: TFind_Kontakt
  Left = 5
  Top = 46
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Поиск контакта'
  ClientHeight = 465
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 446
    Width = 739
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
    Width = 739
    Height = 49
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 131
      Height = 26
      Caption = 'Наименование контакта :'#13#10'(не менее 3-х символов)'
    end
    object Edit1: TEdit
      Left = 144
      Top = 12
      Width = 349
      Height = 21
      AutoSelect = False
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
    end
    object Btn_GO: TButton
      Left = 580
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Найти в списке товаров выбранный (Enter)'
      Caption = 'Перейти'
      TabOrder = 2
      OnClick = Btn_GOClick
    end
    object Btn_CLOSE: TButton
      Left = 660
      Top = 8
      Width = 75
      Height = 25
      Hint = '(ESC)'
      Caption = 'Закрыть'
      TabOrder = 3
      OnClick = Btn_CLOSEClick
    end
    object Button1: TButton
      Left = 500
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Найти...'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 49
    Width = 739
    Height = 397
    Align = alClient
    DataSource = DsFind
    DefaultDrawing = False
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
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
        FieldName = 'ISMAN'
        Title.Alignment = taCenter
        Title.Caption = ' '
        Width = 18
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KLN_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Наименование контакта'
        Width = 326
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KLN_BNK'
        Title.Alignment = taCenter
        Title.Caption = 'Банк'
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_SHORT'
        Title.Alignment = taCenter
        Title.Caption = 'Телефон'
        Width = 109
        Visible = True
      end>
  end
  object QueryFind: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FindTransaction
    AfterOpen = QueryFindAfterOpen
    CachedUpdates = False
    SQL.Strings = (
      'select * from findklient(1,:KLN_NAM) order by KLN_FULL')
    Left = 56
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'KLN_NAM'
        ParamType = ptInput
      end>
    object QueryFindKLN_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ID'
      ReadOnly = True
    end
    object QueryFindKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 254
    end
    object QueryFindKLN_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_TEL'
      ReadOnly = True
      Size = 254
    end
    object QueryFindKLN_BNK: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_BNK'
      ReadOnly = True
      Size = 254
    end
    object QueryFindISMAN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'ISMAN'
      ReadOnly = True
    end
  end
  object FindTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 56
    Top = 80
  end
  object DsFind: TDataSource
    DataSet = QueryFind
    Left = 56
    Top = 188
  end
end
