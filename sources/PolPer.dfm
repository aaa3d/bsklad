object POL_PER: TPOL_PER
  Left = 231
  Top = 263
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Получение накладной перемещения'
  ClientHeight = 389
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 789
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
      ImageIndex = 40
      Style = tbsSeparator
    end
    object BtnSave: TToolButton
      Left = 33
      Top = 2
      Hint = 'Сохранить и выйти (Ctrl+Enter)'
      Caption = 'BtnSave'
      ImageIndex = 39
      OnClick = BtnSaveClick
    end
    object BtnApply: TToolButton
      Left = 58
      Top = 2
      Hint = 'Применить'
      Caption = 'BtnApply'
      ImageIndex = 38
      OnClick = BtnApplyClick
    end
    object ToolButton3: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 39
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 91
      Top = 2
      Caption = 'ToolButton4'
      ImageIndex = 9
      OnClick = ToolButton4Click
    end
    object ToolButton5: TToolButton
      Left = 116
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 40
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 124
      Top = 2
      Hint = 'Напечатать один ценник'
      Caption = 'ToolButton6'
      ImageIndex = 40
      OnClick = ToolButton6Click
    end
    object ToolButton7: TToolButton
      Left = 149
      Top = 2
      Hint = 'Напечатать ценники на все товары из накладной'
      Caption = 'ToolButton7'
      ImageIndex = 41
      OnClick = ToolButton7Click
    end
    object ToolButton8: TToolButton
      Left = 174
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object BtnAll: TButton
      Left = 182
      Top = 2
      Width = 127
      Height = 24
      Caption = 'Получить полностью'
      TabOrder = 0
      OnClick = BtnAllClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 789
    Height = 360
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 789
      Height = 117
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 150
        Height = 13
        Caption = 'Накладная перемещения № :'
      end
      object Label2: TLabel
        Left = 372
        Top = 8
        Width = 17
        Height = 13
        Caption = 'от :'
      end
      object Label3: TLabel
        Left = 80
        Top = 32
        Width = 58
        Height = 13
        Caption = 'Со склада :'
      end
      object Label4: TLabel
        Left = 76
        Top = 56
        Width = 62
        Height = 13
        Caption = 'Основание :'
      end
      object Label6: TLabel
        Left = 76
        Top = 96
        Width = 64
        Height = 13
        Caption = 'Через кого :'
      end
      object Label5: TLabel
        Left = 440
        Top = 32
        Width = 53
        Height = 13
        Caption = 'На склад :'
      end
      object RN_NUM_FULL: TEdit
        Left = 164
        Top = 4
        Width = 201
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = 'RN_NUM_FULL'
      end
      object RN_DATE: TDateEdit
        Left = 396
        Top = 4
        Width = 121
        Height = 21
        Enabled = False
        NumGlyphs = 2
        TabOrder = 1
      end
      object SKL_FROM: TEdit
        Left = 144
        Top = 28
        Width = 289
        Height = 21
        Enabled = False
        TabOrder = 2
        Text = 'SKL_FROM'
      end
      object RN_WHO: TEdit
        Left = 144
        Top = 92
        Width = 621
        Height = 21
        Enabled = False
        TabOrder = 3
        Text = 'RN_WHO'
      end
      object RN_OSN: TMemo
        Left = 144
        Top = 52
        Width = 621
        Height = 37
        Enabled = False
        Lines.Strings = (
          'RN_OSN')
        TabOrder = 4
      end
      object SKL_TO: TEdit
        Left = 504
        Top = 28
        Width = 261
        Height = 21
        Enabled = False
        TabOrder = 5
        Text = 'SKL_FROM'
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 117
      Width = 789
      Height = 224
      Align = alClient
      DataSource = DsMem
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnGetCellParams = RxDBGrid1GetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'TW_ART'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Код'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TW_NAM'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Наименование товара'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ED_SHORT'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Ед. изм.'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TW_KOL'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Кол-во'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OTG_KOL'
          Title.Alignment = taCenter
          Title.Caption = 'Получено'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OTG_DATE'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Дата получения'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OTG_USS'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Кем получено'
          Width = 112
          Visible = True
        end>
    end
    object StatusBar1: TStatusBar
      Left = 0
      Top = 341
      Width = 789
      Height = 19
      Panels = <>
      SimplePanel = False
    end
  end
  object RxMemRns: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RNS_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_ART'
        DataType = ftInteger
      end
      item
        Name = 'TW_NAM'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'ED_SHORT'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'TW_KOL'
        DataType = ftFloat
      end
      item
        Name = 'OTG_KOL'
        DataType = ftFloat
      end
      item
        Name = 'OTG_DATE'
        DataType = ftDate
      end
      item
        Name = 'OTG_US'
        DataType = ftInteger
      end
      item
        Name = 'OTG_USS'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'C'
        DataType = ftInteger
      end
      item
        Name = 'TW_ID'
        DataType = ftInteger
      end>
    Left = 176
    Top = 177
    object RxMemRnsRNS_ID: TIntegerField
      FieldName = 'RNS_ID'
    end
    object RxMemRnsTW_ART: TIntegerField
      FieldName = 'TW_ART'
    end
    object RxMemRnsTW_NAM: TStringField
      FieldName = 'TW_NAM'
      Size = 254
    end
    object RxMemRnsED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      Size = 32
    end
    object RxMemRnsTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      DisplayFormat = '#0.0000'
    end
    object RxMemRnsOTG_KOL: TFloatField
      FieldName = 'OTG_KOL'
      OnChange = RxMemRnsOTG_KOLChange
      DisplayFormat = '#0.0000'
    end
    object RxMemRnsOTG_DATE: TDateField
      FieldName = 'OTG_DATE'
    end
    object RxMemRnsOTG_US: TIntegerField
      FieldName = 'OTG_US'
    end
    object RxMemRnsOTG_USS: TStringField
      FieldName = 'OTG_USS'
      Size = 254
    end
    object RxMemRnsC: TIntegerField
      FieldName = 'C'
    end
    object RxMemRnsTW_ID: TIntegerField
      FieldName = 'TW_ID'
    end
  end
  object DsMem: TDataSource
    DataSet = RxMemRns
    Left = 176
    Top = 225
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 464
    Top = 73
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 552
    Top = 73
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 308
    Top = 201
    object MnSave: TMenuItem
      Caption = 'Сохранить'
      ImageIndex = 39
      ShortCut = 16397
      OnClick = BtnSaveClick
    end
    object MnApply: TMenuItem
      Caption = 'Применить'
      ImageIndex = 38
      OnClick = BtnAllClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnAll: TMenuItem
      Caption = 'Получить полностью'
      OnClick = BtnAllClick
    end
  end
end
