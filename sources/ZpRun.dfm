object ZP_RUN: TZP_RUN
  Left = 68
  Top = 111
  Width = 845
  Height = 586
  BorderIcons = [biSystemMenu]
  Caption = 'Расчет заработной платы'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 837
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 540
    Width = 837
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 837
    Height = 511
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 0
      Width = 191
      Height = 511
      Align = alLeft
      DataSource = DsMes
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'txt'
          Title.Alignment = taCenter
          Title.Caption = 'Месяц'
          Width = 153
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 191
      Top = 0
      Width = 646
      Height = 511
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 646
        Height = 61
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Button1: TButton
          Left = 4
          Top = 4
          Width = 97
          Height = 25
          Caption = 'Расчитать всех'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 104
          Top = 4
          Width = 111
          Height = 25
          Caption = 'Рассчитать новых'
          TabOrder = 1
        end
        object Button3: TButton
          Left = 4
          Top = 32
          Width = 211
          Height = 25
          Caption = 'Разослать контрольные листки всем'
          TabOrder = 2
        end
        object Button4: TButton
          Left = 218
          Top = 32
          Width = 219
          Height = 25
          Caption = 'Разослать контрольные листки новым'
          TabOrder = 3
        end
      end
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 61
        Width = 646
        Height = 450
        Align = alClient
        DataSource = DsCalc
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'us_full'
            Title.Alignment = taCenter
            Title.Caption = 'Сотрудник'
            Width = 212
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'otdel_name'
            Title.Alignment = taCenter
            Title.Caption = 'Отдел'
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sost_full'
            Title.Alignment = taCenter
            Title.Caption = 'Состояние'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'mail_date'
            Title.Alignment = taCenter
            Title.Caption = 'Отослано'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'summ'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма'
            Width = 79
            Visible = True
          end>
      end
    end
  end
  object MemMes: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'txt'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'mes'
        DataType = ftInteger
      end
      item
        Name = 'year'
        DataType = ftInteger
      end
      item
        Name = 'abs'
        DataType = ftInteger
      end>
    AfterScroll = MemMesAfterScroll
    Left = 56
    Top = 159
    object MemMestxt: TStringField
      FieldName = 'txt'
      Size = 64
    end
    object MemMesmes: TIntegerField
      FieldName = 'mes'
    end
    object MemMesyear: TIntegerField
      FieldName = 'year'
    end
    object MemMesabs: TIntegerField
      FieldName = 'abs'
    end
  end
  object DsMes: TDataSource
    DataSet = MemMes
    Left = 58
    Top = 217
  end
  object MemCalc: TRxMemoryData
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
        Name = 'sost_id'
        DataType = ftInteger
      end
      item
        Name = 'sost_full'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'mail_date'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'summ'
        DataType = ftFloat
      end>
    Left = 327
    Top = 215
    object MemCalcus_id: TIntegerField
      FieldName = 'us_id'
    end
    object MemCalcus_full: TStringField
      FieldName = 'us_full'
      Size = 254
    end
    object MemCalcotdel_id: TIntegerField
      FieldName = 'otdel_id'
    end
    object MemCalcotdel_name: TStringField
      FieldName = 'otdel_name'
      Size = 64
    end
    object MemCalcsost_id: TIntegerField
      FieldName = 'sost_id'
    end
    object MemCalcsost_full: TStringField
      FieldName = 'sost_full'
      Size = 64
    end
    object MemCalcmail_date: TStringField
      FieldName = 'mail_date'
      Size = 32
    end
    object MemCalcsumm: TFloatField
      FieldName = 'summ'
      DisplayFormat = '#0.00 руб'
    end
  end
  object DsCalc: TDataSource
    DataSet = MemCalc
    Left = 327
    Top = 263
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 423
    Top = 213
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 425
    Top = 265
  end
end
