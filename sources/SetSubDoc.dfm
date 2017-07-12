object Set_SUBDOC: TSet_SUBDOC
  Left = 120
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Создание документа на основании существующего'
  ClientHeight = 81
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 108
    Height = 13
    Caption = 'Исходный документ :'
  end
  object Label2: TLabel
    Left = 68
    Top = 32
    Width = 48
    Height = 13
    Caption = 'Создать :'
  end
  object Edit1: TEdit
    Left = 120
    Top = 4
    Width = 413
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 380
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Создать'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 456
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Отмена'
    TabOrder = 2
    OnClick = Button2Click
  end
  object SubDoc: TRxDBLookupCombo
    Left = 120
    Top = 28
    Width = 413
    Height = 21
    DropDownCount = 8
    LookupField = 'CNT'
    LookupDisplay = 'NAME'
    LookupSource = DsSubDoc
    TabOrder = 3
  end
  object MemSubDoc: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'NAME'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'TYP'
        DataType = ftInteger
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'CNT'
        DataType = ftInteger
      end>
    Left = 28
    Top = 8
    object MemSubDocNAME: TStringField
      FieldName = 'NAME'
      Size = 254
    end
    object MemSubDocDOC: TIntegerField
      FieldName = 'TYP'
    end
    object MemSubDocID: TIntegerField
      FieldName = 'ID'
    end
    object MemSubDocCNT: TIntegerField
      FieldName = 'CNT'
    end
  end
  object DsSubDoc: TDataSource
    DataSet = MemSubDoc
    Left = 76
    Top = 4
  end
end
