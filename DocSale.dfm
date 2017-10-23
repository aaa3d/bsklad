object DOC_SALE: TDOC_SALE
  Left = 337
  Top = 169
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Продажа'
  ClientHeight = 701
  ClientWidth = 964
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object HAT_PAGE_CONTROL: TPageControl
    Left = 0
    Top = 68
    Width = 964
    Height = 123
    ActivePage = TabSheet1
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    HotTrack = True
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    OnChange = HAT_PAGE_CONTROLChange
    OnDrawTab = CTRLDrawTab
    object TabSheet1: TTabSheet
      Caption = 'Основные параметры'
      object Label9: TLabel
        Left = 48
        Top = 4
        Width = 32
        Height = 12
        Caption = 'Склад :'
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
      object Label11: TLabel
        Left = 62
        Top = 28
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
      object Label8: TLabel
        Left = 446
        Top = 4
        Width = 73
        Height = 24
        Caption = 'Примечание/ '#13#10'адрес доставки :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 228
        Top = 28
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
      object Label19: TLabel
        Left = 52
        Top = 50
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
      object Label4: TLabel
        Left = 364
        Top = 48
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
      object SKL: TRxDBLookupCombo
        Left = 92
        Top = 3
        Width = 121
        Height = 20
        Hint = 'После сохранения продажи менять склад не допускается'
        DropDownCount = 8
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
        TabOrder = 0
        OnChange = SKLChange
      end
      object SALE_DOST: TCheckBox
        Left = 231
        Top = 4
        Width = 78
        Height = 17
        Caption = 'Доставка на :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = SALE_DOSTClick
        OnMouseUp = SALE_DOSTMouseUp
      end
      object DOST_DATE: TDateEdit
        Left = 310
        Top = 3
        Width = 127
        Height = 19
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnChange = DOST_DATEChange
      end
      object SALE_DATE: TDateEdit
        Left = 92
        Top = 25
        Width = 121
        Height = 19
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 3
        OnChange = SALE_DATEChange
      end
      object SALE_OSN: TMemo
        Left = 520
        Top = 3
        Width = 321
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
        TabOrder = 4
        OnChange = SALE_OSNChange
      end
      object SALE_WHO: TRxLookupEdit
        Left = 284
        Top = 26
        Width = 153
        Height = 18
        LookupDisplay = 'CFG_VALUE'
        LookupField = 'CFG_ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Text = 'SALE_WHO'
        OnChange = SALE_WHOChange
      end
      object TABEL: TRxCalcEdit
        Left = 92
        Top = 47
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
        TabOrder = 6
        OnChange = TABELChange
        OnKeyPress = TABELKeyPress
      end
      object Btn_Tabel: TButton
        Left = 164
        Top = 47
        Width = 49
        Height = 19
        Caption = 'Задать'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = Btn_TabelClick
      end
      object cbSkidNoPrint: TCheckBox
        Left = 232
        Top = 46
        Width = 125
        Height = 17
        Hint = 
          'Если галка включена, на печатной форме РН и в товарном чеке '#13#10'не' +
          ' будет печататься скидка'
        Caption = 'Не печатать скидку'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object RVID: TRxDBLookupCombo
        Left = 440
        Top = 46
        Width = 257
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
        TabOrder = 9
        OnChange = RVIDChange
      end
      object RVIDKLN: TRxDBLookupCombo
        Left = 704
        Top = 46
        Width = 137
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
        TabOrder = 10
        Visible = False
        OnChange = RVIDKLNChange
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Дополнительные параметры'
      ImageIndex = 1
      object Label5: TLabel
        Left = 69
        Top = 4
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
      object Label7: TLabel
        Left = 42
        Top = 28
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
      object Image2: TImage
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
      object Label20: TLabel
        Left = 585
        Top = 68
        Width = 27
        Height = 12
        Caption = 'НДС :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label22: TLabel
        Left = 670
        Top = 68
        Width = 20
        Height = 12
        Caption = 'НП :'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label25: TLabel
        Left = 658
        Top = 36
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
      object Label26: TLabel
        Left = 752
        Top = 68
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
      object Label1: TLabel
        Left = 45
        Top = 48
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
      object KLN_NAME: TEdit
        Left = 108
        Top = 3
        Width = 341
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
        Text = 'KLN_NAME'
      end
      object BTN_KLN: TBitBtn
        Left = 447
        Top = 3
        Width = 18
        Height = 18
        Hint = 'Выбрать клиента из справочника контактов (F10)'
        TabOrder = 1
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
      object KLN_BNK: TEdit
        Left = 108
        Top = 26
        Width = 429
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
      object NDS: TRxCalcEdit
        Left = 616
        Top = 65
        Width = 45
        Height = 19
        AutoSize = False
        DisplayFormat = '#0.00%'
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
        Visible = False
      end
      object NP: TRxCalcEdit
        Left = 692
        Top = 65
        Width = 45
        Height = 19
        AutoSize = False
        DisplayFormat = '#0.00%'
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ButtonWidth = 0
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
        Visible = False
      end
      object SALE_KURS: TRxCalcEdit
        Left = 684
        Top = 33
        Width = 97
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
        TabOrder = 5
        Visible = False
      end
      object SALE_VALUTA: TRxDBLookupCombo
        Left = 792
        Top = 65
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
      end
      object KLN_KTG: TEdit
        Left = 467
        Top = 3
        Width = 109
        Height = 17
        AutoSize = False
        Enabled = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Text = 'KLN_KTG'
      end
      object rn_gp: TEdit
        Left = 108
        Top = 47
        Width = 469
        Height = 17
        AutoSize = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
    end
    object SKID_TAB_SHEET: TTabSheet
      Caption = 'Скидки'
      ImageIndex = 2
      object Bevel1: TBevel
        Left = 0
        Top = 68
        Width = 913
        Height = 34
        Shape = bsTopLine
        Style = bsRaised
      end
      object Image3: TImage
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
      object Btn_ALLSKID: TButton
        Left = 48
        Top = 40
        Width = 197
        Height = 21
        Caption = 'Одинаковая скидка у всех'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = Btn_ALLSKIDClick
      end
      object ONE_SKID: TEdit
        Left = 252
        Top = 40
        Width = 317
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 48
        Top = 4
        Width = 529
        Height = 33
        Caption = 'Скидка по дисконту'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label13: TLabel
          Left = 8
          Top = 16
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
        object Label18: TLabel
          Left = 164
          Top = 16
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
        object Label21: TLabel
          Left = 268
          Top = 12
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
        object SALE_DISKONT: TEdit
          Left = 64
          Top = 12
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
          TabOrder = 0
          Text = 'SALE_DISKONT'
          OnChange = SALE_DISKONTChange
        end
        object SALE_SKID: TRxCalcEdit
          Left = 204
          Top = 12
          Width = 53
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
          TabOrder = 1
          OnChange = SALE_SKIDChange
        end
        object SALE_SKID_TXT: TEdit
          Left = 356
          Top = 12
          Width = 165
          Height = 17
          AutoSize = False
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'SALE_SKID_TXT'
          OnChange = SALE_SKID_TXTChange
        end
      end
      object comboDiscont: TComboBox
        Left = 583
        Top = 13
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
        TabOrder = 3
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
    end
  end
  object DOC_PAGE_CONTROL: TPageControl
    Left = 0
    Top = 204
    Width = 964
    Height = 478
    ActivePage = TW_TAB_SHEET
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    TabOrder = 1
    OnChange = DOC_PAGE_CONTROLChange
    OnDrawTab = CTRLDrawTab
    object TW_TAB_SHEET: TTabSheet
      Caption = 'Список товаров'
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 956
        Height = 450
        Align = alClient
        DataSource = DsRNS
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColExit = RxDBGrid1ColExit
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
            FieldName = 'TW_SKID'
            Title.Alignment = taCenter
            Title.Caption = 'Скидка, %'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SKID_TXT'
            Title.Caption = 'Обоснование скидки'
            Visible = False
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
          end>
      end
    end
    object NAKL_TAB_SHEET: TTabSheet
      Caption = 'Накладные'
      ImageIndex = 4
      object NAKL_TAB_CTRL: TTabControl
        Left = 0
        Top = 0
        Width = 956
        Height = 450
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        TabOrder = 0
        OnChange = NAKL_TAB_CTRLChange
        OnDrawTab = CTRLDrawTab
        object NAKL_PAGE_CONTROL: TPageControl
          Left = 4
          Top = 35
          Width = 948
          Height = 411
          ActivePage = TW_SHEET
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          TabOrder = 0
          OnChange = NAKL_PAGE_CONTROLChange
          OnDrawTab = CTRLDrawTab
          object TW_SHEET: TTabSheet
            Caption = 'Товары'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImageIndex = 1
            ParentFont = False
            object RxDBGrid3: TRxDBGrid
              Left = 0
              Top = 0
              Width = 940
              Height = 382
              Align = alClient
              DataSource = DsRNS
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
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
                  Title.Alignment = taCenter
                  Title.Caption = 'Таб.'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TW_ART'
                  Title.Alignment = taCenter
                  Title.Caption = 'Код'
                  Width = 58
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TW_NAM'
                  Title.Alignment = taCenter
                  Title.Caption = 'Наименование товара'
                  Width = 121
                  Visible = True
                end
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'ED_SHORT'
                  Title.Alignment = taCenter
                  Title.Caption = 'Ед.'
                  Width = 29
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TW_MONEY'
                  Title.Alignment = taCenter
                  Title.Caption = 'Цена'
                  Width = 84
                  Visible = True
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
                  Title.Alignment = taCenter
                  Title.Caption = 'Сумма'
                  Width = 74
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FRM_OST'
                  Title.Alignment = taCenter
                  Title.Caption = 'Остаток'
                  Width = 66
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RNS_WEIGHT'
                  Title.Caption = 'Масса, кг'
                  Visible = True
                end>
            end
          end
          object TabSheet4: TTabSheet
            Caption = 'Предоплаты'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImageIndex = 2
            ParentFont = False
            object ToolBar2: TToolBar
              Left = 0
              Top = 0
              Width = 940
              Height = 29
              ButtonHeight = 24
              ButtonWidth = 29
              Caption = 'ToolBar3'
              Color = clBtnFace
              Images = DataModule1.ImageList1
              ParentColor = False
              TabOrder = 0
              object ToolButton13: TToolButton
                Left = 0
                Top = 2
                Caption = 'ToolButton13'
                ImageIndex = 0
                OnClick = ToolButton13Click
              end
              object ToolButton3: TToolButton
                Left = 29
                Top = 2
                Action = ActOpenPo
              end
              object ToolButton19: TToolButton
                Left = 58
                Top = 2
                Action = ActDelPo
              end
            end
            object RxDBGrid2: TRxDBGrid
              Left = 0
              Top = 29
              Width = 940
              Height = 354
              Align = alClient
              DataSource = DsListPO
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
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
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'Номер'
                  Width = 96
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PO_DATE'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'Дата'
                  Width = 106
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PO_SUMM'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'Сумма'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STORNO_SUMM'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'Сторно'
                  Width = 99
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PORN_SUMM'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'Погашено'
                  Width = 95
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'KLN_FULL'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'Клиент'
                  Width = 131
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PO_OSN'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'Основание'
                  Width = 116
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'US_FULL'
                  ReadOnly = True
                  Title.Alignment = taCenter
                  Title.Caption = 'Кто оформил'
                  Width = 173
                  Visible = True
                end>
            end
          end
        end
        object ToolBar3: TToolBar
          Left = 4
          Top = 6
          Width = 948
          Height = 29
          ButtonHeight = 24
          ButtonWidth = 25
          Caption = 'ToolBar1'
          Images = DataModule1.ImageList1
          TabOrder = 1
          object ToolButton18: TToolButton
            Left = 0
            Top = 2
            Width = 8
            Caption = 'ToolButton7'
            ImageIndex = 46
            Style = tbsSeparator
          end
          object ToolButton22: TToolButton
            Left = 8
            Top = 2
            Hint = 'Печать накладную(F9)'
            Caption = 'Btn_Print'
            ImageIndex = 9
            OnClick = ToolButton22Click
          end
          object ToolButton23: TToolButton
            Left = 33
            Top = 2
            Hint = 'Напечатать товарный чек...'
            Caption = 'Напечатать товарный чек...'
            ImageIndex = 125
            OnClick = ToolButton23Click
          end
          object ToolButton24: TToolButton
            Left = 58
            Top = 2
            Hint = 'Печать кассового чека (F7)'
            Caption = 'Btn_PrintKKM'
            ImageIndex = 45
            OnClick = ToolButton24Click
          end
          object ToolButton25: TToolButton
            Left = 83
            Top = 2
            Hint = 'История накладная (F12)'
            Caption = 'Btn_Propertis'
            ImageIndex = 3
            OnClick = ToolButton25Click
          end
          object ToolButton26: TToolButton
            Left = 108
            Top = 2
            Hint = 'Создать на основании...'
            Caption = 'Btn_Subdoc'
            ImageIndex = 24
            OnClick = ToolButton26Click
          end
          object ToolButton27: TToolButton
            Left = 133
            Top = 2
            Width = 8
            Caption = 'ToolButton12'
            ImageIndex = 179
            Style = tbsSeparator
          end
          object Label12: TLabel
            Left = 141
            Top = 2
            Width = 34
            Height = 12
            Caption = 'Номер :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object RN_NUM: TEdit
            Left = 175
            Top = 2
            Width = 110
            Height = 24
            AutoSize = False
            Enabled = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Text = 'RN_NUM'
          end
          object ToolButton28: TToolButton
            Left = 285
            Top = 2
            Width = 9
            Caption = 'ToolButton11'
            ImageIndex = 24
            Style = tbsSeparator
          end
          object Label16: TLabel
            Left = 294
            Top = 2
            Width = 36
            Height = 12
            Caption = 'Сумма :'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object RN_SUMM: TRxCalcEdit
            Left = 330
            Top = 2
            Width = 163
            Height = 24
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
            TabOrder = 1
          end
        end
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 964
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 2
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
    object Btn_Print: TToolButton
      Left = 149
      Top = 2
      Hint = 'Печать накладную(F9)'
      Caption = 'Btn_Print'
      ImageIndex = 9
      OnClick = Btn_PrintClick
    end
    object ToolButton9: TToolButton
      Left = 174
      Top = 2
      Action = PrintTWCheck
    end
    object ToolButton16: TToolButton
      Left = 199
      Top = 2
      Hint = 'Печать МХ-3'
      Action = print_mh3
    end
    object ToolButton21: TToolButton
      Left = 224
      Top = 2
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
    object ToolButton15: TToolButton
      Left = 625
      Top = 2
      Width = 8
      Caption = 'ToolButton15'
      ImageIndex = 180
      Style = tbsSeparator
    end
    object btnOpenDrawer: TToolButton
      Left = 633
      Top = 2
      Action = actOpenDrawer
    end
    object ToolButton10: TToolButton
      Left = 658
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 207
      Style = tbsSeparator
    end
    object chkShowOst: TCheckBox
      Left = 666
      Top = 2
      Width = 140
      Height = 24
      Caption = 'Показывать остатки'
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 0
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 682
    Width = 964
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
  object ToolBar5: TToolBar
    Left = 0
    Top = 191
    Width = 964
    Height = 13
    Caption = 'ToolBar5'
    Color = clNavy
    ParentColor = False
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 964
    Height = 39
    Align = alTop
    TabOrder = 5
    object Label24: TLabel
      Left = 576
      Top = 10
      Width = 114
      Height = 13
      Caption = 'Документ-основание: '
      Layout = tlCenter
    end
    object Label23: TLabel
      Left = 417
      Top = 10
      Width = 33
      Height = 12
      Caption = 'Масса :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label14: TLabel
      Left = 201
      Top = 10
      Width = 36
      Height = 12
      Caption = 'Сумма :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label10: TLabel
      Left = 42
      Top = 10
      Width = 34
      Height = 12
      Caption = 'Номер :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object DOC_OSN: TEdit
      Left = 690
      Top = 7
      Width = 161
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object SALE_WEIGHT: TRxCalcEdit
      Left = 454
      Top = 7
      Width = 104
      Height = 21
      AutoSize = False
      DirectInput = False
      DisplayFormat = ',#0.00 кг'
      Enabled = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 1
    end
    object SALE_SUMM: TRxCalcEdit
      Left = 237
      Top = 7
      Width = 163
      Height = 26
      AutoSize = False
      DisplayFormat = ',#0.00 руб'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      GlyphKind = gkCustom
      Glyph.Data = {
        76050000424D760500000000000036000000280000001C0000000C0000000100
        2000000000004005000000000000000000000000000000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF0080808000808080008080
        8000808080008080800080808000808080008080800080808000808080008080
        800080808000FF00FF0080800000808000008000000080000000800000008000
        0000800000008000000080000000800000008000000080000000800000000000
        000080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080800080800000FFFF
        FF00808000008080000080800000808000008080000080800000808000008080
        00008080000080800000800000000000000080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FF00FF00FFFFFF00FF00FF00FFFFFF00FF00FF00FFFFFF00FF00
        FF00FF00FF008080800080800000FFFF00008080000000000000FFFFFF000000
        0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000800000000000
        000080808000FFFFFF00FF00FF0080808000FF00FF0080808000FF00FF008080
        8000FF00FF0080808000FF00FF0080808000FF00FF008080800080800000FFFF
        FF00808000008080000080800000808000008080000080800000808000008080
        00008080000080800000800000000000000080808000FFFFFF00FF00FF00FF00
        FF00FFFFFF00FF00FF00FFFFFF00FF00FF00FFFFFF00FF00FF00FFFFFF00FF00
        FF00FF00FF008080800080800000FFFF00008080000000000000FFFFFF000000
        0000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000800000000000
        000080808000FFFFFF00FF00FF0080808000FF00FF0080808000FF00FF008080
        8000FF00FF0080808000FF00FF0080808000FF00FF008080800080800000FFFF
        FF00808000008080000080800000808000008080000080800000808000008080
        00008080000080800000800000000000000080808000FFFFFF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008080800080800000FFFF000000000000C0C0C000C0C0C000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C0008080000080800000800000000000
        000080808000FFFFFF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080800080800000FFFF
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
        C0008080000080800000800000000000000080808000FFFFFF0080808000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF00FF00FF008080800080800000FFFF00000000000000000000000000000000
        0000000000000000000000000000000000008080000080800000800000000000
        000080808000FFFFFF0080808000808080008080800080808000808080008080
        8000808080008080800080808000FF00FF00FF00FF008080800080800000FFFF
        FF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFFFF00FFFF0000FFFF
        FF00FFFF0000FFFFFF00808000000000000080808000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0080808000FF00FF00808000008080000080800000808000008080
        000080800000808000008080000080800000808000008080000080800000FF00
        FF00FF00FF008080800080808000808080008080800080808000808080008080
        80008080800080808000808080008080800080808000FF00FF00}
      ButtonWidth = 0
      NumGlyphs = 4
      ParentFont = False
      TabOrder = 2
    end
    object SALE_NUM: TEdit
      Left = 76
      Top = 7
      Width = 110
      Height = 21
      AutoSize = False
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = 'SALE_NUM'
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 576
    Top = 445
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
    object MnKLN: TMenuItem
      Caption = 'Поменять клиента'
      ImageIndex = 14
      ShortCut = 121
      OnClick = BTN_KLNClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N31: TMenuItem
      Action = print_mh3
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать Расходную накладную '
      ImageIndex = 9
    end
    object N7: TMenuItem
      Action = actFastPrintRn
    end
    object MnPRINTKKM: TMenuItem
      Caption = 'Напечатать кассовый чек'
      ImageIndex = 45
      ShortCut = 118
      OnClick = MnPRINTKKMClick
    end
    object N5: TMenuItem
      Action = PrintTwCheckFast
    end
    object MnHistory: TMenuItem
      Caption = '"История" расходной накладной'
      ImageIndex = 3
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
      Caption = 'Напечатать ценник   (F9)'
      ImageIndex = 40
      OnClick = Btn_PrintCennClick
    end
    object MnCennMore: TMenuItem
      Caption = 'Напечатать ценники на все товары из накладной   (F9)'
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
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 568
    Top = 396
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
    end
    object ActRnToStorno: TAction
      Caption = 'Сторнировать полностью...'
      Hint = 'Сторнировать полностью...'
      ImageIndex = 179
    end
    object ActShowPO: TAction
      Caption = 'Просмотр информации о сторно и предоплатах...'
      Hint = 'Просмотр информации о сторно и предоплатах...'
      ImageIndex = 181
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
    object actFastPrintRn: TAction
      Caption = 'Печать расходной накладной без вывода на экран'
      ShortCut = 123
      OnExecute = actFastPrintRnExecute
    end
    object print_mh3: TAction
      Caption = 'Печать МХ-3'
      ImageIndex = 202
      ShortCut = 120
      OnExecute = print_mh3Execute
    end
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
        Name = 'SALER_ID'
        DataType = ftInteger
      end
      item
        Name = 'RN_ID'
        DataType = ftInteger
      end
      item
        Name = 'tw_noskid'
        DataType = ftInteger
      end
      item
        Name = 'tw_skid_load'
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
        Name = 'FRM_OST'
        DataType = ftFloat
      end>
    AfterEdit = MemRNSAfterEdit
    OnCalcFields = MemRNSCalcFields
    OnFilterRecord = MemRNSFilterRecord
    Left = 30
    Top = 573
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
      DisplayWidth = 20
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
    object MemRNSSALER_ID: TIntegerField
      FieldName = 'SALER_ID'
    end
    object MemRNSRN_ID: TIntegerField
      FieldName = 'RN_ID'
    end
    object MemRNStw_noskid: TIntegerField
      FieldName = 'tw_noskid'
    end
    object MemRNStw_skid_load: TFloatField
      FieldName = 'tw_skid_load'
    end
    object MemRNSnapr: TIntegerField
      FieldName = 'napr'
    end
    object MemRNSktg: TIntegerField
      FieldName = 'ktg'
    end
    object MemRNSFRM_OST: TFloatField
      FieldName = 'FRM_OST'
      DisplayFormat = '#0.0000'
    end
  end
  object DsRNS: TDataSource
    DataSet = MemRNS
    OnDataChange = DsRNSDataChange
    Left = 32
    Top = 633
  end
  object IBSkl: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SaleDocTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from dic_shop_skl(:shop_id, 1)'
      'where cfg_value > 0')
    Left = 24
    Top = 325
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
    Left = 24
    Top = 377
  end
  object DsShopRvid: TDataSource
    DataSet = DicShopRvid
    Left = 138
    Top = 460
  end
  object DicShopRvid: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = RvidTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from rvid_shop_list(:shop_id,:rntyp_id,:rn_id)'
      'order by rvid_name')
    Left = 142
    Top = 409
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
  object DicRvidKLN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = RvidTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from DIC_RVIDKLN_ALL(:rvid_id)')
    Left = 142
    Top = 511
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
    Left = 140
    Top = 562
  end
  object RvidTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 140
    Top = 613
  end
  object SaleDocTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 44
    Top = 429
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 244
    Top = 366
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 242
    Top = 314
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 720
    Top = 326
  end
  object QrListPO: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = PoTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from rn_list_po(:rn_id) order by po_date desc')
    Left = 368
    Top = 328
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
    Left = 368
    Top = 380
  end
  object PoTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 370
    Top = 429
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer3Timer
    Left = 812
    Top = 346
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 1200
    OnTimer = Timer2Timer
    Left = 718
    Top = 410
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 468
    Top = 333
  end
  object Query1Transaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 468
    Top = 525
  end
  object IBQuery2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 468
    Top = 381
  end
  object IBQuery3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = Query1Transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM CFG WHERE CFG_NAME = "EXPEDITOR"')
    Left = 464
    Top = 478
  end
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 250
    Top = 426
  end
end
