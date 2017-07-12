object frOCIQueryOptions: TfrOCIQueryOptions
  Left = 237
  Top = 178
  ActiveControl = edAssignDateFormat
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 218
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel2: TBevel
    Left = 272
    Top = 16
    Width = 177
    Height = 129
    Shape = bsFrame
  end
  object Bevel1: TBevel
    Left = 8
    Top = 16
    Width = 257
    Height = 193
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 16
    Top = 32
    Width = 89
    Height = 13
    Caption = 'AssignDateFormat:'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 112
    Height = 13
    Caption = 'AssignDateTimeFormat:'
  end
  object Label3: TLabel
    Left = 16
    Top = 64
    Width = 58
    Height = 13
    Caption = 'DateFormat:'
  end
  object Label4: TLabel
    Left = 16
    Top = 79
    Width = 81
    Height = 13
    Caption = 'DateTimeFormat:'
  end
  object Label5: TLabel
    Left = 16
    Top = 95
    Width = 80
    Height = 13
    Caption = 'FixedMacroChar:'
  end
  object Label6: TLabel
    Left = 16
    Top = 111
    Width = 76
    Height = 13
    Caption = 'SQLMacroChar:'
  end
  object Label7: TLabel
    Left = 16
    Top = 10
    Width = 58
    Height = 13
    Caption = 'DataFormat:'
  end
  object Label8: TLabel
    Left = 280
    Top = 72
    Width = 57
    Height = 13
    Caption = 'FetchExact:'
  end
  object Label9: TLabel
    Left = 280
    Top = 88
    Width = 70
    Height = 13
    Caption = 'InrecDataSize:'
  end
  object Label10: TLabel
    Left = 280
    Top = 104
    Width = 69
    Height = 13
    Caption = 'PieceBuffSize:'
  end
  object Label11: TLabel
    Left = 280
    Top = 120
    Width = 59
    Height = 13
    Caption = 'RowsetSize:'
  end
  object edAssignDateFormat: TEdit
    Left = 136
    Top = 29
    Width = 121
    Height = 17
    TabOrder = 5
  end
  object chEnableBCD: TCheckBox
    Left = 16
    Top = 136
    Width = 97
    Height = 17
    Caption = 'EnableBCD'
    TabOrder = 6
  end
  object chEnableFixedString: TCheckBox
    Left = 16
    Top = 152
    Width = 121
    Height = 17
    Caption = 'EnableFixedString'
    TabOrder = 7
  end
  object chEnableInteger: TCheckBox
    Left = 16
    Top = 168
    Width = 97
    Height = 17
    Caption = 'EnableInteger'
    TabOrder = 8
  end
  object chEnableLongString: TCheckBox
    Left = 16
    Top = 184
    Width = 113
    Height = 17
    Caption = 'EnableLongString'
    TabOrder = 9
  end
  object chEnableNumber: TCheckBox
    Left = 136
    Top = 136
    Width = 97
    Height = 17
    Caption = 'EnableNumber'
    TabOrder = 10
  end
  object chEnableRequired: TCheckBox
    Left = 136
    Top = 152
    Width = 97
    Height = 17
    Caption = 'EnableRequired'
    TabOrder = 11
  end
  object chStrsEmpty2Null: TCheckBox
    Left = 136
    Top = 168
    Width = 97
    Height = 17
    Caption = 'StrsEmpty2Null'
    TabOrder = 12
  end
  object chStrsTrim: TCheckBox
    Left = 136
    Top = 184
    Width = 97
    Height = 17
    Caption = 'StrsTrim'
    TabOrder = 13
  end
  object chFetchAll: TCheckBox
    Left = 280
    Top = 32
    Width = 97
    Height = 17
    Caption = 'FetchAll'
    TabOrder = 14
  end
  object chPieceBuffOwn: TCheckBox
    Left = 280
    Top = 48
    Width = 97
    Height = 17
    Caption = 'PieceBuffOwn'
    TabOrder = 15
  end
  object edFetchExact: TEdit
    Left = 376
    Top = 69
    Width = 65
    Height = 17
    TabOrder = 16
  end
  object edInrecDataSize: TEdit
    Left = 376
    Top = 85
    Width = 65
    Height = 17
    TabOrder = 17
  end
  object edPieceBuffSize: TEdit
    Left = 376
    Top = 101
    Width = 65
    Height = 17
    TabOrder = 18
  end
  object edRowsetSize: TEdit
    Left = 376
    Top = 117
    Width = 65
    Height = 17
    TabOrder = 19
  end
  object BitBtn1: TBitBtn
    Left = 272
    Top = 184
    Width = 81
    Height = 25
    TabOrder = 20
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 368
    Top = 184
    Width = 83
    Height = 25
    TabOrder = 21
    Kind = bkCancel
  end
  object edAssignDateTimeFormat: TEdit
    Left = 136
    Top = 45
    Width = 121
    Height = 17
    TabOrder = 4
  end
  object edDateFormat: TEdit
    Left = 136
    Top = 61
    Width = 121
    Height = 17
    TabOrder = 3
  end
  object edDateTimeFormat: TEdit
    Left = 136
    Top = 77
    Width = 121
    Height = 17
    TabOrder = 2
  end
  object edFixedMacroChar: TEdit
    Left = 136
    Top = 93
    Width = 25
    Height = 17
    TabOrder = 1
  end
  object edSQLMacroChar: TEdit
    Left = 136
    Top = 109
    Width = 25
    Height = 17
    TabOrder = 0
  end
end
