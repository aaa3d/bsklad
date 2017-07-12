object CHANGE_PASSWORD: TCHANGE_PASSWORD
  Left = 102
  Top = 175
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Смена пароля'
  ClientHeight = 85
  ClientWidth = 342
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
    Left = 52
    Top = 8
    Width = 79
    Height = 13
    Caption = 'Пользователь :'
  end
  object Label2: TLabel
    Left = 136
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 88
    Top = 32
    Width = 44
    Height = 13
    Caption = 'Пароль :'
  end
  object Label4: TLabel
    Left = 4
    Top = 56
    Width = 126
    Height = 13
    Caption = 'Подтверждение пароля :'
  end
  object Edit1: TEdit
    Left = 136
    Top = 28
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 136
    Top = 52
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = 'Edit1'
  end
  object BtnSave: TButton
    Left = 260
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 2
    OnClick = BtnSaveClick
  end
  object BtnClose: TButton
    Left = 260
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 3
    OnClick = BtnCloseClick
  end
end
