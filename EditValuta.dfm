object EDIT_VALUTA: TEDIT_VALUTA
  Left = 82
  Top = 187
  Width = 666
  Height = 264
  Caption = 'Карточка валюты'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 192
    Top = 8
    Width = 121
    Height = 13
    Caption = 'Полное наименование :'
  end
  object Label2: TLabel
    Left = 243
    Top = 28
    Width = 70
    Height = 13
    Caption = 'Сокращение :'
  end
  object Label3: TLabel
    Left = 194
    Top = 60
    Width = 119
    Height = 13
    Caption = 'Лексическая форма 1 :'
  end
  object Label4: TLabel
    Left = 194
    Top = 84
    Width = 119
    Height = 13
    Caption = 'Лексическая форма 2 :'
  end
  object Label5: TLabel
    Left = 194
    Top = 108
    Width = 119
    Height = 13
    Caption = 'Лексическая форма 3 :'
  end
  object Image1: TImage
    Left = 188
    Top = 208
    Width = 16
    Height = 16
    Hint = 
      'Здесь отображается лексическое представление валюты для корректн' +
      'ого отображения количества'
    AutoSize = True
    Picture.Data = {
      07544269746D6170F6000000424DF60000000000000076000000280000001000
      000010000000010004000000000080000000120B0000120B0000100000001000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFF
      FF00DADADADADADADADAADADADA77DADADADDADADA7007DADADAADADA70FB07D
      ADADDADA70FBFB07DADAADA70FB00FB07DADDA70FBFBFBFB07DAA70FBFB00FBF
      B07DD07BFBF00BFBF70AAD0FBFB00FBFB07DDAD0FBF00BFB07DAADAD0FB00FB0
      7DADDADAD0FBFB07DADAADADAD0FB07DADADDADADAD007DADADAADADADAD7DAD
      ADAD}
    Transparent = True
  end
  object Caption_auto2: TLabel
    Left = 208
    Top = 208
    Width = 60
    Height = 13
    Hint = 
      'Здесь отображается лексическое представление валюты для корректн' +
      'ого отображения количества'
    Caption = 'Синтаксис :'
  end
  object Caption_auto: TLabel
    Left = 272
    Top = 208
    Width = 63
    Height = 13
    Hint = 
      'Здесь отображается лексическое представление валюты для корректн' +
      'ого отображения количества'
    Caption = 'Caption_auto'
  end
  object Image3: TImage
    Left = 640
    Top = 218
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
    Left = 194
    Top = 180
    Width = 125
    Height = 13
    Caption = 'Лексическая форма 13 :'
  end
  object Label7: TLabel
    Left = 194
    Top = 156
    Width = 125
    Height = 13
    Caption = 'Лексическая форма 12 :'
  end
  object Label8: TLabel
    Left = 194
    Top = 132
    Width = 125
    Height = 13
    Caption = 'Лексическая форма 11 :'
  end
  object Caption_auto3: TLabel
    Left = 272
    Top = 224
    Width = 63
    Height = 13
    Hint = 
      'Здесь отображается лексическое представление валюты для корректн' +
      'ого отображения количества'
    Caption = 'Caption_auto'
  end
  object BtnSave: TButton
    Left = 580
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 8
    OnClick = BtnSaveClick
  end
  object BtnClose: TButton
    Left = 580
    Top = 60
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 10
    OnClick = BtnCloseClick
  end
  object BtnApply: TButton
    Left = 580
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Применить'
    TabOrder = 9
    OnClick = BtnApplyClick
  end
  object VALUTA_FULL: TEdit
    Left = 320
    Top = 4
    Width = 253
    Height = 21
    MaxLength = 254
    TabOrder = 0
    Text = 'VALUTA_FULL'
    OnChange = VALUTA_FULLChange
  end
  object VALUTA_SHORT: TEdit
    Left = 320
    Top = 28
    Width = 121
    Height = 21
    MaxLength = 32
    TabOrder = 1
    Text = 'VALUTA_SHORT'
    OnChange = VALUTA_FULLChange
  end
  object VALUTA_AUTO1: TEdit
    Left = 320
    Top = 56
    Width = 249
    Height = 21
    MaxLength = 254
    TabOrder = 2
    Text = 'VALUTA_AUTO1'
    OnChange = VALUTA_AUTO3Change
  end
  object VALUTA_AUTO2: TEdit
    Left = 320
    Top = 80
    Width = 249
    Height = 21
    MaxLength = 254
    TabOrder = 3
    Text = 'VALUTA_AUTO2'
    OnChange = VALUTA_AUTO3Change
  end
  object VALUTA_AUTO3: TEdit
    Left = 320
    Top = 104
    Width = 249
    Height = 21
    MaxLength = 254
    TabOrder = 4
    Text = 'VALUTA_AUTO3'
    OnChange = VALUTA_AUTO3Change
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 237
    Align = alLeft
    BevelOuter = bvLowered
    Color = 14548223
    TabOrder = 11
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
      Width = 168
      Height = 235
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        '  В данной карточке может '
        'быть создана или исправлена '
        'информация о валюте.'
        '  Обратите внимание на '
        'правильность заполнения '
        'лексических форм.'
        '  С их помощью формируется '
        'отображение сумм в '
        'письменном виде, что влияет '
        'на "читабельность" '
        'документов.'
        '  Пример использования '
        'лексических форм показан '
        'внизу карточки.')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object VALUTA_AUTO11: TEdit
    Left = 320
    Top = 128
    Width = 249
    Height = 21
    MaxLength = 254
    TabOrder = 5
    Text = 'VALUTA_AUTO11'
    OnChange = VALUTA_AUTO3Change
  end
  object VALUTA_AUTO12: TEdit
    Left = 320
    Top = 152
    Width = 249
    Height = 21
    MaxLength = 254
    TabOrder = 6
    Text = 'VALUTA_AUTO12'
    OnChange = VALUTA_AUTO3Change
  end
  object VALUTA_AUTO13: TEdit
    Left = 320
    Top = 176
    Width = 249
    Height = 21
    MaxLength = 254
    TabOrder = 7
    Text = 'VALUTA_AUTO13'
    OnChange = VALUTA_AUTO3Change
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    CachedUpdates = False
    Left = 584
    Top = 100
  end
end
