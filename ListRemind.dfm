object LIST_REMIND: TLIST_REMIND
  Left = 196
  Top = 280
  Width = 891
  Height = 492
  Caption = 'Напоминания'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 883
    Height = 33
    ButtonHeight = 29
    ButtonWidth = 28
    Caption = 'ToolBar1'
    EdgeInner = esNone
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnNew: TToolButton
      Left = 0
      Top = 2
      Hint = 'Создать новый документ...(INS)'
      Caption = 'BtnNew'
      ImageIndex = 0
      OnClick = BtnNewClick
    end
    object BtnOpen: TToolButton
      Left = 28
      Top = 2
      Hint = 'Открыть документ...(Enter)'
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object ToolButton8: TToolButton
      Left = 56
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object BtnPropertis: TToolButton
      Left = 64
      Top = 2
      Hint = '"История" документа (F12)'
      Caption = 'BtnPropertis'
      ImageIndex = 3
    end
    object ToolButton14: TToolButton
      Left = 92
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object ToolButton16: TToolButton
      Left = 100
      Top = 2
      Width = 8
      Caption = 'ToolButton16'
      ImageIndex = 25
      Style = tbsSeparator
    end
    object BtnInterval: TToolButton
      Left = 108
      Top = 2
      Hint = 'Установить интервал дат в журнале...(I)'
      Caption = 'BtnInterval'
      ImageIndex = 36
      OnClick = BtnIntervalClick
    end
    object ToolButton1: TToolButton
      Left = 136
      Top = 2
      Width = 41
      Caption = 'ToolButton1'
      ImageIndex = 37
      Style = tbsSeparator
    end
    object CheckBox1: TCheckBox
      Left = 177
      Top = 2
      Width = 156
      Height = 29
      Caption = 'Показать завершенные'
      TabOrder = 0
      OnClick = CheckBox1Click
    end
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 33
    Width = 883
    Height = 19
    Align = alTop
    Panels = <
      item
        Text = 'За период с 01-Янв-1999 по 20-Фев-1999'
        Width = 276
      end
      item
        Width = 50
      end>
    SimplePanel = False
    SizeGrip = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 52
    Width = 883
    Height = 413
    Align = alClient
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'REMIND_DATE'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ttt'
        Width = 409
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMIND_USER_FIO'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOST'
        Width = 182
        Visible = True
      end>
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    OnCalcFields = IBQuery1CalcFields
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM LIST_REMIND(:dt1, :dt2, :show_all, :US_ID)')
    Left = 300
    Top = 160
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
      end
      item
        DataType = ftUnknown
        Name = 'show_all'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'US_ID'
        ParamType = ptUnknown
      end>
    object IBQuery1REMIND_ID: TIntegerField
      FieldName = 'REMIND_ID'
      Origin = 'LIST_REMIND.REMIND_ID'
      Visible = False
    end
    object IBQuery1REMIND_DATE: TDateTimeField
      DisplayLabel = 'Дата'
      DisplayWidth = 28
      FieldName = 'REMIND_DATE'
      Origin = 'LIST_REMIND.REMIND_DATE'
    end
    object IBQuery1ttt: TStringField
      DisplayLabel = 'Текст'
      DisplayWidth = 44
      FieldKind = fkCalculated
      FieldName = 'ttt'
      Size = 250
      Calculated = True
    end
    object IBQuery1REMIND_TEXT: TBlobField
      DisplayLabel = 'Текст'
      DisplayWidth = 39
      FieldName = 'REMIND_TEXT'
      Origin = 'LIST_REMIND.REMIND_TEXT'
      Visible = False
      BlobType = ftBlob
      Size = 8
    end
    object IBQuery1REMIND_USER_FIO: TIBStringField
      DisplayLabel = 'Пользователь'
      DisplayWidth = 20
      FieldName = 'REMIND_USER_FIO'
      Origin = 'LIST_REMIND.REMIND_USER_FIO'
      Size = 254
    end
    object IBQuery1REMIND_END: TIBStringField
      FieldName = 'REMIND_END'
      Origin = 'LIST_REMIND.REMIND_END'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object IBQuery1REMIND_END_TM: TDateTimeField
      FieldName = 'REMIND_END_TM'
      Origin = 'LIST_REMIND.REMIND_END_TM'
      Visible = False
    end
    object IBQuery1SOST: TIBStringField
      DisplayLabel = 'Состояние'
      DisplayWidth = 21
      FieldName = 'SOST'
      Origin = 'LIST_REMIND.SOST'
      Size = 32
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 356
    Top = 164
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 200
    Top = 184
  end
end
