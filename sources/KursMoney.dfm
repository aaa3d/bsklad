object Kurs_Money: TKurs_Money
  Left = 88
  Top = 152
  Width = 680
  Height = 344
  Caption = 'Сервис. Курсы ценообразования.'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 672
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
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object BtnHistory: TToolButton
      Left = 33
      Top = 2
      Hint = '"История" изменений курсов ценообразования (F12)'
      Caption = 'BtnHistory'
      ImageIndex = 3
      OnClick = BtnHistoryClick
    end
    object ToolButton1: TToolButton
      Left = 58
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 66
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton3'
      ImageIndex = 110
      OnClick = ToolButton3Click
    end
    object ToolButton4: TToolButton
      Left = 91
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 111
      Style = tbsSeparator
    end
    object Button1: TButton
      Left = 99
      Top = 2
      Width = 260
      Height = 24
      Caption = 'Сформировать акт переоценки на базовую цену'
      TabOrder = 0
      OnClick = Button1Click
    end
    object ToolButton5: TToolButton
      Left = 359
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 112
      Style = tbsSeparator
    end
    object Button2: TButton
      Left = 367
      Top = 2
      Width = 290
      Height = 24
      Caption = 'Сформировать акт переоценки на обособленные цены'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 298
    Width = 672
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
        'изменяются курсы валют, '
        'на основе которых '
        'формируются цены на '
        'товары.'
        '  Вы не можете изменить '
        'курс рубля. Он всегда '
        'будет "1".'
        'Изменение курса доллара '
        'США не формирует акта '
        'переоценки.'
        'Для этого следует нажать '
        'кнопку "Сформировать '
        'акт переоценки"!')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 157
    Top = 29
    Width = 515
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
        FieldName = 'VALUTA_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Валюта'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KURS_KURS'
        Title.Alignment = taCenter
        Title.Caption = 'Курс рубля к валюте'
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
  object IbQrKursMoney: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IbTrKursMoney
    AfterOpen = IbQrKursMoneyAfterOpen
    AfterScroll = IbQrKursMoneyAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select valuta.valuta_id,'
      '(select kurs.kurs_kurs from kurs where kurs.kurs_date='
      ' (select max(kurs_date) from kurs where '
      
        '   valuta.valuta_id=kurs.valuta_id and kurs.kurs_typ=0)) as kurs' +
        '_kurs,'
      '(select max(kurs_date) from kurs where '
      
        '   valuta.valuta_id=kurs.valuta_id and kurs.kurs_typ=0) as kurs_' +
        'date,'
      'valuta_full from valuta'
      'order by valuta.valuta_id')
    Left = 188
    Top = 76
    object IbQrKursMoneyVALUTA_ID: TIntegerField
      FieldName = 'VALUTA_ID'
      Required = True
    end
    object IbQrKursMoneyKURS_KURS: TFloatField
      FieldName = 'KURS_KURS'
      DisplayFormat = '#0.0000 руб.'
    end
    object IbQrKursMoneyKURS_DATE: TDateTimeField
      FieldName = 'KURS_DATE'
    end
    object IbQrKursMoneyVALUTA_FULL: TIBStringField
      FieldName = 'VALUTA_FULL'
      Required = True
      Size = 254
    end
  end
  object IbTrKursMoney: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 188
    Top = 184
  end
  object DsQrKursMoney: TDataSource
    DataSet = IbQrKursMoney
    Left = 188
    Top = 132
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 292
    Top = 76
    object MnOpen: TMenuItem
      Caption = 'Изменить курс ценообразования '
      ImageIndex = 1
      ShortCut = 13
      OnClick = BtnOpenClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MnHistory: TMenuItem
      Caption = '"История" курса ценнобразования выделенной валюты'
      ImageIndex = 3
      ShortCut = 123
      OnClick = BtnHistoryClick
    end
  end
end
