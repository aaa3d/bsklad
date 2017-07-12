object Select_TO: TSelect_TO
  Left = 398
  Top = 601
  Width = 352
  Height = 114
  BorderIcons = [biSystemMenu]
  Caption = 'Выбор получателя'
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
    Left = 6
    Top = 12
    Width = 65
    Height = 13
    Caption = 'Получатель :'
  end
  object ComboBox1: TComboBox
    Left = 76
    Top = 8
    Width = 261
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
    OnKeyPress = ComboBox1KeyPress
  end
  object BtnOk: TButton
    Left = 184
    Top = 34
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 1
    OnClick = BtnOkClick
  end
  object BtnClose: TButton
    Left = 262
    Top = 34
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    OnClick = BtnCloseClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 68
    Width = 344
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
end
