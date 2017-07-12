object ZP_TITLE: TZP_TITLE
  Left = 119
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Введите название начисления/удержания'
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
  object Button1: TButton
    Left = 414
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Ок'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 336
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 6
    Top = 10
    Width = 477
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
end
