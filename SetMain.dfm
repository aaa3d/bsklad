object Set_Main: TSet_Main
  Left = 488
  Top = 257
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Основные настройки системы'
  ClientHeight = 562
  ClientWidth = 848
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 543
    Width = 848
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 848
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton1'
      ImageIndex = 110
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 40
      Style = tbsSeparator
    end
    object BtnSave: TToolButton
      Left = 33
      Top = 2
      Hint = 'Сохранить настройки и выйти (Ctrl+Enter)'
      Caption = 'BtnSave'
      ImageIndex = 39
      OnClick = BtnSaveClick
    end
    object BtnApply: TToolButton
      Left = 58
      Top = 2
      Hint = 'Применить'
      Caption = 'BtnApply'
      ImageIndex = 38
      OnClick = BtnApplyClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 848
    Height = 514
    ActivePage = TabSheet1
    Align = alClient
    MultiLine = True
    TabOrder = 2
    object TabSheet2: TTabSheet
      Caption = 'Информация на счёте'
      ImageIndex = 1
      object ST_TEXT: TMemo
        Left = 213
        Top = 0
        Width = 627
        Height = 468
        Align = alClient
        Lines.Strings = (
          'ST_TEXT')
        MaxLength = 10000
        TabOrder = 0
        OnChange = ST_TEXTChange
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 213
        Height = 468
        Align = alLeft
        BevelOuter = bvLowered
        Caption = 'Panel2'
        Color = 14548223
        TabOrder = 1
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
          Left = 20
          Top = 1
          Width = 192
          Height = 466
          TabStop = False
          Align = alRight
          Alignment = taCenter
          BorderStyle = bsNone
          Color = 14548223
          Lines.Strings = (
            'Здесь вы можете изменить текст, '
            'который отображается в заголовке '
            'счёта при его печати. '
            'Объём этого текста ограничен '
            '10000 '
            'символами, что составляет '
            'примерно около 5 страниц.')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Информация на расходной накладной'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 213
        Height = 468
        Align = alLeft
        BevelOuter = bvLowered
        Caption = 'Panel2'
        Color = 14548223
        TabOrder = 0
        object Image1: TImage
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
        object RichEdit2: TRichEdit
          Left = 20
          Top = 1
          Width = 192
          Height = 466
          TabStop = False
          Align = alRight
          Alignment = taCenter
          BorderStyle = bsNone
          Color = 14548223
          Lines.Strings = (
            'Здесь вы можете изменить текст, '
            'который отображается в заголовке '
            'расходной накладной при её печати. '
            'Объём этого текста ограничен '
            '10000 '
            'символами, что составляет '
            'примерно около 5 страниц.')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object RN_TEXT: TMemo
        Left = 213
        Top = 0
        Width = 627
        Height = 468
        Align = alClient
        Lines.Strings = (
          'RN_TEXT')
        MaxLength = 10000
        TabOrder = 1
        OnChange = RN_TEXTChange
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Цвета'
      ImageIndex = 3
      object Label1: TLabel
        Left = 12
        Top = 4
        Width = 168
        Height = 13
        Caption = 'Цвета остатков при оформлении'
      end
      object Label2: TLabel
        Left = 16
        Top = 16
        Width = 163
        Height = 13
        Caption = 'расходных документов и счетов'
      end
      object Label3: TLabel
        Left = 232
        Top = 8
        Width = 187
        Height = 13
        Caption = 'Цвета отгрузки и получения товаров'
      end
      object Panel3: TPanel
        Left = 0
        Top = 36
        Width = 205
        Height = 53
        BevelOuter = bvLowered
        TabOrder = 0
        object Edit1: TEdit
          Left = 4
          Top = 4
          Width = 197
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = 'Остатка хватает для оформления'
        end
        object RadioButton1: TRadioButton
          Left = 4
          Top = 28
          Width = 97
          Height = 17
          Caption = 'По умолчанию'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 104
          Top = 28
          Width = 93
          Height = 17
          Caption = 'Другой'
          TabOrder = 2
          OnClick = RadioButton1Click
        end
        object Button1: TButton
          Left = 164
          Top = 28
          Width = 33
          Height = 17
          Caption = '...'
          TabOrder = 3
          OnClick = Button1Click
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 92
        Width = 205
        Height = 53
        BevelOuter = bvLowered
        TabOrder = 1
        object Edit2: TEdit
          Left = 4
          Top = 4
          Width = 197
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = 'Остатка не хватает для оформления'
        end
        object RadioButton3: TRadioButton
          Left = 4
          Top = 28
          Width = 97
          Height = 17
          Caption = 'По умолчанию'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RadioButton4Click
        end
        object RadioButton4: TRadioButton
          Left = 104
          Top = 28
          Width = 93
          Height = 17
          Caption = 'Другой'
          TabOrder = 2
          OnClick = RadioButton4Click
        end
        object Button2: TButton
          Left = 164
          Top = 28
          Width = 33
          Height = 17
          Caption = '...'
          TabOrder = 3
          OnClick = Button2Click
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 148
        Width = 205
        Height = 53
        BevelOuter = bvLowered
        TabOrder = 2
        object Edit3: TEdit
          Left = 4
          Top = 4
          Width = 197
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = 'Остаток отрицательный'
        end
        object RadioButton5: TRadioButton
          Left = 4
          Top = 28
          Width = 97
          Height = 17
          Caption = 'По умолчанию'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RadioButton5Click
        end
        object RadioButton6: TRadioButton
          Left = 104
          Top = 28
          Width = 93
          Height = 17
          Caption = 'Другой'
          TabOrder = 2
          OnClick = RadioButton5Click
        end
        object Button3: TButton
          Left = 164
          Top = 28
          Width = 33
          Height = 17
          Caption = '...'
          TabOrder = 3
          OnClick = Button3Click
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 204
        Width = 205
        Height = 53
        BevelOuter = bvLowered
        TabOrder = 3
        object Edit4: TEdit
          Left = 4
          Top = 4
          Width = 197
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = 'Остаток нулевой'
        end
        object RadioButton7: TRadioButton
          Left = 4
          Top = 28
          Width = 97
          Height = 17
          Caption = 'По умолчанию'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RadioButton7Click
        end
        object RadioButton8: TRadioButton
          Left = 104
          Top = 28
          Width = 93
          Height = 17
          Caption = 'Другой'
          TabOrder = 2
          OnClick = RadioButton7Click
        end
        object Button4: TButton
          Left = 164
          Top = 28
          Width = 33
          Height = 17
          Caption = '...'
          TabOrder = 3
          OnClick = Button4Click
        end
      end
      object Panel7: TPanel
        Left = 220
        Top = 36
        Width = 221
        Height = 53
        BevelOuter = bvLowered
        TabOrder = 4
        object Edit5: TEdit
          Left = 4
          Top = 4
          Width = 213
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = 'Товар совсем не отгружен/не получен'
        end
        object RadioButton9: TRadioButton
          Left = 4
          Top = 28
          Width = 97
          Height = 17
          Caption = 'По умолчанию'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RadioButton9Click
        end
        object RadioButton10: TRadioButton
          Left = 124
          Top = 28
          Width = 93
          Height = 17
          Caption = 'Другой'
          TabOrder = 2
          OnClick = RadioButton9Click
        end
        object Button5: TButton
          Left = 184
          Top = 28
          Width = 33
          Height = 17
          Caption = '...'
          TabOrder = 3
          OnClick = Button5Click
        end
      end
      object Panel8: TPanel
        Left = 220
        Top = 92
        Width = 221
        Height = 53
        BevelOuter = bvLowered
        TabOrder = 5
        object Edit6: TEdit
          Left = 4
          Top = 4
          Width = 213
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = 'Товар отгружен/получен полностью'
        end
        object RadioButton11: TRadioButton
          Left = 4
          Top = 28
          Width = 97
          Height = 17
          Caption = 'По умолчанию'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RadioButton11Click
        end
        object RadioButton12: TRadioButton
          Left = 124
          Top = 28
          Width = 93
          Height = 17
          Caption = 'Другой'
          TabOrder = 2
          OnClick = RadioButton11Click
        end
        object Button6: TButton
          Left = 184
          Top = 28
          Width = 33
          Height = 17
          Caption = '...'
          TabOrder = 3
          OnClick = Button6Click
        end
      end
      object Panel9: TPanel
        Left = 220
        Top = 148
        Width = 221
        Height = 53
        BevelOuter = bvLowered
        TabOrder = 6
        object Edit7: TEdit
          Left = 4
          Top = 4
          Width = 213
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = 'Товар отгружен/получен частично'
        end
        object RadioButton13: TRadioButton
          Left = 4
          Top = 28
          Width = 97
          Height = 17
          Caption = 'По умолчанию'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RadioButton13Click
        end
        object RadioButton14: TRadioButton
          Left = 124
          Top = 28
          Width = 93
          Height = 17
          Caption = 'Другой'
          TabOrder = 2
          OnClick = RadioButton13Click
        end
        object Button7: TButton
          Left = 184
          Top = 28
          Width = 33
          Height = 17
          Caption = '...'
          TabOrder = 3
          OnClick = Button7Click
        end
      end
      object Panel10: TPanel
        Left = 220
        Top = 204
        Width = 221
        Height = 53
        BevelOuter = bvLowered
        TabOrder = 7
        object Edit8: TEdit
          Left = 4
          Top = 4
          Width = 213
          Height = 21
          Enabled = False
          TabOrder = 0
          Text = 'Товара отгружено/получено с излишком'
        end
        object RadioButton15: TRadioButton
          Left = 4
          Top = 28
          Width = 97
          Height = 17
          Caption = 'По умолчанию'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RadioButton16Click
        end
        object RadioButton16: TRadioButton
          Left = 124
          Top = 28
          Width = 93
          Height = 17
          Caption = 'Другой'
          TabOrder = 2
          OnClick = RadioButton16Click
        end
        object Button8: TButton
          Left = 184
          Top = 28
          Width = 33
          Height = 17
          Caption = '...'
          TabOrder = 3
          OnClick = Button8Click
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 260
        Width = 441
        Height = 57
        BevelOuter = bvLowered
        TabOrder = 8
        object Edit9: TEdit
          Left = 4
          Top = 4
          Width = 433
          Height = 21
          ReadOnly = True
          TabOrder = 0
          Text = 'Режим "ввод товаров"'
        end
        object RadioButton19: TRadioButton
          Left = 4
          Top = 32
          Width = 121
          Height = 17
          Caption = 'Фон по умолчанию'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RadioButton19Click
        end
        object RadioButton20: TRadioButton
          Left = 124
          Top = 32
          Width = 93
          Height = 17
          Caption = 'Другой'
          TabOrder = 2
          OnClick = RadioButton19Click
        end
        object Button10: TButton
          Left = 184
          Top = 32
          Width = 33
          Height = 17
          Caption = '...'
          TabOrder = 3
          OnClick = Button10Click
        end
        object Panel13: TPanel
          Left = 220
          Top = 28
          Width = 217
          Height = 25
          BevelOuter = bvNone
          TabOrder = 4
          object RadioButton17: TRadioButton
            Left = 4
            Top = 4
            Width = 121
            Height = 17
            Caption = 'Буквы по умолч.'
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = RadioButton18Click
          end
          object RadioButton18: TRadioButton
            Left = 124
            Top = 4
            Width = 93
            Height = 17
            Caption = 'Другой'
            TabOrder = 1
            OnClick = RadioButton18Click
          end
          object Button9: TButton
            Left = 184
            Top = 4
            Width = 33
            Height = 17
            Caption = '...'
            TabOrder = 2
            OnClick = Button9Click
          end
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Опции'
      ImageIndex = 3
      object Label4: TLabel
        Left = 4
        Top = 8
        Width = 279
        Height = 13
        Caption = 'Срок давности маркетинговых данных установлен на :'
      end
      object Label5: TLabel
        Left = 372
        Top = 8
        Width = 24
        Height = 13
        Caption = 'дней'
      end
      object Label6: TLabel
        Left = 369
        Top = 6
        Width = 244
        Height = 13
        Caption = 'Ожидание полного кода по пластиковой карте :'
      end
      object Label7: TLabel
        Left = 702
        Top = 8
        Width = 67
        Height = 13
        Caption = 'миллисекунд'
      end
      object Label8: TLabel
        Left = 138
        Top = 30
        Width = 145
        Height = 13
        Caption = 'Принцип нумерации счетов :'
      end
      object Label9: TLabel
        Left = 43
        Top = 96
        Width = 240
        Height = 13
        Caption = 'Принцип нумерации накладных перемещения :'
      end
      object Label10: TLabel
        Left = 92
        Top = 118
        Width = 191
        Height = 13
        Caption = 'Принцип нумерации актов списания :'
      end
      object Label20: TLabel
        Left = 63
        Top = 140
        Width = 220
        Height = 13
        Caption = 'Принцип нумерации гарантийных талонов :'
      end
      object Label22: TLabel
        Left = 8
        Top = 202
        Width = 274
        Height = 26
        Caption = 
          'Отображать данные по неотгрузке и недополучению'#13#10'               ' +
          '                                   товара только позднее :'
      end
      object Label23: TLabel
        Left = 99
        Top = 74
        Width = 184
        Height = 13
        Caption = 'Принцип нумерации счетов-фактур :'
      end
      object Label24: TLabel
        Left = 212
        Top = 236
        Width = 69
        Height = 13
        Caption = 'Ставка НДС :'
      end
      object Label28: TLabel
        Left = 80
        Top = 162
        Width = 203
        Height = 13
        Caption = 'Принцип нумерации актов переоценки :'
      end
      object Label36: TLabel
        Left = 68
        Top = 258
        Width = 211
        Height = 13
        Caption = 'В счете выставлять курсовую скидку по :'
      end
      object Label39: TLabel
        Left = 68
        Top = 274
        Width = 211
        Height = 26
        Caption = 
          'При оформлении заявки на закупку'#13#10'последнюю цену закупки определ' +
          'ять по :'
      end
      object Label60: TLabel
        Left = 174
        Top = 308
        Width = 104
        Height = 13
        Caption = 'Компьютеры с ККМ:'
      end
      object Label61: TLabel
        Left = 124
        Top = 330
        Width = 160
        Height = 13
        Caption = 'Обновление журналов каждые '
      end
      object Label62: TLabel
        Left = 344
        Top = 330
        Width = 21
        Height = 13
        Caption = 'сек.'
      end
      object Label42: TLabel
        Left = 74
        Top = 184
        Width = 210
        Height = 13
        Caption = 'Принцип нумерации актов пересортицы :'
      end
      object Label19: TLabel
        Left = 122
        Top = 396
        Width = 164
        Height = 13
        Caption = 'Принцип нумерации предоплат :'
      end
      object Label53: TLabel
        Left = 58
        Top = 50
        Width = 224
        Height = 13
        Caption = 'Принцип нумерации заявок на переоценку :'
      end
      object Label69: TLabel
        Left = 544
        Top = 240
        Width = 133
        Height = 13
        Caption = 'Дополнительные фирмы :'
      end
      object DOP_FIRM_SELECT: TSpeedButton
        Left = 808
        Top = 252
        Width = 18
        Height = 18
        Glyph.Data = {
          EE000000424DEE0000000000000076000000280000000F0000000F0000000100
          0400000000007800000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555008000000000085505080FFFFFF0505500000000000F0F5500FFFFFFFFF0F
          055050F00F00FFF0F55050FFFFFFFFF0F550000FFFFFFFFF00000900F00000F0
          0900090FFFFFFFFF0900000F0000F00F0000550FFFFFFFFF0550550FFF000000
          0000555000FFFFFFFF005555550000000000}
        OnClick = DOP_FIRM_SELECTClick
      end
      object DOP_FIRM_DELETE: TSpeedButton
        Left = 808
        Top = 276
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
      object Label70: TLabel
        Left = 544
        Top = 332
        Width = 225
        Height = 13
        Caption = 'Процент наценки при продаже доп. фирмы :'
      end
      object Label71: TLabel
        Left = 544
        Top = 352
        Width = 177
        Height = 13
        Caption = 'Журнал ПН дополнительных фирм'
      end
      object Label72: TLabel
        Left = 548
        Top = 392
        Width = 200
        Height = 13
        Caption = 'Журнал  РН для дополнительных фирм'
      end
      object Label73: TLabel
        Left = 544
        Top = 144
        Width = 128
        Height = 13
        Caption = 'Кредитование клиентов :'
      end
      object MARKET_PERIOD: TRxSpinEdit
        Left = 288
        Top = 4
        Width = 77
        Height = 21
        MaxValue = 365
        MinValue = 1
        Value = 1
        TabOrder = 0
      end
      object TIME_GET_DISCONT: TRxSpinEdit
        Left = 618
        Top = 2
        Width = 77
        Height = 21
        MaxValue = 60000
        MinValue = 100
        Value = 100
        TabOrder = 1
      end
      object ST_NUM_CALC: TComboBox
        Left = 288
        Top = 26
        Width = 237
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = 'ST_NUM_CALC'
        Items.Strings = (
          'Нумерация сбрасывается каждый год'
          'Сквозная нумерация')
      end
      object PER_NUM_CALC: TComboBox
        Left = 288
        Top = 92
        Width = 237
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        Text = 'ComboBox1'
        Items.Strings = (
          'Нумерация сбрасывается каждый год'
          'Сквозная нумерация')
      end
      object SPIS_NUM_CALC: TComboBox
        Left = 288
        Top = 114
        Width = 237
        Height = 21
        ItemHeight = 13
        TabOrder = 5
        Text = 'ComboBox1'
        Items.Strings = (
          'Нумерация сбрасывается каждый год'
          'Сквозная нумерация')
      end
      object GARANT_NUM_CALC: TComboBox
        Left = 288
        Top = 136
        Width = 237
        Height = 21
        ItemHeight = 13
        TabOrder = 6
        Text = 'GARANT_NUM_CALC'
        Items.Strings = (
          'Нумерация сбрасывается каждый год'
          'Сквозная нумерация')
      end
      object OTGRUZ_LAST_DATE: TDateEdit
        Left = 288
        Top = 210
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 8
      end
      object STFAKT_NUM_CALC: TComboBox
        Left = 288
        Top = 70
        Width = 237
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'STFAKT_NUM_CALC'
        Items.Strings = (
          'Нумерация сбрасывается каждый год'
          'Сквозная нумерация')
      end
      object NDS: TRxCalcEdit
        Left = 288
        Top = 232
        Width = 85
        Height = 21
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = ',#0%'
        NumGlyphs = 2
        TabOrder = 7
      end
      object REMON_NUM_CALC: TComboBox
        Left = 288
        Top = 158
        Width = 237
        Height = 21
        ItemHeight = 13
        TabOrder = 9
        Text = 'REMON_NUM_CALC'
        Items.Strings = (
          'Нумерация сбрасывается каждый год'
          'Сквозная нумерация')
      end
      object ST_SKID: TRxDBLookupCombo
        Left = 288
        Top = 254
        Width = 237
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'RNTYP_ID'
        LookupDisplay = 'RNTYP_FULL'
        LookupSource = DsRNTYP
        TabOrder = 10
        OnChange = ST_SKIDChange
      end
      object ZAY_PNVID: TRxDBLookupCombo
        Left = 288
        Top = 282
        Width = 237
        Height = 21
        DropDownCount = 8
        LookupField = 'PNVID_ID'
        LookupDisplay = 'PNVID_NAM'
        LookupSource = DsPNVID
        TabOrder = 11
      end
      object ISKKM: TEdit
        Left = 288
        Top = 304
        Width = 237
        Height = 21
        TabOrder = 12
      end
      object Jou_Refresh: TRxSpinEdit
        Left = 288
        Top = 326
        Width = 53
        Height = 21
        MaxValue = 600
        MinValue = 5
        Value = 20
        TabOrder = 13
      end
      object PSORT_NUM_CALC: TComboBox
        Left = 288
        Top = 180
        Width = 237
        Height = 21
        ItemHeight = 13
        TabOrder = 14
        Text = 'PSORT_NUM_CALC'
        Items.Strings = (
          'Нумерация сбрасывается каждый год'
          'Сквозная нумерация')
      end
      object PO_NUM_CALC: TComboBox
        Left = 288
        Top = 392
        Width = 237
        Height = 21
        ItemHeight = 13
        TabOrder = 15
        Text = 'PO_NUM_CALC'
        OnChange = PO_NUM_CALCChange
        Items.Strings = (
          'Нумерация сбрасывается каждый год'
          'Сквозная нумерация'
          'В номере указывается дата создания')
      end
      object ZREMON_NUM_CALC: TComboBox
        Left = 288
        Top = 48
        Width = 237
        Height = 21
        ItemHeight = 13
        TabOrder = 16
        Text = 'ZREMON_NUM_CALC'
        Items.Strings = (
          'Нумерация сбрасывается каждый год'
          'Сквозная нумерация')
      end
      object GroupBox3: TGroupBox
        Left = 544
        Top = 32
        Width = 201
        Height = 105
        Caption = 'Срок хранения, дней'
        TabOrder = 17
        object Label65: TLabel
          Left = 8
          Top = 24
          Width = 97
          Height = 13
          Caption = 'непроведенных РН'
        end
        object Label66: TLabel
          Left = 8
          Top = 48
          Width = 45
          Height = 13
          Caption = 'Выписок'
        end
        object Label67: TLabel
          Left = 8
          Top = 72
          Width = 116
          Height = 13
          Caption = 'Проведенных выписок'
        end
        object keepUnprovRN: TRxSpinEdit
          Left = 144
          Top = 16
          Width = 49
          Height = 21
          TabOrder = 0
        end
        object keep_TEMP_RN: TRxSpinEdit
          Left = 144
          Top = 40
          Width = 49
          Height = 21
          TabOrder = 1
        end
        object keepProvVIP: TRxSpinEdit
          Left = 144
          Top = 64
          Width = 49
          Height = 21
          TabOrder = 2
        end
      end
      object RxDBGrid1: TRxDBGrid
        Left = 544
        Top = 254
        Width = 265
        Height = 71
        DataSource = DsDopFirm
        Options = [dgColumnResize]
        ReadOnly = True
        TabOrder = 18
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        ClearSelection = False
        Columns = <
          item
            Expanded = False
            FieldName = 'F_1'
            Title.Caption = 'Наименование дополнительной фирмы'
            Visible = True
          end>
      end
      object NacProcent: TRxSpinEdit
        Left = 790
        Top = 328
        Width = 37
        Height = 18
        TabOrder = 19
      end
      object RNTYP_DOP: TRxDBLookupCombo
        Left = 544
        Top = 408
        Width = 277
        Height = 21
        DropDownCount = 8
        LookupField = 'RNTYP_ID'
        LookupDisplay = 'RNTYP_FULL'
        LookupSource = DsRNTYP
        TabOrder = 20
      end
      object PNTYP_DOP: TRxDBLookupCombo
        Left = 544
        Top = 372
        Width = 277
        Height = 21
        DropDownCount = 8
        LookupField = 'PNTYP_ID'
        LookupDisplay = 'PNTYP_FULL'
        LookupSource = DsPnTYP
        TabOrder = 21
      end
      object cbCreditMode: TComboBox
        Left = 544
        Top = 160
        Width = 281
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 22
        Items.Strings = (
          'Проверка кредитов отключена'
          'Запрет отгрузки при недостатке денег'
          'Предупреждение о недостатке денег')
      end
      object KKM_PRINT_NAME: TComboBox
        Left = 288
        Top = 360
        Width = 233
        Height = 21
        Style = csDropDownList
        DropDownCount = 3
        ItemHeight = 13
        TabOrder = 23
        Items.Strings = (
          'Не печатать на ККМ наименование товара'
          'Печатать полное наименование товара'
          'Печатать сокращенное наименование товара')
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Настройки для магазинов'
      ImageIndex = 4
      object Label11: TLabel
        Left = 8
        Top = 12
        Width = 50
        Height = 13
        Caption = 'Магазин :'
      end
      object Bevel1: TBevel
        Left = 0
        Top = 40
        Width = 741
        Height = 9
        Shape = bsTopLine
      end
      object Label12: TLabel
        Left = 155
        Top = 48
        Width = 111
        Height = 13
        Caption = 'Склад по умолчанию :'
      end
      object Label13: TLabel
        Left = 142
        Top = 70
        Width = 124
        Height = 13
        Caption = 'Магазин по умолчанию :'
      end
      object Label14: TLabel
        Left = 150
        Top = 92
        Width = 116
        Height = 13
        Caption = 'Клиент по умолчанию :'
      end
      object Label15: TLabel
        Left = 149
        Top = 114
        Width = 117
        Height = 13
        Caption = 'Фирма по умолчанию :'
      end
      object Label16: TLabel
        Left = 157
        Top = 136
        Width = 109
        Height = 13
        Caption = 'COM порт для ККМ1 :'
      end
      object Label25: TLabel
        Left = 54
        Top = 202
        Width = 212
        Height = 13
        Caption = 'Локальный каталог для пакетов данных :'
      end
      object Label26: TLabel
        Left = 8
        Top = 224
        Width = 258
        Height = 13
        Caption = 'Каталог на главном сервере для пакетов данных :'
      end
      object Label27: TLabel
        Left = 97
        Top = 244
        Width = 169
        Height = 13
        Caption = 'Каталог для временных файлов :'
      end
      object Label21: TLabel
        Left = 96
        Top = 180
        Width = 170
        Height = 13
        Caption = 'Код поставщика для ККМ-Online :'
      end
      object Label17: TLabel
        Left = 78
        Top = 158
        Width = 188
        Height = 13
        Alignment = taRightJustify
        Caption = 'Тип наличной расходной накладной :'
      end
      object Label18: TLabel
        Left = 154
        Top = 268
        Width = 113
        Height = 13
        Caption = 'Модель ККМ или ФР :'
      end
      object SHOP: TRxDBLookupCombo
        Left = 68
        Top = 8
        Width = 285
        Height = 21
        DropDownCount = 8
        LookupField = 'SHOP_ID'
        LookupDisplay = 'SHOP_NAME'
        LookupSource = DsShop
        TabOrder = 0
        OnChange = SHOPChange
      end
      object SKL1: TRxDBLookupCombo
        Left = 270
        Top = 44
        Width = 321
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_FULL'
        LookupSource = DsSKL
        TabOrder = 1
        OnChange = SKL1Change
      end
      object SHOP1: TRxDBLookupCombo
        Left = 270
        Top = 66
        Width = 321
        Height = 21
        DropDownCount = 8
        LookupField = 'SHOP_ID'
        LookupDisplay = 'SHOP_NAME'
        LookupSource = DsShop
        TabOrder = 2
        OnChange = SHOP1Change
      end
      object KLN1: TEdit
        Left = 270
        Top = 88
        Width = 297
        Height = 21
        Enabled = False
        TabOrder = 3
        Text = 'KLN1'
      end
      object BTN_KLN1: TButton
        Left = 566
        Top = 88
        Width = 25
        Height = 21
        Caption = '...'
        TabOrder = 4
        OnClick = BTN_KLN1Click
      end
      object FRM1: TEdit
        Left = 270
        Top = 110
        Width = 297
        Height = 21
        Enabled = False
        TabOrder = 5
        Text = 'FRM1'
      end
      object BTN_FRM1: TButton
        Left = 566
        Top = 110
        Width = 25
        Height = 21
        Caption = '...'
        TabOrder = 6
        OnClick = BTN_FRM1Click
      end
      object KKM1: TRxSpinEdit
        Left = 270
        Top = 132
        Width = 45
        Height = 21
        MaxValue = 4
        MinValue = 1
        Value = 1
        TabOrder = 7
        OnChange = KKM1Change
      end
      object LOCAL_PATH: TEdit
        Left = 270
        Top = 198
        Width = 493
        Height = 21
        TabOrder = 8
        Text = 'LOCAL_PATH'
        OnChange = LOCAL_PATHChange
      end
      object GLOBAL_PATH: TEdit
        Left = 270
        Top = 220
        Width = 493
        Height = 21
        TabOrder = 9
        Text = 'GLOBAL_PATH'
        OnChange = GLOBAL_PATHChange
      end
      object TMP_PATH: TEdit
        Left = 270
        Top = 242
        Width = 493
        Height = 21
        TabOrder = 10
        Text = 'TMP_PATH'
        OnChange = TMP_PATHChange
      end
      object KKM_ONLINE: TEdit
        Left = 270
        Top = 176
        Width = 133
        Height = 21
        TabOrder = 11
        Text = 'KKM_ONLINE'
        OnChange = KKM_ONLINEChange
      end
      object RNTYP_KKM: TRxDBLookupCombo
        Left = 270
        Top = 154
        Width = 491
        Height = 21
        DropDownCount = 8
        LookupField = 'RNTYP_ID'
        LookupDisplay = 'RNTYP_FULL'
        LookupSource = DsRNTYP
        TabOrder = 12
        OnChange = RNTYP_KKMChange
      end
      object KKM_SHOP: TComboBox
        Left = 270
        Top = 264
        Width = 209
        Height = 21
        ItemHeight = 13
        TabOrder = 13
        Text = 'KKM_SHOP'
        OnChange = KKM_SHOPChange
        Items.Strings = (
          'АМС-100Ф'
          'Элвес Мини-ФР-Ф'
          'АМС-200Ф')
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Информация на гарантийном талоне'
      ImageIndex = 5
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 213
        Height = 468
        Align = alLeft
        BevelOuter = bvLowered
        Caption = 'Panel2'
        Color = 14548223
        TabOrder = 0
        object Image3: TImage
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
        object RichEdit3: TRichEdit
          Left = 20
          Top = 1
          Width = 192
          Height = 466
          TabStop = False
          Align = alRight
          Alignment = taCenter
          BorderStyle = bsNone
          Color = 14548223
          Lines.Strings = (
            'Здесь вы можете изменить текст, '
            'который отображается на '
            'гарнтийном талоне при его печати. '
            'Объём этого текста ограничен '
            '10000 '
            'символами, что составляет '
            'примерно около 5 страниц.')
          MaxLength = 10000
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object GARANT_TEXT: TMemo
        Left = 213
        Top = 0
        Width = 627
        Height = 468
        Align = alClient
        Lines.Strings = (
          'ST_TEXT')
        TabOrder = 1
        OnChange = ST_TEXTChange
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Подробные данные о товаре на складах'
      ImageIndex = 6
      object GroupBox1: TGroupBox
        Left = 4
        Top = 4
        Width = 185
        Height = 297
        Caption = ' Справочник товаров '
        TabOrder = 0
        object Speed1_1: TCheckBox
          Left = 8
          Top = 20
          Width = 137
          Height = 17
          Caption = 'Остатки хорошего'
          TabOrder = 0
          OnClick = Speed1_1Click
        end
        object Speed1_2: TCheckBox
          Left = 8
          Top = 44
          Width = 97
          Height = 17
          Caption = 'Остатки брака'
          TabOrder = 1
          OnClick = Speed1_1Click
        end
        object Speed1_3: TCheckBox
          Left = 8
          Top = 68
          Width = 109
          Height = 17
          Caption = 'Неотгруженных'
          TabOrder = 2
          OnClick = Speed1_1Click
        end
        object Speed1_4: TCheckBox
          Left = 8
          Top = 92
          Width = 97
          Height = 17
          Caption = 'Неполученных'
          TabOrder = 3
          OnClick = Speed1_1Click
        end
        object Speed1_5: TCheckBox
          Left = 8
          Top = 116
          Width = 113
          Height = 17
          Caption = 'Скорость продаж'
          TabOrder = 4
          OnClick = Speed1_1Click
        end
        object Speed1_6: TCheckBox
          Left = 8
          Top = 140
          Width = 169
          Height = 17
          Caption = 'Заказано в перемещениях'
          TabOrder = 5
          OnClick = Speed1_1Click
        end
      end
      object GroupBox2: TGroupBox
        Left = 204
        Top = 4
        Width = 185
        Height = 297
        Caption = 'Заявки на закупку'
        TabOrder = 1
        object Speed2_1: TCheckBox
          Left = 8
          Top = 20
          Width = 137
          Height = 17
          Caption = 'Остатки хорошего'
          TabOrder = 0
          OnClick = Speed1_1Click
        end
        object Speed2_2: TCheckBox
          Left = 8
          Top = 44
          Width = 97
          Height = 17
          Caption = 'Остатки брака'
          TabOrder = 1
          OnClick = Speed1_1Click
        end
        object Speed2_3: TCheckBox
          Left = 8
          Top = 68
          Width = 109
          Height = 17
          Caption = 'Неотгруженных'
          TabOrder = 2
          OnClick = Speed1_1Click
        end
        object Speed2_4: TCheckBox
          Left = 8
          Top = 92
          Width = 97
          Height = 17
          Caption = 'Неполученных'
          TabOrder = 3
          OnClick = Speed1_1Click
        end
        object Speed2_5: TCheckBox
          Left = 8
          Top = 116
          Width = 113
          Height = 17
          Caption = 'Скорость продаж'
          TabOrder = 4
          OnClick = Speed1_1Click
        end
        object Speed2_6: TCheckBox
          Left = 8
          Top = 140
          Width = 169
          Height = 17
          Caption = 'Заказано в перемещениях'
          TabOrder = 5
          OnClick = Speed1_1Click
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'По умолчанию...'
      ImageIndex = 8
      object Bevel20: TBevel
        Left = 0
        Top = 236
        Width = 269
        Height = 21
      end
      object Bevel19: TBevel
        Left = 0
        Top = 212
        Width = 269
        Height = 21
      end
      object Bevel18: TBevel
        Left = 0
        Top = 188
        Width = 173
        Height = 21
      end
      object Bevel17: TBevel
        Left = 0
        Top = 164
        Width = 173
        Height = 21
      end
      object Label29: TLabel
        Left = 4
        Top = 4
        Width = 66
        Height = 13
        Caption = 'Новый товар'
      end
      object Bevel10: TBevel
        Left = 62
        Top = 20
        Width = 9
        Height = 53
        Shape = bsLeftLine
      end
      object Bevel11: TBevel
        Left = 63
        Top = 10
        Width = 17
        Height = 20
        Shape = bsBottomLine
      end
      object Label30: TLabel
        Left = 76
        Top = 22
        Width = 45
        Height = 13
        Caption = ' Ед. изм.'
      end
      object Bevel12: TBevel
        Left = 63
        Top = 32
        Width = 17
        Height = 20
        Shape = bsBottomLine
      end
      object Bevel13: TBevel
        Left = 63
        Top = 54
        Width = 17
        Height = 20
        Shape = bsBottomLine
      end
      object Label31: TLabel
        Left = 76
        Top = 44
        Width = 56
        Height = 13
        Caption = ' Категория'
      end
      object Label32: TLabel
        Left = 76
        Top = 66
        Width = 41
        Height = 13
        Caption = ' Валюта'
      end
      object Bevel9: TBevel
        Left = 0
        Top = 2
        Width = 73
        Height = 17
      end
      object Label33: TLabel
        Left = 4
        Top = 94
        Width = 194
        Height = 13
        Caption = 'Имя главного компьютера (сервера) :'
      end
      object Bevel14: TBevel
        Left = 0
        Top = 92
        Width = 205
        Height = 17
      end
      object Bevel15: TBevel
        Left = 0
        Top = 116
        Width = 193
        Height = 21
      end
      object Label34: TLabel
        Left = 4
        Top = 120
        Width = 183
        Height = 13
        Caption = 'Менеджер в приходных накладных :'
      end
      object Bevel16: TBevel
        Left = 0
        Top = 140
        Width = 173
        Height = 21
      end
      object Label35: TLabel
        Left = 4
        Top = 144
        Width = 162
        Height = 13
        Caption = 'Менеджер в актах переоценки :'
      end
      object Label37: TLabel
        Left = 28
        Top = 168
        Width = 140
        Height = 13
        Caption = 'Вид приходных накладных :'
      end
      object Label38: TLabel
        Left = 28
        Top = 192
        Width = 140
        Height = 13
        Caption = 'Вид расходных накладных :'
      end
      object Label40: TLabel
        Left = 4
        Top = 216
        Width = 261
        Height = 13
        Caption = 'Категория доступа при создании нового контакта :'
      end
      object Label41: TLabel
        Left = 2
        Top = 240
        Width = 264
        Height = 13
        Caption = 'Каталог клиентов для создания пластиковых карт :'
      end
      object Bevel21: TBevel
        Left = 0
        Top = 260
        Width = 269
        Height = 21
      end
      object Label63: TLabel
        Left = 66
        Top = 264
        Width = 199
        Height = 13
        Caption = 'Вид приходной,"возврат поставщику" :'
      end
      object Bevel22: TBevel
        Left = 0
        Top = 284
        Width = 269
        Height = 23
      end
      object Label64: TLabel
        Left = 12
        Top = 290
        Width = 210
        Height = 13
        Caption = 'Вид расходной "возврат от покупателя" :'
      end
      object Label59: TLabel
        Left = 12
        Top = 314
        Width = 140
        Height = 13
        Caption = 'Экспедитор по умолчанию :'
      end
      object TWED: TRxDBLookupCombo
        Left = 138
        Top = 20
        Width = 145
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'ED_ID'
        LookupDisplay = 'ED_FULL'
        LookupSource = DsED
        TabOrder = 0
        OnChange = TWVALUTAChange
      end
      object TWKTG: TRxDBLookupCombo
        Left = 138
        Top = 40
        Width = 145
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'TWKTG_ID'
        LookupDisplay = 'TWKTG_NAM'
        LookupSource = DsTWKTG
        TabOrder = 1
        OnChange = TWVALUTAChange
      end
      object TWVALUTA: TRxDBLookupCombo
        Left = 138
        Top = 62
        Width = 145
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'VALUTA_ID'
        LookupDisplay = 'VALUTA_FULL'
        LookupSource = DsVALUTA
        TabOrder = 2
        OnChange = TWVALUTAChange
      end
      object SERVER_NAME: TEdit
        Left = 210
        Top = 90
        Width = 121
        Height = 21
        MaxLength = 128
        TabOrder = 3
        OnChange = SERVER_NAMEChange
      end
      object OWNER_PN: TRxDBLookupCombo
        Left = 196
        Top = 116
        Width = 273
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'OWNER_ID'
        LookupDisplay = 'OWNER_NAME'
        LookupSource = DsOwner
        TabOrder = 4
        OnChange = OWNER_REMONChange
      end
      object OWNER_REMON: TRxDBLookupCombo
        Left = 176
        Top = 140
        Width = 293
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'OWNER_ID'
        LookupDisplay = 'OWNER_NAME'
        LookupSource = DsOwner
        TabOrder = 5
        OnChange = OWNER_REMONChange
      end
      object PNVID: TRxDBLookupCombo
        Left = 176
        Top = 164
        Width = 293
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'PNVID_ID'
        LookupDisplay = 'PNVID_NAM'
        LookupSource = DsPNVID
        TabOrder = 6
        OnChange = OWNER_REMONChange
      end
      object RNVID: TRxDBLookupCombo
        Left = 176
        Top = 188
        Width = 293
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'RNVID_ID'
        LookupDisplay = 'RNVID_NAM'
        LookupSource = DsRNVID
        TabOrder = 7
        OnChange = OWNER_REMONChange
      end
      object USGROUP: TRxDBLookupCombo
        Left = 272
        Top = 212
        Width = 433
        Height = 21
        DropDownCount = 8
        LookupField = 'USGROUP_ID'
        LookupDisplay = 'USGROUP_NAME'
        LookupSource = DsUsgroup
        TabOrder = 8
      end
      object Edit10: TEdit
        Left = 272
        Top = 236
        Width = 433
        Height = 21
        TabOrder = 9
        Text = 'Edit10'
      end
      object PNVID_WOZW: TRxDBLookupCombo
        Left = 272
        Top = 260
        Width = 433
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'PNVID_ID'
        LookupDisplay = 'PNVID_NAM'
        LookupSource = DataModule1.MainDsPnvid
        TabOrder = 10
      end
      object RNVID_WOZW: TRxDBLookupCombo
        Left = 272
        Top = 284
        Width = 433
        Height = 21
        DropDownCount = 8
        EscapeClear = False
        LookupField = 'RNVID_ID'
        LookupDisplay = 'RNVID_NAM'
        LookupSource = DataModule1.MainDsRnVid
        TabOrder = 11
      end
      object DefExpeditor: TRxLookupEdit
        Left = 272
        Top = 304
        Width = 433
        Height = 21
        LookupDisplay = 'CFG_VALUE'
        LookupField = 'CFG_ID'
        LookupSource = DataSource1
        TabOrder = 12
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'E-mail и экспорт'
      ImageIndex = 9
      object Label43: TLabel
        Left = 67
        Top = 10
        Width = 220
        Height = 13
        Caption = 'Имя хоста для отправки E-mail сообшений :'
      end
      object Label48: TLabel
        Left = 121
        Top = 80
        Width = 166
        Height = 13
        Caption = 'Адрес для утверждения заявок :'
      end
      object Label45: TLabel
        Left = 118
        Top = 106
        Width = 169
        Height = 13
        Caption = 'Адрес для "неизвестной" почты :'
      end
      object Label46: TLabel
        Left = 74
        Top = 130
        Width = 211
        Height = 13
        Caption = 'Адрес посылки ответов об утверждении :'
      end
      object Label47: TLabel
        Left = 104
        Top = 152
        Width = 180
        Height = 13
        Caption = 'Адрес посылки ответов об отказе :'
      end
      object Label49: TLabel
        Left = 158
        Top = 202
        Width = 129
        Height = 13
        Caption = 'Обратный адрес заявок :'
      end
      object Label50: TLabel
        Left = 39
        Top = 250
        Width = 248
        Height = 13
        Caption = 'На утверждение по e-mail отправлять заявки от :'
      end
      object Label51: TLabel
        Left = 418
        Top = 250
        Width = 6
        Height = 13
        Caption = 'и'
      end
      object Label52: TLabel
        Left = 122
        Top = 226
        Width = 165
        Height = 13
        Caption = 'Отправитель заявок (не адрес) :'
      end
      object Label54: TLabel
        Left = 2
        Top = 296
        Width = 285
        Height = 13
        Caption = 'Выгружать заявки на закупку, измененные, начиная с :'
      end
      object Label55: TLabel
        Left = 44
        Top = 320
        Width = 243
        Height = 13
        Caption = 'Средний процент наценки в заявке считать за :'
      end
      object Label56: TLabel
        Left = 418
        Top = 320
        Width = 44
        Height = 13
        Caption = 'месяцев'
      end
      object Label57: TLabel
        Left = 10
        Top = 342
        Width = 277
        Height = 13
        Caption = 'Выделять цветом средний % наценки, если он менее :'
      end
      object Label58: TLabel
        Left = 418
        Top = 342
        Width = 53
        Height = 13
        Caption = 'процентов'
      end
      object Label44: TLabel
        Left = 44
        Top = 176
        Width = 244
        Height = 13
        Caption = 'Адрес для перепосылки утвержденных заявок :'
      end
      object Label68: TLabel
        Left = 232
        Top = 36
        Width = 43
        Height = 13
        Caption = 'Фирма :'
      end
      object EMAIL_HOST: TEdit
        Left = 292
        Top = 6
        Width = 333
        Height = 21
        MaxLength = 254
        TabOrder = 0
        Text = 'EMAIL_HOST'
      end
      object UTW_EMAIL: TEdit
        Left = 292
        Top = 78
        Width = 455
        Height = 21
        TabOrder = 1
        Text = 'UTW_EMAIL'
      end
      object NO_EMAIL: TEdit
        Left = 292
        Top = 102
        Width = 255
        Height = 21
        MaxLength = 254
        TabOrder = 2
        Text = 'NO_EMAIL'
        OnChange = NO_EMAILChange
      end
      object OK_EMAIL: TEdit
        Left = 292
        Top = 126
        Width = 453
        Height = 21
        TabOrder = 3
        Text = 'OK_EMAIL'
      end
      object NOOK_EMAIL: TEdit
        Left = 292
        Top = 150
        Width = 453
        Height = 21
        TabOrder = 4
        Text = 'NOOK_EMAIL'
      end
      object HOME_EMAIL: TEdit
        Left = 292
        Top = 198
        Width = 451
        Height = 21
        TabOrder = 5
        Text = 'HOME_EMAIL'
      end
      object EMAIL_RUB: TRxCalcEdit
        Left = 292
        Top = 246
        Width = 121
        Height = 21
        AutoSize = False
        DisplayFormat = ',#0 руб'
        NumGlyphs = 2
        TabOrder = 6
      end
      object EMAIL_DOLLAR: TRxCalcEdit
        Left = 434
        Top = 246
        Width = 121
        Height = 21
        AutoSize = False
        DisplayFormat = ',#0 $'
        NumGlyphs = 2
        TabOrder = 7
      end
      object TITLE_EMAIL: TEdit
        Left = 292
        Top = 222
        Width = 451
        Height = 21
        TabOrder = 8
        Text = 'TITLE_EMAIL'
      end
      object DATE_EXP2: TDateEdit
        Left = 292
        Top = 292
        Width = 121
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 9
      end
      object TIME_EXP2: TEdit
        Left = 416
        Top = 292
        Width = 63
        Height = 21
        Enabled = False
        TabOrder = 10
        Text = 'TIME_EXP2'
      end
      object ZAY_MES: TRxSpinEdit
        Left = 292
        Top = 316
        Width = 121
        Height = 21
        Alignment = taRightJustify
        MaxValue = 24
        MinValue = 1
        TabOrder = 11
      end
      object ZAY_PERCENT_WARNING: TRxSpinEdit
        Left = 292
        Top = 338
        Width = 121
        Height = 21
        Alignment = taRightJustify
        MaxValue = 100
        TabOrder = 12
      end
      object IS_EMAIL: TCheckBox
        Left = 80
        Top = 362
        Width = 225
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Требовать указания E-mail у персонала :'
        TabOrder = 13
      end
      object REPEAT_EMAIL: TEdit
        Left = 292
        Top = 174
        Width = 453
        Height = 21
        TabOrder = 14
        Text = 'REPEAT_EMAIL'
      end
      object FRM: TRxDBLookupCombo
        Left = 292
        Top = 32
        Width = 285
        Height = 21
        DropDownCount = 8
        LookupField = 'KLN_ID'
        LookupDisplay = 'F_1'
        LookupSource = DataSource2
        TabOrder = 15
        OnChange = FRMChange
      end
    end
  end
  object SetTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 404
    Top = 513
  end
  object SetQuery: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 204
    Top = 501
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 324
    Top = 514
  end
  object QrSHOP: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from SHOP order by SHOP_OFFICE, SHOP_NAME')
    Left = 752
    Top = 640
    object QrSHOPSHOP_ID: TIntegerField
      FieldName = 'SHOP_ID'
      Required = True
    end
    object QrSHOPSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Required = True
      Size = 254
    end
    object QrSHOPSHOP_LAST: TDateTimeField
      FieldName = 'SHOP_LAST'
    end
    object QrSHOPSHOP_OFFICE: TIBStringField
      FieldName = 'SHOP_OFFICE'
      Required = True
      Size = 1
    end
    object QrSHOPSHOP_PREFIX: TIBStringField
      FieldName = 'SHOP_PREFIX'
      Size = 32
    end
    object QrSHOPSHOP_POSTFIX: TIBStringField
      FieldName = 'SHOP_POSTFIX'
      Size = 32
    end
    object QrSHOPSHOP_COLOR: TIntegerField
      FieldName = 'SHOP_COLOR'
    end
  end
  object SetTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 256
    Top = 518
  end
  object DsShop: TDataSource
    DataSet = QrSHOP
    Left = 360
    Top = 563
  end
  object QrSKL: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select SKL_ID,SKL_FULL FROM SKL '
      'where SKL_SPEED>0'
      'ORDER BY SKL_SPEED')
    Left = 700
    Top = 640
    object QrSKLSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Required = True
    end
    object QrSKLSKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Required = True
      Size = 254
    end
  end
  object DsSKL: TDataSource
    DataSet = QrSKL
    Left = 308
    Top = 567
  end
  object QrUsgroup: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select Usgroup_id,usgroup_name from usgroup order by usgroup_nam' +
        'e')
    Left = 644
    Top = 641
    object QrUsgroupUSGROUP_ID: TIntegerField
      FieldName = 'USGROUP_ID'
      Required = True
    end
    object QrUsgroupUSGROUP_NAME: TIBStringField
      FieldName = 'USGROUP_NAME'
      Required = True
      Size = 254
    end
  end
  object DsUsgroup: TDataSource
    DataSet = QrUsgroup
    Left = 252
    Top = 565
  end
  object PopupMenu1: TPopupMenu
    Left = 252
    Top = 637
    object MnSave: TMenuItem
      Caption = 'Сохранить и выйти'
      ShortCut = 16397
      OnClick = BtnSaveClick
    end
    object MnApply: TMenuItem
      Caption = 'Применить'
      OnClick = BtnApplyClick
    end
  end
  object QrVALUTA: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select VALUTA_FULL, VALUTA_ID from VALUTA order by VALUTA_ID')
    Left = 582
    Top = 641
    object QrVALUTAVALUTA_FULL: TIBStringField
      FieldName = 'VALUTA_FULL'
      Required = True
      Size = 254
    end
    object QrVALUTAVALUTA_ID: TIntegerField
      FieldName = 'VALUTA_ID'
      Required = True
    end
  end
  object QrTWKTG: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select twktg_id,twktg_nam from twktg  order by twktg_nam')
    Left = 520
    Top = 641
    object QrTWKTGTWKTG_ID: TIntegerField
      FieldName = 'TWKTG_ID'
      Required = True
    end
    object QrTWKTGTWKTG_NAM: TIBStringField
      FieldName = 'TWKTG_NAM'
      Required = True
      Size = 254
    end
  end
  object QrED: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ed_id,ed_full from ed order by ed_full')
    Left = 470
    Top = 641
    object QrEDED_ID: TIntegerField
      FieldName = 'ED_ID'
      Required = True
    end
    object QrEDED_FULL: TIBStringField
      FieldName = 'ED_FULL'
      Required = True
      Size = 254
    end
  end
  object DsED: TDataSource
    DataSet = QrED
    Left = 78
    Top = 565
  end
  object DsTWKTG: TDataSource
    DataSet = QrTWKTG
    Left = 128
    Top = 567
  end
  object DsVALUTA: TDataSource
    DataSet = QrVALUTA
    Left = 190
    Top = 567
  end
  object QrOwner: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from list_owner'
      'order by owner_name')
    Left = 428
    Top = 641
    object QrOwnerOWNER_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'OWNER_ID'
      ReadOnly = True
    end
    object QrOwnerOWNER_NAME: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'OWNER_NAME'
      ReadOnly = True
      Size = 254
    end
  end
  object DsOwner: TDataSource
    DataSet = QrOwner
    Left = 152
    Top = 469
  end
  object QrRNTYP: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select rntyp_id,rntyp_full'
      'from rntyp'
      'order by rntyp_id')
    Left = 804
    Top = 641
    object QrRNTYPRNTYP_ID: TIntegerField
      FieldName = 'RNTYP_ID'
      Required = True
    end
    object QrRNTYPRNTYP_FULL: TIBStringField
      FieldName = 'RNTYP_FULL'
      Required = True
      Size = 254
    end
  end
  object DsRNTYP: TDataSource
    DataSet = QrRNTYP
    Left = 408
    Top = 565
  end
  object QrRNVID: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from rnvid'
      'order by rnvid_nam')
    Left = 376
    Top = 641
    object QrRNVIDRNVID_ID: TIntegerField
      FieldName = 'RNVID_ID'
      Required = True
    end
    object QrRNVIDRNVID_NAM: TIBStringField
      FieldName = 'RNVID_NAM'
      Required = True
      Size = 64
    end
    object QrRNVIDTM: TDateTimeField
      FieldName = 'TM'
      Required = True
    end
  end
  object QrPNVID: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from pnvid order by pnvid_nam')
    Left = 328
    Top = 641
    object QrPNVIDPNVID_ID: TIntegerField
      FieldName = 'PNVID_ID'
      Required = True
    end
    object QrPNVIDPNVID_NAM: TIBStringField
      FieldName = 'PNVID_NAM'
      Required = True
      Size = 64
    end
    object QrPNVIDPNVID_ACTIV: TIntegerField
      FieldName = 'PNVID_ACTIV'
      Required = True
    end
    object QrPNVIDTM: TDateTimeField
      FieldName = 'TM'
      Required = True
    end
  end
  object DsRNVID: TDataSource
    DataSet = QrRNVID
    Left = 104
    Top = 475
  end
  object DsPNVID: TDataSource
    DataSet = QrPNVID
    Left = 56
    Top = 473
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 36
    Top = 687
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from CFG where CFG_NAME = "EXPEDITOR"')
    Left = 92
    Top = 687
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 140
    Top = 687
  end
  object IBQuery2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 204
    Top = 687
  end
  object DsDopFirm: TDataSource
    AutoEdit = False
    DataSet = QrDopFirm
    Left = 620
    Top = 519
  end
  object QrDopFirm: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransactionDopFirm
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select kln.kln_id,  (select kln_data.kln_full from kln_data(kln.' +
        'kln_id))'
      ' from kln'
      'where kln.kln_frm = 2')
    Left = 676
    Top = 515
    object QrDopFirmKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'KLN.KLN_ID'
      Required = True
    end
    object QrDopFirmF_1: TIBStringField
      DisplayWidth = 120
      FieldName = 'F_1'
      Size = 5000
    end
  end
  object SetTransactionDopFirm: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 772
    Top = 511
  end
  object QrPNTYP: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select pntyp_id,pntyp_full'
      'from pntyp'
      'order by pntyp_id')
    Left = 800
    Top = 585
    object QrPNTYPPNTYP_ID: TIntegerField
      FieldName = 'PNTYP_ID'
      Origin = 'PNTYP.PNTYP_ID'
      Required = True
    end
    object QrPNTYPPNTYP_FULL: TIBStringField
      FieldName = 'PNTYP_FULL'
      Origin = 'PNTYP.PNTYP_FULL'
      Required = True
      Size = 254
    end
  end
  object DsPnTYP: TDataSource
    DataSet = QrPNTYP
    Left = 752
    Top = 591
  end
  object IBQuery_frm: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SetTransactionDopFirm
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select kln_id, (select kln_full from kln_data(kln.kln_id)) from ' +
        'kln where kln_frm =3')
    Left = 652
    Top = 91
    object IBQuery_frmKLN_ID: TIntegerField
      FieldName = 'KLN_ID'
      Origin = 'KLN.KLN_ID'
      Required = True
    end
    object IBQuery_frmF_1: TIBStringField
      FieldName = 'F_1'
      Size = 5000
    end
  end
  object DataSource2: TDataSource
    DataSet = IBQuery_frm
    Left = 708
    Top = 91
  end
end
