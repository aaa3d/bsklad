object DIC_RNTYP: TDIC_RNTYP
  Left = 38
  Top = 161
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Типы расходных накладных'
  ClientHeight = 432
  ClientWidth = 788
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 432
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 788
      Height = 28
      AutoSize = True
      ButtonHeight = 24
      ButtonWidth = 25
      Caption = 'ToolBar1'
      DockSite = True
      Images = DataModule1.ImageList1
      TabOrder = 0
      object Image1: TImage
        Left = 0
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
      object ToolButton1: TToolButton
        Left = 16
        Top = 2
        Width = 5
        Caption = 'ToolButton1'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object BtnNEW: TToolButton
        Left = 21
        Top = 2
        Hint = 'Создать новый тип...(Insert)'
        Caption = 'BtnNEW'
        ImageIndex = 0
        OnClick = BtnNEWClick
      end
      object BtnOPEN: TToolButton
        Left = 46
        Top = 2
        Hint = 'Изменить названия типа...(Enter)'
        Caption = 'BtnOPEN'
        ImageIndex = 1
        OnClick = BtnOPENClick
      end
      object BtnDEL: TToolButton
        Left = 71
        Top = 2
        Hint = 'Удалить тип накладных...(Delete)'
        Caption = 'BtnDEL'
        ImageIndex = 2
        OnClick = BtnDELClick
      end
      object ToolButton2: TToolButton
        Left = 96
        Top = 2
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton3: TToolButton
        Left = 104
        Top = 2
        Hint = 'Заблокировать систему'
        Caption = 'ToolButton3'
        ImageIndex = 110
        OnClick = ToolButton3Click
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 28
      Width = 788
      Height = 404
      Align = alClient
      DataSource = DsRNTYP
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
          FieldName = 'RNTYP_ID'
          Title.Alignment = taCenter
          Title.Caption = 'Код'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RNTYP_SHORT'
          Title.Alignment = taCenter
          Title.Caption = 'Сокращение'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RNTYP_FULL'
          Title.Alignment = taCenter
          Title.Caption = 'Полное название'
          Width = 254
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NP'
          Title.Alignment = taCenter
          Title.Caption = 'Ставка НП'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOCLOSE_FULL'
          Title.Alignment = taCenter
          Title.Caption = 'Период'
          Width = 137
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RNTYP_NDS_FULL'
          Title.Alignment = taCenter
          Title.Caption = 'НДС'
          Width = 157
          Visible = True
        end>
    end
  end
  object TransactionTYP: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 254
    Top = 94
  end
  object Query_RNTYP: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionTYP
    AfterOpen = Query_RNTYPAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from dic_rntyp')
    Left = 258
    Top = 150
    object Query_RNTYPRNTYP_ID: TIntegerField
      FieldName = 'RNTYP_ID'
      Origin = 'DIC_RNTYP.RNTYP_ID'
    end
    object Query_RNTYPRNTYP_SHORT: TIBStringField
      FieldName = 'RNTYP_SHORT'
      Origin = 'DIC_RNTYP.RNTYP_SHORT'
      Size = 32
    end
    object Query_RNTYPRNTYP_FULL: TIBStringField
      FieldName = 'RNTYP_FULL'
      Origin = 'DIC_RNTYP.RNTYP_FULL'
      Size = 254
    end
    object Query_RNTYPRNTYP_NDS_FULL: TIBStringField
      FieldName = 'RNTYP_NDS_FULL'
      Origin = 'DIC_RNTYP.RNTYP_NDS_FULL'
      Size = 64
    end
    object Query_RNTYPNOCLOSE_FULL: TIBStringField
      FieldName = 'NOCLOSE_FULL'
      Origin = 'DIC_RNTYP.NOCLOSE_FULL'
      Size = 64
    end
    object Query_RNTYPNP: TFloatField
      FieldName = 'NP'
      Origin = 'DIC_RNTYP.NP'
      DisplayFormat = '#0.00%'
    end
  end
  object DsRNTYP: TDataSource
    DataSet = Query_RNTYP
    Left = 258
    Top = 206
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
      Caption = 'Изменить тип расходной накладной (Enter)'
      OnClick = BtnOPENClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить тип расходной накладной'
      ShortCut = 46
      OnClick = BtnDELClick
    end
  end
end
