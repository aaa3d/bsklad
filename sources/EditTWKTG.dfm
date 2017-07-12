object Edit_TWKTG: TEdit_TWKTG
  Left = 172
  Top = 263
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Категория товара'
  ClientHeight = 117
  ClientWidth = 555
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 40
    Width = 137
    Height = 13
    Caption = 'Наименование категории :'
  end
  object Label2: TLabel
    Left = 128
    Top = 88
    Width = 31
    Height = 13
    Caption = 'Цвет :'
  end
  object Shape1: TShape
    Left = 356
    Top = 84
    Width = 89
    Height = 21
    Visible = False
  end
  object Label3: TLabel
    Left = 4
    Top = 64
    Width = 157
    Height = 13
    Caption = 'Доп. информация на ценнике :'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 555
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
    object BtnAPPLY: TToolButton
      Left = 25
      Top = 2
      Caption = 'BtnAPPLY'
      ImageIndex = 38
      OnClick = BtnAPPLYClick
    end
  end
  object Color1: TRadioButton
    Left = 168
    Top = 88
    Width = 113
    Height = 17
    Caption = 'По умолчанию'
    Checked = True
    TabOrder = 3
    TabStop = True
    OnClick = Color1Click
  end
  object Color2: TRadioButton
    Left = 288
    Top = 88
    Width = 65
    Height = 17
    Caption = 'Другой :'
    TabOrder = 4
    OnClick = Color1Click
  end
  object TWKTG_NAM: TEdit
    Left = 168
    Top = 36
    Width = 381
    Height = 21
    MaxLength = 254
    TabOrder = 1
    Text = 'TWKTG_NAM'
    OnChange = TWKTG_NAMChange
  end
  object BtnColor: TBitBtn
    Left = 444
    Top = 84
    Width = 25
    Height = 21
    Caption = '...'
    TabOrder = 5
    OnClick = BtnColorClick
  end
  object TWKTG_PRIM: TEdit
    Left = 168
    Top = 60
    Width = 381
    Height = 21
    MaxLength = 252
    TabOrder = 2
    Text = 'TWKTG_PRIM'
  end
  object PopupMenu1: TPopupMenu
    Left = 204
    Top = 8
    object MnSAVE: TMenuItem
      Caption = 'Сохранить'
      ShortCut = 16397
      OnClick = BtnSAVEClick
    end
    object N1: TMenuItem
      Caption = 'Применить'
      OnClick = BtnAPPLYClick
    end
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 256
    Top = 8
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 420
    Top = 2
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 356
    Top = 2
  end
end
