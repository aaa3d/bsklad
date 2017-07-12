object Edit_Kontakt: TEdit_Kontakt
  Left = 399
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Контакт.Данные'
  ClientHeight = 676
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object SpeedButton1: TSpeedButton
    Left = 0
    Top = 89
    Width = 28
    Height = 27
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 832
    Height = 647
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Имя'
      OnShow = TabSheet1Show
      object Shape1: TShape
        Left = 44
        Top = 1
        Width = 770
        Height = 41
        Brush.Color = 14548223
        Shape = stRoundRect
      end
      object Bevel1: TBevel
        Left = 0
        Top = 44
        Width = 814
        Height = 11
        Shape = bsTopLine
      end
      object Label1: TLabel
        Left = 33
        Top = 64
        Width = 65
        Height = 16
        Caption = 'Фамилия :'
      end
      object Label2: TLabel
        Left = 350
        Top = 64
        Width = 32
        Height = 16
        Caption = 'Имя :'
      end
      object Label3: TLabel
        Left = 542
        Top = 64
        Width = 69
        Height = 16
        Caption = 'Отчество :'
      end
      object Label4: TLabel
        Left = 359
        Top = 143
        Width = 178
        Height = 16
        Caption = 'Адрес электронной почты :'
      end
      object Label6: TLabel
        Left = 30
        Top = 94
        Width = 77
        Height = 32
        Caption = 'Должность :'#13#10'№ кассира'
      end
      object Label7: TLabel
        Left = 65
        Top = 133
        Width = 46
        Height = 16
        Caption = 'Адрес :'
      end
      object Label8: TLabel
        Left = 66
        Top = 222
        Width = 45
        Height = 16
        Caption = 'Город :'
      end
      object Label9: TLabel
        Left = 50
        Top = 251
        Width = 61
        Height = 16
        Caption = 'Область :'
      end
      object Label10: TLabel
        Left = 57
        Top = 281
        Width = 54
        Height = 16
        Caption = 'Индекс :'
      end
      object Label11: TLabel
        Left = 10
        Top = 310
        Width = 104
        Height = 16
        Caption = 'Страна/регион :'
      end
      object Label12: TLabel
        Left = 468
        Top = 172
        Width = 66
        Height = 16
        Caption = 'Телефон :'
      end
      object Label13: TLabel
        Left = 414
        Top = 202
        Width = 124
        Height = 16
        Caption = 'Сотовый телефон :'
      end
      object Label14: TLabel
        Left = 487
        Top = 231
        Width = 39
        Height = 16
        Caption = 'Факс :'
      end
      object Label15: TLabel
        Left = 468
        Top = 261
        Width = 65
        Height = 16
        Caption = 'Пейджер :'
      end
      object Label32: TLabel
        Left = 10
        Top = 354
        Width = 103
        Height = 16
        Caption = 'Паспорт серия :'
      end
      object Label33: TLabel
        Left = 276
        Top = 354
        Width = 49
        Height = 16
        Caption = 'Номер :'
      end
      object Label34: TLabel
        Left = 487
        Top = 354
        Width = 90
        Height = 16
        Caption = 'Дата выдачи :'
      end
      object Label35: TLabel
        Left = 34
        Top = 384
        Width = 75
        Height = 16
        Caption = 'Кем выдан :'
      end
      object Label36: TLabel
        Left = 5
        Top = 418
        Width = 147
        Height = 16
        Caption = '№ свидетельства ЧП. :'
      end
      object Image2: TImage
        Left = 0
        Top = 0
        Width = 40
        Height = 40
        AutoSize = True
        Picture.Data = {
          055449636F6E0000010001002020100000000000E80200001600000028000000
          2000000040000000010004000000000080020000000000000000000000000000
          00000000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000
          C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF00000000000000000000000000000000000E2000000000000000000000
          000000000E2F0007FFFFFFFFFF0FFFFFF00000000E2F08077FF00FFFF00F7770
          080000000E2F078077F0000000077808888000000E2F087807F0000000078000
          000000000E2F078780000087000007F7F7F000000E2F087878700FF7800F7F7F
          7F7080000E2F078787870BF780F7F7F7F7F080000E2F087878780000007F7F7F
          7F7080E00E2F07878780FBF770F7F7F7F7F080E00E2F08787807BFFF780F7F7F
          7F7080E00E2F0787807BFFFBF707F7F7F7F080E00E2F0878707FB0BFB7707F7F
          7F7080E00E2F0787007BF0FBFB7707F7F7F080E00E2F0878007FB0FFBF700F7D
          DF7080E00E2F07870077F0FFF77007FDD7F080E00E2F087880F008B00F808F7D
          DF7080E00E2F0787807BFFFFFB7007F7F7F080E00E2F08780077FFBFB7800F7D
          7F7080E00E2F078700700FFBF78007FDD7F080E00E2F0878000000BF07000F7F
          DD7080E00E0FF087000000000000FDD7DDF080E000E0FF080000000B00007DDD
          DD7080E0000E0FF080000000B007F7DDD7F080E00000E0FF087000000F7F7F7F
          7F7080E000000E0FF087F7F7F7F7F7F7F7F080E0000000E0FF70FFFFFFFFFFFF
          FFFF00E00000000E0F70000000000000000000E000000000E00EEEEEEEEEEEEE
          EEEEEEE0000000003E7300000000000000000000000000000000000000000000
          0000000017FFFFFF07FFFFFF0200003F0000003F0000001F0000000F00000007
          0000000300000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          80000000C0000000E0000000F0000000F8000000FC000000FE000000FE000000
          FF0FFFFF}
      end
      object Label51: TLabel
        Left = 49
        Top = 5
        Width = 799
        Height = 16
        Caption = 
          'Если человек является частным предпринимателем, необходимо ввест' +
          'и данные паспорта и лицензии. Эти данные будут'
        Transparent = True
      end
      object Label52: TLabel
        Left = 49
        Top = 20
        Width = 778
        Height = 16
        Caption = 
          'печататься на документах. Если человек является пользователем, з' +
          'аполнение Фамилии и инициалов - обязательное'
        Transparent = True
      end
      object KLN_FAM: TEdit
        Left = 118
        Top = 59
        Width = 223
        Height = 24
        MaxLength = 252
        TabOrder = 0
        OnChange = KLN_FAMChange
      end
      object KLN_NAME: TEdit
        Left = 394
        Top = 59
        Width = 139
        Height = 24
        MaxLength = 252
        TabOrder = 1
        OnChange = KLN_FAMChange
      end
      object KLN_NAME2: TEdit
        Left = 610
        Top = 59
        Width = 130
        Height = 24
        MaxLength = 252
        TabOrder = 2
        OnChange = KLN_FAMChange
      end
      object KLN_EMAIL: TEdit
        Left = 537
        Top = 138
        Width = 203
        Height = 24
        MaxLength = 252
        TabOrder = 9
        OnChange = KLN_FAMChange
      end
      object KLN_DOL: TEdit
        Left = 118
        Top = 98
        Width = 223
        Height = 24
        MaxLength = 254
        TabOrder = 3
        OnChange = KLN_FAMChange
      end
      object KLN_ADR: TMemo
        Left = 118
        Top = 128
        Width = 223
        Height = 85
        MaxLength = 1000
        TabOrder = 4
        OnChange = KLN_FAMChange
      end
      object KLN_CITY: TEdit
        Left = 118
        Top = 217
        Width = 223
        Height = 24
        MaxLength = 254
        TabOrder = 5
        OnChange = KLN_FAMChange
      end
      object KLN_OBLAST: TEdit
        Left = 118
        Top = 246
        Width = 223
        Height = 24
        MaxLength = 254
        TabOrder = 6
        OnChange = KLN_FAMChange
      end
      object KLN_INDEX: TEdit
        Left = 118
        Top = 276
        Width = 223
        Height = 24
        MaxLength = 254
        TabOrder = 7
        OnChange = KLN_FAMChange
      end
      object KLN_LAND: TEdit
        Left = 118
        Top = 305
        Width = 223
        Height = 24
        MaxLength = 254
        TabOrder = 8
        OnChange = KLN_FAMChange
      end
      object KLN_TEL: TEdit
        Left = 537
        Top = 167
        Width = 203
        Height = 24
        TabOrder = 10
        OnChange = KLN_FAMChange
      end
      object KLN_SOTEL: TEdit
        Left = 537
        Top = 197
        Width = 203
        Height = 24
        TabOrder = 11
        OnChange = KLN_FAMChange
      end
      object KLN_FAX: TEdit
        Left = 537
        Top = 226
        Width = 203
        Height = 24
        TabOrder = 12
        OnChange = KLN_FAMChange
      end
      object KLN_PAGER: TEdit
        Left = 537
        Top = 256
        Width = 203
        Height = 24
        TabOrder = 13
        OnChange = KLN_FAMChange
      end
      object KLN_PASS_SER: TEdit
        Left = 118
        Top = 350
        Width = 149
        Height = 24
        MaxLength = 32
        TabOrder = 15
        OnChange = KLN_FAMChange
      end
      object KLN_PASS_NUM: TEdit
        Left = 330
        Top = 350
        Width = 149
        Height = 24
        MaxLength = 32
        TabOrder = 16
        OnChange = KLN_FAMChange
      end
      object KLN_PASS_WYDD: TDateEdit
        Left = 581
        Top = 350
        Width = 149
        Height = 25
        ButtonWidth = 26
        NumGlyphs = 2
        TabOrder = 17
        OnChange = KLN_FAMChange
      end
      object KLN_PASS_WYD: TEdit
        Left = 118
        Top = 379
        Width = 612
        Height = 24
        MaxLength = 254
        TabOrder = 18
        OnChange = KLN_FAMChange
      end
      object KLN_SVID: TEdit
        Left = 158
        Top = 414
        Width = 572
        Height = 24
        MaxLength = 254
        TabOrder = 19
        OnChange = KLN_FAMChange
      end
      object KLN_MEN: TCheckBox
        Left = 537
        Top = 290
        Width = 227
        Height = 21
        Caption = 'Менеджер (владелец товара)'
        TabOrder = 14
        OnClick = KLN_FAMChange
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Организация'
      ImageIndex = 1
      object Bevel2: TBevel
        Left = 0
        Top = 44
        Width = 814
        Height = 11
        Shape = bsTopLine
      end
      object Label5: TLabel
        Left = 20
        Top = 89
        Width = 93
        Height = 16
        Caption = 'Организация :'
      end
      object Label16: TLabel
        Left = 41
        Top = 236
        Width = 70
        Height = 16
        Caption = 'Юр. адрес :'
      end
      object Label17: TLabel
        Left = 66
        Top = 325
        Width = 45
        Height = 16
        Caption = 'Город :'
      end
      object Label18: TLabel
        Left = 50
        Top = 354
        Width = 61
        Height = 16
        Caption = 'Область :'
      end
      object Label19: TLabel
        Left = 57
        Top = 384
        Width = 54
        Height = 16
        Caption = 'Индекс :'
      end
      object Label20: TLabel
        Left = 10
        Top = 414
        Width = 104
        Height = 16
        Caption = 'Страна/регион :'
      end
      object Label21: TLabel
        Left = 468
        Top = 187
        Width = 66
        Height = 16
        Caption = 'Телефон :'
      end
      object Label22: TLabel
        Left = 487
        Top = 217
        Width = 39
        Height = 16
        Caption = 'Факс :'
      end
      object Label23: TLabel
        Left = 74
        Top = 148
        Width = 36
        Height = 16
        Caption = 'ИНН :'
      end
      object Label24: TLabel
        Left = 443
        Top = 148
        Width = 79
        Height = 16
        Caption = 'Коды ОКДП :'
      end
      object Label27: TLabel
        Left = 20
        Top = 177
        Width = 88
        Height = 16
        Caption = 'Коды ОКОНХ :'
      end
      object Image3: TImage
        Left = 0
        Top = 0
        Width = 40
        Height = 40
        AutoSize = True
        Picture.Data = {
          055449636F6E0000010001002020100000000000E80200001600000028000000
          2000000040000000010004000000000080020000000000000000000000000000
          0000000000000000000080000080000000808000800000008000800080800000
          C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF00000000000000000000000000000000000E2F803B3B3B3B3B3B3B3000
          000000000E2F80B3B3B3B3B3B3B3B030000000000E2F80000000000000000033
          000000000E2F880FF0FFFF0FFFFFF003300000000E2F080FFFFFFFFFFFFFF0F0
          330000000E2F080FFFFFFFFFFFFFF0F0033000000E2F080FF88888888FFFF0F0
          F03300000E2F080FFFFFFFFFFFFFF0F0F00380000E2F080FF8888888888FF0F0
          F08080E00E2F080FFFFFFFFFFFFFF0F0F00880E00E2F080FFFFFFFFFFFFFF0F0
          F07080E00E2F0800000000FFF00000F0F07080E00E2F08880FFFF0AAA0FFFFF0
          F07080E00E2F088800000A0000000000F07080E00E2F0888880F0AAA0FFFFFFF
          F07080E00E2F088888000000080FFF00007080E00E2F088888887777770AAA07
          777080E00E2F08888880777777700077777080E00E2F08888880777777777777
          777080E00E2F08888880777777777777777080E00E2F08888880777777777777
          777080E00E0FF0888880777777777777777080E000E0FF088880777777777777
          777080E0000E0FF08880777777777777777080E00000E0FF0880777777777777
          777080E000000E0FF000777777777777777080E0000000E0FF80FFFFFFFFFFFF
          FFFF00E00000000E0F70000000000000000000E000000000E00EEEEEEEEEEEEE
          EEEEEEE0000000003E7300000000000000000000000000000000000000000000
          00000000080003FF000001FF000000FF0000007F0000003F0000001F0000000F
          0000000300000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          80000000C0000000E0000000F0000000F8000000FC000000FE000000FE000000
          FF0FFFFF}
      end
      object Shape2: TShape
        Left = 44
        Top = 1
        Width = 770
        Height = 41
        Brush.Color = 14548223
        Shape = stRoundRect
      end
      object Label53: TLabel
        Left = 49
        Top = 20
        Width = 795
        Height = 16
        Caption = 
          'Заполнение этих данных приведёт к тому, что в документах будет о' +
          'тображена информация о фирме, а не о частом лице.'
        Transparent = True
      end
      object Label54: TLabel
        Left = 49
        Top = 5
        Width = 736
        Height = 16
        Caption = 
          'Здесь необходимо ввести данные, если "контакт" является организа' +
          'цией или человек работает в организации.'
        Transparent = True
      end
      object Label61: TLabel
        Left = 25
        Top = 118
        Width = 87
        Height = 16
        Caption = 'Сокращение :'
      end
      object Label68: TLabel
        Left = 492
        Top = 118
        Width = 34
        Height = 16
        Caption = 'КПП :'
      end
      object Label69: TLabel
        Left = 438
        Top = 271
        Width = 95
        Height = 16
        Caption = 'Гл. Бухгалтер :'
      end
      object Label70: TLabel
        Left = 463
        Top = 241
        Width = 69
        Height = 16
        Caption = 'Директор :'
      end
      object Label75: TLabel
        Left = 5
        Top = 54
        Width = 156
        Height = 16
        Caption = 'Полное наименование :'
      end
      object KLN_ORG: TEdit
        Left = 118
        Top = 84
        Width = 622
        Height = 24
        MaxLength = 254
        TabOrder = 0
        OnChange = KLN_FAMChange
      end
      object KLN_ORG_ADR: TMemo
        Left = 118
        Top = 231
        Width = 223
        Height = 85
        MaxLength = 1000
        TabOrder = 3
        OnChange = KLN_FAMChange
      end
      object KLN_ORG_CITY: TEdit
        Left = 118
        Top = 320
        Width = 223
        Height = 24
        MaxLength = 254
        TabOrder = 4
        OnChange = KLN_FAMChange
      end
      object KLN_ORG_OBLAST: TEdit
        Left = 118
        Top = 350
        Width = 223
        Height = 24
        MaxLength = 254
        TabOrder = 5
        OnChange = KLN_FAMChange
      end
      object KLN_ORG_INDEX: TEdit
        Left = 118
        Top = 379
        Width = 223
        Height = 24
        MaxLength = 254
        TabOrder = 6
        OnChange = KLN_FAMChange
      end
      object KLN_ORG_LAND: TEdit
        Left = 118
        Top = 409
        Width = 223
        Height = 24
        MaxLength = 254
        TabOrder = 7
        OnChange = KLN_FAMChange
      end
      object KLN_ORG_TEL: TEdit
        Left = 537
        Top = 182
        Width = 203
        Height = 24
        TabOrder = 8
        OnChange = KLN_FAMChange
      end
      object KLN_ORG_FAX: TEdit
        Left = 537
        Top = 212
        Width = 203
        Height = 24
        TabOrder = 9
        OnChange = KLN_FAMChange
      end
      object KLN_OK2: TEdit
        Left = 537
        Top = 143
        Width = 203
        Height = 24
        MaxLength = 254
        TabOrder = 2
        OnChange = KLN_FAMChange
      end
      object KLN_OK1: TEdit
        Left = 118
        Top = 172
        Width = 223
        Height = 24
        MaxLength = 254
        TabOrder = 1
        OnChange = KLN_FAMChange
      end
      object KLN_PREFIX: TEdit
        Left = 118
        Top = 113
        Width = 149
        Height = 24
        MaxLength = 32
        TabOrder = 10
      end
      object KLN_KPP: TEdit
        Left = 537
        Top = 113
        Width = 203
        Height = 24
        MaxLength = 9
        TabOrder = 11
        OnChange = KLN_FAMChange
      end
      object KLN_DIR: TEdit
        Left = 537
        Top = 239
        Width = 203
        Height = 24
        MaxLength = 254
        TabOrder = 12
        OnChange = KLN_FAMChange
      end
      object KLN_GB: TEdit
        Left = 537
        Top = 266
        Width = 203
        Height = 24
        MaxLength = 254
        TabOrder = 13
        OnChange = KLN_FAMChange
      end
      object StringGrid1: TStringGrid
        Left = 364
        Top = 295
        Width = 376
        Height = 149
        Hint = 
          'Текущее сальдо рассчитывается по следующей формуле:'#13#10'текущее сал' +
          'ьдо = сальдо на дату закрытия периода + сумма платежей - сумма Р' +
          'Н + сумма ПН'
        ColCount = 2
        DefaultColWidth = 120
        DefaultRowHeight = 15
        FixedCols = 0
        RowCount = 7
        FixedRows = 0
        TabOrder = 14
        ColWidths = (
          181
          118)
      end
      object KLN_INN: TCurrencyEdit
        Left = 118
        Top = 142
        Width = 223
        Height = 25
        Alignment = taLeftJustify
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '############'
        FormatOnEditing = True
        MaxLength = 12
        TabOrder = 15
      end
      object KLN_FULL_NAME: TEdit
        Left = 158
        Top = 49
        Width = 582
        Height = 24
        MaxLength = 254
        TabOrder = 16
        OnChange = KLN_FAMChange
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Банк'
      ImageIndex = 5
      object Bevel6: TBevel
        Left = 0
        Top = 44
        Width = 814
        Height = 11
        Shape = bsTopLine
      end
      object Label25: TLabel
        Left = 10
        Top = 64
        Width = 114
        Height = 16
        Caption = 'Название банка :'
      end
      object Label26: TLabel
        Left = 34
        Top = 94
        Width = 88
        Height = 16
        Caption = 'Адрес банка :'
      end
      object Label28: TLabel
        Left = 44
        Top = 162
        Width = 75
        Height = 16
        Caption = 'Корр. банк :'
      end
      object Label29: TLabel
        Left = 89
        Top = 192
        Width = 28
        Height = 16
        Hint = 'Расчётный счёт'
        Caption = 'Р/С :'
      end
      object Label30: TLabel
        Left = 89
        Top = 222
        Width = 33
        Height = 16
        Caption = 'БИК :'
      end
      object Label31: TLabel
        Left = 49
        Top = 251
        Width = 74
        Height = 16
        Caption = 'Корр. счёт :'
      end
      object Image4: TImage
        Left = 0
        Top = 0
        Width = 40
        Height = 40
        AutoSize = True
        Picture.Data = {
          055449636F6E0000010001002020100000000000E80200001600000028000000
          2000000040000000010004000000000080020000000000000000000000000000
          0000000000000000000080000080000000808000800000008000800080800000
          80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF0000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000888888888888888888888800000000088888888888888880000
          08880000008000000000000000088888800880000000080888FFF80800888888
          88F08800000000000000000008FF8888888F08000000088088FFF8008888888F
          8888800000000000000000008888888888888000000008808FFFFF8088888888
          8888800000000000000000008888888888888000000008080F8FFF8088888888
          88888000000000000000000008888FF888880000000000808F8FF80800888888
          88800000000000000000000000088FF880000000000808088FFFFF8008000000
          0000000000000000000000000000000000000000000000808F8FFF8880000000
          000000000000000000000000000000000000000000000808FFFFFFF080000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF800001FF000000FC00000078000000380000003C0000003C0000003
          8000000380000003C0000003C0000007C000000FC000001FC000107FC0001FFF
          C0001FFFC0001FFFC0001FFFE0003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF}
      end
      object Shape3: TShape
        Left = 44
        Top = 1
        Width = 770
        Height = 41
        Brush.Color = 14548223
        Shape = stRoundRect
      end
      object Label55: TLabel
        Left = 49
        Top = 20
        Width = 562
        Height = 16
        Caption = 
          'платёжные поручения. В противном случае данные о банке можно ост' +
          'авить пустыми.'
        Transparent = True
      end
      object Label56: TLabel
        Left = 49
        Top = 5
        Width = 742
        Height = 16
        Caption = 
          'Информация о банке необходимо только в том случае, если на указа' +
          'нный контакт будут оформляться счета или'
        Transparent = True
      end
      object KLN_BNK: TEdit
        Left = 128
        Top = 59
        Width = 597
        Height = 21
        MaxLength = 254
        TabOrder = 0
        OnChange = KLN_FAMChange
      end
      object KLN_BNK_ADR: TMemo
        Left = 128
        Top = 89
        Width = 597
        Height = 65
        MaxLength = 1000
        TabOrder = 1
        OnChange = KLN_FAMChange
      end
      object KLN_KB: TEdit
        Left = 128
        Top = 158
        Width = 597
        Height = 21
        MaxLength = 254
        TabOrder = 2
        OnChange = KLN_FAMChange
      end
      object KLN_RS: TEdit
        Left = 128
        Top = 187
        Width = 203
        Height = 21
        MaxLength = 20
        TabOrder = 3
        OnChange = KLN_FAMChange
      end
      object KLN_BIK: TEdit
        Left = 128
        Top = 217
        Width = 203
        Height = 21
        MaxLength = 9
        TabOrder = 4
        OnChange = KLN_FAMChange
      end
      object KLN_KS: TEdit
        Left = 128
        Top = 246
        Width = 203
        Height = 21
        MaxLength = 20
        TabOrder = 5
        OnChange = KLN_FAMChange
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Офис'
      ImageIndex = 2
      object Bevel3: TBevel
        Left = 0
        Top = 44
        Width = 814
        Height = 11
        Shape = bsTopLine
      end
      object Label37: TLabel
        Left = 78
        Top = 64
        Width = 46
        Height = 16
        Caption = 'Адрес :'
      end
      object Label38: TLabel
        Left = 60
        Top = 128
        Width = 66
        Height = 16
        Caption = 'Телефон :'
      end
      object Label39: TLabel
        Left = 80
        Top = 158
        Width = 39
        Height = 16
        Caption = 'Факс :'
      end
      object Label40: TLabel
        Left = 26
        Top = 187
        Width = 98
        Height = 16
        Caption = 'Время работы :'
      end
      object Label41: TLabel
        Left = 10
        Top = 226
        Width = 118
        Height = 16
        Caption = 'Контактное лицо :'
      end
      object Image5: TImage
        Left = 0
        Top = 0
        Width = 40
        Height = 40
        AutoSize = True
        Picture.Data = {
          055449636F6E0000010001002020100000000000E80200001600000028000000
          2000000040000000010004000000000080020000000000000000000000000000
          0000000000000000000080000080000000808000800000008000800080800000
          80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF0000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000088080000700000
          0000000000000007888080000007070000000000000000787888080000707700
          0000000000000087800080000007070000000000000000787888080000707700
          000000000000008787808000000707000000000000000078788808E000707700
          0000000000000000000000000007070000000000000000787888000000707700
          0000000000000087888080000007070000000000000000787008080000707700
          0000000000000087888080000007070000000000000000007888080000707700
          0000000000000087000080E00007070000000000000000788888000000707700
          0000000000000087808000000007070000000000000000788888080000707700
          0000000000000000088080000007070000000000000000000000080000707700
          0000000007000000000000000007070000000000087800000000700000707700
          0000000007888000000770000007070000000000087008080070700000707700
          00000000008000800707700000070700000000000008080E0070700000707000
          0000000000008080070770E000070000000000000000080E0070000000000000
          0000000000000080000000E00000000000000000000000000000000000000000
          00000000FFFFFFFFFFF81FFFFFC607FFFE0A01FFF81601FFF80A01FFF81601FF
          F80A01FFF81601FFF80801FFF80001FFF80E01FFF81601FFF80A01FFF81601FF
          F80A01FFF80401FFF80001FFF81E01FFF80A01FFF81601FF000A01FF000201FF
          000201FF040201FF0A0201FF950201FFCA0201FFE50003FFF2020FFFF9183FFF
          FC7CFFFF}
      end
      object Shape4: TShape
        Left = 44
        Top = 1
        Width = 770
        Height = 41
        Brush.Color = 14548223
        Shape = stRoundRect
      end
      object Label57: TLabel
        Left = 49
        Top = 20
        Width = 583
        Height = 16
        Caption = 
          'листов рассылки, документов для командировок и другой дополнител' +
          'ьной информации.'
        Transparent = True
      end
      object Label58: TLabel
        Left = 49
        Top = 5
        Width = 734
        Height = 16
        Caption = 
          'Данные офиса организации или частного лица используются для форм' +
          'ирования "персональных" прайс-листов,'
        Transparent = True
      end
      object KLN_OFFICE_ADR: TMemo
        Left = 128
        Top = 59
        Width = 676
        Height = 60
        MaxLength = 1000
        TabOrder = 0
        OnChange = KLN_FAMChange
      end
      object KLN_OFFICE_TEL: TEdit
        Left = 128
        Top = 123
        Width = 203
        Height = 21
        TabOrder = 1
        OnChange = KLN_FAMChange
      end
      object KLN_OFFICE_FAX: TEdit
        Left = 128
        Top = 153
        Width = 203
        Height = 21
        TabOrder = 2
        OnChange = KLN_FAMChange
      end
      object KLN_OFFICE_TIME: TEdit
        Left = 128
        Top = 182
        Width = 341
        Height = 21
        MaxLength = 254
        TabOrder = 3
        OnChange = KLN_FAMChange
      end
      object KLN_OFFICE_CONTACT: TEdit
        Left = 128
        Top = 222
        Width = 341
        Height = 21
        MaxLength = 254
        TabOrder = 4
        OnChange = KLN_FAMChange
      end
      object KLN_OFFICE_BIGAUTO: TCheckBox
        Left = 128
        Top = 256
        Width = 351
        Height = 21
        Caption = 'Возможность проехать на грузовом автомобиле '
        TabOrder = 5
        OnClick = KLN_FAMChange
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Склад'
      ImageIndex = 3
      object Bevel4: TBevel
        Left = 0
        Top = 44
        Width = 814
        Height = 11
        Shape = bsTopLine
      end
      object Label42: TLabel
        Left = 78
        Top = 64
        Width = 46
        Height = 16
        Caption = 'Адрес :'
      end
      object Label43: TLabel
        Left = 60
        Top = 128
        Width = 66
        Height = 16
        Caption = 'Телефон :'
      end
      object Label44: TLabel
        Left = 80
        Top = 158
        Width = 39
        Height = 16
        Caption = 'Факс :'
      end
      object Label45: TLabel
        Left = 26
        Top = 187
        Width = 98
        Height = 16
        Caption = 'Время работы :'
      end
      object Label46: TLabel
        Left = 10
        Top = 226
        Width = 118
        Height = 16
        Caption = 'Контактное лицо :'
      end
      object Image6: TImage
        Left = 0
        Top = 0
        Width = 40
        Height = 40
        AutoSize = True
        Picture.Data = {
          055449636F6E0000010001002020100000000000E80200001600000028000000
          2000000040000000010004000000000080020000000000000000000000000000
          00000000000000000000C00000C0000000C0C000C0000000C000C000C0C00000
          C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF0000000000000000000000000000000000000000000000000000000000
          00000000007F7F7F7F7F7F7F7F0000000000000000F7F7F7F7F7F7F7F7080000
          00000000007F7F7F7F7F7F7F7F0780000000000000F7F7F7F7F7F7F7F7087800
          00000000007F7F7F7F7F7F7F7F0787800000000000F7F7F0000007F7F7077878
          07700000007F7F7088880F7F7F0777888070800000F7F7F7F7F7F7F7F7077878
          80708800007F7F7F7F7F7F7F7F0777878070880000F7F7F7F7F7F7F7F7077778
          80708800007F7F7F7F7F7F7F7F0777878070880000F7F7F7F7F7F7F7F7077778
          80708800007F7F7F7F7F7F7F7F07777780708800000000000000000000077778
          8070880000000000BBBBBBBBBBBB0087807088000000000BBBBBBBBBBBBB0000
          00708800000000BBBBBBBBBBBBB008887F70880000000BBBBBBBBBBBBB008887
          F770880000000BBBBBBBBBBBB000000000708800000000BFBBBBBBBB008887F7
          F07088000000000BFBBBBBB008887F7F7070880000000000BFBBBB00B08887F7
          F0708800000000000BFBB0BBB000007F707088000000000000BF0BBB008880F7
          F0708800000000000000FBB0888F7F7F70708800000000000000BF0888F7F7F7
          F070880000000000000000877F7F7F7F70708800000000000000F00000000000
          00F08800000000000000FF7F7F7F7F7F7F700800000000000000000000000000
          00000000FFFFFFFF80001FFF80000FFF800007FF800003FF800001FF8000000F
          8000000780000003800000018000000180000001800000018000000180000001
          80000001FC000001FC000001F8000001F0000001F0000001F8000001FC000001
          FE000001FF000001FF800001FFC00001FFE00001FFE00001FFE00001FFE00003
          FFE0000F}
      end
      object Shape5: TShape
        Left = 44
        Top = 1
        Width = 770
        Height = 41
        Brush.Color = 14548223
        Shape = stRoundRect
      end
      object Label59: TLabel
        Left = 49
        Top = 20
        Width = 281
        Height = 16
        Caption = 'Заполнение этих данных не обязательное.'
        Transparent = True
      end
      object Label60: TLabel
        Left = 49
        Top = 5
        Width = 601
        Height = 16
        Caption = 
          'Данные склада используются для сервисного отображения в документ' +
          'ах для  экспедитора.'
        Transparent = True
      end
      object KLN_SKL_ADR: TMemo
        Left = 128
        Top = 59
        Width = 676
        Height = 60
        MaxLength = 1000
        TabOrder = 0
        OnChange = KLN_FAMChange
      end
      object KLN_SKL_TEL: TEdit
        Left = 128
        Top = 123
        Width = 203
        Height = 21
        TabOrder = 1
        OnChange = KLN_FAMChange
      end
      object KLN_SKL_FAX: TEdit
        Left = 128
        Top = 153
        Width = 203
        Height = 21
        TabOrder = 2
        OnChange = KLN_FAMChange
      end
      object KLN_SKL_TIME: TEdit
        Left = 128
        Top = 182
        Width = 341
        Height = 21
        MaxLength = 254
        TabOrder = 3
        OnChange = KLN_FAMChange
      end
      object KLN_SKL_CONTACT: TEdit
        Left = 128
        Top = 222
        Width = 341
        Height = 21
        MaxLength = 254
        TabOrder = 4
        OnChange = KLN_FAMChange
      end
      object KLN_SKL_BIGAUTO: TCheckBox
        Left = 128
        Top = 256
        Width = 351
        Height = 21
        Caption = 'Возможность проехать на грузовом автомобиле '
        TabOrder = 5
        OnClick = KLN_FAMChange
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Другие'
      ImageIndex = 4
      object Bevel5: TBevel
        Left = 0
        Top = 44
        Width = 814
        Height = 11
        Shape = bsTopLine
      end
      object Label50: TLabel
        Left = 30
        Top = 167
        Width = 88
        Height = 16
        Caption = 'Примечания :'
      end
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 40
        Height = 40
        AutoSize = True
        Picture.Data = {
          055449636F6E0000010001002020100000000000E80200001600000028000000
          2000000040000000010004000000000080020000000000000000000000000000
          00000000000000000000C00000C0000000C0C000C0000000C000C000C0C00000
          C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF0000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000B00000000000000000000000000000B
          BB0B0000000000000000000000000BBBBB07B0000000000000000000000BBBBB
          BB0B70000000000000000BF00BBBBBBBBB07B00000000000000FBFBFB00BBBBB
          BB0B7000000000000BFBFBFBFBF00BBBBB07B0000000000FBFBFBFBFBFBFB0BB
          BB0B700000000BFBFBFBFBFBFBFBFB0BBB07B000000FBFBFBFBFBFBFBFBFBFB0
          BB0B70000BFBFBFBFBFBFBFBFBFBFBF0BB07B000000FBFBFBFBFBFBFBFBFBFBF
          0B0B700000000BFBFBFBFBFBFBFBFBFB0B07B0000000000FBFBFBFBFBFBFBFBF
          B00B700000000000FBFBFBFBFBFBFBFBF007B000000000000FBFBFBFBFBFBFBF
          B00B70000000000000FBFBFBFBFBFBFBFB07B0000000000000BFBFBFBFBFBFBF
          BF0B700000000000000BFBFBFBFBFBFBFB07B00000000000000FBFBFBFBFBFBF
          B0087000000000000000FBFBFBFBFBF00BF08000000000000000BFBFBFBFB00F
          BFBF0000000000000000FBFBFBF00BFBFB000000000000000000BFBFB00FBFBF
          00000000000000000000FBF00BFBFB0000000000000000000000B00FBFBF0000
          000000000000000000000BFBFB0000000000000000000000000000BF00000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFFFFFFFFFFFF9FFFFFFE0FFFFFF807FFFFE003FFF98003FFE00003
          FF800003FE000003F8000003E0000003800000030000000380000003E0000003
          F8000003FE000003FF000003FF800003FF800003FFC00003FFC00003FFE00003
          FFE00003FFE0000FFFE0003FFFE000FFFFE003FFFFF00FFFFFF83FFFFFFCFFFF
          FFFFFFFF}
      end
      object Shape6: TShape
        Left = 44
        Top = 1
        Width = 770
        Height = 41
        Brush.Color = 14548223
        Shape = stRoundRect
      end
      object Label62: TLabel
        Left = 49
        Top = 5
        Width = 706
        Height = 16
        Caption = 
          'Здесь Вы можете ввести любую дополнительную информацию о контакт' +
          'е.  Объём ограничен 32'#39'000 знаков.'
        Transparent = True
      end
      object Label65: TLabel
        Left = 5
        Top = 54
        Width = 115
        Height = 32
        Caption = 'Сумма товарного'#13#10'                кредита :'
      end
      object Label66: TLabel
        Left = 39
        Top = 98
        Width = 82
        Height = 16
        Caption = 'Общий счет :'
      end
      object BtnFind: TSpeedButton
        Left = 788
        Top = 94
        Width = 28
        Height = 27
        Hint = 'Указать контакт, по накопительному счету'
        Glyph.Data = {
          26040000424D2604000000000000360000002800000012000000120000000100
          180000000000F003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000
          000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF0000000000000000
          00000000000000FF00FFFF00FFFF00FF0000000000FFFFFF0000000000000000
          00FF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFF000000000000000000FF
          00FFFF00FFFF00FF0000000000FFFFFF000000000000000000FF00FFFF00FFFF
          00FFFF00FFFF00FF000000FFFFFF000000000000000000FF00FFFF00FFFF00FF
          0000000000000000000000000000000000000000000000FF00FF000000000000
          000000000000000000000000000000FF00FFFF00FFFF00FF0000000000000000
          FFFFFF000000000000000000000000000000000000FFFFFF0000000000000000
          00000000000000FF00FFFF00FFFF00FF0000000000000000FFFFFF0000000000
          00000000FF00FF000000000000FFFFFF000000000000000000000000000000FF
          00FFFF00FFFF00FF0000000000000000FFFFFF000000000000000000FF00FF00
          0000000000FFFFFF000000000000000000000000000000FF00FFFF00FFFF00FF
          0000FF00FF000000000000000000000000000000000000000000000000000000
          000000000000000000000000FF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF
          000000FFFFFF000000000000000000FF00FF000000FFFFFF0000000000000000
          00FF00FFFF00FFFF00FFFF00FFFF00FF0000FF00FFFF00FF0000000000000000
          00000000000000FF00FF000000000000000000000000000000FF00FF000000FF
          00FF000000FF00FF0000FF00FFFF00FFFF00FF000000000000000000FF00FFFF
          00FFFF00FF000000000000000000FF00FFFF00FF000000000000000000FF00FF
          0000FF00FFFF00FFFF00FF000000FFFFFF000000FF00FFFF00FFFF00FF000000
          FFFFFF000000FF00FFFF00FF000000FF00FF000000FF00FF0000FF00FFFF00FF
          FF00FF000000000000000000FF00FFFF00FFFF00FF000000000000000000FF00
          FFFF00FF000000FF00FF000000FF00FF0000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000000000FF00FF0000}
        OnClick = BtnFindClick
      end
      object BtnDefault: TSpeedButton
        Left = 758
        Top = 94
        Width = 28
        Height = 27
        Hint = 'Установить счет на эту карточку'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFF303030FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6060
          60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF909090909090FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF909090909090909090FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF303030909090606060909090FFFFFFFFFFFFFFFFFF9090903030300000
          00909090909090FFFFFFFFFFFFFFFFFFFFFFFF90909060606000000090909090
          9090303030909090303030909090404000202000909090909090FFFFFFFFFFFF
          303030909090909090000000303030C0C0C0909090303030909090C0C0C04040
          00808000202000909090FFFFFFFFFFFF909090606060C0C0C000000000000030
          3030606060C0C0C0C0C0C09090907F7F00606000808000606060FFFFFFFFFFFF
          9090909090906F6F307F7F00000000909090C0C0C0C0C0C0606060BFBF00FFFF
          00BFBF00606000000000FFFFFF606060606060909090BFBF00FFFF00000000C0
          C0C06060607F7F00FFFF00FFFF00FFFF00FFFF00BFBF00000000FFFFFF909090
          606060BFBF00FFFF00FFFF007F7F003F3F00FFFF00FFFF00FFFF00FFFF00BFBF
          003F3F000000000000006060606060606F6F30FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00BFBF003F3F00000000FFFFFFFFFFFFFFFFFF6060603F3F00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00BFBF003F3F00000000000000FFFF
          FFFFFFFFFFFFFFFFFFFF303030FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF007F7F00000000000000FFFFFFFFFFFFFFFFFFFFFFFF3F3F007F7F00
          7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F003F3F00000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        OnClick = BtnDefaultClick
      end
      object Label76: TLabel
        Left = 591
        Top = 59
        Width = 68
        Height = 16
        Caption = 'Менеджер'
      end
      object KLN_PRIM: TMemo
        Left = 128
        Top = 153
        Width = 681
        Height = 109
        TabOrder = 0
        OnChange = KLN_FAMChange
      end
      object CREDIT1: TRxCalcEdit
        Left = 128
        Top = 64
        Width = 218
        Height = 26
        AutoSize = False
        DisplayFormat = ',0.00 руб##'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 1
      end
      object MAINST_FULL: TEdit
        Left = 128
        Top = 94
        Width = 631
        Height = 21
        Enabled = False
        TabOrder = 2
        Text = 'MAINST_FULL'
      end
      object MAINST_REKW: TEdit
        Left = 128
        Top = 123
        Width = 686
        Height = 21
        Enabled = False
        TabOrder = 3
        Text = 'MAINST_REKW'
      end
      object cbCredit1: TCheckBox
        Left = 354
        Top = 66
        Width = 228
        Height = 18
        Caption = 'Товарный кредит запрещен'
        TabOrder = 4
      end
      object KLN_MANAGER_TABEL: TRxCalcEdit
        Left = 670
        Top = 59
        Width = 80
        Height = 26
        AutoSize = False
        DisplayFormat = '0'
        ButtonWidth = 25
        NumGlyphs = 2
        TabOrder = 5
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Безопасность'
      ImageIndex = 6
      object Bevel7: TBevel
        Left = 0
        Top = 44
        Width = 814
        Height = 11
        Shape = bsTopLine
      end
      object Label47: TLabel
        Left = 177
        Top = 69
        Width = 55
        Height = 16
        Caption = 'Пароль :'
      end
      object Label48: TLabel
        Left = 76
        Top = 98
        Width = 162
        Height = 16
        Caption = 'Подтверждение пароля :'
      end
      object Label49: TLabel
        Left = 106
        Top = 128
        Width = 131
        Height = 16
        Caption = 'Категория доступа :'
      end
      object Image7: TImage
        Left = 0
        Top = 0
        Width = 40
        Height = 40
        AutoSize = True
        Picture.Data = {
          055449636F6E0000010001002020040000000000E80200001600000028000000
          2000000040000000010004000000000000020000000000000000000000000000
          0000000000000000000080000080000000808000800000008000800080800000
          C0C0C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF0000000000000000000000000000000000000000000007000000000000
          0000000000000000087770000000000000000000000000700878703333333333
          3333380000008777000870BBBBBBBBBBBBBB783000008787007870BBBBBBBBBB
          BBBB7380000000878F78707777777777777B783000000787087870BBBBBBBBBB
          BBBB73800008F7870008707777777777777B783000008787008870BBBBBBBBBB
          BBBB7380000000878F78707777777777777B7830000008878F7870BBBBBBBBBB
          BBBB73800008F7870878707777777777777B78300008F787087880BBBBBBBBBB
          BBBB7380000087878F7F807777777777777B783000008788F777770BBBBBBBBB
          BBBB73800008F78F77F7F780BBBBBBBBBBBF7830008F78F77F7F77780FFFFFFF
          FFF7738008F778F777F7F77808383838383838308F77F8F77F007F7803838383
          800383808F7778F77080077800383838373038308F77F8F77088077800333333
          373033008F77088F7700778030000000373000008F770888FFFF080B30000000
          3730000008F770078888083B3000000037300000008FFFF78000003B30000000
          37300000000888888008003B3000000037300000000000800080003B73000003
          B73000000000000000000003B73000077300000000000000000000003BB3337B
          300000000000000000000000033BBBB000000000000000000000000000033330
          00000000FFEFFFFFFFC7FFFFFD800003F8800001F0400000F0000000F8000000
          F0000000E0400000F0000000F8000000F0000000E0000000E0000000F0000000
          F0000000E0000000C00000008000000000000000001000010000000300003F0F
          00003F0F80003F0FC0343F0FE0643F0FF9CC1E0FFC1E001FFFFF003FFFFF807F
          FFFFE1FF}
      end
      object Shape7: TShape
        Left = 44
        Top = 1
        Width = 770
        Height = 41
        Brush.Color = 14548223
        Shape = stRoundRect
      end
      object Label63: TLabel
        Left = 49
        Top = 20
        Width = 796
        Height = 16
        Caption = 
          'пользователей при запуске. Администратор может закрыть пользоват' +
          'елю доступ к системе (например при увольнении)'
        Transparent = True
      end
      object Label64: TLabel
        Left = 49
        Top = 5
        Width = 779
        Height = 16
        Caption = 
          'В случае, если введёте пароль в данной форме, контакт будет счит' +
          'аться пользователем системы и появится в списке'
        Transparent = True
      end
      object Label67: TLabel
        Left = 52
        Top = 222
        Width = 123
        Height = 16
        Caption = 'Табельный номер :'
      end
      object Label71: TLabel
        Left = 68
        Top = 249
        Width = 105
        Height = 16
        Caption = 'Номер кассира :'
      end
      object Label72: TLabel
        Left = 119
        Top = 277
        Width = 52
        Height = 16
        Caption = 'Кассир :'
      end
      object Label73: TLabel
        Left = 10
        Top = 158
        Width = 235
        Height = 16
        Caption = 'Редактирование цен в документах: '
        Visible = False
      end
      object Label77: TLabel
        Left = 207
        Top = 310
        Width = 31
        Height = 16
        Caption = 'Тип :'
      end
      object Label74: TLabel
        Left = 162
        Top = 340
        Width = 78
        Height = 16
        Caption = 'Тип прайса:'
      end
      object KLN_PASSWORD1: TEdit
        Left = 246
        Top = 64
        Width = 184
        Height = 21
        MaxLength = 32
        PasswordChar = '*'
        TabOrder = 0
        OnChange = KLN_FAMChange
      end
      object KLN_PASSWORD2: TEdit
        Left = 246
        Top = 94
        Width = 184
        Height = 21
        MaxLength = 32
        PasswordChar = '*'
        TabOrder = 1
        OnChange = KLN_FAMChange
      end
      object KLN_CLOSE: TCheckBox
        Left = 177
        Top = 192
        Width = 125
        Height = 21
        Caption = 'Доступ закрыт'
        TabOrder = 3
        OnClick = KLN_CLOSEClick
      end
      object USGROUP_ID: TRxDBLookupCombo
        Left = 246
        Top = 123
        Width = 385
        Height = 28
        DropDownCount = 8
        LookupField = 'USGROUP_ID'
        LookupDisplay = 'USGROUP_NAME'
        LookupSource = DsUsgroup
        TabOrder = 2
        OnChange = USGROUP_IDChange
      end
      object KLN_TABEL: TRxSpinEdit
        Left = 177
        Top = 217
        Width = 80
        Height = 21
        MaxValue = 9999
        MinValue = -1
        TabOrder = 4
        OnChange = KLN_TABELChange
      end
      object KLN_KKM_NUM: TRxSpinEdit
        Left = 177
        Top = 244
        Width = 80
        Height = 21
        MaxValue = 30
        TabOrder = 5
        OnChange = KLN_KKM_NUMChange
      end
      object KLN_KKM_PASSWORD: TEdit
        Left = 177
        Top = 271
        Width = 149
        Height = 21
        TabOrder = 6
        Text = 'KLN_KKM_PASSWORD'
        OnChange = KLN_KKM_PASSWORDChange
      end
      object kln_money_edit_mode: TComboBox
        Left = 246
        Top = 155
        Width = 385
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 7
        Visible = False
        Items.Strings = (
          'Работа только по ценам согласно категории клиента'
          'Уменьшение цены в документе на 1 категорию'
          'Уменьшение цены в документе  до закупочной цены'
          'Уменьшение цены в документе  ниже закупочной цены')
      end
      object cmbKLN_FRM: TComboBox
        Left = 246
        Top = 305
        Width = 218
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 8
        Items.Strings = (
          ''
          'Основная фирма'
          'Дополнительная фирма'
          'Отдельная фирма'
          'Неиспользуемая фирма'
          'Франчайзер')
      end
      object cbKlnUseNDS: TCheckBox
        Left = 246
        Top = 374
        Width = 326
        Height = 21
        Caption = 'Выделять НДС при автоматических продажах'
        TabOrder = 9
      end
      object PRICE_TYP: TComboBox
        Left = 246
        Top = 340
        Width = 218
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 10
        Items.Strings = (
          'Общий'
          'Собственный')
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Свойства'
      ImageIndex = 7
      object RxDBGrid4: TRxDBGrid
        Left = 7
        Top = 0
        Width = 536
        Height = 306
        DataSource = DsPropKLN
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColExit = RxDBGrid4ColExit
        OnDrawColumnCell = RxDBGrid4DrawColumnCell
        OnExit = RxDBGrid4Exit
        OnShowEditor = RxDBGrid4ShowEditor
        Columns = <
          item
            Expanded = False
            FieldName = 'PROPKLN_NAME'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Свойство'
            Width = 191
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALUESTR'
            Title.Alignment = taCenter
            Title.Caption = 'Значение'
            Width = 209
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALUEINT'
            Visible = False
          end>
      end
      object in_place_combo: TRxDBLookupCombo
        Left = 374
        Top = 394
        Width = 179
        Height = 28
        DropDownCount = 8
        LookupField = 'value'
        LookupDisplay = 'display_value'
        LookupSource = ds_in_place
        TabOrder = 1
        OnChange = in_place_comboChange
        OnExit = in_place_comboExit
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Направление'
      ImageIndex = 8
      OnShow = TabSheet9Show
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 33
        Width = 838
        Height = 333
        DataSource = DsNaprKln
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColExit = RxDBGrid4ColExit
        OnDrawColumnCell = RxDBGrid4DrawColumnCell
        OnExit = RxDBGrid4Exit
        OnShowEditor = RxDBGrid4ShowEditor
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 668
        Height = 28
        ButtonHeight = 24
        ButtonWidth = 25
        Caption = 'ToolBar1'
        Images = DataModule1.ImageList1
        TabOrder = 1
        object NewNapr: TToolButton
          Left = 0
          Top = 2
          Caption = 'NewNapr'
          ImageIndex = 0
          OnClick = NewNaprClick
        end
        object ToolButton4: TToolButton
          Left = 25
          Top = 2
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton5: TToolButton
          Left = 33
          Top = 2
          Caption = 'ToolButton5'
          ImageIndex = 2
          OnClick = ToolButton5Click
        end
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'Продает в розницу...'
      ImageIndex = 9
      object ToolBar3: TToolBar
        Left = 0
        Top = 0
        Width = 668
        Height = 28
        ButtonHeight = 24
        ButtonWidth = 25
        Caption = 'ToolBar1'
        Images = DataModule1.ImageList1
        TabOrder = 0
        object ToolButton3: TToolButton
          Left = 0
          Top = 2
          Caption = 'NewNapr'
          ImageIndex = 0
          OnClick = ToolButton3Click
        end
        object ToolButton6: TToolButton
          Left = 25
          Top = 2
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton7: TToolButton
          Left = 33
          Top = 2
          Caption = 'ToolButton5'
          ImageIndex = 2
          OnClick = ToolButton5Click
        end
      end
      object RxDBGrid2: TRxDBGrid
        Left = 0
        Top = 33
        Width = 838
        Height = 333
        DataSource = DsTwSaler
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColExit = RxDBGrid4ColExit
        OnDrawColumnCell = RxDBGrid4DrawColumnCell
        OnExit = RxDBGrid4Exit
        OnShowEditor = RxDBGrid4ShowEditor
      end
    end
    object TabSheet11: TTabSheet
      Caption = 'Дисконтные карты'
      ImageIndex = 10
      OnShow = TabSheet11Show
      object ToolBar4: TToolBar
        Left = 0
        Top = 0
        Width = 668
        Height = 28
        ButtonHeight = 24
        ButtonWidth = 25
        Caption = 'ToolBar1'
        Images = DataModule1.ImageList1
        TabOrder = 0
        object ToolButton8: TToolButton
          Left = 0
          Top = 2
          Caption = 'NewNapr'
          ImageIndex = 0
        end
        object ToolButton9: TToolButton
          Left = 25
          Top = 2
          Width = 8
          Caption = 'ToolButton4'
          ImageIndex = 1
          Style = tbsSeparator
        end
        object ToolButton10: TToolButton
          Left = 33
          Top = 2
          Caption = 'ToolButton5'
          ImageIndex = 2
        end
      end
      object RxDBGrid3: TRxDBGrid
        Left = -16
        Top = 33
        Width = 838
        Height = 333
        DataSource = ds_cards
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -14
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 582
        Width = 668
        Height = 19
        Panels = <
          item
            Width = 150
          end
          item
            Width = 50
          end>
        SimplePanel = False
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 832
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
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
      ImageIndex = 40
      Style = tbsSeparator
    end
    object BtnSave: TToolButton
      Left = 33
      Top = 2
      Hint = 'Сохранить и выйти (Ctrl+Enter)'
      Caption = 'BtnSave'
      ImageIndex = 39
      OnClick = BtnSaveClick
    end
    object BtnApply: TToolButton
      Left = 58
      Top = 2
      Hint = 'Применить'
      Caption = 'BtnApply'
      ImageIndex = 38
      OnClick = BtnApplyClick
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 466
    Top = 207
  end
  object KlnTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 588
    Top = 252
  end
  object QrUsgroup: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = KlnTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select usgroup_id,usgroup_name from usgroup'
      'order by usgroup_name')
    Left = 608
    Top = 364
    object QrUsgroupUSGROUP_ID: TIntegerField
      FieldName = 'USGROUP_ID'
      Required = True
    end
    object QrUsgroupUSGROUP_NAME: TIBStringField
      FieldName = 'USGROUP_NAME'
      Required = True
      Size = 254
    end
  end
  object DsUsgroup: TDataSource
    DataSet = QrUsgroup
    Left = 640
    Top = 292
  end
  object PopupMenu1: TPopupMenu
    Left = 12
    Top = 376
    object MnSave: TMenuItem
      Caption = 'Сохранить и выйти'
      ShortCut = 16397
      OnClick = BtnSaveClick
    end
    object MnApply: TMenuItem
      Caption = 'Применить'
      OnClick = BtnApplyClick
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 10
    Top = 251
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 9
    Top = 314
  end
  object MemProperty: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'value'
        DataType = ftString
        Size = 252
      end>
    Left = 185
    Top = 354
    object MemPropertyID: TIntegerField
      FieldName = 'ID'
    end
    object MemPropertyvalue: TStringField
      FieldName = 'value'
      Size = 252
    end
  end
  object DsProperty: TDataSource
    DataSet = MemProperty
    Left = 33
    Top = 446
  end
  object PropKLN: TRxMemoryData
    FieldDefs = <
      item
        Name = 'PROPKLN_ID'
        DataType = ftInteger
      end
      item
        Name = 'TYP'
        DataType = ftInteger
      end
      item
        Name = 'PROPKLN_NAME'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'VALUEINT'
        DataType = ftInteger
      end
      item
        Name = 'VALUESTR'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'MODYFIED'
        DataType = ftInteger
      end>
    AfterScroll = PropKLNAfterScroll
    Left = 351
    Top = 224
    object PropKLNPROPKLN_ID: TIntegerField
      FieldName = 'PROPKLN_ID'
      Origin = 'LIST_PROP_KLN.PROPKLN_ID'
    end
    object PropKLNTYP: TIntegerField
      FieldName = 'TYP'
      Origin = 'LIST_PROP_KLN.TYP'
    end
    object PropKLNPROPKLN_NAME: TIBStringField
      FieldName = 'PROPKLN_NAME'
      Origin = 'LIST_PROP_KLN.PROPKLN_NAME'
      Size = 32
    end
    object PropKLNVALUEINT: TIntegerField
      FieldName = 'VALUEINT'
      Origin = 'LIST_PROP_KLN.VALUEINT'
      OnChange = PropKLNVALUEINTChange
    end
    object PropKLNVALUESTR: TIBStringField
      FieldName = 'VALUESTR'
      Origin = 'LIST_PROP_KLN.VALUESTR'
      OnChange = PropKLNVALUESTRChange
      Size = 64
    end
    object PropKLNMODYFIED: TIntegerField
      FieldName = 'MODYFIED'
    end
  end
  object DsPropKLN: TDataSource
    DataSet = PropKLN
    Left = 211
    Top = 413
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 14
    Top = 147
  end
  object QueryWork3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 10
    Top = 201
  end
  object kln_worktype: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.ReportTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from kln_worktype'
      'order by kln_worktype_name')
    Left = 328
    Top = 121
    object kln_worktypeKLN_WORKTYPE_ID: TIntegerField
      FieldName = 'KLN_WORKTYPE_ID'
      Origin = 'KLN_WORKTYPE.KLN_WORKTYPE_ID'
      Required = True
    end
    object kln_worktypeKLN_WORKTYPE_NAME: TIBStringField
      FieldName = 'KLN_WORKTYPE_NAME'
      Origin = 'KLN_WORKTYPE.KLN_WORKTYPE_NAME'
      Required = True
      Size = 32
    end
    object kln_worktypeTM: TDateTimeField
      FieldName = 'TM'
      Origin = 'KLN_WORKTYPE.TM'
    end
  end
  object ds_in_place: TDataSource
    DataSet = in_place_combo_data
    Left = 580
    Top = 137
  end
  object in_place_combo_data: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'display_value'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'value'
        DataType = ftString
        Size = 32
      end>
    Left = 576
    Top = 185
    object in_place_combo_datadisplace_value: TStringField
      FieldName = 'display_value'
      Size = 32
    end
    object in_place_combo_datavalue: TStringField
      DisplayWidth = 32
      FieldName = 'value'
      Size = 32
    end
  end
  object DsNaprKln: TDataSource
    DataSet = MemNapr
    Left = 283
    Top = 318
  end
  object NaprKln: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = VidTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select twtree.twtree_full as tw_nam, twtree.twtree_id as twgroup' +
        '_id, kln_napr.kln_napr_id, kln_napr.typ_kln, kln_napr.skid_kat'
      'from kln_napr, twtree'
      
        'where twtree.twtree_id=kln_napr.twgroup_id and kln_napr.kln_id=:' +
        'kln_id')
    Left = 281
    Top = 373
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'kln_id'
        ParamType = ptUnknown
      end>
    object NaprKlnTW_NAM: TIBStringField
      DisplayWidth = 50
      FieldName = 'TW_NAM'
      Origin = 'TWTREE.TWTREE_FULL'
      Required = True
      Size = 254
    end
    object NaprKlnSKID_KAT: TIntegerField
      FieldName = 'SKID_KAT'
      Origin = 'KLN_NAPR.SKID_KAT'
    end
    object NaprKlnKLN_NAPR_ID: TIntegerField
      FieldName = 'KLN_NAPR_ID'
      Origin = 'KLN_NAPR.KLN_NAPR_ID'
      Required = True
      Visible = False
    end
    object NaprKlnTWGROUP_ID: TIntegerField
      FieldName = 'TWGROUP_ID'
      Origin = 'TWTREE.TWTREE_ID'
      Required = True
      Visible = False
    end
    object NaprKlnTYP_KLN: TIntegerField
      FieldName = 'TYP_KLN'
      Origin = 'KLN_NAPR.TYP_KLN'
    end
  end
  object MemNapr: TRxMemoryData
    FieldDefs = <
      item
        Name = 'TWGROUP_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TW_NAM'
        Attributes = [faRequired]
        DataType = ftString
        Size = 128
      end
      item
        Name = 'KLN_NAPR_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SKID_KAT'
        DataType = ftInteger
      end
      item
        Name = 'TYP_KLN'
        DataType = ftInteger
      end>
    Left = 21
    Top = 102
    object MemNaprTWGROUP_ID: TIntegerField
      FieldName = 'TWGROUP_ID'
      Required = True
      Visible = False
    end
    object MemNaprTW_NAM: TIBStringField
      DisplayLabel = 'Наименование'
      DisplayWidth = 50
      FieldName = 'TW_NAM'
      Required = True
      Size = 128
    end
    object MemNaprKLN_NAPR_ID: TIntegerField
      FieldName = 'KLN_NAPR_ID'
      Required = True
      Visible = False
    end
    object MemNaprSKID_KAT: TIntegerField
      FieldName = 'SKID_KAT'
      Visible = False
    end
    object MemNaprTYP_KLN2: TIntegerField
      FieldName = 'TYP_KLN'
      Origin = 'KLN_NAPR.TYP_KLN'
      Visible = False
    end
    object MemNaprTyp: TStringField
      DisplayLabel = 'Тип продаж'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Typ'
      LookupDataSet = Vid
      LookupKeyFields = 'ID'
      LookupResultField = 'VID'
      KeyFields = 'TYP_KLN'
      Transliterate = False
      Lookup = True
    end
    object MemNaprskid: TStringField
      DisplayLabel = 'Категория цен'
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'skid'
      LookupDataSet = Ktg
      LookupKeyFields = 'ID'
      LookupResultField = 'VID'
      KeyFields = 'SKID_KAT'
      Size = 10
      Lookup = True
    end
  end
  object Vid: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = VidTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Vid_prod where typ=1')
    Left = 504
    Top = 273
  end
  object VidTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 390
    Top = 180
  end
  object Ktg: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = VidTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from Vid_prod where typ=2'
      '')
    Left = 460
    Top = 273
  end
  object DsTwSaler: TDataSource
    DataSet = memtwSaler
    Left = 223
    Top = 262
  end
  object twSaler: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = VidTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select cfg.cfg_id,'
      'twtree.twtree_full as tw_nam,'
      'shop.shop_name,'
      'cfg.cfg_set1 frm_id,'
      'cfg.cfg_set2 shop_id,'
      'cfg.cfg_set3 twtree_id'
      'from twtree, cfg, shop'
      ''
      'where twtree.twtree_id=cfg.cfg_set3'
      'and cfg.cfg_set1=:kln_id'
      'and shop.shop_id=cfg.cfg_set2')
    Left = 221
    Top = 301
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'kln_id'
        ParamType = ptUnknown
      end>
    object twSalerTW_NAM: TIBStringField
      DisplayWidth = 20
      FieldName = 'TW_NAM'
      Origin = 'TWTREE.TWTREE_FULL'
      Required = True
      Size = 254
    end
    object twSalerSHOP_NAME: TIBStringField
      DisplayWidth = 20
      FieldName = 'SHOP_NAME'
      Origin = 'SHOP.SHOP_NAME'
      Required = True
      Size = 254
    end
    object twSalerFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
      Origin = 'CFG.CFG_SET1'
    end
    object twSalerSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'CFG.CFG_SET2'
    end
    object twSalerTWTREE_ID: TIntegerField
      FieldName = 'TWTREE_ID'
      Origin = 'CFG.CFG_SET3'
    end
    object twSalerCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
      Origin = 'CFG.CFG_ID'
      Required = True
    end
  end
  object memtwSaler: TRxMemoryData
    FieldDefs = <
      item
        Name = 'TW_NAM'
        Attributes = [faRequired]
        DataType = ftString
        Size = 254
      end
      item
        Name = 'FRM_ID'
        DataType = ftInteger
      end
      item
        Name = 'SHOP_ID'
        DataType = ftInteger
      end
      item
        Name = 'TWTREE_ID'
        DataType = ftInteger
      end
      item
        Name = 'CFG_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    Left = 225
    Top = 226
    object memtwSalerTW_NAM: TIBStringField
      DisplayWidth = 20
      FieldName = 'TW_NAM'
      Origin = 'TWTREE.TWTREE_FULL'
      Required = True
      Size = 254
    end
    object memtwSalerFRM_ID: TIntegerField
      FieldName = 'FRM_ID'
      Origin = 'CFG.CFG_SET1'
    end
    object memtwSalerSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Origin = 'CFG.CFG_SET2'
    end
    object memtwSalerTWTREE_ID: TIntegerField
      FieldName = 'TWTREE_ID'
      Origin = 'CFG.CFG_SET3'
    end
    object memtwSalerCFG_ID: TIntegerField
      FieldName = 'CFG_ID'
      Origin = 'CFG.CFG_ID'
      Required = True
    end
    object memtwSalerSHOP_NAME1: TStringField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'SHOP_NAME1'
      LookupDataSet = DataModule1.MainDicShop
      LookupKeyFields = 'SHOP_ID'
      LookupResultField = 'SHOP_NAME'
      KeyFields = 'SHOP_ID'
      Size = 253
      Lookup = True
    end
  end
  object mem_cards: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'CARD_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CARD_NUM'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    Left = 129
    Top = 122
    object mem_cardsCARD_ID: TIntegerField
      DisplayLabel = 'carid'
      DisplayWidth = 22
      FieldName = 'CARD_ID'
      Origin = 'CARD.CARD_ID'
      Required = True
    end
    object mem_cardsCARD_NUM: TIntegerField
      DisplayLabel = 'Номер карты'
      DisplayWidth = 34
      FieldName = 'CARD_NUM'
      Origin = 'CARD.CARD_NUM'
      Required = True
    end
  end
  object ds_cards: TDataSource
    DataSet = mem_cards
    Left = 127
    Top = 182
  end
  object query_cards: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = tran_cards
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select card_id, card_num from card, relation'
      'where relation.relation_typ = 10'
      'and relation.relation_name='#39'KLN_CARD_RELATION'#39
      'and relation.child_id = card.card_id'
      'and relation.parent_id = :kln_id')
    Left = 125
    Top = 237
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'kln_id'
        ParamType = ptUnknown
      end>
    object query_cardsCARD_ID: TIntegerField
      FieldName = 'CARD_ID'
      Origin = 'CARD.CARD_ID'
      Required = True
    end
    object query_cardsCARD_NUM: TIntegerField
      FieldName = 'CARD_NUM'
      Origin = 'CARD.CARD_NUM'
      Required = True
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 460
    Top = 453
  end
  object tran_cards: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 124
    Top = 285
  end
end
