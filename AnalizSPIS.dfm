object Analiz_SPIS: TAnaliz_SPIS
  Left = 86
  Top = 121
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Анализ акта списания'
  ClientHeight = 478
  ClientWidth = 786
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 459
    Width = 786
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 786
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton3: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton3'
      ImageIndex = 110
      OnClick = ToolButton3Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 786
    Height = 108
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 55
      Top = 12
      Width = 38
      Height = 13
      Caption = 'Акт № :'
    end
    object Label2: TLabel
      Left = 240
      Top = 12
      Width = 17
      Height = 13
      Caption = 'от :'
    end
    object Label6: TLabel
      Left = 33
      Top = 36
      Width = 62
      Height = 13
      Caption = 'Основание :'
    end
    object Label7: TLabel
      Left = 543
      Top = 12
      Width = 54
      Height = 13
      Caption = 'Оформил :'
    end
    object Label10: TLabel
      Left = 31
      Top = 84
      Width = 64
      Height = 13
      Caption = 'Через кого :'
    end
    object Label11: TLabel
      Left = 572
      Top = 36
      Width = 25
      Height = 13
      Caption = 'Вид :'
    end
    object Label12: TLabel
      Left = 559
      Top = 60
      Width = 40
      Height = 13
      Caption = 'Сумма :'
    end
    object SPIS_NUM: TEdit
      Left = 100
      Top = 8
      Width = 133
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'SPIS_NUM'
    end
    object SPIS_DATE: TDateEdit
      Left = 264
      Top = 8
      Width = 101
      Height = 21
      Enabled = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 1
    end
    object SPIS_OSN: TMemo
      Left = 100
      Top = 32
      Width = 437
      Height = 45
      Enabled = False
      Lines.Strings = (
        'PN_OSN')
      TabOrder = 2
    end
    object SPIS_US: TEdit
      Left = 604
      Top = 8
      Width = 177
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = 'SPIS_US'
    end
    object SPIS_WHO: TEdit
      Left = 100
      Top = 80
      Width = 437
      Height = 21
      Enabled = False
      TabOrder = 4
      Text = 'SPIS_WHO'
    end
    object SPISVID_NAM: TEdit
      Left = 604
      Top = 32
      Width = 177
      Height = 21
      Enabled = False
      TabOrder = 5
      Text = 'SPISVID_NAM'
    end
    object SPIS_SUMM: TRxCalcEdit
      Left = 604
      Top = 56
      Width = 121
      Height = 21
      AutoSize = False
      DecimalPlaces = 10
      DisplayFormat = ',#0.00 руб'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 288
    Width = 786
    Height = 171
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label16: TLabel
      Left = 260
      Top = 8
      Width = 305
      Height = 13
      Caption = 'Приходные накладные, с которых списан выбранный товар'
    end
    object RxDBGrid2: TRxDBGrid
      Left = 2
      Top = 24
      Width = 782
      Height = 145
      Align = alBottom
      DataSource = DsAnalizSPISS
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = RxDBGrid2DblClick
      OnGetCellParams = RxDBGrid2GetCellParams
      Columns = <
        item
          Expanded = False
          FieldName = 'VID'
          Title.Alignment = taCenter
          Title.Caption = 'Вид прихода'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FULL_NUM'
          Title.Alignment = taCenter
          Title.Caption = 'Номер накладной'
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PP_DT'
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEB'
          Title.Alignment = taCenter
          Title.Caption = 'Себестоимость'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NDS'
          Title.Alignment = taCenter
          Title.Caption = 'НДС'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CALC_KOL'
          Title.Alignment = taCenter
          Title.Caption = 'Кол-во в расходе'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KLN_FULL'
          Title.Alignment = taCenter
          Title.Caption = 'Поставщик'
          Width = 164
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEN_FULL'
          Title.Alignment = taCenter
          Title.Caption = 'Менеджер-владелец'
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SKL_SHORT'
          Title.Alignment = taCenter
          Title.Caption = 'Склад'
          Width = 159
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEB$'
          Title.Alignment = taCenter
          Title.Caption = 'Себестоимость, $'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NDS$'
          Title.Alignment = taCenter
          Title.Caption = 'НДС, $'
          Visible = True
        end>
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 137
    Width = 786
    Height = 151
    Align = alClient
    DataSource = DsAnalizSPIS
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
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
        FieldName = 'TW_ART'
        Title.Alignment = taCenter
        Title.Caption = 'Код'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_NAM'
        Title.Alignment = taCenter
        Title.Caption = 'Наименование товара'
        Width = 238
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_KOL'
        Title.Alignment = taCenter
        Title.Caption = 'Кол-во'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_SHORT'
        Title.Alignment = taCenter
        Title.Caption = 'Ед. изм.'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEB'
        Title.Alignment = taCenter
        Title.Caption = 'Себест.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDS'
        Title.Alignment = taCenter
        Title.Caption = 'НДС'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEB_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Себест. сумм'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDS_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'НДС. Сумма'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEB$'
        Title.Alignment = taCenter
        Title.Caption = 'Себест. $'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDS$'
        Title.Alignment = taCenter
        Title.Caption = 'НДС, $'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEB$_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма себест.$ '
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NDS$_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма НДС, $'
        Visible = True
      end>
  end
  object AnalizTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 202
    Top = 186
  end
  object QrAnalizSPISS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = AnalizTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ANALIZ_SPISS_FAST(:spiss_id)'
      '')
    Left = 282
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'spiss_id'
        ParamType = ptInput
      end>
    object QrAnalizSPISSPP_TYP: TIntegerField
      FieldName = 'PP_TYP'
      Origin = 'ANALIZ_SPISS_FAST.PP_TYP'
    end
    object QrAnalizSPISSPP_ID: TIntegerField
      FieldName = 'PP_ID'
      Origin = 'ANALIZ_SPISS_FAST.PP_ID'
    end
    object QrAnalizSPISSPP_IDS: TIntegerField
      FieldName = 'PP_IDS'
      Origin = 'ANALIZ_SPISS_FAST.PP_IDS'
    end
    object QrAnalizSPISSVID: TIBStringField
      FieldName = 'VID'
      Origin = 'ANALIZ_SPISS_FAST.VID'
      Size = 32
    end
    object QrAnalizSPISSFULL_NUM: TIBStringField
      FieldName = 'FULL_NUM'
      Origin = 'ANALIZ_SPISS_FAST.FULL_NUM'
      Size = 64
    end
    object QrAnalizSPISSKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'ANALIZ_SPISS_FAST.KLN_ID'
    end
    object QrAnalizSPISSKLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Origin = 'ANALIZ_SPISS_FAST.KLN_FULL'
      Size = 254
    end
    object QrAnalizSPISSPP_MEN: TIntegerField
      FieldName = 'PP_MEN'
      Origin = 'ANALIZ_SPISS_FAST.PP_MEN'
    end
    object QrAnalizSPISSMEN_FULL: TIBStringField
      FieldName = 'MEN_FULL'
      Origin = 'ANALIZ_SPISS_FAST.MEN_FULL'
      Size = 254
    end
    object QrAnalizSPISSCALC_KOL: TFloatField
      FieldName = 'CALC_KOL'
      Origin = 'ANALIZ_SPISS_FAST.CALC_KOL'
      DisplayFormat = '#0.0000'
    end
    object QrAnalizSPISSSEB: TFloatField
      FieldName = 'SEB'
      Origin = 'ANALIZ_SPISS_FAST.SEB'
      DisplayFormat = '#0.00 руб'
    end
    object QrAnalizSPISSSEB2: TFloatField
      FieldName = 'SEB$'
      Origin = 'ANALIZ_SPISS_FAST.SEB$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizSPISSNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'ANALIZ_SPISS_FAST.NDS'
      DisplayFormat = '#0.00 руб'
    end
    object QrAnalizSPISSNDS2: TFloatField
      FieldName = 'NDS$'
      Origin = 'ANALIZ_SPISS_FAST.NDS$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizSPISSSHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'ANALIZ_SPISS_FAST.SHOP_COLOR'
    end
    object QrAnalizSPISSSKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'ANALIZ_SPISS_FAST.SKL_SHORT'
      Size = 64
    end
    object QrAnalizSPISSPP_DT: TDateTimeField
      FieldName = 'PP_DT'
      Origin = 'ANALIZ_SPISS_FAST.PP_DT'
    end
  end
  object DsAnalizSPISS: TDataSource
    DataSet = QrAnalizSPISS
    Left = 282
    Top = 234
  end
  object DsAnalizSPIS: TDataSource
    DataSet = QrAnalizSPIS
    Left = 358
    Top = 238
  end
  object QrAnalizSPIS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = AnalizTransaction
    AfterOpen = QrAnalizSPISAfterScroll
    AfterScroll = QrAnalizSPISAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from ANALIZ_SPIS_FAST(:SPIS_ID)'
      'order by spiss_id')
    Left = 358
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'SPIS_ID'
        ParamType = ptInput
      end>
    object QrAnalizSPISSPISS_ID: TIntegerField
      FieldName = 'SPISS_ID'
      Origin = 'ANALIZ_SPIS_FAST.SPISS_ID'
    end
    object QrAnalizSPISTW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'ANALIZ_SPIS_FAST.TW_ID'
    end
    object QrAnalizSPISTW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'ANALIZ_SPIS_FAST.TW_ART'
    end
    object QrAnalizSPISTW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'ANALIZ_SPIS_FAST.TW_NAM'
      Size = 128
    end
    object QrAnalizSPISED_SHORT: TIBStringField
      FieldName = 'ED_SHORT'
      Origin = 'ANALIZ_SPIS_FAST.ED_SHORT'
      Size = 6
    end
    object QrAnalizSPISTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      Origin = 'ANALIZ_SPIS_FAST.TW_KOL'
      DisplayFormat = '#0.0000'
    end
    object QrAnalizSPISSEB: TFloatField
      FieldName = 'SEB'
      Origin = 'ANALIZ_SPIS_FAST.SEB'
      DisplayFormat = '#0.00 руб'
    end
    object QrAnalizSPISSEB2: TFloatField
      FieldName = 'SEB$'
      Origin = 'ANALIZ_SPIS_FAST.SEB$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizSPISNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'ANALIZ_SPIS_FAST.NDS'
      DisplayFormat = '#0.00 руб'
    end
    object QrAnalizSPISNDS2: TFloatField
      FieldName = 'NDS$'
      Origin = 'ANALIZ_SPIS_FAST.NDS$'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizSPISSEB_SUMM: TFloatField
      FieldName = 'SEB_SUMM'
      Origin = 'ANALIZ_SPIS_FAST.SEB_SUMM'
      DisplayFormat = '#0.00 руб'
    end
    object QrAnalizSPISSEB_SUMM2: TFloatField
      FieldName = 'SEB$_SUMM'
      Origin = 'ANALIZ_SPIS_FAST.SEB$_SUMM'
      DisplayFormat = '#0.00 USD'
    end
    object QrAnalizSPISNDS_SUMM: TFloatField
      FieldName = 'NDS_SUMM'
      Origin = 'ANALIZ_SPIS_FAST.NDS_SUMM'
      DisplayFormat = '#0.00 руб'
    end
    object QrAnalizSPISNDS_SUMM2: TFloatField
      FieldName = 'NDS$_SUMM'
      Origin = 'ANALIZ_SPIS_FAST.NDS$_SUMM'
      DisplayFormat = '#0.00 USD'
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = AnalizTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 430
    Top = 186
  end
end
