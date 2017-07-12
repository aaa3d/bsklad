object REPORT_PRIBYL_NEW_ERROR: TREPORT_PRIBYL_NEW_ERROR
  Left = 2
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ошибки в сторно! отчет построить невозможно!'
  ClientHeight = 453
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Align = alClient
    DataSource = DataModule1.DsStorno
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyPress = RxDBGrid1KeyPress
    Columns = <
      item
        Color = 170
        Expanded = False
        FieldName = 'STORNO_FULLNUM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Номер сторно'
        Width = 139
        Visible = True
      end
      item
        Color = 170
        Expanded = False
        FieldName = 'STORNO_DATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Дата сторно'
        Visible = True
      end
      item
        Color = 170
        Expanded = False
        FieldName = 'RN_DATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Дата продажи'
        Visible = True
      end
      item
        Color = 170
        Expanded = False
        FieldName = 'MESS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Описание ошибки!'
        Visible = True
      end>
  end
end
