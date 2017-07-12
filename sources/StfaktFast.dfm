object Stfakt_FAST: TStfakt_FAST
  Left = 273
  Top = 320
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Оформление счетов-фактур'
  ClientHeight = 362
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 651
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnDel: TToolButton
      Left = 0
      Top = 2
      Hint = 'Удалить накладую из списка'
      Caption = 'BtnDel'
      ImageIndex = 2
      OnClick = BtnDelClick
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object BtnPrint: TToolButton
      Left = 33
      Top = 2
      Hint = 'Печать счета-фактуры'
      Caption = 'BtnPrint'
      ImageIndex = 9
      OnClick = BtnPrintClick
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 159
    Width = 651
    Height = 184
    Align = alClient
    DataSource = DsStfakt
    Options = [dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RN_FULL'
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMM'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STFAKT'
        Width = 140
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 343
    Width = 651
    Height = 19
    Panels = <
      item
        Text = ' Сумма :'
        Width = 50
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 651
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 5
      Top = 10
      Width = 100
      Height = 16
      Caption = 'Доверенность :'
    end
    object STFAKT_DOW: TEdit
      Left = 108
      Top = 5
      Width = 538
      Height = 21
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 61
    Width = 651
    Height = 98
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object GroupBox1: TGroupBox
      Left = 2
      Top = 1
      Width = 644
      Height = 85
      Caption = ' Грузополучатель '
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 608
        Top = 52
        Width = 28
        Height = 27
        Enabled = False
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
        OnClick = SpeedButton1Click
      end
      object GP1: TRadioButton
        Left = 12
        Top = 25
        Width = 78
        Height = 21
        Caption = 'Он же'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = GP1Click
      end
      object GP2: TRadioButton
        Left = 12
        Top = 54
        Width = 88
        Height = 21
        Caption = 'Другой :'
        TabOrder = 1
        OnClick = GP1Click
      end
      object STFAKT_GP: TEdit
        Left = 91
        Top = 52
        Width = 516
        Height = 21
        Enabled = False
        TabOrder = 2
      end
    end
  end
  object MemStFakt: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'RN_ID'
        DataType = ftInteger
      end
      item
        Name = 'RN_FULL'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'SUMM'
        DataType = ftFloat
      end
      item
        Name = 'STFAKT'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'RN_DATE'
        DataType = ftDate
      end>
    AfterPost = MemStFaktAfterDelete
    AfterDelete = MemStFaktAfterDelete
    Left = 110
    Top = 174
    object MemStFaktRN_ID: TIntegerField
      FieldName = 'RN_ID'
    end
    object MemStFaktRN_FULL: TStringField
      FieldName = 'RN_FULL'
      Size = 254
    end
    object MemStFaktSUMM: TFloatField
      FieldName = 'SUMM'
      DisplayFormat = ',#0.00 руб'
    end
    object MemStFaktSTFAKT: TStringField
      FieldName = 'STFAKT'
      Size = 80
    end
    object MemStFaktRN_DATE: TDateField
      FieldName = 'RN_DATE'
    end
  end
  object DsStfakt: TDataSource
    DataSet = MemStFakt
    Left = 184
    Top = 174
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 258
    Top = 176
    object MnDel: TMenuItem
      Caption = 'Удалить накладную из списка'
      ImageIndex = 2
      ShortCut = 46
      OnClick = BtnDelClick
    end
    object MnPrint: TMenuItem
      Caption = 'Напечатать счет-фактуру'
      ImageIndex = 9
      ShortCut = 120
      OnClick = BtnPrintClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = 'Скрыть'
      ShortCut = 27
      OnClick = N1Click
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 372
    Top = 169
  end
  object QueryWork1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 374
    Top = 217
  end
end
