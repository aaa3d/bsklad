object DOC_PN2: TDOC_PN2
  Left = 468
  Top = 475
  Width = 891
  Height = 717
  Caption = 'Приходная накладная'
  Color = clBtnFace
  Constraints.MinHeight = 560
  Constraints.MinWidth = 760
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  ShowHint = True
  WindowState = wsMaximized
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
    Width = 883
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = BtnLock
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 33
      Top = 2
      Action = BtnProv
    end
    object ToolButton9: TToolButton
      Left = 58
      Top = 2
      Action = BtnPoluProv
    end
    object ToolButton4: TToolButton
      Left = 83
      Top = 2
      Action = BtnUnprov
    end
    object ToolButton5: TToolButton
      Left = 108
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 116
      Top = 2
      Action = BtnSave
    end
    object ToolButton7: TToolButton
      Left = 141
      Top = 2
      Action = BtnApply
    end
    object ToolButton8: TToolButton
      Left = 166
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object BtnPrint2: TToolButton
      Left = 174
      Top = 2
      Action = BtnPrint
    end
    object ToolButton10: TToolButton
      Left = 199
      Top = 2
      Action = BtnHistory
    end
    object ToolButton11: TToolButton
      Left = 224
      Top = 2
      Action = BtnSub
    end
    object ToolButton12: TToolButton
      Left = 249
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 257
      Top = 2
      Action = BtnDicTw
    end
    object ToolButton14: TToolButton
      Left = 282
      Top = 2
      Action = BtnDel
    end
    object ToolButton15: TToolButton
      Left = 307
      Top = 2
      Width = 8
      Caption = 'ToolButton15'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton16: TToolButton
      Left = 315
      Top = 2
      Action = BtnDetal
    end
    object ToolButton17: TToolButton
      Left = 340
      Top = 2
      Action = BtnAnaliz
    end
    object ToolButton18: TToolButton
      Left = 365
      Top = 2
      Action = BtnMarketing
    end
    object ToolButton19: TToolButton
      Left = 390
      Top = 2
      Action = BtnSert
    end
    object ToolButton20: TToolButton
      Left = 415
      Top = 2
      Width = 8
      Caption = 'ToolButton20'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object ToolButton21: TToolButton
      Left = 423
      Top = 2
      Action = BtnPrintCennik
    end
    object ToolButton22: TToolButton
      Left = 448
      Top = 2
      Action = BtnPrintCennikAll
    end
    object ToolButton23: TToolButton
      Left = 473
      Top = 2
      Width = 8
      Caption = 'ToolButton23'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object ToolButton24: TToolButton
      Left = 481
      Top = 2
      Action = BtnRefresh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 883
    Height = 182
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 68
      Top = 8
      Width = 43
      Height = 13
      Caption = 'Фирма :'
    end
    object Label2: TLabel
      Left = 48
      Top = 30
      Width = 64
      Height = 13
      Caption = 'Поставщик :'
    end
    object Label3: TLabel
      Left = 406
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Банк фирмы :'
    end
    object Label4: TLabel
      Left = 380
      Top = 30
      Width = 96
      Height = 13
      Caption = 'Банк поставщика :'
    end
    object SpeedButton1: TSpeedButton
      Left = 346
      Top = 24
      Width = 23
      Height = 22
      Action = BtnDicKln
      Glyph.Data = {
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF0000000000000000
        00000000000000000000000000000000000000000000000000000000FF00FFFF
        00FFFF00FFFF00FF0000FF00FF000000C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6
        C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6C6000000FF00FFFF00FFFF00FF
        0000FF00FF000000C6C6C6000000000000000000000000000000000000000000
        000000000000000000C6C6C6C6C6C6000000FF00FFFF00FF0000FF00FFFF00FF
        000000C6C6C6000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00
        FF000000C6C6C6C6C6C6000000FF00FF0000FF00FF0000000000000000000000
        00000000000000000000000000000000000000FFFFFF000000FFFFFF000000C6
        C6C6000000FF00FF0000FF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000000000C6C6C6000000FF00FF
        0000FF00FFFF00FF000000FFFFFF000000000000FFFFFF000000000000FFFFFF
        FFFFFFFFFFFF000000FFFFFF000000C6C6C6000000FF00FF0000FF00FFFF00FF
        000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00FFFFFF000000C6C6C6000000FF00FF0000FF00FF000000000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
        0000000000FF00FF0000FF00FF0000000000FF000000000000FFFFFF00000000
        0000000000000000000000FFFFFF0000000000000000000000FF000000FF00FF
        0000FF00FF0000000000FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000000000000000FF000000FF00FF0000FF00FF000000
        000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000FFFFFF000000000000FF00FF0000FF00FFFF00FFFF00FF000000FFFF
        FF000000000000000000FFFFFF000000000000FFFFFFFFFFFF000000FFFFFF00
        0000FF00FFFF00FF0000FF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF00FFFF00FF
        0000FF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFF000000000000000000
        000000000000000000000000FF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
        FF00FFFF00FF000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF0000}
    end
    object Label5: TLabel
      Left = 18
      Top = 52
      Width = 93
      Height = 13
      Caption = 'Владелец товара :'
    end
    object Label7: TLabel
      Left = 50
      Top = 116
      Width = 62
      Height = 13
      Caption = 'Основание :'
    end
    object Label8: TLabel
      Left = 48
      Top = 160
      Width = 64
      Height = 13
      Caption = 'Через кого :'
    end
    object Label9: TLabel
      Left = 436
      Top = 52
      Width = 40
      Height = 13
      Caption = 'Номер :'
    end
    object Label10: TLabel
      Left = 28
      Top = 98
      Width = 82
      Height = 13
      Caption = 'Вид накладной :'
    end
    object Label11: TLabel
      Left = 444
      Top = 74
      Width = 32
      Height = 13
      Caption = 'Дата :'
    end
    object Label12: TLabel
      Left = 404
      Top = 96
      Width = 72
      Height = 13
      Caption = 'Дата оплаты :'
    end
    object Btn_Date_Opl: TSpeedButton
      Left = 598
      Top = 90
      Width = 23
      Height = 22
      Caption = 'X'
      OnClick = Btn_Date_OplClick
    end
    object Label13: TLabel
      Left = 608
      Top = 52
      Width = 30
      Height = 13
      Caption = 'Курс :'
    end
    object Label22: TLabel
      Left = 450
      Top = 116
      Width = 25
      Height = 13
      Caption = 'Вид :'
    end
    object Label24: TLabel
      Left = 436
      Top = 140
      Width = 40
      Height = 13
      Caption = 'Сумма :'
    end
    object Label26: TLabel
      Left = 384
      Top = 164
      Width = 93
      Height = 13
      Caption = 'Дата-номер Сч-ф :'
    end
    object Label6: TLabel
      Left = 19
      Top = 75
      Width = 92
      Height = 13
      Caption = 'Склад разгрузки :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 640
      Top = 120
      Width = 68
      Height = 13
      Caption = 'Счет-фактура'
    end
    object Label28: TLabel
      Left = 640
      Top = 136
      Width = 26
      Height = 13
      Caption = 'Дата'
    end
    object Label29: TLabel
      Left = 640
      Top = 160
      Width = 34
      Height = 13
      Caption = 'Номер'
    end
    object PN_POST: TEdit
      Left = 114
      Top = 26
      Width = 231
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'PN_POST'
    end
    object PN_POST_REKW: TEdit
      Left = 478
      Top = 26
      Width = 269
      Height = 21
      Enabled = False
      TabOrder = 1
      Text = 'PN_POST_REKW'
    end
    object PN_OWNER: TRxDBLookupCombo
      Left = 114
      Top = 48
      Width = 255
      Height = 21
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'KLN_ID'
      LookupDisplay = 'KLN_FIO'
      LookupSource = DataModule1.MainDsMen
      TabOrder = 2
      OnChange = PN_OWNERChange
    end
    object PN_OSN: TMemo
      Left = 114
      Top = 114
      Width = 255
      Height = 43
      Lines.Strings = (
        'Memo1')
      MaxLength = 250
      ScrollBars = ssVertical
      TabOrder = 3
      OnChange = PN_OSNChange
    end
    object PN_WHO: TEdit
      Left = 114
      Top = 158
      Width = 255
      Height = 21
      TabOrder = 4
      Text = 'PN_WHO'
      OnChange = PN_WHOChange
    end
    object PN_VID: TRxDBLookupCombo
      Left = 114
      Top = 92
      Width = 255
      Height = 21
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'PNVID_ID'
      LookupDisplay = 'PNVID_NAM'
      LookupSource = DataModule1.MainDsPnvid
      TabOrder = 5
      OnChange = PN_VIDChange
    end
    object PN_NUM: TEdit
      Left = 478
      Top = 48
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 6
      Text = 'PN_NUM'
    end
    object PN_DATE: TDateEdit
      Left = 478
      Top = 70
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 7
      OnChange = PN_DATEChange
    end
    object PN_DATE_OPL: TDateEdit
      Left = 478
      Top = 92
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 8
      OnChange = PN_DATE_OPLChange
    end
    object PN_KURS: TRxCalcEdit
      Left = 654
      Top = 48
      Width = 91
      Height = 21
      AutoSize = False
      DisplayFormat = '#,0.00 р./$'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 9
      OnChange = PN_KURSChange
    end
    object FRM: TRxDBLookupCombo
      Left = 114
      Top = 4
      Width = 255
      Height = 21
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'KLN_ID'
      LookupDisplay = 'KLN_FULL'
      LookupSource = DataModule1.MainDsAllFrm
      TabOrder = 10
      OnChange = FRMChange
    end
    object VID: TComboBox
      Left = 478
      Top = 114
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 11
      OnChange = VIDChange
      Items.Strings = (
        'Бухгалтер'
        'Менеджер'
        'Полный')
    end
    object SUMM_ITOGO1: TRxCalcEdit
      Left = 479
      Top = 137
      Width = 101
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00##'
      Enabled = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 12
    end
    object PN_STFAKT: TEdit
      Left = 480
      Top = 160
      Width = 145
      Height = 21
      MaxLength = 50
      TabOrder = 13
      Text = 'PN_STFAKT'
      OnChange = PN_STFAKTChange
    end
    object SKL: TRxDBLookupCombo
      Left = 114
      Top = 71
      Width = 151
      Height = 21
      DropDownCount = 8
      EscapeClear = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'SKL_ID'
      LookupDisplay = 'SKL_SHORT'
      LookupSource = DataModule1.MainDsSkl
      ParentFont = False
      TabOrder = 14
      OnChange = SKLChange
    end
    object FRM_BNK: TEdit
      Left = 477
      Top = 4
      Width = 271
      Height = 21
      AutoSize = False
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      Text = 'FRM_BNK'
    end
    object PN_STFAKT_DATE: TDateEdit
      Left = 686
      Top = 134
      Width = 99
      Height = 21
      NumGlyphs = 2
      TabOrder = 16
      OnChange = PN_DATEChange
    end
    object PN_STFAKT_NUM: TEdit
      Left = 686
      Top = 159
      Width = 99
      Height = 21
      MaxLength = 50
      TabOrder = 17
      OnChange = PN_STFAKTChange
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 672
    Width = 883
    Height = 18
    Panels = <
      item
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 200
      end>
    SimplePanel = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 211
    Width = 883
    Height = 461
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Список товаров'
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 875
        Height = 433
        Align = alClient
        DataSource = DsPns
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyPress = RxDBGrid1KeyPress
        OnGetCellParams = RxDBGrid1GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'TW_ART'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Код'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_NAM'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Наименование товара'
            Width = 162
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ED_SHORT'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Ед.'
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Цена'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY_SEB'
            Title.Alignment = taCenter
            Title.Caption = 'Сб.безНДС.Адм.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY_SEB2'
            Title.Alignment = taCenter
            Title.Caption = 'Сб.безНДС.Плн.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY_SEB_ALL'
            Title.Alignment = taCenter
            Title.Caption = 'Себ.Накл.Итого'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MONEY_MEN'
            Title.Alignment = taCenter
            Title.Caption = 'Себест. Итого'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_KOL'
            Title.Alignment = taCenter
            Title.Caption = 'Кол-во'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PNS_NDS_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма НДС'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PNS_NDS'
            Title.Alignment = taCenter
            Title.Caption = 'Ставка, %'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма Итого'
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_SUMM_SEB'
            Title.Alignment = taCenter
            Title.Caption = 'СуммСб.безНДС.Адм.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_SUMM_SEB2'
            Title.Alignment = taCenter
            Title.Caption = 'СуммСб.безНДС.Плн.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_SUMM_SEB_ALL'
            Title.Alignment = taCenter
            Title.Caption = 'Сум.Себ.Накл.Итого'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_SUMM_MEN'
            Title.Alignment = taCenter
            Title.Caption = 'Себест. Итого'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERT_NUM'
            Title.Alignment = taCenter
            Title.Caption = 'Номер сертификата'
            Width = 162
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERT_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Срок действия'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERT_WHO'
            Title.Alignment = taCenter
            Title.Caption = 'Кем выдан'
            Width = 142
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Накладные расходы'
      ImageIndex = 1
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 29
        Width = 875
        Height = 404
        Align = alClient
        DataSource = DsPns2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = RxDBGrid2DblClick
        OnKeyDown = RxDBGrid2KeyDown
        OnKeyPress = RxDBGrid2KeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'DOC'
            Title.Alignment = taCenter
            Title.Caption = 'Документ'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOC_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Дата'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KLN_FULL'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Контрагент'
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USL_FULL'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Услуга'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMM2'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Без НДС'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NDS'
            Title.Alignment = taCenter
            Title.Caption = 'Ставка НДС'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NDS_SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма НДС'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUMM'
            Title.Alignment = taCenter
            Title.Caption = 'Сумма Итого'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MET_FULL'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Учет'
            Width = 100
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 875
        Height = 29
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        object Label25: TLabel
          Left = 512
          Top = 10
          Width = 90
          Height = 13
          Caption = 'Сумма расходов :'
        end
        object Check_nakl: TCheckBox
          Left = 4
          Top = 6
          Width = 305
          Height = 17
          Caption = 'Накладные расходы взять с приходной накладной № :'
          TabOrder = 0
          OnClick = Check_naklClick
        end
        object NAKL_EDIT: TEdit
          Left = 306
          Top = 4
          Width = 177
          Height = 21
          Enabled = False
          TabOrder = 1
          Text = 'NAKL_EDIT'
        end
        object Btn_Nakl: TButton
          Left = 482
          Top = 4
          Width = 25
          Height = 21
          Caption = '...'
          TabOrder = 2
          OnClick = Btn_NaklClick
        end
        object NAKL_SUMM: TRxCalcEdit
          Left = 606
          Top = 4
          Width = 121
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00 руб##'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 3
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Суммы'
      ImageIndex = 2
      object Bevel1: TBevel
        Left = 465
        Top = 0
        Width = 101
        Height = 17
      end
      object Bevel2: TBevel
        Left = 364
        Top = 0
        Width = 101
        Height = 17
      end
      object Bevel3: TBevel
        Left = 262
        Top = 0
        Width = 101
        Height = 17
      end
      object Bevel6: TBevel
        Left = 196
        Top = 0
        Width = 65
        Height = 18
      end
      object Label19: TLabel
        Left = 198
        Top = 2
        Width = 58
        Height = 13
        Caption = 'Накладные'
      end
      object Label14: TLabel
        Left = 302
        Top = 2
        Width = 59
        Height = 13
        Caption = 'Администр.'
      end
      object Label15: TLabel
        Left = 410
        Top = 2
        Width = 51
        Height = 13
        Caption = 'Хозяйств.'
      end
      object Label16: TLabel
        Left = 474
        Top = 2
        Width = 88
        Height = 13
        Caption = 'Итого накладных'
      end
      object Bevel4: TBevel
        Left = 0
        Top = 59
        Width = 90
        Height = 19
      end
      object Label17: TLabel
        Left = 4
        Top = 42
        Width = 30
        Height = 13
        Caption = 'НДС :'
      end
      object Label18: TLabel
        Left = 2
        Top = 23
        Width = 85
        Height = 13
        Caption = 'Сумма без НДС:'
      end
      object Bevel5: TBevel
        Left = 0
        Top = 19
        Width = 90
        Height = 19
      end
      object Label20: TLabel
        Left = 4
        Top = 61
        Width = 36
        Height = 13
        Caption = 'Итого :'
      end
      object Bevel7: TBevel
        Left = 0
        Top = 39
        Width = 90
        Height = 19
      end
      object Bevel8: TBevel
        Left = 93
        Top = 0
        Width = 101
        Height = 17
      end
      object Label21: TLabel
        Left = 154
        Top = 2
        Width = 31
        Height = 13
        Caption = 'Товар'
      end
      object Bevel9: TBevel
        Left = 570
        Top = 0
        Width = 101
        Height = 17
      end
      object Label23: TLabel
        Left = 636
        Top = 2
        Width = 30
        Height = 13
        Caption = 'Итого'
      end
      object SUMM_ALL1: TRxCalcEdit
        Left = 262
        Top = 59
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 0
      end
      object SUMM_NO_NDS1: TRxCalcEdit
        Left = 262
        Top = 17
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 1
      end
      object SUMM_NDS1: TRxCalcEdit
        Left = 262
        Top = 38
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 2
      end
      object SUMM_NDS2: TRxCalcEdit
        Left = 364
        Top = 38
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 3
      end
      object SUMM_NO_NDS2: TRxCalcEdit
        Left = 364
        Top = 17
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 4
      end
      object SUMM_ALL2: TRxCalcEdit
        Left = 364
        Top = 59
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 5
      end
      object SUMM_ALL3: TRxCalcEdit
        Left = 465
        Top = 59
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 6
      end
      object SUMM_NO_NDS3: TRxCalcEdit
        Left = 465
        Top = 17
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 7
      end
      object SUMM_NDS3: TRxCalcEdit
        Left = 465
        Top = 38
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 8
      end
      object TW_SUMM_NO_NDS: TRxCalcEdit
        Left = 94
        Top = 17
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 9
      end
      object TW_SUMM_NDS: TRxCalcEdit
        Left = 94
        Top = 38
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 10
      end
      object TW_SUMM_ALL: TRxCalcEdit
        Left = 94
        Top = 59
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 11
      end
      object SUMM_ITOGO2: TRxCalcEdit
        Left = 571
        Top = 59
        Width = 101
        Height = 21
        AutoSize = False
        DisplayFormat = ',0.00##'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 12
      end
    end
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 362
    Top = 315
    object BtnLock: TAction
      Caption = 'Заблокировать систему'
      ImageIndex = 110
      OnExecute = BtnLockExecute
    end
    object BtnProv: TAction
      Caption = 'Провести...'
      Hint = 'Провести...'
      ImageIndex = 22
      ShortCut = 116
      OnExecute = BtnProvExecute
    end
    object BtnUnprov: TAction
      Caption = 'Снять с проводки...'
      Hint = 'Снять с проводки...'
      ImageIndex = 23
      ShortCut = 117
      OnExecute = BtnUnprovExecute
    end
    object BtnSave: TAction
      Caption = 'Сохранить...'
      Hint = 'Сохранить...'
      ImageIndex = 39
      ShortCut = 16397
      OnExecute = BtnSaveExecute
    end
    object BtnApply: TAction
      Caption = 'Применить...'
      Hint = 'Применить...'
      ImageIndex = 38
      OnExecute = BtnApplyExecute
    end
    object BtnPrint: TAction
      Caption = 'Печать...'
      Hint = 'Печать...'
      ImageIndex = 9
      ShortCut = 120
      OnExecute = BtnPrintExecute
    end
    object BtnHistory: TAction
      Caption = 'История изменений...'
      Hint = 'История изменений...'
      ImageIndex = 3
      ShortCut = 123
      OnExecute = BtnHistoryExecute
    end
    object BtnSub: TAction
      Caption = 'Создать на основании...'
      Hint = 'Создать на основании...'
      ImageIndex = 24
      OnExecute = BtnSubExecute
    end
    object BtnDicTw: TAction
      Caption = 'Справочник товаров...'
      Hint = 'Справочник товаров...'
      ImageIndex = 37
      ShortCut = 122
      OnExecute = BtnDicTwExecute
    end
    object BtnDel: TAction
      Caption = 'Удалить товар...'
      Hint = 'Удалить товар...'
      ImageIndex = 2
      OnExecute = BtnDelExecute
    end
    object BtnDetal: TAction
      Caption = 'Подробно о товаре...'
      Hint = 'Подробно о товаре...'
      ImageIndex = 11
      ShortCut = 113
      OnExecute = BtnDetalExecute
    end
    object BtnAnaliz: TAction
      Caption = 'Анализ товара...'
      Hint = 'Анализ товара...'
      ImageIndex = 12
      ShortCut = 114
      OnExecute = BtnAnalizExecute
    end
    object BtnMarketing: TAction
      Caption = 'Маркетинговые данные товара...'
      Hint = 'Маркетинговые данные товара...'
      ImageIndex = 10
      ShortCut = 115
      OnExecute = BtnMarketingExecute
    end
    object BtnSert: TAction
      Caption = 'Повторить сертификаты...'
      Hint = 'Повторить сертификаты...'
      ImageIndex = 42
      OnExecute = BtnSertExecute
    end
    object BtnPrintCennik: TAction
      Caption = 'Печать ценника...'
      Hint = 'Печать ценника...'
      ImageIndex = 40
      OnExecute = BtnPrintCennikExecute
    end
    object BtnPrintCennikAll: TAction
      Caption = 'Печать всех ценников...'
      Hint = 'Печать всех ценников...'
      ImageIndex = 41
      OnExecute = BtnPrintCennikAllExecute
    end
    object BtnDicFrm: TAction
      Hint = 'Выбрать фирму...'
      ImageIndex = 14
    end
    object BtnDicKln: TAction
      Hint = 'Выбрать поставщка...'
      ImageIndex = 14
      OnExecute = BtnDicKlnExecute
    end
    object BtnRefresh: TAction
      Caption = 'Обновить...'
      Hint = 'Обновить...'
      ImageIndex = 44
      ShortCut = 116
      OnExecute = BtnRefreshExecute
    end
    object BtnPoluProv: TAction
      Caption = 'Разрешить коррекцию...'
      Hint = 'Разрешить коррекцию...'
      ImageIndex = 170
      OnExecute = BtnPoluProvExecute
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 62
    Top = 311
  end
  object QueryWork1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 64
    Top = 359
  end
  object MemFrm: TRxMemoryData
    FieldDefs = <>
    Left = 168
    Top = 309
    object MemFrmFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
    end
    object MemFrmFRM_NAME: TStringField
      FieldName = 'FRM_NAME'
      Size = 254
    end
    object MemFrmFRM_BANK: TStringField
      FieldName = 'FRM_BANK'
      Size = 254
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 634
    Top = 317
    object N1: TMenuItem
      Action = BtnLock
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = BtnProv
    end
    object N4: TMenuItem
      Action = BtnUnprov
    end
    object N5: TMenuItem
      Action = BtnAnaliz
      Caption = '-'
    end
    object N6: TMenuItem
      Action = BtnSave
    end
    object N7: TMenuItem
      Action = BtnApply
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Action = BtnPrint
    end
    object N10: TMenuItem
      Action = BtnHistory
    end
    object N11: TMenuItem
      Action = BtnSub
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Action = BtnDicTw
    end
    object N14: TMenuItem
      Action = BtnDel
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object N16: TMenuItem
      Action = BtnDetal
    end
    object N17: TMenuItem
      Action = BtnAnaliz
    end
    object N18: TMenuItem
      Action = BtnMarketing
    end
    object N19: TMenuItem
      Action = BtnMarketing
    end
    object N20: TMenuItem
      Caption = '-'
    end
    object N21: TMenuItem
      Action = BtnPrintCennik
    end
    object N22: TMenuItem
      Action = BtnPrintCennikAll
    end
    object N23: TMenuItem
      Caption = '-'
    end
    object N24: TMenuItem
      Action = BtnDicFrm
      Caption = 'Выбрать фирму...'
    end
    object N25: TMenuItem
      Action = BtnDicKln
      Caption = 'Выбрать поставщка...'
    end
  end
  object MemPns: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'PNS_ID'
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
        Size = 32
      end
      item
        Name = 'TW_KOL'
        DataType = ftFloat
      end
      item
        Name = 'TW_SUMM'
        DataType = ftFloat
      end
      item
        Name = 'PNS_NDS'
        DataType = ftFloat
      end
      item
        Name = 'PNS_NDS_SUMM'
        DataType = ftFloat
      end
      item
        Name = 'TW_COLOR'
        DataType = ftInteger
      end
      item
        Name = 'SERT_NUM'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'SERT_DATE'
        DataType = ftDate
      end
      item
        Name = 'SERT_WHO'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'SERT_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_SUMM_SEB'
        DataType = ftFloat
      end
      item
        Name = 'TW_SUMM_SEB2'
        DataType = ftFloat
      end
      item
        Name = 'TW_SUMM_SEB_ALL'
        DataType = ftFloat
      end
      item
        Name = 'PNS_SUB'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'POL_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_KOL2'
        DataType = ftFloat
      end
      item
        Name = 'TW_SUMM2'
        DataType = ftFloat
      end>
    BeforePost = MemPnsBeforePost
    OnCalcFields = MemPnsCalcFields
    Left = 316
    Top = 375
    object MemPnsPNS_ID: TIntegerField
      FieldName = 'PNS_ID'
      OnChange = MemPnsPNS_IDChange
    end
    object MemPnsTW_ID: TIntegerField
      FieldName = 'TW_ID'
      OnChange = MemPnsPNS_IDChange
    end
    object MemPnsTW_ART: TIntegerField
      FieldName = 'TW_ART'
      OnChange = MemPnsPNS_IDChange
    end
    object MemPnsTW_NAM: TStringField
      FieldName = 'TW_NAM'
      OnChange = MemPnsPNS_IDChange
      Size = 254
    end
    object MemPnsED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      OnChange = MemPnsPNS_IDChange
      Size = 32
    end
    object MemPnsTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      OnChange = MemPnsTW_KOLChange
      DisplayFormat = '#0.0000'
    end
    object MemPnsTW_SUMM: TFloatField
      FieldName = 'TW_SUMM'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.00'
    end
    object MemPnsPNS_NDS: TFloatField
      FieldName = 'PNS_NDS'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.0%'
    end
    object MemPnsPNS_NDS_SUMM: TFloatField
      FieldName = 'PNS_NDS_SUMM'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.00'
    end
    object MemPnsTW_MONEY: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_MONEY'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemPnsTW_COLOR: TIntegerField
      FieldName = 'TW_COLOR'
      OnChange = MemPnsPNS_IDChange
    end
    object MemPnsSERT_NUM: TStringField
      FieldName = 'SERT_NUM'
      OnChange = MemPnsPNS_IDChange
      Size = 254
    end
    object MemPnsSERT_DATE: TDateField
      FieldName = 'SERT_DATE'
      OnChange = MemPnsPNS_IDChange
    end
    object MemPnsSERT_WHO: TStringField
      FieldName = 'SERT_WHO'
      OnChange = MemPnsPNS_IDChange
      Size = 254
    end
    object MemPnsSERT_ID: TIntegerField
      FieldName = 'SERT_ID'
      OnChange = MemPnsPNS_IDChange
    end
    object MemPnsTW_SUMM_SEB: TFloatField
      FieldName = 'TW_SUMM_SEB'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.00'
    end
    object MemPnsTW_SUMM_SEB2: TFloatField
      FieldName = 'TW_SUMM_SEB2'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.00'
    end
    object MemPnsTW_SUMM_SEB_ALL: TFloatField
      FieldName = 'TW_SUMM_SEB_ALL'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.00'
    end
    object MemPnsTW_MONEY_SEB: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_MONEY_SEB'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemPnsTW_MONEY_SEB2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_MONEY_SEB2'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemPnsTW_MONEY_SEB_ALL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_MONEY_SEB_ALL'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemPnsTW_MONEY_MEN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_MONEY_MEN'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemPnsTW_SUMM_MEN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_SUMM_MEN'
      OnChange = MemPnsPNS_IDChange
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemPnsPNS_SUB: TStringField
      FieldName = 'PNS_SUB'
      OnChange = MemPnsPNS_IDChange
      Size = 252
    end
    object MemPnsPOL_ID: TIntegerField
      FieldName = 'POL_ID'
      OnChange = MemPnsPNS_IDChange
    end
    object MemPnsTW_KOL2: TFloatField
      FieldName = 'TW_KOL2'
      OnChange = MemPnsPNS_IDChange
    end
    object MemPnsTW_SUMM2: TFloatField
      FieldName = 'TW_SUMM2'
      OnChange = MemPnsPNS_IDChange
    end
  end
  object DsPns: TDataSource
    DataSet = MemPns
    OnDataChange = DsPnsDataChange
    Left = 316
    Top = 426
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 64
    Top = 415
  end
  object MemPns2: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'PNS2_ID'
        DataType = ftInteger
      end
      item
        Name = 'DOC'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'DOC_DATE'
        DataType = ftDate
      end
      item
        Name = 'KLN_ID'
        DataType = ftInteger
      end
      item
        Name = 'KLN_FULL'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'USL_ID'
        DataType = ftInteger
      end
      item
        Name = 'USL_FULL'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'NDS'
        DataType = ftFloat
      end
      item
        Name = 'NDS_SUMM'
        DataType = ftFloat
      end
      item
        Name = 'SUMM'
        DataType = ftFloat
      end
      item
        Name = 'MET'
        DataType = ftInteger
      end
      item
        Name = 'MET_FULL'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'PNS2_SUB'
        DataType = ftString
        Size = 252
      end>
    BeforePost = MemPns2BeforePost
    OnCalcFields = MemPns2CalcFields
    Left = 456
    Top = 401
    object MemPns2PNS2_ID: TIntegerField
      FieldName = 'PNS2_ID'
    end
    object MemPns2DOC: TStringField
      FieldName = 'DOC'
      Size = 252
    end
    object MemPns2DOC_DATE: TDateField
      FieldName = 'DOC_DATE'
    end
    object MemPns2KLN_ID: TIntegerField
      FieldName = 'KLN_ID'
    end
    object MemPns2KLN_FULL: TStringField
      FieldName = 'KLN_FULL'
      Size = 252
    end
    object MemPns2USL_ID: TIntegerField
      FieldName = 'USL_ID'
    end
    object MemPns2USL_FULL: TStringField
      FieldName = 'USL_FULL'
      Size = 252
    end
    object MemPns2NDS: TFloatField
      FieldName = 'NDS'
      DisplayFormat = '#0.0%'
    end
    object MemPns2NDS_SUMM: TFloatField
      FieldName = 'NDS_SUMM'
      DisplayFormat = '#0.00'
    end
    object MemPns2SUMM: TFloatField
      FieldName = 'SUMM'
      DisplayFormat = '#0.00'
    end
    object MemPns2MET: TIntegerField
      FieldName = 'MET'
    end
    object MemPns2MET_FULL: TStringField
      FieldName = 'MET_FULL'
      Size = 32
    end
    object MemPns2SUMM2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUMM2'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemPns2PNS2_SUB: TStringField
      FieldName = 'PNS2_SUB'
      Size = 252
    end
  end
  object DsPns2: TDataSource
    DataSet = MemPns2
    OnDataChange = DsPns2DataChange
    Left = 458
    Top = 449
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 160
    Top = 365
  end
  object PnDocTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 504
    Top = 341
  end
end
