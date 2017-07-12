object Doc_Email: TDoc_Email
  Left = 806
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Сообщение электронной почты'
  ClientHeight = 739
  ClientWidth = 1022
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1022
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton4: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton4'
      ImageIndex = 110
      OnClick = ToolButton4Click
    end
    object ToolButton5: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object BtnSave: TToolButton
      Left = 33
      Top = 2
      Hint = 'Сохранить (Ctrl+Enter)'
      Caption = 'BtnSave'
      ImageIndex = 39
      OnClick = BtnSaveClick
    end
    object BtnApply: TToolButton
      Left = 58
      Top = 2
      Hint = 'Применить (Ctrl+S)'
      Caption = 'BtnApply'
      ImageIndex = 38
      OnClick = BtnApplyClick
    end
    object BtnSend: TToolButton
      Left = 83
      Top = 2
      Hint = 'Отправить...(Ctrl+Enter)'
      Caption = 'BtnSend'
      ImageIndex = 53
      OnClick = BtnSendClick
    end
    object BtnReply: TToolButton
      Left = 108
      Top = 2
      Hint = 'Ответить'
      Caption = 'BtnReply'
      ImageIndex = 71
    end
    object ToolButton3: TToolButton
      Left = 133
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object BtnPrint: TToolButton
      Left = 141
      Top = 2
      Hint = 'Напечатать (F9)'
      Caption = 'BtnPrint'
      ImageIndex = 9
      OnClick = BtnPrintClick
    end
    object ToolButton2: TToolButton
      Left = 166
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object BtnDicTowar: TToolButton
      Left = 174
      Top = 2
      Hint = 'Товары по каталогу (F11)'
      Caption = 'BtnDicTowar'
      ImageIndex = 37
      OnClick = BtnDicTowarClick
    end
    object BtnNoDicTowar: TToolButton
      Left = 199
      Top = 2
      Hint = 'Товар не из каталога (Ctrl+F11)'
      Caption = 'BtnNoDicTowar'
      ImageIndex = 70
      OnClick = BtnNoDicTowarClick
    end
    object BtnREAL: TToolButton
      Left = 224
      Top = 2
      Hint = 'Подробная информация о реализации за 2 месяца'
      Caption = 'BtnREAL'
      ImageIndex = 112
      OnClick = BtnREALClick
    end
    object ToolButton8: TToolButton
      Left = 249
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 71
      Style = tbsSeparator
    end
    object BtnDel: TToolButton
      Left = 257
      Top = 2
      Hint = 'Удалить товар из электронной почты'
      Caption = 'BtnDel'
      ImageIndex = 2
      OnClick = BtnDelClick
    end
    object ToolButton1: TToolButton
      Left = 282
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object BtnDetal: TToolButton
      Left = 290
      Top = 2
      Hint = 'Подробно о товаре (F2)'
      Caption = 'BtnDetal'
      ImageIndex = 11
      OnClick = BtnDetalClick
    end
    object BtnAnaliz: TToolButton
      Left = 315
      Top = 2
      Hint = 'Анализ товара (F3)'
      Caption = 'BtnAnaliz'
      ImageIndex = 12
      OnClick = BtnAnalizClick
    end
    object BtnMarketing: TToolButton
      Left = 340
      Top = 2
      Hint = 'Маркетинговые данные товара (F4)'
      Caption = 'BtnMarketing'
      ImageIndex = 10
      OnClick = BtnMarketingClick
    end
    object ToolButton6: TToolButton
      Left = 365
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object BtnSubdoc: TToolButton
      Left = 373
      Top = 2
      Hint = 'Создать на основании'
      Caption = 'BtnSubdoc'
      ImageIndex = 24
      OnClick = BtnSubdocClick
    end
    object ToolButton7: TToolButton
      Left = 398
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object BtnExport: TToolButton
      Left = 406
      Top = 2
      Hint = 
        'Оформить перемещение на основании заявки и пометить как выполнен' +
        'ную'
      Caption = 'BtnExport'
      ImageIndex = 123
      OnClick = BtnExportClick
    end
    object ToolButton10: TToolButton
      Left = 431
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object MAIL_VID: TRxDBLookupCombo
      Left = 439
      Top = 2
      Width = 242
      Height = 24
      DropDownCount = 8
      LookupField = 'MAILVID_ID'
      LookupDisplay = 'MAILVID_NAM'
      LookupSource = DsMailVid
      TabOrder = 0
      OnChange = MAIL_VIDChange
    end
    object ToolButton9: TToolButton
      Left = 681
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object ShowOst: TCheckBox
      Left = 689
      Top = 2
      Width = 80
      Height = 24
      Hint = 
        'Автоматическое обновление быстрых остатков'#13#10'(без нажатия пробела' +
        ')'
      Caption = 'Автовывод'
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 719
    Width = 1022
    Height = 20
    Panels = <
      item
        Text = 'Состояние :'
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 350
      end
      item
        Width = 50
      end>
    SimplePanel = False
    SizeGrip = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 1022
    Height = 690
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1022
      Height = 157
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 1022
        Height = 157
        ActivePage = TabSheet4
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'Общая информация'
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 1014
            Height = 130
            Align = alClient
            TabOrder = 0
            object Label1: TLabel
              Left = 4
              Top = 28
              Width = 37
              Height = 12
              Caption = 'От кого :'
            end
            object Label2: TLabel
              Left = 16
              Top = 48
              Width = 28
              Height = 12
              Caption = 'Кому :'
            end
            object Label3: TLabel
              Left = 16
              Top = 68
              Width = 27
              Height = 12
              Caption = 'Тема :'
            end
            object Label20: TLabel
              Left = 422
              Top = 6
              Width = 27
              Height = 12
              Caption = 'Дата :'
            end
            object Label22: TLabel
              Left = 414
              Top = 28
              Width = 34
              Height = 12
              Caption = 'Номер :'
            end
            object Label4: TLabel
              Left = 4
              Top = 8
              Width = 34
              Height = 12
              Caption = 'Фирма :'
            end
            object Label35: TLabel
              Left = 236
              Top = 88
              Width = 52
              Height = 12
              Caption = 'Вид закупки'
            end
            object FROM_US: TEdit
              Left = 56
              Top = 24
              Width = 269
              Height = 20
              Enabled = False
              TabOrder = 0
              Text = 'Бритвин Сергей Юрьевич'
            end
            object TO_TXT: TEdit
              Left = 56
              Top = 44
              Width = 269
              Height = 20
              MaxLength = 254
              TabOrder = 1
              Text = 'Olimpiya@inbox.ru'
              OnChange = TO_TXTChange
            end
            object MAIL_TEM: TEdit
              Left = 56
              Top = 64
              Width = 709
              Height = 20
              MaxLength = 254
              TabOrder = 2
              OnChange = MAIL_TEMChange
            end
            object MAIL_CONF: TCheckBox
              Left = 56
              Top = 84
              Width = 153
              Height = 17
              Caption = 'Конфиденциальное сообщение'
              TabOrder = 3
              OnClick = MAIL_CONFClick
            end
            object MAIL_REPLY: TCheckBox
              Left = 56
              Top = 104
              Width = 129
              Height = 17
              Caption = 'Обязателен ответ'
              TabOrder = 4
              OnClick = MAIL_REPLYClick
            end
            object MAIL_DATE: TDateEdit
              Left = 452
              Top = 4
              Width = 121
              Height = 19
              Enabled = False
              NumGlyphs = 2
              TabOrder = 5
            end
            object MAIL_NUM2: TEdit
              Left = 452
              Top = 24
              Width = 121
              Height = 20
              Enabled = False
              TabOrder = 6
              Text = 'Новая'
            end
            object BtnTo: TBitBtn
              Left = 324
              Top = 44
              Width = 25
              Height = 21
              Hint = 'Выбрать получателя из справочника контактов'
              TabOrder = 7
              OnClick = BtnToClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888800000000000000080FFFFF000FFFFF080F0000F0F000
                00080F0FFF00FFFF0E080F0F00F0FFFF00080F0FFFF00FFF0B080F0FFF00F00F
                00080F0F00F00FFF0F080F0FFF00F00F00080F0F00F0FFFF0908000FFF080FFF
                0008880000888000088888888888888888888888888888888888}
            end
            object ToShop: TBitBtn
              Left = 348
              Top = 44
              Width = 25
              Height = 21
              Hint = 'Выбрать получателя - магазин'
              TabOrder = 8
              OnClick = ToShopClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888777777777
                777888000000000000788FFFFFFFFFFFF0788FFFFFFFFFFFF0788F0FCCCCFFCF
                F0788F0FFFFFFFCFF0788F0FFFFFFFCFF0788F000CCCCCCCC0788FFF0CCFFFFC
                F0788FFF0CCFFFCFF0788FCF0CCFFCFFF0788FFCFFFFCFFFF0788FFFCFFCFFFF
                F0788FFFFCCFFFFFF0888FFFFFFFFFFFF8888888888888888888}
            end
            object FRM: TRxDBLookupCombo
              Left = 56
              Top = 2
              Width = 317
              Height = 20
              DropDownCount = 8
              EscapeClear = False
              LookupField = 'KLN_ID'
              LookupDisplay = 'KLN_FULL'
              LookupSource = DataModule1.MainDsAllFrm
              TabOrder = 9
              OnChange = FRMChange
            end
            object MAIL_OPT_ROZN: TComboBox
              Left = 296
              Top = 88
              Width = 145
              Height = 20
              Style = csDropDownList
              ItemHeight = 12
              TabOrder = 10
              OnChange = MAIL_OPT_ROZNChange
              Items.Strings = (
                'РОЗНИЦА'
                'ОПТ')
            end
            object chk_forOOP: TCheckBox
              Left = 481
              Top = 91
              Width = 79
              Height = 14
              Caption = 'Для ООП'
              TabOrder = 11
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Текст сообщения'
          ImageIndex = 1
          object MAIL_TXT: TMemo
            Left = 0
            Top = 0
            Width = 1041
            Height = 130
            Align = alClient
            MaxLength = 10000
            TabOrder = 0
            OnChange = MAIL_TXTChange
          end
        end
        object TabSheet3: TTabSheet
          Caption = 'Дополнительная информация'
          ImageIndex = 2
          object Bevel1: TBevel
            Left = 0
            Top = 0
            Width = 1014
            Height = 53
            Align = alTop
          end
          object Label_from: TLabel
            Left = 4
            Top = 10
            Width = 142
            Height = 12
            Caption = 'Заявка на перемещение склада :'
          end
          object Label_to: TLabel
            Left = 368
            Top = 10
            Width = 43
            Height = 12
            Caption = 'на склад :'
          end
          object Label7: TLabel
            Left = 583
            Top = 10
            Width = 65
            Height = 12
            Caption = 'Масса заявки :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label24: TLabel
            Left = 100
            Top = 34
            Width = 54
            Height = 12
            Caption = 'Поставщик :'
          end
          object Label34: TLabel
            Left = 356
            Top = 34
            Width = 57
            Height = 12
            Caption = 'Покупатель :'
          end
          object SKL_FROM: TRxDBLookupCombo
            Left = 156
            Top = 6
            Width = 145
            Height = 20
            DropDownCount = 8
            LookupField = 'SKL_ID'
            LookupDisplay = 'SKL_SHORT'
            LookupSource = DataModule1.MainDsSkl
            TabOrder = 0
            OnChange = SKL_FROMChange
          end
          object SKL_TO: TRxDBLookupCombo
            Left = 416
            Top = 6
            Width = 141
            Height = 20
            DropDownCount = 8
            LookupField = 'SKL_ID'
            LookupDisplay = 'SKL_SHORT'
            LookupSource = DataModule1.MainDsSkl
            TabOrder = 1
            OnChange = SKL_TOChange
          end
          object Check: TCheckBox
            Left = 4
            Top = 34
            Width = 69
            Height = 17
            Caption = 'Одобрена'
            TabOrder = 2
            OnClick = CheckClick
          end
          object MAIL_OPIS: TMemo
            Left = 0
            Top = 53
            Width = 1014
            Height = 77
            Align = alClient
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 3
          end
          object ZAY_WEIGHT: TRxCalcEdit
            Left = 648
            Top = 6
            Width = 117
            Height = 19
            AutoSize = False
            DecimalPlaces = 4
            DirectInput = False
            DisplayFormat = ',0.00 кг'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ButtonWidth = 0
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 4
          end
          object PER_POST_ID: TRxDBLookupCombo
            Left = 156
            Top = 30
            Width = 145
            Height = 20
            DropDownCount = 8
            LookupField = 'KLN_ID'
            LookupDisplay = 'KLN_FULL'
            LookupSource = DataModule1.MainDsAllFrm
            TabOrder = 5
            OnChange = PER_POST_IDChange
          end
          object PER_FRM_ID: TRxDBLookupCombo
            Left = 416
            Top = 30
            Width = 141
            Height = 20
            DropDownCount = 8
            LookupField = 'KLN_ID'
            LookupDisplay = 'KLN_FULL'
            LookupSource = DataModule1.MainDsAllFrm
            TabOrder = 6
            OnChange = PER_FRM_IDChange
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Информация заявки на закупку'
          ImageIndex = 3
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 1014
            Height = 130
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label9: TLabel
              Left = 76
              Top = 4
              Width = 34
              Height = 12
              Caption = 'Номер :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 234
              Top = 4
              Width = 71
              Height = 12
              Caption = 'Валюта оплаты :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 412
              Top = 4
              Width = 36
              Height = 12
              Caption = 'Сумма :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 586
              Top = 4
              Width = 44
              Height = 12
              Caption = 'Прибыль :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label11: TLabel
              Left = 252
              Top = 24
              Width = 54
              Height = 12
              Caption = 'Поставщик :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 22
              Top = 24
              Width = 87
              Height = 12
              Caption = 'Дата утверждения :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label14: TLabel
              Left = 54
              Top = 44
              Width = 54
              Height = 12
              Caption = 'Основание :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label15: TLabel
              Left = 24
              Top = 62
              Width = 76
              Height = 12
              Caption = 'Склад разгрузки :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 50
              Top = 82
              Width = 59
              Height = 12
              Caption = 'Примечание :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 392
              Top = 98
              Width = 55
              Height = 24
              Caption = 'Примечание'#13#10'  директора :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 238
              Top = 64
              Width = 55
              Height = 12
              Caption = 'Вид оплаты :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 388
              Top = 64
              Width = 59
              Height = 12
              Caption = 'Оплатить до :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object ggg: TLabel
              Left = 584
              Top = 64
              Width = 48
              Height = 12
              Caption = 'Оплачено :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 578
              Top = 44
              Width = 53
              Height = 12
              Caption = 'Выполнено :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label5: TLabel
              Left = 418
              Top = 44
              Width = 28
              Height = 11
              Caption = 'Курс :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 46
              Top = 114
              Width = 63
              Height = 12
              Caption = 'Утверждение :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object Label23: TLabel
              Left = 389
              Top = 82
              Width = 67
              Height = 11
              Caption = 'Масса заявки :'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object MAIL_NUM: TEdit
              Left = 112
              Top = 0
              Width = 97
              Height = 19
              AutoSize = False
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = 'Новая'
            end
            object VALUTA_ID: TRxDBLookupCombo
              Left = 308
              Top = 0
              Width = 101
              Height = 20
              DropDownCount = 8
              EscapeClear = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              LookupField = 'VALUTA_ID'
              LookupDisplay = 'VALUTA_FULL'
              LookupSource = DsValuta
              ParentFont = False
              TabOrder = 1
              OnChange = VALUTA_IDChange
            end
            object SUMM: TRxCalcEdit
              Left = 450
              Top = 0
              Width = 117
              Height = 19
              AutoSize = False
              DisplayFormat = ',#0.00'
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 2
            end
            object PRIBYL: TRxCalcEdit
              Left = 632
              Top = 0
              Width = 100
              Height = 19
              AutoSize = False
              DisplayFormat = ',#0.00'
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 3
            end
            object BtnRefreshSumm: TBitBtn
              Left = 732
              Top = 0
              Width = 25
              Height = 19
              Hint = 'Обновить сумму заявки, прибыль и информацию в расчётных колонках'
              TabOrder = 4
              OnClick = BtnRefreshSummClick
              Glyph.Data = {
                EE000000424DEE000000000000007600000028000000100000000F0000000100
                0400000000007800000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
                FFFFFFFF000000000000FFFF0FEFEFEFEFE0F00F0E000E0000F0FB000FEFEF0F
                F0E0F7B00E000E0000F0F7FB00EFEFEFEFE0FF7FB0000E0000F00000FB00FF0F
                F0E07FBBBBB00E0000F0F7FB00EFEFEFEFE0FF7BB00000000000FF7FBB00FFFF
                FFFFFFF7FBB00FFFFFFFFFFF7FBB00FFFFFF}
            end
            object BtnMoney: TBitBtn
              Left = 756
              Top = 0
              Width = 23
              Height = 19
              Hint = 'Определить новые дополнительные цены'
              TabOrder = 5
              OnClick = BtnMoneyClick
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDD
                00DDDDD00DDDDD000000DDDD070000070DDDDD000000DDD0707777700DDDDD00
                0000DD077777777770DDDD000000DD07777777777F0DDD000000D07777777777
                700DDD000000D0777777777777700D000000D0777777777777770D000000D077
                00777770F7770D000000DD07FF00077F7700DD000000DDD007FFF77770DDDD00
                0000DDDDD00000700DDDDD000000DDDDDDDDDD00DDDDDD000000DDDDDDDDDDD0
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
            end
            object POST_FULL: TEdit
              Left = 308
              Top = 20
              Width = 323
              Height = 19
              AutoSize = False
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object UTW_DATE: TDateEdit
              Left = 112
              Top = 20
              Width = 121
              Height = 19
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 6
              OnChange = UTW_DATEChange
            end
            object MAIL_OSN: TEdit
              Left = 112
              Top = 40
              Width = 263
              Height = 19
              AutoSize = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 254
              ParentFont = False
              TabOrder = 9
              OnChange = MAIL_OSNChange
            end
            object SKL_RAZG: TRxDBLookupCombo
              Left = 112
              Top = 60
              Width = 121
              Height = 20
              DropDownCount = 8
              EscapeClear = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              LookupField = 'SKL_ID'
              LookupDisplay = 'SKL_SHORT'
              LookupSource = DataModule1.MainDsSkl
              ParentFont = False
              TabOrder = 11
              OnChange = SKL_RAZGChange
            end
            object PRIM1: TMemo
              Left = 112
              Top = 80
              Width = 265
              Height = 29
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 10000
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 15
              OnChange = PRIM1Change
            end
            object MAILOPL_ID: TRxDBLookupCombo
              Left = 306
              Top = 60
              Width = 69
              Height = 20
              DropDownCount = 8
              EscapeClear = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              LookupField = 'PNTYP_ID'
              LookupDisplay = 'PNTYP_SHORT'
              LookupSource = DsPnTyp
              ParentFont = False
              TabOrder = 12
              OnChange = MAILOPL_IDChange
            end
            object OPLDO_DATE: TDateEdit
              Left = 450
              Top = 60
              Width = 121
              Height = 19
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 13
              OnChange = OPLDO_DATEChange
            end
            object PRIM2: TMemo
              Left = 450
              Top = 96
              Width = 305
              Height = 33
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              MaxLength = 10000
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 16
              OnChange = PRIM2Change
            end
            object WYP_DATE: TDateEdit
              Left = 634
              Top = 40
              Width = 121
              Height = 19
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 10
              Visible = False
              OnChange = WYP_DATEChange
            end
            object OPL_DATE: TDateEdit
              Left = 634
              Top = 60
              Width = 121
              Height = 19
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 14
              Visible = False
              OnChange = OPL_DATEChange
            end
            object BtnPost: TBitBtn
              Left = 756
              Top = 20
              Width = 23
              Height = 19
              Hint = 'Выбрать поставщика из справочника контактов (F10)'
              TabOrder = 8
              OnClick = BtnPostClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888888888888800000000000000080FFFFF000FFFFF080F0000F0F000
                00080F0FFF00FFFF0E080F0F00F0FFFF00080F0FFFF00FFF0B080F0FFF00F00F
                00080F0F00F00FFF0F080F0FFF00F00F00080F0F00F0FFFF0908000FFF080FFF
                0008880000888000088888888888888888888888888888888888}
            end
            object KLN_EMAIL: TEdit
              Left = 632
              Top = 20
              Width = 121
              Height = 19
              AutoSize = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 17
              Text = 'KLN_EMAIL'
            end
            object MAIL_KURS: TRxCalcEdit
              Left = 450
              Top = 40
              Width = 121
              Height = 19
              AutoSize = False
              DecimalPlaces = 4
              DisplayFormat = ',0.0000 руб/USD##'
              Enabled = False
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 18
            end
            object UTW_NEW: TComboBox
              Left = 112
              Top = 110
              Width = 263
              Height = 20
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ItemHeight = 12
              ParentFont = False
              TabOrder = 19
              Text = 'UTW_NEW'
              OnChange = UTW_NEWChange
              Items.Strings = (
                'Только коммерческим директором'
                'Менеджером по розничным продажам'
                'Менеджером по оптовым продажам'
                'Менеджерами по розничным и оптовым продажам')
            end
            object ZAY_WEIGHT1: TRxCalcEdit
              Left = 450
              Top = 78
              Width = 121
              Height = 18
              AutoSize = False
              DecimalPlaces = 4
              DirectInput = False
              DisplayFormat = ',0.00 кг'
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ButtonWidth = 0
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 20
            end
          end
        end
        object tabAutoCalc: TTabSheet
          Caption = 'Пересчет цен'
          ImageIndex = 4
          object GroupBox2: TGroupBox
            Left = 4
            Top = 0
            Width = 401
            Height = 106
            Caption = 'Авто пересчет цен'
            TabOrder = 0
            object Label30: TLabel
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
            object Label31: TLabel
              Left = 212
              Top = 20
              Width = 20
              Height = 12
              Caption = '% от'
            end
            object Label32: TLabel
              Left = 8
              Top = 56
              Width = 83
              Height = 12
              Caption = 'Способ округления'
            end
            object price_dest: TComboBox
              Left = 8
              Top = 16
              Width = 121
              Height = 20
              Style = csDropDownList
              ItemHeight = 12
              TabOrder = 0
              Items.Strings = (
                'Новая РЦ'
                'Новая ОЦ'
                'Новая КОЦ'
                'Новая СПЕЦ'
                'Новая Цена ПП'
                'Новая СПЕЦ2'
                'Новая Цена7'
                'новая Цена0')
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
              Height = 20
              Style = csDropDownList
              ItemHeight = 12
              TabOrder = 2
              Items.Strings = (
                'Новой цены закупки'
                'Старой розничной цены'
                'Старой оптовой цены'
                'Старой кр. оптовой цены'
                'Старой спец. цены'
                'Старой цены перепродажи'
                'Старой спец. цены 2'
                'Старой Цены7'
                'Старой Цены0')
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
              Height = 20
              Style = csDropDownList
              ItemHeight = 12
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
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Комментарии к заявке'
          ImageIndex = 5
          OnShow = TabSheet5Show
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 1014
            Height = 130
            Align = alClient
            TabOrder = 0
            object Label36: TLabel
              Left = 600
              Top = 44
              Width = 148
              Height = 84
              Caption = 
                'при редактировании комментария сохранять заявку не надо'#13#10'Коммент' +
                'арий сохраняется автомтически'#13#10'если сохранить заявку - она перей' +
                'дет в состояние "для утверждения"'
              Color = clBtnFace
              Font.Charset = RUSSIAN_CHARSET
              Font.Color = clRed
              Font.Height = -9
              Font.Name = 'Arial'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              WordWrap = True
            end
            object gridComments: TRxDBGrid
              Left = 4
              Top = 16
              Width = 589
              Height = 100
              DataSource = dsComments
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = RUSSIAN_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'Arial'
              TitleFont.Style = []
              OnDblClick = gridCommentsDblClick
            end
            object Button2: TButton
              Left = 620
              Top = 16
              Width = 145
              Height = 25
              Caption = 'Добавить комментарий'
              TabOrder = 1
              OnClick = Button2Click
            end
            object CheckListBox1: TCheckListBox
              Left = 780
              Top = 7
              Width = 215
              Height = 117
              ItemHeight = 12
              TabOrder = 2
            end
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 157
      Width = 1022
      Height = 533
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 1022
        Height = 354
        Align = alClient
        DataSource = DsMails
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = RxDBGrid1GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'num'
            Title.Caption = '№'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_ART'
            Title.Alignment = taCenter
            Title.Caption = 'Код'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_NAM'
            Title.Alignment = taCenter
            Title.Caption = 'Наименование'
            Width = 184
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ED_SHORT'
            Title.Alignment = taCenter
            Title.Caption = 'Ед.'
            Width = 28
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONEY_ZAK'
            Title.Alignment = taCenter
            Title.Caption = 'Закупка'
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_KOL'
            Title.Alignment = taCenter
            Title.Caption = 'Кол-во'
            Width = 68
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
            Expanded = False
            FieldName = 'TW_PERCENT'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Наценка'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_PRIBYL'
            Title.Alignment = taCenter
            Title.Caption = 'Прибыль'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MAILS_SPEED'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Скорость'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NEW_MROZ'
            Title.Alignment = taCenter
            Title.Caption = 'Новая РЦ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TW_MROZ'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Розн. цена'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'new_money1'
            Title.Caption = 'Новая ОЦ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'old_money1'
            ReadOnly = True
            Title.Caption = 'Старая ОЦ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'new_money2'
            Title.Caption = 'Новая КОЦ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'old_money2'
            ReadOnly = True
            Title.Caption = 'Старая КОЦ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'new_money3'
            Title.Caption = 'Новая СЦ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'old_money3'
            ReadOnly = True
            Title.Caption = 'Старая СЦ'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'new_money4'
            Title.Caption = 'Новая ЦПП'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'old_money4'
            Title.Caption = 'Старая ЦПП'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'new_money6'
            Title.Caption = 'Новая СЦ2'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'old_money6'
            Title.Caption = 'Старая СЦ2'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'new_money7'
            Title.Caption = 'Новая Ц7'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'old_money7'
            Title.Caption = 'Старая Ц7'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'new_money8'
            Title.Caption = 'Новая Ц0'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'old_money8'
            Title.Caption = 'Старая Ц0'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MAILS_PRIM'
            Title.Alignment = taCenter
            Title.Caption = 'Примечания'
            Width = 215
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MAILS_WEIGHT'
            Title.Caption = 'Масса, кг'
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 0
        Top = 354
        Width = 1022
        Height = 179
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 1022
          Height = 73
          Align = alTop
          Alignment = taRightJustify
          BevelOuter = bvNone
          TabOrder = 0
          object TITLE1: TLabel
            Left = 23
            Top = 6
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object TITLE2: TLabel
            Left = 155
            Top = 6
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object TITLE3: TLabel
            Left = 283
            Top = 6
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object TITLE4: TLabel
            Left = 419
            Top = 6
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object TITLE5: TLabel
            Left = 551
            Top = 6
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object TITLE6: TLabel
            Left = 679
            Top = 6
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object TITLE8: TLabel
            Left = 152
            Top = 26
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object TITLE7: TLabel
            Left = 23
            Top = 26
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object TITLE9: TLabel
            Left = 280
            Top = 26
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object TITLE10: TLabel
            Left = 420
            Top = 26
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object TITLE11: TLabel
            Left = 552
            Top = 26
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object TITLE12: TLabel
            Left = 680
            Top = 26
            Width = 32
            Height = 12
            Alignment = taRightJustify
            Caption = 'Склад :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label25: TLabel
            Left = 288
            Top = 50
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
            Left = 417
            Top = 50
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
            Left = 549
            Top = 50
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
          object Label28: TLabel
            Left = 31
            Top = 50
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
          object Label29: TLabel
            Left = 1109
            Top = 57
            Width = 14
            Height = 12
            Alignment = taRightJustify
            Caption = 'ПП'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label33: TLabel
            Left = 155
            Top = 50
            Width = 28
            Height = 12
            Alignment = taRightJustify
            Caption = 'Розн 1'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label37: TLabel
            Left = 680
            Top = 50
            Width = 19
            Height = 12
            Alignment = taRightJustify
            Caption = 'СЦ2'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object Label38: TLabel
            Left = 802
            Top = 50
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
          object Label39: TLabel
            Left = 919
            Top = 50
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
          object RASP1: TDBEdit
            Left = 58
            Top = 2
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP1'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 0
            Visible = False
          end
          object RASP2: TDBEdit
            Left = 190
            Top = 2
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP2'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 1
            Visible = False
          end
          object RASP3: TDBEdit
            Left = 318
            Top = 2
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP3'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
          object RASP4: TDBEdit
            Left = 454
            Top = 2
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP4'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 3
            Visible = False
          end
          object RASP5: TDBEdit
            Left = 586
            Top = 2
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP5'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 4
            Visible = False
          end
          object RASP6: TDBEdit
            Left = 714
            Top = 2
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP6'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 5
            Visible = False
          end
          object RASP7: TDBEdit
            Left = 58
            Top = 22
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP7'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 6
            Visible = False
          end
          object RASP8: TDBEdit
            Left = 190
            Top = 22
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP8'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 7
            Visible = False
          end
          object RASP9: TDBEdit
            Left = 318
            Top = 22
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP9'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 8
            Visible = False
          end
          object RASP10: TDBEdit
            Left = 454
            Top = 22
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP10'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 9
            Visible = False
          end
          object RASP11: TDBEdit
            Left = 586
            Top = 22
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP11'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 10
            Visible = False
          end
          object RASP12: TDBEdit
            Left = 714
            Top = 22
            Width = 65
            Height = 19
            AutoSize = False
            DataField = 'RASP12'
            DataSource = DsMails
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            MaxLength = 11
            ParentFont = False
            TabOrder = 11
            Visible = False
          end
          object Edit1: TEdit
            Left = 308
            Top = 45
            Width = 85
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object Edit2: TEdit
            Left = 454
            Top = 45
            Width = 83
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object Edit3: TEdit
            Left = 576
            Top = 45
            Width = 85
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
          object edit4: TEdit
            Left = 57
            Top = 45
            Width = 84
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
          end
          object Edit5: TEdit
            Left = 1128
            Top = 51
            Width = 85
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
          end
          object Edit6: TEdit
            Left = 189
            Top = 45
            Width = 84
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
          end
          object Edit7: TEdit
            Left = 704
            Top = 45
            Width = 85
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
          end
          object Edit8: TEdit
            Left = 834
            Top = 45
            Width = 85
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 19
          end
          object Edit9: TEdit
            Left = 951
            Top = 45
            Width = 85
            Height = 21
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 20
          end
        end
        object RxDBGrid2: TRxDBGrid
          Left = 0
          Top = 73
          Width = 1022
          Height = 106
          Align = alClient
          DataSource = DsFastInfo
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = RUSSIAN_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'VID'
              Title.Alignment = taCenter
              Title.Caption = 'Вид'
              Width = 129
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
  end
  object MailTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 52
    Top = 242
  end
  object QrValuta: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = MailTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select VALUTA_ID, VALUTA_SHORT, VALUTA_FULL'
      'from valuta order by valuta_id')
    Left = 124
    Top = 242
    object QrValutaVALUTA_ID: TIntegerField
      FieldName = 'VALUTA_ID'
      Required = True
    end
    object QrValutaVALUTA_SHORT: TIBStringField
      FieldName = 'VALUTA_SHORT'
      Required = True
      Size = 32
    end
    object QrValutaVALUTA_FULL: TIBStringField
      FieldName = 'VALUTA_FULL'
      Required = True
      Size = 254
    end
  end
  object DsValuta: TDataSource
    DataSet = QrValuta
    Left = 124
    Top = 290
  end
  object QrPnTyp: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = MailTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select PNTYP_ID, PNTYP_SHORT from PNTYP'
      'order by PNTYP_ID')
    Left = 272
    Top = 242
    object QrPnTypPNTYP_ID: TIntegerField
      FieldName = 'PNTYP_ID'
      Required = True
    end
    object QrPnTypPNTYP_SHORT: TIBStringField
      FieldName = 'PNTYP_SHORT'
      Required = True
      Size = 32
    end
  end
  object DsPnTyp: TDataSource
    DataSet = QrPnTyp
    Left = 272
    Top = 290
  end
  object MemMails: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'MAILS_ID'
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
        Name = 'OST'
        DataType = ftFloat
      end
      item
        Name = 'TW_KOL'
        DataType = ftFloat
      end
      item
        Name = 'TW_KOL_OLD'
        DataType = ftFloat
      end
      item
        Name = 'MONEY_ZAK'
        DataType = ftFloat
      end
      item
        Name = 'NEW_MROZ'
        DataType = ftFloat
      end
      item
        Name = 'MAILS_SPEED'
        DataType = ftFloat
      end
      item
        Name = 'MAILS_PRIM'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'TW_MROZ'
        DataType = ftFloat
      end
      item
        Name = 'TWKTG_COLOR'
        DataType = ftInteger
      end
      item
        Name = 'RASP1'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP2'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP3'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP4'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP5'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP6'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP7'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP8'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP9'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP10'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP11'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP12'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP13'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP14'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP15'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP16'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP17'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP18'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP19'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'RASP20'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'VALUTA_ID'
        DataType = ftInteger
      end
      item
        Name = 'TWKTG_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_RASPR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OLD_MZAK'
        DataType = ftFloat
      end
      item
        Name = 'TW_WEIGHT'
        DataType = ftFloat
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
        Name = 'MET_MONEY_SHOP'
        DataType = ftInteger
      end
      item
        Name = 'new_money4'
        DataType = ftFloat
      end
      item
        Name = 'old_money4'
        DataType = ftFloat
      end
      item
        Name = 'num'
        DataType = ftInteger
      end
      item
        Name = 'new_money6'
        DataType = ftFloat
      end
      item
        Name = 'old_money6'
        DataType = ftFloat
      end
      item
        Name = 'new_money7'
        DataType = ftFloat
      end
      item
        Name = 'old_money7'
        DataType = ftFloat
      end
      item
        Name = 'new_money8'
        DataType = ftFloat
      end
      item
        Name = 'old_money8'
        DataType = ftFloat
      end>
    AfterInsert = MemMailsAfterInsert
    AfterPost = MemMailsAfterScroll
    AfterDelete = MemMailsAfterScroll
    BeforeScroll = MemMailsBeforeScroll
    AfterScroll = MemMailsAfterScroll
    OnCalcFields = MemMailsOnCalcFields
    Left = 364
    Top = 242
    object MemMailsMAILS_ID: TIntegerField
      FieldName = 'MAILS_ID'
    end
    object MemMailsTW_ID: TIntegerField
      FieldName = 'TW_ID'
    end
    object MemMailsTW_ART: TIntegerField
      FieldName = 'TW_ART'
    end
    object MemMailsTW_NAM: TStringField
      FieldName = 'TW_NAM'
      Size = 254
    end
    object MemMailsED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      Size = 32
    end
    object MemMailsOST: TFloatField
      FieldName = 'OST'
      DisplayFormat = '#0.0000'
    end
    object MemMailsTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      OnChange = MemMailsTW_KOLChange
      DisplayFormat = '#0.0000'
    end
    object MemMailsTW_KOL_OLD: TFloatField
      FieldName = 'TW_KOL_OLD'
      DisplayFormat = '#0.0000'
    end
    object MemMailsMONEY_ZAK: TFloatField
      FieldName = 'MONEY_ZAK'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsNEW_MROZ: TFloatField
      FieldName = 'NEW_MROZ'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsMAILS_SPEED: TFloatField
      FieldName = 'MAILS_SPEED'
      DisplayFormat = '#0.0000'
    end
    object MemMailsMAILS_PRIM: TStringField
      FieldName = 'MAILS_PRIM'
      Size = 254
    end
    object MemMailsTW_PERCENT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_PERCENT'
      DisplayFormat = '#0.0000%'
      Calculated = True
    end
    object MemMailsTW_MROZ: TFloatField
      FieldName = 'TW_MROZ'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsTWKTG_COLOR: TIntegerField
      FieldName = 'TWKTG_COLOR'
    end
    object MemMailsRASP1: TStringField
      FieldName = 'RASP1'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP2: TStringField
      FieldName = 'RASP2'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP3: TStringField
      FieldName = 'RASP3'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP4: TStringField
      FieldName = 'RASP4'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP5: TStringField
      FieldName = 'RASP5'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP6: TStringField
      FieldName = 'RASP6'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP7: TStringField
      FieldName = 'RASP7'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP8: TStringField
      FieldName = 'RASP8'
      EditMask = '99999/99999;1;_'
      Size = 64
      Transliterate = False
    end
    object MemMailsRASP9: TStringField
      FieldName = 'RASP9'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP10: TStringField
      FieldName = 'RASP10'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP11: TStringField
      FieldName = 'RASP11'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP12: TStringField
      FieldName = 'RASP12'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP13: TStringField
      FieldName = 'RASP13'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP14: TStringField
      FieldName = 'RASP14'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP15: TStringField
      FieldName = 'RASP15'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP16: TStringField
      FieldName = 'RASP16'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP17: TStringField
      FieldName = 'RASP17'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP18: TStringField
      FieldName = 'RASP18'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP19: TStringField
      FieldName = 'RASP19'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsRASP20: TStringField
      FieldName = 'RASP20'
      EditMask = '99999/99999;1;_'
      Size = 64
    end
    object MemMailsVALUTA_ID: TIntegerField
      FieldName = 'VALUTA_ID'
    end
    object MemMailsTWKTG_ID: TIntegerField
      FieldName = 'TWKTG_ID'
    end
    object MemMailsTW_RASPR: TStringField
      FieldName = 'TW_RASPR'
      Size = 1
    end
    object MemMailsOLD_MZAK: TFloatField
      FieldName = 'OLD_MZAK'
    end
    object MemMailsTW_PRIBYL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_PRIBYL'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemMailsTW_WEIGHT: TFloatField
      FieldName = 'TW_WEIGHT'
    end
    object MemMailsMAILS_WEIGHT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MAILS_WEIGHT'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemMailsnew_money1: TFloatField
      FieldName = 'new_money1'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsold_money1: TFloatField
      FieldName = 'old_money1'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsnew_money2: TFloatField
      FieldName = 'new_money2'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsold_money2: TFloatField
      FieldName = 'old_money2'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsnewmoney3: TFloatField
      FieldName = 'new_money3'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsold_money3: TFloatField
      FieldName = 'old_money3'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsMET_MONEY_SHOP: TIntegerField
      FieldName = 'MET_MONEY_SHOP'
    end
    object MemMailsnew_money4: TFloatField
      FieldName = 'new_money4'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsold_money4: TFloatField
      FieldName = 'old_money4'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsnum: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'num'
    end
    object MemMailsnew_money6: TFloatField
      FieldName = 'new_money6'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsold_money6: TFloatField
      FieldName = 'old_money6'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsnew_money7: TFloatField
      FieldName = 'new_money7'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsold_money7: TFloatField
      FieldName = 'old_money7'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsnew_money8: TFloatField
      FieldName = 'new_money8'
      DisplayFormat = '#0.00 руб'
    end
    object MemMailsold_money8: TFloatField
      FieldName = 'old_money8'
      DisplayFormat = '#0.00 руб'
    end
  end
  object DsMails: TDataSource
    DataSet = MemMails
    OnDataChange = DsMailsDataChange
    Left = 360
    Top = 290
  end
  object PopupMenu1: TPopupMenu
    Left = 206
    Top = 455
    object MnSave: TMenuItem
      Caption = 'Сохранить сообщение'
      ShortCut = 16397
      OnClick = BtnSaveClick
    end
    object MnApply2: TMenuItem
      Caption = 'Применить'
      ImageIndex = 38
      ShortCut = 16467
      OnClick = BtnApplyClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать'
      ShortCut = 120
    end
    object MnApply: TMenuItem
      Caption = '-'
      OnClick = BtnApplyClick
    end
    object N10: TMenuItem
      Caption = 'Выбрать фирму'
      ShortCut = 16505
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MnDicTowar: TMenuItem
      Caption = 'Товары по каталогу'
      ShortCut = 122
      OnClick = BtnDicTowarClick
    end
    object MnNoDicTowar: TMenuItem
      Caption = 'Товар не из каталога'
      ShortCut = 16506
      OnClick = BtnNoDicTowarClick
    end
    object MnReal: TMenuItem
      Caption = 'Подробная информация о реализации'
      ImageIndex = 112
      ShortCut = 123
      OnClick = BtnREALClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnDel: TMenuItem
      Caption = 'Удалить товар из сообщения'
      OnClick = BtnDelClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MnDetal: TMenuItem
      Caption = 'Подробно о товаре'
      ShortCut = 113
      OnClick = BtnDetalClick
    end
    object MnAnaliz: TMenuItem
      Caption = 'Анализ товара'
      ShortCut = 114
      OnClick = BtnAnalizClick
    end
    object MnMarketing: TMenuItem
      Caption = 'Маркетинговые данные товара'
      ShortCut = 115
      OnClick = BtnMarketingClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object MnPost: TMenuItem
      Caption = 'Выбрать поставщика'
      ShortCut = 121
      OnClick = BtnPostClick
    end
    object N6: TMenuItem
      Caption = 'Обновить сумму'
      OnClick = BtnRefreshSummClick
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object MnSubdoc: TMenuItem
      Caption = 'Создать на основании'
      ImageIndex = 24
      OnClick = BtnSubdocClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Caption = 'Показать оригинальное кол-во'
      OnClick = N8Click
    end
    object N11: TMenuItem
      Caption = 'Обновить закупочные цены'
      OnClick = N11Click
    end
  end
  object Query1Transaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 448
    Top = 293
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 444
    Top = 245
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 900
    OnTimer = Timer1Timer
    Left = 520
    Top = 246
  end
  object QrMailVID: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = MailTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from mailvid_dostup(:us_id,:mail_id) order by mailvid_n' +
        'am')
    Left = 736
    Top = 242
    ParamData = <
      item
        DataType = ftInteger
        Name = 'us_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'mail_id'
        ParamType = ptInput
      end>
    object QrMailVIDMAILVID_ID: TIntegerField
      FieldName = 'MAILVID_ID'
      Required = True
    end
    object QrMailVIDMAILVID_NAM: TIBStringField
      FieldName = 'MAILVID_NAM'
      Size = 64
    end
  end
  object DsMailVid: TDataSource
    DataSet = QrMailVID
    Left = 736
    Top = 294
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 416
    Top = 495
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 282
    Top = 457
  end
  object SakMsg1: TSakMsg
    CharSet = 'ISO-8859-1'
    Left = 78
    Top = 434
  end
  object SakSMTP1: TSakSMTP
    Port = '25'
    SendProgressStep = 2
    TimeOut = 30000
    Left = 110
    Top = 434
  end
  object QrFastInfo: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FastInfoTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from fast_info(:tw_id,:speed)')
    Left = 592
    Top = 293
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tw_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'speed'
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
  object FastInfoTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 592
    Top = 241
  end
  object DsFastInfo: TDataSource
    DataSet = QrFastInfo
    Left = 676
    Top = 241
  end
  object memComments: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'KLN_ID'
        DataType = ftInteger
      end
      item
        Name = 'US_FIO'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'TM'
        DataType = ftDateTime
      end
      item
        Name = 'COMMENT'
        DataType = ftString
        Size = 2000
      end
      item
        Name = 'SOGL'
        DataType = ftInteger
      end
      item
        Name = 'MAIL_COMMENT_ID'
        DataType = ftInteger
      end>
    OnCalcFields = memCommentsCalcFields
    Left = 248
    Top = 100
    object memCommentsKLN_ID: TIntegerField
      DisplayWidth = 13
      FieldName = 'KLN_ID'
      Visible = False
    end
    object memCommentsUS_FIO: TStringField
      DisplayLabel = 'Пользователь'
      DisplayWidth = 22
      FieldName = 'US_FIO'
      Size = 250
    end
    object memCommentsTM: TDateTimeField
      DisplayLabel = 'Дата'
      DisplayWidth = 16
      FieldName = 'TM'
    end
    object memCommentsCOMMENT: TStringField
      DisplayLabel = 'Комментарий'
      DisplayWidth = 50
      FieldName = 'COMMENT'
      Size = 2000
    end
    object memCommentsSOGL: TIntegerField
      FieldName = 'SOGL'
      Visible = False
    end
    object memCommentsSOGL_TXT: TStringField
      DisplayLabel = 'Согласование'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'SOGL_TXT'
      Calculated = True
    end
    object memCommentsMAIL_COMMENT_ID: TIntegerField
      DisplayWidth = 22
      FieldName = 'MAIL_COMMENT_ID'
      Visible = False
    end
  end
  object dsComments: TDataSource
    DataSet = memComments
    Left = 404
    Top = 92
  end
end
