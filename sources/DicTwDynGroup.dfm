object DIC_TW_DYN_GROUP: TDIC_TW_DYN_GROUP
  Left = 355
  Top = 198
  Width = 1021
  Height = 709
  Caption = 'Справочник "Динамический набор товаров"'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 385
    Top = 0
    Width = 4
    Height = 677
    Cursor = crHSplit
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 385
    Height = 677
    Align = alLeft
    MultiLine = True
    TabOrder = 0
    Tabs.Strings = (
      'Личные'
      'Общие'
      'Все (Личные и общие)')
    TabIndex = 0
    OnChange = TabControl1Change
    object RxDBGrid2: TRxDBGrid
      Left = 4
      Top = 27
      Width = 377
      Height = 627
      Align = alClient
      DataSource = DsTwDynList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = RxDBGrid2DblClick
      TitleButtons = True
      OnGetBtnParams = RxDBGrid2GetBtnParams
      OnTitleBtnClick = RxDBGrid2TitleBtnClick
      Columns = <
        item
          Expanded = False
          FieldName = 'TWDYNGROUP_NAM'
          Title.Caption = 'Название набора товаров'
          Width = 168
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'US_NAME'
          Title.Caption = 'Владелец'
          Width = 107
          Visible = True
        end>
    end
    object StatusBar4: TStatusBar
      Left = 4
      Top = 654
      Width = 377
      Height = 19
      Panels = <
        item
          Text = 'Элементов: 0'
          Width = 50
        end>
      SimplePanel = False
    end
  end
  object Panel1: TPanel
    Left = 389
    Top = 0
    Width = 624
    Height = 677
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 622
      Height = 29
      ButtonHeight = 24
      ButtonWidth = 25
      Caption = 'ToolBar1'
      Images = DataModule1.ImageList1
      TabOrder = 0
      object BtnApply: TToolButton
        Left = 0
        Top = 2
        Hint = 'Применить'
        ImageIndex = 38
        ParentShowHint = False
        ShowHint = True
        OnClick = ApplyClick
      end
      object btnNew: TToolButton
        Left = 25
        Top = 2
        Hint = 'Новая группа'
        Caption = 'btnNew'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = btnNewClick
      end
      object ToolButton9: TToolButton
        Left = 50
        Top = 2
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 18
        Style = tbsSeparator
      end
      object btnDEL: TToolButton
        Left = 58
        Top = 2
        Caption = 'btnDEL'
        ImageIndex = 2
        OnClick = btnDELClick
      end
      object ToolButton3: TToolButton
        Left = 83
        Top = 2
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 17
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 91
        Top = 2
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 18
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 99
        Top = 2
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 19
        Style = tbsSeparator
      end
      object btnSelect: TToolButton
        Left = 107
        Top = 2
        Hint = 'Выбрать группу'
        Caption = 'Выбрать группу'
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnSelectClick
      end
      object ToolButton8: TToolButton
        Left = 132
        Top = 2
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 17
        Style = tbsSeparator
      end
      object btnPrintPrice: TToolButton
        Left = 140
        Top = 2
        Caption = 'btnPrintPrice'
        ImageIndex = 26
        OnClick = btnPrintPriceClick
      end
      object ToolButton2: TToolButton
        Left = 165
        Top = 2
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 28
        Style = tbsSeparator
      end
      object btnCopy: TToolButton
        Left = 173
        Top = 2
        Hint = 'Создать копию'
        Caption = 'Создать копию'
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCopyClick
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 30
      Width = 622
      Height = 210
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 10
        Top = 5
        Width = 178
        Height = 16
        Caption = 'Название набора товаров '
      end
      object Label3: TLabel
        Left = 10
        Top = 59
        Width = 137
        Height = 16
        Caption = 'Тип набора товаров '
      end
      object BtnDynDic: TSpeedButton
        Left = 545
        Top = 78
        Width = 29
        Height = 27
        Hint = 'Выбрать динамическую группу товаров'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555550000000055555550AAAAAAA00555550AAAAAAAA020555002222222202
          205500000000000022055080FFFFFF0F02205500FFFFFF0FF0205550FF800007
          7F005555000777777F005555500000000F05555550FFFFFF0F05555550F000FF
          0005555550FFFFFF0555555550FF800005555555550005555555}
        OnClick = BtnDynDicClick
      end
      object BtnTW: TSpeedButton
        Left = 576
        Top = 78
        Width = 28
        Height = 27
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDD00000000DDDDDD000000DDD0
          999999900DDDDD000000DD099999999010DDDD000000D00111111110110DDD00
          0000D000000000000110DD000000DD070FFFFFF0F0110D000000DDD00FFFFFF0
          FF010D000000DDDD0FF7000088F00D000000DDDDD000888888F00D000000DDDD
          DD00000000F0DD000000DDDDDD0FFFFFF0F0DD000000DDDDDD0F000FF000DD00
          0000DDDDDD0FFFFFF0DDDD000000DDDDDD0FF70000DDDD000000DDDDDDD000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        OnClick = BtnTWClick
      end
      object DYNTREE_TYP: TComboBox
        Left = 10
        Top = 79
        Width = 178
        Height = 24
        Hint = 
          'По условиям - будут отобраны те товары, '#13#10'       которые удовлет' +
          'воряют указанным условиям'#13#10'По группам - будут отобраны те товары' +
          ', которые содержатся'#13#10'       в указанных статических группах. Ес' +
          'ли какая то группа будет включена 2 раза,'#13#10'       повторов товар' +
          'а все равно не будет'#13#10'По товарам - будут отобраны только указанн' +
          'ые товары. Даже если указан один'#13#10'      и тот-же товар, в резуль' +
          'тат он попадет только 1 раз'
        Style = csDropDownList
        ItemHeight = 16
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = DYNTREE_TYPChange
        Items.Strings = (
          'По условиям'
          'По группам'
          'По товарам')
      end
      object chkTemporary: TCheckBox
        Left = 10
        Top = 130
        Width = 100
        Height = 21
        Hint = 'Будет удален автоматически через 7 дней'
        Caption = 'Временный'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 2
        OnClick = DYNTWLIST_NAMEChange
      end
      object DYNTWLIST_NAME: TEdit
        Left = 11
        Top = 22
        Width = 474
        Height = 21
        MaxLength = 254
        TabOrder = 0
        Text = 'DYNTWLIST_NAME'
        OnChange = DYNTWLIST_NAMEChange
      end
      object chkPrivate: TCheckBox
        Left = 10
        Top = 160
        Width = 90
        Height = 21
        Hint = 'Видна только владельцу списка'
        Caption = 'Личный'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 3
        OnClick = DYNTWLIST_NAMEChange
      end
      object chkSkipGroup: TCheckBox
        Left = 207
        Top = 79
        Width = 144
        Height = 21
        Caption = 'Исключая группу:'
        TabOrder = 4
        OnClick = chkSkipGroupClick
      end
      object TW: TEdit
        Left = 350
        Top = 79
        Width = 188
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object chkGood: TCheckBox
        Left = 158
        Top = 128
        Width = 119
        Height = 21
        Caption = 'Хорошие'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object chkBrak: TCheckBox
        Left = 158
        Top = 158
        Width = 119
        Height = 20
        Caption = 'Бракованные'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object chkRozn: TCheckBox
        Left = 305
        Top = 128
        Width = 120
        Height = 21
        Caption = 'Розничные'
        Checked = True
        State = cbChecked
        TabOrder = 8
      end
      object chkOpt: TCheckBox
        Left = 305
        Top = 158
        Width = 120
        Height = 20
        Caption = 'Оптовые'
        Checked = True
        State = cbChecked
        TabOrder = 9
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 240
      Width = 622
      Height = 436
      ActivePage = TabSheetRESULT
      Align = alClient
      MultiLine = True
      TabOrder = 2
      OnChange = PageControl1Change
      object TabSheetUSL: TTabSheet
        Caption = 'Условия'
        ImageIndex = 4
        object chkTW_NAM: TCheckBox
          Tag = 1
          Left = 10
          Top = 20
          Width = 257
          Height = 21
          Caption = 'Наименование товара содержит :'
          TabOrder = 0
          OnClick = chkTW_NAMClick
        end
        object chkTWTREE_NAM: TCheckBox
          Tag = 2
          Left = 10
          Top = 49
          Width = 257
          Height = 21
          Caption = 'Наименование группы содержит :'
          TabOrder = 1
          OnClick = chkTWTREE_NAMClick
        end
        object chkKTG: TCheckBox
          Tag = 3
          Left = 10
          Top = 79
          Width = 257
          Height = 21
          Caption = 'Категория товара :'
          TabOrder = 2
          OnClick = chkKTGClick
        end
        object chklowPrice: TCheckBox
          Tag = 4
          Left = 10
          Top = 108
          Width = 257
          Height = 21
          Caption = 'Цена товара больше :'
          TabOrder = 3
          OnClick = chklowPriceClick
        end
        object chkhiPrice: TCheckBox
          Tag = 5
          Left = 10
          Top = 138
          Width = 257
          Height = 21
          Caption = 'Цена товара меньше :'
          TabOrder = 4
          OnClick = chkhiPriceClick
        end
        object TW_NAM: TEdit
          Left = 256
          Top = 20
          Width = 218
          Height = 21
          TabOrder = 9
          Text = 'TW_NAM'
          OnChange = TW_NAMChange
        end
        object TWTREE_NAM: TEdit
          Left = 256
          Top = 49
          Width = 218
          Height = 21
          TabOrder = 10
          Text = 'TWTREE_NAM'
          OnChange = TWTREE_NAMChange
        end
        object lowPrice: TRxCalcEdit
          Left = 256
          Top = 108
          Width = 218
          Height = 26
          Alignment = taLeftJustify
          AutoSize = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 12
          OnChange = lowPriceChange
        end
        object hiPrice: TRxCalcEdit
          Left = 256
          Top = 138
          Width = 218
          Height = 26
          Alignment = taLeftJustify
          AutoSize = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 13
          OnChange = hiPriceChange
        end
        object chkTW_Saler: TCheckBox
          Tag = 6
          Left = 10
          Top = 167
          Width = 198
          Height = 21
          Caption = 'Фирма-продавец'
          TabOrder = 5
          OnClick = chkTW_SalerClick
        end
        object chkGabarit: TCheckBox
          Tag = 7
          Left = 10
          Top = 197
          Width = 178
          Height = 21
          Caption = 'Габарит товара'
          TabOrder = 6
          OnClick = chkGabaritClick
        end
        object Gabarit: TComboBox
          Left = 256
          Top = 197
          Width = 218
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 15
          OnChange = GabaritChange
          Items.Strings = (
            'Габаритный'
            'Негабаритный')
        end
        object chkTW_MADE: TCheckBox
          Tag = 8
          Left = 10
          Top = 226
          Width = 119
          Height = 21
          Caption = 'Производство '
          TabOrder = 7
          OnClick = chkTW_MADEClick
        end
        object TW_MADE: TEdit
          Left = 256
          Top = 226
          Width = 218
          Height = 21
          TabOrder = 16
          Text = 'TW_MADE'
          OnChange = TW_MADEChange
        end
        object chkTW_LAND: TCheckBox
          Tag = 9
          Left = 10
          Top = 256
          Width = 218
          Height = 21
          Caption = 'Страна производста'
          TabOrder = 8
          OnClick = chkTW_LANDClick
        end
        object TW_LAND: TEdit
          Left = 256
          Top = 256
          Width = 218
          Height = 21
          TabOrder = 17
          Text = 'TW_LAND'
          OnChange = TW_LANDChange
        end
        object KTG: TRxDBLookupCombo
          Left = 256
          Top = 79
          Width = 218
          Height = 28
          DropDownCount = 8
          LookupField = 'TWKTG_ID'
          LookupDisplay = 'TWKTG_NAM'
          LookupSource = DataModule1.MainDsTwKtg
          TabOrder = 11
          OnChange = KTGChange
        end
        object TW_SALER: TRxDBLookupCombo
          Left = 256
          Top = 167
          Width = 218
          Height = 29
          DropDownCount = 8
          LookupField = 'KLN_ID'
          LookupDisplay = 'KLN_FULL'
          LookupSource = DataModule1.MainDsDopFrm
          TabOrder = 14
          OnChange = TW_SALERChange
        end
      end
      object TabSheetTREE: TTabSheet
        Caption = 'Группы'
        ImageIndex = 1
        object Label2: TLabel
          Left = 30
          Top = 69
          Width = 62
          Height = 16
          Caption = 'relation_id'
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 614
          Height = 29
          ButtonHeight = 24
          ButtonWidth = 25
          Caption = 'ToolBar1'
          Images = DataModule1.ImageList1
          TabOrder = 0
          object GetTwGroup: TToolButton
            Left = 0
            Top = 2
            ImageIndex = 37
            OnClick = GetTwGroupClick
          end
          object btnDelTWTREE: TToolButton
            Left = 25
            Top = 2
            ImageIndex = 2
            OnClick = btnDelTWTREEClick
          end
        end
        object RxDBGrid1: TRxDBGrid
          Left = 0
          Top = 29
          Width = 614
          Height = 357
          Align = alClient
          DataSource = dsTwTree
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -14
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleButtons = True
          OnGetBtnParams = RxDBGrid1GetBtnParams
          OnTitleBtnClick = RxDBGrid1TitleBtnClick
          Columns = <
            item
              Expanded = False
              FieldName = 'twtree_nam'
              Width = 600
              Visible = True
            end>
        end
        object StatusBar1: TStatusBar
          Left = 0
          Top = 386
          Width = 614
          Height = 19
          Panels = <
            item
              Text = 'Элементов: 0'
              Width = 50
            end>
          SimplePanel = False
        end
      end
      object TabSheetTW: TTabSheet
        Caption = 'Товары'
        ImageIndex = 2
        object ToolBar3: TToolBar
          Left = 0
          Top = 0
          Width = 679
          Height = 29
          ButtonHeight = 24
          ButtonWidth = 25
          Caption = 'ToolBar1'
          Images = DataModule1.ImageList1
          TabOrder = 0
          object GetTw: TToolButton
            Left = 0
            Top = 2
            ImageIndex = 37
            OnClick = GetTwClick
          end
          object btnDELTW: TToolButton
            Left = 25
            Top = 2
            ImageIndex = 2
            OnClick = btnDELTWClick
          end
        end
        object RxDBGrid4: TRxDBGrid
          Left = 0
          Top = 36
          Width = 836
          Height = 483
          Align = alClient
          DataSource = dsTW
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -14
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleButtons = True
          OnGetBtnParams = RxDBGrid4GetBtnParams
          OnTitleBtnClick = RxDBGrid4TitleBtnClick
          Columns = <
            item
              Expanded = False
              FieldName = 'TW_ART'
              Title.Caption = 'Артикул'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'tw_nam'
              Title.Caption = 'Товар'
              Width = 314
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'twtree_nam'
              Width = 275
              Visible = True
            end>
        end
        object StatusBar2: TStatusBar
          Left = 0
          Top = 519
          Width = 679
          Height = 19
          Panels = <
            item
              Text = 'Элементов: 0'
              Width = 50
            end>
          SimplePanel = False
        end
      end
      object TabSheetRESULT: TTabSheet
        Caption = 'Итоговый набор товаров'
        ImageIndex = 3
        object RxDBGrid3: TRxDBGrid
          Left = 0
          Top = 29
          Width = 614
          Height = 357
          Align = alClient
          DataSource = dsResultTWSet
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -14
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleButtons = True
          OnGetBtnParams = RxDBGrid3GetBtnParams
          OnTitleBtnClick = RxDBGrid3TitleBtnClick
          Columns = <
            item
              Expanded = False
              FieldName = 'TW_ART'
              Title.Caption = 'Артикул'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_NAM'
              Title.Caption = 'Наименование'
              Width = 378
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TWTREE_NAM'
              Title.Caption = 'Группа'
              Width = 217
              Visible = True
            end>
        end
        object ToolBar4: TToolBar
          Left = 0
          Top = 0
          Width = 614
          Height = 29
          ButtonHeight = 24
          ButtonWidth = 25
          Caption = 'ToolBar1'
          Images = DataModule1.ImageList1
          TabOrder = 1
          object BtnRefresh: TToolButton
            Left = 0
            Top = 2
            Hint = 'Обновить!'
            ImageIndex = 25
            ParentShowHint = False
            ShowHint = True
            OnClick = BtnRefreshClick
          end
        end
        object StatusBar3: TStatusBar
          Left = 0
          Top = 386
          Width = 614
          Height = 19
          Panels = <
            item
              Text = 'Элементов: 0'
              Width = 50
            end>
          SimplePanel = False
        end
      end
    end
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 10
    CachedUpdates = False
    Left = 828
    Top = 36
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 826
    Top = 92
  end
  object memTwTree: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'relation_id'
        DataType = ftInteger
      end
      item
        Name = 'twtree_id'
        DataType = ftInteger
      end
      item
        Name = 'twtree_nam'
        DataType = ftString
        Size = 1000
      end>
    Left = 36
    Top = 358
    object memTwTreerelation_id: TIntegerField
      FieldName = 'relation_id'
    end
    object memTwTreetwtree_id: TIntegerField
      DisplayLabel = 'Код'
      FieldName = 'twtree_id'
    end
    object memTwTreetwtree_nam: TStringField
      DisplayLabel = 'Группа товаров'
      FieldName = 'twtree_nam'
      Size = 1000
    end
  end
  object dsTwTree: TDataSource
    DataSet = memTwTree
    Left = 36
    Top = 406
  end
  object DsTwDynList: TDataSource
    DataSet = TWDynTWList
    Left = 48
    Top = 126
  end
  object TWDynTwList1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = TwDynListTr
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select  TwDynGroup_id, TwDynGroup_nam , (select kln_full from kl' +
        'n_data(TwDynGroup.user_id)) us_name, user_id from TwDynGroup'
      'where'
      '((0=:SHOW_ALL) and (twdyngroup.user_id = :user_id)      /*свои*/'
      ' or'
      
        '((1=:SHOW_ALL) and (twdyngroup.private_mode=0) and (twdyngroup.u' +
        'ser_id <> :user_id)   )) /*чужие*/'
      ' or'
      
        '((2=:SHOW_ALL) and ((twdyngroup.private_mode=0) or ((twdyngroup.' +
        'user_id = :user_id))) ) /*свои и чужие*/'
      ' or'
      '(3=:SHOW_ALL)'
      'order by twdyngroup_nam')
    Left = 48
    Top = 70
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SHOW_ALL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOW_ALL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOW_ALL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'user_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SHOW_ALL'
        ParamType = ptUnknown
      end>
    object TWDynTwList1TWDYNGROUP_NAM: TIBStringField
      FieldName = 'TWDYNGROUP_NAM'
      Origin = 'TWDYNGROUP.TWDYNGROUP_NAM'
      Size = 254
    end
    object TWDynTwList1TWDYNGROUP_ID: TIntegerField
      FieldName = 'TWDYNGROUP_ID'
      Origin = 'TWDYNGROUP.TWDYNGROUP_ID'
      Required = True
    end
    object TWDynTwList1US_NAME: TIBStringField
      FieldName = 'US_NAME'
      Size = 5000
    end
    object TWDynTwList1USER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'TWDYNGROUP.USER_ID'
      Required = True
    end
  end
  object TwDynListTr: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 144
    Top = 69
  end
  object ResultTWSet1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select tw_id, tw_art, (case when tw.tw_is_opt = 1 then '#39'ОПТ '#39' el' +
        'se '#39#39' end)|| tw_nam as tw_nam, (select twtree_nam from twtreE_fu' +
        'll(LIST_TWDYNGROUP.twtree_id, '#39#39')) twtree_nam'
      'from LIST_TWDYNGROUP(:typ, :id), tw'
      'where tw.tw_id = LIST_TWDYNGROUP.tw_id'
      'order by twtree_nam')
    Left = 200
    Top = 317
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'typ'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object ResultTWSet1TW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'TW.TW_ID'
      Required = True
    end
    object ResultTWSet1TW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'TW.TW_ART'
      Required = True
    end
    object ResultTWSet1TW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'TW.TW_NAM'
      Required = True
      Size = 254
    end
    object ResultTWSet1TWTREE_NAM: TIBStringField
      FieldName = 'TWTREE_NAM'
      Size = 1000
    end
  end
  object trResultTwSet: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 272
    Top = 309
  end
  object dsResultTWSet: TDataSource
    DataSet = ResultTwSet
    Left = 168
    Top = 413
  end
  object ResultTwSet: TRxMemoryData
    FieldDefs = <>
    Left = 280
    Top = 389
    object ResultTwSetTW_ID: TIntegerField
      FieldName = 'TW_ID'
      Origin = 'TW.TW_ID'
      Required = True
    end
    object ResultTwSetTW_ART: TIntegerField
      FieldName = 'TW_ART'
      Origin = 'TW.TW_ART'
      Required = True
    end
    object ResultTwSetTW_NAM: TIBStringField
      FieldName = 'TW_NAM'
      Origin = 'TW.TW_NAM'
      Required = True
      Size = 254
    end
    object ResultTwSetTWTREE_NAM: TIBStringField
      FieldName = 'TWTREE_NAM'
      Size = 1000
    end
  end
  object dsTW: TDataSource
    DataSet = memTW
    Left = 102
    Top = 409
  end
  object memTW: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'relation_id'
        DataType = ftInteger
      end
      item
        Name = 'twtree_id'
        DataType = ftInteger
      end
      item
        Name = 'twtree_nam'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'tw_id'
        DataType = ftInteger
      end
      item
        Name = 'tw_nam'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'TW_ART'
        DataType = ftInteger
      end>
    Left = 102
    Top = 361
    object memTWrelation_id: TIntegerField
      FieldName = 'relation_id'
    end
    object memTWtwtree_id: TIntegerField
      DisplayLabel = 'Код'
      FieldName = 'twtree_id'
    end
    object memTWtwtree_nam: TStringField
      DisplayLabel = 'Группа товаров'
      FieldName = 'twtree_nam'
      Size = 1000
    end
    object memTWtw_id: TIntegerField
      FieldName = 'tw_id'
    end
    object memTWtw_nam: TStringField
      FieldName = 'tw_nam'
      Size = 254
    end
    object memTWTW_ART: TIntegerField
      FieldName = 'TW_ART'
    end
  end
  object TWDynTWList: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'TWDYNGROUP_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TWDYNGROUP_NAM'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'US_NAME'
        DataType = ftString
        Size = 5000
      end
      item
        Name = 'USER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    BeforeScroll = TWDynTWListBeforeScroll
    AfterScroll = TWDynTWListAfterScroll
    Left = 128
    Top = 136
    object TWDynTWListTWDYNGROUP_ID: TIntegerField
      FieldName = 'TWDYNGROUP_ID'
      Origin = 'TWDYNGROUP.TWDYNGROUP_ID'
      Required = True
    end
    object TWDynTWListTWDYNGROUP_NAM: TIBStringField
      FieldName = 'TWDYNGROUP_NAM'
      Origin = 'TWDYNGROUP.TWDYNGROUP_NAM'
      Size = 254
    end
    object TWDynTWListUS_NAME: TIBStringField
      FieldName = 'US_NAME'
      Size = 5000
    end
    object TWDynTWListUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'TWDYNGROUP.USER_ID'
      Required = True
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 705
    Top = 122
  end
end
