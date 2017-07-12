object Edit_Shop: TEdit_Shop
  Left = 194
  Top = 270
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Карточка магазина или офиса'
  ClientHeight = 471
  ClientWidth = 610
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 196
    Top = 8
    Width = 121
    Height = 13
    Caption = 'Полное наименование :'
  end
  object Label2: TLabel
    Left = 200
    Top = 32
    Width = 115
    Height = 13
    Caption = 'Префикс документов :'
  end
  object Label3: TLabel
    Left = 196
    Top = 56
    Width = 120
    Height = 13
    Caption = 'Постфикс документов :'
  end
  object Label4: TLabel
    Left = 224
    Top = 72
    Width = 94
    Height = 13
    Caption = 'Цвет документов :'
  end
  object Shape1: TShape
    Left = 400
    Top = 104
    Width = 77
    Height = 21
  end
  object Bevel1: TBevel
    Left = 320
    Top = 76
    Width = 257
    Height = 53
  end
  object Image3: TImage
    Left = 192
    Top = 438
    Width = 16
    Height = 16
    Hint = 
      'Данная форма соответствует требованиям программ,'#13#10'созданным с ло' +
      'готипом Beginner(R)'
    AutoSize = True
    Picture.Data = {
      07544269746D6170F6000000424DF60000000000000076000000280000001000
      000010000000010004000000000080000000120B0000120B0000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF008888888888888888888884F8888888888888444F888888888884444F8888
      888888444F44F88888888444F8844F888888884F88884F8888888888888884F8
      888888BBBBBB884F88888000000BB884F8888800B800B8884F888800BB008888
      84F88800000BB88888488800B800B88888888800BB0088888888800000088888
      8888}
    Transparent = True
  end
  object Label6: TLabel
    Left = 216
    Top = 160
    Width = 94
    Height = 13
    Caption = 'Фирма-владелец: '
  end
  object DOP_FIRM_DELETE: TSpeedButton
    Left = 578
    Top = 159
    Width = 18
    Height = 18
    Glyph.Data = {
      46050000424D4605000000000000360000002800000012000000120000000100
      2000000000001005000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
      000000000000FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00000000000000000000000000FF00FF00FF00FF00000000000000
      0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00000000000000000000000000FF00FF00FF00FF0000000000FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
      000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00}
    OnClick = DOP_FIRM_DELETEClick
  end
  object BtnSave: TButton
    Left = 355
    Top = 428
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 7
    OnClick = BtnSaveClick
  end
  object BtnApply: TButton
    Left = 435
    Top = 428
    Width = 75
    Height = 25
    Caption = 'Применить'
    TabOrder = 8
    OnClick = BtnApplyClick
  end
  object BtnClose: TButton
    Left = 515
    Top = 428
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 9
    OnClick = BtnCloseClick
  end
  object SHOP_NAME: TEdit
    Left = 321
    Top = 4
    Width = 268
    Height = 21
    MaxLength = 254
    TabOrder = 0
    OnChange = SHOP_NAMEChange
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 189
    Height = 471
    Align = alLeft
    BevelOuter = bvLowered
    Caption = 'Panel2'
    Color = 14548223
    TabOrder = 10
    object Image2: TImage
      Left = 0
      Top = 2
      Width = 16
      Height = 16
      AutoSize = True
      Picture.Data = {
        07544269746D6170F6000000424DF60000000000000076000000280000001000
        000010000000010004000000000080000000120B0000120B0000100000001000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFF
        FF00DADADADADADA0ADAADADADADADA00DADDADA7777770B07DAADA0000000FF
        007DDA0FFFBFBFBFFF07AD0FBFFF44FFBF07DA0FFFBFFFBFFF07AD0FBFFF47FF
        BF07DA0FFFBF748FFF07AD0FBFFFB747BF07DA0FFF47FF44FF07AD0FBF44B844
        BF07DA0FFF844448FF07AD0FBFFFBFFFBF07DA0FFFBFFFBFFF0AADA000000000
        00AD}
      Transparent = True
    end
    object RichEdit1: TRichEdit
      Left = 16
      Top = 1
      Width = 172
      Height = 469
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        '  Это карточка магазина или '
        'офиса.'
        'Все "точки", содержащие '
        'базу '
        'данных и не соединённые в '
        'локальную сеть, должны '
        'иметь '
        'персональную запись,'
        'но только одна из "точек" '
        'должна иметь главную базу '
        'данных.'
        'Содержимое полей '
        '"префикс" '
        'и "постфикс" будет '
        'автоматически добавляться '
        'ко всем номерам '
        'документов, '
        'оформленных в данном '
        'магазине.'
        'Префикс вставляется перед '
        'номером, постфикс - '
        'добавляется после номера, '
        'например номер счёта: '
        '9900001, постфикс: "/1".'
        'В результате номер счёта '
        'будет : 9900001/1'
        'Цвет документов влияет на '
        'отображение номеров '
        'документов в журналах.'
        'Поле "Полное '
        'наименование" '
        'не может быть пустой '
        'строкой.')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Shop_office: TCheckBox
    Left = 316
    Top = 136
    Width = 141
    Height = 17
    Caption = 'Главная база данных'
    TabOrder = 6
  end
  object SHOP_PREFIX: TEdit
    Left = 321
    Top = 28
    Width = 121
    Height = 21
    MaxLength = 32
    TabOrder = 1
  end
  object SHOP_POSTFIX: TEdit
    Left = 321
    Top = 52
    Width = 121
    Height = 21
    MaxLength = 32
    TabOrder = 2
  end
  object RadioButton1: TRadioButton
    Left = 324
    Top = 80
    Width = 113
    Height = 17
    Caption = 'По умолчанию'
    Checked = True
    TabOrder = 3
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 324
    Top = 104
    Width = 65
    Height = 17
    Caption = 'Другой :'
    TabOrder = 4
    OnClick = RadioButton1Click
  end
  object BtnColor: TButton
    Left = 480
    Top = 100
    Width = 89
    Height = 25
    Caption = 'Выбрать цвет'
    Enabled = False
    TabOrder = 5
    OnClick = BtnColorClick
  end
  object FRM_NAME: TEdit
    Left = 317
    Top = 158
    Width = 236
    Height = 19
    Hint = 
      'определяет, от лица какой формы будут оформлятся новые документы' +
      '.'#13#10'Если фирма указана, то документы могут быть оформлены только ' +
      'от '#13#10'лица указанной фирмы.'#13#10'Если фирма не указана - документы мо' +
      'гут быть оформлены от лица '#13#10'одного из продавцов товара.'
    AutoSize = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
    Text = 'FRM_NAME'
  end
  object BTN_FRM: TBitBtn
    Left = 556
    Top = 159
    Width = 18
    Height = 18
    Hint = 'Выбрать клиента из справочника контактов (F10)'
    TabOrder = 12
    TabStop = False
    OnClick = BTN_FRMClick
    Glyph.Data = {
      EE000000424DEE0000000000000076000000280000000F0000000F0000000100
      0400000000007800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555008000000000085505080FFFFFF0505500000000000F0F5500FFFFFFFFF0F
      055050F00F00FFF0F55050FFFFFFFFF0F550000FFFFFFFFF00000900F00000F0
      0900090FFFFFFFFF0900000F0000F00F0000550FFFFFFFFF0550550FFF000000
      0000555000FFFFFFFF005555550000000000}
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 216
    Top = 228
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    Left = 212
    Top = 180
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 36
    Top = 28
  end
end
