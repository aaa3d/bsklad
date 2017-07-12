object CLOSE_PERIOD_DIR: TCLOSE_PERIOD_DIR
  Left = 79
  Top = 147
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Закрытие периода директором'
  ClientHeight = 118
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 2
    Width = 481
    Height = 52
    Caption = 
      '  В данном окне задается дата закрытия периода, раньше которой н' +
      'евозможно будет задать '#13#10'дифференцированное закрытие периода. На' +
      'стройка предназначена для защиты от опечаток'#13#10'при закрытии перио' +
      'да а также для исключения возможности править документы "задним"' +
      #13#10'числом подчиненным персоналом'
  end
  object Label2: TLabel
    Left = 4
    Top = 62
    Width = 25
    Height = 13
    Caption = 'Дату'
  end
  object Label3: TLabel
    Left = 4
    Top = 90
    Width = 267
    Height = 13
    Caption = 'Установить предельную дату закрытия периода на :'
  end
  object DT: TDateEdit
    Left = 276
    Top = 86
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object Button1: TButton
    Left = 412
    Top = 60
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 412
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    OnClick = Button2Click
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 84
    Top = 46
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 174
    Top = 44
  end
end
