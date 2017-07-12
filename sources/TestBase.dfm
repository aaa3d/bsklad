object TEST_BASE: TTEST_BASE
  Left = 108
  Top = 139
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Тестирование базы'
  ClientHeight = 348
  ClientWidth = 536
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
  PixelsPerInch = 96
  TextHeight = 13
  object CheckBox1: TCheckBox
    Left = 4
    Top = 4
    Width = 397
    Height = 17
    Caption = 
      'Проверить каталог товаров на потерю группой родительского катало' +
      'га'
    Checked = True
    State = cbChecked
    TabOrder = 0
  end
  object Button1: TButton
    Left = 454
    Top = 2
    Width = 75
    Height = 25
    Caption = 'Начать'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Repar: TCheckBox
    Left = 2
    Top = 184
    Width = 229
    Height = 17
    Caption = 'Исправлять ошибки автоматически'
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 0
    Top = 204
    Width = 536
    Height = 144
    Align = alBottom
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object CheckBox2: TCheckBox
    Left = 4
    Top = 24
    Width = 397
    Height = 17
    Caption = 
      'Проверить каталог контактов на потерю группой родительского ката' +
      'лога'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object CheckBox3: TCheckBox
    Left = 4
    Top = 44
    Width = 413
    Height = 17
    Caption = 'Проверить каталог товаров на товары с неустановленной группой'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object CheckBox4: TCheckBox
    Left = 4
    Top = 64
    Width = 413
    Height = 17
    Caption = 
      'Проверить каталог контактов на контакты с неустановленной группо' +
      'й'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object CheckBox5: TCheckBox
    Left = 4
    Top = 84
    Width = 313
    Height = 17
    Caption = 'Проверить документы на удаление товаров из каталога'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object CheckBox6: TCheckBox
    Left = 4
    Top = 102
    Width = 293
    Height = 17
    Caption = 'Проверить товары на разделение БРАК-ХОРОШИЙ'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
end
