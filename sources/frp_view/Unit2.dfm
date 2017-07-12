object Form2: TForm2
  Left = 428
  Top = 177
  Width = 358
  Height = 255
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 208
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 56
    Top = 68
    ReportForm = {18000000}
  end
  object frDesigner1: TfrDesigner
    Left = 104
    Top = 48
  end
  object OpenDialog1: TOpenDialog
    Left = 156
    Top = 12
  end
end
