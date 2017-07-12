object KKM_INFO: TKKM_INFO
  Left = 363
  Top = 399
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Информация на кассовом чеке'
  ClientHeight = 382
  ClientWidth = 560
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
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 560
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton2'
      ImageIndex = 110
    end
    object ToolButton3: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 47
      Style = tbsSeparator
    end
    object BtnKKM: TToolButton
      Left = 33
      Top = 2
      Hint = 'Пустой чек (F7)'
      Caption = 'BtnKKM'
      ImageIndex = 45
      OnClick = BtnKKMClick
    end
    object ToolButton11: TToolButton
      Left = 58
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 46
      Style = tbsSeparator
    end
    object KKM: TRxDBLookupCombo
      Left = 66
      Top = 2
      Width = 363
      Height = 24
      DropDownCount = 8
      LookupField = 'CFG_ID'
      LookupDisplay = 'KKM_FULL'
      LookupSource = DsKKM
      TabOrder = 0
      OnChange = KKMChange
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 363
    Width = 560
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 560
    Height = 334
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 560
      Height = 334
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 558
        Height = 44
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 172
          Top = 28
          Width = 80
          Height = 13
          Caption = 'Заголовок чека'
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 558
          Height = 29
          ButtonHeight = 24
          ButtonWidth = 25
          Caption = 'ToolBar2'
          Images = DataModule1.ImageList1
          TabOrder = 0
          object BtnNew1: TToolButton
            Left = 0
            Top = 2
            Hint = 'Новая строка'
            Caption = 'BtnNew1'
            ImageIndex = 0
            OnClick = BtnNew1Click
          end
          object BtnOpen1: TToolButton
            Left = 25
            Top = 2
            Hint = 'Изменить строку'
            Caption = 'BtnOpen1'
            ImageIndex = 1
            OnClick = BtnOpen1Click
          end
          object BtnDel1: TToolButton
            Left = 50
            Top = 2
            Hint = 'Удалить строку'
            Caption = 'BtnDel1'
            ImageIndex = 2
            OnClick = BtnDel1Click
          end
          object ToolButton1: TToolButton
            Left = 75
            Top = 2
            Width = 8
            Caption = 'ToolButton1'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object BtnUp1: TToolButton
            Left = 83
            Top = 2
            Hint = 'Переместить вверх'
            Caption = 'BtnUp1'
            ImageIndex = 33
            OnClick = BtnUp1Click
          end
          object BtnDown1: TToolButton
            Left = 108
            Top = 2
            Hint = 'Переместить вниз'
            Caption = 'BtnDown1'
            ImageIndex = 34
            OnClick = BtnDown1Click
          end
        end
      end
      object RxDBGrid1: TRxDBGrid
        Left = 1
        Top = 45
        Width = 558
        Height = 288
        Align = alClient
        DataSource = DsMem1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid1DblClick
        OnKeyDown = RxDBGrid1KeyDown
        OnKeyPress = RxDBGrid1KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'VID_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Вид'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TXT'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Текст'
            Width = 242
            Visible = True
          end>
      end
    end
  end
  object DsMem1: TDataSource
    DataSet = Mem1
    OnDataChange = DsMem1DataChange
    Left = 140
    Top = 201
  end
  object Mem1: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'VID_SHORT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TXT'
        DataType = ftString
        Size = 64
      end>
    AfterPost = Mem1AfterDelete
    AfterDelete = Mem1AfterDelete
    OnCalcFields = Mem1CalcFields
    Left = 136
    Top = 145
    object StringField1: TStringField
      FieldName = 'VID_SHORT'
      Size = 1
    end
    object StringField3: TStringField
      DisplayWidth = 64
      FieldName = 'TXT'
      Size = 64
    end
    object Mem1VID_FULL: TStringField
      FieldKind = fkCalculated
      FieldName = 'VID_FULL'
      Size = 64
      Calculated = True
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 469
    Top = 173
  end
  object KKMTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 577
    Top = 177
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 469
    Top = 225
  end
  object QueryKKM: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = KKMTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select CFG_ID,  '#39'Магазин '#39'||SHOP_NAME||'#39', ПК '#39'||COMP_NAME ||'#39', м' +
        'одель  '#39'||MODEL_NAME||'#39', зав. №'#39'||MODEL_NUM KKM_FULL from lisT_k' +
        'km'
      'where model=4'
      'order by SHOP_NAME, COMP_NAME')
    Left = 577
    Top = 233
  end
  object DsKKM: TDataSource
    DataSet = QueryKKM
    Left = 577
    Top = 281
  end
end
