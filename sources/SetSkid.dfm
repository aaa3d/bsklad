object Set_Skid: TSet_Skid
  Left = 143
  Top = 150
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Определение скидки'
  ClientHeight = 139
  ClientWidth = 397
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
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 12
    Width = 82
    Height = 13
    Alignment = taRightJustify
    Caption = 'Исходная цена :'
  end
  object Label2: TLabel
    Left = 41
    Top = 36
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = 'Новая цена :'
  end
  object Label3: TLabel
    Left = 18
    Top = 60
    Width = 88
    Height = 13
    Alignment = taRightJustify
    Caption = 'Процент скидки :'
  end
  object Image1: TImage
    Left = 0
    Top = 94
    Width = 17
    Height = 19
    Hint = 
      'Данная форма соответствует требованиям программ,'#13#10'созданным с ло' +
      'готипом Beginner(R)'
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
    Visible = False
  end
  object Label4: TLabel
    Left = 32
    Top = 84
    Width = 74
    Height = 13
    Caption = 'Обоснование :'
  end
  object MONEY1: TRxCalcEdit
    Left = 112
    Top = 8
    Width = 173
    Height = 21
    AutoSize = False
    DecimalPlaces = 20
    DisplayFormat = ',0.00 руб'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 0
  end
  object MONEY2: TRxCalcEdit
    Left = 112
    Top = 32
    Width = 173
    Height = 21
    AutoSize = False
    DecimalPlaces = 20
    DisplayFormat = ',0.00 руб'
    NumGlyphs = 2
    TabOrder = 1
    OnChange = MONEY2Change
    OnKeyPress = MONEY2KeyPress
  end
  object BtnApply: TButton
    Left = 236
    Top = 108
    Width = 75
    Height = 25
    Caption = 'Принять'
    TabOrder = 4
    OnClick = BtnApplyClick
  end
  object Button2: TButton
    Left = 316
    Top = 108
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 5
    OnClick = Button2Click
  end
  object SKID: TRxCalcEdit
    Left = 112
    Top = 56
    Width = 173
    Height = 21
    AutoSize = False
    DecimalPlaces = 100
    DisplayFormat = '#0.000000000000000000000'
    Enabled = False
    ButtonWidth = 0
    NumGlyphs = 2
    TabOrder = 2
  end
  object OSN: TEdit
    Left = 112
    Top = 80
    Width = 281
    Height = 21
    MaxLength = 254
    TabOrder = 3
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 20
    Top = 48
  end
end
