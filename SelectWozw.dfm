object Select_WOZW: TSelect_WOZW
  Left = 244
  Top = 312
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Выбор товара для возврата'
  ClientHeight = 376
  ClientWidth = 681
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 81
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 26
      Width = 63
      Height = 13
      Caption = 'Код товара :'
    end
    object Label2: TLabel
      Left = 2
      Top = 50
      Width = 106
      Height = 13
      Caption = 'Искать в периоде с :'
    end
    object Label3: TLabel
      Left = 238
      Top = 50
      Width = 18
      Height = 13
      Caption = 'по :'
    end
    object SpeedButton1: TSpeedButton
      Left = 384
      Top = 46
      Width = 23
      Height = 22
      Hint = 'Неделя назад...'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDDDDDDDDDD000000000000DDDDDDDDDDDDD00000000000DDDD
        DDDDDDDDDD000000000000000000000DDDD0000000000F8F8F8F8F0DDDDD0000
        000008CCCCCCC80DDDDDD00000000F8F8F8F8F0DDDDDD000000008F811F8F80D
        DDDDD00000000F8F118F8F0DDDDDD000000008F8F118F80DDDDDD00000000F8F
        8F118F0DDDDDD000000008F11111F80DDDDDD00000000F8F8F8F8F0DDDDDD000
        000000000000000DDDDDD00000000CCCCCCCCC0DDDDDD000000000000000000D
        DDDDD0000000}
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 414
      Top = 46
      Width = 23
      Height = 22
      Hint = 'Один месяц назад...'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDDDDDDDDDD000000000000DDDDDDDDDDDD000000000000DDDD
        DDDDDDDDDDDDD000000000000000000DDDDDD00000000F8F8F8F8F0DDDDDD000
        000008CCCCCCC80DDDDDD00000000F8F8F8F8F0DDDDDD000000008F811F8F80D
        DDDDD00000000F8F118F8F0DDDDDD000000008F8F118F80DDDDDD00000000F8F
        8F118F0DDDDDD000000008F11111F80DDDDDD00000000F8F8F8F8F0DDDDDD000
        000000000000000DDDDDD00000000CCCCCCCCC0DDDDDD000000000000000000D
        DDDDD0000000}
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 438
      Top = 46
      Width = 23
      Height = 22
      Hint = 'Два месяца назад...'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDDDDDDDDDD000000000000DDDDDDDDDDDD000000000000DDDD
        DDDDDDDDDDDDD000000000000000000D0000000000000F8F8F8F8F0D00000000
        000008CCCCCCC80DDDDDD00000000F8F8F8F8F0DDDDDD000000008F811F8F80D
        DDDDD00000000F8F118F8F0DDDDDD000000008F8F118F80DDDDDD00000000F8F
        8F118F0DDDDDD000000008F11111F80DDDDDD00000000F8F8F8F8F0DDDDDD000
        000000000000000DDDDDD00000000CCCCCCCCC0DDDDDD000000000000000000D
        DDDDD0000000}
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 462
      Top = 46
      Width = 23
      Height = 22
      Hint = 'Полгода назад...'
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDDDDDDDDDD000000000000DDDDDDDDDDDD000000000000DDDD
        DDDDDDDDDDDDD000000000000000000D0000000000000F8F8F8F8F0D00000000
        000008CCCCCCC80DDDDDD00000000F8F8F8F8F0DDDDDD000000008F811F8F80D
        D000D00000000F8F118F8F0DDDDDD000000008F8F118F80DD000D00000000F8F
        8F118F0DDDDDD000000008F11111F80DDDDDD00000000F8F8F8F8F0D00000000
        000000000000000D0000000000000CCCCCCCCC0DDDDDD000000000000000000D
        DDDDD0000000}
      OnClick = SpeedButton4Click
    end
    object Image1: TImage
      Left = 98
      Top = 26
      Width = 13
      Height = 13
      AutoSize = True
      Picture.Data = {
        07544269746D6170DE000000424DDE0000000000000076000000280000000D00
        00000D0000000100040000000000680000000000000000000000100000001000
        0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00777777777777700077777707777770007777770077777000777777060777
        7000770000066077700077066666660770007706666666607000770666666607
        7000770000066077700077777706077770007777770077777000777777077777
        70007777777777777000}
      Transparent = True
      Visible = False
    end
    object Label4: TLabel
      Left = 4
      Top = 4
      Width = 32
      Height = 13
      Caption = 'Label4'
    end
    object BtnOk: TButton
      Left = 602
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Ок'
      Enabled = False
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object Button2: TButton
      Left = 602
      Top = 30
      Width = 75
      Height = 25
      Caption = 'Отмена'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Edit1: TEdit
      Left = 112
      Top = 22
      Width = 75
      Height = 21
      ReadOnly = True
      TabOrder = 2
      OnEnter = Edit1Enter
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 188
      Top = 22
      Width = 405
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
    object DT1: TDateEdit
      Left = 112
      Top = 46
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
      OnChange = DT1Change
    end
    object DT2: TDateEdit
      Left = 260
      Top = 46
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 5
      OnChange = DT2Change
    end
    object Edit3: TEdit
      Left = 504
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 6
      Visible = False
    end
    object CheckBox1: TCheckBox
      Left = 471
      Top = 3
      Width = 122
      Height = 17
      Caption = 'Искать по клиенту'
      Checked = True
      State = cbChecked
      TabOrder = 7
      Visible = False
      OnClick = CheckBox1Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 357
    Width = 681
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 81
    Width = 681
    Height = 276
    Align = alClient
    DataSource = DsRep
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
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
        FieldName = 'RN_DATE'
        Title.Alignment = taCenter
        Title.Caption = 'Дата'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RN_FULLNUM'
        Title.Alignment = taCenter
        Title.Caption = 'Накладная'
        Width = 169
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNS_MONEY'
        Title.Alignment = taCenter
        Title.Caption = 'Цена'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNS_KOL'
        Title.Alignment = taCenter
        Title.Caption = 'Кол-во'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNS_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNS_OST'
        Title.Alignment = taCenter
        Title.Caption = 'Можно вернуть'
        Width = 86
        Visible = True
      end>
  end
  object Query1Transaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 380
    Top = 96
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 380
    Top = 148
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 108
    Top = 80
  end
  object RepTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 224
    Top = 110
  end
  object QueryRep: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = RepTransaction
    AfterOpen = QueryRepAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select list_for_wozw.* from list_for_wozw(:TW_ID,:DT1,:DT2,:PNRN' +
        'TYP_ID,:TYP,:FRM_ID,:SKL_ID, :us_id, :shop_id, :kln_id)')
    Left = 222
    Top = 162
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TW_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PNRNTYP_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TYP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SKL_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'us_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'shop_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kln_id'
        ParamType = ptUnknown
      end>
    object QueryRepRN_ID: TIntegerField
      FieldName = 'RN_ID'
      Origin = 'LIST_FOR_WOZW.RN_ID'
    end
    object QueryRepRNS_ID: TIntegerField
      FieldName = 'RNS_ID'
      Origin = 'LIST_FOR_WOZW.RNS_ID'
    end
    object QueryRepRN_DATE: TDateTimeField
      FieldName = 'RN_DATE'
      Origin = 'LIST_FOR_WOZW.RN_DATE'
    end
    object QueryRepRN_FULLNUM: TIBStringField
      FieldName = 'RN_FULLNUM'
      Origin = 'LIST_FOR_WOZW.RN_FULLNUM'
      Size = 64
    end
    object QueryRepRNS_KOL: TFloatField
      FieldName = 'RNS_KOL'
      Origin = 'LIST_FOR_WOZW.RNS_KOL'
      DisplayFormat = '#0.0000'
    end
    object QueryRepRNS_SUMM: TFloatField
      FieldName = 'RNS_SUMM'
      Origin = 'LIST_FOR_WOZW.RNS_SUMM'
      DisplayFormat = '#0.00 руб'
    end
    object QueryRepRNS_MONEY: TFloatField
      FieldName = 'RNS_MONEY'
      Origin = 'LIST_FOR_WOZW.RNS_MONEY'
      DisplayFormat = '#0.00 руб'
    end
    object QueryRepRNS_OST: TFloatField
      FieldName = 'RNS_OST'
      Origin = 'LIST_FOR_WOZW.RNS_OST'
      DisplayFormat = '#0.0000'
    end
    object QueryRepPNS_NDS: TIntegerField
      FieldName = 'PNS$_NDS'
      Origin = 'LIST_FOR_WOZW.PNS$_NDS'
    end
    object QueryRepNDS: TFloatField
      FieldName = 'NDS'
      Origin = 'LIST_FOR_WOZW.NDS'
    end
    object QueryRepNP: TFloatField
      FieldName = 'NP'
      Origin = 'LIST_FOR_WOZW.NP'
    end
  end
  object DsRep: TDataSource
    DataSet = QueryRep
    Left = 222
    Top = 212
  end
end
