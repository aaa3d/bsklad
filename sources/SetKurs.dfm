object SET_KURS: TSET_KURS
  Left = 311
  Top = 279
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Изменение курса'
  ClientHeight = 93
  ClientWidth = 422
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
    Left = 8
    Top = 44
    Width = 70
    Height = 13
    Caption = 'Старый курс :'
  end
  object Label2: TLabel
    Left = 12
    Top = 72
    Width = 66
    Height = 13
    Caption = 'Новый курс :'
  end
  object Label3: TLabel
    Left = 4
    Top = 8
    Width = 57
    Height = 13
    Caption = 'Вид курса :'
  end
  object Image3: TImage
    Left = 402
    Top = 29
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
  object OLD_KURS: TRxCalcEdit
    Left = 88
    Top = 40
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',#0.0000'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 1
  end
  object NEW_KURS: TRxCalcEdit
    Left = 88
    Top = 68
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = ',#0.0000'
    NumGlyphs = 2
    TabOrder = 2
  end
  object BTN_SAVE: TButton
    Left = 264
    Top = 64
    Width = 75
    Height = 25
    Hint = 'Ctrl+Enter'
    Caption = 'Установить'
    TabOrder = 3
    OnClick = BTN_SAVEClick
  end
  object Btn_Cancel: TButton
    Left = 344
    Top = 64
    Width = 75
    Height = 25
    Hint = 'ESC'
    Caption = 'Отмена'
    TabOrder = 4
    OnClick = Btn_CancelClick
  end
  object Edit1: TEdit
    Left = 68
    Top = 4
    Width = 349
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'Edit1'
  end
end
