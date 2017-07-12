object DIC_VALUTA: TDIC_VALUTA
  Left = 72
  Top = 156
  Width = 642
  Height = 281
  BorderIcons = [biSystemMenu]
  Caption = 'Виды валют'
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
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 213
    Height = 254
    Align = alLeft
    BevelOuter = bvLowered
    Caption = 'Panel2'
    Color = 14548223
    TabOrder = 0
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
      Left = 20
      Top = 1
      Width = 192
      Height = 252
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        '  Это справочник видов валют.'
        '  Валюту "Рубли" Вы не можете ни '
        'исправить, ни удалить, т.к. она '
        'является базовой для России.'
        '  Дополнительно можно '
        'определить любое количество '
        'других валют (доллары, марки, '
        'Евро и т.д.).'
        '  Это позволить выписывать '
        'документы (счета, накладные) в '
        'этих валютах, а также строить '
        'отчёты с отображением цен и '
        'сумм в нужной Вам валюте.'
        '  Для каждой из перечисленных '
        'валют, кроме рублей необходимо '
        'задать курсы их по отношению к '
        'рублю.'
        '  Такими курсами являются: '
        'Курсы ценообразования и курсы '
        'продаж. Их установить или '
        'изменить можно в меню "Сервис-'
        'Курсы валют".')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 213
    Top = 0
    Width = 421
    Height = 254
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 0
      Top = 236
      Width = 421
      Height = 18
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Image1: TImage
        Left = 0
        Top = 4
        Width = 16
        Height = 16
        Hint = 
          'Здесь отображается лексическое представление валюты для корректн' +
          'ого отображения количества'
        AutoSize = True
        Picture.Data = {
          07544269746D6170F6000000424DF60000000000000076000000280000001000
          000010000000010004000000000080000000120B0000120B0000100000001000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFF
          FF00DADADADADADADADAADADADA77DADADADDADADA7007DADADAADADA70FB07D
          ADADDADA70FBFB07DADAADA70FB00FB07DADDA70FBFBFBFB07DAA70FBFB00FBF
          B07DD07BFBF00BFBF70AAD0FBFB00FBFB07DDAD0FBF00BFB07DAADAD0FB00FB0
          7DADDADAD0FBFB07DADAADADAD0FB07DADADDADADAD007DADADAADADADAD7DAD
          ADAD}
        Transparent = True
      end
      object Caption_auto2: TLabel
        Left = 20
        Top = 4
        Width = 60
        Height = 13
        Hint = 
          'Здесь отображается лексическое представление валюты для корректн' +
          'ого отображения количества'
        Caption = 'Синтаксис :'
      end
      object Caption_auto: TLabel
        Left = 84
        Top = 4
        Width = 63
        Height = 13
        Hint = 
          'Здесь отображается лексическое представление валюты для корректн' +
          'ого отображения количества'
        Caption = 'Caption_auto'
      end
      object Image3: TImage
        Left = 404
        Top = 2
        Width = 16
        Height = 16
        Hint = 
          'Данная форма соответствует требованиям программ,'#13#10'созданным с ло' +
          'готипом Beginner(R)'
        AutoSize = True
        Picture.Data = {
          07544269746D6170F6000000424DF60000000000000076000000280000001000
          000010000000010004000000000080000000120B0000120B0000100000000000
          0000000000000000800000800000008080008000000080008000808000008080
          8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
          FF008888888888888888888884F8888888888888444F888888888884444F8888
          888888444F44F88888888444F8844F888888884F88884F8888888888888884F8
          888888BBBBBB884F88888000000BB884F8888800B800B8884F888800BB008888
          84F88800000BB88888488800B800B88888888800BB0088888888800000088888
          8888}
        Transparent = True
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 28
      Width = 421
      Height = 208
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnKeyDown = DBGrid1KeyDown
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'VALUTA_FULL'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Полное наименование'
          Width = 294
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALUTA_SHORT'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Сокращение'
          Width = 90
          Visible = True
        end>
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 421
      Height = 28
      AutoSize = True
      ButtonHeight = 24
      ButtonWidth = 25
      Caption = 'ToolBar1'
      DockSite = True
      Images = DataModule1.ImageList1
      TabOrder = 2
      object BtnNEW: TToolButton
        Left = 0
        Top = 2
        Hint = 'Создать новую валюту...(Insert)'
        Caption = 'BtnNEW'
        ImageIndex = 0
        OnClick = BtnNEWClick
      end
      object BtnOPEN: TToolButton
        Left = 25
        Top = 2
        Hint = 'Изменить названия валюты...(Enter)'
        Caption = 'BtnOPEN'
        ImageIndex = 1
        OnClick = BtnOPENClick
      end
      object BtnDELETE: TToolButton
        Left = 50
        Top = 2
        Hint = 'Удалить валюту...(Delete)'
        Caption = 'BtnDELETE'
        ImageIndex = 2
        OnClick = BtnDELETEClick
      end
      object ToolButton1: TToolButton
        Left = 75
        Top = 2
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 83
        Top = 2
        Hint = 'Заблокировать систему'
        Caption = 'ToolButton2'
        ImageIndex = 110
        OnClick = ToolButton2Click
      end
    end
  end
  object QrValuta: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    AfterOpen = QrValutaAfterOpen
    AfterScroll = QrValutaAfterScroll
    CachedUpdates = False
    SQL.Strings = (
      'select * from VALUTA order by VALUTA_FULL')
    Left = 28
    Top = 88
    object QrValutaVALUTA_ID: TIntegerField
      FieldName = 'VALUTA_ID'
      Required = True
    end
    object QrValutaVALUTA_SHORT: TIBStringField
      FieldName = 'VALUTA_SHORT'
      Required = True
      Size = 32
    end
    object QrValutaVALUTA_FULL: TIBStringField
      FieldName = 'VALUTA_FULL'
      Required = True
      Size = 254
    end
    object QrValutaVALUTA_AUTO1: TIBStringField
      FieldName = 'VALUTA_AUTO1'
      Required = True
      Size = 254
    end
    object QrValutaVALUTA_AUTO2: TIBStringField
      FieldName = 'VALUTA_AUTO2'
      Required = True
      Size = 254
    end
    object QrValutaVALUTA_AUTO3: TIBStringField
      FieldName = 'VALUTA_AUTO3'
      Required = True
      Size = 254
    end
  end
  object DataSource1: TDataSource
    DataSet = QrValuta
    Left = 28
    Top = 148
  end
end
