object Edit_CARD: TEdit_CARD
  Left = -32
  Top = 231
  Width = 1130
  Height = 800
  Caption = 'Дисконтная пластиковая карта'
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 28
    Top = 40
    Width = 74
    Height = 13
    Caption = 'Номер карты :'
  end
  object Label2: TLabel
    Left = 33
    Top = 90
    Width = 69
    Height = 13
    Caption = 'Дата выдачи:'
  end
  object Label3: TLabel
    Left = 388
    Top = 41
    Width = 42
    Height = 13
    Caption = 'Клиент :'
  end
  object Label4: TLabel
    Left = 43
    Top = 259
    Width = 59
    Height = 13
    Caption = 'Кто выдал :'
  end
  object Label5: TLabel
    Left = 33
    Top = 114
    Width = 69
    Height = 13
    Caption = 'Сумма плюс :'
  end
  object Bevel1: TBevel
    Left = 16
    Top = 344
    Width = 1081
    Height = 7
    Shape = bsTopLine
  end
  object Label6: TLabel
    Left = 28
    Top = 354
    Width = 87
    Height = 13
    Caption = 'Сумма на карте :'
  end
  object Label7: TLabel
    Left = 264
    Top = 354
    Width = 135
    Height = 13
    Caption = 'Сумма скидок составила :'
  end
  object Label8: TLabel
    Left = 59
    Top = 163
    Width = 43
    Height = 13
    Caption = 'Скидки :'
  end
  object Label9: TLabel
    Left = 51
    Top = 194
    Width = 51
    Height = 26
    Caption = 'Описание'#13#10'   скидок :'
  end
  object Label10: TLabel
    Left = 548
    Top = 354
    Width = 95
    Height = 13
    Caption = 'Текущий процент :'
  end
  object Label11: TLabel
    Left = 40
    Top = 139
    Width = 62
    Height = 13
    Caption = 'Основание :'
  end
  object Label12: TLabel
    Left = 6
    Top = 65
    Width = 96
    Height = 13
    Caption = 'Дата регистрации:'
  end
  object Label17: TLabel
    Left = 46
    Top = 235
    Width = 56
    Height = 13
    Caption = 'Кто зарег.:'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1106
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton1'
      ImageIndex = 110
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object BtnSAVE: TToolButton
      Left = 33
      Top = 2
      Hint = 'Сохранить (Ctrl+Enter)'
      Caption = 'BtnSAVE'
      ImageIndex = 39
      OnClick = BtnSAVEClick
    end
    object BtnApply: TToolButton
      Left = 58
      Top = 2
      Hint = 'Применить '
      Caption = 'BtnApply'
      ImageIndex = 38
      OnClick = BtnApplyClick
    end
    object ToolButton3: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 91
      Top = 2
      Hint = 'Напечатать покупки по пластиковой карте (F9)'
      Caption = 'ToolButton4'
      ImageIndex = 9
      Visible = False
    end
    object ToolButton5: TToolButton
      Left = 116
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object BtnDel: TToolButton
      Left = 124
      Top = 2
      Hint = 'Удалить с карточки покупки по выбранной накладной (DEL)'
      Caption = 'BtnDel'
      ImageIndex = 2
      Visible = False
      OnClick = BtnDelClick
    end
    object BtnExportToExcel: TToolButton
      Left = 149
      Top = 2
      Hint = 'Выгрузить информацию о карте в MS Excel'
      Caption = 'Выгрузить информацию о карте в MS Excel'
      ImageIndex = 141
      OnClick = BtnExportToExcelClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 371
    Width = 1106
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object CARD_NUM: TEdit
    Left = 104
    Top = 36
    Width = 121
    Height = 24
    Enabled = False
    TabOrder = 1
    Text = 'CARD_NUM'
  end
  object CARD_DATE: TDateEdit
    Left = 104
    Top = 85
    Width = 121
    Height = 21
    Enabled = False
    NumGlyphs = 2
    TabOrder = 3
  end
  object KLN_FULL: TEdit
    Left = 432
    Top = 37
    Width = 289
    Height = 24
    Enabled = False
    TabOrder = 10
    Text = 'KLN_FULL'
  end
  object Button1: TButton
    Left = 727
    Top = 37
    Width = 25
    Height = 21
    Caption = '...'
    TabOrder = 11
    Visible = False
    OnClick = Button1Click
  end
  object US_FULL: TEdit
    Left = 104
    Top = 256
    Width = 264
    Height = 24
    Enabled = False
    TabOrder = 9
    Text = 'US_FULL'
  end
  object CARD_ADDSUMM: TRxCalcEdit
    Left = 104
    Top = 110
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',#0.00 руб'
    NumGlyphs = 2
    TabOrder = 4
    OnChange = CARD_ADDSUMMChange
  end
  object CARD_SUMM: TRxCalcEdit
    Left = 120
    Top = 350
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',#0.00 руб'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 13
  end
  object SKID_SUMM: TRxCalcEdit
    Left = 404
    Top = 350
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',#0.00 руб'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 14
  end
  object CARD_SKID: TEdit
    Left = 104
    Top = 159
    Width = 265
    Height = 24
    TabOrder = 6
    Text = 'CARD_SKID'
    OnChange = CARD_SKIDChange
  end
  object SKID_OPIS: TMemo
    Left = 104
    Top = 183
    Width = 265
    Height = 45
    Enabled = False
    Lines.Strings = (
      'SKID_OPIS')
    TabOrder = 7
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 390
    Width = 1106
    Height = 387
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DsCards
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 16
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    OnKeyDown = RxDBGrid1KeyDown
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'RN_NUM_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Номер накладной'
        Width = 146
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
        FieldName = 'KLN_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Клиент'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RN_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKID_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма скидки'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Кто оформил'
        Width = 140
        Visible = True
      end>
  end
  object SKID_PERCENT: TRxCalcEdit
    Left = 648
    Top = 350
    Width = 89
    Height = 21
    AutoSize = False
    DecimalPlaces = 5
    DisplayFormat = ',#0.00000%'
    Enabled = False
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 15
  end
  object CARD_OSN: TEdit
    Left = 104
    Top = 135
    Width = 265
    Height = 24
    MaxLength = 254
    TabOrder = 5
    Text = 'CARD_OSN'
  end
  object REG_DATE: TDateEdit
    Left = 104
    Top = 60
    Width = 121
    Height = 21
    Enabled = False
    NumGlyphs = 2
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 385
    Top = 68
    Width = 368
    Height = 269
    Caption = ' Информация о клиенте '
    TabOrder = 12
    object Label14: TLabel
      Left = 12
      Top = 30
      Width = 74
      Height = 13
      Caption = 'ФИО клиента:'
    end
    object Label15: TLabel
      Left = 4
      Top = 54
      Width = 82
      Height = 13
      Caption = 'Дата рождения:'
    end
    object Label16: TLabel
      Left = 42
      Top = 77
      Width = 44
      Height = 26
      Alignment = taRightJustify
      Caption = 'Адрес '#13#10'клиента:'
    end
    object Label18: TLabel
      Left = 19
      Top = 127
      Width = 67
      Height = 26
      Alignment = taRightJustify
      Caption = 'Доп. '#13#10'информация:'
    end
    object Label13: TLabel
      Left = 40
      Top = 200
      Width = 45
      Height = 13
      Caption = 'Телефон'
    end
    object Label19: TLabel
      Left = 64
      Top = 232
      Width = 20
      Height = 13
      Caption = 'Пол'
    end
    object KLN_FIO: TEdit
      Left = 87
      Top = 26
      Width = 250
      Height = 24
      TabOrder = 0
      Text = 'KLN_FIO'
    end
    object KLN_BIRTHDAY: TDateEdit
      Left = 88
      Top = 50
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object KLN_ADDRESS: TMemo
      Left = 87
      Top = 73
      Width = 250
      Height = 48
      Lines.Strings = (
        'Описание '
        'в две строки')
      TabOrder = 2
    end
    object KLN_PHONE: TEdit
      Left = 88
      Top = 200
      Width = 249
      Height = 24
      TabOrder = 3
    end
    object RadioButton1: TRadioButton
      Left = 96
      Top = 232
      Width = 65
      Height = 17
      Caption = 'Муж'
      TabOrder = 4
    end
    object RadioButton2: TRadioButton
      Left = 192
      Top = 232
      Width = 57
      Height = 17
      Caption = 'Жен'
      TabOrder = 5
    end
  end
  object REG_USER_FULL: TEdit
    Left = 104
    Top = 231
    Width = 265
    Height = 24
    Enabled = False
    TabOrder = 8
    Text = 'REG_USER_FULL'
  end
  object KLN_ADDINFO: TRxRichEdit
    Left = 472
    Top = 192
    Width = 249
    Height = 57
    MaxLength = 9999
    TabOrder = 18
  end
  object GroupBox3: TGroupBox
    Left = 760
    Top = 72
    Width = 329
    Height = 169
    Caption = 'Где Вы встречали рекламу Олимпии?'
    TabOrder = 19
    object Label20: TLabel
      Left = 8
      Top = 136
      Width = 37
      Height = 13
      Caption = 'Другое'
    end
    object CheckBox1: TCheckBox
      Left = 255
      Top = 16
      Width = 137
      Height = 17
      Caption = 'постоянный клиент'
      TabOrder = 0
      Visible = False
    end
    object CheckBox2: TCheckBox
      Left = 281
      Top = 40
      Width = 137
      Height = 17
      Caption = 'Рекомендации'
      TabOrder = 1
      Visible = False
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 25
      Width = 137
      Height = 17
      Caption = 'Сайт'
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 281
      Top = 68
      Width = 137
      Height = 17
      Caption = 'Телевидение'
      TabOrder = 3
      Visible = False
    end
    object CheckBox5: TCheckBox
      Left = 8
      Top = 54
      Width = 137
      Height = 17
      Caption = 'Наружные щиты'
      TabOrder = 4
    end
    object CheckBox6: TCheckBox
      Left = 152
      Top = 23
      Width = 137
      Height = 17
      Caption = 'Радио'
      TabOrder = 5
    end
    object CheckBox7: TCheckBox
      Left = 152
      Top = 53
      Width = 137
      Height = 17
      Caption = 'Реклама на транспорте'
      TabOrder = 6
    end
    object CheckBox8: TCheckBox
      Left = 282
      Top = 90
      Width = 137
      Height = 17
      Caption = 'Реклама в лифтах'
      TabOrder = 7
      Visible = False
    end
    object CheckBox9: TCheckBox
      Left = 9
      Top = 81
      Width = 137
      Height = 17
      Caption = 'Листовки'
      TabOrder = 8
    end
    object KLN_REKLAMA_DOP: TEdit
      Left = 48
      Top = 132
      Width = 265
      Height = 24
      TabOrder = 9
    end
  end
  object check_sms: TCheckBox
    Left = 768
    Top = 248
    Width = 329
    Height = 17
    Caption = 'Согласен получать СМС уведомления'
    TabOrder = 20
  end
  object print_anketa: TButton
    Left = 781
    Top = 306
    Width = 113
    Height = 25
    Caption = 'Печать анкеты'
    TabOrder = 21
    OnClick = print_anketaClick
  end
  object check_pers_dann: TCheckBox
    Left = 768
    Top = 272
    Width = 329
    Height = 17
    Caption = 'Согласен на обработку персональных данных'
    TabOrder = 22
  end
  object CardsTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 124
    Top = 604
  end
  object QrCards: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = CardsTransaction
    AfterOpen = QrCardsAfterOpen
    AfterScroll = QrCardsAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_cards(:card_id)')
    Left = 200
    Top = 596
    ParamData = <
      item
        DataType = ftInteger
        Name = 'card_id'
        ParamType = ptInput
      end>
    object QrCardsRN_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_ID'
      ReadOnly = True
    end
    object QrCardsRN_NUM_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RN_NUM_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrCardsRN_DATE: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'RN_DATE'
      ReadOnly = True
    end
    object QrCardsRN_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_COLOR'
      ReadOnly = True
    end
    object QrCardsKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrCardsRN_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'RN_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00'
    end
    object QrCardsSKID_SUMM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'SKID_SUMM'
      ReadOnly = True
      DisplayFormat = ',#0.00'
    end
    object QrCardsUS_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'US_FULL'
      ReadOnly = True
      Size = 254
    end
    object QrCardsRN_TYP: TIntegerField
      FieldName = 'RN_TYP'
      Origin = 'LIST_CARDS.RN_TYP'
      Visible = False
    end
  end
  object DsCards: TDataSource
    DataSet = QrCards
    Left = 272
    Top = 668
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 284
    Top = 604
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 388
    Top = 612
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 12
    Top = 612
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    Left = 796
    Top = 517
    ReportForm = {
      18000000BD170000180000000001000100FFFFFFFFFF090000009A0B00003408
      00000000000000000000000000000000000001FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      010000040000000200CB0000000B004D61737465724461746131000201000000
      008400000030040000160200003000050001000000000000000000FFFFFF1F00
      00000001003100000000000000FFFF0000000000020000000100000000000000
      01000000C8000000140000000100000000000000004801000006004D656D6F32
      36000200380000009C000000E6010000DA010000430000000100000000000000
      0000FFFFFF1F2C020000000000000000000000FFFF0000000000020000000100
      0000000500417269616C000800000001000000000000000000CC000200000000
      00FFFFFF00000000020000000000000000003202000005004D656D6F31000200
      38000000A0000000C8010000260000004300000001000000000000000000FFFF
      FF1F2C02000000000002003500C0EDEAE5F2E020EFEEEBF3F7E0F2E5EBFF20E4
      E8F1EAEEEDF2EDEEE920EAE0F0F2FB20ECE0E3E0E7E8EDE02022CEEBE8ECEFE8
      FF220D3400E32E20DFF0EEF1EBE0E2EBFC2C20F22E2028343835322937323732
      38322C20687474703A2F2F7777772E3732373238322E72752F00000000FFFF00
      000000000200000001000000000500417269616C000A00000000000000000000
      000000CC00020000000000FFFFFF0000000002000000000000000000FD020000
      05004D656D6F3200020038000000C8000000D801000012000000430000000100
      0000000000000000FFFFFF1F2C02000000000001004D00C4E8F1EAEEEDF2EDE0
      FF20EAE0F0F2E0205B52784D656D6F727944617461312E22434152445F4E554D
      225D202020EEF220205B52784D656D6F727944617461312E22434152445F4441
      5445225D00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000000000000CC00020000000000FFFFFF00000000020000
      000000000000009B03000005004D656D6F3300020038000000E4000000D80100
      00120000004300000001000000000000000000FFFFFF1F2C0200000000000100
      2000D42EC82ECE2E205B52784D656D6F727944617461312E224B4C4E5F46494F
      225D00000000FFFF00000000000200000001000000000500417269616C000A00
      000000000000000000000000CC00020000000000FFFFFF000000000200000000
      00000000004704000005004D656D6F340002003800000000010000D800000014
      0000004300000001000000000000000000FFFFFF1F2C02000000000001002E00
      C4E0F2E020F0EEE6E4E5EDE8FF3A205B52784D656D6F727944617461312E224B
      4C4E5F4249525448444159225D2000000000FFFF000000000002000000010000
      00000500417269616C000A00000000000000000000000000CC00020000000000
      FFFFFF0000000002000000000000000000F404000005004D656D6F3500020038
      00000020010000D8010000120000004300000001000000000000000000FFFFFF
      1F2C02000000000001002F00C0E4F0E5F120EFF0EEE6E8E2E0EDE8FF3A205B52
      784D656D6F727944617461312E224B4C4E5F41444452455353225D00000000FF
      FF00000000000200000001000000000500417269616C000A0000000000000000
      0000000000CC00020000000000FFFFFF00000000020000000000000000009D05
      000005004D656D6F36000200380000003C010000D50100001200000043000000
      01000000000000000000FFFFFF1F2C02000000000001002B00D2E5EBE5F4EEED
      3A2028ECEEE12E29205B52784D656D6F727944617461312E224B4C4E5F50484F
      4E45225D00000000FFFF00000000000200000001000000000500417269616C00
      0A00000000000000000000000000CC00020000000000FFFFFF00000000020000
      000000000000003C06000005004D656D6F370002003800000058010000D50100
      00120000004300000001000000000000000000FFFFFF1F2C0200000000000100
      2100C3E4E520E2FB20E2F1F2F0E5F7E0EBE820F0E5EAEBE0ECF320CEEBE8ECEF
      E8E83F00000000FFFF00000000000200000001000000000500417269616C000A
      00000000000000000000000000CC00020000000000FFFFFF0000000002000000
      000000000000D506000005004D656D6F390002003C0000003C020000CC000000
      120000004300000001000000000000000000FFFFFF1F2C02000000000001001B
      00CFEEE4EFE8F1FC205F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      000000000000CC00020000000000FFFFFF00000000020000000000000000007C
      07000006004D656D6F3130000200D4000000540200003C010000120000004300
      000001000000000000000000FFFFFF1F2C02000000000001002800C1EBE0E3EE
      E4E0F0E8EC20C2E0F120E7E020F1EEF2F0F3E4EDE8F7E5F1F2E2EE20F120EDE0
      ECE82100000000FFFF00000000000200000001000000000500417269616C000A
      00000001000000000000000000CC00020000000000FFFFFF0000000002000000
      000000000A0F00546672436865636B426F785669657700000408000006004368
      65636B310002008C020000B80100001C00000012000000010000000200000000
      0000000000FFFFFF1F2C02000000000001001F005B52784D656D6F7279446174
      61312E2272656B6C616D615F696E666F31225D00000000000000000000000200
      00000100000000010000000000009408000006004D656D6F3131000200A80200
      00B8010000B0000000120000004300000001000000000000000000FFFFFF1F2C
      02000000000001001100CFEEF1F2EEFFEDEDFBE920EAEBE8E5EDF20000000000
      0000000000000200000001000000000500417269616C000A0000000100000000
      0000000000CC00020000000000FFFFFF00000000020000000000000000001809
      000006004D656D6F31320002002C01000070010000A800000012000000430000
      0001000000000000000000FFFFFF1F2C02000000000001000500D0E0E4E8EE00
      000000FFFF00000000000200000001000000000500417269616C000A00000001
      000000000000000000CC00020000000000FFFFFF000000000200000000000000
      0000A309000006004D656D6F3133000200A4020000D801000098000000120000
      004300000001000000000000000000FFFFFF1F2C02000000000001000C00D0E5
      EAEEECE5EDE4E0F6E8E800000000000000000000000200000001000000000500
      417269616C000A00000001000000000000000000CC00020000000000FFFFFF00
      000000020000000000000000003A0A000006004D656D6F31340002002C010000
      88010000B8000000120000004300000001000000000000000000FFFFFF1F2C02
      000000000002001500D0E5EAEBE0ECE020EDE020F2F0E0EDF1EFEEF0F2E50D00
      0000000000FFFF00000000000200000001000000000500417269616C000A0000
      0001000000000000000000CC00020000000000FFFFFF00000000020000000000
      00000000C10A000006004D656D6F313500020054000000700100006000000012
      0000004300000001000000000000000000FFFFFF1F2C02000000000001000800
      D1E0E9F20920202000000000FFFF000000000002000000010000000005004172
      69616C000A00000001000000000000000000CC00020000000000FFFFFF000000
      0002000000000000000000500B000006004D656D6F3136000200A40200001802
      0000D8000000120000004300000001000000000000000000FFFFFF1F2C020000
      00000001001000D0E5EAEBE0ECE020E220EBE8F4F2E0F5000000000000000000
      00000200000001000000000500417269616C000A000000010000000000000000
      00CC00020000000000FFFFFF0000000002000000000000000000DA0B00000600
      4D656D6F3137000200A8020000F8010000600000001200000043000000010000
      00000000000000FFFFFF1F2C02000000000001000B00D2E5EBE5E2E8E4E5EDE8
      E500000000000000000000000200000001000000000500417269616C000A0000
      0001000000000000000000CC00020000000000FFFFFF00000000020000000000
      00000000610C000006004D656D6F313800020054000000A0010000B000000012
      0000004300000001000000000000000000FFFFFF1F2C02000000000001000800
      CBE8F1F2EEE2EAE800000000FFFF000000000002000000010000000005004172
      69616C000A00000001000000000000000000CC00020000000000FFFFFF000000
      0002000000000000000000ED0C000006004D656D6F3139000200540000008801
      0000B8000000120000004300000001000000000000000000FFFFFF1F2C020000
      00000001000D00CDE0F0F3E6EDFBE520F9E8F2FB00000000FFFF000000000002
      00000001000000000500417269616C000A00000001000000000000000000CC00
      020000000000FFFFFF0000000002000000000000000000A90D000006004D656D
      6F323000020050000000E8010000BC0100001200000043000000010000000000
      00000000FFFFFF1F2C02000000000001003D00C4F0F3E3EEE55F5F5F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F00000000FFFF00000000000200000001
      000000000500417269616C000A00000001000000000000000000CC0002000000
      0000FFFFFF0000000002000000000000000A0F00546672436865636B426F7856
      6965770000310E00000600436865636B3200020010010000700100001C000000
      120000000100000002000000000000000000FFFFFF1F2C02000000000001001F
      005B52784D656D6F727944617461312E2272656B6C616D615F696E666F36225D
      000000000100000000000002000000010000000001000000000A0F0054667243
      6865636B426F78566965770000B90E00000600436865636B3300020088020000
      D80100001C000000120000000100000002000000000000000000FFFFFF1F2C02
      000000000001001F005B52784D656D6F727944617461312E2272656B6C616D61
      5F696E666F32225D000000000000000000000002000000010000000001000000
      000A0F00546672436865636B426F78566965770000410F00000600436865636B
      3400020010010000880100001C00000012000000010000000200000000000000
      0000FFFFFF1F2C02000000000001001F005B52784D656D6F727944617461312E
      2272656B6C616D615F696E666F37225D00000000010000000000000200000001
      0000000001000000000A0F00546672436865636B426F78566965770000C90F00
      000600436865636B3500020038000000700100001C0000001200000001000000
      02000000000000000000FFFFFF1F2C02000000000001001F005B52784D656D6F
      727944617461312E2272656B6C616D615F696E666F33225D0000000001000000
      00000002000000010000000001000000000A0F00546672436865636B426F7856
      6965770000511000000600436865636B3600020088020000180200001C000000
      120000000100000002000000000000000000FFFFFF1F2C02000000000001001F
      005B52784D656D6F727944617461312E2272656B6C616D615F696E666F38225D
      000000000000000000000002000000010000000001000000000A0F0054667243
      6865636B426F78566965770000D91000000600436865636B370002008C020000
      F80100001C000000120000000100000002000000000000000000FFFFFF1F2C02
      000000000001001F005B52784D656D6F727944617461312E2272656B6C616D61
      5F696E666F34225D000000000000000000000002000000010000000001000000
      000A0F00546672436865636B426F78566965770000611100000600436865636B
      3800020038000000A00100001C00000012000000010000000200000000000000
      0000FFFFFF1F2C02000000000001001F005B52784D656D6F727944617461312E
      2272656B6C616D615F696E666F39225D00000000010000000000000200000001
      0000000001000000000A0F00546672436865636B426F78566965770000E91100
      000600436865636B3900020038000000880100001C0000001200000001000000
      02000000000000000000FFFFFF1F2C02000000000001001F005B52784D656D6F
      727944617461312E2272656B6C616D615F696E666F35225D0000000001000000
      00000002000000010000000001000000000A0F00546672436865636B426F7856
      69657700006E1200000700436865636B313000020034000000000200001C0000
      001200000001000F0064000000000000000000FFFFFF1F2C0200000000000100
      1B005B52784D656D6F727944617461312E22434845434B5F534D53225D000000
      000100000000000002000000010000000001000000000000F212000006004D65
      6D6F32310002003C010000000100002800000012000000430000000100000000
      0000000000FFFFFF1F2C02000000000001000500CFEEEB3A2000000000FFFF00
      000000000200000001000000000500417269616C000A00000001000000000000
      000000CC00020000000000FFFFFF000000000200000000000000000073130000
      06004D656D6F3232000200900100000001000014000000120000004300000001
      000000000000000000FFFFFF1F2C02000000000001000200CC2000000000FFFF
      00000000000200000001000000000500417269616C000A000000010000000000
      00000000CC00020000000000FFFFFF0000000002000000000000000000F31300
      0006004D656D6F3233000200DC01000000010000180000001200000043000000
      01000000000000000000FFFFFF1F2C02000000000001000100C600000000FFFF
      00000000000200000001000000000500417269616C000A000000010000000000
      00000000CC00020000000000FFFFFF0000000002000000000000000A0F005466
      72436865636B426F78566965770000771400000700436865636B313100020074
      010000000100001C000000120000000100000002000000000000000000FFFFFF
      1F2C02000000000001001A005B52784D656D6F727944617461312E224B4C4E5F
      53455831225D000000000100000000000002000000010000000001000000000A
      0F00546672436865636B426F78566965770000FB1400000700436865636B3132
      000200C0010000000100001C0000001200000001000000020000000000000000
      00FFFFFF1F2C02000000000001001A005B52784D656D6F727944617461312E22
      4B4C4E5F53455832225D00000000010000000000000200000001000000000100
      00000000008715000006004D656D6F32340002003C0000005402000090000000
      120000004300000001000000000000000000FFFFFF1F2C02000000000001000D
      005B444154455D205B54494D455D00000000FFFF000000000002000000010000
      00000500417269616C000800000001000000000000000000CC00020000000000
      FFFFFF00000000020000000000000000004B16000005004D656D6F3800020050
      00000000020000C1010000120000004300000001000000000000000000FFFFFF
      1F2C02000000000001004600DF20F1EEE3EBE0F1E5ED20EFEEEBF3F7E0F2FC20
      736D732DF3E2E5E4EEECEBE5EDE8FF20EEF220ECE0E3E0E7E8EDE020EDE520F7
      E0F9E5203120F0E0E7E020E220ECE5F1FFF600000000FFFF0000000000020000
      0001000000000500417269616C000800000000000000000000000000CC000200
      00000000FFFFFF0000000002000000000000000A0F00546672436865636B426F
      78566965770000D61600000700436865636B313400020034000000180200001C
      0000001200000001000F0064000000000000000000FFFFFF1F2C020000000000
      010021005B52784D656D6F727944617461312E22636865636B5F706572735F64
      616E6E225D000000000100000000000002000000010000000001000000000000
      8017000006004D656D6F32350002005000000018020000C10100001200000043
      00000001000000000000000000FFFFFF1F2C02000000000001002B00DF20F1EE
      E3EBE0F1E5ED20EDE020EEE1F0E0E1EEF2EAF320EFE5F0F1EEEDE0EBFCEDFBF5
      20E4E0EDEDFBF500000000FFFF00000000000200000001000000000500417269
      616C000800000000000000000000000000CC00020000000000FFFFFF00000000
      0200000000000000FEFEFF030000000A002043617465676F7279310000000008
      00555345525F46494F0002002727000700555345525F49440001003000000000
      0000000000}
  end
  object frRoundRectObject1: TfrRoundRectObject
    Left = 876
    Top = 429
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = RxMemoryData1
    Left = 864
    Top = 496
  end
  object RxMemoryData1: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'CARD_NUM'
        DataType = ftInteger
      end
      item
        Name = 'KLN_FIO'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'REG_DATE'
        DataType = ftDate
      end
      item
        Name = 'KLN_ADDRESS'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'KLN_ADDINFO'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'KLN_PHONE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'KLN_SEX'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KLN_REKLAMA_DOP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'KLN_REKLAMA_INFO'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'CHECK_SMS'
        DataType = ftInteger
      end
      item
        Name = 'reklama_info1'
        DataType = ftInteger
      end
      item
        Name = 'reklama_info2'
        DataType = ftInteger
      end
      item
        Name = 'reklama_info3'
        DataType = ftInteger
      end
      item
        Name = 'reklama_info4'
        DataType = ftInteger
      end
      item
        Name = 'reklama_info5'
        DataType = ftInteger
      end
      item
        Name = 'reklama_info6'
        DataType = ftInteger
      end
      item
        Name = 'reklama_info7'
        DataType = ftInteger
      end
      item
        Name = 'reklama_info8'
        DataType = ftInteger
      end
      item
        Name = 'reklama_info9'
        DataType = ftInteger
      end
      item
        Name = 'KLN_SEX1'
        DataType = ftInteger
      end
      item
        Name = 'KLN_SEX2'
        DataType = ftInteger
      end
      item
        Name = 'CARD_DATE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'check_pers_dann'
        DataType = ftInteger
      end
      item
        Name = 'KLN_BIRTHDAY'
        DataType = ftString
        Size = 20
      end>
    Left = 720
    Top = 496
    object RxMemoryData1CARD_NUM: TIntegerField
      FieldName = 'CARD_NUM'
    end
    object RxMemoryData1KLN_FIO: TStringField
      FieldName = 'KLN_FIO'
      Size = 250
    end
    object RxMemoryData1REG_DATE: TDateField
      FieldName = 'REG_DATE'
    end
    object RxMemoryData1KLN_ADDRESS: TStringField
      FieldName = 'KLN_ADDRESS'
      Size = 250
    end
    object RxMemoryData1KLN_ADDINFO: TStringField
      FieldName = 'KLN_ADDINFO'
      Size = 250
    end
    object RxMemoryData1KLN_PHONE: TStringField
      FieldName = 'KLN_PHONE'
      Size = 100
    end
    object RxMemoryData1KLN_SEX: TStringField
      FieldName = 'KLN_SEX'
    end
    object RxMemoryData1KLN_REKLAMA_DOP: TStringField
      FieldName = 'KLN_REKLAMA_DOP'
    end
    object RxMemoryData1KLN_REKLAMA_INFO: TStringField
      FieldName = 'KLN_REKLAMA_INFO'
      Size = 1000
    end
    object RxMemoryData1CHECK_SMS: TIntegerField
      FieldName = 'CHECK_SMS'
    end
    object RxMemoryData1reklama_info1: TIntegerField
      FieldName = 'reklama_info1'
    end
    object RxMemoryData1reklama_info2: TIntegerField
      FieldName = 'reklama_info2'
    end
    object RxMemoryData1reklama_info3: TIntegerField
      FieldName = 'reklama_info3'
    end
    object RxMemoryData1reklama_info4: TIntegerField
      FieldName = 'reklama_info4'
    end
    object RxMemoryData1reklama_info5: TIntegerField
      FieldName = 'reklama_info5'
    end
    object RxMemoryData1reklama_info6: TIntegerField
      FieldName = 'reklama_info6'
    end
    object RxMemoryData1reklama_info7: TIntegerField
      FieldName = 'reklama_info7'
    end
    object RxMemoryData1reklama_info8: TIntegerField
      FieldName = 'reklama_info8'
    end
    object RxMemoryData1reklama_info9: TIntegerField
      FieldName = 'reklama_info9'
    end
    object RxMemoryData1KLN_SEX1: TIntegerField
      FieldName = 'KLN_SEX1'
    end
    object RxMemoryData1KLN_SEX2: TIntegerField
      FieldName = 'KLN_SEX2'
    end
    object RxMemoryData1CARD_DATE: TStringField
      FieldName = 'CARD_DATE'
    end
    object RxMemoryData1check_pers_dann: TIntegerField
      FieldName = 'check_pers_dann'
    end
    object RxMemoryData1KLN_BIRTHDAY: TStringField
      FieldName = 'KLN_BIRTHDAY'
    end
  end
  object frCheckBoxObject1: TfrCheckBoxObject
    Left = 944
    Top = 480
  end
end
