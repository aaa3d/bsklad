object Set_PNPRINT: TSet_PNPRINT
  Left = 193
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Печать приходной накладной'
  ClientHeight = 78
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BtnCLose: TButton
    Left = 0
    Top = 52
    Width = 185
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    OnClick = BtnCLoseClick
  end
  object Btn1: TButton
    Left = 0
    Top = 0
    Width = 185
    Height = 25
    Caption = 'В закупочных ценах'
    TabOrder = 0
    OnClick = Btn1Click
  end
  object Btn2: TButton
    Left = 0
    Top = 24
    Width = 185
    Height = 25
    Caption = 'В розничных ценах'
    TabOrder = 1
    OnClick = Btn2Click
  end
end
