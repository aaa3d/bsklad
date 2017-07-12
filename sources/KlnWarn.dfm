object KLN_WARN: TKLN_WARN
  Left = 448
  Top = 241
  BorderStyle = bsDialog
  Caption = 'Предупреждение! Разные реквизиты!'
  ClientHeight = 423
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 19
    Height = 13
    Caption = 'Код'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 313
    Height = 161
    Caption = 'АРМ Склад'
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 88
      Width = 24
      Height = 13
      Caption = 'ИНН'
    end
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 76
      Height = 13
      Caption = 'Наименование'
    end
    object ARM_INN: TEdit
      Left = 8
      Top = 104
      Width = 121
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object ARM_NAME: TMemo
      Left = 8
      Top = 32
      Width = 297
      Height = 49
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Button1: TButton
      Left = 8
      Top = 132
      Width = 297
      Height = 17
      Caption = 'Принять данные АРМ Склад (ничего не менять)'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 224
    Width = 313
    Height = 161
    Caption = '1С'
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 88
      Width = 24
      Height = 13
      Caption = 'ИНН'
    end
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 76
      Height = 13
      Caption = 'Наименование'
    end
    object C_INN: TEdit
      Left = 8
      Top = 104
      Width = 121
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object C_NAME: TMemo
      Left = 8
      Top = 32
      Width = 297
      Height = 49
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object Button2: TButton
      Left = 8
      Top = 132
      Width = 297
      Height = 17
      Caption = 'Принять данные 1С (изменить реквизиты)'
      Enabled = False
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object KLN_ID: TEdit
    Left = 40
    Top = 8
    Width = 121
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object chhApplyToAll: TCheckBox
    Left = 176
    Top = 8
    Width = 113
    Height = 17
    Caption = 'Принять для всех,'
    TabOrder = 3
  end
  object STOP_IMPORT: TButton
    Left = 16
    Top = 392
    Width = 305
    Height = 25
    Caption = 'Остановить загрузку'
    TabOrder = 4
    OnClick = STOP_IMPORTClick
  end
end
