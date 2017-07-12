object Edit_USGROUP: TEdit_USGROUP
  Left = 230
  Top = 346
  BorderStyle = bsSingle
  Caption = 'Вид доступа'
  ClientHeight = 119
  ClientWidth = 543
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 36
    Width = 125
    Height = 13
    Caption = 'Наименование доступа :'
  end
  object Label2: TLabel
    Left = 56
    Top = 64
    Width = 69
    Height = 13
    Caption = 'Примечание :'
  end
  object Image3: TImage
    Left = 1
    Top = 71
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
  object Label3: TLabel
    Left = 80
    Top = 88
    Width = 41
    Height = 13
    Caption = 'Период:'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 543
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnSAVE: TToolButton
      Left = 0
      Top = 2
      Caption = 'BtnSAVE'
      ImageIndex = 39
      OnClick = BtnSAVEClick
    end
    object BtnApply: TToolButton
      Left = 25
      Top = 2
      Caption = 'BtnApply'
      ImageIndex = 38
      OnClick = BtnApplyClick
    end
    object ToolButton1: TToolButton
      Left = 50
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 39
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 58
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton2'
      ImageIndex = 110
      OnClick = ToolButton2Click
    end
  end
  object USGROUP_NAME: TEdit
    Left = 132
    Top = 36
    Width = 401
    Height = 21
    MaxLength = 254
    TabOrder = 1
    Text = 'USGROUP_NAME'
    OnChange = USGROUP_NAMEChange
  end
  object USGROUP_PRIM: TEdit
    Left = 132
    Top = 60
    Width = 401
    Height = 21
    MaxLength = 254
    TabOrder = 2
    OnChange = USGROUP_NAMEChange
  end
  object CLOSE_PER: TRxSpinEdit
    Left = 132
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 404
    Top = 14
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 324
    Top = 10
  end
  object PopupMenu1: TPopupMenu
    Left = 132
    Top = 14
    object MnSave: TMenuItem
      Caption = 'Сохранить и выйти'
      ShortCut = 16397
      OnClick = BtnSAVEClick
    end
    object MnApply: TMenuItem
      Caption = 'Применить'
      OnClick = BtnApplyClick
    end
  end
  object DualList: TDualListDialog
    Sorted = False
    HelpContext = 0
    Left = 232
    Top = 18
  end
end
