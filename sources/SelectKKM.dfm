object SELECT_KKM: TSELECT_KKM
  Left = 625
  Top = 715
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Выбор кассового аппарата'
  ClientHeight = 123
  ClientWidth = 354
  Color = clBtnFace
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
  object Label1: TLabel
    Left = 112
    Top = 16
    Width = 50
    Height = 13
    Caption = 'Магазин :'
  end
  object Label2: TLabel
    Left = 128
    Top = 48
    Width = 37
    Height = 13
    Caption = 'Касса :'
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 97
    Height = 121
    Alignment = taCenter
    BorderStyle = bsNone
    Lines.Strings = (
      'Выбор кассового '
      'аппарата, на '
      'котором будут '
      'осуществляться '
      'продажи')
    TabOrder = 0
  end
  object SHOP_NAME: TEdit
    Left = 176
    Top = 16
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = 'SHOP_NAME'
  end
  object Button1: TButton
    Left = 248
    Top = 88
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = Button1Click
  end
  object cmbKKM: TComboBox
    Left = 176
    Top = 48
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
end
