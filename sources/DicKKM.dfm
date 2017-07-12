object DIC_KKM: TDIC_KKM
  Left = 65
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Список кассовых аппаратов'
  ClientHeight = 453
  ClientWidth = 821
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 821
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = ActNew
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Action = ActOpen
    end
    object ToolButton3: TToolButton
      Left = 50
      Top = 2
      Action = ActDel
    end
    object ToolButton4: TToolButton
      Left = 75
      Top = 2
      Action = ActHeader
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 434
    Width = 821
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 109
    Width = 821
    Height = 325
    Align = alClient
    DataSource = DsList
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SHOP_NAME'
        Title.Caption = 'Магазин'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KKM_NAME'
        Title.Caption = 'Наименование'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMP_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Имя компьютера'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODEL_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Модель ККМ'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MODEL_NUM'
        Title.Alignment = taCenter
        Title.Caption = 'Код поставщика/зав. номер'
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COM_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'Порт'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FRM_NAME'
        Title.Caption = 'Фирма'
        Width = 218
        Visible = True
      end>
  end
  object RichEdit1: TRichEdit
    Left = 0
    Top = 29
    Width = 821
    Height = 80
    TabStop = False
    Align = alTop
    BorderStyle = bsNone
    Color = 14548223
    Lines.Strings = (
      'Список кассовых аппаратов, работающих в системе АРМ Склад.'
      'Для аппаратов Штрих ФР-К СОМ порт не указывается,'
      'но указывается фирма, по которой производятся продажи.'
      'Для аппаратов Штрих ФР-К указывается завозской номер,'
      'для остальных - код активации режима чековый онлайн.')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
    WordWrap = False
  end
  object ListTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 272
    Top = 108
  end
  object QueryList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ListTransaction
    AfterOpen = QueryListAfterOpen
    AfterScroll = QueryListAfterScroll
    OnCalcFields = QueryListCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select list_kkm.*, (select kln_short from kln_data(list_kkm.frm_' +
        'id)) FRM_NAME from list_kkm order by shop_name')
    Left = 360
    Top = 108
    object QueryListCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
      Origin = 'LIST_KKM.CFG_ID'
    end
    object QueryListCOMP_NAME: TIBStringField
      FieldName = 'COMP_NAME'
      Origin = 'LIST_KKM.COMP_NAME'
      Size = 32
    end
    object QueryListMODEL: TIntegerField
      FieldName = 'MODEL'
      Origin = 'LIST_KKM.MODEL'
    end
    object QueryListMODEL_NAME: TIBStringField
      FieldName = 'MODEL_NAME'
      Origin = 'LIST_KKM.MODEL_NAME'
      Size = 32
    end
    object QueryListCOM: TIntegerField
      FieldName = 'COM'
      Origin = 'LIST_KKM.COM'
    end
    object QueryListMODEL_NUM: TIBStringField
      FieldName = 'MODEL_NUM'
      Origin = 'LIST_KKM.MODEL_NUM'
      Size = 32
    end
    object QueryListCOM_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'COM_NAME'
      Size = 10
      Calculated = True
    end
    object QueryListSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Origin = 'LIST_KKM.SHOP_NAME'
      Size = 32
    end
    object QueryListKKM_NAME: TIBStringField
      FieldName = 'KKM_NAME'
      Origin = 'LIST_KKM.KKM_NAME'
      Size = 32
    end
    object QueryListSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'LIST_KKM.SHOP_ID'
    end
    object QueryListFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
      Origin = 'LIST_KKM.FRM_ID'
    end
    object QueryListFRM_NAME: TIBStringField
      FieldName = 'FRM_NAME'
      Size = 254
    end
  end
  object DsList: TDataSource
    DataSet = QueryList
    Left = 360
    Top = 168
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 428
    Top = 176
    object ActNew: TAction
      Caption = 'Новый...'
      Hint = 'Новый...'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = ActNewExecute
    end
    object ActOpen: TAction
      Caption = 'Изменить...'
      Hint = 'Изменить...'
      ImageIndex = 1
      ShortCut = 13
      OnExecute = ActOpenExecute
    end
    object ActDel: TAction
      Caption = 'Удалить'
      Hint = 'Удалить'
      ImageIndex = 2
      OnExecute = ActDelExecute
    end
    object ActHeader: TAction
      Caption = 'ActHeader'
      Hint = 'Заголовок чека'
      ImageIndex = 14
      OnExecute = ActHeaderExecute
    end
  end
end
