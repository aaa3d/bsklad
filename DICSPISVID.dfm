object DIC_SPISVID: TDIC_SPISVID
  Left = 3
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Виды актов списания'
  ClientHeight = 348
  ClientWidth = 639
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
        'Это справочник видов актов '
        'списания '
        'Для каждого вида накладных '
        'задаётся название и маханизм '
        'расчёта. '
        'Вы не можете удалить вид '
        'накладной, если создана хотя бы '
        'одна накладная этого вида.')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 213
    Top = 0
    Width = 426
    Height = 348
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 426
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
        Hint = 'Создать новый вид...(Insert)'
        Caption = 'BtnNEW'
        ImageIndex = 0
        OnClick = BtnNEWClick
      end
      object BtnOPEN: TToolButton
        Left = 25
        Top = 2
        Hint = 'Изменить названия вида..(Enter)'
        Caption = 'BtnOPEN'
        ImageIndex = 1
        OnClick = BtnOPENClick
      end
      object BtnDEL: TToolButton
        Left = 50
        Top = 2
        Hint = 'Удалить вид накладных...(Delete)'
        Caption = 'BtnDEL'
        ImageIndex = 2
        OnClick = BtnDELClick
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
        Hint = 'Заблокировать систему'
        Caption = 'ToolButton2'
        ImageIndex = 110
        OnClick = ToolButton2Click
      end
      object ToolButton1: TToolButton
        Left = 108
        Top = 2
        Width = 298
        Caption = 'ToolButton1'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object Image1: TImage
        Left = 406
        Top = 6
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
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 28
      Width = 426
      Height = 320
      Align = alClient
      DataSource = DsSPISVID
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
          FieldName = 'SPISVID_NAM'
          Title.Alignment = taCenter
          Title.Caption = 'Название вида'
          Width = 386
          Visible = True
        end>
    end
  end
  object TransactionVID: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 60
    Top = 100
  end
  object Query_SPISVID: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionVID
    AfterOpen = Query_SPISVIDAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from SPISVID order by SPISVID_NAM')
    Left = 64
    Top = 156
    object Query_SPISVIDSPISVID_ID: TIntegerField
      FieldName = 'SPISVID_ID'
      Required = True
    end
    object Query_SPISVIDSPISVID_NAM: TIBStringField
      FieldName = 'SPISVID_NAM'
      Required = True
      Size = 64
    end
  end
  object DsSPISVID: TDataSource
    DataSet = Query_SPISVID
    Left = 64
    Top = 212
  end
  object PopupMenu1: TPopupMenu
    Left = 357
    Top = 72
    object MnNew: TMenuItem
      Caption = 'Новый тип расходной накладной'
      ShortCut = 45
      OnClick = BtnNEWClick
    end
    object MnOpen: TMenuItem
      Caption = 'Изменить вид расходной накладной (Enter)'
      OnClick = BtnOPENClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить тип расходной накладной'
      ShortCut = 46
      OnClick = BtnDELClick
    end
  end
end
