object Analiz_TO: TAnaliz_TO
  Left = 98
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Анализ имени отправителя'
  ClientHeight = 348
  ClientWidth = 606
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Кому :'
  end
  object Edit1: TEdit
    Left = 44
    Top = 4
    Width = 489
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object RxDBGrid1: TRxDBGrid
    Left = 4
    Top = 36
    Width = 521
    Height = 309
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'Тип получателя'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = 'Наименование получателя'
        Width = 298
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 528
    Top = 292
    Width = 75
    Height = 25
    Caption = 'Выбрать'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 528
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 3
    OnClick = Button2Click
  end
  object MemAnaliz: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'TYP'
        DataType = ftInteger
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 254
      end
      item
        Name = 'TYP_FULL'
        DataType = ftString
        Size = 254
      end>
    Left = 176
    Top = 44
    object MemAnalizTYP: TIntegerField
      FieldName = 'TYP'
    end
    object MemAnalizID: TIntegerField
      FieldName = 'ID'
    end
    object MemAnalizNAME: TStringField
      FieldName = 'NAME'
      Size = 254
    end
    object MemAnalizTYP_FULL: TStringField
      FieldName = 'TYP_FULL'
      Size = 254
    end
  end
  object DsAnaliz: TDataSource
    DataSet = MemAnaliz
    Left = 176
    Top = 92
  end
end
