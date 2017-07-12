object Doc_Remon: TDoc_Remon
  Left = 258
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Акт переоценки'
  ClientHeight = 678
  ClientWidth = 1203
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDefault
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1203
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 26
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton6: TToolButton
      Left = 0
      Top = 2
      Caption = 'ToolButton6'
      ImageIndex = 105
      OnClick = ToolButton6Click
    end
    object ToolButton5: TToolButton
      Left = 26
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 104
      Style = tbsSeparator
    end
    object Btn_Prow: TToolButton
      Left = 34
      Top = 2
      Hint = 'Провести акт переоценки'
      Caption = 'Btn_Prow'
      ImageIndex = 22
      OnClick = Btn_ProwClick
    end
    object Btn_Unprow: TToolButton
      Left = 60
      Top = 2
      Hint = 'Снять с проводки накладную'
      Caption = 'Btn_Unprow'
      ImageIndex = 23
      Visible = False
    end
    object ToolButton8: TToolButton
      Left = 86
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object Btn_SAVE: TToolButton
      Left = 94
      Top = 2
      Hint = 'Сохранить акт переоценки (Ctrl+Enter)'
      Caption = 'Btn_SAVE'
      ImageIndex = 39
      OnClick = Btn_SAVEClick
    end
    object Btn_Apply: TToolButton
      Left = 120
      Top = 2
      Hint = 'Применить '
      Caption = 'Btn_Apply'
      ImageIndex = 38
      OnClick = Btn_ApplyClick
    end
    object ToolButton4: TToolButton
      Left = 146
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Btn_Print: TToolButton
      Left = 154
      Top = 2
      Hint = 'Печать Акта переоценки (F9)'
      Caption = 'Btn_Print'
      ImageIndex = 9
      OnClick = Btn_PrintClick
    end
    object ToolButton11: TToolButton
      Left = 180
      Top = 2
      Width = 99
      Caption = 'ToolButton11'
      ImageIndex = 24
      Style = tbsSeparator
    end
    object Btn_DicTow: TToolButton
      Left = 279
      Top = 2
      Hint = 'Товары по каталогу'
      Caption = 'Btn_DicTow'
      ImageIndex = 37
      OnClick = Btn_DicTowClick
    end
    object Btn_DelTow: TToolButton
      Left = 305
      Top = 2
      Hint = 'Удалить товар из акта (Del в режиме "ввод товаров")'
      Caption = 'Btn_DelTow'
      ImageIndex = 2
      OnClick = Btn_DelTowClick
    end
    object ToolButton14: TToolButton
      Left = 331
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Btn_Detal: TToolButton
      Left = 339
      Top = 2
      Hint = 'Подробная информация о товаре... (F2)'
      Caption = 'Btn_Detal'
      ImageIndex = 11
      OnClick = Btn_DetalClick
    end
    object Btn_Analiz: TToolButton
      Left = 365
      Top = 2
      Hint = 'Анализ товара... (F3)'
      Caption = 'Btn_Analiz'
      ImageIndex = 12
      OnClick = Btn_AnalizClick
    end
    object Btn_Marketing: TToolButton
      Left = 391
      Top = 2
      Hint = 'Маркетинговые исследования... (F4)'
      Caption = 'Btn_Marketing'
      ImageIndex = 10
      OnClick = Btn_MarketingClick
    end
    object ToolButton1: TToolButton
      Left = 417
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object Btn_PrintCenn: TToolButton
      Left = 425
      Top = 2
      Hint = 'Напечатать ценник на выбранный товар (F9)'
      Caption = 'Btn_PrintCenn'
      ImageIndex = 40
      OnClick = Btn_PrintCennClick
    end
    object Btn_PrintCennMore: TToolButton
      Left = 451
      Top = 2
      Hint = 'Напечатать цениики на все товары из акта переоценки (F9)'
      Caption = 'Btn_PrintCennMore'
      ImageIndex = 41
      OnClick = Btn_PrintCennMoreClick
    end
    object ToolButton2: TToolButton
      Left = 477
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object Btn_RefreshOst: TToolButton
      Left = 485
      Top = 2
      Hint = 'Обновить информацию об остатках (Ctrl+~)'
      ImageIndex = 44
      OnClick = Btn_RefreshOstClick
    end
    object ToolButton7: TToolButton
      Left = 511
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 46
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 519
      Top = 2
      Hint = 'Ценник старая-новая'
      Caption = 'ToolButton3'
      ImageIndex = 42
      OnClick = ToolButton3Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 659
    Width = 1203
    Height = 19
    Panels = <
      item
        Text = 'Состояние :'
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 1203
    Height = 630
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1203
      Height = 97
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 56
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Фирма :'
      end
      object Label8: TLabel
        Left = 36
        Top = 52
        Width = 62
        Height = 13
        Caption = 'Основание :'
      end
      object Label10: TLabel
        Left = 544
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Номер :'
      end
      object Label11: TLabel
        Left = 376
        Top = 8
        Width = 32
        Height = 13
        Caption = 'Дата :'
      end
      object Label1: TLabel
        Left = 40
        Top = 32
        Width = 59
        Height = 13
        Caption = 'Менеджер :'
      end
      object FRM_NAME: TEdit
        Left = 104
        Top = 4
        Width = 229
        Height = 24
        Enabled = False
        TabOrder = 0
        Text = 'FRM_NAME'
      end
      object REMON_OSN: TMemo
        Left = 104
        Top = 52
        Width = 301
        Height = 41
        Lines.Strings = (
          'Memo1')
        MaxLength = 250
        TabOrder = 3
      end
      object REMON_NUM: TEdit
        Left = 592
        Top = 4
        Width = 157
        Height = 24
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = 'REMON_NUM'
      end
      object REMON_DATE: TDateEdit
        Left = 416
        Top = 4
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
      end
      object BTN_FRM: TBitBtn
        Left = 332
        Top = 4
        Width = 25
        Height = 21
        Hint = 'Поменять фирму (Ctrl+F10)'
        TabOrder = 4
        OnClick = Btn_FRMClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
          0555088888888888805508000000000088055080FFFFFF0508800000000000F0
          F0800FFFFFFFFF0F008050F00F00FFF0F08050FFFFFFFFF0F080000FFFFFFFFF
          00000900F00000F00090090FFFFFFFFF0090000FFFFFFFFF0F00550F000F00FF
          0F05550FFFFFFFFF0005550FFF00000005555550005555555555}
      end
      object REMON_OWNER: TRxDBLookupCombo
        Left = 104
        Top = 28
        Width = 253
        Height = 23
        DropDownCount = 8
        LookupField = 'OWNER_ID'
        LookupDisplay = 'OWNER_NAME'
        LookupSource = DsOwnerList
        TabOrder = 5
      end
      object GroupBox1: TGroupBox
        Left = 416
        Top = 28
        Width = 341
        Height = 65
        Caption = ' Цены '
        TabOrder = 6
        object REMON_SHOP: TRxDBLookupCombo
          Left = 112
          Top = 36
          Width = 221
          Height = 23
          DropDownCount = 8
          EscapeClear = False
          LookupField = 'SHOP_ID'
          LookupDisplay = 'SHOP_NAME'
          LookupSource = DataModule1.MainDsShop
          TabOrder = 0
        end
        object SHOP2: TRadioButton
          Left = 12
          Top = 40
          Width = 99
          Height = 17
          Caption = 'Смена цены в :'
          TabOrder = 1
          OnClick = SHOP2Click
        end
        object SHOP1: TRadioButton
          Left = 12
          Top = 16
          Width = 133
          Height = 17
          Caption = 'Смена базовой цены'
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = SHOP2Click
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 97
      Width = 1203
      Height = 533
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 0
        Width = 1203
        Height = 417
        Align = alClient
        DataSource = DsRemons
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = RxDBGrid2GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'TW_ART'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Код'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_NAM'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Наименование товара'
            Width = 206
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ED_SHORT'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Ед. изм.'
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLD_MONEY'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Старая РЦ'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_MONEY'
            Title.Alignment = taCenter
            Title.Caption = 'Новая РЦ'
            Width = 88
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OST'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Общий остаток'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'old_money1'
            ReadOnly = True
            Title.Caption = 'Старая ОЦ'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'new_money1'
            Title.Caption = 'Новая ОЦ'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'old_money2'
            ReadOnly = True
            Title.Caption = 'Старая КОЦ'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'new_money2'
            Title.Caption = 'новая КОЦ'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'old_money3'
            ReadOnly = True
            Title.Caption = 'Старая СЦ'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'new_money3'
            Title.Caption = 'Новая СЦ'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'old_money6'
            Title.Caption = 'Старая СПЕЦ2'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'new_money6'
            Title.Caption = 'новая СПЕЦ2'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'old_money7'
            Title.Caption = 'Старая Цена7'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'new_money7'
            Title.Caption = 'новая Цена7'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'old_money8'
            Title.Caption = 'Старая Цена0'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'new_money8'
            Title.Caption = 'новая Цена0'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'old_money4'
            Title.Caption = 'Старая ЦПП'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'new_money4'
            Title.Caption = 'Новая ЦПП'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'new_money5'
            ReadOnly = True
            Title.Caption = 'Закупка'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'REMONS_PRIM'
            Title.Alignment = taCenter
            Title.Caption = 'Примечания'
            Visible = True
          end>
      end
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 417
        Width = 1203
        Height = 116
        TabStop = False
        Align = alBottom
        DataSource = DsFastInfo
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = RxDBGrid1GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'VID'
            Title.Alignment = taCenter
            Title.Caption = 'Вид'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F1'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F2'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F3'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F4'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F5'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F6'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F7'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F8'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F9'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F10'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F11'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F12'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F13'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F14'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F15'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F16'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F17'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F18'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F19'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'F20'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Visible = True
          end>
      end
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 72
    Top = 241
  end
  object MemREMONS: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'TW_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_NAM'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'ED_SHORT'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'REMONS_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_ART'
        DataType = ftInteger
      end
      item
        Name = 'OST'
        DataType = ftFloat
      end
      item
        Name = 'TW_COLOR'
        DataType = ftInteger
      end
      item
        Name = 'OLD_MONEY'
        DataType = ftFloat
      end
      item
        Name = 'NEW_MONEY'
        DataType = ftFloat
      end
      item
        Name = 'REMONS_PRIM'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'MET_MONEY_SHOP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'new_money1'
        DataType = ftFloat
      end
      item
        Name = 'old_money1'
        DataType = ftFloat
      end
      item
        Name = 'new_money2'
        DataType = ftFloat
      end
      item
        Name = 'old_money2'
        DataType = ftFloat
      end
      item
        Name = 'new_money3'
        DataType = ftFloat
      end
      item
        Name = 'old_money3'
        DataType = ftFloat
      end
      item
        Name = 'new_money5'
        DataType = ftFloat
      end
      item
        Name = 'old_money4'
        DataType = ftFloat
      end
      item
        Name = 'new_money4'
        DataType = ftFloat
      end
      item
        Name = 'old_money6'
        DataType = ftFloat
      end
      item
        Name = 'new_money6'
        DataType = ftFloat
      end
      item
        Name = 'old_money7'
        DataType = ftFloat
      end
      item
        Name = 'new_money7'
        DataType = ftFloat
      end
      item
        Name = 'old_money8'
        DataType = ftFloat
      end
      item
        Name = 'new_money8'
        DataType = ftFloat
      end>
    AfterPost = MemREMONSAfterPost
    AfterDelete = MemREMONSAfterDelete
    AfterScroll = MemREMONSAfterPost
    Left = 376
    Top = 250
    object MemREMONSTW_ID: TIntegerField
      FieldName = 'TW_ID'
      OnChange = MemREMONSTW_IDChange
    end
    object MemREMONSTW_NAM: TStringField
      FieldName = 'TW_NAM'
      OnChange = MemREMONSTW_IDChange
      Size = 254
    end
    object MemREMONSED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      OnChange = MemREMONSTW_IDChange
      Size = 32
    end
    object MemREMONSREMONS_ID: TIntegerField
      FieldName = 'REMONS_ID'
      OnChange = MemREMONSTW_IDChange
    end
    object MemREMONSTW_ART: TIntegerField
      FieldName = 'TW_ART'
      OnChange = MemREMONSTW_IDChange
    end
    object MemREMONSOST: TFloatField
      FieldName = 'OST'
      DisplayFormat = '#0.0000'
    end
    object MemREMONSTW_COLOR: TIntegerField
      FieldName = 'TW_COLOR'
    end
    object MemREMONSOLD_MONEY: TFloatField
      FieldName = 'OLD_MONEY'
      DisplayFormat = '#0.00 руб'
    end
    object MemREMONSNEW_MONEY: TFloatField
      FieldName = 'NEW_MONEY'
      DisplayFormat = '#0.00 руб'
    end
    object MemREMONSREMONS_PRIM: TStringField
      FieldName = 'REMONS_PRIM'
      Size = 254
    end
    object MemREMONSMET_MONEY_SHOP: TStringField
      FieldName = 'MET_MONEY_SHOP'
      Size = 1
    end
    object MemREMONSneW_money1: TFloatField
      FieldName = 'new_money1'
      DisplayFormat = '#0.00'
    end
    object MemREMONSold_money1: TFloatField
      FieldName = 'old_money1'
      DisplayFormat = '#0.00'
    end
    object MemREMONSnew_money2: TFloatField
      FieldName = 'new_money2'
      DisplayFormat = '#0.00'
    end
    object MemREMONSold_money2: TFloatField
      FieldName = 'old_money2'
      DisplayFormat = '#0.00'
    end
    object MemREMONSnew_money3: TFloatField
      FieldName = 'new_money3'
      DisplayFormat = '#0.00'
    end
    object MemREMONSold_money3: TFloatField
      FieldName = 'old_money3'
      DisplayFormat = '#0.00'
    end
    object MemREMONSnew_money5: TFloatField
      FieldName = 'new_money5'
      DisplayFormat = '#0.00'
    end
    object MemREMONSold_money4: TFloatField
      FieldName = 'old_money4'
      DisplayFormat = '#0.00'
    end
    object MemREMONSnew_money4: TFloatField
      FieldName = 'new_money4'
      DisplayFormat = '#0.00'
    end
    object MemREMONSold_money6: TFloatField
      FieldName = 'old_money6'
      DisplayFormat = '#0.00'
    end
    object MemREMONSnew_money6: TFloatField
      FieldName = 'new_money6'
      DisplayFormat = '#0.00'
    end
    object MemREMONSold_money7: TFloatField
      FieldName = 'old_money7'
      DisplayFormat = '#0.00'
    end
    object MemREMONSnew_money7: TFloatField
      FieldName = 'new_money7'
      DisplayFormat = '#0.00'
    end
    object MemREMONSold_money8: TFloatField
      FieldName = 'old_money8'
      DisplayFormat = '#0.00'
    end
    object MemREMONSnew_money8: TFloatField
      FieldName = 'new_money8'
      DisplayFormat = '#0.00'
    end
  end
  object DsRemons: TDataSource
    DataSet = MemREMONS
    OnDataChange = DsRemonsDataChange
    Left = 376
    Top = 305
  end
  object RemonDocTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 464
    Top = 245
  end
  object Query1Transaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 68
    Top = 301
  end
  object IBQuery2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 12
    Top = 241
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 272
    Top = 229
    object MnProw: TMenuItem
      Caption = 'Провести акт переоценки'
      ImageIndex = 22
      ShortCut = 116
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object MnSave: TMenuItem
      Caption = 'Сохранить акт переоценки и выйти... (Ctrl+Enter)'
      ImageIndex = 39
      OnClick = Btn_SAVEClick
    end
    object MnApply: TMenuItem
      Caption = 'Сохранить акт переоценки без выхода (Применить)'
      ImageIndex = 38
      OnClick = Btn_ApplyClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать Акт переоценки  (F9)'
      ImageIndex = 9
      OnClick = Btn_PrintClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object MnFRM: TMenuItem
      Caption = 'Поменять фирму'
      ImageIndex = 43
      ShortCut = 16505
      OnClick = Btn_FRMClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MnTW: TMenuItem
      Caption = 'Товары по каталогу '
      ImageIndex = 37
      ShortCut = 122
      OnClick = Btn_DicTowClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить товар из счёта'
      ImageIndex = 2
      OnClick = Btn_DelTowClick
    end
    object N13: TMenuItem
      Caption = '-'
      ShortCut = 189
    end
    object MnDetal: TMenuItem
      Caption = 'Подробная информация о товаре'
      ImageIndex = 11
      ShortCut = 113
      OnClick = Btn_DetalClick
    end
    object MnAnaliz: TMenuItem
      Caption = 'Анализ товара'
      ImageIndex = 12
      ShortCut = 114
      OnClick = Btn_AnalizClick
    end
    object MnMarketing: TMenuItem
      Caption = 'Маркетинговые исследования товара'
      ImageIndex = 10
      ShortCut = 115
      OnClick = Btn_MarketingClick
    end
    object N18: TMenuItem
      Caption = '-'
    end
    object MnCenn: TMenuItem
      Caption = 'Напечатать ценник   (F9)'
      ImageIndex = 40
      OnClick = Btn_PrintCennClick
    end
    object MnCennMore: TMenuItem
      Caption = 'Напечатать ценники на все товары из акта переоценки  (F9)'
      ImageIndex = 41
      OnClick = Btn_PrintCennMoreClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnRefreshOst: TMenuItem
      Caption = 'Обновить информацию об остатках товаров  (Ctrl+~)'
      ImageIndex = 44
      OnClick = Btn_RefreshOstClick
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 596
    Top = 209
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 596
    Top = 261
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 468
    Top = 310
  end
  object FastInfoTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 668
    Top = 149
  end
  object QrFastInfo: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FastInfoTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from fast_info(:tw_id,1)')
    Left = 668
    Top = 205
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tw_id'
        ParamType = ptInput
      end>
    object QrFastInfoVID: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'VID'
      ReadOnly = True
      Size = 64
    end
    object QrFastInfoF1: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F1'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F2'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF3: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F3'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF4: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F4'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF5: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F5'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF6: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F6'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF7: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F7'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF8: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F8'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF9: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F9'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF10: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F10'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF11: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F11'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF12: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F12'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF13: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F13'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF14: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F14'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF15: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F15'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF16: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F16'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF17: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F17'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF18: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F18'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF19: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F19'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoF20: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'F20'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object QrFastInfoVID_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'VID_ID'
      ReadOnly = True
    end
  end
  object DsFastInfo: TDataSource
    DataSet = QrFastInfo
    Left = 668
    Top = 261
  end
  object IBQuery3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FastInfoTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 668
    Top = 314
  end
  object RemonTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 428
    Top = 166
  end
  object IbOwnerList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = RemonTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from lisT_owner order by owner_name')
    Left = 328
    Top = 156
    object IbOwnerListOWNER_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'OWNER_ID'
      ReadOnly = True
    end
    object IbOwnerListOWNER_NAME: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'OWNER_NAME'
      ReadOnly = True
      Size = 254
    end
  end
  object DsOwnerList: TDataSource
    DataSet = IbOwnerList
    Left = 328
    Top = 212
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 120
    OnTimer = Timer2Timer
    Left = 252
    Top = 306
  end
end
