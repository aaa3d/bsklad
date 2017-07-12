object Dic_Klient: TDic_Klient
  Left = 375
  Top = 289
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Список контактов (Адресная книга)'
  ClientHeight = 409
  ClientWidth = 732
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 732
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
      ImageIndex = 17
      Style = tbsSeparator
    end
    object BtnNew: TToolButton
      Left = 33
      Top = 2
      Hint = 'Новый контакт...'
      Caption = 'BtnNew'
      ImageIndex = 0
      OnClick = BtnNewClick
    end
    object BtnCopy: TToolButton
      Left = 58
      Top = 2
      Hint = 'Копировать'
      Caption = 'BtnCopy'
      ImageIndex = 4
      OnClick = BtnCopyClick
    end
    object BtnOpen: TToolButton
      Left = 83
      Top = 2
      Hint = 'Изменить'
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object BtnDel: TToolButton
      Left = 108
      Top = 2
      Hint = 'Удалить (Del)'
      Caption = 'BtnDel'
      ImageIndex = 2
      OnClick = BtnDelClick
    end
    object BtnNewGroup: TToolButton
      Left = 133
      Top = 2
      Hint = 'Создать новую группу'
      Caption = 'BtnNewGroup'
      ImageIndex = 5
      OnClick = BtnNewGroupClick
    end
    object BtnMove: TToolButton
      Left = 158
      Top = 2
      Hint = 'Переместить в группу'
      Caption = 'BtnMove'
      ImageIndex = 8
      OnClick = BtnMoveClick
    end
    object ToolButton4: TToolButton
      Left = 183
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object BtnUp: TToolButton
      Left = 191
      Top = 2
      Hint = 'На один уровень вверх'
      Caption = 'BtnUp'
      ImageIndex = 15
      OnClick = BtnUpClick
    end
    object ToolButton6: TToolButton
      Left = 216
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object BtnFind: TToolButton
      Left = 224
      Top = 2
      Hint = 'Найти по наименованию...'
      Caption = 'BtnFind'
      ImageIndex = 7
      OnClick = BtnFindClick
    end
    object ToolButton8: TToolButton
      Left = 249
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object BtnPrint: TToolButton
      Left = 257
      Top = 2
      Hint = 'Напечатать карточку (F9)'
      Caption = 'BtnPrint'
      ImageIndex = 9
      OnClick = BtnPrintClick
    end
    object BtnHistory: TToolButton
      Left = 282
      Top = 2
      Hint = '"История" изменений (F12)'
      Caption = 'BtnHistory'
      ImageIndex = 3
      OnClick = BtnHistoryClick
    end
    object BtnDetal: TToolButton
      Left = 307
      Top = 2
      Hint = 'Подробно о контакте...(F2)'
      Caption = 'BtnDetal'
      ImageIndex = 11
      OnClick = BtnDetalClick
    end
    object ToolButton14: TToolButton
      Left = 332
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object BtnSelect: TToolButton
      Left = 340
      Top = 2
      Caption = 'BtnSelect'
      ImageIndex = 16
      Visible = False
      OnClick = BtnSelectClick
    end
    object ToolButton5: TToolButton
      Left = 365
      Top = 2
      Width = 44
      Caption = 'ToolButton5'
      ImageIndex = 49
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 409
      Top = 2
      Caption = 'Бэйджик'
      ImageIndex = 48
      OnClick = ToolButton3Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 390
    Width = 732
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 732
    Height = 361
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object TreeView1: TTreeView
      Left = 0
      Top = 0
      Width = 153
      Height = 361
      Align = alLeft
      DragCursor = crMultiDrag
      Images = DataModule1.ImageList1
      Indent = 21
      TabOrder = 0
      OnChange = TreeView1Change
      OnEnter = TreeView1Enter
      OnExit = TreeView1Exit
    end
    object RxSplitter1: TRxSplitter
      Left = 153
      Top = 0
      Width = 3
      Height = 361
      ControlFirst = TreeView1
      Align = alLeft
      BevelOuter = bvLowered
    end
    object Panel2: TPanel
      Left = 156
      Top = 0
      Width = 576
      Height = 361
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Panel3: TPanel
        Left = 0
        Top = 289
        Width = 576
        Height = 72
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 0
      end
      object RxDBGrid1: TRxDBGrid
        Left = 0
        Top = 0
        Width = 576
        Height = 289
        Align = alClient
        DataSource = DsQrDicKLN
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawDataCell = RxDBGrid1DrawDataCell
        OnDrawColumnCell = RxDBGrid1DrawColumnCell
        OnDblClick = RxDBGrid1DblClick
        OnEnter = RxDBGrid1Enter
        OnExit = RxDBGrid1Exit
        OnKeyPress = RxDBGrid1KeyPress
        OnGetCellParams = RxDBGrid1GetCellParams
        Columns = <
          item
            Expanded = False
            FieldName = 'ISMAN'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Width = 24
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'KLN_TABEL'
            Title.Alignment = taCenter
            Title.Caption = 'Таб'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KLN_FULL'
            Title.Alignment = taCenter
            Title.Caption = 'Имя'
            Width = 341
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KLN_TEL'
            Title.Alignment = taCenter
            Title.Caption = 'Телефон'
            Width = 111
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KLN_BNK'
            Title.Alignment = taCenter
            Title.Caption = 'Банк'
            Width = 228
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KLN_ID'
            Title.Alignment = taCenter
            Title.Caption = 'Код'
            Visible = True
          end>
      end
    end
  end
  object IbQrKlntree: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = KLNTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from KLNTREE '
      '')
    Left = 32
    Top = 93
    object IbQrKlntreeKLNTREE_ID: TIntegerField
      FieldName = 'KLNTREE_ID'
      Required = True
    end
    object IbQrKlntreeKLNTREE_FULL: TIBStringField
      FieldName = 'KLNTREE_FULL'
      Required = True
      Size = 254
    end
    object IbQrKlntreePARENT_ID: TIntegerField
      FieldName = 'PARENT_ID'
      Required = True
    end
  end
  object IbTrKLNTREE: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 32
    Top = 145
  end
  object IbQrDicKLN: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = KLNTransaction
    AfterClose = IbQrDicKLNAfterClose
    AfterOpen = IbQrDicKLNAfterOpen
    AfterScroll = IbQrDicKLNAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from dickln(:klntree_id) order by tree desc,kln_full')
    Left = 242
    Top = 85
    ParamData = <
      item
        DataType = ftInteger
        Name = 'klntree_id'
        ParamType = ptInput
      end>
    object IbQrDicKLNKLN_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_ID'
      ReadOnly = True
    end
    object IbQrDicKLNKLN_FULL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_FULL'
      ReadOnly = True
      Size = 254
    end
    object IbQrDicKLNKLN_TEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_TEL'
      ReadOnly = True
      Size = 254
    end
    object IbQrDicKLNKLN_BNK: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'KLN_BNK'
      ReadOnly = True
      Size = 254
    end
    object IbQrDicKLNTREE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'TREE'
      ReadOnly = True
      Size = 1
    end
    object IbQrDicKLNISMAN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'ISMAN'
      ReadOnly = True
    end
    object IbQrDicKLNKLN_TABEL: TIBStringField
      FieldName = 'KLN_TABEL'
      Origin = 'DICKLN.KLN_TABEL'
      Size = 12
    end
    object IbQrDicKLNUS_FIO: TIBStringField
      FieldName = 'US_FIO'
      Origin = 'DICKLN.US_FIO'
      Size = 254
    end
  end
  object DsQrDicKLN: TDataSource
    DataSet = IbQrDicKLN
    Left = 240
    Top = 137
  end
  object KLNTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 376
    Top = 85
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = KLNTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 372
    Top = 153
  end
  object PopupMenu1: TPopupMenu
    Left = 460
    Top = 85
    object MnNew: TMenuItem
      Caption = 'Новый контакт'
      ShortCut = 45
      OnClick = BtnNewClick
    end
    object MnCopy: TMenuItem
      Caption = 'Создать копию выбранного контакта'
      ShortCut = 16451
      OnClick = BtnCopyClick
    end
    object MnOpen: TMenuItem
      Caption = 'Открыть карточку контакта для редактирования '
      OnClick = BtnOpenClick
    end
    object MnDel: TMenuItem
      Caption = 'Удалить контакт'
      ShortCut = 46
      OnClick = BtnDelClick
    end
    object MnInsGroup: TMenuItem
      Caption = 'Создать группу контактов (Insert)'
      OnClick = BtnNewGroupClick
    end
    object MnMove: TMenuItem
      Caption = 'Переместить контакт или группу в группу'
      OnClick = BtnMoveClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object MnUp: TMenuItem
      Caption = 'На один уровень вверх'
      OnClick = BtnUpClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object MnFind: TMenuItem
      Caption = 'Найти контакт по наименованию'
      OnClick = BtnFindClick
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать карточку контакта'
      ShortCut = 120
      OnClick = BtnPrintClick
    end
    object MnHistory: TMenuItem
      Caption = '"История" контакта'
      ShortCut = 123
      OnClick = BtnHistoryClick
    end
    object MnDetal: TMenuItem
      Caption = 'Подробно о контакте'
      ShortCut = 113
      OnClick = BtnDetalClick
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object MnSelect: TMenuItem
      Caption = 'Выбрать контакт или группу'
      OnClick = BtnSelectClick
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 584
    Top = 89
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 584
    Top = 149
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    OnBeginDoc = frReport1BeginDoc
    Left = 284
    Top = 213
    ReportForm = {
      18000000A602000018000000001D004D6963726F736F66742058505320446F63
      756D656E742057726974657200FFFFFFFFFF09000000340800009A0B00000000
      000000000000000000000000000000FFFF00000000FFFF000000000000000000
      000000030400466F726D000F000080DC000000780000007C0100002C01000004
      0000000200E70000000C005265706F72745469746C6531000201000000006400
      0000F5020000100100003000000001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C800000014000000010000000000000A1000546672526F756E64526563745669
      65770000980100000A00526F756E645265637431000200240000009C00000044
      010000B400000043000F0002000000000000000000FFFFFF002C020000000000
      020000000D0A005B555345525F46494F5D00000000FFFF000000000004000000
      0A000000000500417269616C001200000000000000000002000000CC00020000
      000000FFFFFF000000000200000000000000FFFFFF0006000000010114000000
      0A0E00546672426172436F64655669657700001A020000040042617231000200
      78000000080100008E000000360000000100000001000000FFFFFF000000FFFF
      FF1F2C020000000000010009005B555345525F49445D00000000FFFF00000000
      0002000000010000000001010003010000000000000000000040000000000000
      000004006902000005004C696E65310002002C000000000100002C0100000000
      00000100080001000000000000000000FFFFFF002C0200000000000000000000
      00FFFF0000000000020000000100000000FEFEFF030000000A00204361746567
      6F727931000000000800555345525F46494F0002002727000700555345525F49
      4400010030000000000000000000}
  end
  object frRoundRectObject1: TfrRoundRectObject
    Left = 468
    Top = 205
  end
end
