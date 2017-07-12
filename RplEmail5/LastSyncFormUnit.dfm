object LastSyncForm: TLastSyncForm
  Left = 476
  Top = 413
  Width = 430
  Height = 180
  Caption = 'Введите нужную дату и выберите магазин'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 59
    Height = 13
    Caption = 'Получатель'
  end
  object ListBox1: TListBox
    Left = 16
    Top = 24
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 0
  end
  object MaskEdit1: TMaskEdit
    Left = 326
    Top = 18
    Width = 73
    Height = 21
    EditMask = '!00:00:00\.000;1;–'
    MaxLength = 12
    TabOrder = 1
    Text = '  :  :  .   '
  end
  object DateEdit1: TDateEdit
    Left = 196
    Top = 18
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 2
  end
  object Button1: TButton
    Left = 328
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Установить'
    Enabled = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 200
    Top = 80
    Width = 113
    Height = 17
    Caption = 'Подтверждение'
    TabOrder = 4
    OnClick = CheckBox1Click
  end
end
