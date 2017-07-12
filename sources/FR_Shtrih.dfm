object FRShtrih: TFRShtrih
  Left = 336
  Top = 290
  Width = 439
  Height = 438
  Caption = 'Сервисная панель Штрих-ФР-К'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 12
    Top = 12
    Width = 101
    Height = 13
    Caption = 'Кассовый аппарат :'
  end
  object Label5: TLabel
    Left = 68
    Top = 40
    Width = 43
    Height = 13
    Caption = 'Фирма :'
  end
  object FR: TDrvFR
    Left = 24
    Top = 400
    Width = 32
    Height = 32
    TabOrder = 0
    Visible = False
    ControlData = {
      54504630075441784374726C00044C656674021803546F700390010557696474
      6802280648656967687402280000}
  end
  object KKM_NAME: TRxDBLookupCombo
    Left = 116
    Top = 12
    Width = 213
    Height = 21
    DropDownCount = 8
    LookupField = 'FRM_ID'
    LookupDisplay = 'SHTRIH_NAME'
    LookupSource = DataSource1
    TabOrder = 1
    OnChange = KKM_NAMEChange
  end
  object RxDBRichEdit1: TRxDBRichEdit
    Left = 116
    Top = 40
    Width = 209
    Height = 21
    DataField = 'FRM_NAME'
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 432
    Top = 48
    Width = 417
    Height = 237
    Caption = 'Пробить сумму'
    Enabled = False
    TabOrder = 3
    Visible = False
    object Label1: TLabel
      Left = 208
      Top = 120
      Width = 49
      Height = 16
      Caption = 'Сумма :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 187
      Top = 148
      Width = 73
      Height = 16
      Caption = 'Наличные :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 92
      Top = 193
      Width = 47
      Height = 16
      Caption = 'Сдача :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 12
      Top = 16
      Width = 100
      Height = 13
      Caption = 'Строка для печати :'
    end
    object Label7: TLabel
      Left = 40
      Top = 96
      Width = 39
      Height = 16
      Caption = 'Цена :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 224
      Top = 96
      Width = 40
      Height = 13
      Caption = 'Кол-во :'
    end
    object OpSumm: TRxCalcEdit
      Left = 264
      Top = 120
      Width = 117
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.## руб.'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
    object NalSumm: TRxCalcEdit
      Left = 268
      Top = 148
      Width = 117
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.## руб.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnChange = NalSummChange
      OnEnter = NalSummEnter
    end
    object DeliverySumm: TRxCalcEdit
      Left = 140
      Top = 192
      Width = 117
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.## руб.'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object Button1: TButton
      Left = 6
      Top = 172
      Width = 75
      Height = 25
      Caption = 'Продажа'
      TabOrder = 3
    end
    object Button2: TButton
      Left = 6
      Top = 204
      Width = 75
      Height = 25
      Caption = 'Возврат'
      TabOrder = 4
    end
    object Edit1: TEdit
      Left = 120
      Top = 16
      Width = 281
      Height = 21
      TabOrder = 5
      Text = 'Edit1'
    end
    object RxCalcEdit1: TRxCalcEdit
      Left = 92
      Top = 92
      Width = 117
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.## руб.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 6
    end
    object RxCalcEdit2: TRxCalcEdit
      Left = 264
      Top = 96
      Width = 117
      Height = 21
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 7
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 68
    Width = 409
    Height = 321
    Caption = 'Сервис'
    TabOrder = 4
    object Report1: TButton
      Left = 24
      Top = 16
      Width = 349
      Height = 25
      Caption = 'Снять сменный отчет без гашения'
      TabOrder = 0
      OnClick = Report1Click
    end
    object Report0: TButton
      Left = 24
      Top = 88
      Width = 349
      Height = 25
      Caption = 'Снять сменный отчет с гашением'
      TabOrder = 1
      OnClick = Report0Click
    end
    object Button3: TButton
      Left = 24
      Top = 52
      Width = 349
      Height = 25
      Caption = 'Снять отчет по налогам (без гашения)'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 24
      Top = 160
      Width = 153
      Height = 25
      Caption = 'Внести сумму'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 220
      Top = 160
      Width = 153
      Height = 25
      Caption = 'Снять сумму'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 220
      Top = 196
      Width = 153
      Height = 25
      Caption = 'Показать статус'
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 24
      Top = 196
      Width = 153
      Height = 25
      Caption = 'Продолжить печать'
      TabOrder = 6
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 24
      Top = 124
      Width = 153
      Height = 25
      Caption = 'Отменить чек'
      TabOrder = 7
      OnClick = Button8Click
    end
    object CutCheck: TButton
      Left = 220
      Top = 124
      Width = 153
      Height = 25
      Caption = 'Отрезать чек'
      TabOrder = 8
      OnClick = CutCheckClick
    end
    object btnOpenDrawer: TButton
      Left = 24
      Top = 272
      Width = 349
      Height = 41
      Caption = 'Открыть денежный ящик'
      Default = True
      TabOrder = 9
      OnClick = btnOpenDrawerClick
    end
    object Button9: TButton
      Left = 24
      Top = 232
      Width = 153
      Height = 25
      Caption = 'Прервать тест печати'
      TabOrder = 10
      OnClick = Button9Click
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select list_kkm.*, MODEL_NAME||'#39' №'#39'||MODEL_NUM SHTRIH_NAME,  (se' +
        'lect kln_short from kln_data(list_kkm.frm_id)) FRM_NAME from lis' +
        't_kkm'
      'WHERE SHOP_ID=:SHOP_ID and COMP_NAME=:COMP_NAME')
    Left = 172
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SHOP_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COMP_NAME'
        ParamType = ptUnknown
      end>
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 248
    Top = 352
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 212
    Top = 432
  end
end
