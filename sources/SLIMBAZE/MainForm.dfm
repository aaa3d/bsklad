object Form1: TForm1
  Left = 294
  Top = 266
  Width = 1315
  Height = 492
  Caption = 'Свертка базы Арм Склад'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 5
    Top = 5
    Width = 881
    Height = 64
    Caption = 
      'Процедура свертки базы данных занимает очень значительное время ' +
      'и является необратимой операцией.'#13#10'Перед сверткой базы необходим' +
      'о сделать следующее:'#13#10'  1. Провести сеансы связи со всеми перифе' +
      'рийными базами данных и в периферийных базах более не проводить ' +
      'торговых операций.'#13#10'  2. Обязательно сохранить резервную копию б' +
      'азы данных!'
  end
  object Label2: TLabel
    Left = 5
    Top = 79
    Width = 325
    Height = 16
    Caption = 'Укажите путь к основной базе данных арм склад :'
  end
  object BtnBase: TSpeedButton
    Left = 834
    Top = 96
    Width = 29
    Height = 27
    Caption = '...'
    OnClick = BtnBaseClick
  end
  object Label3: TLabel
    Left = 5
    Top = 128
    Width = 477
    Height = 16
    Caption = 
      'Укажите каталог для хранения временных файлов и файлов отчетност' +
      'и:'
  end
  object Label4: TLabel
    Left = 5
    Top = 180
    Width = 286
    Height = 16
    Caption = 'Укажите дату, по которую удалить данные :'
  end
  object Label5: TLabel
    Left = 5
    Top = 263
    Width = 78
    Height = 16
    Caption = 'Ход работы:'
  end
  object MainPath: TEdit
    Left = 5
    Top = 96
    Width = 831
    Height = 21
    TabOrder = 0
    Text = '127.0.0.1:D:\BSKLAD2005.FDB.SLIM_START'
  end
  object TmpPath: TDirectoryEdit
    Left = 5
    Top = 148
    Width = 858
    Height = 26
    InitialDir = 'd:\'
    NumGlyphs = 1
    ButtonWidth = 26
    TabOrder = 1
    Text = 'd:\'
  end
  object BtnClose: TButton
    Left = 768
    Top = 229
    Width = 92
    Height = 31
    Caption = 'Закрыть'
    TabOrder = 2
    OnClick = BtnCloseClick
  end
  object BtnRun: TButton
    Left = 5
    Top = 229
    Width = 149
    Height = 31
    Caption = 'Свертка. Часть 1'
    TabOrder = 3
    OnClick = BtnRunClick
  end
  object DT: TDateEdit
    Left = 5
    Top = 199
    Width = 149
    Height = 26
    ButtonWidth = 26
    NumGlyphs = 2
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 0
    Top = 279
    Width = 1287
    Height = 266
    Align = alBottom
    ReadOnly = True
    TabOrder = 5
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 545
    Width = 1287
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object BtnStop: TButton
    Left = 672
    Top = 229
    Width = 92
    Height = 31
    Caption = 'Остановить'
    TabOrder = 7
    OnClick = BtnStopClick
  end
  object BtnRun2: TButton
    Left = 158
    Top = 229
    Width = 129
    Height = 31
    Caption = 'Свертка. Часть 2'
    TabOrder = 8
    OnClick = BtnRun2Click
  end
  object BtnRun3: TButton
    Left = 290
    Top = 229
    Width = 162
    Height = 31
    Caption = 'Свертка. Часть 3'
    TabOrder = 9
    OnClick = BtnRun3Click
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.gdb'
    FileName = 'Bsklad2001.gdb'
    Filter = 'База данных Арм Склад (*.gdb)|*.gdb|Все файлы (*.*)|*.*'
    Left = 470
    Top = 10
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 98
    Top = 292
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 96
    Top = 342
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 168
    Top = 344
  end
  object QueryWork3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 238
    Top = 344
  end
  object WorkTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 238
    Top = 298
  end
  object QueryWork4: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 306
    Top = 344
  end
  object WorkTransaction3: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 450
    Top = 300
  end
  object QueryWork5: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    Left = 446
    Top = 350
  end
end
