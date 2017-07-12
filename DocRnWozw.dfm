object DOC_RN_WOZW: TDOC_RN_WOZW
  Left = 422
  Top = 211
  Width = 1066
  Height = 634
  Caption = 'Возврат товара от покупателя'
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
    Width = 1058
    Height = 185
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 132
      Width = 114
      Height = 26
      Caption = 'Основание'#13#10'(паспортные данные) :'
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
      Left = 58
      Top = 109
      Width = 63
      Height = 13
      Caption = 'От клиента :'
    end
    object BtnKln: TSpeedButton
      Left = 560
      Top = 104
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
        FF7FFF7FFF7FFF7FFF7FFF7FFF7F00002925A514A51408210000FF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F630CC618C618C618C618C618
        C618C618C618C618C618C618C61884102731A9490531C424E7208410C618C618
        C618C618C618C618C618C618FF7FFF7FFF7F0000C618C618C618C618C618C618
        C618C618C618C618C618C618C6180629C955C945463525350531A4200004630C
        C618C618C618C618C6182925FF7FFF7FFF7F4A29314631463146314631463146
        314631463146314631466110262DC951E951A94525310531052DE52C05298214
        410C42081042314600002925FF7FFF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FAA35663DA94DC84DC84DAA450631042D04290529C528A318
        A32063100000734E00002925FF7FFF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FCC3DC4248745A849A84DC94DA9410531052DE42CE428E4288218
        A320A31C831C82142004C618FF7FFF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F8A392635042986458849A849A8518945042DC52CC428E428C4208214
        831CA220A218831883186210A518FF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FAC3D0531673DC42887418745A849A84D8941052DE428E424C424C2206218
        831CA31C82188214421462106010FF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7FFF7F
        AB39062D47398639E520474187418841C8458A41C528E424E420C320C4208310
        A218831883146214621062104210FF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7F9C73
        E42446394639463DC52447396741884188458941E528E420C420A31C84208214
        A2188314831462106210420C4210FF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7F9C73
        E42C243126394639C428463966396741A8458841E42CC3248320A220A2186214
        6314621862106110420C410C4008FF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7F9C73
        E428063125352635C4244635463D8741CA55E955C8496745052DA31C82186210
        4114621462104210420C21084008FF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7F9C73
        C424053105312631C320463988450A520A56C955C955A84DC84DA84D4631821C
        621043104210410C220821080108FF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7F9C73
        C424053105312635052D48390B5A0B560A56C951C951A84DA8458849C9492635
        4639C42042104108200821040108FF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7F9C73
        A3240429052D27352C5A66394735C951A951C851C94DA851A849683D26356741
        6641463986410635631420080000FF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7F9C73
        A324042967392D5A4E624C5E0B56EA51CA5125350535C94D473D684586456741
        67414639463925352635E42C8510FF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7F9C73
        E424893D6F628E5E6D622D5E2C5E0B560A560B562735252D6639673D8741673D
        863D473946392631E31C492DFF7FFF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7FBC77
        0C4E906270668E5E6E624D5E2C5E2C56A941883DC94DA84D8741874106312631
        863D47394639596F00002925FF7FFF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FDD7F1473D26A6F664D5E0B52AA45C951E955C955A851A84D8849C7496741
        AB41D562FF7FFF7F21042925FF7FFF7FFF7F6B2DFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FDC7FBC7B56738F6A0B5ECA55C955A851A84D884986459B77
        FF7FFF7FFF7FFF7F21042925FF7FFF7FFF7F6B2DFF7FFF7F5A6BF65AF65AFF7F
        5967F65AF65AFF7FFF7FBD77F65AF65AF65AB97B3677705E705E9A7B3967F65A
        1863FF7FFF7FFF7F21042925FF7FFF7FFF7F6B2DFF7FFF7FBD73C4087246FF7F
        BC73C408934AFF7FFF7FDE7B6A21C408EF3938634819F46AFF7FFF7F4819E610
        5A6BFF7FFF7FFF7F21042925FF7FFF7FFF7F6B2DFF7FFF7FFF7FC408B552FF7F
        FF7FB5568B29FF7FFF7FBD774819491DDE7B175FC408FF7FFF7F0F3ACC2DFF7F
        FF7FFF7FFF7FFF7F21042925FF7FFF7FFF7F6B2DFF7FFF7FFF7FC408B552FF7F
        FF7FBD77481D271527150611C408D65AFF7F175FC408FF7FAB29CC2DFF7FFF7F
        FF7FFF7FFF7FFF7F21042925FF7FFF7FFF7F6B2DFF7FFF7FFF7FC408B552FF7F
        FF7FFF7FEE355146FF7FCE35E510FF7FFF7F175FC4080F3AC408EE39FF7FFF7F
        FF7FFF7FFF7FFF7F21042925FF7FFF7FFF7F6B2DFF7FFF7FFF7FC408B552FF7F
        FF7FFF7FF75E27159C73C4080F3EFF7FFF7F175FC408BD73BD73281D944EFF7F
        FF7FFF7FFF7FFF7F21042925FF7FFF7FFF7F6B2DFF7FFF7FFF7FC408B552FF7F
        FF7FFF7FFF7FAC31B44EE50C5A6BFF7FFF7F175FC408FF7FFF7FD656C408FF7F
        FF7FFF7FFF7FFF7F21042925FF7FFF7FFF7F6B2D5142FF7FFF7FC408B552FF7F
        0F36FF7FFF7F5967C4086A21FF7FFF7FFF7F175FC408FF7FFF7FD656C408FF7F
        FF7FFF7FFF7FFF7F21042925FF7FFF7FFF7F6B2D303E281D934AC408CD315142
        E50CFF7FFF7FBD77481DD65AFF7FFF7FFF7F0E36C408934A934A0719524AFF7F
        FF7FFF7FFF7FFF7F21042925FF7FFF7FFF7F6B2DFF7FDE7BDE7BDE7BDE7BDE7B
        DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7BDE7BDE7BDE7BDE7BFF7FFF7F
        FF7FFF7FFF7FFF7F2104630CFF7FFF7FFF7FA514A514A514A514A514A514A514
        A514A514A514A514A514A514A514A514A514A514A514A514A514A514A514A514
        A514A514A514A514A514FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7F}
      Transparent = True
    end
    object Label8: TLabel
      Left = 402
      Top = 82
      Width = 30
      Height = 13
      Caption = 'НДС :'
    end
    object Label9: TLabel
      Left = 508
      Top = 82
      Width = 19
      Height = 13
      Caption = 'НП:'
    end
    object Label1: TLabel
      Left = 67
      Top = 84
      Width = 53
      Height = 13
      Caption = 'На склад :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 78
      Top = 64
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
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 1056
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
      object ToolButton18: TToolButton
        Left = 174
        Top = 2
        Hint = 'Печать чека возврата... (F7)'
        Action = ActKKM
        Caption = 'Печать чека возврата...( F7)'
      end
      object ToolButton10: TToolButton
        Left = 199
        Top = 2
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object ToolButton11: TToolButton
        Left = 207
        Top = 2
        Action = MnDicTw
      end
      object ToolButton12: TToolButton
        Left = 232
        Top = 2
        Action = MnDel
      end
      object ToolButton13: TToolButton
        Left = 257
        Top = 2
        Width = 8
        Caption = 'ToolButton13'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object ToolButton14: TToolButton
        Left = 265
        Top = 2
        Action = MnDetal
      end
      object ToolButton15: TToolButton
        Left = 290
        Top = 2
        Action = MnAnaliz
      end
      object ToolButton16: TToolButton
        Left = 315
        Top = 2
        Action = MnMarket
      end
      object ToolButton17: TToolButton
        Left = 340
        Top = 2
        Width = 8
        Caption = 'ToolButton17'
        ImageIndex = 11
        Style = tbsSeparator
      end
    end
    object RN_OSN: TMemo
      Left = 124
      Top = 127
      Width = 459
      Height = 45
      Lines.Strings = (
        'RN_OSN')
      MaxLength = 250
      TabOrder = 1
      OnChange = RN_OSNChange
    end
    object RN_DATE: TDateEdit
      Left = 124
      Top = 34
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
      OnChange = RN_DATEChange
    end
    object RN_NUM: TEdit
      Left = 294
      Top = 34
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 3
      Text = 'RN_NUM'
    end
    object RxCalcEdit1: TRxCalcEdit
      Left = 462
      Top = 32
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 руб'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 4
    end
    object KLN_NAME: TEdit
      Left = 124
      Top = 104
      Width = 435
      Height = 21
      Enabled = False
      TabOrder = 5
      Text = 'KLN_NAME'
    end
    object NDS: TRxCalcEdit
      Left = 436
      Top = 78
      Width = 50
      Height = 21
      AutoSize = False
      DisplayFormat = '#0.00%'
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 6
    end
    object NP: TRxCalcEdit
      Left = 532
      Top = 78
      Width = 50
      Height = 21
      AutoSize = False
      DisplayFormat = '#0.00%'
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 7
    end
    object SKL: TRxDBLookupCombo
      Left = 124
      Top = 80
      Width = 143
      Height = 20
      DropDownCount = 12
      EscapeClear = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LookupField = 'SKL_ID'
      LookupDisplay = 'SKL_SHORT'
      LookupSource = DSSkl
      ParentFont = False
      TabOrder = 8
      OnChange = SKLChange
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
      TabOrder = 9
      OnChange = FRMChange
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 588
    Width = 1058
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
    Width = 1058
    Height = 403
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
        FieldName = 'RNS_TABEL'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Таб.№'
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHOP_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Продажа была в..'
        Width = 109
        Visible = True
      end
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
        FieldName = 'RNS_MONEY'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Цена'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNS_KOL'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Продано'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNS_OST'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Для возврата'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNS_SUMM'
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
        Name = 'RNS_ID'
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
        Name = 'RNS_MONEY'
        DataType = ftFloat
      end
      item
        Name = 'RNS_KOL'
        DataType = ftFloat
      end
      item
        Name = 'RNS_OST'
        DataType = ftFloat
      end
      item
        Name = 'WOZW_KOL'
        DataType = ftFloat
      end
      item
        Name = 'SHOP_ID'
        DataType = ftInteger
      end
      item
        Name = 'SHOP_NAME'
        DataType = ftString
        Size = 64
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
        Name = 'TW_SALER_ID'
        DataType = ftInteger
      end>
    BeforePost = MemWozwBeforePost
    AfterDelete = MemWozwAfterDelete
    AfterScroll = MemWozwAfterScroll
    OnCalcFields = MemWozwCalcFields
    Left = 168
    Top = 216
    object MemWozwTW_ID: TIntegerField
      FieldName = 'TW_ID'
    end
    object MemWozwRNS_ID: TIntegerField
      FieldName = 'RNS_ID'
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
    object MemWozwRNS_MONEY: TFloatField
      FieldName = 'RNS_MONEY'
      DisplayFormat = '#0.00'
    end
    object MemWozwRNS_KOL: TFloatField
      FieldName = 'RNS_KOL'
      DisplayFormat = '#0.0000'
    end
    object MemWozwRNS_OST: TFloatField
      FieldName = 'RNS_OST'
      DisplayFormat = '#0.0000'
    end
    object MemWozwRNS_SUMM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RNS_SUMM'
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
    object MemWozwSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
    end
    object MemWozwSHOP_NAME: TStringField
      FieldName = 'SHOP_NAME'
      Size = 64
    end
    object MemWozwRNS_TABEL: TIntegerField
      FieldName = 'RNS_TABEL'
    end
    object MemWozwTW_SHORT_NAM: TStringField
      FieldName = 'TW_SHORT_NAM'
      Size = 35
    end
    object MemWozwTW_SALER_ID: TIntegerField
      FieldName = 'TW_SALER_ID'
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
    object ActKKM: TAction
      Caption = 'Печать чека возврата...'
      Hint = 'Печать чека возврата...'
      ImageIndex = 45
      ShortCut = 118
      OnExecute = ActKKMExecute
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
    object N16: TMenuItem
      Caption = 'Печать чека возврата...'
      Hint = 'Печать чека возврата...'
      ShortCut = 118
      OnClick = ActKKMExecute
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
  object QueryWork2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 110
    Top = 282
  end
  object IBSkl: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 10
    CachedUpdates = False
    SQL.Strings = (
      'select * from dic_shop_skl(:shop_id, 2)'
      'where cfg_value > 0')
    Left = 320
    Top = 333
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
    Left = 320
    Top = 385
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 376
    Top = 376
  end
end
