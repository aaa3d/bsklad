object KLN_TO_OTDEL: TKLN_TO_OTDEL
  Left = 164
  Top = 213
  BorderStyle = bsSingle
  Caption = 'Прием или перевод сотрудника в отдел'
  ClientHeight = 94
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 10
    Width = 37
    Height = 13
    Caption = 'Отдел :'
  end
  object Label2: TLabel
    Left = 52
    Top = 58
    Width = 12
    Height = 13
    Caption = 'с :'
  end
  object Label3: TLabel
    Left = 6
    Top = 34
    Width = 64
    Height = 13
    Caption = 'Должность :'
  end
  object OTDEL_NAME: TEdit
    Left = 72
    Top = 6
    Width = 387
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    Text = 'OTDEL_NAME'
  end
  object DT: TDateEdit
    Left = 72
    Top = 54
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
  end
  object Button1: TButton
    Left = 310
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 386
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 3
    OnClick = Button2Click
  end
  object DOL_NAME: TEdit
    Left = 72
    Top = 28
    Width = 387
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 4
    Text = 'DOL_NAME'
  end
end
