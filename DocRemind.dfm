object DOC_REMIND: TDOC_REMIND
  Left = 327
  Top = 264
  Width = 597
  Height = 263
  Caption = 'Напоминание'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object REMIND_TM: TLabel
    Left = 4
    Top = 4
    Width = 103
    Height = 13
    Caption = '21/03/2010 10:43:15'
  end
  object Label3: TLabel
    Left = 16
    Top = 28
    Width = 97
    Height = 13
    Caption = 'Дата напоминания'
  end
  object Label4: TLabel
    Left = 208
    Top = 28
    Width = 101
    Height = 13
    Caption = 'Текст напоминания'
  end
  object REMIND_US_FIO: TLabel
    Left = 124
    Top = 4
    Width = 68
    Height = 13
    Caption = 'Шустров А.Ю.'
  end
  object REMIND_DATE: TMonthCalendar
    Left = 8
    Top = 48
    Width = 191
    Height = 154
    Date = 40259
    TabOrder = 0
  end
  object REMIND_TEXT: TMemo
    Left = 208
    Top = 44
    Width = 377
    Height = 157
    Lines.Strings = (
      'ИП Зачиналов '
      'Накладная БНАЛ 1003230014/7МО, 23/03/2010, 135 476 руб.'
      'Баланс 85 000 руб.'
      'Выдано в кредит на 50 476 руб. ')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object REMIND_END: TCheckBox
    Left = 208
    Top = 4
    Width = 101
    Height = 17
    Caption = 'Завершено'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 512
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 208
    Width = 121
    Height = 25
    Caption = 'Открыть накладную'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 340
    Top = 207
    Width = 121
    Height = 25
    Caption = 'Открыть клиента'
    TabOrder = 5
    OnClick = Button3Click
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 44
    Top = 216
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 96
    Top = 216
  end
end
