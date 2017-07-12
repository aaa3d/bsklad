object MAIL_NEW_MONEY: TMAIL_NEW_MONEY
  Left = 109
  Top = 168
  Width = 629
  Height = 307
  Caption = 'Определить цены после выполнения заявки'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 82
    Height = 13
    Caption = 'Валюта товара :'
  end
  object Label2: TLabel
    Left = 184
    Top = 40
    Width = 81
    Height = 13
    Caption = 'Цена в валюте :'
  end
  object Label3: TLabel
    Left = 400
    Top = 40
    Width = 78
    Height = 13
    Caption = 'Цена в рублях :'
  end
  object VALUTA: TEdit
    Left = 96
    Top = 36
    Width = 81
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'VALUTA'
  end
  object MON1: TRxCalcEdit
    Left = 272
    Top = 36
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.0000##'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 1
    OnChange = MON1Change
  end
  object MON2: TRxCalcEdit
    Left = 484
    Top = 36
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 2
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 621
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 3
    object ToolButton5: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton5'
      ImageIndex = 110
      OnClick = ToolButton5Click
    end
    object ToolButton6: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object BtnSave: TToolButton
      Left = 33
      Top = 2
      Hint = 'Сохранить и выйти'
      Caption = 'BtnSave'
      ImageIndex = 39
      OnClick = BtnSaveClick
    end
    object ToolButton1: TToolButton
      Left = 58
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 39
      Style = tbsSeparator
    end
    object BtnNew: TToolButton
      Left = 66
      Top = 2
      Hint = 'Новая дополнительная цена'
      Caption = 'BtnNew'
      ImageIndex = 0
      OnClick = BtnNewClick
    end
    object BtnOpen: TToolButton
      Left = 91
      Top = 2
      Hint = 'Изменить дополнительную цену'
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object BtnDel: TToolButton
      Left = 116
      Top = 2
      Hint = 'Удалить дополнительную цену'
      Caption = 'BtnDel'
      ImageIndex = 2
      OnClick = BtnDelClick
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 64
    Width = 621
    Height = 216
    Align = alBottom
    DataSource = DsMailsMon
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'MON1'
        Title.Alignment = taCenter
        Title.Caption = 'Цена в валюте'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MON2'
        Title.Alignment = taCenter
        Title.Caption = 'Цена в рублях'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_KOL'
        Title.Alignment = taCenter
        Title.Caption = 'Кол-во'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIM'
        Title.Alignment = taCenter
        Title.Caption = 'Примечания'
        Width = 291
        Visible = True
      end>
  end
  object MemMailsMon: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_KOL'
        DataType = ftFloat
      end
      item
        Name = 'MON1'
        DataType = ftFloat
      end
      item
        Name = 'MON2'
        DataType = ftFloat
      end
      item
        Name = 'PERCENT'
        DataType = ftFloat
      end
      item
        Name = 'PRIM'
        DataType = ftString
        Size = 254
      end>
    AfterInsert = MemMailsMonAfterDelete
    AfterPost = MemMailsMonAfterDelete
    AfterDelete = MemMailsMonAfterDelete
    Left = 196
    Top = 128
    object MemMailsMonID: TIntegerField
      FieldName = 'ID'
    end
    object MemMailsMonTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      DisplayFormat = '#0.0000'
    end
    object MemMailsMonMON1: TFloatField
      FieldName = 'MON1'
      DisplayFormat = '#0.00'
    end
    object MemMailsMonMON2: TFloatField
      FieldName = 'MON2'
      DisplayFormat = '#0.00'
    end
    object MemMailsMonPERCENT: TFloatField
      FieldName = 'PERCENT'
    end
    object MemMailsMonPRIM: TStringField
      FieldName = 'PRIM'
      Size = 254
    end
  end
  object DsMailsMon: TDataSource
    DataSet = MemMailsMon
    OnDataChange = DsMailsMonDataChange
    Left = 196
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 324
    Top = 128
    object MnSave: TMenuItem
      Caption = 'Сохранить и выйти'
      ImageIndex = 39
      ShortCut = 16397
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MnNew: TMenuItem
      Caption = 'Новая дополнительная цена'
      ImageIndex = 0
    end
    object MnOpen: TMenuItem
      Caption = 'Изменить дополнительную цену'
      ImageIndex = 1
      ShortCut = 13
    end
    object MnDel: TMenuItem
      Caption = 'Удалить дополнительную цену'
      ImageIndex = 2
      ShortCut = 46
    end
  end
end
