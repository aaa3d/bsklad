object DIC_TOWAR: TDIC_TOWAR
  Left = 388
  Top = 182
  Width = 931
  Height = 715
  Caption = 'Справочник товаров'
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
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 923
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnNew: TToolButton
      Left = 0
      Top = 2
      Hint = 'Новый товар (INS)'
      Caption = 'BtnNew'
      ImageIndex = 0
      OnClick = BtnNewClick
    end
    object BtnCopy: TToolButton
      Left = 25
      Top = 2
      Hint = 'Копировать товар'
      Caption = 'BtnCopy'
      ImageIndex = 4
      OnClick = BtnCopyClick
    end
    object BtnOpen: TToolButton
      Left = 50
      Top = 2
      Hint = 'Править товар'
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object BtnDel: TToolButton
      Left = 75
      Top = 2
      Hint = 'Удалить товар или группу (DEL)'
      Caption = 'BtnDel'
      ImageIndex = 2
      OnClick = BtnDelClick
    end
    object ToolButton10: TToolButton
      Left = 100
      Top = 2
      Width = 5
      Caption = 'ToolButton10'
      ImageIndex = 27
      Style = tbsSeparator
    end
    object BtnNewGroup: TToolButton
      Left = 105
      Top = 2
      Hint = 'Создать группу товарв (INS)'
      Caption = 'BtnNewGroup'
      ImageIndex = 5
      OnClick = BtnNewGroupClick
    end
    object ToolButton6: TToolButton
      Left = 130
      Top = 2
      Hint = 'Новый комплект товаров'
      Caption = 'ToolButton6'
      ImageIndex = 131
      OnClick = ToolButton6Click
    end
    object BtnMove: TToolButton
      Left = 155
      Top = 2
      Hint = 'Переместить товар или группу...'
      Caption = 'BtnMove'
      ImageIndex = 8
      OnClick = BtnMoveClick
    end
    object ToolButton7: TToolButton
      Left = 180
      Top = 2
      Width = 3
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object BtnUP: TToolButton
      Left = 183
      Top = 2
      Hint = 'На один уровень вверх...'
      Caption = 'BtnUP'
      ImageIndex = 15
      OnClick = BtnUPClick
    end
    object ToolButton21: TToolButton
      Left = 208
      Top = 2
      Width = 3
      Caption = 'ToolButton21'
      ImageIndex = 15
      Style = tbsSeparator
    end
    object Btn_Find123: TToolButton
      Left = 211
      Top = 2
      Hint = 'Искать товар по артикулу (1,2,3...)'
      Caption = 'Btn_Find123'
      ImageIndex = 6
      OnClick = Btn_Find123Click
    end
    object Btn_FindABC: TToolButton
      Left = 236
      Top = 2
      Hint = 'Искать товар по наименованию (А,Б,В...)'
      Caption = 'Btn_FindABC'
      ImageIndex = 7
      OnClick = Btn_FindABCClick
    end
    object ToolButton4: TToolButton
      Left = 261
      Top = 2
      Width = 4
      Caption = 'ToolButton4'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object Btn_PRINT: TToolButton
      Left = 265
      Top = 2
      Hint = 'Печать ценника (F9)'
      Caption = 'Btn_PRINT'
      ImageIndex = 40
      OnClick = Btn_PRINTClick
    end
    object BtnHistory: TToolButton
      Left = 290
      Top = 2
      Hint = 'История изменений...(F12)'
      Caption = 'BtnHistory'
      ImageIndex = 3
      OnClick = BtnHistoryClick
    end
    object ToolButton13: TToolButton
      Left = 315
      Top = 2
      Width = 4
      Caption = 'ToolButton13'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object Btn_DETAL: TToolButton
      Left = 319
      Top = 2
      Hint = 'Подробная информация о товаре (F2)'
      Caption = 'Btn_DETAL'
      ImageIndex = 11
      OnClick = Btn_DETALClick
    end
    object Btn_ANALIZ: TToolButton
      Left = 344
      Top = 2
      Hint = 'Анализ товара... (F3)'
      Caption = 'Btn_ANALIZ'
      ImageIndex = 12
      OnClick = Btn_ANALIZClick
    end
    object Btn_MARKETING: TToolButton
      Left = 369
      Top = 2
      Hint = 'Маркетинговые данные...(F4)'
      Caption = 'Btn_MARKETING'
      ImageIndex = 10
      OnClick = Btn_MARKETINGClick
    end
    object ToolButton17: TToolButton
      Left = 394
      Top = 2
      Width = 3
      Caption = 'ToolButton17'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object BtnMode: TToolButton
      Left = 397
      Top = 2
      Hint = 
        'Режим отображения каталога (~)'#13#10'Описания режима читайте в инстру' +
        'кции по эксплуатации'
      Caption = 'BtnMode'
      ImageIndex = 61
      OnClick = BtnModeClick
    end
    object ToolButton19: TToolButton
      Left = 422
      Top = 2
      Width = 3
      Caption = 'ToolButton19'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object BtnSelectBrak: TToolButton
      Left = 425
      Top = 2
      Hint = 'Выбор брака'
      Caption = 'BtnSelectBrak'
      ImageIndex = 17
      OnClick = BtnSelectBrakClick
    end
    object BtnSelect: TToolButton
      Left = 450
      Top = 2
      Hint = 'Выбор'
      Caption = 'BtnSelect'
      ImageIndex = 16
      OnClick = BtnSelectClick
    end
    object ToolButton3: TToolButton
      Left = 475
      Top = 2
      Width = 4
      Caption = 'ToolButton3'
      ImageIndex = 17
      Style = tbsSeparator
    end
    object BtnAdm: TToolButton
      Left = 479
      Top = 2
      Hint = 'Администрирование товара'
      Caption = 'BtnAdm'
      ImageIndex = 25
      OnClick = BtnAdmClick
    end
    object ToolButton5: TToolButton
      Left = 504
      Top = 2
      Width = 3
      Caption = 'ToolButton5'
      ImageIndex = 26
      Style = tbsSeparator
    end
    object Panel5: TPanel
      Left = 507
      Top = 2
      Width = 278
      Height = 24
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 4
        Top = 4
        Width = 77
        Height = 17
        Hint = 
          'Вывод остатков на указанном складе в отдельной колонке.'#13#10'При это' +
          'м скорость вывода каталога уменьшается!'
        Caption = 'Магазин :'
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 212
        Top = 4
        Width = 45
        Height = 17
        Hint = 
          'Автоматический вывод подробной информации'#13#10'об остатках товара на' +
          ' всех складах'#13#10'и другой дополнительной информации внизу экрана'
        Caption = 'Авто'
        TabOrder = 1
      end
      object SKL: TRxDBLookupCombo
        Left = 80
        Top = 2
        Width = 121
        Height = 21
        DropDownCount = 8
        Enabled = False
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DataModule1.MainDsSkl
        TabOrder = 2
        OnChange = SKLChange
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 669
    Width = 923
    Height = 19
    Panels = <
      item
        Width = 800
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
    Width = 923
    Height = 640
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object TreeView1: TTreeView
      Left = 0
      Top = 29
      Width = 153
      Height = 611
      Align = alLeft
      Images = DataModule1.ImageList1
      Indent = 21
      TabOrder = 0
      OnChange = TreeView1Change
      OnEnter = TreeView1Enter
      OnExit = TreeView1Enter
      Items.Data = {
        020000001F0000000000000000000000FFFFFFFFFFFFFFFF0000000001000000
        06D2EEE2E0F0FB200000000100000002000000FFFFFFFFFFFFFFFF0000000000
        00000007D0E0E7E4E5EB31280000000000000000000000FFFFFFFFFFFFFFFF00
        000000000000000FCEEFF2EEE2FBE920EAE0F2E0EBEEE3}
    end
    object RxSplitter1: TRxSplitter
      Left = 153
      Top = 29
      Width = 3
      Height = 611
      ControlFirst = TreeView1
      Align = alLeft
      BevelOuter = bvLowered
    end
    object Panel2: TPanel
      Left = 156
      Top = 29
      Width = 767
      Height = 611
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 475
        Width = 767
        Height = 136
        Align = alBottom
        DataSource = DsFastInfo
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = RxDBGrid1CellClick
        OnDrawColumnCell = RxDBGrid1DrawColumnCell
        OnGetCellParams = RxDBGrid1GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'VID'
            Title.Alignment = taCenter
            Title.Caption = 'Вид'
            Width = 83
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
            Width = 58
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
      object RxSplitter2: TRxSplitter
        Left = 0
        Top = 470
        Width = 767
        Height = 5
        ControlFirst = RxDBGrid1
        Align = alBottom
        BevelOuter = bvLowered
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 767
        Height = 470
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Panel4: TPanel
          Left = 0
          Top = 439
          Width = 767
          Height = 31
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 4
            Top = 8
            Width = 36
            Height = 13
            Caption = 'Всего :'
          end
          object Label2: TLabel
            Left = 156
            Top = 8
            Width = 50
            Height = 13
            Caption = 'Хороших :'
          end
          object Label3: TLabel
            Left = 324
            Top = 8
            Width = 42
            Height = 13
            Caption = 'Плохих :'
          end
          object OST1: TRxCalcEdit
            Left = 44
            Top = 4
            Width = 100
            Height = 21
            AutoSize = False
            DecimalPlaces = 4
            DisplayFormat = '#0.0000'
            Enabled = False
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 0
          end
          object OST2: TRxCalcEdit
            Left = 212
            Top = 4
            Width = 100
            Height = 21
            AutoSize = False
            DecimalPlaces = 4
            DisplayFormat = '#0.0000'
            Enabled = False
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 1
          end
          object OST3: TRxCalcEdit
            Left = 372
            Top = 4
            Width = 100
            Height = 21
            AutoSize = False
            DecimalPlaces = 4
            DisplayFormat = '#0.0000'
            Enabled = False
            ButtonWidth = 0
            NumGlyphs = 2
            TabOrder = 2
          end
        end
        object RxDBGrid2: TRxDBGrid
          Left = 0
          Top = 0
          Width = 767
          Height = 439
          Align = alClient
          DataSource = DsQrDicTowar
          DefaultDrawing = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawDataCell = RxDBGrid2DrawDataCell
          OnDrawColumnCell = RxDBGrid2DrawColumnCell
          OnDblClick = RxDBGrid2DblClick
          OnEnter = RxDBGrid2Enter
          OnExit = RxDBGrid2Enter
          OnKeyPress = RxDBGrid2KeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'MET_OPT'
              Title.Caption = 'Оптовый товар'
              Width = 14
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MET_INTERNET'
              Title.Caption = 'Интернет-описание'
              Width = 17
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MET_SERT'
              Title.Caption = 'Интернет-каталог'
              Width = 16
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MET_NO_SKID'
              Title.Caption = 'Без скидок'
              Width = 16
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MET_PRICE_PRINT'
              Title.Alignment = taCenter
              Title.Caption = 'Печать в прайс листе'
              Width = 16
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_ART'
              Title.Alignment = taCenter
              Title.Caption = 'Код'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Alignment = taCenter
              Title.Caption = 'Наименование товара'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OST1_SKLAD'
              Title.Alignment = taCenter
              Title.Caption = 'На складе '
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OST1_ALL'
              Title.Alignment = taCenter
              Title.Caption = 'Всего'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OST2_ALL'
              Title.Alignment = taCenter
              Title.Caption = 'В т.ч. брак'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ED_SHORT'
              Title.Alignment = taCenter
              Title.Caption = 'Ед.'
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TW_MROZ_NOW'
              Title.Alignment = taCenter
              Title.Caption = 'Розн.,руб.'
              Width = 97
              Visible = True
            end>
        end
      end
    end
    object ToolBar2: TToolBar
      Left = 0
      Top = 0
      Width = 923
      Height = 29
      ButtonHeight = 24
      ButtonWidth = 25
      Caption = 'ToolBar2'
      Color = clBtnFace
      Images = DataModule1.ImageList1
      ParentColor = False
      TabOrder = 3
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
        Width = 4
        Caption = 'ToolButton2'
        ImageIndex = 138
        Style = tbsSeparator
      end
      object BtnFormat1: TToolButton
        Left = 29
        Top = 2
        Hint = 'Скопировать свойства и скидки товара...'
        Caption = 'Скопировать свойства и скидки товара...'
        ImageIndex = 136
        OnClick = BtnFormat1Click
      end
      object BtnFormat2: TToolButton
        Left = 54
        Top = 2
        Hint = 'Применить свойства и скидки товара...'
        Caption = 'Применить свойства и скидки товара...'
        ImageIndex = 137
        OnClick = BtnFormat2Click
      end
      object ToolButton11: TToolButton
        Left = 79
        Top = 2
        Width = 4
        Caption = 'ToolButton11'
        ImageIndex = 138
        Style = tbsSeparator
      end
      object btnPrice: TToolButton
        Left = 83
        Top = 2
        Caption = 'btnPrice'
        ImageIndex = 26
        OnClick = btnPriceClick
      end
      object ToolButton8: TToolButton
        Left = 108
        Top = 2
        Caption = 'Ценник 2'
        ImageIndex = 41
        OnClick = ToolButton8Click
      end
      object Panel6: TPanel
        Left = 133
        Top = 2
        Width = 188
        Height = 24
        BevelOuter = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 4
          Top = 6
          Width = 93
          Height = 13
          Caption = 'Текущий формат :'
        end
        object Label5: TLabel
          Left = 100
          Top = 6
          Width = 32
          Height = 13
          Caption = 'Label5'
        end
      end
      object chkRozn: TCheckBox
        Left = 321
        Top = 2
        Width = 97
        Height = 24
        Caption = 'Розничные'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = chkRoznClick
      end
      object chkOpt: TCheckBox
        Left = 418
        Top = 2
        Width = 97
        Height = 24
        Caption = 'Оптовые'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = chkOptClick
      end
    end
  end
  object IbQrTwtree: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IbTrTWTREE
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from twtree')
    Left = 32
    Top = 93
    object IbQrTwtreeTWTREE_ID: TIntegerField
      FieldName = 'TWTREE_ID'
      Required = True
    end
    object IbQrTwtreeTWTREE_FULL: TIBStringField
      FieldName = 'TWTREE_FULL'
      Required = True
      Size = 254
    end
    object IbQrTwtreePARENT_ID: TIntegerField
      FieldName = 'PARENT_ID'
      Required = True
    end
    object IbQrTwtreeTWKAT_ID: TIntegerField
      FieldName = 'TWKAT_ID'
      Required = True
    end
  end
  object IbTrTWTREE: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 32
    Top = 145
  end
  object ImageList1: TImageList
    Left = 32
    Top = 197
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000084848400000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000084848400000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000084848400000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000084848400000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000084848400000000008484000000000000000000000000
      0000000000000000000084840000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000008484000000000000FFFFFF00FFFF
      FF00FFFFFF000000000084840000000000000000000000000000000000000000
      0000000000000000000084848400000000008484000000000000000000000000
      0000000000000000000084840000000000000000000000000000000000000000
      0000000000000000000084848400000000008484000000000000000000000000
      0000000000000000000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000084848400000000008484000000000000000000000000
      0000000000000000000084840000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000008484000000000000FFFFFF00FFFF
      FF00FFFFFF000000000084840000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000008484000000000000FFFFFF00FFFF
      FF00FFFFFF000000000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000084848400000000008484000000000000000000000000
      0000000000000000000084840000000000000000000000000000000000000000
      0000000000000000000084848400000000008484000000000000000000000000
      0000000000000000000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      00000000000000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000008484000084840000848400008484
      0000848400008484000084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFF000000000084840000848400008484000084840000848400008484
      0000848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000848400008484000084840000848400008484000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FC00FFFFFFFF0000
      F800FC00FC000000F000F800F8000000E000FC00FC000000C000F800F8000000
      8000FC007C000000C000F800380000008000FC001C000000C000F80008000000
      8000FC001C000000C000F800380000008003FC007C000000C003FFFFFFFF0000
      800FFFFFFFFF0000C00FFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object IbQrDicTowar: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IbTrTWTREE
    AfterOpen = IbQrDicTowarAfterOpen
    AfterScroll = IbQrDicTowarAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from dictowar2(:twtree_id,:skl_id,:mode,:set_ost,:shop_' +
        'id, :FRM_ID, :show_rozn, :show_opt)'
      'order by tree desc,name,tw_art')
    Left = 240
    Top = 85
    ParamData = <
      item
        DataType = ftInteger
        Name = 'twtree_id'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'skl_id'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'mode'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'set_ost'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'shop_id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FRM_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'show_rozn'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'show_opt'
        ParamType = ptUnknown
      end>
    object IbQrDicTowarID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'ID'
      ReadOnly = True
    end
    object IbQrDicTowarTREE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TREE'
      ReadOnly = True
      Size = 1
    end
    object IbQrDicTowarTW_ART: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TW_ART'
      ReadOnly = True
    end
    object IbQrDicTowarNAME: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'NAME'
      ReadOnly = True
      Size = 254
    end
    object IbQrDicTowarED_SHORT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'ED_SHORT'
      ReadOnly = True
      Size = 32
    end
    object IbQrDicTowarTW_MROZ_NOW: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TW_MROZ_NOW'
      ReadOnly = True
      DisplayFormat = '#,0.00 руб'
    end
    object IbQrDicTowarOST1_SKLAD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST1_SKLAD'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object IbQrDicTowarOST2_SKLAD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST2_SKLAD'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object IbQrDicTowarOST1_ALL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST1_ALL'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object IbQrDicTowarOST2_ALL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'OST2_ALL'
      ReadOnly = True
      DisplayFormat = '#0.0000'
    end
    object IbQrDicTowarMET_NO_SKID: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MET_NO_SKID'
      ReadOnly = True
      Size = 1
    end
    object IbQrDicTowarMET_SERT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MET_SERT'
      ReadOnly = True
      Size = 1
    end
    object IbQrDicTowarMET_PRICE_PRINT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'MET_PRICE_PRINT'
      ReadOnly = True
      Size = 1
    end
    object IbQrDicTowarTWKTG_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'TWKTG_COLOR'
      ReadOnly = True
    end
    object IbQrDicTowarTW_KOMPL: TIBStringField
      FieldName = 'TW_KOMPL'
      Size = 1
    end
    object IbQrDicTowarMET_MONEY_SHOP: TIBStringField
      FieldName = 'MET_MONEY_SHOP'
      Origin = 'DICTOWAR2.MET_MONEY_SHOP'
      FixedChar = True
      Size = 1
    end
    object IbQrDicTowarVIRTUAL: TIntegerField
      FieldName = 'VIRTUAL'
      Origin = 'DICTOWAR2.VIRTUAL'
    end
    object IbQrDicTowarMET_INTERNET: TIntegerField
      FieldName = 'MET_INTERNET'
      Origin = 'DICTOWAR2.MET_INTERNET'
    end
    object IbQrDicTowarMET_OPT: TIntegerField
      FieldName = 'MET_OPT'
      Origin = 'DICTOWAR2.MET_OPT'
    end
  end
  object DsQrDicTowar: TDataSource
    DataSet = IbQrDicTowar
    Left = 240
    Top = 137
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IbTrTWTREE
    BufferChunks = 1000
    CachedUpdates = False
    Left = 324
    Top = 85
  end
  object FastInfoTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 632
    Top = 45
  end
  object QrFastInfo: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FastInfoTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from fast_info(:tw_id,1)')
    Left = 632
    Top = 101
    ParamData = <
      item
        DataType = ftInteger
        Name = 'tw_id'
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
  object DsFastInfo: TDataSource
    DataSet = QrFastInfo
    Left = 632
    Top = 157
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 552
    Top = 97
  end
  object IBQuery2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = FastInfoTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 508
    Top = 153
  end
  object PopupMenu1: TPopupMenu
    Left = 124
    Top = 152
    object MnNew: TMenuItem
      Caption = 'Создать новый товар '
      ShortCut = 45
      OnClick = BtnNewClick
    end
    object MnCopy: TMenuItem
      Caption = 'Создать копию товара'
      ShortCut = 16451
      OnClick = BtnCopyClick
    end
    object MnOpen: TMenuItem
      Caption = 'Править товар или группу'
      OnClick = BtnOpenClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить товар или группу'
      ShortCut = 46
      OnClick = BtnDelClick
    end
    object MnNewGroup: TMenuItem
      Caption = 'Создать группу товаров'
      OnClick = BtnNewGroupClick
    end
    object MnMove: TMenuItem
      Caption = 'Переместить товар или группу в другую группу'
      OnClick = BtnMoveClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MnUp: TMenuItem
      Caption = 'На один уровень вверх'
      OnClick = BtnUPClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object MnFind123: TMenuItem
      Caption = 'Найти товар по коду (0..9)'
      OnClick = Btn_Find123Click
    end
    object MnFindABC: TMenuItem
      Caption = 'Найти товар по наименованию (А..Я)'
      OnClick = Btn_FindABCClick
    end
    object N6: TMenuItem
      Caption = 'Найти в оптовом каталоге'
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать ценник на товар'
      ShortCut = 120
      OnClick = Btn_PRINTClick
    end
    object MnHistory: TMenuItem
      Caption = '"История" товара'
      ShortCut = 123
      OnClick = BtnHistoryClick
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object MnDetal: TMenuItem
      Caption = 'Подробно о товаре'
      ShortCut = 113
      OnClick = Btn_DETALClick
    end
    object MnAnaliz: TMenuItem
      Caption = 'Анализ товара'
      ShortCut = 114
      OnClick = Btn_ANALIZClick
    end
    object MnMarket: TMenuItem
      Caption = 'Маркетинговые данные товара'
      ShortCut = 115
      OnClick = Btn_MARKETINGClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = 'Реджим отображения каталога (`)'
    end
    object N5: TMenuItem
      Caption = 'Данные в интернет'
      OnClick = N5Click
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 340
    Top = 293
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 424
    Top = 293
  end
  object DsShopFastInfo: TDataSource
    Left = 716
    Top = 162
  end
  object DISABLE_HINT_TIMER: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = DISABLE_HINT_TIMERTimer
    Left = 384
    Top = 181
  end
end
