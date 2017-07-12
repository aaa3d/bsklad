object Doc_RN: TDoc_RN
  Left = 818
  Top = 221
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Расходная накладная'
  ClientHeight = 601
  ClientWidth = 861
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label18: TLabel
    Left = 404
    Top = 56
    Width = 51
    Height = 13
    Caption = 'На счете :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 861
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton5: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton5'
      ImageIndex = 110
      OnClick = ToolButton5Click
    end
    object ToolButton7: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 46
      Style = tbsSeparator
    end
    object Btn_Prow: TToolButton
      Left = 33
      Top = 2
      Hint = 'Провести накладную'
      Caption = 'Btn_Prow'
      ImageIndex = 22
      OnClick = Btn_ProwClick
    end
    object Btn_Unprow: TToolButton
      Left = 58
      Top = 2
      Hint = 'Снять с проводки накладную'
      Caption = 'Btn_Unprow'
      ImageIndex = 23
      OnClick = Btn_UnprowClick
    end
    object ToolButton8: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object Btn_SAVE: TToolButton
      Left = 91
      Top = 2
      Hint = 'Сохранить накладную (Ctrl+Enter)'
      Caption = 'Btn_SAVE'
      ImageIndex = 39
      OnClick = Btn_SAVEClick
    end
    object Btn_Apply: TToolButton
      Left = 116
      Top = 2
      Hint = 'Применить'
      Caption = 'Btn_Apply'
      ImageIndex = 38
      OnClick = Btn_ApplyClick
    end
    object ToolButton4: TToolButton
      Left = 141
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object BtnPrintNpz: TToolButton
      Left = 149
      Top = 2
      Action = print_mh3
    end
    object Btn_Print: TToolButton
      Left = 174
      Top = 2
      Hint = 'Печать накладную(F9)'
      Caption = 'Btn_Print'
      ImageIndex = 9
      OnClick = Btn_PrintClick
    end
    object ToolButton9: TToolButton
      Left = 199
      Top = 2
      Action = PrintTWCheck
    end
    object ToolButton21: TToolButton
      Left = 224
      Top = 2
      Hint = 'Напечатать оборот накладной с доставкой'
      Action = PrintRndRear
    end
    object Btn_PrintKKM: TToolButton
      Left = 249
      Top = 2
      Hint = 'Печать кассового чека (F7)'
      Caption = 'Btn_PrintKKM'
      ImageIndex = 45
      OnClick = Btn_PrintKKMClick
    end
    object Btn_Propertis: TToolButton
      Left = 274
      Top = 2
      Hint = 'История накладная (F12)'
      Caption = 'Btn_Propertis'
      ImageIndex = 3
      OnClick = Btn_PropertisClick
    end
    object Btn_Subdoc: TToolButton
      Left = 299
      Top = 2
      Hint = 'Создать на основании...'
      Caption = 'Btn_Subdoc'
      ImageIndex = 24
      OnClick = Btn_SubdocClick
    end
    object ToolButton11: TToolButton
      Left = 324
      Top = 2
      Width = 9
      Caption = 'ToolButton11'
      ImageIndex = 24
      Style = tbsSeparator
    end
    object Btn_NODISCONT: TToolButton
      Left = 333
      Top = 2
      Hint = 'Ликвидировать дисконт'
      Caption = 'Btn_NODISCONT'
      ImageIndex = 73
      OnClick = Btn_NODISCONTClick
    end
    object ToolButton6: TToolButton
      Left = 358
      Top = 2
      Width = 10
      Caption = 'ToolButton6'
      ImageIndex = 47
      Style = tbsSeparator
    end
    object Btn_DicTow: TToolButton
      Left = 368
      Top = 2
      Hint = 'Товары по каталогу'
      Caption = 'Btn_DicTow'
      ImageIndex = 37
      OnClick = Btn_DicTowClick
    end
    object Btn_DelTow: TToolButton
      Left = 393
      Top = 2
      Hint = 'Удалить товар из накладной'
      Caption = 'Btn_DelTow'
      ImageIndex = 2
      OnClick = Btn_DelTowClick
    end
    object ToolButton14: TToolButton
      Left = 418
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Btn_Detal: TToolButton
      Left = 426
      Top = 2
      Hint = 'Подробная информация о товаре...'
      Caption = 'Btn_Detal'
      ImageIndex = 11
      OnClick = Btn_DetalClick
    end
    object Btn_Analiz: TToolButton
      Left = 451
      Top = 2
      Hint = 'Анализ товара...'
      Caption = 'Btn_Analiz'
      ImageIndex = 12
      OnClick = Btn_AnalizClick
    end
    object Btn_Marketing: TToolButton
      Left = 476
      Top = 2
      Hint = 'Маркетинговые исследования'
      Caption = 'Btn_Marketing'
      ImageIndex = 10
      OnClick = Btn_MarketingClick
    end
    object ToolButton1: TToolButton
      Left = 501
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object Btn_PrintCenn: TToolButton
      Left = 509
      Top = 2
      Hint = 'Напечатать ценник на выбранный товар (F9)'
      Caption = 'Btn_PrintCenn'
      ImageIndex = 40
      OnClick = Btn_PrintCennClick
    end
    object Btn_PrintCennMore: TToolButton
      Left = 534
      Top = 2
      Hint = 'Напечатать цениики на все товары из счёта (F9)'
      Caption = 'Btn_PrintCennMore'
      ImageIndex = 41
      OnClick = Btn_PrintCennMoreClick
    end
    object ToolButton2: TToolButton
      Left = 559
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object Btn_Ost: TToolButton
      Left = 567
      Top = 2
      Hint = 'Установить количество равным остатку товара'
      Caption = 'Btn_Ost'
      ImageIndex = 130
      OnClick = Btn_OstClick
    end
    object Btn_RefreshOst: TToolButton
      Left = 592
      Top = 2
      Hint = 'Обновить информацию об остатках...(Ctrl+~)'
      ImageIndex = 44
      OnClick = Btn_RefreshOstClick
    end
    object ToolButton12: TToolButton
      Left = 617
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 179
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 625
      Top = 2
      Action = ActRnToPO
    end
    object ToolButton13: TToolButton
      Left = 650
      Top = 2
      Action = ActRnToStorno
    end
    object ToolButton15: TToolButton
      Left = 675
      Top = 2
      Width = 8
      Caption = 'ToolButton15'
      ImageIndex = 180
      Style = tbsSeparator
    end
    object ToolButton16: TToolButton
      Left = 683
      Top = 2
      Action = ActShowPO
    end
    object ToolButton22: TToolButton
      Left = 708
      Top = 2
      Width = 8
      Caption = 'ToolButton22'
      ImageIndex = 45
      Style = tbsSeparator
    end
    object btnOpenDrawer: TToolButton
      Left = 716
      Top = 2
      Action = actOpenDrawer
    end
    object ToolButton20: TToolButton
      Left = 741
      Top = 2
      Caption = 'ToolButton20'
      ImageIndex = 197
      OnClick = ToolButton20Click
    end
    object ToolButton23: TToolButton
      Left = 766
      Top = 2
      Caption = 'ToolButton23'
      ImageIndex = 169
      OnClick = ToolButton23Click
    end
    object ToolButton24: TToolButton
      Left = 791
      Top = 2
      Caption = 'ToolButton24'
      ImageIndex = 28
      OnClick = ToolButton24Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 582
    Width = 861
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
    Width = 861
    Height = 553
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 861
      Height = 273
      Align = alTop
      TabOrder = 0
      object Label3: TLabel
        Left = 62
        Top = 8
        Width = 34
        Height = 12
        Caption = 'Фирма :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 61
        Top = 24
        Width = 35
        Height = 12
        Caption = 'Клиент :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 406
        Top = 6
        Width = 57
        Height = 12
        Caption = 'Банк фирмы :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 400
        Top = 24
        Width = 62
        Height = 12
        Caption = 'Банк клиента :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 42
        Top = 140
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
      object Label10: TLabel
        Left = 600
        Top = 84
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
      object Label11: TLabel
        Left = 606
        Top = 102
        Width = 27
        Height = 12
        Caption = 'Дата :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 428
        Top = 120
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
      object Label1: TLabel
        Left = 896
        Top = 52
        Width = 38
        Height = 12
        Caption = 'Валюта :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label2: TLabel
        Left = 60
        Top = 122
        Width = 36
        Height = 12
        Caption = 'Скидка :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 45
        Top = 64
        Width = 50
        Height = 12
        Caption = 'Со склада :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 27
        Top = 84
        Width = 69
        Height = 12
        Caption = 'Вид накладной :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 918
        Top = 106
        Width = 27
        Height = 12
        Caption = 'Курс :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label15: TLabel
        Left = 48
        Top = 202
        Width = 48
        Height = 12
        Alignment = taRightJustify
        Caption = 'Через кого:'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 228
        Top = 84
        Width = 54
        Height = 12
        Caption = 'Дисконт № :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 16
        Top = 184
        Width = 81
        Height = 12
        Caption = 'Доп. информация :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Image1: TImage
        Left = 4
        Top = 4
        Width = 32
        Height = 32
        AutoSize = True
        Picture.Data = {
          07544269746D617042080000424D420800000000000042000000280000002000
          0000200000000100100003000000000800000000000000000000000000000000
          0000007C0000E00300001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7F00002104A318A2100000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7F4008EA51252DE42C821820044108FF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7F0000200068496C62042904290535C42C621483140000FF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7F2004463DC8516D62E428E428C428C428C424A31C621401084108FF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
          2000463DA949C84D6C62E524C424E320E320A420A320C42C6210610CA3140000
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2000
          6214663DA849A8516C62C420C420C320A31C841C831CE42C4214821881144110
          20004108FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00002008052D
          4114863DA84988516C5EA220A2208318A32081108114E42C4110811481144114
          61142008A314FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000025352639
          4314463DA84DA8516C62821882148210821082108210C4242210611461104110
          411041102008FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000020000529473D8741
          62108749A849A8496C62611461108210821081108114A424421461144110610C
          2108210C2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FC618621404312639C949
          6110463DA849A8556C62611461108210821081108218C428421061144210210C
          210420082008FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2925621404314639A94D
          4214863DA84D88556C62611461108210821081108218C328411061144210210C
          210420082008FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F820CC320053126350B56
          4214663DA949C8516D62411061108210821081148218C42C421461144210210C
          2104010C010CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F010C052D043126390B56
          61144645A84988516C5EA21882108210821082188218C3246210421042104208
          420802100210FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F410C052D04312639E94D
          62146639A845C8456C5E4B5A473DE42C811482188218C328420C421042104208
          010C02100210FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2208042905312635EA55
          4218864146392A52AE66AE66AE66AE66CA516745C324622041104210210C4208
          010C02100210FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2008052905350639A94D
          62182639A949AE666D628C628D624C5E4C5E6C5E674141108324011021084208
          010C02100210FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F420CE42C062906398845
          8214E52C4C5E4C5E2B5A4B5E6C5E4C5E2B5A673D62140531AA4D4645831C4214
          010C02100210FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F020C0629062906390635
          63146214E424673DC9492A564B5E2A56A41C6214673DEA51CA4D884946452541
          053102100210FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F6210062905290539A74D
          2B5ACA4D052DA31C8318884188418318A4206741A955CB51C845884946414645
          4645E42CA318FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F02100629A318884D2A5E
          EA552A560A56CA51EA51253142104110C428473DA84D8851894D864946454645
          A21C610CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F010CC428C955C94DEA55
          A951C951CA51A84DE428473DA9494739C4286214831CE52CE5380539E4304108
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000C320A21C0531CA4D
          CA51A84D87416214A31C6745C951C94D0952EA5506316114420C210CFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2008210C
          4110663D6214A320264166458849874D87494745E4302108FF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7F20048214821405394645C3206110FF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7F20044108FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
          FF7FFF7FFF7FFF7FFF7FFF7FFF7F}
        Transparent = True
      end
      object Label4: TLabel
        Left = 388
        Top = 44
        Width = 74
        Height = 12
        Caption = 'Вид реализации :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RVIDKLNCAP: TLabel
        Left = 401
        Top = 64
        Width = 61
        Height = 12
        Caption = 'Детализация :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 596
        Top = 144
        Width = 37
        Height = 12
        Hint = 'Табельный номер сотрудника, оформившего накладную'
        Caption = 'Таб. № :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 606
        Top = 124
        Width = 27
        Height = 12
        Caption = 'НДС :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        PopupMenu = PopupNDS
      end
      object Label21: TLabel
        Left = 830
        Top = 88
        Width = 20
        Height = 12
        Caption = 'НП :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        PopupMenu = PopupNP
        Visible = False
      end
      object Label23: TLabel
        Left = 649
        Top = 163
        Width = 33
        Height = 12
        Caption = 'Масса :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 424
        Top = 164
        Width = 54
        Height = 12
        Caption = 'Основание: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 580
        Top = 228
        Width = 85
        Height = 13
        Caption = 'Наценка от зак: '
      end
      object Label25: TLabel
        Left = 37
        Top = 44
        Width = 58
        Height = 12
        Caption = 'Получатель :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 616
        Top = 184
        Width = 37
        Height = 13
        Caption = 'Скидка'
        Visible = False
      end
      object label_PN_MANAGER: TLabel
        Left = 232
        Top = 248
        Width = 209
        Height = 13
        Caption = 'НЕ УКАЗАН СКЛАД И МЕНЕДЖЕР'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object KLN_NAME: TEdit
        Left = 98
        Top = 22
        Width = 261
        Height = 17
        AutoSize = False
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'KLN_NAME'
      end
      object FRM_BNK: TEdit
        Left = 464
        Top = 4
        Width = 293
        Height = 17
        AutoSize = False
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'FRM_BNK'
      end
      object KLN_BNK: TEdit
        Left = 464
        Top = 22
        Width = 293
        Height = 17
        AutoSize = False
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Text = 'KLN_BNK'
      end
      object RN_OSN: TMemo
        Left = 98
        Top = 138
        Width = 325
        Height = 41
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Memo1')
        MaxLength = 252
        ParentFont = False
        TabOrder = 5
        OnChange = RN_RNVIDChange
      end
      object RN_NUM: TEdit
        Left = 636
        Top = 80
        Width = 121
        Height = 17
        AutoSize = False
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Text = 'RN_NUM'
      end
      object RN_DATE: TDateEdit
        Left = 636
        Top = 100
        Width = 121
        Height = 19
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
        OnChange = RN_DATEChange
      end
      object RN_VALUTA: TRxDBLookupCombo
        Left = 936
        Top = 56
        Width = 121
        Height = 20
        DropDownCount = 8
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        LookupField = 'VALUTA_ID'
        LookupDisplay = 'VALUTA_FULL'
        LookupSource = DataModule1.MainDsValuta
        ParentFont = False
        TabOrder = 6
        Visible = False
        OnChange = RN_RNVIDChange
      end
      object RN_SKID: TRxCalcEdit
        Left = 98
        Top = 120
        Width = 91
        Height = 17
        AutoSize = False
        DecimalPlaces = 14
        DisplayFormat = ',#0.000000'
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 7
        OnChange = RN_SKIDChange
      end
      object SKL: TRxDBLookupCombo
        Left = 98
        Top = 60
        Width = 143
        Height = 20
        DropDownCount = 12
        EscapeClear = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DSSkl
        ParentFont = False
        TabOrder = 8
        OnChange = SKLChange
      end
      object RN_RNVID: TRxDBLookupCombo
        Left = 98
        Top = 80
        Width = 281
        Height = 20
        DropDownCount = 8
        EscapeClear = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        LookupField = 'RNVID_ID'
        LookupDisplay = 'RNVID_NAM'
        LookupSource = DataModule1.MainDsRnVid
        ParentFont = False
        TabOrder = 9
        OnChange = RN_RNVIDChange
      end
      object RN_KURS: TRxCalcEdit
        Left = 948
        Top = 104
        Width = 121
        Height = 19
        AutoSize = False
        DisplayFormat = ',#0.00 руб/$'
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
        OnChange = RN_KURSChange
      end
      object RN_DOST: TCheckBox
        Left = 19
        Top = 100
        Width = 78
        Height = 17
        Caption = 'Доставка на :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnClick = RN_DOSTClick
      end
      object RN_DISKONT: TEdit
        Left = 284
        Top = 100
        Width = 95
        Height = 17
        AutoSize = False
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        Text = 'RN_DISKONT'
      end
      object RN_SKID_TXT: TEdit
        Left = 98
        Top = 180
        Width = 323
        Height = 17
        AutoSize = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        Text = 'RN_SKID_TXT'
        OnChange = RN_RNVIDChange
      end
      object BTN_KLN: TBitBtn
        Left = 364
        Top = 24
        Width = 13
        Height = 17
        Hint = 'Выбрать клиента из справочника контактов (F10)'
        TabOrder = 14
        TabStop = False
        OnClick = BTN_KLNClick
        Glyph.Data = {
          EE000000424DEE0000000000000076000000280000000F0000000F0000000100
          0400000000007800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555008000000000085505080FFFFFF0505500000000000F0F5500FFFFFFFFF0F
          055050F00F00FFF0F55050FFFFFFFFF0F550000FFFFFFFFF00000900F00000F0
          0900090FFFFFFFFF0900000F0000F00F0000550FFFFFFFFF0550550FFF000000
          0000555000FFFFFFFF005555550000000000}
      end
      object RN_SUMM: TRxCalcEdit
        Left = 426
        Top = 132
        Width = 163
        Height = 27
        AutoSize = False
        DisplayFormat = ',#0.00 руб'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 15
      end
      object DOST_DATE: TDateEdit
        Left = 98
        Top = 100
        Width = 91
        Height = 19
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 16
        OnChange = DOST_DATEChange
      end
      object RVID: TRxDBLookupCombo
        Left = 464
        Top = 40
        Width = 293
        Height = 20
        DropDownCount = 8
        EscapeClear = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        LookupField = 'RVID_ID'
        LookupDisplay = 'RVID_NAME'
        LookupSource = DsShopRvid
        ParentFont = False
        TabOrder = 17
        OnChange = RVIDChange
      end
      object RVIDKLN: TRxDBLookupCombo
        Left = 464
        Top = 60
        Width = 293
        Height = 20
        DropDownCount = 8
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        LookupField = 'KLN_ID'
        LookupDisplay = 'KLN_FULL'
        LookupSource = DsRvidKln
        ParentFont = False
        TabOrder = 18
        OnChange = RVIDKLNChange
      end
      object TABEL: TRxCalcEdit
        Left = 636
        Top = 140
        Width = 73
        Height = 19
        AutoSize = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 19
        OnChange = TABELChange
        OnKeyPress = TabelKeyPress
      end
      object Btn_Tabel: TButton
        Left = 708
        Top = 140
        Width = 49
        Height = 19
        Caption = 'Задать'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 20
        OnClick = Btn_TabelClick
      end
      object NDS: TRxCalcEdit
        Left = 636
        Top = 120
        Width = 45
        Height = 19
        AutoSize = False
        DisplayFormat = '#0.00%'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        PopupMenu = PopupNDS
        TabOrder = 21
        OnChange = TABELChange
        OnExit = NDSExit
        OnKeyPress = NDSKeyPress
      end
      object NP: TRxCalcEdit
        Left = 852
        Top = 84
        Width = 45
        Height = 19
        AutoSize = False
        DisplayFormat = '#0.00%'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        PopupMenu = PopupNP
        TabOrder = 22
        Visible = False
        OnChange = TABELChange
        OnKeyPress = TabelKeyPress
      end
      object RN_WEIGHT: TRxCalcEdit
        Left = 684
        Top = 160
        Width = 72
        Height = 18
        AutoSize = False
        DirectInput = False
        DisplayFormat = ',#0.00 кг'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 23
      end
      object RN_SUB: TEdit
        Left = 484
        Top = 160
        Width = 157
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 24
      end
      object cbSkidNoPrint: TCheckBox
        Left = 200
        Top = 120
        Width = 109
        Height = 17
        Hint = 
          'Если галка включена, на печатной форме РН и в товарном чеке '#13#10'не' +
          ' будет печататься скидка'
        Caption = 'Не печатать скидки'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 25
      end
      object FRM: TRxDBLookupCombo
        Left = 98
        Top = 2
        Width = 281
        Height = 23
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'KLN_ID'
        LookupDisplay = 'KLN_FULL'
        LookupSource = DataModule1.MainDsAllFrm
        TabOrder = 26
        OnChange = FRMChange
      end
      object RN_DOV: TMaskEdit
        Left = 780
        Top = 180
        Width = 385
        Height = 21
        TabOrder = 27
        Visible = False
        OnChange = RN_DOVChange
      end
      object RN_WHO: TComboBox
        Left = 97
        Top = 200
        Width = 464
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 28
        Text = 'RN_WHO'
      end
      object KLN_KTG: TEdit
        Left = 243
        Top = 61
        Width = 134
        Height = 17
        AutoSize = False
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 29
        Text = 'KLN_KTG'
      end
      object cbDirectPost: TCheckBox
        Left = 324
        Top = 120
        Width = 97
        Height = 17
        Hint = 
          'Если галка включена, на печатной форме РН и в товарном чеке '#13#10'не' +
          ' будет печататься скидка'
        Caption = 'Прямая поставка'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 30
      end
      object RN_PAYMENT: TCheckBox
        Left = 0
        Top = 228
        Width = 117
        Height = 17
        Hint = 
          'Используется в случае если клиент пришел с платежным поручением ' +
          'или наличными деньгами'#13#10'Ограничение: 30 000 руб.'
        Caption = 'быстрый платеж:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 31
        OnClick = RN_PAYMENTClick
      end
      object PAYMENT_DETAIL: TEdit
        Left = 106
        Top = 228
        Width = 323
        Height = 17
        Hint = 
          'Указать основание проводки: ПП № ... от ....,  наличная сумма ..' +
          '.. руб.'
        AutoSize = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 250
        ParentFont = False
        TabOrder = 32
        Text = '... описание платежа...'
        Visible = False
        OnChange = PAYMENT_DETAILChange
      end
      object RN_NAC: TRxCalcEdit
        Left = 672
        Top = 227
        Width = 85
        Height = 18
        AutoSize = False
        DirectInput = False
        DisplayFormat = ',#0.00р'
        Enabled = False
        ButtonWidth = 0
        NumGlyphs = 2
        TabOrder = 33
      end
      object rn_gp: TEdit
        Left = 98
        Top = 42
        Width = 279
        Height = 17
        AutoSize = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 34
      end
      object chkINTERNET_MAGAZ: TCheckBox
        Left = 464
        Top = 84
        Width = 117
        Height = 17
        Caption = 'Интернет магазин'
        TabOrder = 35
      end
      object comboDiscont: TComboBox
        Left = 615
        Top = 197
        Width = 145
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 36
        Visible = False
        OnChange = comboDiscontChange
        Items.Strings = (
          '---'
          'Праздничный день'
          'Лифт'
          'День рождения'
          'Сопутствующий товар'
          'Поврежденый товар'
          'Компенсация покупателю'
          'Партнер Дикон-Авто')
      end
      object btn_set_sklaD_manager: TButton
        Left = 8
        Top = 248
        Width = 217
        Height = 17
        Caption = 'Указать менеджера и склад разгрузки'
        TabOrder = 37
        OnClick = btn_set_sklaD_managerClick
      end
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 273
      Width = 861
      Height = 280
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 1
      object TabSheet1: TTabSheet
        Caption = 'Список товаров'
        object RxDBGrid1: TRxDBGrid
          Left = 0
          Top = 0
          Width = 853
          Height = 252
          Align = alClient
          DataSource = DsRNS
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = RxDBGrid1DrawColumnCell
          OnGetCellParams = RxDBGrid1GetCellParams
          Columns = <
            item
              Expanded = False
              FieldName = 'RNS_TABEL'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Таб.'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_ART'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Код'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_NAM'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Наименование товара'
              Width = 121
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ED_SHORT'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Ед.'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_MONEY'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Цена'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_SKIDDOLL'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = '% на Курс'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TW_SKID'
              Title.Alignment = taCenter
              Title.Caption = 'Скидка, %'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_OKMONEY'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Итог. цена'
              Width = 73
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
              FieldName = 'TW_SUMM'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Сумма'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OST'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Остаток'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RNS_WEIGHT'
              ReadOnly = True
              Title.Caption = 'Масса, кг'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_NEGABARIT'
              ReadOnly = True
              Title.Caption = 'Негабарит'
              Visible = True
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Обоснование скидок'
        ImageIndex = 1
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 881
          Height = 27
          ButtonHeight = 21
          Caption = 'ToolBar2'
          EdgeBorders = []
          TabOrder = 0
          object Btn_ALLSKID: TBitBtn
            Left = 0
            Top = 2
            Width = 168
            Height = 21
            Hint = 'Сделать у всех одлинаковую скидку'
            Caption = 'Одинаковая скидка у всех'
            TabOrder = 1
            OnClick = Btn_ALLSKIDClick
          end
          object ToolButton3: TToolButton
            Left = 168
            Top = 2
            Width = 8
            Caption = 'ToolButton3'
            Style = tbsSeparator
          end
          object ONE_SKID: TEdit
            Left = 176
            Top = 2
            Width = 369
            Height = 21
            TabOrder = 0
          end
        end
        object RxDBGrid2: TRxDBGrid
          Left = 0
          Top = 27
          Width = 881
          Height = 253
          Align = alClient
          DataSource = DsRNS
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TW_ART'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Код'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_NAM'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Наименование товара'
              Width = 121
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ED_SHORT'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Ед.'
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_MONEY'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Цена'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_SKID'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Скидка, %'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_OKMONEY'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Итог. цена'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_KOL'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Кол-во'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_SUMM'
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = 'Сумма'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SKID_TXT'
              Title.Alignment = taCenter
              Title.Caption = 'Обоснование скидки'
              Width = 184
              Visible = True
            end>
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Предоплаты'
        ImageIndex = 2
        object ToolBar3: TToolBar
          Left = 0
          Top = 0
          Width = 853
          Height = 29
          ButtonHeight = 24
          ButtonWidth = 25
          Caption = 'ToolBar3'
          Images = DataModule1.ImageList1
          TabOrder = 0
          object ToolButton17: TToolButton
            Left = 0
            Top = 2
            Action = ActNewPo
          end
          object ToolButton18: TToolButton
            Left = 25
            Top = 2
            Action = ActOpenPo
          end
          object ToolButton19: TToolButton
            Left = 50
            Top = 2
            Action = ActDelPo
          end
        end
        object RxDBGrid3: TRxDBGrid
          Left = 0
          Top = 29
          Width = 853
          Height = 223
          Align = alClient
          DataSource = DsListPO
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'PO_FULL_NUM'
              Title.Alignment = taCenter
              Title.Caption = 'Номер'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PO_DATE'
              Title.Alignment = taCenter
              Title.Caption = 'Дата'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PO_SUMM'
              Title.Alignment = taCenter
              Title.Caption = 'Сумма'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STORNO_SUMM'
              Title.Alignment = taCenter
              Title.Caption = 'Сторно'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORN_SUMM'
              Title.Alignment = taCenter
              Title.Caption = 'Погашено'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KLN_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Клиент'
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PO_OSN'
              Title.Alignment = taCenter
              Title.Caption = 'Основание'
              Width = 116
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'US_FULL'
              Title.Alignment = taCenter
              Title.Caption = 'Кто оформил'
              Width = 173
              Visible = True
            end>
        end
      end
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 88
    Top = 361
  end
  object MemRNS: TRxMemoryData
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
        Name = 'TW_MONEY'
        DataType = ftFloat
      end
      item
        Name = 'TW_KOL'
        DataType = ftFloat
      end
      item
        Name = 'ED_SHORT'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'RNS_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_ART'
        DataType = ftInteger
      end
      item
        Name = 'TW_SKID'
        DataType = ftFloat
      end
      item
        Name = 'OST'
        DataType = ftFloat
      end
      item
        Name = 'TW_SKIDDOLL'
        DataType = ftFloat
      end
      item
        Name = 'SKID_TXT'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'TW_COLOR'
        DataType = ftInteger
      end
      item
        Name = 'OTG_KOL'
        DataType = ftFloat
      end
      item
        Name = 'MET_MONEY_SHOP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RNS_TABEL'
        DataType = ftInteger
      end
      item
        Name = 'TW_SHORT_NAM'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'TW_WEIGHT'
        DataType = ftFloat
      end
      item
        Name = 'TW_NEGABARIT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TW_SALER_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_NOSKID'
        DataType = ftInteger
      end
      item
        Name = 'TW_SKID_LOAD'
        DataType = ftFloat
      end
      item
        Name = 'napr'
        DataType = ftInteger
      end
      item
        Name = 'ktg'
        DataType = ftInteger
      end
      item
        Name = 'TW_SEB'
        DataType = ftFloat
      end>
    AfterEdit = MemRNSAfterEdit
    OnCalcFields = MemRNSCalcFields
    Left = 394
    Top = 368
    object MemRNSTW_ID: TIntegerField
      FieldName = 'TW_ID'
    end
    object MemRNSTW_NAM: TStringField
      FieldName = 'TW_NAM'
      Size = 254
    end
    object MemRNSTW_MONEY: TFloatField
      FieldName = 'TW_MONEY'
      DisplayFormat = '#0.00'
    end
    object MemRNSTW_KOL: TFloatField
      FieldName = 'TW_KOL'
      OnChange = MemRNSTW_KOLChange
      DisplayFormat = '#0.0000'
    end
    object MemRNSTW_SUMM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_SUMM'
      DisplayFormat = '#0.00 руб'
      Calculated = True
    end
    object MemRNSED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      Size = 32
    end
    object MemRNSSTS_ID: TIntegerField
      FieldName = 'RNS_ID'
    end
    object MemRNSTW_ART: TIntegerField
      FieldName = 'TW_ART'
    end
    object MemRNSTW_SKID: TFloatField
      DisplayWidth = 60
      FieldName = 'TW_SKID'
      OnChange = MemRNSTW_SKIDChange
      DisplayFormat = '#0.0000'
    end
    object MemRNSTW_OKMONEY: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TW_OKMONEY'
      DisplayFormat = '#0.00 руб'
      Calculated = True
    end
    object MemRNSOST: TFloatField
      FieldName = 'OST'
      DisplayFormat = '#0.0000'
    end
    object MemRNSTW_SKIDDOLL: TFloatField
      FieldName = 'TW_SKIDDOLL'
      DisplayFormat = ',#0.000'
    end
    object MemRNSSKID_TXT: TStringField
      FieldName = 'SKID_TXT'
      Size = 254
    end
    object MemRNSTW_COLOR: TIntegerField
      FieldName = 'TW_COLOR'
    end
    object MemRNSOTG_KOL: TFloatField
      FieldName = 'OTG_KOL'
    end
    object MemRNSMET_MONEY_SHOP: TStringField
      FieldName = 'MET_MONEY_SHOP'
      Size = 1
    end
    object MemRNSRNS_TABEL: TIntegerField
      FieldName = 'RNS_TABEL'
    end
    object MemRNSTW_SHORT_NAM: TStringField
      FieldName = 'TW_SHORT_NAM'
      Size = 35
    end
    object MemRNSTW_WEIGHT: TFloatField
      FieldName = 'TW_WEIGHT'
    end
    object MemRNSRNS_WEIGHT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RNS_WEIGHT'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemRNSTW_NEGABARIT: TStringField
      FieldName = 'TW_NEGABARIT'
      Size = 1
    end
    object MemRNSTW_SALER_ID: TIntegerField
      FieldName = 'TW_SALER_ID'
    end
    object MemRNSTW_NOSKID: TIntegerField
      FieldName = 'TW_NOSKID'
    end
    object MemRNSTW_SKID_LOAD: TFloatField
      FieldName = 'TW_SKID_LOAD'
    end
    object MemRNSnapr: TIntegerField
      FieldName = 'napr'
    end
    object MemRNSktg: TIntegerField
      FieldName = 'ktg'
    end
    object MemRNSTW_SEB: TFloatField
      FieldName = 'TW_SEB'
    end
  end
  object DsRNS: TDataSource
    DataSet = MemRNS
    OnDataChange = DsRNSDataChange
    Left = 392
    Top = 425
  end
  object Query1Transaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 84
    Top = 421
  end
  object IBQuery2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 260
    Top = 481
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 828
    Top = 349
    object MnPROW: TMenuItem
      Caption = 'Провести расходную накладную'
      ImageIndex = 22
      ShortCut = 116
      OnClick = Btn_ProwClick
    end
    object MnUnprow: TMenuItem
      Caption = 'Снять с проводки расходную накладную'
      ImageIndex = 23
      ShortCut = 117
      OnClick = Btn_UnprowClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MnSave: TMenuItem
      Caption = 'Сохранить Накладную и выйти... (Ctrl+Enter)'
      ImageIndex = 39
      OnClick = Btn_SAVEClick
    end
    object MnApply: TMenuItem
      Caption = 'Сохранить Накладную без выхода (Применить)'
      ImageIndex = 38
      OnClick = Btn_ApplyClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object MnFRM: TMenuItem
      Caption = 'Поменять фирму'
      ImageIndex = 14
      ShortCut = 16505
    end
    object MnKLN: TMenuItem
      Caption = 'Поменять клиента'
      ImageIndex = 14
      ShortCut = 121
      OnClick = BTN_KLNClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать Расходную накладную'
      ImageIndex = 9
      OnClick = Btn_PrintClick
    end
    object mnuPrintMH3: TMenuItem
      Action = print_mh3
    end
    object N9: TMenuItem
      Action = fastprintRn
    end
    object N7: TMenuItem
      Action = ActDelPo
    end
    object N8: TMenuItem
      Action = PrintTwCheckFast
    end
    object MnuPrintNPZFast: TMenuItem
      Caption = 'Печать накладной внутреннего перемещения без вывода на экран'
      Hint = 'Печать накладной внутреннего перемещения без вывода на экран'
      ShortCut = 32889
      OnClick = MnuPrintNPZFastClick
    end
    object MnPRINTKKM: TMenuItem
      Caption = 'Напечатать кассовый чек'
      ImageIndex = 45
      ShortCut = 118
      OnClick = Btn_PrintKKMClick
    end
    object N5: TMenuItem
      Caption = 'Возврат товара'
      ShortCut = 119
      OnClick = N5Click
    end
    object MnHistory: TMenuItem
      Caption = '"История" расходной накладной'
      ImageIndex = 3
      OnClick = Btn_PropertisClick
    end
    object MnSubDoc: TMenuItem
      Caption = 'Создать новый документ на основании данного счёта'
      ImageIndex = 24
      OnClick = Btn_SubdocClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object MnTW: TMenuItem
      Caption = 'Товары по каталогу '
      ImageIndex = 37
      ShortCut = 122
      OnClick = Btn_DicTowClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить товар из накладной'
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
      Caption = 'Напечатать ценник'
      ImageIndex = 40
      OnClick = Btn_PrintCennClick
    end
    object MnCennMore: TMenuItem
      Caption = 'Напечатать ценники на все товары из накладной  '
      ImageIndex = 41
      OnClick = Btn_PrintCennMoreClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object MnOst: TMenuItem
      Caption = 'Установить количество равным остатку товаров'
      ImageIndex = 130
      OnClick = Btn_OstClick
    end
    object MnRefreshOst: TMenuItem
      Caption = 'Обновить информацию о сумме и об остатках товаров (Ctrl+~)'
      ImageIndex = 44
      OnClick = Btn_RefreshOstClick
    end
    object MnuFastInfo: TMenuItem
      Caption = 'Отобразить распределение товара в магазине (~)'
      ImageIndex = 44
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MnSet_Skid: TMenuItem
      Caption = 'Определить скидку на цену товара'
      ShortCut = 16467
      OnClick = MnSet_SkidClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 648
    Top = 366
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 708
    Top = 362
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 710
    Top = 410
  end
  object RvidTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 456
    Top = 289
  end
  object DicShopRvid: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = RvidTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from rvid_shop_list(:shop_id,:rntyp_id,:rn_id)'
      'order by rvid_name')
    Left = 346
    Top = 349
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'shop_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rntyp_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rn_id'
        ParamType = ptUnknown
      end>
    object DicShopRvidRVID_ID: TIntegerField
      FieldName = 'RVID_ID'
      Origin = 'RVID_SHOP_LIST.RVID_ID'
    end
    object DicShopRvidRVID_NAME: TIBStringField
      FieldName = 'RVID_NAME'
      Origin = 'RVID_SHOP_LIST.RVID_NAME'
      Size = 64
    end
    object DicShopRvidRVID_SUBKLN: TIntegerField
      FieldName = 'RVID_SUBKLN'
      Origin = 'RVID_SHOP_LIST.RVID_SUBKLN'
    end
  end
  object DsShopRvid: TDataSource
    DataSet = DicShopRvid
    Left = 330
    Top = 300
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 824
    Top = 412
    object PrintTWCheck: TAction
      Caption = 'Напечатать товарный чек...'
      Hint = 'Напечатать товарный чек...'
      ImageIndex = 125
      ShortCut = 16504
      OnExecute = PrintTWCheckExecute
    end
    object PrintTwCheckFast: TAction
      Caption = 'Печать товарного чека без вывода на экран'
      Hint = 'Печать товарного чека без вывода на экран'
      ImageIndex = 125
      ShortCut = 8312
      OnExecute = PrintTwCheckFastExecute
    end
    object ActRnToPO: TAction
      Caption = 'Отнести на предоплату...'
      Hint = 'Отнести на предоплату...'
      ImageIndex = 178
      OnExecute = ActRnToPOExecute
    end
    object ActRnToStorno: TAction
      Caption = 'Сторнировать полностью...'
      Hint = 'Сторнировать полностью...'
      ImageIndex = 179
      OnExecute = ActRnToStornoExecute
    end
    object ActShowPO: TAction
      Caption = 'Просмотр информации о сторно и предоплатах...'
      Hint = 'Просмотр информации о сторно и предоплатах...'
      ImageIndex = 181
      OnExecute = ActShowPOExecute
    end
    object ActNewPo: TAction
      Caption = 'Новая предоплата...'
      Hint = 'Новая предоплата...'
      ImageIndex = 0
      OnExecute = ActNewPoExecute
    end
    object ActOpenPo: TAction
      Caption = 'Выбрать не погашенную предоплату...'
      Hint = 'Выбрать не погашенную предоплату...'
      ImageIndex = 16
      OnExecute = ActOpenPoExecute
    end
    object ActDelPo: TAction
      Caption = 'Удалить использование предоплаты'
      Hint = 'Удалить использование предоплаты'
      ImageIndex = 2
      OnExecute = ActDelPoExecute
    end
    object PrintRndRear: TAction
      Caption = 'Напечатать оборот накладной с доставкой'
      ImageIndex = 165
      OnExecute = PrintRndRearExecute
    end
    object actOpenDrawer: TAction
      Caption = 'actOpenDrawer'
      Hint = 'Открыть денежный ящик'
      ImageIndex = 206
      ShortCut = 16496
      OnExecute = actOpenDrawerExecute
    end
    object fastprintRn: TAction
      Caption = 'Печать расходной накладной без вывода на экран'
      ShortCut = 123
      OnExecute = fastprintRnExecute
    end
    object print_mh3: TAction
      Caption = 'Печать МХ-3'
      ImageIndex = 202
      ShortCut = 120
      OnExecute = print_mh3Execute
    end
  end
  object DicRvidKLN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = RvidTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from DIC_RVIDKLN_ALL(:rvid_id)')
    Left = 586
    Top = 371
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rvid_id'
        ParamType = ptUnknown
      end>
    object DicRvidKLNKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'DIC_RVIDKLN_ALL.KLN_ID'
    end
    object DicRvidKLNKLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Origin = 'DIC_RVIDKLN_ALL.KLN_FULL'
      Size = 254
    end
  end
  object DsRvidKln: TDataSource
    DataSet = DicRvidKLN
    Left = 528
    Top = 322
  end
  object PoTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 130
    Top = 297
  end
  object QrListPO: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PoTransaction
    AfterOpen = QrListPOAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from rn_list_po(:rn_id) order by po_date desc')
    Left = 136
    Top = 340
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rn_id'
        ParamType = ptUnknown
      end>
    object QrListPOPO_ID: TIntegerField
      FieldName = 'PO_ID'
      Origin = 'RN_LIST_PO.PO_ID'
    end
    object QrListPOPO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
      Origin = 'RN_LIST_PO.PO_DATE'
    end
    object QrListPOPO_FULL_NUM: TIBStringField
      FieldName = 'PO_FULL_NUM'
      Origin = 'RN_LIST_PO.PO_FULL_NUM'
      Size = 64
    end
    object QrListPOPO_SUMM: TFloatField
      FieldName = 'PO_SUMM'
      Origin = 'RN_LIST_PO.PO_SUMM'
      DisplayFormat = '#0.00 руб'
    end
    object QrListPOSTORNO_SUMM: TFloatField
      FieldName = 'STORNO_SUMM'
      Origin = 'RN_LIST_PO.STORNO_SUMM'
      DisplayFormat = '#0.00 руб'
    end
    object QrListPOPO_OSN: TIBStringField
      FieldName = 'PO_OSN'
      Origin = 'RN_LIST_PO.PO_OSN'
      Size = 254
    end
    object QrListPOKLN_FULL: TIBStringField
      FieldName = 'KLN_FULL'
      Origin = 'RN_LIST_PO.KLN_FULL'
      Size = 254
    end
    object QrListPOUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Origin = 'RN_LIST_PO.US_FULL'
      Size = 254
    end
    object QrListPOSHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
      Origin = 'RN_LIST_PO.SHOP_COLOR'
    end
    object QrListPOPORN_SUMM: TFloatField
      FieldName = 'PORN_SUMM'
      Origin = 'RN_LIST_PO.PORN_SUMM'
      DisplayFormat = '#0.00 руб'
    end
    object QrListPOPORN_ID: TIntegerField
      FieldName = 'PORN_ID'
      Origin = 'RN_LIST_PO.PORN_ID'
    end
  end
  object DsListPO: TDataSource
    DataSet = QrListPO
    Left = 136
    Top = 388
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 1200
    OnTimer = Timer2Timer
    Left = 242
    Top = 354
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer3Timer
    Left = 264
    Top = 370
  end
  object PopupNDS: TPopupMenu
    Left = 618
    Top = 330
    object MnNDS: TMenuItem
      Caption = 'Взять значение ставки НДС по справочнику'
      OnClick = MnNDSClick
    end
  end
  object PopupNP: TPopupMenu
    Left = 710
    Top = 282
    object MnNP: TMenuItem
      Caption = 'Взять значение ставки НП по справочнику'
      OnClick = MnNPClick
    end
  end
  object IBQuery3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 10
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM CFG WHERE CFG_NAME = "EXPEDITOR"')
    Left = 20
    Top = 314
  end
  object DataSource3: TDataSource
    DataSet = IBQuery3
    Left = 68
    Top = 306
  end
  object IBSkl: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = RvidTransaction
    BufferChunks = 10
    CachedUpdates = False
    SQL.Strings = (
      'select * from dic_shop_skl(:shop_id, 2)'
      'where cfg_value > 0')
    Left = 216
    Top = 405
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'shop_id'
        ParamType = ptUnknown
      end>
    object IBSklSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Origin = 'SKL.SKL_ID'
      Required = True
    end
    object IBSklSKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'SKL.SKL_SHORT'
      Required = True
      Size = 32
    end
    object IBSklSKL_FRM: TIntegerField
      FieldName = 'SKL_FRM'
      Origin = 'SKL.SKL_FRM'
    end
    object IBSklFRM_NAME: TIBStringField
      FieldName = 'FRM_NAME'
      Size = 5000
    end
  end
  object DSSkl: TDataSource
    DataSet = IBSkl
    Left = 216
    Top = 457
  end
  object MH14: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnBeginDoc = MH14BeginDoc
    Left = 520
    Top = 460
    ReportForm = {
      1800000010590000180000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00001900000016000000160000003600000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      0100000404000500626567696E0D00000D03002020200D0300656E640002003E
      0600000B004D61737465724461746131000201000000001C020000F502000010
      0000003100050001000000000000000000FFFFFF1F000000000E00667344535F
      5052494E545F4D48530000000041000500626567696E0D020020200D17002020
      6966206E6F742046696E616C50617373207468656E0D17002020726F77636F75
      6E743A3D726F77436F756E742B313B0D00000D01007B0D3100EDE020EFEEF1EB
      E5E4EDE5E920F1F2F0E0EDE8F6E5202D20EFF0EEE2E5F0E8F2FC20E2EBE5E7E5
      F220EBE820F4F3F2E5F00D2700EDE020EEF1F2E0EBFCEDFBF5202D20EFF0EEE2
      E5F0E8F2FC20E2EBE5E7E5F220EBE820F7E8EBE40D00000D4900EFEEF1EBE5E4
      EDFFFF20EEF2EBE8F7E0E5F2F1FF20F2E5EC20F7F2EE20EAEEEB2DE2EE20F1F2
      F0EEEA20EEF1F2E0EBEEF1FC20ECE5EDFCF8E520F7E5EC20EDE020F1F2F0E0ED
      E8F6F30D00000D16004C494E4523202D20F2E5EAF3F9E0FF20F1F2F0EEEAE00D
      00000D0E002F2F69662066696E616C706173730D0A002F2F6966207061676523
      0D00000D01007D0D0C0020202064656275673A3D313B0D00000D00000D130020
      2069662046696E616C50617373207468656E0D0500626567696E0D00000D1A00
      20206966205B4C494E45235D3D726F77636F756E74207468656E0D0700202062
      6567696E0D0C0020202064656275673A3D323B0D020020200D2E002020206966
      20467265655370616365203C204D6173746572466F6F746572312E4865696768
      742B3230207468656E0D0800202020626567696E0D390020202F2F2020646562
      75673A3D64656275672B27467265655370616365203C204D6173746572466F6F
      746572312E4865696768742B3230273B0D1900202020204368696C64312E5669
      7369626C653A3D747275653B0D3800202020204368696C64312E486569676874
      3A3D204672656553706163653B2F2F4D6173746572466F6F746572312E486569
      6768742D32303B0D15002020202053686F7742616E64284368696C6431293B0D
      1300202020207061676553756D6D4B6F6C3A3D303B0D14002020202070616765
      53756D6D4B6F6C323A3D303B0D1400202020207061676553756D6D4B6F6C333A
      3D303B0D1400202020207061676553756D6D436F73743A3D303B0D10002F2F20
      20204E6577506167652830293B0D1A002F2F20204368696C64312E5669736962
      6C653A3D66616C73653B0D06002020656E643B0D040020656E640D050020656C
      73650D060020626567696E0D2900202020696620467265655370616365203C20
      4D617374657244617461312E686569676874207468656E0D0800202020626567
      696E0D1900202020204368696C64312E56697369626C653A3D747275653B0D1D
      00202020204368696C64312E4865696768743A3D4672656553706163653B0D15
      002020202053686F7742616E64284368696C6431293B0D130020202020706167
      6553756D6D4B6F6C3A3D303B0D1400202020207061676553756D6D4B6F6C323A
      3D303B0D1400202020207061676553756D6D4B6F6C333A3D303B0D1400202020
      207061676553756D6D436F73743A3D303B0D10002F2F2020204E657750616765
      2830293B0D1A002F2F20204368696C64312E56697369626C653A3D66616C7365
      3B0D06002020656E643B0D0100200D050020656E643B0D00000D3E0020207061
      676553756D6D4B6F6C3A3D7061676553756D6D4B6F6C2B5B5B4D656D524E532E
      224F5354225D2B5B4D656D524E532E2254575F4B4F4C225D5D3B0D2C00202070
      61676553756D6D4B6F6C323A3D7061676553756D6D4B6F6C322B5B4D656D524E
      532E224F5354225D3B0D2F0020207061676553756D6D4B6F6C333A3D70616765
      53756D6D4B6F6C332B5B4D656D524E532E2254575F4B4F4C225D3B0D30002020
      7061676553756D6D436F73743A3D7061676553756D6D436F73742B5B4D656D52
      4E532E2254575F53554D4D225D3B0D0400656E643B0D00000D0400656E643B00
      FFFF000000000002000000010000000000000001000000C80000001400000001
      0000000000000200D80600000D004D6173746572486561646572310002010000
      0000A4010000F5020000400000007000040001000000000000000000FFFFFF1F
      0000000000000000000004000500626567696E0D1A00202020204368696C6431
      2E56697369626C653A3D66616C73653B0D00000D0300656E6400FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200D50700000C005265706F72745469746C6531000201000000000C000000F5
      020000460100003000000001000000000000000000FFFFFF1F00000000000000
      0000000A000500626567696E0D110020207061676553756D6D4B6F6C3A3D303B
      0D120020207061676553756D6D4B6F6C323A3D303B0D12002020706167655375
      6D6D4B6F6C333A3D303B0D120020207061676553756D6D436F73743A3D303B0D
      00000D00000D170020206966206E6F742046696E616C50617373207468656E0D
      0E002020726F77636F756E743A3D303B0D0300656E6400FFFF00000000000200
      0000010000000000000001000000C80000001400000001000000000000020042
      0800000D004D6173746572466F6F7465723100020100000000E0020000F50200
      00340100003000060001000000000000000000FFFFFF1F000000000000000000
      000000000100000000000002000000010000000000000001000000C800000014
      000000010000000000000200A808000006004368696C64310002010000000038
      020000F5020000140000003000150001000000000000000000FFFFFF1F000000
      0000000000000000000001000000000000020000000100000000000000010000
      00C800000014000000010000000000000200130900000B005061676548656164
      6572310002010000000084020000F50200001E00000020000200010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C8000000140000000100000000000000004E0A00
      0006004D656D6F36340002002000000008030000A00200002000000043000000
      64000000000000000000FFFFFF1F2E0200000000000100BB00C2F1E520E4EEEA
      F3ECE5EDF2FB2C20EEF2EDEEF1FFF9E8E5F1FF20EA20EFF0E8F5EEE4F320E8EB
      E820F0E0F1F5EEE4F320F2EEE2E0F0EDEE2DECE0F2E5F0E8E0EBFCEDFBF520F6
      E5EDEDEEF1F2E5E92C20F1E4E0EDFB20E220E1F3F5E3E0EBF2E5F0E8FE2E20CD
      E8EAE0EAE8F520EDE5EEEFF0E8F5EEE4EEE2E0EDEDFBF520E8EBE820EDE5F1EF
      E8F1E0EDEDFBF520F2EEE2E0F0EEE22C20F2EEE2E0F0EDEE2DECE0F2E5F0E8E0
      EBFCEDFBF520F6E5EDEDEEF1F2E5E920EDE5F22E00000000FFFF000000000002
      000000010000000006005461686F6D6100080000000000FFFFFF1F08000000CC
      00020000000000FFFFFF1F00000002000000000000000000D90A000006004D65
      6D6F3932000200C0000000E00300003800000009000000430000006400000000
      0000000000FFFFFF1F2E02000000000001000B0028E4EEEBE6EDEEF1F2FC2900
      000000FFFF000000000002000000010000000006005461686F6D610006000000
      0000FFFFFF1F08000000CC00020000000000FFFFFF1F00000002000000000000
      000000630B000007004D656D6F3132380002003C010000E00300003800000009
      0000004300000064000000000000000000FFFFFF1F2E02000000000001000900
      28EFEEE4EFE8F1FC2900000000FFFF0000000000020000000100000000060054
      61686F6D6100060000000000FFFFFF1F08000000CC00020000000000FFFFFF1F
      00000002000000000000000000F90B000007004D656D6F313239000200AC0100
      00E003000068000000090000004300000064000000000000000000FFFFFF1F2E
      0200000000000100150028F0E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E82900
      000000FFFF000000000002000000010000000006005461686F6D610006000000
      0000FFFFFF1F08000000CC00020000000000FFFFFF1F00000002000000000000
      000000840C000006004D656D6F3839000200C0000000C0030000380000000900
      00004300000064000000000000000000FFFFFF1F2E02000000000001000B0028
      E4EEEBE6EDEEF1F2FC2900000000FFFF00000000000200000001000000000600
      5461686F6D6100060000000000FFFFFF1F08000000CC00020000000000FFFFFF
      1F000000020000000000000000000D0D000006004D656D6F39300002003C0100
      00C003000038000000090000004300000064000000000000000000FFFFFF1F2E
      0200000000000100090028EFEEE4EFE8F1FC2900000000FFFF00000000000200
      0000010000000006005461686F6D6100060000000000FFFFFF1F08000000CC00
      020000000000FFFFFF1F00000002000000000000000000A20D000006004D656D
      6F3931000200AC010000C0030000680000000900000043000000640000000000
      00000000FFFFFF1F2E0200000000000100150028F0E0F1F8E8F4F0EEE2EAE020
      EFEEE4EFE8F1E82900000000FFFF000000000002000000010000000006005461
      686F6D6100060000000000FFFFFF1F08000000CC00020000000000FFFFFF1F00
      0000020000000000000000002D0E000006004D656D6F3937000200500100003C
      03000038000000090000004300000064000000000000000000FFFFFF1F2E0200
      0000000001000B0028E4EEEBE6EDEEF1F2FC2900000000FFFF00000000000200
      0000010000000006005461686F6D6100060000000000FFFFFF1F08000000CC00
      020000000000FFFFFF1F00000002000000000000000000B70E000007004D656D
      6F313236000200DC0100003C0300003800000009000000430000006400000000
      0000000000FFFFFF1F2E0200000000000100090028EFEEE4EFE8F1FC29000000
      00FFFF000000000002000000010000000006005461686F6D6100060000000000
      FFFFFF1F08000000CC00020000000000FFFFFF1F000000020000000000000000
      004D0F000007004D656D6F3132370002004C0200003C03000068000000090000
      004300000064000000000000000000FFFFFF1F2E0200000000000100150028F0
      E0F1F8E8F4F0EEE2EAE020EFEEE4EFE8F1E82900000000FFFF00000000000200
      0000010000000006005461686F6D6100060000000000FFFFFF1F08000000CC00
      020000000000FFFFFF1F000000020000000000000000007A10000006004D656D
      6F3330000200300000001C010000A00200002400000043000000640000000000
      00000000FFFFFF1F2E0200000000000100AD00C0EAF220F1EEF1F2E0E2EBE5ED
      20EAEEECE8F1F1E8E5E92C20EAEEF2EEF0E0FF20E220F0E5E7F3EBFCF2E0F2E5
      20E2FBE1EEF0EEF7EDEEE928EAEEEDF2F0EEEBFCEDEEE92920EFF0EEE2E5F0EA
      E820F4E0EAF2E8F7E5F1EAE8F520EEF1F2E0F2EAEEE220F2EEE2E0F0EDEE2DEC
      E0F2E5F0E8E0EBFCEDFBF520F6E5EDEDEEF1F2E5E920E820F1E2E5F0EAE820E8
      F520F120F3F7E5F2EDFBECE820E4E0EDEDFBECE820F3F1F2E0EDEEE2E8EBE03A
      00000000FFFF000000000002000000010000000006005461686F6D61000A0000
      000000FFFFFF1F08000000CC00020000000000FFFFFF1F000000020000000000
      000000005811000005004D656D6F31000200FC0100001C000000E00000002A00
      00004300000001000000000000000000FFFFFF1F2E02000000000003001D00D3
      EDE8F4E8F6E8F0EEE2E0EDEDE0FF20F4EEF0ECE020B920CCD52D31340D2500D3
      F2E2E5F0E6E4E5EDE020EFEEF1F2E0EDEEE2EBE5EDE8E5EC20C3EEF1EAEEECF1
      F2E0F2E00D1700D0EEF1F1E8E820EEF22030392E30382E393920B92036360000
      0000FFFF000000000002000000010000000006005461686F6D61000800000000
      000000000000000000CC00020000000000FFFFFF000000000200000000000000
      0000DA11000005004D656D6F3200020088020000480000005400000010000000
      43000F0064000000000000000000FFFFFF1F2E02000000000001000300CAEEE4
      00000000FFFF000000000002000000010000000006005461686F6D61000A0000
      0000000000000012000000CC00020000000000FFFFFF00000000020000000000
      000000005712000005004D656D6F330002008802000068000000540000001000
      000043000F0064000000000000000000FFFFFF1F2E0200000000000000000000
      00FFFF000000000002000000010000000006005461686F6D61000A0000000000
      0000000012000000CC00020000000000FFFFFF00000000020000000000000000
      00DD12000005004D656D6F340002008802000058000000540000001000000043
      000F0064000000000000000000FFFFFF1F2E0200000000000100070030333335
      30303400000000FFFF000000000002000000010000000006005461686F6D6100
      0A00000000000000000012000000CC00020000000000FFFFFF00000000020000
      000000000000005A13000005004D656D6F370002008802000078000000540000
      001000000043000F0064000000000000000000FFFFFF1F2E0200000000000000
      00000000FFFF000000000002000000010000000006005461686F6D61000A0000
      0000000000000012000000CC00020000000000FFFFFF00000000020000000000
      00000000D713000005004D656D6F390002008802000088000000540000001000
      000043000F0064000000000000000000FFFFFF1F2E0200000000000000000000
      00FFFF000000000002000000010000000006005461686F6D61000A0000000000
      0000000012000000CC00020000000000FFFFFF00000000020000000000000000
      005514000006004D656D6F313000020088020000A80000005400000010000000
      43000F0064000000000000000000FFFFFF1F2E020000000000000000000000FF
      FF000000000002000000010000000006005461686F6D61000A00000000000000
      000012000000CC00020000000000FFFFFF0000000002000000000000000000D3
      14000006004D656D6F3131000200880200009800000054000000100000004300
      0F0064000000000000000000FFFFFF1F2E020000000000000000000000FFFF00
      0000000002000000010000000006005461686F6D61000A000000000000000000
      12000000CC00020000000000FFFFFF0000000002000000000000000000621500
      0006004D656D6F3132000200FC000000C4000000580000001C00000043000F00
      64000000000000000000FFFFFF1F2E02000000000001000F00CDEEECE5F020E4
      EEEAF3ECE5EDF2E000000000FFFF000000000002000000010000000006005461
      686F6D6100080000000000000000000A000000CC00020000000000FFFFFF0000
      000002000000000000000000FA15000006004D656D6F3136000200F401000078
      000000940000000F0000004300000064000000000000000000FFFFFF1F2E0200
      0000000001001800C2E8E420E4E5FFF2E5EBFCEDEEF1F2E820EFEE20CECAC4CF
      00000000FFFF000000000002000000010000000006005461686F6D6100080000
      0000000000000009000000CC00020000000000FFFFFF00000000020000000000
      000000007F16000006004D656D6F313800020048020000880000004000000010
      00000043000F0064000000000000000000FFFFFF1F2E02000000000001000500
      EDEEECE5F000000000FFFF000000000002000000010000000006005461686F6D
      61000800000000000000000009000000CC00020000000000FFFFFF0000000002
      0000000000000000000B17000006004D656D6F31390002002C020000A8000000
      5C000000100000004300000064000000000000000000FFFFFF1F2E0200000000
      0001000C00C2E8E420EEEFE5F0E0F6E8E800000000FFFF000000000002000000
      010000000006005461686F6D61000800000000000000000009000000CC000200
      00000000FFFFFF00000000020000000000000000008F17000006004D656D6F32
      300002004802000098000000400000001000000043000F006400000000000000
      0000FFFFFF1F2E02000000000001000400E4E0F2E000000000FFFF0000000000
      02000000010000000006005461686F6D61000800000000000000000009000000
      CC00020000000000FFFFFF00000000020000000000000000001C18000006004D
      656D6F32310002001C020000480000006C000000100000004300000064000000
      000000000000FFFFFF1F2E02000000000001000D00D4EEF0ECE020EFEE20CECA
      D3C400000000FFFF000000000002000000010000000006005461686F6D610008
      00000000000000000009000000CC00020000000000FFFFFF0000000002000000
      000000000000A318000006004D656D6F32320002001C020000580000006C0000
      00100000004300000064000000000000000000FFFFFF1F2E0200000000000100
      0700EFEE20CECACFCE00000000FFFF0000000000020000000100000000060054
      61686F6D61000800000000000000000009000000CC00020000000000FFFFFF00
      000000020000000000000000002819000006004D656D6F313300020020000000
      4C000000D4010000200000004700020064000000000000000000FFFFFF1F2E02
      0000000000010005005B4F52475D00000000FFFF000000000002000000010000
      000006005461686F6D61000800000000000000000010000000CC000200000000
      00FFFFFF0000000002000000000000000000AD19000006004D656D6F31340002
      00200000006C000000D4010000100000004300020064000000000000000000FF
      FFFF1F2E020000000000010005005B534B4C5D00000000FFFF00000000000200
      0000010000000006005461686F6D61000800000000000000000010000000CC00
      020000000000FFFFFF0000000002000000000000000000471A000006004D656D
      6F3234000200200000008C000000CC0000000C00000043000000640000000000
      00000000FFFFFF1F2E02000000000001001A00CEF1EDEEE2E0EDE8E520F1EEF1
      F2E0E2EBE5EDE8FF20E0EAF2E000000000FFFF00000000000200000001000000
      0006005461686F6D61000800000000000000000010000000CC00020000000000
      FFFFFF0000000002000000000000000000D71A000006004D656D6F3235000200
      54010000C4000000580000001C00000043000F0064000000000000000000FFFF
      FF1F2E02000000000001001000C4E0F2E020F1EEF1F2E0E2EBE5EDE8FF000000
      00FFFF000000000002000000010000000006005461686F6D6100080000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      005A1B000006004D656D6F3238000200C0000000E00000003C0000001C000000
      4300000064000000000000000000FFFFFF1F2E02000000000001000300C0CAD2
      00000000FFFF000000000002000000010000000006005461686F6D61000A0000
      000200000000000A000000CC00020000000000FFFFFF00000000020000000000
      00000000E61B000006004D656D6F3236000200FC000000E0000000580000001C
      00000043000F0001000000000000000000FFFFFF1F2E02000000000001000C00
      5B646F635F6E756D6265725D00000000FFFF0000000000020000000100000000
      06005461686F6D6100080000000000000000000A000000CC00020000000000FF
      FFFF0000000002000000000000000000701C000006004D656D6F323700020054
      010000E0000000580000001C00000043000F0001000000000000000000FFFFFF
      1F2E02000000000001000A005B646F635F646174655D00000000FFFF00000000
      0002000000010000000006005461686F6D6100080000000000000000000A0000
      00CC00020000000000FFFFFF00000000020000000000000000003E1D00000600
      4D656D6F323900020030000000FC000000E00100001C00000043000000640000
      00000000000000FFFFFF1F2E02000000000001004E00CE20C2DBC1CED0CED7CD
      CEC920CFD0CEC2C5D0CAC520CDC0CBC8D7C8DF20D2CEC2C0D0CDCE2DCCC0D2C5
      D0C8C0CBDCCDDBD520D6C5CDCDCED1D2C5C920C220CCC5D1D2C0D520D5D0C0CD
      C5CDC8DF00000000FFFF000000000002000000010000000006005461686F6D61
      000A0000000200000000000A000000CC00020000000000FFFFFF000000000200
      0000000000000000BC1D000006004D656D6F333200020070020000D00000006C
      000000100000004300020064000000000000000000FFFFFF1F2E020000000000
      000000000000FFFF000000000002000000010000000006005461686F6D61000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      0000000000004C1E000006004D656D6F333400020018000000A40100001C0000
      003000000047000F0064000000000000000000FFFFFF1F2E0200000000000100
      1000CDEEECE5F020EFEE20EFEEF0FFE4EAF300000000FFFF0000000000020000
      00010000000006005461686F6D6100060000000000FFFFFF1F0A000000CC0002
      0000000000FFFFFF1F00000002000000000000000000E91E000006004D656D6F
      333500020034000000A4010000FC0000001400000047000F0064000000000000
      000000FFFFFF1F2E02000000000001001D00D2EEE2E0F0EDEE2DECE0F2E5F0E8
      E0EBFCEDFBE520F6E5EDEDEEF1F2E800000000FFFF0000000000020000000100
      00000006005461686F6D6100060000000000FFFFFF1F0A000000CC0002000000
      0000FFFFFF1F00000002000000000000000000851F000006004D656D6F333600
      020034000000B8010000CC0000001C00000047000F0064000000000000000000
      FFFFFF1F2E02000000000001001C00CDE0E8ECE5EDEEE2E0EDE8E52C20F5E0F0
      E0EAF2E5F0E8F1F2E8EAE000000000FFFF000000000002000000010000000006
      005461686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFF
      FF1F000000020000000000000000000820000006004D656D6F33370002000001
      0000B8010000300000001C00000047000F0064000000000000000000FFFFFF1F
      2E02000000000001000300CAEEE400000000FFFF000000000002000000010000
      000006005461686F6D6100060000000000FFFFFF1F0A000000CC000200000000
      00FFFFFF1F000000020000000000000000008920000006004D656D6F33390002
      0018000000D40100001C0000001000000047000F0064000000000000000000FF
      FFFF1F2E020000000000010001003100000000FFFF0000000000020000000100
      00000006005461686F6D6100060000000000FFFFFF1F0A000000CC0002000000
      0000FFFFFF1F000000020000000000000000000A21000006004D656D6F343000
      020034000000D4010000CC0000001000000047000F0064000000000000000000
      FFFFFF1F2E020000000000010001003200000000FFFF00000000000200000001
      0000000006005461686F6D6100060000000000FFFFFF1F0A000000CC00020000
      000000FFFFFF1F000000020000000000000000008B21000006004D656D6F3431
      00020000010000D4010000300000001000000047000F00640000000000000000
      00FFFFFF1F2E020000000000010001003300000000FFFF000000000002000000
      010000000006005461686F6D6100060000000000FFFFFF1F0A000000CC000200
      00000000FFFFFF1F000000020000000000000000001C22000006004D656D6F34
      3300020030010000A4010000440000001400000047000F006400000000000000
      0000FFFFFF1F2E02000000000001001100C5E4E8EDE8F6E020E8E7ECE5F0E5ED
      E8FF00000000FFFF000000000002000000010000000006005461686F6D610006
      0000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F00000002000000
      000000000000A822000006004D656D6F343400020030010000B80100002C0000
      001C00000047000F0064000000000000000000FFFFFF1F2E0200000000000100
      0C00EDE0E8ECE5EDEEE2E0EDE8E500000000FFFF000000000002000000010000
      000006005461686F6D6100060000000000FFFFFF1F0A000000CC000200000000
      00FFFFFF1F000000020000000000000000003323000006004D656D6F34350002
      005C010000B8010000180000001C00000047000F0064000000000000000000FF
      FFFF1F2E02000000000001000B00CAEEE420EFEE20CECAC5C800000000FFFF00
      0000000002000000010000000006005461686F6D6100060000000000FFFFFF1F
      0A000000CC00020000000000FFFFFF1F00000002000000000000000000B42300
      0006004D656D6F343600020030010000D40100002C0000001000000047000F00
      64000000000000000000FFFFFF1F2E020000000000010001003400000000FFFF
      000000000002000000010000000006005461686F6D6100060000000000FFFFFF
      1F0A000000CC00020000000000FFFFFF1F000000020000000000000000003524
      000006004D656D6F34370002005C010000D4010000180000001000000047000F
      0064000000000000000000FFFFFF1F2E020000000000010001003500000000FF
      FF000000000002000000010000000006005461686F6D6100060000000000FFFF
      FF1F0A000000CC00020000000000FFFFFF1F00000002000000000000000000CA
      24000006004D656D6F3438000200B4010000B80100003C0000001C0000004700
      0F0064000000000000000000FFFFFF1F2E02000000000001001500CAEEEBE8F7
      E5F1F2E2EE20ECE5F1F22C20F8F2F3EA00000000FFFF00000000000200000001
      0000000006005461686F6D6100060000000000FFFFFF1F0A000000CC00020000
      000000FFFFFF1F000000020000000000000000004B25000006004D656D6F3439
      000200B4010000D40100003C0000001000000047000F00640000000000000000
      00FFFFFF1F2E020000000000010001003700000000FFFF000000000002000000
      010000000006005461686F6D6100060000000000FFFFFF1F0A000000CC000200
      00000000FFFFFF1F00000002000000000000000000D825000006004D656D6F36
      3800020054010000F40200006000000014000000430000006400000000000000
      0000FFFFFF1F2E02000000000001000D00C8F2EEE3EE20EFEE20E0EAF2F30000
      0000FFFF000000000002000000010000000006005461686F6D61000800000000
      00FFFFFF1F09000000CC00020000000000FFFFFF1F0000000200000000000000
      00008126000006004D656D6F3639000200B4010000F40200003C000000140000
      0043000F0064000000000000000000FFFFFF1F2E030301000000010029005B53
      554D285B5B4D656D524E532E224F5354225D2B5B4D656D524E532E2254575F4B
      4F4C225D5D295D00000000FFFF00000000000200000001000000000600546168
      6F6D6100080000000000FFFFFF1F09000000CC00020000000000FFFFFF1F0000
      00020000000000000000001B27000006004D656D6F3731000200A4020000F402
      0000380000001400000043000F0064000000000000000000FFFFFF1F2E020301
      00000001001A002D5B53554D285B4D656D524E532E2254575F53554D4D225D29
      5D00000000FFFF000000000002000000010000000006005461686F6D61000800
      00000000FFFFFF1F09000000CC00020000000000FFFFFF1F0000000200000000
      0000000000BD27000006004D656D6F37320002002000000048030000A8000000
      100000004300000064000000000000000000FFFFFF1F2E020000000000010022
      00D3F1EBEEE2E8FF20F5F0E0EDE5EDE8FF20E820F1EEF1F2EEFFEDE8E520F3F7
      E5F2E000000000FFFF000000000002000000010000000006005461686F6D6100
      060000000000FFFFFF1F08000000CC00020000000000FFFFFF1F000000020000
      000000000000003B28000006004D656D6F3733000200C8000000480300001402
      0000100000004300020064000000000000000000FFFFFF1F2E02000000000000
      0000000000FFFF000000000002000000010000000006005461686F6D61000600
      00000000FFFFFF1F0A000000CC00020000000000FFFFFF1F0000000200000000
      0000000000CE28000006004D656D6F3734000200200000005C0300005C000000
      100000004300000064000000000000000000FFFFFF1F2E020000000000010013
      00C7E0EAEBFEF7E5EDE8E520EAEEECE8F1F1E8E800000000FFFF000000000002
      000000010000000006005461686F6D6100060000000000FFFFFF1F08000000CC
      00020000000000FFFFFF1F000000020000000000000000004C29000006004D65
      6D6F3735000200800000005C0300005C02000010000000430002006400000000
      0000000000FFFFFF1F2E020000000000000000000000FFFF0000000000020000
      00010000000006005461686F6D6100060000000000FFFFFF1F0A000000CC0002
      0000000000FFFFFF1F00000002000000000000000000F929000006004D656D6F
      3933000200B00000006C000000D0000000080000004300000064000000000000
      000000FFFFFF1F2E02000000000001002D0028EEF0E3E0EDE8E7E0F6E8FF2DF5
      F0E0EDE8F2E5EBFC2C20E0E4F0E5F12C20F2E5EBE5F4EEED2C20F4E0EAF12900
      000000FFFF000000000002000000010000000006005461686F6D610006000000
      0000FFFFFF1F08000000CC00020000000000FFFFFF1F00000002000000000000
      000000942A000006004D656D6F3934000200B00000007C000000D00000000800
      00004300000064000000000000000000FFFFFF1F2E02000000000001001B0028
      F1F2F0F3EAF2F3F0EDEEE520EFEEE4F0E0E7E4E5EBE5EDE8E52900000000FFFF
      000000000002000000010000000006005461686F6D6100060000000000FFFFFF
      1F0A000000CC00020000000000FFFFFF1F00000002000000000000000000252B
      000006004D656D6F3935000200D800000038020000DC00000014000000430000
      0064000000000000000000FFFFFF1F2E02000000000001001100C8F2EEE3EE20
      EFEE20F1F2F0E0EDE8F6E500000000FFFF000000000002000000010000000006
      005461686F6D6100080000000000FFFFFF1F09000000CC00020000000000FFFF
      FF1F00000002000000000000000000B22B000006004D656D6F3936000200B401
      0000380200003C0000001400000003000F0064000000000000000000FFFFFF1F
      2E02010100000001000D005B7061676553756D6D4B6F6C5D00000000FFFF0000
      00000002000000010000000006005461686F6D6100080000000000FFFFFF1F09
      000000CC00020000000000FFFFFF1F00000002000000000000000000412C0000
      06004D656D6F3938000200A402000038020000380000001400000003000F0064
      000000000000000000FFFFFF1F2E02030100000001000F002D5B706167655375
      6D6D436F73745D00000000FFFF00000000000200000001000000000600546168
      6F6D6100080000000000FFFFFF1F09000000CC00020000000000FFFFFF1F0000
      0002000000000000000000CB2C000007004D656D6F31303100020010020000B8
      0000007C000000140000004300000064000000000000000000FFFFFF1F2E0200
      0000000001000900D3D2C2C5D0C6C4C0DE00000000FFFF000000000002000000
      010000000006005461686F6D61000A0000000000000000000A000000CC000200
      00000000FFFFFF0000000002000000000000000000572D000007004D656D6F31
      303300020078020000E000000048000000090000004300000064000000000000
      000000FFFFFF1F2E02000000000001000B0028E4EEEBE6EDEEF1F2FC29000000
      00FFFF000000000002000000010000000006005461686F6D6100060000000000
      FFFFFF1F08000000CC00020000000000FFFFFF1F000000020000000000000000
      001D2E000007004D656D6F3130350002001C00000018000000D00000001E0000
      000300000064000000000000000000FFFFFF1F2E02000000000003002100D1F2
      F0E0EDE8F6E0205B50414745235D2020E8E7205B544F54414C50414745535D0D
      1300CDE0EFE5F7E0F2E0EB205B7573657246494F5D0D0B00EAEEE4205B646F63
      49445D00000000FFFF000000000002000000010000000006005461686F6D6100
      060000000000FFFFFF1F00000000CC00020000000000FFFFFF00000000020000
      00000000000000E32E000007004D656D6F3130340002001800000084020000D0
      0000001E0000000300000064000000000000000000FFFFFF1F2E020000000000
      03002100D1F2F0E0EDE8F6E0205B50414745235D2020E8E7205B544F54414C50
      414745535D0D1300CDE0EFE5F7E0F2E0EB205B7573657246494F5D0D0B00EAEE
      E4205B646F6349445D00000000FFFF0000000000020000000100000000060054
      61686F6D6100060000000000FFFFFF1F00000000CC00020000000000FFFFFF00
      00000002000000000000000000772F000005004D656D6F360002003401000098
      000000D0000000080000004300000064000000000000000000FFFFFF1F2E0200
      000000000100150028EDE5EDF3E6EDEEE520E7E0F7E5F0EAEDF3F2FC29000000
      00FFFF000000000002000000010000000006005461686F6D6100060000000000
      FFFFFF1F0A000000CC00020000000000FFFFFF1F000000020000000000000000
      000A30000005004D656D6F35000200EC0000008C0000005C0100000C00000043
      00020064000000000000000000FFFFFF1F2E02000000000001001400CFF0E8EA
      E0E72C20F0E0F1EFEEF0FFE6E5EDE8E500000000FFFF00000000000200000001
      0000000006005461686F6D61000800000000000000000012000000CC00020000
      000000FFFFFF00000000020000000000000000008730000005004D656D6F3800
      020070020000E80000006C000000100000004300020064000000000000000000
      FFFFFF1F2E020000000000000000000000FFFF00000000000200000001000000
      0006005461686F6D61000A0000000000000000000A000000CC00020000000000
      FFFFFF00000000020000000000000000001431000006004D656D6F3135000200
      78020000F800000048000000090000004300000064000000000000000000FFFF
      FF1F2E02000000000001000D0028F0E0F1F8E8F4F0EEE2EAE02900000000FFFF
      000000000002000000010000000006005461686F6D6100060000000000FFFFFF
      1F08000000CC00020000000000FFFFFF1F00000002000000000000000000B231
      000006004D656D6F31370002002002000008010000BC00000010000000430000
      0064000000000000000000FFFFFF1F2E02000000000001001E00222020202020
      2220205F5F5F5F5F5F5F5F5F5F205F5F5F5F20E3EEE4E02E00000000FFFF0000
      00000002000000010000000006005461686F6D61000A0000000000000000000A
      000000CC00020000000000FFFFFF00000000020000000000000000003E320000
      06004D656D6F333100020010020000D000000060000000100000004300000064
      000000000000000000FFFFFF1F2E02000000000001000C00D0F3EAEEE2EEE4E8
      F2E5EBFC00000000FFFF000000000002000000010000000006005461686F6D61
      000A0000000000000000000A000000CC00020000000000FFFFFF000000000200
      0000000000000000BC32000006004D656D6F333300020018020000E800000058
      000000100000004300020064000000000000000000FFFFFF1F2E020000000000
      000000000000FFFF000000000002000000010000000006005461686F6D61000A
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      0000000000004533000006004D656D6F393900020024020000F8000000480000
      00090000004300000064000000000000000000FFFFFF1F2E0200000000000100
      090028EFEEE4EFE8F1FC2900000000FFFF000000000002000000010000000006
      005461686F6D6100060000000000FFFFFF1F08000000CC00020000000000FFFF
      FF1F00000002000000000000000000DB33000006004D656D6F3233000200B401
      0000A4010000500000001400000047000F0064000000000000000000FFFFFF1F
      2E02000000000001001600CFEE20E4EEEAF3ECE5EDF2E0EC20E7EDE0F7E8F2F1
      FF00000000FFFF000000000002000000010000000006005461686F6D61000600
      00000000FFFFFF1F0A000000CC00020000000000FFFFFF1F0000000200000000
      00000000006034000006004D656D6F3338000200F0010000B801000014000000
      1C00000047000F0064000000000000000000FFFFFF1F2E020000000000010005
      00ECE0F1F1E000000000FFFF000000000002000000010000000006005461686F
      6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F000000
      02000000000000000000E134000006004D656D6F3432000200F0010000D40100
      00140000001000000047000F0064000000000000000000FFFFFF1F2E02000000
      0000010001003800000000FFFF00000000000200000001000000000600546168
      6F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F0000
      00020000000000000000007735000007004D656D6F31303000020004020000B8
      0100003C0000001C00000047000F0064000000000000000000FFFFFF1F2E0200
      0000000001001500CAEEEBE8F7E5F1F2E2EE20ECE5F1F22C20F8F2F3EA000000
      00FFFF000000000002000000010000000006005461686F6D6100060000000000
      FFFFFF1F0A000000CC00020000000000FFFFFF1F000000020000000000000000
      00F935000007004D656D6F31303200020004020000D40100003C000000100000
      0047000F0064000000000000000000FFFFFF1F2E020000000000010001003900
      000000FFFF000000000002000000010000000006005461686F6D610006000000
      0000FFFFFF1F0A000000CC00020000000000FFFFFF1F00000002000000000000
      0000008436000007004D656D6F31303600020004020000A40100005000000014
      00000047000F0064000000000000000000FFFFFF1F2E02000000000001000A00
      D4E0EAF2E8F7E5F1EAE800000000FFFF00000000000200000001000000000600
      5461686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF
      1F000000020000000000000000000A37000007004D656D6F3130370002004002
      0000B8010000140000001C00000047000F0064000000000000000000FFFFFF1F
      2E02000000000001000500ECE0F1F1E000000000FFFF00000000000200000001
      0000000006005461686F6D6100060000000000FFFFFF1F0A000000CC00020000
      000000FFFFFF1F000000020000000000000000008D37000007004D656D6F3130
      3800020040020000D4010000140000001000000047000F006400000000000000
      0000FFFFFF1F2E02000000000001000200313000000000FFFF00000000000200
      0000010000000006005461686F6D6100060000000000FFFFFF1F0A000000CC00
      020000000000FFFFFF1F000000020000000000000000002238000006004D656D
      6F353000020054020000B80100003C0000001C00000047000F00640000000000
      00000000FFFFFF1F2E02000000000001001500CAEEEBE8F7E5F1F2E2EE20ECE5
      F1F22C20F8F2F3EA00000000FFFF000000000002000000010000000006005461
      686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F00
      000002000000000000000000A438000006004D656D6F353100020054020000D4
      0100003C0000001000000047000F0064000000000000000000FFFFFF1F2E0200
      0000000001000200313100000000FFFF00000000000200000001000000000600
      5461686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF
      1F000000020000000000000000004A39000006004D656D6F3532000200540200
      00A4010000880000001400000047000F0064000000000000000000FFFFFF1F2E
      02000000000001002600CEF2EAEBEEEDE5EDE8E52C20E8E7EBE8F8EAE820282B
      292C20EDE5E4EEF1F2E0F7E820282D2900000000FFFF00000000000200000001
      0000000006005461686F6D6100060000000000FFFFFF1F0A000000CC00020000
      000000FFFFFF1F00000002000000000000000000CF39000006004D656D6F3533
      00020090020000B8010000140000001C00000047000F00640000000000000000
      00FFFFFF1F2E02000000000001000500ECE0F1F1E000000000FFFF0000000000
      02000000010000000006005461686F6D6100060000000000FFFFFF1F0A000000
      CC00020000000000FFFFFF1F00000002000000000000000000513A000006004D
      656D6F353400020090020000D4010000140000001000000047000F0064000000
      000000000000FFFFFF1F2E02000000000001000200313200000000FFFF000000
      000002000000010000000006005461686F6D6100060000000000FFFFFF1F0A00
      0000CC00020000000000FFFFFF1F00000002000000000000000000E23A000007
      004D656D6F313039000200A4020000B8010000380000001C00000047000F0064
      000000000000000000FFFFFF1F2E02000000000001001000F1F3ECECE02C20F0
      F3E12E20EAEEEF2E00000000FFFF000000000002000000010000000006005461
      686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F00
      000002000000000000000000653B000007004D656D6F313130000200A4020000
      D4010000380000001000000047000F0064000000000000000000FFFFFF1F2E02
      000000000001000200313300000000FFFF000000000002000000010000000006
      005461686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFF
      FF1F00000002000000000000000000E73B000007004D656D6F31313200020074
      010000D4010000400000001000000047000F0064000000000000000000FFFFFF
      1F2E020000000000010001003600000000FFFF00000000000200000001000000
      0006005461686F6D6100060000000000FFFFFF1F0A000000CC00020000000000
      FFFFFF1F000000020000000000000000007F3C000007004D656D6F3131330002
      0074010000A4010000400000003000000047000F0064000000000000000000FF
      FFFF1F2E02000000000001001700F3F7E5F2EDE0FF20F6E5EDE02C20F0F3E12E
      20EAEEEF2E00000000FFFF000000000002000000010000000006005461686F6D
      6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F00000002
      000000000000000000073D000007004D656D6F313131000200180000001C0200
      001C0000001000000047000F0064000000000000000000FFFFFF1F2E02000000
      0000010007005B4C494E45235D00000000FFFF00000000000200000001000000
      0006005461686F6D6100060000000000FFFFFF1F0A000000CC00020000000000
      FFFFFF1F00000002000000000000000000993D000007004D656D6F3131340002
      00340000001C020000CC0000001000000047000F0064000000000000000000FF
      FFFF1F2E020000000000010011005B4D656D524E532E2254575F4E414D225D00
      000000FFFF000000000002000000010000000006005461686F6D610006000000
      0000FFFFFF1F08000000CC00020000000000FFFFFF1F00000002000000000000
      0000002B3E000007004D656D6F313135000200000100001C0200003000000010
      00000047000F0064000000000000000000FFFFFF1F2E02000000000001001100
      5B4D656D524E532E2254575F415254225D00000000FFFF000000000002000000
      010000000006005461686F6D6100060000000000FFFFFF1F0A000000CC000200
      00000000FFFFFF1F00000002000000000000000000BF3E000007004D656D6F31
      3136000200300100001C0200002C0000001000000047000F0064000000000000
      000000FFFFFF1F2E020000000000010013005B4D656D524E532E2245445F5348
      4F5254225D00000000FFFF000000000002000000010000000006005461686F6D
      6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F00000002
      0000000000000000003E3F000007004D656D6F3131370002005C0100001C0200
      00180000001000000047000F0064000000000000000000FFFFFF1F2E02000000
      0000000000000000FFFF000000000002000000010000000006005461686F6D61
      00060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F0000000200
      0000000000000000E13F000007004D656D6F313138000200B40100001C020000
      3C0000001000000047000F0064000000000000000000FFFFFF1F2E0200000000
      00010022005B5B4D656D524E532E224F5354225D2B5B4D656D524E532E225457
      5F4B4F4C225D5D00000000FFFF00000000000200000001000000000600546168
      6F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F0000
      00020000000000000000006040000007004D656D6F313139000200F00100001C
      020000140000001000000047000F0064000000000000000000FFFFFF1F2E0200
      00000000000000000000FFFF000000000002000000010000000006005461686F
      6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F000000
      02000000000000000000EF40000007004D656D6F313230000200040200001C02
      00003C0000001000000047000F0064000000000000000000FFFFFF1F2E020000
      00000001000E005B4D656D524E532E224F5354225D00000000FFFF0000000000
      02000000010000000006005461686F6D6100060000000000FFFFFF1F0A000000
      CC00020000000000FFFFFF1F000000020000000000000000007041000007004D
      656D6F313231000200400200001C020000140000001000000047000F00640000
      00000000000000FFFFFF1F2E0200000000000100000000000000FFFF00000000
      0002000000010000000006005461686F6D6100060000000000FFFFFF1F0A0000
      00CC00020000000000FFFFFF1F00000002000000000000000000034200000700
      4D656D6F313232000200540200001C0200003C0000001000000047000F006400
      0000000000000000FFFFFF1F2E020000000000010012002D5B4D656D524E532E
      2254575F4B4F4C225D00000000FFFF0000000000020000000100000000060054
      61686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F
      000000020000000000000000008242000007004D656D6F313233000200900200
      001C020000140000001000000047000F0064000000000000000000FFFFFF1F2E
      020000000000000000000000FFFF000000000002000000010000000006005461
      686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F00
      0000020000000000000000001543000007004D656D6F313234000200A4020000
      1C020000380000001000000047000F0064000000000000000000FFFFFF1F2E02
      0101000000010012005B4D656D524E532E2254575F53554D4D225D00000000FF
      FF000000000002000000010000000006005461686F6D6100060000000000FFFF
      FF1F0A000000CC00020000000000FFFFFF1F00000002000000000000000000A9
      43000007004D656D6F313235000200740100001C020000400000001000000047
      000F0064000000000000000000FFFFFF1F2E020101000000010013005B4D656D
      524E532E2254575F4D4F4E4559225D00000000FFFF0000000000020000000100
      00000006005461686F6D6100060000000000FFFFFF1F0A000000CC0002000000
      0000FFFFFF1F000000020000000000000000003744000006004D656D6F353500
      020004020000380200003C0000001400000003000F0064000000000000000000
      FFFFFF1F2E02010100000001000E005B7061676553756D6D4B6F6C325D000000
      00FFFF000000000002000000010000000006005461686F6D6100080000000000
      FFFFFF1F09000000CC00020000000000FFFFFF1F000000020000000000000000
      00C644000006004D656D6F353600020054020000380200003C00000014000000
      03000F0064000000000000000000FFFFFF1F2E02010100000001000F002D5B70
      61676553756D6D4B6F6C335D00000000FFFF0000000000020000000100000000
      06005461686F6D6100080000000000FFFFFF1F09000000CC00020000000000FF
      FFFF1F000000020000000000000000005745000006004D656D6F3537000200D8
      000000E0020000DC000000140000004300000064000000000000000000FFFFFF
      1F2E02000000000001001100C8F2EEE3EE20EFEE20F1F2F0E0EDE8F6E5000000
      00FFFF000000000002000000010000000006005461686F6D6100080000000000
      FFFFFF1F09000000CC00020000000000FFFFFF1F000000020000000000000000
      00E445000006004D656D6F3538000200B4010000E00200003C00000014000000
      03000F0064000000000000000000FFFFFF1F2E02030100000001000D005B7061
      676553756D6D4B6F6C5D00000000FFFF00000000000200000001000000000600
      5461686F6D6100080000000000FFFFFF1F09000000CC00020000000000FFFFFF
      1F000000020000000000000000007346000006004D656D6F3539000200A40200
      00E0020000380000001400000003000F0064000000000000000000FFFFFF1F2E
      02030100000001000F002D5B7061676553756D6D436F73745D00000000FFFF00
      0000000002000000010000000006005461686F6D6100080000000000FFFFFF1F
      09000000CC00020000000000FFFFFF1F00000002000000000000000000014700
      0006004D656D6F363000020004020000E00200003C0000001400000003000F00
      64000000000000000000FFFFFF1F2E02030100000001000E005B706167655375
      6D6D4B6F6C325D00000000FFFF00000000000200000001000000000600546168
      6F6D6100080000000000FFFFFF1F09000000CC00020000000000FFFFFF1F0000
      00020000000000000000009047000006004D656D6F363100020054020000E002
      00003C0000001400000003000F0064000000000000000000FFFFFF1F2E020301
      00000001000F002D5B7061676553756D6D4B6F6C335D00000000FFFF00000000
      0002000000010000000006005461686F6D6100080000000000FFFFFF1F090000
      00CC00020000000000FFFFFF1F00000002000000000000000000254800000600
      4D656D6F363200020004020000F40200003C0000001400000043000F00640000
      00000000000000FFFFFF1F2E030301000000010015005B53554D285B4D656D52
      4E532E224F5354225D295D00000000FFFF000000000002000000010000000006
      005461686F6D6100080000000000FFFFFF1F09000000CC00020000000000FFFF
      FF1F00000002000000000000000000BE48000006004D656D6F36330002005402
      0000F40200003C0000001400000043000F0064000000000000000000FFFFFF1F
      2E030301000000010019005B53554D282D5B4D656D524E532E2254575F4B4F4C
      225D295D00000000FFFF000000000002000000010000000006005461686F6D61
      00080000000000FFFFFF1F09000000CC00020000000000FFFFFF1F0000000200
      00000000000000005C49000006004D656D6F3635000200200000002C030000E4
      000000100000004300000064000000000000000000FFFFFF1F2E020000000000
      01001E00CCE0F2E5F0E8E0EBFCEDEE2DEEF2E2E5F2F1F2E2E5EDEDEEE520EBE8
      F6EE00000000FFFF000000000002000000010000000006005461686F6D61000A
      0000000000FFFFFF1F08000000CC00020000000000FFFFFF1F00000002000000
      000000000000DA49000006004D656D6F3636000200340100002C030000740000
      00100000004300020064000000000000000000FFFFFF1F2E0200000000000000
      00000000FFFF000000000002000000010000000006005461686F6D61000A0000
      000000FFFFFF1F08000000CC00020000000000FFFFFF1F000000020000000000
      00000000584A000006004D656D6F3637000200BC0100002C0300007400000010
      0000004300020064000000000000000000FFFFFF1F2E02000000000000000000
      0000FFFF000000000002000000010000000006005461686F6D61000A00000000
      00FFFFFF1F08000000CC00020000000000FFFFFF1F0000000200000000000000
      0000D64A000006004D656D6F37300002003C0200002C0300008C000000100000
      004300020064000000000000000000FFFFFF1F2E020000000000000000000000
      FFFF000000000002000000010000000006005461686F6D61000A0000000000FF
      FFFF1F08000000CC00020000000000FFFFFF1F00000002000000000000000000
      614B000006004D656D6F3736000200C0000000A0030000380000000900000043
      00000064000000000000000000FFFFFF1F2E02000000000001000B0028E4EEEB
      E6EDEEF1F2FC2900000000FFFF00000000000200000001000000000600546168
      6F6D6100060000000000FFFFFF1F08000000CC00020000000000FFFFFF1F0000
      0002000000000000000000EA4B000006004D656D6F37370002003C010000A003
      000038000000090000004300000064000000000000000000FFFFFF1F2E020000
      0000000100090028EFEEE4EFE8F1FC2900000000FFFF00000000000200000001
      0000000006005461686F6D6100060000000000FFFFFF1F08000000CC00020000
      000000FFFFFF1F000000020000000000000000007F4C000006004D656D6F3738
      000200AC010000A0030000680000000900000043000000640000000000000000
      00FFFFFF1F2E0200000000000100150028F0E0F1F8E8F4F0EEE2EAE020EFEEE4
      EFE8F1E82900000000FFFF000000000002000000010000000006005461686F6D
      6100060000000000FFFFFF1F08000000CC00020000000000FFFFFF1F00000002
      0000000000000000000D4D000006004D656D6F37390002001800000090030000
      80000000100000004300000064000000000000000000FFFFFF1F2E0200000000
      0001000E00D7EBE5EDFB20EAEEECE8F1F1E8E800000000FFFF00000000000200
      0000010000000006005461686F6D61000A0000000000FFFFFF1F08000000CC00
      020000000000FFFFFF1F000000020000000000000000008B4D000006004D656D
      6F3830000200A000000090030000740000001000000043000200640000000000
      00000000FFFFFF1F2E020000000000000000000000FFFF000000000002000000
      010000000006005461686F6D61000A0000000000FFFFFF1F08000000CC000200
      00000000FFFFFF1F00000002000000000000000000094E000006004D656D6F38
      310002001C010000900300007400000010000000430002006400000000000000
      0000FFFFFF1F2E020000000000000000000000FFFF0000000000020000000100
      00000006005461686F6D61000A0000000000FFFFFF1F08000000CC0002000000
      0000FFFFFF1F00000002000000000000000000874E000006004D656D6F383200
      020098010000900300008C000000100000004300020064000000000000000000
      FFFFFF1F2E020000000000000000000000FFFF00000000000200000001000000
      0006005461686F6D61000A0000000000FFFFFF1F08000000CC00020000000000
      FFFFFF1F00000002000000000000000000054F000006004D656D6F3833000200
      A0000000B003000074000000100000004300020064000000000000000000FFFF
      FF1F2E020000000000000000000000FFFF000000000002000000010000000006
      005461686F6D61000A0000000000FFFFFF1F08000000CC00020000000000FFFF
      FF1F00000002000000000000000000834F000006004D656D6F38340002001C01
      0000B003000074000000100000004300020064000000000000000000FFFFFF1F
      2E020000000000000000000000FFFF0000000000020000000100000000060054
      61686F6D61000A0000000000FFFFFF1F08000000CC00020000000000FFFFFF1F
      000000020000000000000000000150000006004D656D6F383500020098010000
      B00300008C000000100000004300020064000000000000000000FFFFFF1F2E02
      0000000000000000000000FFFF00000000000200000001000000000600546168
      6F6D61000A0000000000FFFFFF1F08000000CC00020000000000FFFFFF1F0000
      00020000000000000000007F50000006004D656D6F3836000200A0000000D003
      000074000000100000004300020064000000000000000000FFFFFF1F2E020000
      000000000000000000FFFF000000000002000000010000000006005461686F6D
      61000A0000000000FFFFFF1F08000000CC00020000000000FFFFFF1F00000002
      000000000000000000FD50000006004D656D6F38370002001C010000D0030000
      74000000100000004300020064000000000000000000FFFFFF1F2E0200000000
      00000000000000FFFF000000000002000000010000000006005461686F6D6100
      0A0000000000FFFFFF1F08000000CC00020000000000FFFFFF1F000000020000
      000000000000007B51000006004D656D6F383800020098010000D00300008C00
      0000100000004300020064000000000000000000FFFFFF1F2E02000000000000
      0000000000FFFF000000000002000000010000000006005461686F6D61000A00
      00000000FFFFFF1F08000000CC00020000000000FFFFFF1F0000000200000000
      00000000007C52000007004D656D6F313330000200200000006C030000A00200
      00200000004300000064000000000000000000FFFFFF1F2E0200000000000100
      8000C2F1E520F7EBE5EDFB20EAEEECE8F1F1E8E820EFF0E5E4F3EFF0E5E6E4E5
      EDFB20EEE120EEF2E2E5F2F1F2E2E5EDEDEEF1F2E820E7E020EFEEE4EFE8F1E0
      EDE8E520E0EAF2E02C20F1EEE4E5F0E6E0F9E5E3EE20E4E0EDEDFBE52C20EDE5
      20F1EEEEF2E2E5F2F1F2E2F3FEF9E8E520E4E5E9F1F2E2E8F2E5EBFCEDEEF1F2
      E82E00000000FFFF000000000002000000010000000006005461686F6D610008
      0000000000FFFFFF1F08000000CC00020000000000FFFFFF1F00000002000000
      0000000000001653000007004D656D6F31333100020020000000EC030000A800
      0000100000004300000064000000000000000000FFFFFF1F2E02000000000001
      001900D0E0F1EFEEF0FFE6E5EDE8E520F0F3EAEEE2EEE4E8F2E5EBFF00000000
      FFFF000000000002000000010000000006005461686F6D6100060000000000FF
      FFFF1F08000000CC00020000000000FFFFFF1F00000002000000000000000000
      9553000007004D656D6F313332000200C8000000EC0300001402000010000000
      4300020064000000000000000000FFFFFF1F2E020000000000000000000000FF
      FF000000000002000000010000000006005461686F6D6100060000000000FFFF
      FF1F0A000000CC00020000000000FFFFFF1F0000000200000000000000000017
      54000007004D656D6F313333000200F001000038020000140000001400000047
      000F0064000000000000000000FFFFFF1F2E0200000000000100010058000000
      00FFFF000000000002000000010000000006005461686F6D6100060000000000
      FFFFFF1F0A000000CC00020000000000FFFFFF1F000000020000000000000000
      009954000007004D656D6F313334000200400200003802000014000000140000
      0047000F0064000000000000000000FFFFFF1F2E020000000000010001005800
      000000FFFF000000000002000000010000000006005461686F6D610006000000
      0000FFFFFF1F0A000000CC00020000000000FFFFFF1F00000002000000000000
      0000001B55000007004D656D6F31333500020090020000380200001400000014
      00000047000F0064000000000000000000FFFFFF1F2E02000000000001000100
      5800000000FFFF000000000002000000010000000006005461686F6D61000600
      00000000FFFFFF1F0A000000CC00020000000000FFFFFF1F0000000200000000
      00000000009D55000007004D656D6F313336000200F0010000E0020000140000
      001400000047000F0064000000000000000000FFFFFF1F2E0200000000000100
      01005800000000FFFF000000000002000000010000000006005461686F6D6100
      060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F000000020000
      000000000000001F56000007004D656D6F31333700020040020000E002000014
      0000001400000047000F0064000000000000000000FFFFFF1F2E020000000000
      010001005800000000FFFF000000000002000000010000000006005461686F6D
      6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F00000002
      000000000000000000A156000007004D656D6F31333800020090020000E00200
      00140000001400000047000F0064000000000000000000FFFFFF1F2E02000000
      0000010001005800000000FFFF00000000000200000001000000000600546168
      6F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F0000
      00020000000000000000002357000007004D656D6F313339000200F0010000F4
      020000140000001400000047000F0064000000000000000000FFFFFF1F2E0200
      00000000010001005800000000FFFF0000000000020000000100000000060054
      61686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F
      00000002000000000000000000A557000007004D656D6F313430000200400200
      00F4020000140000001400000047000F0064000000000000000000FFFFFF1F2E
      020000000000010001005800000000FFFF000000000002000000010000000006
      005461686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFF
      FF1F000000020000000000000000002758000007004D656D6F31343100020090
      020000F4020000140000001400000047000F0064000000000000000000FFFFFF
      1F2E020000000000010001005800000000FFFF00000000000200000001000000
      0006005461686F6D6100060000000000FFFFFF1F0A000000CC00020000000000
      FFFFFF1F0000000200000000000000FEFEFF0D0000000A002043617465676F72
      7931000000000B007061676553756D6D4B6F6C000000000C007061676553756D
      6D436F73740000000007007573657246494F000E0027CFEEEBFCE7EEE2E0F2E5
      EBFC27000500646F634944000100300005006465627567001300276466676864
      66676A6667686A676B6A686B27000800726F77436F756E74000000000C007061
      676553756D6D4B6F6C32000000000C007061676553756D6D4B6F6C3300000000
      0A00646F635F6E756D626572000000000800646F635F64617465000000000300
      4F5247000000000300534B4C000000000000000000000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = DsRNS
    Left = 460
    Top = 454
  end
  object MH_IZV: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnBeginDoc = MH_IZVBeginDoc
    Left = 568
    Top = 460
    ReportForm = {
      18000000BE1C0000180000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00001900000016000000160000003600000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      0100000404000500626567696E0D00000D03002020200D0300656E640002003E
      0600000B004D617374657244617461310002010000000014010000F502000010
      0000003100050001000000000000000000FFFFFF1F000000000E00667344535F
      5052494E545F4D48530000000041000500626567696E0D020020200D17002020
      6966206E6F742046696E616C50617373207468656E0D17002020726F77636F75
      6E743A3D726F77436F756E742B313B0D00000D01007B0D3100EDE020EFEEF1EB
      E5E4EDE5E920F1F2F0E0EDE8F6E5202D20EFF0EEE2E5F0E8F2FC20E2EBE5E7E5
      F220EBE820F4F3F2E5F00D2700EDE020EEF1F2E0EBFCEDFBF5202D20EFF0EEE2
      E5F0E8F2FC20E2EBE5E7E5F220EBE820F7E8EBE40D00000D4900EFEEF1EBE5E4
      EDFFFF20EEF2EBE8F7E0E5F2F1FF20F2E5EC20F7F2EE20EAEEEB2DE2EE20F1F2
      F0EEEA20EEF1F2E0EBEEF1FC20ECE5EDFCF8E520F7E5EC20EDE020F1F2F0E0ED
      E8F6F30D00000D16004C494E4523202D20F2E5EAF3F9E0FF20F1F2F0EEEAE00D
      00000D0E002F2F69662066696E616C706173730D0A002F2F6966207061676523
      0D00000D01007D0D0C0020202064656275673A3D313B0D00000D00000D130020
      2069662046696E616C50617373207468656E0D0500626567696E0D00000D1A00
      20206966205B4C494E45235D3D726F77636F756E74207468656E0D0700202062
      6567696E0D0C0020202064656275673A3D323B0D020020200D2E002020206966
      20467265655370616365203C204D6173746572466F6F746572312E4865696768
      742B3230207468656E0D0800202020626567696E0D390020202F2F2020646562
      75673A3D64656275672B27467265655370616365203C204D6173746572466F6F
      746572312E4865696768742B3230273B0D1900202020204368696C64312E5669
      7369626C653A3D747275653B0D3800202020204368696C64312E486569676874
      3A3D204672656553706163653B2F2F4D6173746572466F6F746572312E486569
      6768742D32303B0D15002020202053686F7742616E64284368696C6431293B0D
      1300202020207061676553756D6D4B6F6C3A3D303B0D14002020202070616765
      53756D6D4B6F6C323A3D303B0D1400202020207061676553756D6D4B6F6C333A
      3D303B0D1400202020207061676553756D6D436F73743A3D303B0D10002F2F20
      20204E6577506167652830293B0D1A002F2F20204368696C64312E5669736962
      6C653A3D66616C73653B0D06002020656E643B0D040020656E640D050020656C
      73650D060020626567696E0D2900202020696620467265655370616365203C20
      4D617374657244617461312E686569676874207468656E0D0800202020626567
      696E0D1900202020204368696C64312E56697369626C653A3D747275653B0D1D
      00202020204368696C64312E4865696768743A3D4672656553706163653B0D15
      002020202053686F7742616E64284368696C6431293B0D130020202020706167
      6553756D6D4B6F6C3A3D303B0D1400202020207061676553756D6D4B6F6C323A
      3D303B0D1400202020207061676553756D6D4B6F6C333A3D303B0D1400202020
      207061676553756D6D436F73743A3D303B0D10002F2F2020204E657750616765
      2830293B0D1A002F2F20204368696C64312E56697369626C653A3D66616C7365
      3B0D06002020656E643B0D0100200D050020656E643B0D00000D3E0020207061
      676553756D6D4B6F6C3A3D7061676553756D6D4B6F6C2B5B5B4D656D524E532E
      224F5354225D2B5B4D656D524E532E2254575F4B4F4C225D5D3B0D2C00202070
      61676553756D6D4B6F6C323A3D7061676553756D6D4B6F6C322B5B4D656D524E
      532E224F5354225D3B0D2F0020207061676553756D6D4B6F6C333A3D70616765
      53756D6D4B6F6C332B5B4D656D524E532E2254575F4B4F4C225D3B0D30002020
      7061676553756D6D436F73743A3D7061676553756D6D436F73742B5B4D656D52
      4E532E2254575F53554D4D225D3B0D0400656E643B0D00000D0400656E643B00
      FFFF000000000002000000010000000000000001000000C80000001400000001
      0000000000000200D80600000D004D6173746572486561646572310002010000
      0000CC000000F5020000400000007000040001000000000000000000FFFFFF1F
      0000000000000000000004000500626567696E0D1A00202020204368696C6431
      2E56697369626C653A3D66616C73653B0D00000D0300656E6400FFFF00000000
      0002000000010000000000000001000000C80000001400000001000000000000
      0200D50700000C005265706F72745469746C65310002010000000014000000F5
      0200009E0000003000000001000000000000000000FFFFFF1F00000000000000
      0000000A000500626567696E0D110020207061676553756D6D4B6F6C3A3D303B
      0D120020207061676553756D6D4B6F6C323A3D303B0D12002020706167655375
      6D6D4B6F6C333A3D303B0D120020207061676553756D6D436F73743A3D303B0D
      00000D00000D170020206966206E6F742046696E616C50617373207468656E0D
      0E002020726F77636F756E743A3D303B0D0300656E6400FFFF00000000000200
      0000010000000000000001000000C80000001400000001000000000000020042
      0800000D004D6173746572466F6F7465723100020100000000A4010000F50200
      00900000003000060001000000000000000000FFFFFF1F000000000000000000
      000000000100000000000002000000010000000000000001000000C800000014
      000000010000000000000200A808000006004368696C64310002010000000030
      010000F5020000140000003000150001000000000000000000FFFFFF1F000000
      0000000000000000000001000000000000020000000100000000000000010000
      00C800000014000000010000000000000200130900000B005061676548656164
      6572310002010000000060010000F50200001E00000020000200010000000000
      00000000FFFFFF1F00000000000000000000000000FFFF000000000002000000
      010000000000000001000000C800000014000000010000000000000000C20900
      0006004D656D6F33300002001C000000A0000000A00200001000000043000000
      64000000000000000000FFFFFF1F2E02000000000001002F00CDE0F1F2EEFFF9
      E8EC20EFEEE4F2E2E5F0E6E4E0FEF2F1FF20EEEFF0E5E4E5EBE8E2F8E8E5F1FF
      20EFEEF2E5F0E83A00000000FFFF000000000002000000010000000006005461
      686F6D61000A0000000000FFFFFF1F08000000CC00020000000000FFFFFF1F00
      000002000000000000000000620A000006004D656D6F31330002002000000044
      000000D4010000140000004700020064000000000000000000FFFFFF1F2E0200
      0000000001002000CEF0E3E0EDE8E7E0F6E8FF2028EEF2EFF0E0E2E8F2E5EBFC
      293A205B4F52475D00000000FFFF000000000002000000010000000006005461
      686F6D61000800000000000000000010000000CC00020000000000FFFFFF0000
      000002000000000000000000010B000006004D656D6F31340002002000000060
      000000D4010000100000004300020064000000000000000000FFFFFF1F2E0200
      0000000001001F00CEF0E3E0EDE8E7E0F6E8FF2028EFEEEBF3F7E0F2E5EBFC29
      3A205B4B4C4E5D00000000FFFF00000000000200000001000000000600546168
      6F6D61000800000000000000000010000000CC00020000000000FFFFFF000000
      00020000000000000000008A0B000006004D656D6F3238000200900000007C00
      00006C0000001C0000004300000064000000000000000000FFFFFF1F2E020000
      00000001000900C8C7C2C5D9C5CDC8C500000000FFFF00000000000200000001
      0000000006005461686F6D61000A0000000200000000000A000000CC00020000
      000000FFFFFF0000000002000000000000000000160C000006004D656D6F3236
      000200FC0000007C000000580000001C00000043000F00010000000000000000
      00FFFFFF1F2E02000000000001000C005B646F635F6E756D6265725D00000000
      FFFF000000000002000000010000000006005461686F6D610008000000000000
      0000000A000000CC00020000000000FFFFFF0000000002000000000000000000
      A00C000006004D656D6F3237000200540100007C000000580000001C00000043
      000F0001000000000000000000FFFFFF1F2E02000000000001000A005B646F63
      5F646174655D00000000FFFF000000000002000000010000000006005461686F
      6D6100080000000000000000000A000000CC00020000000000FFFFFF00000000
      02000000000000000000300D000006004D656D6F33340002001C000000E00000
      001C0000001C00000047000F0064000000000000000000FFFFFF1F2E02000000
      000001001000CDEEECE5F020EFEE20EFEEF0FFE4EAF300000000FFFF00000000
      0002000000010000000006005461686F6D6100060000000000FFFFFF1F0A0000
      00CC00020000000000FFFFFF1F00000002000000000000000000C30D00000600
      4D656D6F333600020038000000E00000004C0100001C00000047000F00640000
      00000000000000FFFFFF1F2E02000000000001001300CDE0E8ECE5EDEEE2E0ED
      E8E520F2EEE2E0F0E000000000FFFF0000000000020000000100000000060054
      61686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF1F
      00000002000000000000000000440E000006004D656D6F33390002001C000000
      FC0000001C0000001000000047000F0064000000000000000000FFFFFF1F2E02
      0000000000010001003100000000FFFF00000000000200000001000000000600
      5461686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFFFF
      1F00000002000000000000000000C50E000006004D656D6F3430000200380000
      00FC0000004C0100001000000047000F0064000000000000000000FFFFFF1F2E
      020000000000010001003200000000FFFF000000000002000000010000000006
      005461686F6D6100060000000000FFFFFF1F0A000000CC00020000000000FFFF
      FF1F00000002000000000000000000560F000006004D656D6F39350002001C01
      00003001000068000000140000004300000064000000000000000000FFFFFF1F
      2E02000000000001001100C8F2EEE3EE20EFEE20F1F2F0E0EDE8F6E500000000
      FFFF000000000002000000010000000006005461686F6D6100080000000000FF
      FFFF1F09000000CC00020000000000FFFFFF1F00000002000000000000000000
      E40F000006004D656D6F3938000200D001000030010000540000001400000003
      000F0064000000000000000000FFFFFF1F2E02030100000001000E005B706167
      6553756D6D436F73745D00000000FFFF00000000000200000001000000000600
      5461686F6D6100080000000000FFFFFF1F09000000CC00020000000000FFFFFF
      1F00000002000000000000000000AA10000007004D656D6F3130350002001C00
      000020000000D00000001E0000000300000064000000000000000000FFFFFF1F
      2E02000000000003002100D1F2F0E0EDE8F6E0205B50414745235D2020E8E720
      5B544F54414C50414745535D0D1300CDE0EFE5F7E0F2E0EB205B757365724649
      4F5D0D0B00EAEEE4205B646F6349445D00000000FFFF00000000000200000001
      0000000006005461686F6D6100060000000000FFFFFF1F00000000CC00020000
      000000FFFFFF00000000020000000000000000007011000007004D656D6F3130
      340002001C00000060010000D00000001E000000030000006400000000000000
      0000FFFFFF1F2E02000000000003002100D1F2F0E0EDE8F6E0205B5041474523
      5D2020E8E7205B544F54414C50414745535D0D1300CDE0EFE5F7E0F2E0EB205B
      7573657246494F5D0D0B00EAEEE4205B646F6349445D00000000FFFF00000000
      0002000000010000000006005461686F6D6100060000000000FFFFFF1F000000
      00CC00020000000000FFFFFF0000000002000000000000000000FA1100000600
      4D656D6F353000020084010000E00000004C0000001C00000047000F00640000
      00000000000000FFFFFF1F2E02000000000001000A00CAEEEBE8F7E5F1F2E2EE
      00000000FFFF000000000002000000010000000006005461686F6D6100060000
      000000FFFFFF1F0A000000CC00020000000000FFFFFF1F000000020000000000
      000000007B12000006004D656D6F353100020084010000FC0000004C00000010
      00000047000F0064000000000000000000FFFFFF1F2E02000000000001000100
      3300000000FFFF000000000002000000010000000006005461686F6D61000600
      00000000FFFFFF1F0A000000CC00020000000000FFFFFF1F0000000200000000
      00000000000C13000007004D656D6F313039000200D0010000E0000000540000
      001C00000047000F0064000000000000000000FFFFFF1F2E0200000000000100
      1000F1F3ECECE02C20F0F3E12E20EAEEEF2E00000000FFFF0000000000020000
      00010000000006005461686F6D6100060000000000FFFFFF1F0A000000CC0002
      0000000000FFFFFF1F000000020000000000000000008E13000007004D656D6F
      313130000200D0010000FC000000540000001000000047000F00640000000000
      00000000FFFFFF1F2E020000000000010001003400000000FFFF000000000002
      000000010000000006005461686F6D6100060000000000FFFFFF1F0A000000CC
      00020000000000FFFFFF1F000000020000000000000000001614000007004D65
      6D6F3131310002001C000000140100001C0000001000000047000F0064000000
      000000000000FFFFFF1F2E020000000000010007005B4C494E45235D00000000
      FFFF000000000002000000010000000006005461686F6D6100060000000000FF
      FFFF1F0A000000CC00020000000000FFFFFF1F00000002000000000000000000
      A814000007004D656D6F31313400020038000000140100004C01000010000000
      47000F0064000000000000000000FFFFFF1F2E020000000000010011005B4D65
      6D524E532E2254575F4E414D225D00000000FFFF000000000002000000010000
      000006005461686F6D6100060000000000FFFFFF1F08000000CC000200000000
      00FFFFFF1F000000020000000000000000003A15000007004D656D6F31323200
      020084010000140100004C0000001000000047000F0064000000000000000000
      FFFFFF1F2E020000000000010011005B4D656D524E532E2254575F4B4F4C225D
      00000000FFFF000000000002000000010000000006005461686F6D6100060000
      000000FFFFFF1F0A000000CC00020000000000FFFFFF1F000000020000000000
      00000000CD15000007004D656D6F313234000200D00100001401000054000000
      1000000047000F0064000000000000000000FFFFFF1F2E020101000000010012
      005B4D656D524E532E2254575F53554D4D225D00000000FFFF00000000000200
      0000010000000006005461686F6D6100060000000000FFFFFF1F0A000000CC00
      020000000000FFFFFF1F000000020000000000000000005B16000006004D656D
      6F353600020084010000300100004C0000001400000003000F00640000000000
      00000000FFFFFF1F2E02010100000001000E005B7061676553756D6D4B6F6C33
      5D00000000FFFF000000000002000000010000000006005461686F6D61000800
      00000000FFFFFF1F09000000CC00020000000000FFFFFF1F0000000200000000
      0000000000EC16000006004D656D6F35370002001C010000A401000068000000
      140000004300000064000000000000000000FFFFFF1F2E020000000000010011
      00C8F2EEE3EE20EFEE20F1F2F0E0EDE8F6E500000000FFFF0000000000020000
      00010000000006005461686F6D6100080000000000FFFFFF1F09000000CC0002
      0000000000FFFFFF1F000000020000000000000000007A17000006004D656D6F
      3539000200D0010000A4010000540000001400000003000F0064000000000000
      000000FFFFFF1F2E02030100000001000E005B7061676553756D6D436F73745D
      00000000FFFF000000000002000000010000000006005461686F6D6100080000
      000000FFFFFF1F09000000CC00020000000000FFFFFF1F000000020000000000
      000000000818000006004D656D6F363100020084010000A40100004C00000014
      00000003000F0064000000000000000000FFFFFF1F2E02030100000001000E00
      5B7061676553756D6D4B6F6C335D00000000FFFF000000000002000000010000
      000006005461686F6D6100080000000000FFFFFF1F09000000CC000200000000
      00FFFFFF1F000000020000000000000000009318000006004D656D6F37390002
      0028000000E801000080000000100000004300000064000000000000000000FF
      FFFF1F2E02000000000001000B00CEF2EFF0E0E2E8F2E5EBFC00000000FFFF00
      0000000002000000010000000006005461686F6D61000A0000000000FFFFFF1F
      08000000CC00020000000000FFFFFF1F00000002000000000000000000111900
      0006004D656D6F38310002002C0000000C020000F40000001000000043000200
      64000000000000000000FFFFFF1F2E020000000000000000000000FFFF000000
      000002000000010000000006005461686F6D61000A0000000000FFFFFF1F0800
      0000CC00020000000000FFFFFF1F000000020000000000000000009A19000005
      004D656D6F3200020064010000EC010000800000001000000043000000640000
      00000000000000FFFFFF1F2E02000000000001000A00CFEEEBF3F7E0F2E5EBFC
      00000000FFFF000000000002000000010000000006005461686F6D61000A0000
      000000FFFFFF1F08000000CC00020000000000FFFFFF1F000000020000000000
      00000000171A000005004D656D6F34000200640100000C020000100100001000
      00004300020064000000000000000000FFFFFF1F2E0200000000000000000000
      00FFFF000000000002000000010000000006005461686F6D61000A0000000000
      FFFFFF1F08000000CC00020000000000FFFFFF1F000000020000000000000000
      00A41A000006004D656D6F36380002001C010000B80100006800000014000000
      4300000064000000000000000000FFFFFF1F2E02000000000001000D00C8F2EE
      E3EE20EFEE20E0EAF2F300000000FFFF00000000000200000001000000000600
      5461686F6D6100080000000000FFFFFF1F09000000CC00020000000000FFFFFF
      1F000000020000000000000000003D1B000006004D656D6F3731000200D00100
      00B8010000540000001400000043000F0064000000000000000000FFFFFF1F2E
      020301000000010019005B53554D285B4D656D524E532E2254575F53554D4D22
      5D295D00000000FFFF000000000002000000010000000006005461686F6D6100
      080000000000FFFFFF1F09000000CC00020000000000FFFFFF1F000000020000
      00000000000000D51B000006004D656D6F363300020084010000B80100004C00
      00001400000043000F0064000000000000000000FFFFFF1F2E03030100000001
      0018005B53554D285B4D656D524E532E2254575F4B4F4C225D295D00000000FF
      FF000000000002000000010000000006005461686F6D6100080000000000FFFF
      FF1F09000000CC00020000000000FFFFFF1F0000000200000000000000FEFEFF
      0D0000000A002043617465676F727931000000000B007061676553756D6D4B6F
      6C000000000C007061676553756D6D436F73740000000007007573657246494F
      000E0027CFEEEBFCE7EEE2E0F2E5EBFC27000500646F63494400010030000500
      646562756700130027646667686466676A6667686A676B6A686B27000800726F
      77436F756E74000000000C007061676553756D6D4B6F6C32000000000C007061
      676553756D6D4B6F6C33000000000A00646F635F6E756D626572000000000800
      646F635F646174650000000003004F5247000000000300534B4C000000000000
      000000000000}
  end
  object MH_PRET: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnBeginDoc = MH_PRETBeginDoc
    Left = 616
    Top = 460
    ReportForm = {
      1800000043090000180000FFFF01000100FFFFFFFFFF09000000340800009A0B
      00001900000016000000160000003600000000FFFF00000000FFFF0000000000
      00000000000000030400466F726D000F000080DC000000780000007C0100002C
      0100000404000500626567696E0D00000D03002020200D0300656E6400020072
      0100000C005265706F72745469746C65310002010000000014000000F5020000
      BE0100003000000001000000000000000000FFFFFF1F00000000000000000000
      0A000500626567696E0D110020207061676553756D6D4B6F6C3A3D303B0D1200
      20207061676553756D6D4B6F6C323A3D303B0D120020207061676553756D6D4B
      6F6C333A3D303B0D120020207061676553756D6D436F73743A3D303B0D00000D
      00000D170020206966206E6F742046696E616C50617373207468656E0D0E0020
      20726F77636F756E743A3D303B0D0300656E6400FFFF00000000000200000001
      0000000000000001000000C800000014000000010000000000000200DF010000
      0D004D6173746572466F6F746572310002010000000030020000F50200000400
      00003000060001000000000000000000FFFFFF1F000000000000000000000000
      000100000000000002000000010000000000000001000000C800000014000000
      0100000000000000006802000006004D656D6F333000020018000000A0000000
      A0020000100000004300000064000000000000000000FFFFFF1F2E0200000000
      0001000900CFD0C5D2C5CDC7C8DF00000000FFFF000000000002000000010000
      000006005461686F6D61000A0000000200FFFFFF1F0A000000CC000200000000
      00FFFFFF1F000000020000000000000000000803000006004D656D6F31330002
      008800000030000000D4010000140000004700020064000000000000000000FF
      FFFF1F2E02000000000001002000CEF0E3E0EDE8E7E0F6E8FF2028EEF2EFF0E0
      E2E8F2E5EBFC293A205B4F52475D00000000FFFF000000000002000000010000
      000006005461686F6D61000800000000000000000010000000CC000200000000
      00FFFFFF00000000020000000000000000009A03000006004D656D6F31340002
      001C0200005C000000B40000001C0000004300020064000000000000000000FF
      FFFF1F2E02000000000002000A00C4E8F0E5EAF2EEF0F3200D05005B4B4C4E5D
      00000000FFFF000000000002000000010000000006005461686F6D6100080000
      0000000000000011000000CC00020000000000FFFFFF00000000020000000000
      000000001E04000006004D656D6F3238000200180000006C0000003C00000010
      0000004300000064000000000000000000FFFFFF1F2E02000000000001000400
      E8F1F52E00000000FFFF000000000002000000010000000006005461686F6D61
      000A00000000000000000009000000CC00020000000000FFFFFF000000000200
      00000000000000009E04000006004D656D6F3236000200540000006C00000038
      000000100000004300020001000000000000000000FFFFFF1F2E020000000000
      0100000000000000FFFF000000000002000000010000000006005461686F6D61
      00080000000000000000000A000000CC00020000000000FFFFFF000000000200
      00000000000000001C05000006004D656D6F32370002008C0000006C00000058
      000000100000004300020001000000000000000000FFFFFF1F2E020000000000
      000000000000FFFF000000000002000000010000000006005461686F6D610008
      0000000000000000000A000000CC00020000000000FFFFFF0000000002000000
      000000000000E205000007004D656D6F3130350002001800000018000000D000
      00001E0000000300000064000000000000000000FFFFFF1F2E02000000000003
      002100D1F2F0E0EDE8F6E0205B50414745235D2020E8E7205B544F54414C5041
      4745535D0D1300CDE0EFE5F7E0F2E0EB205B7573657246494F5D0D0B00EAEEE4
      205B646F6349445D00000000FFFF000000000002000000010000000006005461
      686F6D6100060000000000FFFFFF1F00000000CC00020000000000FFFFFF0000
      0000020000000000000000004C08000005004D656D6F3100020018000000B400
      0000C40200001C0100004300000064000000000000000000FFFFFF1F2E020000
      0000000E003F00C220D0C5C7D3CBDCD2C0D2C520CDC5C8D1CFCECBCDC5CDC8DF
      20CEC1DFC7C0D2C5CBDCD1D2C220CFCE20C4CEC3CEC2CED0D320B95F5F5F20CE
      D2205F5F5F200D2A00CE20CFD0C5C4CED1D2C0C2CBC5CDC8C820D3D1CBD3C320
      CFCE20D5D0C0CDC5CDC8DE20D2CEC2C0D0C0200D30005F5F5F5F5F5F5F5F5F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F
      5F5F5F5F2C200D4C00D2D0C5C1D3C5CC20C2CEC7CCC5D1D2C8D2DC20D3C1DBD2
      CAC82C20C020D2C0CAC6C520CFC5CDC820D1CEC3CBC0D1CDCE20CFD3CDCAD2C0
      205F5F5F20C4C0CDCEC3CE20C4CEC3CEC2CED0C02E0D00000D2300D1D3CCCCC0
      20D3C1DBD2CACEC23A205B444F435F53554D4D5D20F0F3E12E20EAEEEF2E0D00
      000D5900C2CE20C8C7C1C5C6C0CDC8C520D0C0D1D5CEC4CEC22C20D1C2DFC7C0
      CDDBD520D120CFD0C5C4DADFC2CBC5CDC8C5CC20C820D0C0D1D1CCCED2D0C5CD
      C8C5CC20C8D1CAC020C220D1D3C4C5C1CDCECC20CFCED0DFC4CAC52C200D4200
      CFD0CED1C8CC20D3C4CEC2CBC5D2C2CED0C8D2DC20CFD0C5D2C5CDC7C8DE20C1
      C5C720CEC1D0C0D9C5CDC8DF20C220D1D3C4C5C1CDDBC520C8CDD1D2C0CDD6C8
      C82E0D00000D00000D00000D00000D21005F5F5F5F5F5F5F5F5F5F5F5F5F2F5F
      5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F00000000FFFF0000000000020000
      00010000000006005461686F6D61000A0000000000FFFFFF1F00000000CC0002
      0000000000FFFFFF1F0000000200000000000000FEFEFF0E0000000A00204361
      7465676F727931000000000B007061676553756D6D4B6F6C000000000C007061
      676553756D6D436F73740000000007007573657246494F000E0027CFEEEBFCE7
      EEE2E0F2E5EBFC27000500646F63494400010030000500646562756700130027
      646667686466676A6667686A676B6A686B27000800726F77436F756E74000000
      000C007061676553756D6D4B6F6C32000000000C007061676553756D6D4B6F6C
      33000000000A00646F635F6E756D626572000000000800646F635F6461746500
      00000003004F5247000000000300534B4C000000000800444F435F53554D4D00
      0000000000000000000000}
  end
end
