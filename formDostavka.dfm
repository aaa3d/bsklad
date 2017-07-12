object form_Dostavka: Tform_Dostavka
  Left = 761
  Top = 158
  BorderStyle = bsDialog
  Caption = 'Оформление доставки'
  ClientHeight = 604
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 208
    Width = 149
    Height = 16
    Caption = 'Накладные в доставке'
  end
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 107
    Height = 16
    Caption = 'Номер доставки'
  end
  object Label3: TLabel
    Left = 16
    Top = 48
    Width = 96
    Height = 16
    Caption = 'Дата доставки'
  end
  object Label4: TLabel
    Left = 16
    Top = 80
    Width = 104
    Height = 16
    Caption = 'Адрес доставки'
  end
  object Label5: TLabel
    Left = 8
    Top = 456
    Width = 683
    Height = 80
    Caption = 
      'для добавления накладной в доставку '#13#10'1. открыть доставку в кото' +
      'рую добавлять'#13#10'2. в журнале выделить нужную накладную, правой кн' +
      'опкой мыши выбрать "добавить в доставку"'#13#10#13#10'если нужно оформить ' +
      'новую доставку - выделив нужную накладную просто нажать кнопку "' +
      'ДОСТАВКА"'
  end
  object Label6: TLabel
    Left = 408
    Top = 408
    Width = 119
    Height = 16
    Caption = 'Сумма накладных:'
  end
  object labelPrice: TLabel
    Left = 544
    Top = 408
    Width = 54
    Height = 16
    Caption = '0:00 руб.'
  end
  object RxDBGrid1: TRxDBGrid
    Left = 16
    Top = 232
    Width = 569
    Height = 153
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 600
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Убрать'
    TabOrder = 1
    OnClick = Button2Click
  end
  object DOST_NUMBER: TRxCalcEdit
    Left = 126
    Top = 17
    Width = 145
    Height = 21
    AutoSize = False
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 2
  end
  object DOST_DATE: TDateEdit
    Left = 126
    Top = 42
    Width = 147
    Height = 23
    NumGlyphs = 2
    TabOrder = 3
  end
  object dost_address: TMemo
    Left = 126
    Top = 80
    Width = 459
    Height = 89
    Lines.Strings = (
      'dost_address')
    TabOrder = 4
  end
  object Button1: TButton
    Left = 16
    Top = 408
    Width = 217
    Height = 25
    Caption = 'Сохранить во все накладные'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 256
    Top = 408
    Width = 129
    Height = 25
    Caption = 'Печать накладных'
    TabOrder = 6
    OnClick = Button3Click
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 552
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 480
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 240
    Top = 176
  end
  object RxMemoryData1: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'rn_id'
        DataType = ftInteger
      end
      item
        Name = 'rn_num'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'rn_summ'
        DataType = ftFloat
      end
      item
        Name = 'rn_date'
        DataType = ftDate
      end>
    Left = 328
    Top = 176
    object RxMemoryData1rn_id: TIntegerField
      DisplayWidth = 10
      FieldName = 'rn_id'
    end
    object RxMemoryData1rn_num: TStringField
      DisplayLabel = 'Номер накладной'
      DisplayWidth = 20
      FieldName = 'rn_num'
      Size = 50
    end
    object RxMemoryData1rn_summ: TFloatField
      DisplayLabel = 'Сумма накладной'
      DisplayWidth = 17
      FieldName = 'rn_summ'
      DisplayFormat = '0.00р'
    end
    object RxMemoryData1rn_date: TDateField
      DisplayLabel = 'Дата'
      DisplayWidth = 18
      FieldName = 'rn_date'
    end
  end
  object IBQuery2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.ReportTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 624
    Top = 24
  end
end
