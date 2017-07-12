object STFAKT_MAKE: TSTFAKT_MAKE
  Left = 29
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Оформление счёт-фактуры'
  ClientHeight = 371
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 701
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton1'
      ImageIndex = 110
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object BtnADD: TToolButton
      Left = 33
      Top = 2
      Hint = 
        'Добавить расходную накладную в список'#13#10'накладных счёт-фактуры ("' +
        '+",Insert,1..9)'
      Caption = 'BtnADD'
      ImageIndex = 70
      OnClick = BtnADDClick
    end
    object BtnDEL: TToolButton
      Left = 58
      Top = 2
      Hint = 'Удалить накладную из списка (DEL)'
      Caption = 'BtnDEL'
      Enabled = False
      ImageIndex = 2
      OnClick = BtnDELClick
    end
    object ToolButton3: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object BtnPrint: TToolButton
      Left = 91
      Top = 2
      Hint = 
        'Оформить и напечатать счёт-фактуру на основе представленного спи' +
        'ска (F9)'
      Caption = 'BtnPrint'
      Enabled = False
      ImageIndex = 9
      OnClick = BtnPrintClick
    end
    object ToolButton5: TToolButton
      Left = 116
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object Panel1: TPanel
      Left = 124
      Top = 2
      Width = 470
      Height = 24
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 6
        Width = 83
        Height = 13
        Caption = 'Тип накладных :'
      end
      object RNTYP: TRxDBLookupCombo
        Left = 92
        Top = 2
        Width = 373
        Height = 21
        DropDownCount = 8
        LookupField = 'RNTYP_ID'
        LookupDisplay = 'RNTYP_FULL'
        LookupSource = DsRNTYP
        TabOrder = 0
      end
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 701
    Height = 342
    Align = alClient
    DataSource = DsSTFAKTS
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RN_NUM_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Номер'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RN_DATA'
        Title.Alignment = taCenter
        Title.Caption = 'Дата'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RN_OPIS'
        Title.Alignment = taCenter
        Title.Caption = 'Описание'
        Width = 437
        Visible = True
      end>
  end
  object MakeTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 392
    Top = 40
  end
  object QrRNTYP: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = MakeTransaction
    CachedUpdates = False
    SQL.Strings = (
      'select * from RNTYP order by RNTYP_ID')
    Left = 392
    Top = 88
    object QrRNTYPRNTYP_ID: TIntegerField
      FieldName = 'RNTYP_ID'
      Required = True
    end
    object QrRNTYPRNTYP_SHORT: TIBStringField
      FieldName = 'RNTYP_SHORT'
      Required = True
      Size = 32
    end
    object QrRNTYPRNTYP_FULL: TIBStringField
      FieldName = 'RNTYP_FULL'
      Required = True
      Size = 254
    end
    object QrRNTYPNUM_TYP: TSmallintField
      FieldName = 'NUM_TYP'
      Required = True
    end
    object QrRNTYPRNTYP_SPEED: TIBStringField
      FieldName = 'RNTYP_SPEED'
      Required = True
      Size = 1
    end
  end
  object DsRNTYP: TDataSource
    DataSet = QrRNTYP
    Left = 392
    Top = 136
  end
  object MemSTFAKTS: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RN_NUM_FULL'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'RN_ID'
        DataType = ftInteger
      end
      item
        Name = 'RN_DATA'
        DataType = ftDate
      end
      item
        Name = 'RN_OPIS'
        DataType = ftString
        Size = 254
      end>
    AfterPost = MemSTFAKTSAfterPost
    AfterDelete = MemSTFAKTSAfterDelete
    Left = 108
    Top = 40
    object MemSTFAKTSRN_NUM_FULL: TStringField
      FieldName = 'RN_NUM_FULL'
      Size = 90
    end
    object MemSTFAKTSRN_ID: TIntegerField
      FieldName = 'RN_ID'
    end
    object MemSTFAKTSRN_DATA: TDateField
      FieldName = 'RN_DATA'
    end
    object MemSTFAKTSRN_OPIS: TStringField
      FieldName = 'RN_OPIS'
      Size = 254
    end
  end
  object DsSTFAKTS: TDataSource
    DataSet = MemSTFAKTS
    Left = 108
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 152
    object MnAdd: TMenuItem
      Caption = 'Добавить накладную в список'
      ShortCut = 45
      OnClick = BtnADDClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить накладную из списка'
      ShortCut = 46
      OnClick = BtnDELClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать счёт-фактуру'
      ShortCut = 120
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 516
    Top = 64
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    CachedUpdates = False
    Left = 516
    Top = 120
  end
end
