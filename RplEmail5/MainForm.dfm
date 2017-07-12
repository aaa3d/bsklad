object MAIN_FORM: TMAIN_FORM
  Left = 225
  Top = 245
  Width = 431
  Height = 433
  Caption = 'Распределенная база данных'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 176
    Top = 96
    Width = 218
    Height = 18
  end
  object Bevel2: TBevel
    Left = 0
    Top = 96
    Width = 173
    Height = 18
  end
  object Label1: TLabel
    Left = 4
    Top = 98
    Width = 102
    Height = 13
    Caption = 'Обработано писем :'
  end
  object Label2: TLabel
    Left = 184
    Top = 98
    Width = 96
    Height = 13
    Caption = 'Обработано строк:'
  end
  object Label3: TLabel
    Left = 110
    Top = 98
    Width = 30
    Height = 13
    Caption = '0 из 0'
  end
  object Label4: TLabel
    Left = 286
    Top = 98
    Width = 30
    Height = 13
    Caption = '0 из 0'
  end
  object ButtonDefault: TButton
    Left = 2
    Top = 2
    Width = 267
    Height = 25
    Caption = 'Плановая связь'
    Enabled = False
    TabOrder = 0
    OnClick = ButtonDefaultClick
  end
  object Button2: TButton
    Left = 214
    Top = 198
    Width = 267
    Height = 25
    Caption = 'Запросить сумму прошлого дня'
    Enabled = False
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 214
    Top = 224
    Width = 267
    Height = 25
    Caption = 'Запросить все данные прошлого дня'
    Enabled = False
    TabOrder = 2
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 214
    Top = 250
    Width = 267
    Height = 25
    Caption = 'Запросить отгрузку и получение прошлого дня'
    Enabled = False
    TabOrder = 3
    Visible = False
    OnClick = Button4Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 179
    Width = 435
    Height = 211
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 4
    OnChange = Memo1Change
  end
  object BtnResiveEmail: TButton
    Left = 2
    Top = 40
    Width = 267
    Height = 25
    Caption = 'Обработка полученных писем'
    Enabled = False
    TabOrder = 5
    OnClick = BtnResiveEmailClick
  end
  object ComPressor: Tlzrw1
    Left = 0
    Top = 162
    Width = 435
    Height = 17
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 6
  end
  object BtnRepeat: TButton
    Left = 2
    Top = 66
    Width = 267
    Height = 25
    Caption = 'Повторная отправка данных'
    TabOrder = 7
    OnClick = BtnRepeatClick
  end
  object CheckBox1: TCheckBox
    Left = 272
    Top = 72
    Width = 113
    Height = 17
    Caption = 'Показывать лог'
    TabOrder = 8
  end
  object Button1: TButton
    Left = 8
    Top = 120
    Width = 257
    Height = 25
    Caption = 'Сменить время последней отправки магазином'
    TabOrder = 9
    OnClick = Button1Click
  end
  object Button5: TButton
    Left = 272
    Top = 120
    Width = 129
    Height = 25
    Caption = 'Администратор'
    TabOrder = 10
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 360
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Button6'
    TabOrder = 11
    OnClick = Button6Click
  end
  object OutlookConnect1: TOutlookConnect
    Connected = True
    OLEObject = 'Outlook.Application'
    OLENameSpace = 'MAPI'
    Left = 286
    Top = 156
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 280
    Top = 210
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 280
    Top = 264
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 200
    Top = 262
  end
  object Mem1: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'DATA'
        DataType = ftMemo
      end>
    Left = 118
    Top = 178
    object Mem1DATA: TMemoField
      FieldName = 'DATA'
      BlobType = ftMemo
    end
  end
  object AutoTimer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = AutoTimerTimer
    Left = 122
    Top = 264
  end
  object SakSMTP1: TSakSMTP
    Port = '25'
    SendProgressStep = 2
    OnError = SakSMTP1Error
    TimeOut = 30000
    Left = 316
    Top = 4
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 80
    Top = 80
  end
end
