object EDIT_RVID: TEDIT_RVID
  Left = 176
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Справочник видов реализации.'
  ClientHeight = 261
  ClientWidth = 582
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
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 42
    Width = 56
    Height = 13
    Caption = 'Название :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 582
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnApply: TToolButton
      Left = 0
      Top = 2
      Hint = 'Применить'
      Caption = 'BtnApply'
      ImageIndex = 38
      OnClick = BtnApplyClick
    end
    object BtnSave: TToolButton
      Left = 25
      Top = 2
      Hint = 'Сохранить'
      Caption = 'BtnSave'
      ImageIndex = 39
      OnClick = BtnSaveClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 242
    Width = 582
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RVID_NAME: TEdit
    Left = 66
    Top = 38
    Width = 507
    Height = 21
    TabOrder = 2
    Text = 'RVID_NAME'
    OnChange = RVID_NAMEChange
  end
  object RVID_SUBKLN: TCheckBox
    Left = 66
    Top = 64
    Width = 263
    Height = 17
    Caption = 'Использовать детализацию по клиентам/банкам :'
    TabOrder = 3
    OnClick = RVID_SUBKLNClick
  end
  object RxDBGrid1: TRxDBGrid
    Left = 66
    Top = 84
    Width = 411
    Height = 151
    DataSource = DsKln
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'kln_full'
        Title.Alignment = taCenter
        Title.Caption = 'Клиент'
        Width = 376
        Visible = True
      end>
  end
  object BtnAdd: TButton
    Left = 482
    Top = 84
    Width = 75
    Height = 25
    Caption = 'Добавить'
    TabOrder = 5
    OnClick = BtnAddClick
  end
  object BtnDel: TButton
    Left = 482
    Top = 110
    Width = 75
    Height = 25
    Caption = 'Удалить'
    TabOrder = 6
    OnClick = BtnDelClick
  end
  object MemKLN: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'kln_id'
        DataType = ftInteger
      end
      item
        Name = 'kln_full'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'cfg_id'
        DataType = ftInteger
      end>
    AfterPost = MemKLNAfterDelete
    AfterDelete = MemKLNAfterDelete
    Left = 196
    Top = 160
    object MemKLNkln_id: TIntegerField
      FieldName = 'kln_id'
    end
    object MemKLNkln_full: TStringField
      FieldName = 'kln_full'
      Size = 252
    end
    object MemKLNcfg_id: TIntegerField
      FieldName = 'cfg_id'
    end
  end
  object DsKln: TDataSource
    DataSet = MemKLN
    Left = 262
    Top = 158
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 382
    Top = 124
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 384
    Top = 174
  end
end
