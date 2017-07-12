object DOC_PN_WOZW: TDOC_PN_WOZW
  Left = 215
  Top = 184
  Width = 775
  Height = 583
  Caption = 'Возврат товара поставщику'
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 767
    Height = 185
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 58
      Top = 134
      Width = 62
      Height = 13
      Caption = 'Основание :'
    end
    object Label3: TLabel
      Left = 88
      Top = 38
      Width = 32
      Height = 13
      Caption = 'Дата :'
    end
    object Label4: TLabel
      Left = 252
      Top = 38
      Width = 40
      Height = 13
      Caption = 'Номер :'
    end
    object Label5: TLabel
      Left = 420
      Top = 36
      Width = 40
      Height = 13
      Caption = 'Сумма :'
    end
    object Label7: TLabel
      Left = 52
      Top = 110
      Width = 69
      Height = 13
      Caption = 'Поставщику :'
    end
    object BtnKln: TSpeedButton
      Left = 558
      Top = 106
      Width = 23
      Height = 22
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
      OnClick = BtnKlnClick
    end
    object Image1: TImage
      Left = 4
      Top = 32
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        07544269746D617042080000424D420800000000000042000000280000002000
        0000200000000100100003000000000800000000000000000000000000000000
        0000007C0000E00300001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F0000283105298214420CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F000027254D5A26312631E424E61C0000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F00000625A94D4D5E052DE52CE52CE528C52063106208FF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        00002621A849A8554D6204290429C428C428C424C424A420C6200000FF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
        E5208741A94DA9554D62C524C424E420C420C420C320A420A420A318620C420C
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000621
        6639A845A84DC9516D5EC420C420C420C41C84208420A318A318841884186218
        E6180000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E5204739
        6845A845A94DC9514D5EA320A320A42088456739A41883188314831882186214
        821462102104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000C61C26396639
        68418749C84DA8554D62831C831888412A660B5E095A473D831C631462146210
        421042104008FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000A51C053147396641
        6741A749A84DA9554D628318473D2B662B662B622A620A5EEA5987410429420C
        4210210C4108FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2821E52826314639473D
        8845A845AA4DC9514D5AC4244B624B624B622A662A5E2A622A5AEA5DEA55C951
        0629420C0208FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FA51C062D26314739873D
        8741A845A84DA85127392B626C6A4C664B622B662B662B620B5E2A5AEA5DEA59
        0956A94D473DC41CFF7FFF7FFF7FFF7FFF7FFF7FFF7FC620052D053146394645
        4741663D2635A4188418473909562B664C664B662B622A662A660A5E295EEA5D
        EA5DE955C955E9516741E4200104FF7FFF7FFF7FFF7FA620052D05312535C528
        E52C6741062D83202218411C431CC5282639C9514B662A622A662A622A620A5A
        EA5D095AC955E955CA55473DDE7BFF7FFF7FFF7FFF7FC51C062DE52CE62CA94D
        EA5526352029421C422042204220422462246320E528A74909560B622C5E2A62
        0A5AEA5DEA55E959884D410CFF7FFF7FFF7FFF7FFF7FC61CA42089490A56E955
        C5244110613542244224422842284228422842284228A1390429052D47350A5A
        0A5E2A5EEA5DA845DE77FF7FFF7FFF7FFF7FFF7FFF7FA6186845C955A84D831C
        42188314A13D42304230412C43344230423042344134E24D463947392739E528
        26318849C84D210CFF7FFF7FFF7FFF7FFF7FFF7F420CA949EA598745A320841C
        841CC31C014A423842384238413842384238413C423C42568849884987458849
        E734262DE520FF7FFF7FFF7FFF7FFF7FFF7F42086841EA554739A418C4204331
        433163396256623C623C423C42446240624042446244A266465A475E475E6735
        C949CA5589498414FF7FFF7FFF7FFF7F6208AA4D26318118841CC628E524024A
        8255C24CC25062486248424C424C62486248424C424CE2540255A161C66A4C5A
        0B56EB55EA550731FF7FFF7FFF7F20000729831084142631052DA420C324C528
        035221596250625062546250825062546254625062506254425DC5726D622C5A
        2C5E0B560B56EA51072D2104FF7F6B2DDE7B0000472D2639263545312635062D
        4635445A425D62586258625862586258625C625862584265E8726D626D624D5E
        2C5E2B5A2B56EA55CA518210FF7FFF7FFF7F0000062D46354739463946394635
        4639463585626369636082606360636083608360446909778E6A8E668E666D62
        4C5A4C5E2C5E0B5A0A5268414104FF7FFF7F0000673986396739683966394735
        473546396639865E4369846484648364836465712C77D16AAF6AB0666E668E62
        6C5E6D5E2C5E4C5A2A56683DFF7FFF7FFF7FC424884168416841874167416841
        674147396739473D886665758370837065712B77F272B16ED16E8F6AAF6A6E66
        8E664D622C5E683D8314FF7FFF7FFF7F430C8745874988456849874587456845
        6845873D473D6845874589624479267DCD6ACB41F276F176B16EB06EAF6A8E6E
        6E66A949DE77FF7FFF7FFF7FFF7FFF7F8310683D473DA849884D884588498749
        884987456745674167418849AA66AC5E9D732A29B16A1273F272D16E906AAA45
        A418FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2104A51CE52C8845C849
        8849884D884D8845884588456841FF7BFF7FFF7F0725137732730E56BE77FF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F4210
        8318E42827396741A849A8492631FF7FFF7FFF7F8410ED49C524FF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FA3202729FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7F}
      Transparent = True
    end
    object Label6: TLabel
      Left = 76
      Top = 62
      Width = 43
      Height = 13
      Caption = 'Фирма :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 62
      Top = 84
      Width = 58
      Height = 13
      Caption = 'Со склада :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 765
      Height = 29
      ButtonHeight = 24
      ButtonWidth = 25
      Caption = 'ToolBar1'
      EdgeBorders = [ebBottom]
      Images = DataModule1.ImageList1
      TabOrder = 0
      object ToolButton6: TToolButton
        Left = 0
        Top = 2
        Action = MnLock
      end
      object ToolButton7: TToolButton
        Left = 25
        Top = 2
        Width = 8
        Caption = 'ToolButton7'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton1: TToolButton
        Left = 33
        Top = 2
        Action = MnProw
      end
      object ToolButton2: TToolButton
        Left = 58
        Top = 2
        Action = MnUnprow
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
        Action = MnSave
      end
      object ToolButton5: TToolButton
        Left = 116
        Top = 2
        Action = MnApply
      end
      object ToolButton8: TToolButton
        Left = 141
        Top = 2
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton9: TToolButton
        Left = 149
        Top = 2
        Action = MnPrint
      end
      object ToolButton10: TToolButton
        Left = 174
        Top = 2
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton11: TToolButton
        Left = 182
        Top = 2
        Action = MnDicTw
      end
      object ToolButton12: TToolButton
        Left = 207
        Top = 2
        Action = MnDel
      end
      object ToolButton13: TToolButton
        Left = 232
        Top = 2
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton14: TToolButton
        Left = 240
        Top = 2
        Action = MnDetal
      end
      object ToolButton15: TToolButton
        Left = 265
        Top = 2
        Action = MnAnaliz
      end
      object ToolButton16: TToolButton
        Left = 290
        Top = 2
        Action = MnMarket
      end
      object ToolButton17: TToolButton
        Left = 315
        Top = 2
        Width = 8
        Caption = 'ToolButton17'
        ImageIndex = 11
        Style = tbsSeparator
      end
    end
    object PN_OSN: TMemo
      Left = 124
      Top = 130
      Width = 459
      Height = 45
      Lines.Strings = (
        'PN_OSN')
      MaxLength = 250
      TabOrder = 1
      OnChange = PN_OSNChange
    end
    object PN_DATE: TDateEdit
      Left = 124
      Top = 34
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
      OnChange = PN_DATEChange
    end
    object PN_NUM: TEdit
      Left = 294
      Top = 34
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = 'PN_NUM'
    end
    object RxCalcEdit1: TRxCalcEdit
      Left = 462
      Top = 32
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 руб##'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 4
    end
    object KLN_NAME: TEdit
      Left = 124
      Top = 107
      Width = 435
      Height = 21
      Enabled = False
      TabOrder = 5
      Text = 'KLN_NAME'
    end
    object FRM: TRxDBLookupCombo
      Left = 124
      Top = 58
      Width = 293
      Height = 20
      DropDownCount = 8
      EscapeClear = False
      LookupField = 'KLN_ID'
      LookupDisplay = 'KLN_FULL'
      LookupSource = DataModule1.MainDsAllFrm
      TabOrder = 6
      OnChange = FRMChange
    end
    object SKL: TRxDBLookupCombo
      Left = 124
      Top = 80
      Width = 143
      Height = 21
      DropDownCount = 12
      EscapeClear = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      LookupField = 'SKL_ID'
      LookupDisplay = 'SKL_SHORT'
      LookupSource = DataModule1.MainDsSkl
      ParentFont = False
      TabOrder = 7
      OnChange = SKLChange
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 537
    Width = 767
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 185
    Width = 767
    Height = 352
    Align = alClient
    DataSource = DsWozw
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'TW_ART'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Код'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TW_NAM'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Наименование'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Документ'
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DOC_DATE'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Дата продажи'
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_SHORT'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Ед.'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNS_MONEY'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Цена'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNS_KOL'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Продано'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNS_OST'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Для возврата'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNS_SUMM'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Сумма'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WOZW_KOL'
        Title.Alignment = taCenter
        Title.Caption = 'Возврат'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WOZW_SUMM'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Сумма возврата'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNS_NDS'
        Title.Alignment = taCenter
        Title.Caption = 'Ставка НДС'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNS_NDS_SUMM'
        Title.Alignment = taCenter
        Title.Caption = 'Сумма НДС'
        Visible = True
      end>
  end
  object MemWozw: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'TW_ID'
        DataType = ftInteger
      end
      item
        Name = 'PNS_ID'
        DataType = ftInteger
      end
      item
        Name = 'TW_ART'
        DataType = ftInteger
      end
      item
        Name = 'TW_NAM'
        DataType = ftString
        Size = 252
      end
      item
        Name = 'WOZW_ID'
        DataType = ftInteger
      end
      item
        Name = 'DOC_NAME'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DOC_DATE'
        DataType = ftDate
      end
      item
        Name = 'ED_SHORT'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'PNS_MONEY'
        DataType = ftFloat
      end
      item
        Name = 'PNS_KOL'
        DataType = ftFloat
      end
      item
        Name = 'PNS_OST'
        DataType = ftFloat
      end
      item
        Name = 'WOZW_KOL'
        DataType = ftFloat
      end
      item
        Name = 'PNS_NDS'
        DataType = ftFloat
      end
      item
        Name = 'POL_ID'
        DataType = ftInteger
      end>
    BeforePost = MemWozwBeforePost
    AfterDelete = MemWozwAfterDelete
    AfterScroll = MemWozwAfterScroll
    OnCalcFields = MemWozwCalcFields
    Left = 166
    Top = 216
    object MemWozwTW_ID: TIntegerField
      FieldName = 'TW_ID'
    end
    object MemWozwPNS_ID: TIntegerField
      FieldName = 'PNS_ID'
    end
    object MemWozwTW_ART: TIntegerField
      FieldName = 'TW_ART'
    end
    object MemWozwTW_NAM: TStringField
      FieldName = 'TW_NAM'
      Size = 252
    end
    object MemWozwWOZW_ID: TIntegerField
      FieldName = 'WOZW_ID'
    end
    object MemWozwDOC_NAME: TStringField
      FieldName = 'DOC_NAME'
      Size = 100
    end
    object MemWozwDOC_DATE: TDateField
      FieldName = 'DOC_DATE'
    end
    object MemWozwED_SHORT: TStringField
      FieldName = 'ED_SHORT'
      Size = 12
    end
    object MemWozwPNS_MONEY: TFloatField
      FieldName = 'PNS_MONEY'
      DisplayFormat = '#0.00'
    end
    object MemWozwPNS_KOL: TFloatField
      FieldName = 'PNS_KOL'
      DisplayFormat = '#0.0000'
    end
    object MemWozwPNS_OST: TFloatField
      FieldName = 'PNS_OST'
      DisplayFormat = '#0.0000'
    end
    object MemWozwPNS_SUMM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PNS_SUMM'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemWozwWOZW_KOL: TFloatField
      FieldName = 'WOZW_KOL'
      OnChange = MemWozwWOZW_KOLChange
      DisplayFormat = '#0.0000'
    end
    object MemWozwWOZW_SUMM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'WOZW_SUMM'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object MemWozwPNS_NDS: TFloatField
      FieldName = 'PNS_NDS'
      DisplayFormat = '#0.0%'
    end
    object MemWozwPNS_NDS_SUMM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PNS_NDS_SUMM'
      DisplayFormat = '#0.00 руб'
      Calculated = True
    end
    object MemWozwPOL_ID: TIntegerField
      FieldName = 'POL_ID'
    end
  end
  object DsWozw: TDataSource
    DataSet = MemWozw
    OnDataChange = DsWozwDataChange
    Left = 166
    Top = 272
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 286
    Top = 216
    object MnLock: TAction
      Caption = 'Заблокировать систему...'
      Hint = 'Заблокировать систему...'
      ImageIndex = 110
      OnExecute = MnLockExecute
    end
    object MnProw: TAction
      Caption = 'Провести...'
      Hint = 'Провести...'
      ImageIndex = 22
      ShortCut = 116
      OnExecute = MnProwExecute
    end
    object MnUnprow: TAction
      Caption = 'Снять с проводки...'
      Hint = 'Снять с проводки...'
      ImageIndex = 23
      ShortCut = 117
      OnExecute = MnUnprowExecute
    end
    object MnSave: TAction
      Caption = 'Сохранить...'
      Hint = 'Сохранить...'
      ImageIndex = 39
      OnExecute = MnSaveExecute
    end
    object MnApply: TAction
      Caption = 'Применить...'
      Hint = 'Применить...'
      ImageIndex = 38
      OnExecute = MnApplyExecute
    end
    object MnPrint: TAction
      Caption = 'Печать...'
      Hint = 'Печать...'
      ImageIndex = 9
      ShortCut = 120
    end
    object MnDicTw: TAction
      Caption = 'Товары по каталогу...'
      Hint = 'Товары по каталогу...'
      ImageIndex = 37
      OnExecute = MnDicTwExecute
    end
    object MnDel: TAction
      Caption = 'Удалить...'
      Hint = 'Удалить...'
      ImageIndex = 2
      OnExecute = MnDelExecute
    end
    object MnDetal: TAction
      Caption = 'Подробно о товаре...'
      Enabled = False
      Hint = 'Подробно о товаре...'
      ImageIndex = 11
      ShortCut = 113
      OnExecute = MnDetalExecute
    end
    object MnAnaliz: TAction
      Caption = 'Анализ товара...'
      Enabled = False
      Hint = 'Анализ товара...'
      ImageIndex = 12
      ShortCut = 114
      OnExecute = MnAnalizExecute
    end
    object MnMarket: TAction
      Caption = 'Маркетинговые данные товара...'
      Enabled = False
      Hint = 'Маркетинговые данные товара...'
      ImageIndex = 10
      ShortCut = 115
      OnExecute = MnMarketExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 392
    Top = 216
    object MnLock1: TMenuItem
      Action = MnLock
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Action = MnProw
    end
    object N3: TMenuItem
      Action = MnUnprow
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Action = MnSave
    end
    object N6: TMenuItem
      Action = MnApply
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Action = MnPrint
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = MnDicTw
    end
    object N11: TMenuItem
      Action = MnDel
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object N13: TMenuItem
      Action = MnDetal
    end
    object N14: TMenuItem
      Action = MnAnaliz
    end
    object N15: TMenuItem
      Action = MnMarket
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 46
    Top = 228
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 46
    Top = 282
  end
end
