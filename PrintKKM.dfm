object PRINT_KKM: TPRINT_KKM
  Left = 378
  Top = 439
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Печать чека'
  ClientHeight = 144
  ClientWidth = 519
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
    Left = 59
    Top = 52
    Width = 169
    Height = 37
    Alignment = taRightJustify
    Caption = 'Наличные :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 11
    Top = 8
    Width = 217
    Height = 37
    Alignment = taRightJustify
    Caption = 'Сумма итого :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 111
    Top = 100
    Width = 117
    Height = 37
    Alignment = taRightJustify
    Caption = 'Сдача :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MON1: TRxCalcEdit
    Left = 232
    Top = 8
    Width = 281
    Height = 41
    AutoSize = False
    DisplayFormat = ',0.00 руб'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 0
  end
  object MON2: TRxCalcEdit
    Left = 232
    Top = 52
    Width = 281
    Height = 41
    AutoSize = False
    DisplayFormat = ',0.00 руб'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FormatOnEditing = True
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 1
    OnChange = MON2Change
    OnKeyPress = MON2KeyPress
  end
  object MON3: TRxCalcEdit
    Left = 232
    Top = 96
    Width = 281
    Height = 41
    AutoSize = False
    DisplayFormat = ',0.00 руб'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
  end
end
