object DIC_TWKTG: TDIC_TWKTG
  Left = 63
  Top = 157
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Категории товаров'
  ClientHeight = 348
  ClientWidth = 841
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 213
    Height = 348
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
      Height = 346
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        'Это справочник категорий товаров.'
        'Наличие этого справочника '
        'позволяет "поделить" товарную '
        'массу на определённые списки, что '
        'в последствии позволяет делать с '
        'товарами из этих списков '
        'однотипные операции,'
        'например построить отчёт по '
        'определённой группе, увеличить '
        'цену '
        'всех товаров одной группы на 1 '
        'рубль, выставить у всех товаров из '
        'этой группы единую валюту и т.д.')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 213
    Top = 0
    Width = 628
    Height = 348
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 628
      Height = 28
      AutoSize = True
      ButtonHeight = 24
      ButtonWidth = 25
      Caption = 'ToolBar1'
      DockSite = True
      Images = DataModule1.ImageList1
      TabOrder = 0
      object BtnNEW: TToolButton
        Left = 0
        Top = 2
        Hint = 'Создать новую категорию...(Insert)'
        Caption = 'BtnNEW'
        ImageIndex = 0
        OnClick = BtnNEWClick
      end
      object BtnOPEN: TToolButton
        Left = 25
        Top = 2
        Hint = 'Изменить названия категории...(Enter)'
        Caption = 'BtnOPEN'
        ImageIndex = 1
        OnClick = BtnOPENClick
      end
      object BtnDEL: TToolButton
        Left = 50
        Top = 2
        Hint = 'Удалить категорию...(Delete)'
        Caption = 'BtnDEL'
        ImageIndex = 2
        OnClick = BtnDELClick
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
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 28
      Width = 628
      Height = 320
      Align = alClient
      DataSource = DsTWKTG
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = RxDBGrid1DblClick
      OnGetCellParams = RxDBGrid1GetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'TWKTG_NAM'
          Title.Alignment = taCenter
          Title.Caption = 'Наименование категории товаров'
          Width = 313
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TWKTG_PRIM'
          Title.Alignment = taCenter
          Title.Caption = 'Доп. информация на ценнике'
          Width = 275
          Visible = True
        end>
    end
  end
  object Query_TWKTG: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTWKTG
    AfterOpen = Query_TWKTGAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from TWKTG order by TWKTG_NAM')
    Left = 44
    Top = 164
    object Query_TWKTGTWKTG_ID: TIntegerField
      FieldName = 'TWKTG_ID'
      Required = True
    end
    object Query_TWKTGTWKTG_NAM: TIBStringField
      FieldName = 'TWKTG_NAM'
      Required = True
      Size = 254
    end
    object Query_TWKTGTWKTG_PRIM: TIBStringField
      FieldName = 'TWKTG_PRIM'
      Size = 10000
    end
    object Query_TWKTGTWKTG_COLOR: TIntegerField
      FieldName = 'TWKTG_COLOR'
      Required = True
    end
  end
  object TransactionTWKTG: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 48
    Top = 104
  end
  object DsTWKTG: TDataSource
    DataSet = Query_TWKTG
    Left = 44
    Top = 216
  end
  object PopupMenu1: TPopupMenu
    Left = 329
    Top = 180
    object MnNEW: TMenuItem
      Caption = 'Новая категория товара'
      ShortCut = 45
      OnClick = BtnNEWClick
    end
    object MnOpen: TMenuItem
      Caption = 'Править категорию товара'
      ShortCut = 13
      OnClick = BtnOPENClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить категорию товара'
      ShortCut = 46
      OnClick = BtnDELClick
    end
  end
end
