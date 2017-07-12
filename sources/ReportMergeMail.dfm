object REPORT_MERGE_MAIL: TREPORT_MERGE_MAIL
  Left = 60
  Top = 109
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Отчет об объединении попутных заявок на перемещение'
  ClientHeight = 364
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 612
    Height = 364
    Align = alClient
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    TabOrder = 0
  end
end
