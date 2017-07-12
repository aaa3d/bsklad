object Form1: TForm1
  Left = 181
  Top = 187
  Width = 598
  Height = 382
  Caption = 'Эмулятор ККМ Элвес Мини-ФР'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 316
    Width = 590
    Height = 39
    Align = alBottom
    TabOrder = 0
    object StatusBar1: TStatusBar
      Left = 1
      Top = 19
      Width = 588
      Height = 19
      Panels = <
        item
          Width = 50
        end>
      SimplePanel = False
      SizeGrip = False
    end
    object StatusBar2: TStatusBar
      Left = 1
      Top = 0
      Width = 588
      Height = 19
      Panels = <
        item
          Width = 50
        end>
      SimplePanel = False
      SizeGrip = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 590
    Height = 316
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 405
      Top = 0
      Width = 185
      Height = 316
      Align = alRight
      BevelOuter = bvNone
      BiDiMode = bdRightToLeftNoAlign
      ParentBiDiMode = False
      TabOrder = 0
      object Button1: TButton
        Left = 4
        Top = 4
        Width = 177
        Height = 25
        Action = FastAddSumm
        TabOrder = 0
      end
      object Button2: TButton
        Left = 4
        Top = 30
        Width = 177
        Height = 25
        Action = FastDecSumm
        TabOrder = 1
      end
      object Button3: TButton
        Left = 4
        Top = 56
        Width = 177
        Height = 25
        Caption = 'Почасовой отчет'
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 4
        Top = 82
        Width = 177
        Height = 25
        Caption = 'Отчет по кассирам'
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 4
        Top = 108
        Width = 177
        Height = 25
        Caption = 'Отчет по секциям'
        TabOrder = 4
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 4
        Top = 134
        Width = 177
        Height = 25
        Caption = 'Суточный X-отчет'
        TabOrder = 5
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 4
        Top = 160
        Width = 177
        Height = 25
        Caption = 'Гашение контрольной ленты'
        TabOrder = 6
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 4
        Top = 186
        Width = 177
        Height = 25
        Caption = 'Z-отчет с гашением'
        TabOrder = 7
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 4
        Top = 288
        Width = 177
        Height = 25
        Caption = 'Тестовая печать'
        TabOrder = 8
        OnClick = Button9Click
      end
      object BitBtn1: TBitBtn
        Left = 4
        Top = 260
        Width = 177
        Height = 25
        Action = FastChangeKassir
        Caption = 'F10. Смена кассира'
        TabOrder = 9
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000120B0000120B00001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
          DADAADADADADADA0000DDADADADADAD03800ADADADADA00380B0DADADAD000B8
          0BB0AD0000033380BB0DD0333B03B80BB0DA033BBBBB80BB0DAD03BB3BB80BB0
          DADA03BBB3BB3B0DADAD7770BB3BB30ADADA0B080BB3BB0DADAD03B070BBBB0A
          DADAA03B07BBB30DADADDA03B7BB30DADADAADA007000DADADAD}
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 405
      Height = 316
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LABEL_MONEY: TLabel
        Left = 138
        Top = 40
        Width = 54
        Height = 24
        Caption = 'Цена :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LABEL_KOLVO: TLabel
        Left = 118
        Top = 72
        Width = 71
        Height = 24
        Caption = 'Кол-во :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LABEL_SEK: TLabel
        Left = 114
        Top = 104
        Width = 75
        Height = 24
        Caption = 'Секция :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LABEL_NAL: TLabel
        Left = 92
        Top = 184
        Width = 99
        Height = 24
        Caption = 'Наличные :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LAbel_check: TLabel
        Left = 98
        Top = 148
        Width = 237
        Height = 24
        Caption = 'Идет формирование чека!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object LABEL_NAME: TLabel
        Left = 2
        Top = 6
        Width = 15
        Height = 21
        Caption = 'Ш'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Wingdings'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 8
        Top = 224
        Width = 375
        Height = 48
        Caption = 
          'F2 - печать чек,    Ctrl+Enter - Зыкрыть чек'#13#10'F4 - возврат товар' +
          'а'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object NAME: TEdit
        Left = 20
        Top = 2
        Width = 383
        Height = 32
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = NAMEKeyPress
      end
      object MONEY: TRxCalcEdit
        Left = 196
        Top = 36
        Width = 207
        Height = 31
        AutoSize = False
        DisplayFormat = ',0.00 руб##'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        OnKeyPress = MONEYKeyPress
      end
      object KOLVO: TRxCalcEdit
        Left = 196
        Top = 68
        Width = 207
        Height = 31
        AutoSize = False
        DisplayFormat = ',0.000##'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
        Value = 1
        OnKeyPress = KOLVOKeyPress
      end
      object SEK: TRxSpinEdit
        Left = 196
        Top = 100
        Width = 207
        Height = 32
        Alignment = taRightJustify
        Value = 1
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnKeyPress = SEKKeyPress
      end
      object NAL: TRxCalcEdit
        Left = 196
        Top = 182
        Width = 207
        Height = 31
        AutoSize = False
        DisplayFormat = ',0.00 руб##'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 4
        OnKeyPress = NALKeyPress
      end
      object Button10: TButton
        Left = 2
        Top = 280
        Width = 227
        Height = 33
        Action = FastCancelCheck
        Caption = 'F3. Аннулировать чек'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
  end
  object ActionList1: TActionList
    Left = 434
    Top = 220
    object FastAddSumm: TAction
      Caption = 'F7. Внесение суммы'
      ShortCut = 118
      OnExecute = FastAddSummExecute
    end
    object FastDecSumm: TAction
      Caption = 'F8. Снятие выручки'
      ShortCut = 119
      OnExecute = FastDecSummExecute
    end
    object FastChangeKassir: TAction
      Caption = 'F10. Смена кассира'
      ShortCut = 121
      OnExecute = FastChangeKassirExecute
    end
    object FastCancelCheck: TAction
      Caption = 'F2. Аннулировать чек'
      ShortCut = 114
      OnExecute = FastCancelCheckExecute
    end
    object FastRegCheck: TAction
      Caption = 'Печать чека'
      ShortCut = 113
      OnExecute = FastRegCheckExecute
    end
    object FastCloseCheck: TAction
      Caption = 'Закрыть чек'
      ShortCut = 16397
      OnExecute = FastCloseCheckExecute
    end
    object FastWozwCheck: TAction
      Caption = 'Возврат товара'
      ShortCut = 115
      OnExecute = FastWozwCheckExecute
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 22
    Top = 148
  end
  object Timer_name: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer_nameTimer
    Left = 92
    Top = 4
  end
  object Timer_money: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer_moneyTimer
    Left = 216
    Top = 36
  end
  object Timer_kolvo: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer_kolvoTimer
    Left = 262
    Top = 70
  end
  object Timer_sek: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer_sekTimer
    Left = 206
    Top = 102
  end
  object Timer_nal: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer_nalTimer
    Left = 220
    Top = 200
  end
end
