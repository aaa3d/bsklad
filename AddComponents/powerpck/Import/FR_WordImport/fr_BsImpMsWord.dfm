object FrmImpMsWord: TFrmImpMsWord
  Left = 203
  Top = 122
  Width = 351
  Height = 161
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
    Width = 343
    Height = 33
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object ButOpen: TSpeedButton
      Left = 4
      Top = 4
      Width = 101
      Height = 25
      Caption = 'Open Ms Word File'
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
    Width = 343
    Height = 82
    Align = alClient
    BevelOuter = bvLowered
    Enabled = False
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 56
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Таблица'
    end
    object SpButBend: TSpeedButton
      Left = 240
      Top = 4
      Width = 94
      Height = 22
      Caption = 'Select Bend'
      Flat = True
      OnClick = SpButBendClick
    end
    object ButNewRpt: TSpeedButton
      Left = 5
      Top = 3
      Width = 65
      Height = 22
      Caption = 'New Report'
      Flat = True
      OnClick = ButNewRptClick
    end
    object ButNewPage: TSpeedButton
      Left = 75
      Top = 3
      Width = 65
      Height = 22
      Caption = 'New Page'
      Flat = True
      OnClick = ButNewPageClick
    end
    object ButImport: TSpeedButton
      Left = 216
      Top = 38
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
    object ButPageSetup: TSpeedButton
      Left = 147
      Top = 3
      Width = 86
      Height = 22
      Caption = 'Get Page Setup'
      Flat = True
      OnClick = ButPageSetupClick
    end
    object LblPage: TLabel
      Left = 6
      Top = 32
      Width = 65
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Page'
    end
    object SpEdTable: TSpinEdit
      Left = 74
      Top = 53
      Width = 56
      Height = 22
      MaxValue = 1
      MinValue = 1
      TabOrder = 0
      Value = 1
      OnChange = SpEdTableChange
    end
    object SpEdPage: TSpinEdit
      Left = 74
      Top = 29
      Width = 56
      Height = 22
      MaxValue = 1
      MinValue = 1
      TabOrder = 1
      Value = 1
      OnChange = SpEdPageChange
    end
  end
  object StBar: TStatusBar
    Left = 0
    Top = 115
    Width = 343
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
  object WordApp: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 224
  end
  object WordDoc: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 264
  end
  object OpenDialog: TOpenDialog
    Filter = '*.doc|*.doc|*.*|*.*'
    Left = 304
  end
end
