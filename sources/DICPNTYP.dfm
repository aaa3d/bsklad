object DIC_PNTYP: TDIC_PNTYP
  Left = 79
  Top = 208
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '“ипы приходных накладных'
  ClientHeight = 238
  ClientWidth = 632
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
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 213
    Height = 238
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
      Height = 236
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        'Ёто справочник типов приходных'
        'накладных.  оличество типов '
        'накладных определ€ет количество '
        'журналов.'
        'ƒл€ каждого типа накладных '
        'задаЄтс€ полное название и '
        'сокращение. ѕолное название '
        'отражаетс€ в названии журналов, '
        'сокращение типа пишетс€ перед '
        'каждым номером накладной.'
        '¬ы не можете удалить тип '
        'накладной, если создана хот€ бы '
        'одна накладна€ этого типа.')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 213
    Top = 0
    Width = 419
    Height = 238
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 419
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
        Hint = '—оздать новый тип...(Insert)'
        Caption = 'BtnNEW'
        ImageIndex = 0
        OnClick = BtnNEWClick
      end
      object BtnOPEN: TToolButton
        Left = 25
        Top = 2
        Hint = '»зменить названи€ типа...(Enter)'
        Caption = 'BtnOPEN'
        ImageIndex = 1
        OnClick = BtnOPENClick
      end
      object BtnDELETE: TToolButton
        Left = 50
        Top = 2
        Hint = '”далить тип накладных...(Delete)'
        Caption = 'BtnDEL'
        ImageIndex = 2
        OnClick = BtnDELETEClick
      end
      object ToolButton3: TToolButton
        Left = 75
        Top = 2
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 83
        Top = 2
        Hint = '«аблокировать систему'
        Caption = 'ToolButton2'
        ImageIndex = 110
        OnClick = ToolButton2Click
      end
      object ToolButton1: TToolButton
        Left = 108
        Top = 2
        Width = 273
        Caption = 'ToolButton1'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object Image1: TImage
        Left = 381
        Top = 6
        Width = 16
        Height = 16
        Hint = 
          'ƒанна€ форма соответствует требовани€м программ,'#13#10'созданным с ло' +
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
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 28
      Width = 419
      Height = 210
      Align = alClient
      DataSource = DsPNTYP
      TabOrder = 1
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
          FieldName = 'PNTYP_ID'
          Title.Alignment = taCenter
          Title.Caption = ' од'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PNTYP_SHORT'
          Title.Alignment = taCenter
          Title.Caption = '—окращение'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PNTYP_FULL'
          Title.Alignment = taCenter
          Title.Caption = 'ѕолное название'
          Width = 298
          Visible = True
        end>
    end
  end
  object TransactionTYP: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 60
    Top = 100
  end
  object Query_PNTYP: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTYP
    AfterOpen = Query_PNTYPAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from PNTYP order by PNTYP_SHORT')
    Left = 64
    Top = 156
    object Query_PNTYPPNTYP_ID: TIntegerField
      FieldName = 'PNTYP_ID'
      Required = True
    end
    object Query_PNTYPPNTYP_SHORT: TIBStringField
      FieldName = 'PNTYP_SHORT'
      Required = True
      Size = 32
    end
    object Query_PNTYPPNTYP_FULL: TIBStringField
      FieldName = 'PNTYP_FULL'
      Required = True
      Size = 254
    end
    object Query_PNTYPNUM_TYP: TSmallintField
      FieldName = 'NUM_TYP'
      Required = True
    end
  end
  object DsPNTYP: TDataSource
    DataSet = Query_PNTYP
    Left = 64
    Top = 212
  end
  object PopupMenu1: TPopupMenu
    Left = 357
    Top = 72
    object MnNew: TMenuItem
      Caption = 'Ќовый тип приходной накладной'
      ShortCut = 45
      OnClick = BtnNEWClick
    end
    object MnOpen: TMenuItem
      Caption = '»зменить тип приходной накладной (Enter)'
      OnClick = BtnOPENClick
    end
    object MnDel: TMenuItem
      Caption = '”далить тип приходной накладной'
      ShortCut = 46
      OnClick = BtnDELETEClick
    end
  end
end
