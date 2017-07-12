object SIZE_CENNIK: TSIZE_CENNIK
  Left = 550
  Top = 258
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Выбор размера ценника'
  ClientHeight = 184
  ClientWidth = 189
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 6
    Top = 136
    Width = 34
    Height = 12
    Caption = 'Фирма :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 185
    Height = 25
    Caption = '0. Гигантский ценник'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 0
    Top = 24
    Width = 185
    Height = 25
    Caption = '1. Большой ценник'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 0
    Top = 48
    Width = 185
    Height = 25
    Caption = '2. Средний ценник'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 0
    Top = 72
    Width = 185
    Height = 25
    Caption = '3. Малый ценник'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 0
    Top = 96
    Width = 185
    Height = 25
    Caption = '4. Этикетка'
    TabOrder = 4
    OnClick = Button5Click
  end
  object FRM: TRxDBLookupCombo
    Left = 4
    Top = 154
    Width = 181
    Height = 20
    DropDownCount = 8
    EscapeClear = False
    DisplayEmpty = 'По умолчанию'
    EmptyValue = '-1'
    LookupField = 'KLN_ID'
    LookupDisplay = 'KLN_FULL'
    LookupSource = DataModule1.MainDsAllFrm
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 64
    Top = 16
    object N1: TMenuItem
      Caption = 'Гигантский ценник'
      ShortCut = 48
      OnClick = Button1Click
    end
    object N2: TMenuItem
      Caption = 'Большой ценник'
      ShortCut = 49
      OnClick = Button2Click
    end
    object N3: TMenuItem
      Caption = 'Средний ценник'
      ShortCut = 50
      OnClick = Button3Click
    end
    object N4: TMenuItem
      Caption = 'Малый ценник'
      ShortCut = 51
      OnClick = Button4Click
    end
  end
end
