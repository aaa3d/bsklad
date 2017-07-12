object DIC_ZONE: TDIC_ZONE
  Left = 352
  Top = 260
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Справочник зон'
  ClientHeight = 498
  ClientWidth = 996
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
    Width = 996
    Height = 498
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 996
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
        Width = 286
        Caption = 'ToolButton1'
        ImageIndex = 3
        Style = tbsSeparator
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 28
      Width = 996
      Height = 470
      Align = alClient
      DataSource = DsZone
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
          FieldName = 'ZONE_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Зона'
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SKL_SHORT'
          Title.Caption = 'Склад'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZONE_DESCR'
          Title.Caption = 'Описание'
          Width = 202
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZONE_KUBATURA'
          Title.Caption = 'Объем зоны'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZONE_TYPE'
          Title.Caption = 'Тип'
          Width = 109
          Visible = True
        end>
    end
  end
  object TransactionZone: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 60
    Top = 100
  end
  object Query_ZONE: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TransactionZone
    AfterOpen = Query_ZONEAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select zone.*, skl.skl_short from ZONE'
      'left join skl on skl.skl_id = zone.skl_id'
      'order  by skl_short, ZONE_NAME')
    Left = 64
    Top = 156
    object Query_ZONEZONE_ID: TIntegerField
      FieldName = 'ZONE_ID'
      Origin = 'ZONE.ZONE_ID'
      Required = True
    end
    object Query_ZONESKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Origin = 'ZONE.SKL_ID'
      Required = True
    end
    object Query_ZONEZONE_NAME: TIBStringField
      FieldName = 'ZONE_NAME'
      Origin = 'ZONE.ZONE_NAME'
      Required = True
      Size = 32
    end
    object Query_ZONEZONE_DESCR: TIBStringField
      FieldName = 'ZONE_DESCR'
      Origin = 'ZONE.ZONE_DESCR'
      Size = 254
    end
    object Query_ZONETM: TDateTimeField
      FieldName = 'TM'
      Origin = 'ZONE.TM'
    end
    object Query_ZONESKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'SKL.SKL_SHORT'
      Size = 32
    end
    object Query_ZONETW_DATE_PROIZV: TIBStringField
      FieldName = 'TW_DATE_PROIZV'
      Origin = 'ZONE.TW_DATE_PROIZV'
      Size = 32
    end
    object Query_ZONEZONE_KUBATURA: TFloatField
      FieldName = 'ZONE_KUBATURA'
      Origin = 'ZONE.ZONE_KUBATURA'
      DisplayFormat = '#0.00#'
    end
    object Query_ZONEZONE_TYPE: TIBStringField
      FieldName = 'ZONE_TYPE'
      Origin = 'ZONE.ZONE_TYPE'
      Size = 32
    end
  end
  object DsZone: TDataSource
    DataSet = Query_ZONE
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
      Caption = 'Изменить тип расходной накладной (Enter)'
      OnClick = BtnOPENClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить тип расходной накладной'
      ShortCut = 46
      OnClick = BtnDELClick
    end
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 325
    Top = 136
  end
end
