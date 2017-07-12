object ZP_PLUS_VID: TZP_PLUS_VID
  Left = 133
  Top = 205
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Выберите вид начисления'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 414
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Далее'
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
  object Check_oklad: TRadioButton
    Left = 4
    Top = 6
    Width = 129
    Height = 17
    Caption = 'Должностной оклад'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
end
