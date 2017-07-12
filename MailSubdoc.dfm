object MAIL_SUBDOC: TMAIL_SUBDOC
  Left = 467
  Top = 368
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Оформление первичных документов на основании электронной почты'
  ClientHeight = 301
  ClientWidth = 575
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 476
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Оформить'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 476
    Top = 36
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 1
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 8
    Width = 197
    Height = 17
    Caption = 'Оформить приходную накладную'
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 8
    Top = 28
    Width = 225
    Height = 17
    Caption = 'Оформить накладные перемещения'
    TabOrder = 3
  end
  object CheckBox3: TCheckBox
    Left = 8
    Top = 48
    Width = 177
    Height = 17
    Caption = 'Оформить акты переоценки'
    TabOrder = 4
  end
  object CheckBox4: TCheckBox
    Left = 8
    Top = 68
    Width = 201
    Height = 17
    Caption = 'Изменить дополнительные цены'
    TabOrder = 5
  end
  object Memo1: TMemo
    Left = 0
    Top = 97
    Width = 575
    Height = 204
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    TabOrder = 6
  end
  object PNTYP: TRxDBLookupCombo
    Left = 204
    Top = 4
    Width = 261
    Height = 21
    DropDownCount = 8
    LookupField = 'PNTYP_ID'
    LookupDisplay = 'PNTYP_FULL'
    LookupSource = DataModule1.MainDsPntyp
    TabOrder = 7
  end
end
