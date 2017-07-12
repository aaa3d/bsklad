object ALL_POL: TALL_POL
  Left = 407
  Top = 263
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Получение товара'
  ClientHeight = 441
  ClientWidth = 784
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 422
    Width = 784
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 784
    Height = 393
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Приходные накладные'
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 776
        Height = 365
        Align = alClient
        DataSource = DsPN
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
            FieldName = 'PN_FULL_NUM'
            Title.Alignment = taCenter
            Title.Caption = 'Номер'
            Width = 144
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
            FieldName = 'PN_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Дата'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PN_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма'
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'POL_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Выдано на...'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PNVID_NAM'
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
        Width = 776
        Height = 365
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
            FieldName = 'SKL_FROM'
            Title.Alignment = taCenter
            Title.Caption = 'Склад-отправитель'
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
            FieldName = 'POL_SUMM'
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 29
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 140
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Склад :'
    end
    object Label2: TLabel
      Left = 484
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
      Left = 84
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
    object BtnPrint: TSpeedButton
      Left = 52
      Top = 4
      Width = 23
      Height = 22
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000DDD00000000000DDDD000000DD0D
        DDDDDDDD0D0DDD000000D0000000000000D0DD000000D0DDDDDDBBBDD000DD00
        0000D0DDDDDD777DD0D0DD000000D0000000000000DD0D000000D0DDDDDDDDDD
        0D0D0D000000DD0000000000D0D00D000000DDD0FFFFFFFF0D0D0D000000DDDD
        0F00000F0000DD000000DDDD0FFFFFFFF0DDDD000000DDDDD0F00000F0DDDD00
        0000DDDDD0FFFFFFFF0DDD000000DDDDDD000000000DDD000000DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      OnClick = BtnPrintClick
    end
    object BtnFind: TSpeedButton
      Left = 112
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Найти накладную по номеру'
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
    object SKL: TRxDBLookupCombo
      Left = 180
      Top = 4
      Width = 193
      Height = 21
      DropDownCount = 8
      LookupField = 'SKL_ID'
      LookupDisplay = 'SKL_FULL'
      LookupSource = DsSKL
      TabOrder = 0
      OnChange = SKLChange
    end
    object ARC: TCheckBox
      Left = 376
      Top = 8
      Width = 105
      Height = 17
      Hint = 'Пробел'
      Caption = 'Показать архив'
      TabOrder = 1
      OnClick = ARCClick
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
  end
  object SkladTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 168
    Top = 181
  end
  object PnTransaction: TIBTransaction
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
  object QrPN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PnTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from pol_pn(:dt1,:dt2,:f,:skl_id)'
      'order by pn_date')
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
    object QrPNPN_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PN_ID'
      ReadOnly = True
    end
    object QrPNPN_FULL_NUM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PN_FULL_NUM'
      ReadOnly = True
      Size = 84
    end
    object QrPNPN_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PN_COLOR'
      ReadOnly = True
    end
    object QrPNPN_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'PN_DATE'
      ReadOnly = True
    end
    object QrPNPN_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'PN_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrPNPOL_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'POL_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrPNPOL_MET: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'POL_MET'
      ReadOnly = True
    end
    object QrPNPNVID_NAM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'PNVID_NAM'
      ReadOnly = True
      Size = 64
    end
    object QrPNKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrPNUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrPNPNTYP_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'PNTYP_ID'
      ReadOnly = True
    end
  end
  object QrPer: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PerTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from pol_per(:dt1,:dt2,:f,:Skl_id)'
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
    object QrPerPOL_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'POL_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00 руб'
    end
    object QrPerPOL_MET: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'POL_MET'
      ReadOnly = True
    end
    object QrPerSKL_FROM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'SKL_FROM'
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
  object DsSKL: TDataSource
    DataSet = QrSKL
    Left = 168
    Top = 281
  end
  object DsPN: TDataSource
    DataSet = QrPN
    Left = 256
    Top = 281
  end
  object DsPer: TDataSource
    DataSet = QrPer
    Left = 340
    Top = 281
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
end
