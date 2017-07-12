object KLN_MERGE: TKLN_MERGE
  Left = 60
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Объединение контактов'
  ClientHeight = 160
  ClientWidth = 666
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
    Left = 4
    Top = 4
    Width = 542
    Height = 52
    Caption = 
      '    Данная   форма   позволяет   перевести   все   документы,   ' +
      'выписанные   на   двух   разных   клиентов'#13#10'к одному, а другого ' +
      'удалить. После этого в базе данных останется лишь первый контакт' +
      ' с документами,'#13#10'принадлежащими   обоим.   При   этом   второй  ' +
      'контакт  будет  перемещен  в  папку   "Для   удаленния". '#13#10'Вы см' +
      'ожете удалить его из папки "Для удаления" лишь через сутки после' +
      ' этой операции.'
  end
  object Label2: TLabel
    Left = 8
    Top = 76
    Width = 89
    Height = 13
    Caption = 'Первый контакт :'
  end
  object Label3: TLabel
    Left = 12
    Top = 100
    Width = 85
    Height = 13
    Caption = 'Второй контакт :'
  end
  object KLN1: TEdit
    Left = 188
    Top = 72
    Width = 449
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object KOD1: TEdit
    Left = 100
    Top = 72
    Width = 85
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object KLN2: TEdit
    Left = 188
    Top = 96
    Width = 449
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object KOD2: TEdit
    Left = 100
    Top = 96
    Width = 85
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object BtnMerge: TButton
    Left = 484
    Top = 124
    Width = 75
    Height = 25
    Caption = 'Объединить'
    TabOrder = 4
    OnClick = BtnMergeClick
  end
  object Button2: TButton
    Left = 564
    Top = 124
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 5
    OnClick = Button2Click
  end
  object BtnKln: TBitBtn
    Left = 636
    Top = 72
    Width = 25
    Height = 21
    Hint = 'Справочник контактов (F10)'
    TabOrder = 6
    OnClick = BtnKlnClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888888888888800000000000000080FFFFF000FFFFF080F0000F0F000
      00080F0FFF00FFFF0E080F0F00F0FFFF00080F0FFFF00FFF0B080F0FFF00F00F
      00080F0F00F00FFF0F080F0FFF00F00F00080F0F00F0FFFF0908000FFF080FFF
      0008880000888000088888888888888888888888888888888888}
  end
  object BitBtn1: TBitBtn
    Left = 636
    Top = 96
    Width = 25
    Height = 21
    Hint = 'Справочник контактов (F10)'
    TabOrder = 7
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888888888888800000000000000080FFFFF000FFFFF080F0000F0F000
      00080F0FFF00FFFF0E080F0F00F0FFFF00080F0FFFF00FFF0B080F0FFF00F00F
      00080F0F00F00FFF0F080F0FFF00F00F00080F0F00F0FFFF0908000FFF080FFF
      0008880000888000088888888888888888888888888888888888}
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    CachedUpdates = False
    Left = 8
    Top = 4
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 8
    Top = 44
  end
end
