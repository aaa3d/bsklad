object Form1: TForm1
  Left = 261
  Top = 183
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  ClientHeight = 440
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 8
    Width = 457
    Height = 50
    Shape = bsFrame
  end
  object XProgress: TGauge
    Left = 16
    Top = 352
    Width = 281
    Height = 17
    ForeColor = clBlue
    Progress = 0
    Visible = False
  end
  object OutCheckButton: TButton
    Left = 16
    Top = 72
    Width = 137
    Height = 33
    Caption = 'OutCheck'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = OutCheckButtonClick
  end
  object ReturnPButton: TButton
    Left = 16
    Top = 112
    Width = 137
    Height = 33
    Caption = 'ReturnP'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ReturnPButtonClick
  end
  object ExitButton: TButton
    Left = 16
    Top = 400
    Width = 97
    Height = 33
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = ExitButtonClick
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 24
    Width = 49
    Height = 17
    Caption = 'COM1'
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 96
    Top = 24
    Width = 49
    Height = 17
    Caption = 'COM2'
    TabOrder = 4
  end
  object ListBox1: TListBox
    Left = 304
    Top = 152
    Width = 249
    Height = 281
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 14
    ParentFont = False
    TabOrder = 5
  end
  object GetStatistButton: TButton
    Left = 304
    Top = 72
    Width = 249
    Height = 33
    Caption = 'GetStatist'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = GetStatistButtonClick
  end
  object InitPortButton: TButton
    Left = 168
    Top = 16
    Width = 297
    Height = 33
    Caption = 'InitPort'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
    OnClick = InitPortButtonClick
  end
  object GetKLNumberButton: TButton
    Left = 160
    Top = 152
    Width = 137
    Height = 33
    Caption = 'GetKLNumber'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = GetKLNumberButtonClick
  end
  object BlockKKMButton: TButton
    Left = 160
    Top = 72
    Width = 137
    Height = 33
    Caption = 'BlockKKM'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = BlockKKMButtonClick
  end
  object UnBlockKKMButton: TButton
    Left = 160
    Top = 112
    Width = 137
    Height = 33
    Caption = 'UnBlockKKM'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = UnBlockKKMButtonClick
  end
  object OutCheck_DBFButton: TButton
    Left = 16
    Top = 192
    Width = 137
    Height = 33
    Caption = 'OutCheck_DBF'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = OutCheck_DBFButtonClick
  end
  object ReturnP_DBFButton: TButton
    Left = 16
    Top = 232
    Width = 137
    Height = 33
    Caption = 'ReturnP_DBF'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = ReturnP_DBFButtonClick
  end
  object OutBezNalButton: TButton
    Left = 16
    Top = 152
    Width = 137
    Height = 33
    Caption = 'OutBezNal'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = Button10Click
  end
  object OutBezNal_DBFButton: TButton
    Left = 16
    Top = 272
    Width = 137
    Height = 33
    Caption = 'OutBezNal_DBF'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = OutBezNal_DBFButtonClick
  end
  object GetKKMNumButton: TButton
    Left = 160
    Top = 192
    Width = 137
    Height = 33
    Caption = 'GetKkmNumber'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = GetKKMNumButtonClick
  end
  object GetChkNumButton: TButton
    Left = 160
    Top = 232
    Width = 137
    Height = 33
    Caption = 'GetCheckNumber'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = GetChkNumButtonClick
  end
  object ReadXButton: TButton
    Left = 304
    Top = 112
    Width = 249
    Height = 33
    Caption = 'readx'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = ReadXButtonClick
  end
  object XtoFileButton: TButton
    Left = 16
    Top = 320
    Width = 281
    Height = 25
    Caption = 'XtoFile'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    OnClick = XtoFileButtonClick
  end
  object SetVnNalButton: TButton
    Left = 128
    Top = 400
    Width = 75
    Height = 33
    Caption = 'SetVnNal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
    OnClick = SetVnNalButtonClick
  end
  object SetDiscButton: TButton
    Left = 208
    Top = 399
    Width = 83
    Height = 33
    Caption = 'SetDiscount'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = SetDiscButtonClick
  end
  object StopButton: TButton
    Left = 160
    Top = 272
    Width = 137
    Height = 33
    Caption = 'stop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    Visible = False
    OnClick = StopButtonClick
  end
  object SaveDialog: TSaveDialog
    Left = 192
    Top = 376
  end
end
