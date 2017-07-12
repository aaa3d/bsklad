object FORM_DEBUG: TFORM_DEBUG
  Left = 264
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Форма отладки сообщений'
  ClientHeight = 410
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 183
    Width = 768
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 186
    Width = 768
    Height = 224
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 1
      Top = 1
      Width = 64
      Height = 222
      Align = alLeft
      AutoSize = False
      Caption = 'Данные :'
    end
    object RxDBGrid1: TRxDBGrid
      Left = 65
      Top = 1
      Width = 702
      Height = 222
      Align = alClient
      DataSource = DsMem
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Имя'
          Width = 136
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TYP'
          Title.Alignment = taCenter
          Title.Caption = 'Тип'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALUE'
          Title.Alignment = taCenter
          Title.Caption = 'Значение'
          Width = 448
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 183
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 48
      Width = 64
      Height = 134
      Caption = 'Команда :'
    end
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 66
      Height = 13
      Caption = 'Исключение:'
    end
    object Memo1: TMemo
      Left = 64
      Top = 48
      Width = 703
      Height = 134
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
    end
    object Memo2: TMemo
      Left = 64
      Top = 0
      Width = 705
      Height = 49
      TabOrder = 1
    end
  end
  object RxMem: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'NAME'
        DataType = ftString
        Size = 64
      end
      item
        Name = 'TYP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALUE'
        DataType = ftString
        Size = 254
      end>
    Left = 250
    Top = 264
    object RxMemNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object RxMemTYP: TStringField
      FieldName = 'TYP'
    end
    object RxMemVALUE: TStringField
      FieldName = 'VALUE'
      Size = 254
    end
  end
  object DsMem: TDataSource
    DataSet = RxMem
    Left = 252
    Top = 314
  end
end
