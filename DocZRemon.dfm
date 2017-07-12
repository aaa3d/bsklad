object DOC_ZREMON: TDOC_ZREMON
  Left = 318
  Top = 55
  Width = 1602
  Height = 946
  Caption = 'Заявка на переоценку товара'
  Color = clBtnFace
  Constraints.MinHeight = 540
  Constraints.MinWidth = 760
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 900
    Width = 1594
    Height = 19
    Panels = <
      item
        Text = 'Состояние'
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1594
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton9: TToolButton
      Left = 0
      Top = 2
      Action = ActLock
    end
    object ToolButton10: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 33
      Top = 2
      Action = ActSave
    end
    object ToolButton2: TToolButton
      Left = 58
      Top = 2
      Action = ActApply
    end
    object ToolButton17: TToolButton
      Left = 83
      Top = 2
      Action = ActOk
    end
    object ToolButton14: TToolButton
      Left = 108
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 116
      Top = 2
      Action = ActPrint
    end
    object ToolButton13: TToolButton
      Left = 141
      Top = 2
      Action = ActHistory
    end
    object ToolButton3: TToolButton
      Left = 166
      Top = 2
      Width = 22
      Caption = 'ToolButton3'
      ImageIndex = 39
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 188
      Top = 2
      Action = DicTW
    end
    object ToolButton11: TToolButton
      Left = 213
      Top = 2
      Action = ActDel
    end
    object ToolButton5: TToolButton
      Left = 238
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 38
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 246
      Top = 2
      Action = ActDetal
    end
    object ToolButton7: TToolButton
      Left = 271
      Top = 2
      Action = ActAnaliz
    end
    object ToolButton8: TToolButton
      Left = 296
      Top = 2
      Action = ActMarketing
    end
    object ToolButton15: TToolButton
      Left = 321
      Top = 2
      Width = 8
      Caption = 'ToolButton15'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton16: TToolButton
      Left = 329
      Top = 2
      Action = ActRefresh
    end
    object ToolButton20: TToolButton
      Left = 354
      Top = 2
      Width = 103
      Caption = 'ToolButton20'
      ImageIndex = 209
      Style = tbsSeparator
    end
    object btnSelectTWSet: TToolButton
      Left = 457
      Top = 2
      Hint = 'Загрузить товары из группы'
      Caption = 'btnSelectTWSet'
      ImageIndex = 37
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSelectTWSetClick
    end
    object btnSelectTWDynSet: TToolButton
      Left = 482
      Top = 2
      Hint = 'Загрузить товары из группы'
      Caption = 'btnSelectTWDynSet'
      ImageIndex = 208
      OnClick = btnSelectTWDynSetClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 1594
    Height = 871
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1594
      Height = 147
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 32
        Width = 71
        Height = 13
        Caption = 'Составитель :'
      end
      object Label2: TLabel
        Left = 204
        Top = 8
        Width = 32
        Height = 13
        Caption = 'Дата :'
      end
      object Label4: TLabel
        Left = 10
        Top = 54
        Width = 62
        Height = 13
        Caption = 'Основание :'
      end
      object Label3: TLabel
        Left = 288
        Top = 54
        Width = 166
        Height = 13
        Caption = 'Комментарий при утверждении :'
      end
      object Label5: TLabel
        Left = 32
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Номер :'
      end
      object Label6: TLabel
        Left = 344
        Top = 8
        Width = 60
        Height = 13
        Caption = 'Состояние :'
      end
      object USER: TEdit
        Left = 76
        Top = 28
        Width = 197
        Height = 24
        Enabled = False
        TabOrder = 0
        Text = 'USER'
      end
      object ZREMON_NUM: TEdit
        Left = 76
        Top = 4
        Width = 121
        Height = 24
        Enabled = False
        TabOrder = 1
        Text = 'ZREMON_NUM'
      end
      object ZREMON_DATE: TDateEdit
        Left = 240
        Top = 4
        Width = 97
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
        OnChange = ZREMON_DATEChange
      end
      object ZREMON_OSN: TMemo
        Left = 76
        Top = 52
        Width = 197
        Height = 25
        MaxLength = 255
        TabOrder = 3
        OnChange = ZREMON_DATEChange
      end
      object ZREMON_OSN2: TMemo
        Left = 284
        Top = 80
        Width = 205
        Height = 63
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnChange = ZREMON_DATEChange
      end
      object ZREMON_STAT: TRxDBLookupCombo
        Left = 288
        Top = 28
        Width = 201
        Height = 23
        DropDownCount = 8
        LookupField = 'STAT_ID'
        LookupDisplay = 'STAT_NAME'
        LookupSource = DsStat
        TabOrder = 5
        OnChange = ZREMON_STATChange
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 78
        Width = 269
        Height = 65
        Caption = ' Цены '
        TabOrder = 6
        object ZREMON_SHOP: TRxDBLookupCombo
          Left = 112
          Top = 36
          Width = 153
          Height = 23
          DropDownCount = 8
          EscapeClear = False
          LookupField = 'SHOP_ID'
          LookupDisplay = 'SHOP_NAME'
          LookupSource = DataModule1.MainDsShop
          TabOrder = 0
          OnChange = ZREMON_SHOPChange
        end
        object SHOP2: TRadioButton
          Left = 12
          Top = 40
          Width = 99
          Height = 17
          Caption = 'Смена цены в :'
          TabOrder = 1
          OnClick = SHOP1Click
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
          OnClick = SHOP1Click
        end
      end
      object GroupBox2: TGroupBox
        Left = 496
        Top = 0
        Width = 401
        Height = 137
        Caption = 'Авто пересчет цен'
        TabOrder = 7
        object Label7: TLabel
          Left = 129
          Top = 20
          Width = 17
          Height = 16
          Caption = '= +'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 212
          Top = 20
          Width = 22
          Height = 13
          Caption = '% от'
        end
        object Label9: TLabel
          Left = 8
          Top = 56
          Width = 98
          Height = 13
          Caption = 'Способ округления'
        end
        object price_dest: TComboBox
          Left = 8
          Top = 16
          Width = 121
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Новая РЦ'
            'Новая ОЦ'
            'Новая КОЦ'
            'Новая СПЕЦ'
            'Новая Цена ПП'
            'Новая СПЕЦ2')
        end
        object price_PERCENT: TRxSpinEdit
          Left = 152
          Top = 16
          Width = 57
          Height = 21
          ArrowKeys = False
          Increment = 0.5
          ValueType = vtFloat
          AutoSelect = False
          AutoSize = False
          TabOrder = 1
        end
        object price_source: TComboBox
          Left = 248
          Top = 16
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          Items.Strings = (
            'Текущей РЦ'
            'Текущей ОЦ'
            'Текущей КОЦ'
            'Текущей СПЕЦ'
            'Текущец цены ПП'
            'Текущей цены закупки'
            'Текущей СПЕЦ2')
        end
        object Button1: TButton
          Left = 280
          Top = 72
          Width = 75
          Height = 21
          Caption = 'Выполнить!'
          TabOrder = 3
          OnClick = Button1Click
        end
        object price_round_type: TComboBox
          Left = 8
          Top = 72
          Width = 265
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          Items.Strings = (
            '+1 р.   (увеличить до ближайшего рубля)'
            '+10 р. (увеличить до ближайших 10 рублей)'
            '-1 р.    (уменьшить до ближайшего рубля)'
            '-10 р.  (уменьшить до ближайших 10 рублей)'
            '0         (округлить только копейки)'
            '+10 коп.'
            '-10 коп.')
        end
        object PriceDestUtw: TComboBox
          Left = 8
          Top = 16
          Width = 121
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 5
          Visible = False
          Items.Strings = (
            'Утв РЦ'
            'Утв ОЦ'
            'Утв КОЦ'
            'Утв СПЕЦ'
            'Утв Цена ПП'
            'Утв СПЕЦ2')
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 753
      Width = 1594
      Height = 118
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1594
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label25: TLabel
          Left = 119
          Top = 29
          Width = 16
          Height = 12
          Alignment = taRightJustify
          Caption = 'Опт'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 225
          Top = 29
          Width = 30
          Height = 12
          Alignment = taRightJustify
          Caption = 'Кр. опт'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 361
          Top = 29
          Width = 22
          Height = 12
          Alignment = taRightJustify
          Caption = 'Спец'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 7
          Top = 29
          Width = 20
          Height = 12
          Alignment = taRightJustify
          Caption = 'Розн'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 957
          Top = 23
          Width = 58
          Height = 12
          Alignment = taRightJustify
          Caption = 'Перепродажа'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 508
          Top = 29
          Width = 27
          Height = 12
          Alignment = taRightJustify
          Caption = 'Спец2'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 664
          Top = 30
          Width = 27
          Height = 12
          Alignment = taRightJustify
          Caption = 'Цена7'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 813
          Top = 30
          Width = 27
          Height = 12
          Alignment = taRightJustify
          Caption = 'Цена8'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Edit1: TEdit
          Left = 106
          Top = 0
          Width = 375
          Height = 24
          Enabled = False
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 0
          Top = 0
          Width = 105
          Height = 24
          Enabled = False
          TabOrder = 1
        end
        object Edit3: TEdit
          Left = 138
          Top = 21
          Width = 87
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object Edit4: TEdit
          Left = 262
          Top = 21
          Width = 91
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object Edit5: TEdit
          Left = 394
          Top = 21
          Width = 103
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object Edit6: TEdit
          Left = 30
          Top = 21
          Width = 87
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object Edit7: TEdit
          Left = 1017
          Top = 15
          Width = 103
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object Edit8: TEdit
          Left = 546
          Top = 21
          Width = 103
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object Edit9: TEdit
          Left = 702
          Top = 24
          Width = 103
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object Edit10: TEdit
          Left = 852
          Top = 24
          Width = 103
          Height = 21
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
      end
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 41
        Width = 1594
        Height = 77
        Align = alClient
        DataSource = DsDop
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'STAT_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Тип цен'
            Width = 91
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'seb'
            Title.Alignment = taCenter
            Title.Caption = 'Себестоимость'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SPEC'
            Title.Alignment = taCenter
            Title.Caption = 'Закупочная цена'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'spec2'
            Title.Caption = 'Спец2'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KOPT'
            Title.Alignment = taCenter
            Title.Caption = 'СПЕЦ цена'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPT'
            Title.Alignment = taCenter
            Title.Caption = 'Кр. опт. цена'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOPT'
            Title.Alignment = taCenter
            Title.Caption = 'Опт. цена'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'money7'
            Title.Caption = 'Цена7'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'money8'
            Title.Caption = 'Цена8'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'pprod'
            Title.Caption = 'Цена ПП'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ROZN'
            Title.Alignment = taCenter
            Title.Caption = 'Розница'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT'
            Title.Alignment = taCenter
            Title.Caption = 'Дата поставки'
            Width = 86
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DAY'
            Title.Alignment = taCenter
            Title.Caption = 'Дней '
            Width = 54
            Visible = True
          end>
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 147
      Width = 1594
      Height = 606
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 449
        Height = 606
        Align = alLeft
        DataSource = DsZRemons
        DefaultDrawing = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawDataCell = RxDBGrid1DrawDataCell
        OnDrawColumnCell = RxDBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'MET'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = ' '
            Width = 17
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_ART'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Код'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_NAM'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Наименование товара'
            Width = 257
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OST'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Остаток'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ED_SHORT'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Ед.'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Speed1'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = '1 мес.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Speed2'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = '2 мес.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Speed3'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = '3 мес.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMMENT1'
            Title.Alignment = taCenter
            Title.Caption = 'Комментарий составителя'
            Width = 225
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMMENT2'
            Title.Alignment = taCenter
            Title.Caption = 'Комментарий утверждения'
            Width = 211
            Visible = True
          end>
      end
      object RxDBGrid3: TRxDBGrid
        Left = 452
        Top = 0
        Width = 1142
        Height = 606
        Align = alClient
        DataSource = DsZRemons
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = RxDBGrid3GetCellParams
        Columns = <
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'S_SEB1'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Себест, руб'
            Width = 69
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'S_SEB2'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Себест, $'
            Width = 67
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'S_DT'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Дата поставки'
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'S_DAYS'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Дней'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLD_MROZ'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Розн. Текущ.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_MROZ'
            Title.Alignment = taCenter
            Title.Caption = 'Розн. Новая'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UTW_MROZ'
            Title.Alignment = taCenter
            Title.Caption = 'Розн. Утв.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLD_OPT1'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'ОЦ текущ.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_OPT1'
            Title.Alignment = taCenter
            Title.Caption = 'ОЦ Новая'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UTW_OPT1'
            Title.Alignment = taCenter
            Title.Caption = 'ОЦ утв'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLD_OPT2'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'КОЦ текущ.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_OPT2'
            Title.Alignment = taCenter
            Title.Caption = 'КОЦ новая'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UTW_OPT2'
            Title.Alignment = taCenter
            Title.Caption = 'КОЦ утв'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLD_OPT3'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'СПЕЦ текущ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_OPT3'
            Title.Alignment = taCenter
            Title.Caption = 'СПЕЦ новая'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UTW_OPT3'
            Title.Alignment = taCenter
            Title.Caption = 'СПЕЦ утв.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLD_OPT6'
            ReadOnly = True
            Title.Caption = 'СПЕЦ2 текущ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_OPT6'
            Title.Caption = 'СПЕЦ2 новая'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UTW_OPT6'
            Title.Caption = 'СПЕЦ2 утв'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLD_OPT7'
            ReadOnly = True
            Title.Caption = 'Цена7 текущ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_OPT7'
            Title.Caption = 'Цена7 новая'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UTW_OPT7'
            Title.Caption = 'Цена7 утв'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLD_OPT8'
            ReadOnly = True
            Title.Caption = 'Цена0 текущ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_OPT8'
            Title.Caption = 'Цена0 новая'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UTW_OPT8'
            Title.Caption = 'Цена0 утв'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OLD_OPT4'
            ReadOnly = True
            Title.Caption = 'ПП тек.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_OPT4'
            Title.Caption = 'ПП новая'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UTW_OPT4'
            Title.Caption = 'ПП утв'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONEY5'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'ЗАК текущ.'
            Visible = True
          end>
      end
      object RxSplitter1: TRxSplitter
        Left = 449
        Top = 0
        Width = 3
        Height = 606
        ControlFirst = RxDBGrid1
        Align = alLeft
        BevelOuter = bvLowered
      end
    end
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 432
    Top = 265
    object ActSave: TAction
      Caption = 'Сохранить'
      Hint = 'Сохранить'
      ImageIndex = 39
      ShortCut = 16397
      OnExecute = ActSaveExecute
    end
    object ActApply: TAction
      Caption = 'Применить'
      Hint = 'Применить'
      ImageIndex = 38
      ShortCut = 16467
      OnExecute = ActApplyExecute
    end
    object DicTW: TAction
      Caption = 'Товары по каталогу...'
      Hint = 'Товары по каталогу...'
      ImageIndex = 37
      ShortCut = 122
      OnExecute = DicTWExecute
    end
    object ActDetal: TAction
      Caption = 'Подробно о товаре...'
      Hint = 'Подробно о товаре...'
      ImageIndex = 11
      ShortCut = 113
      OnExecute = ActDetalExecute
    end
    object ActAnaliz: TAction
      Caption = 'Анализ товара...'
      Hint = 'Анализ товара...'
      ImageIndex = 12
      ShortCut = 114
      OnExecute = ActAnalizExecute
    end
    object ActMarketing: TAction
      Caption = 'Маркетинговые данные товара...'
      Hint = 'Маркетинговые данные товара...'
      ImageIndex = 10
      ShortCut = 115
      OnExecute = ActMarketingExecute
    end
    object ActLock: TAction
      Caption = 'Заблокировать систему'
      Hint = 'Заблокировать систему'
      ImageIndex = 105
      OnExecute = ActLockExecute
    end
    object ActDel: TAction
      Caption = 'Удалить товар'
      Hint = 'Удалить товар'
      ImageIndex = 2
      OnExecute = ActDelExecute
    end
    object ActPrint: TAction
      Caption = 'Печать...'
      Hint = 'Печать...'
      ImageIndex = 9
      ShortCut = 120
      Visible = False
      OnExecute = ActPrintExecute
    end
    object ActHistory: TAction
      Caption = 'История документа...'
      Hint = 'История документа...'
      ImageIndex = 3
      Visible = False
      OnExecute = ActHistoryExecute
    end
    object ActRefresh: TAction
      Caption = 'Обновить данные'
      Hint = 'Обновить данные'
      ImageIndex = 44
      OnExecute = ActRefreshExecute
    end
    object ActOk: TAction
      Caption = 'Закончить утверждение'
      Hint = 'Закончить утверждение'
      ImageIndex = 22
      OnExecute = ActOkExecute
    end
  end
  object MemDop: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'STAT_ID'
        DataType = ftInteger
      end
      item
        Name = 'STAT_NAME'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'ROZN'
        DataType = ftFloat
      end
      item
        Name = 'MOPT'
        DataType = ftFloat
      end
      item
        Name = 'OPT'
        DataType = ftFloat
      end
      item
        Name = 'KOPT'
        DataType = ftFloat
      end
      item
        Name = 'SPEC'
        DataType = ftFloat
      end
      item
        Name = 'DAY'
        DataType = ftInteger
      end
      item
        Name = 'DT'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'seb'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'pprod'
        DataType = ftFloat
      end
      item
        Name = 'spec2'
        DataType = ftFloat
      end
      item
        Name = 'money7'
        DataType = ftFloat
      end
      item
        Name = 'money8'
        DataType = ftFloat
      end>
    Left = 100
    Top = 239
    object MemDopSTAT_ID: TIntegerField
      FieldName = 'STAT_ID'
    end
    object MemDopSTAT_NAME: TStringField
      FieldName = 'STAT_NAME'
      Size = 254
    end
    object MemDopROZN: TFloatField
      FieldName = 'ROZN'
      DisplayFormat = '#0.00 руб'
    end
    object MemDopMOPT: TFloatField
      FieldName = 'MOPT'
      DisplayFormat = '#0.00 руб'
    end
    object MemDopOPT: TFloatField
      FieldName = 'OPT'
      DisplayFormat = '#0.00 руб'
    end
    object MemDopKOPT: TFloatField
      FieldName = 'KOPT'
      DisplayFormat = '#0.00 руб'
    end
    object MemDopSPEC: TFloatField
      FieldName = 'SPEC'
      DisplayFormat = '#0.00 руб'
    end
    object MemDopDAY: TIntegerField
      FieldName = 'DAY'
    end
    object MemDopDT: TStringField
      FieldName = 'DT'
      Size = 32
    end
    object MemDopseb: TStringField
      FieldName = 'seb'
      Size = 254
    end
    object MemDopakziya: TFloatField
      FieldName = 'pprod'
      DisplayFormat = '#0.00 руб'
    end
    object MemDopspec2: TFloatField
      FieldName = 'spec2'
      DisplayFormat = '#0.00 руб'
    end
    object MemDopmoney7: TFloatField
      FieldName = 'money7'
      DisplayFormat = '#0.00 руб'
    end
    object MemDopmoney8: TFloatField
      FieldName = 'money8'
      DisplayFormat = '#0.00 руб'
    end
  end
  object DsDop: TDataSource
    DataSet = MemDop
    OnDataChange = DsDopDataChange
    Left = 100
    Top = 287
  end
  object MemZRemons: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'ZREMONS_ID'
        DataType = ftInteger
      end
      item
        Name = 'MET'
        DataType = ftInteger
      end
      item
        Name = 'TW_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_ART'
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
        Size = 6
      end
      item
        Name = 'TWKTG_COLOR'
        DataType = ftInteger
      end
      item
        Name = 'OLD_MROZ'
        DataType = ftFloat
      end
      item
        Name = 'NEW_MROZ'
        DataType = ftFloat
      end
      item
        Name = 'UTW_MROZ'
        DataType = ftFloat
      end
      item
        Name = 'OLD_OPT1'
        DataType = ftFloat
      end
      item
        Name = 'NEW_OPT1'
        DataType = ftFloat
      end
      item
        Name = 'UTW_OPT1'
        DataType = ftFloat
      end
      item
        Name = 'OLD_OPT2'
        DataType = ftFloat
      end
      item
        Name = 'NEW_OPT2'
        DataType = ftFloat
      end
      item
        Name = 'UTW_OPT2'
        DataType = ftFloat
      end
      item
        Name = 'OLD_OPT3'
        DataType = ftFloat
      end
      item
        Name = 'NEW_OPT3'
        DataType = ftFloat
      end
      item
        Name = 'UTW_OPT3'
        DataType = ftFloat
      end
      item
        Name = 'OLD_OPT4'
        DataType = ftFloat
      end
      item
        Name = 'NEW_OPT4'
        DataType = ftFloat
      end
      item
        Name = 'UTW_OPT4'
        DataType = ftFloat
      end
      item
        Name = 'COMMENT1'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'LAST_SEB1'
        DataType = ftFloat
      end
      item
        Name = 'LAST_SEB2'
        DataType = ftFloat
      end
      item
        Name = 'LAST_DT'
        DataType = ftDate
      end
      item
        Name = 'LAST_DAYS'
        DataType = ftInteger
      end
      item
        Name = 'LAST_KOL'
        DataType = ftFloat
      end
      item
        Name = 'COMMENT2'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'OST'
        DataType = ftFloat
      end
      item
        Name = 'Speed1'
        DataType = ftFloat
      end
      item
        Name = 'Speed2'
        DataType = ftFloat
      end
      item
        Name = 'Speed3'
        DataType = ftFloat
      end
      item
        Name = 'MET_MONEY_SHOP'
        DataType = ftInteger
      end
      item
        Name = 'MONEY5'
        DataType = ftFloat
      end
      item
        Name = 'OLD_OPT6'
        DataType = ftFloat
      end
      item
        Name = 'NEW_OPT6'
        DataType = ftFloat
      end
      item
        Name = 'UTW_OPT6'
        DataType = ftFloat
      end
      item
        Name = 'OLD_OPT7'
        DataType = ftFloat
      end
      item
        Name = 'NEW_OPT7'
        DataType = ftFloat
      end
      item
        Name = 'UTW_OPT7'
        DataType = ftFloat
      end
      item
        Name = 'OLD_OPT8'
        DataType = ftFloat
      end
      item
        Name = 'NEW_OPT8'
        DataType = ftFloat
      end
      item
        Name = 'UTW_OPT8'
        DataType = ftFloat
      end>
    AfterPost = MemZRemonsAfterPost
    AfterScroll = MemZRemonsAfterPost
    OnCalcFields = MemZRemonsCalcFields
    Left = 210
    Top = 240
    object MemZRemonsZREMONS_ID: TIntegerField
      FieldName = 'ZREMONS_ID'
    end
    object MemZRemonsMET: TIntegerField
      FieldName = 'MET'
    end
    object MemZRemonsTW_ID: TIntegerField
      FieldName = 'TW_ID'
    end
    object MemZRemonsTW_ART: TIntegerField
      FieldName = 'TW_ART'
    end
    object MemZRemonsTW_NAM: TStringField
      FieldName = 'TW_NAM'
      Size = 254
    end
    object MemZRemonsED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      Size = 6
    end
    object MemZRemonsTWKTG_COLOR: TIntegerField
      FieldName = 'TWKTG_COLOR'
    end
    object MemZRemonsOLD_MROZ: TFloatField
      FieldName = 'OLD_MROZ'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsNEW_MROZ: TFloatField
      FieldName = 'NEW_MROZ'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsUTW_MROZ: TFloatField
      FieldName = 'UTW_MROZ'
      OnChange = MemZRemonsUTW_MROZChange
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsOLD_OPT1: TFloatField
      FieldName = 'OLD_OPT1'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsNEW_OPT1: TFloatField
      FieldName = 'NEW_OPT1'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsUTW_OPT1: TFloatField
      FieldName = 'UTW_OPT1'
      OnChange = MemZRemonsUTW_MROZChange
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsOLD_OPT2: TFloatField
      FieldName = 'OLD_OPT2'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsNEW_OPT2: TFloatField
      FieldName = 'NEW_OPT2'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsUTW_OPT2: TFloatField
      FieldName = 'UTW_OPT2'
      OnChange = MemZRemonsUTW_MROZChange
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsOLD_OPT3: TFloatField
      FieldName = 'OLD_OPT3'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsNEW_OPT3: TFloatField
      FieldName = 'NEW_OPT3'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsUTW_OPT3: TFloatField
      FieldName = 'UTW_OPT3'
      OnChange = MemZRemonsUTW_MROZChange
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsOLD_OPT4: TFloatField
      FieldName = 'OLD_OPT4'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsnew_opt4: TFloatField
      FieldName = 'NEW_OPT4'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsutw_opt4: TFloatField
      FieldName = 'UTW_OPT4'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsCOMMENT1: TStringField
      FieldName = 'COMMENT1'
      Size = 254
    end
    object MemZRemonsLAST_SEB1: TFloatField
      FieldName = 'LAST_SEB1'
    end
    object MemZRemonsLAST_SEB2: TFloatField
      FieldName = 'LAST_SEB2'
      DisplayFormat = '#0.00 USD'
    end
    object MemZRemonsLAST_DT: TDateField
      FieldName = 'LAST_DT'
    end
    object MemZRemonsLAST_DAYS: TIntegerField
      FieldName = 'LAST_DAYS'
    end
    object MemZRemonsLAST_KOL: TFloatField
      FieldName = 'LAST_KOL'
    end
    object MemZRemonsCOMMENT2: TStringField
      FieldName = 'COMMENT2'
      Size = 254
    end
    object MemZRemonsOST: TFloatField
      FieldName = 'OST'
      DisplayFormat = '#0.0000'
    end
    object MemZRemonsSpeed1: TFloatField
      FieldName = 'Speed1'
      DisplayFormat = '#0.0000'
    end
    object MemZRemonsSpeed2: TFloatField
      FieldName = 'Speed2'
      DisplayFormat = '#0.0000'
    end
    object MemZRemonsSpeed3: TFloatField
      FieldName = 'Speed3'
      DisplayFormat = '#0.0000'
    end
    object MemZRemonsS_SEB1: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_SEB1'
      Size = 32
      Calculated = True
    end
    object MemZRemonsS_SEB2: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_SEB2'
      Size = 32
      Calculated = True
    end
    object MemZRemonsS_DT: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_DT'
      Size = 32
      Calculated = True
    end
    object MemZRemonsS_DAYS: TStringField
      FieldKind = fkCalculated
      FieldName = 'S_DAYS'
      Size = 32
      Calculated = True
    end
    object MemZRemonsMET_MONEY_SHOP: TIntegerField
      FieldName = 'MET_MONEY_SHOP'
    end
    object MemZRemonsmoney5: TFloatField
      FieldName = 'MONEY5'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsOLD_OPT6: TFloatField
      FieldName = 'OLD_OPT6'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsNEW_OPT6: TFloatField
      FieldName = 'NEW_OPT6'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsUTW_OPT6: TFloatField
      FieldName = 'UTW_OPT6'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsOLD_OPT7: TFloatField
      FieldName = 'OLD_OPT7'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsNEW_OPT7: TFloatField
      FieldName = 'NEW_OPT7'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsUTW_OPT7: TFloatField
      FieldName = 'UTW_OPT7'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsOLD_OPT8: TFloatField
      FieldName = 'OLD_OPT8'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsNEW_OPT8: TFloatField
      FieldName = 'NEW_OPT8'
      DisplayFormat = '#0.00 руб'
    end
    object MemZRemonsUTW_OPT8: TFloatField
      FieldName = 'UTW_OPT8'
      DisplayFormat = '#0.00 руб'
    end
  end
  object DsZRemons: TDataSource
    DataSet = MemZRemons
    OnDataChange = DsZRemonsDataChange
    Left = 210
    Top = 287
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 312
    Top = 241
  end
  object Query1Transaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 308
    Top = 301
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 544
    Top = 239
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 546
    Top = 289
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 618
    Top = 289
  end
  object MemStat: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'STAT_ID'
        DataType = ftInteger
      end
      item
        Name = 'STAT_NAME'
        DataType = ftString
        Size = 254
      end>
    Left = 694
    Top = 201
    object MemStatSTAT_ID: TIntegerField
      FieldName = 'STAT_ID'
    end
    object MemStatSTAT_NAME: TStringField
      FieldName = 'STAT_NAME'
      Size = 254
    end
  end
  object DsStat: TDataSource
    DataSet = MemStat
    Left = 694
    Top = 251
  end
  object ImageList1: TImageList
    Left = 30
    Top = 236
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000018631042000000000000000000000000000000000000186318630000
      0000000000000000000000000000000000000000000000000000186318630000
      0000000000000000000000000000000000000000000000000000186318630000
      0000000000000000000000000000000000000000000000000000186318630000
      FF7F186318631863186310420000000000000000000000000000E07F18631863
      1863000000000000000000000000000000000000000000000000E07F18631042
      0000000000000000000000000000000000000000000000000000E07F18631042
      0000000000000000000000000000000000000000000000000000007C18630000
      1863FF7F186300020002186318631042000000000000000018631863E07F0000
      00000000000000000000000000000000000000000000000018631863E07FFF7F
      FF7FFF7F0040FF7FFF7FE07FFF7FFF7F000000000000000018631863E07FFF7F
      FF7FFF7F0040FF7FFF7FE07FFF7FFF7F000000000000000018631863007C0000
      FF7F186318630002FF7F00021863186300000000000000001863E07F18631042
      FF7FFF7FE07F1863FF7FFF7F0000000000000000000000001863E07F1863FF7F
      004000400040FF7F1042FF7FFF7F104200000000000000001863000018630000
      004000000040000010420000FF7F000000000000000000001863007C18630000
      1863FF7FFF7F0002FF7F0002186318630000000000001863E07F1863E07F1042
      E07FFF7F18630000E07FFF7F104200000000000000001863E07F1863E07F0040
      0040004000400040FF7F10421042FF7F00000000000018630000186300000040
      0000004000000040000010420000FF7F0000000000001863007C186300000000
      FF7FFF7FFF7F10420002000218631863000000000000E07F1863E07F18631042
      FF7F186300000000FF7FFF7F10420000000000000000E07F1863E07F18630040
      0040FF7F00400040FF7FFF7F1042FF7F00000000000000001863000018630000
      0040000000400000FF7F000010420000000000000000007C1863007C0000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F18631863000000001863FF7FE07F1863E07F1042
      18630000E07F0000E07FFF7F10420000000000001863FF7FE07F18630040FF7F
      FF7FFF7FFF7F0040FF7FE07FFF7F1042000000000000FF7F000018630000FF7F
      0000FF7F000000400000E07F00001042000000001863007C007C18630000FF7F
      FF7F1042104210421042FF7FFF7FFF7F00000000FF7FE07F1863FF7FFF7F1042
      0000E07F0000FF7FFF7FFF7F0000000000000000FF7FE07F1863FF7FFF7F1042
      FF7FFF7FFF7F0040004010420000000000000000FF7F000018630000FF7F0000
      FF7F0000FF7F0000004000000000000000000000007C007C1863007C0000FF7F
      1042FF7FFF7FFF7FFF7F10421042FF7F000000000000FF7FFF7F000000000000
      E07F0000FF7FFF7FE07FFF7F00000000000000000000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7F0040186300000000000000000000FF7F000000000000FF7F
      0000FF7F0000FF7F0000186300000000000000000000007C007C00000000FF7F
      1042FF7FFF7FFF7F1042FF7FFF7F104200000000000000000000000000000040
      0000FF7FE07FFF7FFF7FFF7F0000000000000000000000000000000000000000
      0000FF7FFF7FFF7F004000000000000000000000000000000000000000000000
      00000000FF7F0000004000000000000000000000000000000000000000000000
      0000FF7FFF7F1042FF7F18631863186318630000000000000000000000000000
      E07FFF7FFF7FFF7FE07FFF7F0000000000000000000000000000000000000000
      000000000000FF7FFF7F00000000000000000000000000000000000000000000
      000000000000FF7F000000000000000000000000000000000000000000000000
      000000000000FF7F000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFF9FF3FFF3FFF3FFF207
      E0FFE0FFE0FFE001E03FE000E000E000C003C000C000C000C003C000CAAAC000
      80008000D554800080018000AAAA8000000100005555000000030000AAAA0000
      80038003D5578000CC03CC07EFAFCC00FC03FF07FF57FF00FC03FFCFFFEFFFCF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
