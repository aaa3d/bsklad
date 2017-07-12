object Date_Interval: TDate_Interval
  Left = 189
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Установить интервал дат в журнале'
  ClientHeight = 82
  ClientWidth = 453
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 28
    Top = 8
    Width = 12
    Height = 13
    Caption = 'с :'
  end
  object Image1: TImage
    Left = 0
    Top = 4
    Width = 17
    Height = 17
    AutoSize = True
    Picture.Data = {
      07544269746D617042010000424D420100000000000076000000280000001100
      0000110000000100040000000000CC0000000000000000000000100000001000
      0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
      C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00777777777777777770000000777777000007777770000000777700FBFBF0
      0777700000007770BFBFBFBFB07770000000770BFBFBFBFBFB0770000000770F
      B0BFBFBFBF077000000070FBFB0BFBFBFBF07000000070BFBFB0BFBFBFB07000
      000070FBFBFB000000F07000000070BFBFBFBFBFBFB07000000070FBFBFBFBFB
      FBF070000000770FBFBFBFBFBF0770000000770BFBFBFBFBFB07700000007770
      BFBF0FBFB07770000000777700FBFBF007777000000077777700000777777000
      0000777777777777777770000000}
    Stretch = True
    Transparent = True
  end
  object Label2: TLabel
    Left = 184
    Top = 8
    Width = 18
    Height = 13
    Caption = 'по :'
  end
  object Image3: TImage
    Left = 0
    Top = 65
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
  object DT1: TDateEdit
    Left = 52
    Top = 4
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 0
  end
  object DT2: TDateEdit
    Left = 212
    Top = 4
    Width = 121
    Height = 21
    NumGlyphs = 2
    TabOrder = 1
    OnKeyPress = DT2KeyPress
  end
  object BtnSet: TButton
    Left = 376
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Установить'
    TabOrder = 2
    OnClick = BtnSetClick
  end
  object BtnClose: TButton
    Left = 376
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 3
    OnClick = BtnCloseClick
  end
  object Button1: TButton
    Left = 52
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Эта неделя'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 28
    Width = 101
    Height = 25
    Caption = 'Прошлая неделя'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 52
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Этот месяц'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 128
    Top = 54
    Width = 101
    Height = 25
    Caption = 'Прошлый месяц'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 230
    Top = 28
    Width = 129
    Height = 25
    Caption = 'Эта и прошлая недели'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 230
    Top = 54
    Width = 129
    Height = 25
    Caption = 'Этот и прошлый месяц'
    TabOrder = 9
    OnClick = Button6Click
  end
end
