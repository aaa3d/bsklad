object FrmImpMsExcel: TFrmImpMsExcel
  Left = 203
  Top = 122
  Width = 567
  Height = 144
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlTop: TPanel
    Left = 0
    Top = 0
    Width = 559
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object ButOpen: TSpeedButton
      Left = 4
      Top = 4
      Width = 101
      Height = 25
      AllowAllUp = True
      Caption = 'Open Ms Excel File'
      Flat = True
      OnClick = ButOpenClick
    end
    object LblFileName: TLabel
      Left = 110
      Top = 9
      Width = 14
      Height = 16
      Caption = '__'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Pnl: TPanel
    Left = 0
    Top = 33
    Width = 559
    Height = 65
    Align = alClient
    BevelOuter = bvLowered
    Enabled = False
    TabOrder = 1
    object ButImport: TSpeedButton
      Left = 408
      Top = 22
      Width = 65
      Height = 22
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Import'
      Flat = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBackground
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = ButImportClick
    end
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 54
      Height = 13
      Caption = 'Left up'
    end
    object Label2: TLabel
      Left = 8
      Top = 37
      Width = 56
      Height = 13
      Caption = 'Right down'
    end
    object Label3: TLabel
      Left = 200
      Top = 13
      Width = 126
      Height = 13
      Caption = 'Coeff. exp. (comp.)'
    end
    object edRowTop: TCurrencyEdit
      Left = 144
      Top = 8
      Width = 49
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      MaxValue = 256
      MinValue = 1
      TabOrder = 0
      Value = 1
    end
    object edColTop: TEdit
      Left = 80
      Top = 8
      Width = 57
      Height = 21
      TabOrder = 1
      Text = 'a'
    end
    object edColBottom: TEdit
      Left = 80
      Top = 32
      Width = 57
      Height = 21
      TabOrder = 2
      Text = 'a'
    end
    object edRowBottom: TCurrencyEdit
      Left = 144
      Top = 32
      Width = 49
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      MaxValue = 256
      MinValue = 1
      TabOrder = 3
      Value = 1
    end
    object edKoef: TCurrencyEdit
      Left = 336
      Top = 8
      Width = 49
      Height = 21
      AutoSize = False
      DisplayFormat = '0.00'
      MaxValue = 256
      MinValue = 1
      TabOrder = 4
      Value = 1.3
    end
    object cbEmpty: TCheckBox
      Left = 200
      Top = 32
      Width = 185
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Make clean cells'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
  end
  object StBar: TStatusBar
    Left = 0
    Top = 98
    Width = 559
    Height = 19
    Panels = <
      item
        Width = 140
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object OpenDialog: TOpenDialog
    Filter = '*.xls|*.xls|*.*|*.*'
    Left = 304
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 136
  end
end
