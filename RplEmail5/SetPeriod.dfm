object Set_Period: TSet_Period
  Left = 385
  Top = 251
  Width = 521
  Height = 170
  BorderIcons = [biSystemMenu]
  Caption = 'Период'
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
  object Label1: TLabel
    Left = 14
    Top = 6
    Width = 67
    Height = 13
    Caption = 'За период с :'
  end
  object Label2: TLabel
    Left = 284
    Top = 6
    Width = 18
    Height = 13
    Caption = 'по :'
  end
  object Label3: TLabel
    Left = 4
    Top = 30
    Width = 75
    Height = 13
    Caption = 'Спецкоманда :'
    Visible = False
  end
  object Edit1: TEdit
    Left = 84
    Top = 26
    Width = 337
    Height = 21
    TabOrder = 0
    Visible = False
  end
  object Button1: TButton
    Left = 422
    Top = 26
    Width = 55
    Height = 21
    Caption = 'Принять'
    Enabled = False
    TabOrder = 1
    Visible = False
  end
  object DateEdit1: TDateEdit
    Left = 84
    Top = 2
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object MaskEdit1: TMaskEdit
    Left = 206
    Top = 2
    Width = 73
    Height = 21
    EditMask = '!00:00:00\.000;1;–'
    MaxLength = 12
    TabOrder = 3
    Text = '  :  :  .   '
  end
  object DateEdit2: TDateEdit
    Left = 306
    Top = 2
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 4
  end
  object MaskEdit2: TMaskEdit
    Left = 428
    Top = 2
    Width = 75
    Height = 21
    EditMask = '!00:00:00\.000;1;–'
    MaxLength = 12
    TabOrder = 5
    Text = '  :  :  .   '
  end
  object Button2: TButton
    Left = 324
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Начать'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 402
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 7
    OnClick = Button3Click
  end
  object CheckCustom: TCheckBox
    Left = 8
    Top = 64
    Width = 137
    Height = 17
    Caption = 'Только таблицу'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object CheckSyncDate: TCheckBox
    Left = 8
    Top = 96
    Width = 225
    Height = 17
    Caption = 'Запомнить время синхронизации'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    State = cbChecked
    TabOrder = 9
  end
  object Edit2: TEdit
    Left = 129
    Top = 62
    Width = 81
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    Text = 'RE'
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 68
    Top = 18
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 114
    Top = 10
  end
end
