object Select_BASE: TSelect_BASE
  Left = 1232
  Top = 437
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Bsklad 2005'
  ClientHeight = 176
  ClientWidth = 474
  Color = clBlack
  Constraints.MaxHeight = 249
  Constraints.MaxWidth = 591
  Constraints.MinHeight = 203
  Constraints.MinWidth = 482
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 474
    Height = 157
    Align = alClient
    AutoSize = True
  end
  object Label2: TLabel
    Left = 92
    Top = 2
    Width = 379
    Height = 13
    Caption = 
      'Система складского учета BSKLAD (c) Бритвин Сергей Beginner 1997' +
      '-2003'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 6
    Top = 116
    Width = 180
    Height = 13
    Caption = 'Выберите базу данных для работы:'
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 288
    Top = 16
    Width = 183
    Height = 13
    Alignment = taRightJustify
    Caption = 'С поддержкой системы 1-С (2000 г.)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 254
    Top = 32
    Width = 217
    Height = 13
    Alignment = taRightJustify
    Caption = 'С поддержкой электронной почты (2000 г.)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Btn_OK: TButton
    Left = 316
    Top = 136
    Width = 75
    Height = 25
    Caption = 'ОК'
    TabOrder = 1
    OnClick = Btn_OKClick
  end
  object ComboBox1: TComboBox
    Left = 4
    Top = 136
    Width = 309
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Button1: TButton
    Left = 394
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    OnClick = Button1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 157
    Width = 474
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
end
