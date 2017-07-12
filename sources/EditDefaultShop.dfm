object EDIT_DEFAULT_SHOP: TEDIT_DEFAULT_SHOP
  Left = 496
  Top = 249
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'EDIT_DEFAULT_SHOP'
  ClientHeight = 158
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 49
    Top = 64
    Width = 117
    Height = 13
    Caption = 'Фирма по умолчанию :'
  end
  object Label2: TLabel
    Left = 28
    Top = 40
    Width = 138
    Height = 13
    Caption = 'Тип расходной накладной :'
  end
  object Label3: TLabel
    Left = 50
    Top = 88
    Width = 116
    Height = 13
    Caption = 'Клиент по умолчанию :'
  end
  object Btn_FRM: TSpeedButton
    Left = 532
    Top = 60
    Width = 23
    Height = 22
    Hint = 'Выбрать фирму по умолчанию (Ctrl+F10)'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
      0555088888888888805508000000000088055080FFFFFF0508800000000000F0
      F0800FFFFFFFFF0F008050F00F00FFF0F08050FFFFFFFFF0F080000FFFFFFFFF
      00000900F00000F00090090FFFFFFFFF0090000FFFFFFFFF0F00550F000F00FF
      0F05550FFFFFFFFF0005550FFF00000005555550005555555555}
    OnClick = Btn_FRMClick
  end
  object BTN_KLN: TSpeedButton
    Left = 532
    Top = 84
    Width = 23
    Height = 22
    Hint = 'Выбрать клиента по умолчанию (F10)'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
      0555088888888888805508000000000088055080FFFFFF0508800000000000F0
      F0800FFFFFFFFF0F008050F00F00FFF0F08050FFFFFFFFF0F080000FFFFFFFFF
      00000900F00000F00090090FFFFFFFFF0090000FFFFFFFFF0F00550F000F00FF
      0F05550FFFFFFFFF0005550FFF00000005555550005555555555}
    OnClick = BTN_KLNClick
  end
  object Label4: TLabel
    Left = 4
    Top = 114
    Width = 162
    Height = 13
    Caption = 'Вид реализации по умолчанию :'
  end
  object Label5: TLabel
    Left = 6
    Top = 136
    Width = 162
    Height = 13
    Caption = 'Вид реализации по умолчанию :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 561
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BTN_SAVE: TToolButton
      Left = 0
      Top = 2
      Hint = 'Сохранить (Ctrl+Enter)'
      Caption = 'BTN_SAVE'
      ImageIndex = 39
      OnClick = BTN_SAVEClick
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 33
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton1'
      ImageIndex = 110
      OnClick = ToolButton1Click
    end
  end
  object TYP: TEdit
    Left = 172
    Top = 36
    Width = 361
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = 'TYP'
  end
  object FRM: TEdit
    Left = 172
    Top = 60
    Width = 361
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'FRM'
  end
  object KLN: TEdit
    Left = 172
    Top = 84
    Width = 361
    Height = 21
    Enabled = False
    TabOrder = 3
    Text = 'KLN'
  end
  object RVID: TRxDBLookupCombo
    Left = 172
    Top = 108
    Width = 361
    Height = 21
    DropDownCount = 8
    LookupField = 'RVID_ID'
    LookupDisplay = 'RVID_NAME'
    LookupSource = DataModule1.MainDsRvid
    TabOrder = 4
    OnChange = RVIDChange
  end
  object RVIDKLN: TRxDBLookupCombo
    Left = 172
    Top = 132
    Width = 361
    Height = 21
    DropDownCount = 8
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Images = DataModule1.ImageList1
    Left = 364
    Top = 16
    object N1: TMenuItem
      Caption = 'Сохранить и выйти'
      ImageIndex = 39
      ShortCut = 16397
      OnClick = BTN_SAVEClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = 'Выбрать фирму по умолчанию'
      ImageIndex = 14
      ShortCut = 8313
      OnClick = Btn_FRMClick
    end
    object N4: TMenuItem
      Caption = 'Выбрать клиента по умолчанию'
      ImageIndex = 14
      ShortCut = 121
      OnClick = BTN_KLNClick
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 76
    Top = 6
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 76
    Top = 56
  end
end
