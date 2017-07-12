object ZP_WIZARD: TZP_WIZARD
  Left = 118
  Top = 150
  Width = 696
  Height = 480
  Caption = 'ZP_WIZARD'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 0
    object TabSheet3: TTabSheet
      Caption = 'Сумма для расчета'
      ImageIndex = 2
      object RadioButton5: TRadioButton
        Left = 6
        Top = 10
        Width = 221
        Height = 17
        Caption = 'Выручка реализованного товара'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton6: TRadioButton
        Left = 6
        Top = 32
        Width = 203
        Height = 17
        Caption = 'Наценка реализованного товара'
        TabOrder = 1
      end
      object RadioButton7: TRadioButton
        Left = 6
        Top = 56
        Width = 235
        Height = 17
        Caption = 'Себестоимость реализованного товара'
        TabOrder = 2
      end
      object RadioButton8: TRadioButton
        Left = 6
        Top = 80
        Width = 207
        Height = 17
        Caption = 'Остаток товара в розничных ценах'
        TabOrder = 3
      end
      object RadioButton9: TRadioButton
        Left = 6
        Top = 102
        Width = 245
        Height = 17
        Caption = 'Остаток товара по сумме себестоимости'
        TabOrder = 4
      end
      object RadioButton10: TRadioButton
        Left = 6
        Top = 126
        Width = 157
        Height = 17
        Caption = 'Остаток товара по НДС'
        TabOrder = 5
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Период расчета'
      ImageIndex = 3
      object Label1: TLabel
        Left = 16
        Top = 20
        Width = 67
        Height = 13
        Caption = 'За период с :'
      end
      object Label2: TLabel
        Left = 188
        Top = 22
        Width = 18
        Height = 13
        Caption = 'по :'
      end
      object Label3: TLabel
        Left = 12
        Top = 202
        Width = 20
        Height = 13
        Caption = 'На :'
      end
      object Panel1: TPanel
        Left = 38
        Top = 198
        Width = 367
        Height = 195
        TabOrder = 0
        object RadioButton1: TRadioButton
          Left = 8
          Top = 10
          Width = 161
          Height = 17
          Caption = 'конец расчетного месяца'
          TabOrder = 0
        end
        object RadioButton2: TRadioButton
          Left = 8
          Top = 34
          Width = 177
          Height = 17
          Caption = 'Начало расчетного периода'
          TabOrder = 1
        end
        object RadioButton3: TRadioButton
          Left = 8
          Top = 58
          Width = 135
          Height = 17
          Caption = 'Определенную дату :'
          TabOrder = 2
        end
        object DateEdit1: TDateEdit
          Left = 146
          Top = 56
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 3
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'TabSheet5'
      ImageIndex = 4
    end
    object TabSheet6: TTabSheet
      Caption = 'TabSheet6'
      ImageIndex = 5
    end
    object TabSheet7: TTabSheet
      Caption = 'TabSheet7'
      ImageIndex = 6
    end
    object TabSheet8: TTabSheet
      Caption = 'TabSheet8'
      ImageIndex = 7
    end
    object TabSheet9: TTabSheet
      Caption = 'TabSheet9'
      ImageIndex = 8
    end
  end
end
