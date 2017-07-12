object FIND_DELETE_DOC: TFIND_DELETE_DOC
  Left = 87
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Поиск удаленного документа'
  ClientHeight = 213
  ClientWidth = 487
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
    Top = 12
    Width = 57
    Height = 13
    Caption = 'Документ :'
  end
  object Label2: TLabel
    Left = 26
    Top = 40
    Width = 38
    Height = 13
    Caption = 'ID код :'
  end
  object DOC: TComboBox
    Left = 72
    Top = 8
    Width = 327
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'DOC'
    OnChange = DOCChange
    Items.Strings = (
      'Приходная накладная'
      'Расходная накладная'
      'Акт списания'
      'Накладная перемещения'
      'Счет'
      'Сообщние электронной почты')
  end
  object ID: TRxCalcEdit
    Left = 72
    Top = 34
    Width = 153
    Height = 21
    AutoSize = False
    NumGlyphs = 2
    TabOrder = 1
    OnChange = DOCChange
  end
  object Button1: TButton
    Left = 406
    Top = 10
    Width = 75
    Height = 25
    Caption = 'Найти'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 60
    Width = 487
    Height = 153
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    TabOrder = 3
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 118
    Top = 94
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 120
    Top = 144
  end
end
