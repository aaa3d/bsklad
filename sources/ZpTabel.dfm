object Zp_Tabel: TZp_Tabel
  Left = 66
  Top = 137
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ввод табеля'
  ClientHeight = 516
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 812
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Caption = 'ToolButton1'
      ImageIndex = 39
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 497
    Width = 812
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 812
    Height = 468
    Align = alClient
    DataSource = DsTabel
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'us_full'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Сотрудник'
        Width = 213
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'otdel_name'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Отдел'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = '1'
        Title.Alignment = taCenter
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = '2'
        Title.Alignment = taCenter
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = '3'
        Title.Alignment = taCenter
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = '4'
        Title.Alignment = taCenter
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = '5'
        Title.Alignment = taCenter
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = '6'
        Title.Alignment = taCenter
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = '7'
        Title.Alignment = taCenter
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = '8'
        Title.Alignment = taCenter
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = '9'
        Title.Alignment = taCenter
        Width = 16
        Visible = True
      end
      item
        Expanded = False
        FieldName = '10'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '11'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '12'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '13'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '14'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '15'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '16'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '17'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '18'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '19'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '20'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '21'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '22'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '23'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '24'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '25'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '26'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '27'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '28'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '29'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '30'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = '31'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object MemTabel: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'us_id'
        DataType = ftInteger
      end
      item
        Name = 'us_full'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'otdel_id'
        DataType = ftInteger
      end
      item
        Name = 'otdel_name'
        DataType = ftString
        Size = 64
      end
      item
        Name = '1'
        DataType = ftString
        Size = 1
      end
      item
        Name = '2'
        DataType = ftString
        Size = 1
      end
      item
        Name = '3'
        DataType = ftString
        Size = 1
      end
      item
        Name = '4'
        DataType = ftString
        Size = 1
      end
      item
        Name = '5'
        DataType = ftString
        Size = 1
      end
      item
        Name = '6'
        DataType = ftString
        Size = 1
      end
      item
        Name = '7'
        DataType = ftString
        Size = 1
      end
      item
        Name = '8'
        DataType = ftString
        Size = 1
      end
      item
        Name = '9'
        DataType = ftString
        Size = 1
      end
      item
        Name = '10'
        DataType = ftString
        Size = 1
      end
      item
        Name = '11'
        DataType = ftString
        Size = 1
      end
      item
        Name = '12'
        DataType = ftString
        Size = 1
      end
      item
        Name = '13'
        DataType = ftString
        Size = 1
      end
      item
        Name = '14'
        DataType = ftString
        Size = 1
      end
      item
        Name = '15'
        DataType = ftString
        Size = 1
      end
      item
        Name = '16'
        DataType = ftString
        Size = 1
      end
      item
        Name = '17'
        DataType = ftString
        Size = 1
      end
      item
        Name = '18'
        DataType = ftString
        Size = 1
      end
      item
        Name = '19'
        DataType = ftString
        Size = 1
      end
      item
        Name = '20'
        DataType = ftString
        Size = 1
      end
      item
        Name = '21'
        DataType = ftString
        Size = 1
      end
      item
        Name = '22'
        DataType = ftString
        Size = 1
      end
      item
        Name = '23'
        DataType = ftString
        Size = 1
      end
      item
        Name = '24'
        DataType = ftString
        Size = 1
      end
      item
        Name = '25'
        DataType = ftString
        Size = 1
      end
      item
        Name = '26'
        DataType = ftString
        Size = 1
      end
      item
        Name = '27'
        DataType = ftString
        Size = 1
      end
      item
        Name = '28'
        DataType = ftString
        Size = 1
      end
      item
        Name = '29'
        DataType = ftString
        Size = 1
      end
      item
        Name = '30'
        DataType = ftString
        Size = 1
      end
      item
        Name = '31'
        DataType = ftString
        Size = 1
      end>
    Left = 134
    Top = 108
    object MemTabelus_id: TIntegerField
      FieldName = 'us_id'
    end
    object MemTabelus_full: TStringField
      FieldName = 'us_full'
      Size = 254
    end
    object MemTabelotdel_id: TIntegerField
      FieldName = 'otdel_id'
    end
    object MemTabelotdel_name: TStringField
      FieldName = 'otdel_name'
      Size = 64
    end
    object MemTabelField1: TStringField
      FieldName = '1'
      Size = 1
    end
    object MemTabelField2: TStringField
      FieldName = '2'
      Size = 1
    end
    object MemTabelStringField3: TStringField
      FieldName = '3'
      Size = 1
    end
    object MemTabelField4: TStringField
      FieldName = '4'
      Size = 1
    end
    object MemTabelField5: TStringField
      FieldName = '5'
      Size = 1
    end
    object MemTabelField6: TStringField
      FieldName = '6'
      Size = 1
    end
    object MemTabelField7: TStringField
      FieldName = '7'
      Size = 1
    end
    object MemTabelField8: TStringField
      FieldName = '8'
      Size = 1
    end
    object MemTabelField9: TStringField
      FieldName = '9'
      Size = 1
    end
    object MemTabelField10: TStringField
      FieldName = '10'
      Size = 1
    end
    object MemTabelField11: TStringField
      FieldName = '11'
      Size = 1
    end
    object MemTabelField12: TStringField
      FieldName = '12'
      Size = 1
    end
    object MemTabelField13: TStringField
      FieldName = '13'
      Size = 1
    end
    object MemTabelField14: TStringField
      FieldName = '14'
      Size = 1
    end
    object MemTabelField15: TStringField
      FieldName = '15'
      Size = 1
    end
    object MemTabelField16: TStringField
      FieldName = '16'
      Size = 1
    end
    object MemTabelField17: TStringField
      FieldName = '17'
      Size = 1
    end
    object MemTabelField18: TStringField
      FieldName = '18'
      Size = 1
    end
    object MemTabelField19: TStringField
      FieldName = '19'
      Size = 1
    end
    object MemTabelField20: TStringField
      FieldName = '20'
      Size = 1
    end
    object MemTabelField21: TStringField
      FieldName = '21'
      Size = 1
    end
    object MemTabelField22: TStringField
      FieldName = '22'
      Size = 1
    end
    object MemTabelField23: TStringField
      FieldName = '23'
      Size = 1
    end
    object MemTabelField24: TStringField
      FieldName = '24'
      Size = 1
    end
    object MemTabelField25: TStringField
      FieldName = '25'
      Size = 1
    end
    object MemTabelField26: TStringField
      FieldName = '26'
      Size = 1
    end
    object MemTabelField27: TStringField
      FieldName = '27'
      Size = 1
    end
    object MemTabelField28: TStringField
      FieldName = '28'
      Size = 1
    end
    object MemTabelField29: TStringField
      FieldName = '29'
      Size = 1
    end
    object MemTabelField30: TStringField
      FieldName = '30'
      Size = 1
    end
    object MemTabelField31: TStringField
      FieldName = '31'
      Size = 1
    end
  end
  object DsTabel: TDataSource
    DataSet = MemTabel
    Left = 130
    Top = 166
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 352
    Top = 128
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 352
    Top = 178
  end
end
