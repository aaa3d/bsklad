object BAR_CODE_SET_TW: TBAR_CODE_SET_TW
  Left = 313
  Top = 220
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Незарегистрированый штрих-кодштрих кодов'
  ClientHeight = 119
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 424
    Height = 26
    Caption = 
      'Введеный со сканера штрих код несоответствует ни одному товару в' +
      ' базе данных.'#13#10'Назначьте для этого штрих кода артикул товара'
  end
  object Label3: TLabel
    Left = 20
    Top = 48
    Width = 52
    Height = 13
    Caption = 'Штрих-код'
  end
  object Label5: TLabel
    Left = 180
    Top = 44
    Width = 41
    Height = 13
    Caption = 'Артикул'
  end
  object Label2: TLabel
    Left = 23
    Top = 92
    Width = 3
    Height = 13
  end
  object SaveButton: TButton
    Left = 364
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 0
    OnClick = SaveButtonClick
  end
  object Edit1: TEdit
    Left = 20
    Top = 60
    Width = 121
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object RxCalcEdit1: TRxCalcEdit
    Left = 180
    Top = 60
    Width = 121
    Height = 21
    AutoSize = False
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 2
    OnChange = RxCalcEdit1Change
  end
  object BitBtn1: TBitBtn
    Left = 304
    Top = 60
    Width = 25
    Height = 21
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555000000005555555099999990055555099999999010555001111111101
      105500000000000011055080FFFFFF0F01105500FFFFFF0FF0105550FF800007
      7F005555000777777F005555500000000F05555550FFFFFF0F05555550F000FF
      0005555550FFFFFF0555555550FF800005555555550005555555}
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = MAIN_FORM.read_transaction
    BufferChunks = 10
    CachedUpdates = False
    Left = 460
    Top = 28
  end
end
