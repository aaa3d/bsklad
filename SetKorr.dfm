object SET_KORR: TSET_KORR
  Left = 285
  Top = 309
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Установки по коррекции НДС'
  ClientHeight = 139
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 64
    Height = 13
    Caption = 'Накладные :'
  end
  object Label2: TLabel
    Left = 2
    Top = 34
    Width = 385
    Height = 39
    Caption = 
      'При построении финансовых отчетов и выгрузке данных в 1С:Бухгалт' +
      'ерию'#13#10'корректировать    НДС   на   следующие   типы   расходных ' +
      '  накладных   и '#13#10'акты списания:'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 396
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = ActSave
    end
  end
  object Edit1: TEdit
    Left = 76
    Top = 84
    Width = 281
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object BitBtn1: TBitBtn
    Left = 356
    Top = 84
    Width = 25
    Height = 21
    Hint = 'Выбрать из списка'
    TabOrder = 2
    OnClick = BitBtn1Click
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777700000007777777777777777700000007777747474747477700000007777
      7477777777777000000077774447777774777000000077777477777777777000
      00007777777777777477700000007770000007700000000000007000FBFB0000
      FBFB0000000070F0000000F000000000000070FFFFF070FFFFF07000000070F8
      88F070F888F07000000070FFFFF070FFFFF07000000070F888F070F888F07000
      000070FFFFF070FFFFF070000000700000007000000070000000777777777777
      777770000000}
  end
  object SPIS: TCheckBox
    Left = 78
    Top = 112
    Width = 259
    Height = 17
    Caption = 'При коррекции учитывать акты списания'
    TabOrder = 3
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 254
    Top = 8
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 330
    Top = 8
  end
  object DualListDialog1: TDualListDialog
    Sorted = False
    Label1Caption = '&Типы накладных'
    Label2Caption = '&Типы для расчёта'
    HelpContext = 0
    Left = 176
    Top = 8
  end
  object ActionList1: TActionList
    Images = DataModule1.ImageList1
    Left = 28
    Top = 86
    object ActSave: TAction
      Caption = 'Сохранить'
      Hint = 'Сохранить'
      ImageIndex = 39
      OnExecute = ActSaveExecute
    end
  end
end
