object EDIT_CARDSKID_COUPON: TEDIT_CARDSKID_COUPON
  Left = 738
  Top = 331
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Купон на скидку'
  ClientHeight = 362
  ClientWidth = 415
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
  object Label1: TLabel
    Left = 76
    Top = 76
    Width = 37
    Height = 13
    Caption = 'Сумма:'
  end
  object Label2: TLabel
    Left = 82
    Top = 100
    Width = 33
    Height = 13
    Caption = 'Тираж'
  end
  object Label3: TLabel
    Left = 66
    Top = 48
    Width = 56
    Height = 13
    Caption = 'Описание :'
  end
  object Label4: TLabel
    Left = 20
    Top = 136
    Width = 94
    Height = 13
    Caption = 'Действительна с :'
  end
  object Label5: TLabel
    Left = 248
    Top = 136
    Width = 18
    Height = 13
    Caption = 'по :'
  end
  object Label6: TLabel
    Left = 66
    Top = 16
    Width = 40
    Height = 13
    Caption = 'Номер :'
  end
  object Label7: TLabel
    Left = 20
    Top = 168
    Width = 98
    Height = 13
    Caption = 'Время действия с :'
  end
  object Label8: TLabel
    Left = 248
    Top = 160
    Width = 18
    Height = 13
    Caption = 'по :'
  end
  object Label9: TLabel
    Left = 42
    Top = 192
    Width = 74
    Height = 13
    Caption = 'Дин действия:'
  end
  object SUMM: TRxCalcEdit
    Left = 120
    Top = 72
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00 руб##'
    MaxValue = 1000
    NumGlyphs = 2
    TabOrder = 0
  end
  object CNT: TRxCalcEdit
    Left = 120
    Top = 96
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 3
    DisplayFormat = ',0'
    NumGlyphs = 2
    TabOrder = 1
  end
  object Button1: TButton
    Left = 328
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 328
    Top = 324
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 3
    OnClick = Button2Click
  end
  object DESCR: TEdit
    Left = 120
    Top = 44
    Width = 273
    Height = 21
    TabOrder = 4
  end
  object WORK_DT_START: TDateEdit
    Left = 120
    Top = 132
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 5
  end
  object WORK_DT_END: TDateEdit
    Left = 272
    Top = 132
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 6
  end
  object NUMBER: TEdit
    Left = 120
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object WORK_TM_START: TDateTimePicker
    Left = 120
    Top = 160
    Width = 121
    Height = 21
    CalAlignment = dtaLeft
    Date = 42885.5042751736
    Time = 42885.5042751736
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkTime
    ParseInput = False
    TabOrder = 8
  end
  object WORK_TM_END: TDateTimePicker
    Left = 272
    Top = 160
    Width = 121
    Height = 21
    CalAlignment = dtaLeft
    Date = 42885.5042751736
    Time = 42885.5042751736
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkTime
    ParseInput = False
    TabOrder = 9
  end
  object WORK_DAYS: TRxCheckListBox
    Left = 120
    Top = 192
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 10
    InternalVersion = 202
    Strings = (
      'Понедельник'
      1
      True
      'Вторник'
      1
      True
      'Среда'
      1
      True
      'Четверг'
      1
      True
      'Пятница'
      1
      True
      'Суббота'
      1
      True
      'Воскресенье'
      1
      True)
  end
end
