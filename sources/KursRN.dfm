object Kurs_RN: TKurs_RN
  Left = 26
  Top = 133
  Width = 744
  Height = 344
  Caption = 'Сервис. Курсы Расходных накладных'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  ShowHint = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 736
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnOpen: TToolButton
      Left = 0
      Top = 2
      Hint = 'Изменить курс ценообразования...(Enter)'
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object BtnPrint: TToolButton
      Left = 25
      Top = 2
      Hint = 'Распечатать курсы ценообразования...(F9)'
      Caption = 'BtnPrint'
      ImageIndex = 9
      Visible = False
      OnClick = BtnPrintClick
    end
    object ToolButton2: TToolButton
      Left = 50
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object BtnPropertis: TToolButton
      Left = 58
      Top = 2
      Hint = '"История" изменений курсов ценообразования (F12)'
      Caption = 'BtnPropertis'
      ImageIndex = 3
      OnClick = BtnPropertisClick
    end
    object ToolButton1: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 91
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton3'
      ImageIndex = 110
      OnClick = ToolButton3Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 298
    Width = 736
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 157
    Height = 269
    Align = alLeft
    BevelOuter = bvLowered
    Color = 14548223
    TabOrder = 2
    object Image2: TImage
      Left = 0
      Top = 2
      Width = 16
      Height = 16
      AutoSize = True
      Picture.Data = {
        07544269746D6170F6000000424DF60000000000000076000000280000001000
        000010000000010004000000000080000000120B0000120B0000100000001000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFF
        FF00DADADADADADA0ADAADADADADADA00DADDADA7777770B07DAADA0000000FF
        007DDA0FFFBFBFBFFF07AD0FBFFF44FFBF07DA0FFFBFFFBFFF07AD0FBFFF47FF
        BF07DA0FFFBF748FFF07AD0FBFFFB747BF07DA0FFF47FF44FF07AD0FBF44B844
        BF07DA0FFF844448FF07AD0FBFFFBFFFBF07DA0FFFBFFFBFFF0AADA000000000
        00AD}
      Transparent = True
    end
    object RichEdit1: TRichEdit
      Left = 16
      Top = 1
      Width = 140
      Height = 267
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        '  В даннной форме '
        'отображаются и '
        'изменяются курсы '
        'доллара для каждого из '
        'типов расходных '
        'накладных.'
        'Если курс накладной '
        'будет '
        'отличаться от курса '
        'ценообразования, то при '
        'наборе товаров в '
        'накладные цены на '
        '"долларовые" товары '
        'будут выставляться по '
        'курсу, установленному в '
        'данной форме.')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 157
    Top = 29
    Width = 579
    Height = 269
    Align = alClient
    DataSource = DsQrKursMoney
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    OnKeyPress = RxDBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'RNTYP_SHORT'
        Title.Alignment = taCenter
        Title.Caption = 'Сокращение'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNTYP_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Полное название типа'
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KURS_KURS'
        Title.Alignment = taCenter
        Title.Caption = 'Курс накладной'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KURS_DATE'
        Title.Alignment = taCenter
        Title.Caption = 'Установлен'
        Width = 113
        Visible = True
      end>
  end
  object IbQrKursRN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IbTrKursRN
    AfterOpen = IbQrKursRNAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select rntyp.rntyp_id,'
      '(select max(kurs.kurs_kurs) from kurs where kurs.kurs_date='
      ' (select max(kurs_date) from kurs where '
      
        '   kurs.valuta_id=1 and kurs.kurs_typ=-rntyp.rntyp_id)) as kurs_' +
        'kurs,'
      '(select max(kurs_date) from kurs where '
      
        '   kurs.valuta_id=1 and kurs.kurs_typ=-rntyp.rntyp_id) as kurs_d' +
        'ate,'
      'rntyp.rntyp_short,'
      'rntyp.rntyp_full'
      'from rntyp'
      'order by rntyp.rntyp_id')
    Left = 188
    Top = 76
    object IbQrKursRNRNTYP_ID: TIntegerField
      FieldName = 'RNTYP_ID'
      Required = True
    end
    object IbQrKursRNKURS_KURS: TFloatField
      FieldName = 'KURS_KURS'
      DisplayFormat = ',#0.0000 руб/$'
    end
    object IbQrKursRNKURS_DATE: TDateTimeField
      FieldName = 'KURS_DATE'
    end
    object IbQrKursRNRNTYP_SHORT: TIBStringField
      FieldName = 'RNTYP_SHORT'
      Required = True
      Size = 32
    end
    object IbQrKursRNRNTYP_FULL: TIBStringField
      FieldName = 'RNTYP_FULL'
      Required = True
      Size = 254
    end
  end
  object IbTrKursRN: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 188
    Top = 184
  end
  object DsQrKursMoney: TDataSource
    DataSet = IbQrKursRN
    Left = 188
    Top = 132
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 324
    Top = 88
    object N1: TMenuItem
      Caption = 'Изменить курс'
      ImageIndex = 1
      ShortCut = 13
      OnClick = BtnOpenClick
    end
    object N2: TMenuItem
      Caption = 'Печать перечня курсов'
      ImageIndex = 9
      ShortCut = 120
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = 'История курса приходных накладных'
      ImageIndex = 3
      OnClick = BtnPropertisClick
    end
  end
end
