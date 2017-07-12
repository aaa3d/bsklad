object ALL_OTGRUZ: TALL_OTGRUZ
  Left = 511
  Top = 235
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Отгрузка товара'
  ClientHeight = 506
  ClientWidth = 892
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 487
    Width = 892
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 892
    Height = 458
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Расходные накладные'
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 884
        Height = 430
        Align = alClient
        DataSource = DsRN
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid1DblClick
        OnKeyPress = RxDBGrid1KeyPress
        OnGetCellParams = RxDBGrid1GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'RN_FULL_NUM'
            Title.Alignment = taCenter
            Title.Caption = 'Номер'
            Width = 167
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KLN_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Клиент'
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RN_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Дата'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RN_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTG_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Выдано на...'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RNVID_NAM'
            Title.Alignment = taCenter
            Title.Caption = 'Вид накладной'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'US_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Кто оформил'
            Width = 114
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Накладные перемещения'
      ImageIndex = 1
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 0
        Width = 884
        Height = 430
        Align = alClient
        DataSource = DsPer
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid2DblClick
        OnKeyPress = RxDBGrid2KeyPress
        OnGetCellParams = RxDBGrid2GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'PER_FULL_NUM'
            Title.Alignment = taCenter
            Title.Caption = 'Номер'
            Width = 144
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SKL_TO'
            Title.Alignment = taCenter
            Title.Caption = 'Склад-получатель'
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Дата'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PER_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTG_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Выдано на...'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'US_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Кто оформил'
            Width = 114
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Акты списания'
      ImageIndex = 2
      object RxDBGrid3: TRxDBGrid
        Left = 0
        Top = 0
        Width = 884
        Height = 430
        Align = alClient
        DataSource = DsSpis
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid3DblClick
        OnKeyPress = RxDBGrid3KeyPress
        OnGetCellParams = RxDBGrid3GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'SPIS_FULL_NUM'
            Title.Alignment = taCenter
            Title.Caption = 'Номер'
            Width = 144
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPIS_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Дата'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPIS_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OTG_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Выдано на...'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPISVID_NAM'
            Title.Alignment = taCenter
            Title.Caption = 'Вид списания'
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'US_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Кто оформил'
            Width = 114
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 892
    Height = 29
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 136
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Склад :'
    end
    object Label2: TLabel
      Left = 492
      Top = 9
      Width = 60
      Height = 13
      Caption = 'за период с'
      Visible = False
    end
    object BtnInterval: TSpeedButton
      Left = 28
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Интервал журнала (I)'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777770000000777777000007777770000000777700FBFBF00777700000007770
        BFBFBFBFB07770000000770BFBFBFBFBFB0770000000770FB0BFBFBFBF077000
        000070FBFB0BFBFBFBF07000000070BFBFB0BFBFBFB07000000070FBFBFB0000
        00F07000000070BFBFBFBFBFBFB07000000070FBFBFBFBFBFBF070000000770F
        BFBFBFBFBF0770000000770BFBFBFBFBFB07700000007770BFBF0FBFB0777000
        0000777700FBFBF0077770000000777777000007777770000000777777777777
        777770000000}
      OnClick = BtnIntervalClick
    end
    object SpeedButton1: TSpeedButton
      Left = 80
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Заблокировать систему'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777702222222227777770AAAAAAAAA2777770AAAAAAAA70277770AAAAAAAA00
        077770AAAAAAAAA07777700000000000077777777777770007777777777770BB
        F07777777770BBBB000770303333BBBB00B708888883BBBB07B70BBBBBBBBBBB
        07B700000000BBBB0B077777777700BBB0777777777777000777}
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 50
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Печать накладной'
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        0400000000007800000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00EE0000000000
        0EEEE0777777777070EE000000000000070E0777777FFF77000E077777788877
        070E00000000000007700777777777707070E000000000070700EE0FFFFFFFF0
        7070EEE0F00000F0000EEEE0FFFFFFFF0EEEEEEE0F00000F0EEEEEEE0FFFFFFF
        F0EEEEEEE000000000EEEEEEEEEEEEEEEEEE}
      OnClick = SpeedButton2Click
    end
    object BtnFind: TSpeedButton
      Left = 104
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Найти документ по номеру'
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDDDDDDDD000000D000
        00DDDDD00000DD000000D0F000DDDDD0F000DD000000D0F000DDDDD0F000DD00
        0000D0000000D0000000DD000000D00F000000F00000DD000000D00F000D00F0
        0000DD000000D00F000D00F00000DD000000DD0000000000000DDD000000DDD0
        F000D0F000DDDD000000DDD00000D00000DDDD000000DDDD000DDD000DDDDD00
        0000DDDD0F0DDD0F0DDDDD000000DDDD000DDD000DDDDD000000DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      OnClick = BtnFindClick
    end
    object BtnOpen: TBitBtn
      Left = 4
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Открыть накладную для отгрузки (Enter)'
      TabOrder = 2
      OnClick = BtnOpenClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADAD00000000000ADADA003333333330ADAD0B0333333333
        0ADA0FB03333333330AD0BFB03333333330A0FBFB000000000000BFBFBFBFB0A
        DADA0FBFBFBFBF0DADAD0BFB0000000ADADAA000ADADADAD000DDADADADADADA
        D00AADADADAD0DAD0D0DDADADADAD000DADAADADADADADADADAD}
    end
    object SKL: TRxDBLookupCombo
      Left = 176
      Top = 4
      Width = 201
      Height = 21
      DropDownCount = 8
      LookupField = 'SKL_ID'
      LookupDisplay = 'SKL_FULL'
      LookupSource = DsSKL
      TabOrder = 0
      OnChange = SKLChange
    end
    object ARC: TCheckBox
      Left = 384
      Top = 8
      Width = 105
      Height = 17
      Hint = 'Пробел'
      Caption = 'Показать архив'
      TabOrder = 1
      OnClick = ARCClick
    end
  end
  object SkladTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 168
    Top = 181
  end
  object RnTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 256
    Top = 181
  end
  object PerTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 340
    Top = 181
  end
  object SpisTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 436
    Top = 181
  end
  object QrSKL: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SkladTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from skl where skl_speed>0 order by skl_speed')
    Left = 168
    Top = 229
    object QrSKLSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Required = True
    end
    object QrSKLSKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Required = True
      Size = 32
    end
    object QrSKLSKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Required = True
      Size = 254
    end
    object QrSKLSKL_ADR: TIBStringField
      FieldName = 'SKL_ADR'
      Size = 254
    end
    object QrSKLSKL_TEL: TIBStringField
      FieldName = 'SKL_TEL'
      Size = 254
    end
    object QrSKLSKL_TIME: TIBStringField
      FieldName = 'SKL_TIME'
      Size = 254
    end
    object QrSKLSKL_SPEED: TIntegerField
      FieldName = 'SKL_SPEED'
      Required = True
    end
  end
  object QrRN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = RnTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from otgruz_rn(:dt1,:dt2,:f,:skl_id)'
      'order by rn_date desc')
    Left = 256
    Top = 229
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dt1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'f'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'skl_id'
        ParamType = ptInput
      end>
    object QrRNRN_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_ID'
      ReadOnly = True
    end
    object QrRNRN_FULL_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RN_FULL_NUM'
      ReadOnly = True
      Size = 84
    end
    object QrRNRN_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_COLOR'
      ReadOnly = True
    end
    object QrRNRN_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'RN_DATE'
      ReadOnly = True
    end
    object QrRNRN_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'RN_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrRNOTG_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OTG_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrRNOTG_MET: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'OTG_MET'
      ReadOnly = True
    end
    object QrRNRNVID_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RNVID_NAM'
      ReadOnly = True
      Size = 64
    end
    object QrRNKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrRNUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrRNRNTYP_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RNTYP_ID'
      ReadOnly = True
    end
  end
  object QrPer: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PerTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from otgruz_per(:dt1,:dt2,:f,:Skl_id)'
      'order by per_date')
    Left = 340
    Top = 229
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dt1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'f'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Skl_id'
        ParamType = ptInput
      end>
    object QrPerPER_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PER_ID'
      ReadOnly = True
    end
    object QrPerPER_FULL_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PER_FULL_NUM'
      ReadOnly = True
      Size = 84
    end
    object QrPerPER_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PER_COLOR'
      ReadOnly = True
    end
    object QrPerPER_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'PER_DATE'
      ReadOnly = True
    end
    object QrPerPER_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PER_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrPerOTG_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OTG_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrPerOTG_MET: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'OTG_MET'
      ReadOnly = True
    end
    object QrPerSKL_TO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_TO'
      ReadOnly = True
      Size = 254
    end
    object QrPerUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
  end
  object QrSPIS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SpisTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from otgruz_spis(:dt1,:dt2,:f,:skl_id)'
      'order by spis_date')
    Left = 436
    Top = 229
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'dt1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dt2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'f'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'skl_id'
        ParamType = ptInput
      end>
    object QrSPISSPIS_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS_ID'
      ReadOnly = True
    end
    object QrSPISSPIS_FULL_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS_FULL_NUM'
      ReadOnly = True
      Size = 84
    end
    object QrSPISSPIS_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS_COLOR'
      ReadOnly = True
    end
    object QrSPISSPIS_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS_DATE'
      ReadOnly = True
    end
    object QrSPISSPIS_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SPIS_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrSPISOTG_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OTG_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrSPISOTG_MET: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'OTG_MET'
      ReadOnly = True
    end
    object QrSPISSPISVID_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SPISVID_NAM'
      ReadOnly = True
      Size = 64
    end
    object QrSPISUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
  end
  object DsSKL: TDataSource
    DataSet = QrSKL
    Left = 168
    Top = 281
  end
  object DsRN: TDataSource
    DataSet = QrRN
    Left = 256
    Top = 281
  end
  object DsPer: TDataSource
    DataSet = QrPer
    Left = 340
    Top = 281
  end
  object DsSpis: TDataSource
    DataSet = QrSPIS
    Left = 436
    Top = 277
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 288
    Top = 125
    object N1: TMenuItem
      Caption = 'Интервал дат в журнале'
      ImageIndex = 36
      ShortCut = 73
      OnClick = BtnIntervalClick
    end
  end
  object Timer1: TTimer
    Interval = 120000
    OnTimer = Timer1Timer
    Left = 664
    Top = 109
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 284
    Top = 369
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 348
    Top = 357
  end
end
