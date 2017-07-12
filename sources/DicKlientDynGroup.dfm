object DIC_Klient_DYN_GROUP: TDIC_Klient_DYN_GROUP
  Left = 160
  Top = 244
  Width = 1021
  Height = 709
  Caption = 'Справочник "Динамические группы клиентов"'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 313
    Top = 0
    Width = 3
    Height = 682
    Cursor = crHSplit
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 313
    Height = 682
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
      Top = 24
      Width = 305
      Height = 635
      Align = alClient
      DataSource = DsKlnDynList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
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
          FieldName = 'KLNDYNGROUP_NAM'
          Title.Caption = 'Название группы клиентов'
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
      Top = 659
      Width = 305
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
    Left = 316
    Top = 0
    Width = 697
    Height = 682
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 1
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 695
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
      object ToolButton7: TToolButton
        Left = 83
        Top = 2
        Width = 30
        Caption = 'ToolButton7'
        ImageIndex = 19
        Style = tbsSeparator
      end
      object btnSelect: TToolButton
        Left = 113
        Top = 2
        Hint = 'Выбрать группу'
        Caption = 'Выбрать группу'
        ImageIndex = 16
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnSelectClick
      end
      object ToolButton2: TToolButton
        Left = 138
        Top = 2
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 146
        Top = 2
        Caption = 'ToolButton1'
        ImageIndex = 4
        OnClick = ToolButton1Click
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 30
      Width = 695
      Height = 171
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 215
        Height = 13
        Caption = 'Название динамической группы клиентов'
      end
      object Label3: TLabel
        Left = 8
        Top = 48
        Width = 111
        Height = 13
        Caption = 'Тип группы клиентов '
      end
      object DYNTREE_TYP: TComboBox
        Left = 8
        Top = 64
        Width = 145
        Height = 21
        Hint = 
          'По условиям - будут отобраны те клиенты, '#13#10'       которые удовле' +
          'творяют указанным условиям'#13#10'По группам - будут отобраны те клиен' +
          'ты, которые содержатся'#13#10'       в указанных статических группах. ' +
          'Если какая то группа будет включена 2 раза,'#13#10'       повторов кли' +
          'ентов все равно не будет'#13#10'По клиентам - будут отобраны только ук' +
          'азанные клиенты. Даже если указан один'#13#10'      и тот-же клиент, в' +
          ' результат он попадет только 1 раз'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = DYNTREE_TYPChange
        Items.Strings = (
          'По условиям'
          'По группам'
          'По клиентам')
      end
      object chkTemporary: TCheckBox
        Left = 8
        Top = 90
        Width = 81
        Height = 17
        Hint = 'Будет удален автоматически через 7 дней'
        Caption = 'Временная'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 2
        OnClick = DYNKlnLIST_NAMEChange
      end
      object DYNKlnLIST_NAME: TEdit
        Left = 9
        Top = 18
        Width = 385
        Height = 21
        MaxLength = 254
        TabOrder = 0
        Text = 'DYNKlnLIST_NAME'
        OnChange = DYNKlnLIST_NAMEChange
      end
      object chkPrivate: TCheckBox
        Left = 8
        Top = 114
        Width = 73
        Height = 17
        Hint = 'Видна только владельцу списка'
        Caption = 'Личная'
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 3
        OnClick = DYNKlnLIST_NAMEChange
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 201
      Width = 695
      Height = 480
      ActivePage = TabSheetUSL
      Align = alClient
      MultiLine = True
      TabOrder = 2
      OnChange = PageControl1Change
      object TabSheetUSL: TTabSheet
        Caption = 'Условия'
        ImageIndex = 4
        object chkKLN_NAM: TCheckBox
          Tag = 1
          Left = 8
          Top = 16
          Width = 209
          Height = 17
          Caption = 'Наименование клиента содержит :'
          TabOrder = 0
          OnClick = chkKLN_NAMClick
        end
        object chkKLN_GR: TCheckBox
          Tag = 2
          Left = 8
          Top = 40
          Width = 209
          Height = 17
          Caption = 'Наименование группы содержит :'
          TabOrder = 1
          OnClick = chkKLN_NAMClick
        end
        object chkKAT: TCheckBox
          Tag = 3
          Left = 8
          Top = 64
          Width = 129
          Height = 17
          Caption = 'Категория клиента:'
          TabOrder = 2
          OnClick = chkKATClick
        end
        object KLN_NAM: TEdit
          Left = 264
          Top = 16
          Width = 177
          Height = 21
          TabOrder = 3
          OnChange = KLN_NAMChange
        end
        object KLN_GR: TEdit
          Left = 264
          Top = 40
          Width = 177
          Height = 21
          TabOrder = 4
          OnChange = KLN_GRChange
        end
        object chkGor: TCheckBox
          Tag = 4
          Left = 8
          Top = 88
          Width = 129
          Height = 17
          Caption = 'Город:'
          TabOrder = 5
          OnClick = chkKLN_NAMClick
        end
        object chkSumKred: TCheckBox
          Tag = 6
          Left = 8
          Top = 136
          Width = 161
          Height = 17
          HelpContext = 1
          Caption = 'Сумма кредита БОЛЬШЕ:'
          TabOrder = 6
          OnClick = chkSumKredClick
        end
        object chkKrZapr: TCheckBox
          Tag = 5
          Left = 8
          Top = 112
          Width = 129
          Height = 17
          HelpContext = 1
          Caption = 'Кредит запрещен'
          TabOrder = 7
          OnClick = chkKrZaprClick
        end
        object chkLo: TCheckBox
          Tag = 7
          Left = 8
          Top = 184
          Width = 129
          Height = 17
          Caption = 'Лояльность:'
          TabOrder = 8
          OnClick = chkLoClick
        end
        object chkVidD: TCheckBox
          Tag = 8
          Left = 8
          Top = 208
          Width = 129
          Height = 17
          Caption = 'Вид деятельности:'
          TabOrder = 9
          OnClick = chkVidDClick
        end
        object chkPok: TCheckBox
          Tag = 9
          Left = 8
          Top = 232
          Width = 129
          Height = 17
          Caption = 'Покупатель:'
          TabOrder = 10
          OnClick = chkPokClick
        end
        object chkPos: TCheckBox
          Tag = 10
          Left = 8
          Top = 256
          Width = 129
          Height = 17
          Caption = 'Поставщик:'
          TabOrder = 11
          OnClick = chkPosClick
        end
        object chkPersSk: TCheckBox
          Tag = 11
          Left = 8
          Top = 280
          Width = 145
          Height = 17
          Caption = 'Персональная скидка:'
          TabOrder = 12
          OnClick = chkKLN_NAMClick
        end
        object chkOPPok: TCheckBox
          Tag = 12
          Left = 8
          Top = 304
          Width = 241
          Height = 17
          Caption = 'Отсрочка платежа для покупателя:'
          TabOrder = 13
          OnClick = chkKLN_NAMClick
        end
        object chkSumDogPosM: TCheckBox
          Tag = 14
          Left = 8
          Top = 352
          Width = 257
          Height = 17
          Caption = 'Сумма договора от поставщика БОЛЬШЕ, р.:'
          TabOrder = 14
          OnClick = chkKLN_NAMClick
        end
        object chkOPPos: TCheckBox
          Tag = 13
          Left = 8
          Top = 328
          Width = 201
          Height = 17
          Caption = 'Отсрочка платежа от поставщика:'
          TabOrder = 15
          OnClick = chkKLN_NAMClick
        end
        object Gor: TEdit
          Left = 264
          Top = 88
          Width = 177
          Height = 21
          TabOrder = 16
          OnChange = GorChange
        end
        object SumKred: TRxCalcEdit
          Left = 264
          Top = 136
          Width = 177
          Height = 21
          Alignment = taLeftJustify
          AutoSize = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 17
          OnChange = SumKredChange
        end
        object PersSk: TRxCalcEdit
          Left = 264
          Top = 280
          Width = 177
          Height = 21
          Alignment = taLeftJustify
          AutoSize = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 18
          OnChange = PersSkChange
        end
        object OPPos: TRxCalcEdit
          Left = 264
          Top = 328
          Width = 177
          Height = 21
          Alignment = taLeftJustify
          AutoSize = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 19
          OnChange = OPPosChange
        end
        object OPPok: TRxCalcEdit
          Left = 264
          Top = 304
          Width = 177
          Height = 21
          Alignment = taLeftJustify
          AutoSize = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 20
          OnChange = OPPokChange
        end
        object SumDogPosM: TRxCalcEdit
          Left = 264
          Top = 352
          Width = 177
          Height = 21
          Alignment = taLeftJustify
          AutoSize = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 21
          OnChange = SumDogPosMChange
        end
        object Lo: TComboBox
          Left = 264
          Top = 184
          Width = 177
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 22
          OnChange = LoChange
          Items.Strings = (
            'Разовый клиент                                        1'
            'Постоянный клиент                                  2'
            'Конкурент                                                  3'
            'Постоянный клиент по СЭЗ                      4')
        end
        object KAT: TComboBox
          Left = 264
          Top = 64
          Width = 177
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 23
          OnChange = KATChange
          Items.Strings = (
            'Розничный (РЦ)                                        0'
            'Оптовый (ОЦ)                                           1'
            'Крупнооптовый (КОЦ)                             2'
            'Спец. Клиент (СОЦ)                                 3'
            'По Перепродаже (ПП)                                          4')
        end
        object Pok: TComboBox
          Left = 264
          Top = 232
          Width = 177
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 24
          OnChange = PokChange
          Items.Strings = (
            'Не покупатель                                             1'
            'Покупатель по дог.                                     2'
            'Покупатель без  дог.                                  3')
        end
        object Pos: TComboBox
          Left = 264
          Top = 256
          Width = 177
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 25
          OnChange = PosChange
          Items.Strings = (
            'Не поставщик                                               1'
            'Поставщик по дог.                                       2'
            'Поставщик без  дог.                                    3')
        end
        object VidD: TRxDBLookupCombo
          Left = 264
          Top = 208
          Width = 177
          Height = 21
          DropDownCount = 8
          Enabled = False
          LookupField = 'KLN_WORKTYPE_ID'
          LookupDisplay = 'KLN_WORKTYPE_NAME'
          LookupSource = ds_kln_worktyp
          TabOrder = 26
          OnChange = VidDChange
        end
        object chkSumDogPosB: TCheckBox
          Tag = 15
          Left = 8
          Top = 376
          Width = 257
          Height = 17
          Caption = 'Сумма договора от поставщика МЕНЬШЕ, р.:'
          TabOrder = 27
          OnClick = chkKLN_NAMClick
        end
        object SumDogPosB: TRxCalcEdit
          Left = 264
          Top = 376
          Width = 177
          Height = 21
          Alignment = taLeftJustify
          AutoSize = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 28
          OnChange = SumDogPosBChange
        end
        object KrZapr: TEdit
          Left = 264
          Top = 112
          Width = 25
          Height = 21
          TabOrder = 29
          Visible = False
          OnChange = KLN_GRChange
        end
        object chkSumKredM: TCheckBox
          Tag = 61
          Left = 8
          Top = 160
          Width = 161
          Height = 17
          HelpContext = 1
          Caption = 'Сумма кредита МЕНЬШЕ:'
          TabOrder = 30
          OnClick = chkSumKredMClick
        end
        object SumKredM: TRxCalcEdit
          Left = 264
          Top = 160
          Width = 177
          Height = 21
          Alignment = taLeftJustify
          AutoSize = False
          ButtonWidth = 0
          NumGlyphs = 2
          TabOrder = 31
          OnChange = SumKredChange
        end
        object chkForOp: TCheckBox
          Tag = 16
          Left = 8
          Top = 400
          Width = 129
          Height = 17
          Caption = 'Форма оплаты:'
          TabOrder = 32
          OnClick = chkForOpClick
        end
        object ForOp: TComboBox
          Left = 264
          Top = 400
          Width = 177
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 33
          OnChange = PosChange
          Items.Strings = (
            'По факту                                                       1'
            'Реализация                                                  2'
            'Предоплата                                                  3'
            'Предоплата   50%                                        4'
            'Кредит безлимитный                                   5'
            '')
        end
      end
      object TabSheetTREE: TTabSheet
        Caption = 'Группы'
        ImageIndex = 1
        object Label2: TLabel
          Left = 24
          Top = 56
          Width = 48
          Height = 13
          Caption = 'relation_id'
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 687
          Height = 29
          ButtonHeight = 24
          ButtonWidth = 25
          Caption = 'ToolBar1'
          Images = DataModule1.ImageList1
          TabOrder = 0
          object GetGroup: TToolButton
            Left = 0
            Top = 2
            ImageIndex = 14
            OnClick = GetGroupClick
          end
          object btnDelKlnTREE: TToolButton
            Left = 25
            Top = 2
            ImageIndex = 2
            OnClick = btnDelKlnTREEClick
          end
        end
        object RxDBGrid1: TRxDBGrid
          Left = 0
          Top = 29
          Width = 687
          Height = 404
          Align = alClient
          DataSource = dsKlnTree
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleButtons = True
          OnGetBtnParams = RxDBGrid1GetBtnParams
          OnTitleBtnClick = RxDBGrid1TitleBtnClick
        end
        object StatusBar1: TStatusBar
          Left = 0
          Top = 433
          Width = 687
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
        Caption = 'Клиенты'
        ImageIndex = 2
        object ToolBar3: TToolBar
          Left = 0
          Top = 0
          Width = 687
          Height = 29
          ButtonHeight = 24
          ButtonWidth = 25
          Caption = 'ToolBar1'
          Images = DataModule1.ImageList1
          TabOrder = 0
          object GetKln: TToolButton
            Left = 0
            Top = 2
            ImageIndex = 14
            OnClick = GetKlnClick
          end
          object btnDELKln: TToolButton
            Left = 25
            Top = 2
            ImageIndex = 2
            OnClick = btnDELKlnClick
          end
        end
        object RxDBGrid4: TRxDBGrid
          Left = 0
          Top = 29
          Width = 687
          Height = 404
          Align = alClient
          DataSource = dsKln
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleButtons = True
          OnGetBtnParams = RxDBGrid4GetBtnParams
          OnTitleBtnClick = RxDBGrid4TitleBtnClick
        end
        object StatusBar2: TStatusBar
          Left = 0
          Top = 433
          Width = 687
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
        Caption = 'Итоговая группа клиентов'
        ImageIndex = 3
        object RxDBGrid3: TRxDBGrid
          Left = 0
          Top = 29
          Width = 687
          Height = 404
          Align = alClient
          DataSource = dsResultKlnSet
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleButtons = True
          OnGetBtnParams = RxDBGrid3GetBtnParams
          OnTitleBtnClick = RxDBGrid3TitleBtnClick
          Columns = <
            item
              Expanded = False
              FieldName = 'KLN_NAME'
              Title.Caption = 'Клиент'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KLNTREE_NAM'
              Title.Caption = 'Группа'
              Width = 600
              Visible = True
            end>
        end
        object ToolBar4: TToolBar
          Left = 0
          Top = 0
          Width = 687
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
          Top = 433
          Width = 687
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
  object memKlnTree: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'relation_id'
        DataType = ftInteger
      end
      item
        Name = 'klntree_id'
        DataType = ftInteger
      end
      item
        Name = 'klntree_nam'
        DataType = ftString
        Size = 1000
      end>
    Left = 36
    Top = 358
    object memKlnTreerelation_id: TIntegerField
      FieldName = 'relation_id'
      Visible = False
    end
    object memKlnTreeklntree_id: TIntegerField
      DisplayLabel = 'Код'
      FieldName = 'klntree_id'
      Visible = False
    end
    object memKlnTreeklntree_nam: TStringField
      DisplayLabel = 'Группа клиентов'
      DisplayWidth = 100
      FieldName = 'klntree_nam'
      Size = 1000
    end
  end
  object dsKlnTree: TDataSource
    DataSet = memKlnTree
    Left = 36
    Top = 406
  end
  object DsKlnDynList: TDataSource
    DataSet = KlnDynKlnList
    Left = 48
    Top = 126
  end
  object KLNDynKlnList1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = KlnDynListTr
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select  klientdyngroup_id as klndyngroup_id, klientdyngroup_nam ' +
        'as klndyngroup_nam, (select kln_full from kln_data(KlientDynGrou' +
        'p.user_id)) as us_name, user_id from klientdyngroup'
      'where'
      
        '((0=:SHOW_ALL) and (Klientdyngroup.user_id = :user_id)      /*св' +
        'ои*/'
      ' or'
      
        '((1=:SHOW_ALL) and (Klientdyngroup.private_mode=0) and (Klientdy' +
        'ngroup.user_id <> :user_id)   )) /*чужие*/'
      ' or'
      
        '((2=:SHOW_ALL) and ((Klientdyngroup.private_mode=0) or ((Klientd' +
        'yngroup.user_id = :user_id))) ) /*свои и чужие*/'
      ' or'
      '(3=:SHOW_ALL)'
      'order by klientdyngroup_nam')
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
    object KLNDynKlnList1US_NAME: TIBStringField
      FieldName = 'US_NAME'
      Size = 5000
    end
    object KLNDynKlnList1USER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'TWDYNGROUP.USER_ID'
      Required = True
    end
    object KLNDynKlnList1KLNDYNGROUP_ID: TIntegerField
      FieldName = 'KLNDYNGROUP_ID'
      Origin = 'KLIENTDYNGROUP.KLIENTGROUP_ID'
      Required = True
    end
    object KLNDynKlnList1KLNDYNGROUP_NAM: TIBStringField
      FieldName = 'KLNDYNGROUP_NAM'
      Origin = 'KLIENTDYNGROUP.KLIENTGROUP_NAM'
      Size = 254
    end
  end
  object KlnDynListTr: TIBTransaction
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
  object ResultKlnSet1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select kln_id, LIST_KLNDYNGROUP.kln_name, '
      
        '  (select klntree_nam from klntree_full(kln.klntree_id, '#39#39')) as ' +
        'klntree_nam'
      'from LIST_KLNDYNGROUP(:typ, :id), kln'
      'where kln.kln_id = LIST_KLNDYNGROUP.kln_id'
      'order by 2')
    Left = 168
    Top = 365
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
    object ResultKlnSet1KLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'KLN.KLN_ID'
      Required = True
      Visible = False
    end
    object ResultKlnSet1KLN_NAME: TIBStringField
      DisplayWidth = 30
      FieldName = 'KLN_NAME'
      Origin = 'KLN.KLN_NAME'
      Size = 254
    end
    object ResultKlnSet1KLNTREE_NAM: TIBStringField
      DisplayWidth = 150
      FieldName = 'KLNTREE_NAM'
      Size = 1000
    end
  end
  object trResultKlnSet: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 240
    Top = 365
  end
  object dsResultKlnSet: TDataSource
    DataSet = ResultKlnSet
    Left = 240
    Top = 461
  end
  object ResultKlnSet: TRxMemoryData
    FieldDefs = <
      item
        Name = 'KLN_NAME'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'KLNTREE_NAM'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'KLN_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    Left = 240
    Top = 413
    object ResultKlnSetKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'KLN.KLN_ID'
      Required = True
      Visible = False
    end
    object ResultKlnSetKLN_NAME: TIBStringField
      DisplayWidth = 30
      FieldName = 'KLN_NAME'
      Size = 254
    end
    object ResultKlnSetKLNTREE_NAM: TIBStringField
      DisplayWidth = 100
      FieldName = 'KLNTREE_NAM'
      Size = 1000
    end
  end
  object dsKln: TDataSource
    DataSet = memKln
    Left = 102
    Top = 409
  end
  object memKln: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'relation_id'
        DataType = ftInteger
      end
      item
        Name = 'klntree_id'
        DataType = ftInteger
      end
      item
        Name = 'kln_nam'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'klntree_nam'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'kln_id'
        DataType = ftInteger
      end>
    Left = 102
    Top = 361
    object memKlnrelation_id: TIntegerField
      FieldName = 'relation_id'
      Visible = False
    end
    object memKlnklntree_id: TIntegerField
      DisplayLabel = 'Код'
      FieldName = 'klntree_id'
      Visible = False
    end
    object memKlnkln_nam: TStringField
      DisplayLabel = 'Клиент'
      DisplayWidth = 30
      FieldName = 'kln_nam'
      Size = 254
    end
    object memKlnklntree_nam: TStringField
      DisplayLabel = 'Группа товаров'
      DisplayWidth = 100
      FieldName = 'klntree_nam'
      Size = 1000
    end
    object memKlnkln_id: TIntegerField
      FieldName = 'kln_id'
      Visible = False
    end
  end
  object KlnDynKlnList: TRxMemoryData
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
    BeforeScroll = KlnDynKlnListBeforeScroll
    AfterScroll = KlnDynKlnListAfterScroll
    Left = 152
    Top = 128
    object KlnDynKlnListKLNDYNGROUP_ID: TIntegerField
      FieldName = 'KlnDYNGROUP_ID'
      Origin = 'TWDYNGROUP.TWDYNGROUP_ID'
      Required = True
    end
    object KlnDynKlnListTWDYNGROUP_NAM: TIBStringField
      FieldName = 'KLNDYNGROUP_NAM'
      Origin = 'TWDYNGROUP.TWDYNGROUP_NAM'
      Size = 254
    end
    object KlnDynKlnListUS_NAME: TIBStringField
      FieldName = 'US_NAME'
      Size = 5000
    end
    object KlnDynKlnListUSER_ID: TIntegerField
      FieldName = 'USER_ID'
      Origin = 'TWDYNGROUP.USER_ID'
      Required = True
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 765
    Top = 38
  end
  object kln_worktyp: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from kln_worktype'
      'order by kln_worktype_name')
    Left = 857
    Top = 241
    object kln_worktypKLN_WORKTYPE_ID: TIntegerField
      FieldName = 'KLN_WORKTYPE_ID'
      Origin = 'KLN_WORKTYPE.KLN_WORKTYPE_ID'
      Required = True
    end
    object kln_worktypKLN_WORKTYPE_NAME: TIBStringField
      FieldName = 'KLN_WORKTYPE_NAME'
      Origin = 'KLN_WORKTYPE.KLN_WORKTYPE_NAME'
      Required = True
      Size = 32
    end
    object kln_worktypTM: TDateTimeField
      FieldName = 'TM'
      Origin = 'KLN_WORKTYPE.TM'
      Required = True
    end
  end
  object ds_kln_worktyp: TDataSource
    DataSet = kln_worktyp
    Left = 857
    Top = 297
  end
end
