object ZP_PLUS_SPOSOB: TZP_PLUS_SPOSOB
  Left = 300
  Top = 245
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Выберите способ начисления оклада'
  ClientHeight = 173
  ClientWidth = 492
  Color = clBtnFace
  Constraints.MaxHeight = 200
  Constraints.MaxWidth = 500
  Constraints.MinHeight = 200
  Constraints.MinWidth = 500
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
    Left = 282
    Top = 30
    Width = 18
    Height = 13
    Caption = 'по :'
  end
  object Check_summ1: TRadioButton
    Left = 4
    Top = 4
    Width = 145
    Height = 17
    Caption = 'Фиксированная сумма:'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = Check_summ1Click
  end
  object Summ1: TRxCalcEdit
    Left = 158
    Top = 2
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00##'
    NumGlyphs = 2
    TabOrder = 1
  end
  object Check_summ2: TRadioButton
    Left = 4
    Top = 28
    Width = 151
    Height = 17
    Caption = 'Сумма из диаппазона от :'
    TabOrder = 2
    OnClick = Check_summ1Click
  end
  object Summ2_1: TRxCalcEdit
    Left = 158
    Top = 26
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00##'
    NumGlyphs = 2
    TabOrder = 3
  end
  object Summ2_2: TRxCalcEdit
    Left = 302
    Top = 26
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00##'
    NumGlyphs = 2
    TabOrder = 4
  end
  object Button1: TButton
    Left = 414
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Далее'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 336
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Check_tabel: TCheckBox
    Left = 2
    Top = 152
    Width = 143
    Height = 17
    Caption = 'Использовать табель'
    TabOrder = 7
  end
  object CheckBox1: TCheckBox
    Left = 2
    Top = 132
    Width = 125
    Height = 17
    Caption = 'Использовать КТУ'
    TabOrder = 8
  end
end
