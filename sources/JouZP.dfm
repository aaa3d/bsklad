object JOU_ZP: TJOU_ZP
  Left = 66
  Top = 142
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Журнал кадровых приказов'
  ClientHeight = 510
  ClientWidth = 759
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 759
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnInterval: TToolButton
      Left = 0
      Top = 2
      Hint = 'Установить период.. (I)'
      Caption = 'BtnInterval'
      ImageIndex = 36
      OnClick = BtnIntervalClick
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object Label2: TLabel
      Left = 33
      Top = 2
      Width = 45
      Height = 24
      AutoSize = False
      Caption = 'Отделы :'
      Layout = tlCenter
    end
    object OTDEL: TRxDBLookupCombo
      Left = 78
      Top = 2
      Width = 181
      Height = 24
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'OTDEL_ID'
      LookupDisplay = 'OTDEL_NAME'
      LookupSource = DsOtdels
      TabOrder = 0
      OnChange = OTDELChange
    end
    object ToolButton3: TToolButton
      Left = 259
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object Label1: TLabel
      Left = 267
      Top = 2
      Width = 71
      Height = 24
      AutoSize = False
      Caption = 'Сотрудники :'
      Layout = tlCenter
    end
    object USER: TRxDBLookupCombo
      Left = 338
      Top = 2
      Width = 191
      Height = 24
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'US_ID'
      LookupDisplay = 'US_FULL'
      LookupSource = DsUsers
      TabOrder = 1
      OnChange = OTDELChange
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 491
    Width = 759
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 29
    Width = 759
    Height = 19
    Align = alTop
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 48
    Width = 759
    Height = 443
    Align = alClient
    DataSource = DsZP
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TM'
        Title.Alignment = taCenter
        Title.Caption = 'Дата'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTDEL_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Отдел'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Сотрудник'
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mess_full'
        Title.Alignment = taCenter
        Title.Caption = 'Приказ'
        Visible = True
      end>
  end
  object JouTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 324
    Top = 102
  end
  object DicUsers: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = JouTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from zp_list_users'
      'order by us_id,us_full')
    Left = 322
    Top = 166
    object DicUsersUS_ID: TIntegerField
      FieldName = 'US_ID'
      Origin = 'ZP_LIST_USERS.US_ID'
    end
    object DicUsersUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'ZP_LIST_USERS.US_FULL'
      Size = 254
    end
  end
  object DicOtdels: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = JouTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from zp_list_otdels'
      'order by otdel_id,otdel_name')
    Left = 408
    Top = 164
    object DicOtdelsOTDEL_ID: TIntegerField
      FieldName = 'OTDEL_ID'
      Origin = 'ZP_LIST_OTDELS.OTDEL_ID'
    end
    object DicOtdelsOTDEL_NAME: TIBStringField
      FieldName = 'OTDEL_NAME'
      Origin = 'ZP_LIST_OTDELS.OTDEL_NAME'
      Size = 64
    end
  end
  object DsUsers: TDataSource
    DataSet = DicUsers
    Left = 322
    Top = 220
  end
  object DsOtdels: TDataSource
    DataSet = DicOtdels
    Left = 408
    Top = 218
  end
  object JouZP: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = JouTransaction
    OnCalcFields = JouZPCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_jouzp(:dt1,:dt2,:us_id,:otdel_id)')
    Left = 476
    Top = 170
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
        Name = 'us_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'otdel_id'
        ParamType = ptUnknown
      end>
    object JouZPUS_ID: TIntegerField
      FieldName = 'US_ID'
      Origin = 'LIST_JOUZP.US_ID'
    end
    object JouZPUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'LIST_JOUZP.US_FULL'
      Size = 254
    end
    object JouZPOTDEL_ID: TIntegerField
      FieldName = 'OTDEL_ID'
      Origin = 'LIST_JOUZP.OTDEL_ID'
    end
    object JouZPOTDEL_NAME: TIBStringField
      FieldName = 'OTDEL_NAME'
      Origin = 'LIST_JOUZP.OTDEL_NAME'
      Size = 64
    end
    object JouZPMESS: TIBStringField
      FieldName = 'MESS'
      Origin = 'LIST_JOUZP.MESS'
      Size = 254
    end
    object JouZPTM: TDateTimeField
      FieldName = 'TM'
      Origin = 'LIST_JOUZP.TM'
    end
    object JouZPmess_full: TStringField
      FieldKind = fkCalculated
      FieldName = 'mess_full'
      Size = 254
      Calculated = True
    end
  end
  object DsZP: TDataSource
    DataSet = JouZP
    Left = 478
    Top = 224
  end
end
