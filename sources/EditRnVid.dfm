object Edit_RnVid: TEdit_RnVid
  Left = 6
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Вид расходной накладной'
  ClientHeight = 89
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 5
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Название :'
  end
  object Image3: TImage
    Left = 0
    Top = 58
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
  object RNVID_NAM: TEdit
    Left = 68
    Top = 4
    Width = 341
    Height = 21
    MaxLength = 254
    TabOrder = 0
    Text = 'RNVID_NAM'
    OnChange = RNVID_NAMChange
  end
  object BtnSave: TButton
    Left = 420
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 1
    OnClick = BtnSaveClick
  end
  object BtnApply: TButton
    Left = 420
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Применить'
    TabOrder = 2
    OnClick = BtnApplyClick
  end
  object BtnClose: TButton
    Left = 420
    Top = 60
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 3
    OnClick = BtnCloseClick
  end
  object RnVidTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 276
    Top = 8
  end
  object QueryRnVid: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = RnVidTransaction
    CachedUpdates = False
    Left = 360
    Top = 8
  end
end
