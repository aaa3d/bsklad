object SET_PERIOD: TSET_PERIOD
  Left = 309
  Top = 265
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Закрытие периода дифференцированное'
  ClientHeight = 380
  ClientWidth = 778
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 778
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnOpen: TToolButton
      Left = 0
      Top = 2
      Hint = 'Изменить дату закрытия (Enter)'
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object ToolButton3: TToolButton
      Left = 25
      Top = 2
      Hint = 'История закрытий периода'
      Caption = 'ToolButton3'
      ImageIndex = 3
      OnClick = ToolButton3Click
    end
    object ToolButton1: TToolButton
      Left = 50
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 58
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton2'
      ImageIndex = 110
      OnClick = ToolButton2Click
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 778
    Height = 351
    Align = alClient
    DataSource = DsPeriod
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'USGROUP_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Вид доступа'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USGROUP_PRIM'
        Title.Alignment = taCenter
        Title.Caption = 'Примечания'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIOD_CLOSE'
        Title.Alignment = taCenter
        Title.Caption = 'Период закрыт по...'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIOD_CHANGE'
        Title.Alignment = taCenter
        Title.Caption = 'Когда закрыт'
        Width = 116
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_FIO'
        Title.Alignment = taCenter
        Title.Caption = 'Кем закрыт'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WHI'
        Title.Alignment = taCenter
        Title.Caption = 'Причина'
        Width = 253
        Visible = True
      end>
  end
  object PeriodTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 160
    Top = 76
  end
  object QrPeriod: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PeriodTransaction
    AfterOpen = QrPeriodAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from closed_period'
      'order by usgroup_name')
    Left = 84
    Top = 76
    object QrPeriodPERIOD_CHANGE: TDateTimeField
      FieldName = 'PERIOD_CHANGE'
    end
    object QrPeriodUSGROUP_ID: TIntegerField
      FieldName = 'USGROUP_ID'
      Required = True
    end
    object QrPeriodUSGROUP_NAME: TIBStringField
      FieldName = 'USGROUP_NAME'
      Required = True
      Size = 254
    end
    object QrPeriodUSGROUP_PRIM: TIBStringField
      FieldName = 'USGROUP_PRIM'
      Size = 254
    end
    object QrPeriodPERIOD_CLOSE: TDateTimeField
      FieldName = 'PERIOD_CLOSE'
    end
    object QrPeriodTM: TDateTimeField
      FieldName = 'TM'
      Required = True
    end
    object QrPeriodWHI: TIBStringField
      FieldName = 'WHI'
      Size = 254
    end
    object QrPeriodUSER_FIO: TIBStringField
      FieldName = 'USER_FIO'
      Size = 2306
    end
  end
  object DsPeriod: TDataSource
    DataSet = QrPeriod
    Left = 76
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 128
    object MnOpen: TMenuItem
      Caption = 'Изменить дату закрытия периода для варианта доступа'
      ShortCut = 13
      OnClick = BtnOpenClick
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 76
    Top = 216
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from usgroup where usgroup_id=:ID')
    Left = 160
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
