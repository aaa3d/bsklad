object History_KursMoney: THistory_KursMoney
  Left = 96
  Top = 115
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '"История" курса ценобразования'
  ClientHeight = 348
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000FFFFF000000000000000000000000000F0000F0000000000000000000
    000000FF0000F000000000000000000000000000777700000000000000000000
    000000007777000000000FFFFF000000000000007777000000000F0000F00000
    00000000777700000000FF0000FF000000000000007700000000007777000000
    00FFFF000077000000000077770000000F0000F0000000000000007777000000
    FF0000FF00000000000000777700000F00777700F000000000000000770000FF
    00777700F000000FFFFF000077000F00777777770000000F0000F0000000FF00
    7777777700000FFF0000FF00000000777777770000000F007777000000000077
    777777000000FF00777700000000007777770000000F00777777000000000077
    7777000000FF00777777000000000077777700000F0077777777000000000077
    77770000FF007777777700000000007777000000007777777700000000000077
    7700000000777777770000000000000000000000007777777700000000000000
    0000000000777777770000000000000000000000007777770000000000000000
    0000000000777777000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFE0FFFFFFE07FFFFFC07FFFFFC03FFFFFC03F83FFC03F81FFC0
    3F00FFF03F00FC303F00F81CFF00F00CFF00E007FFC0C007E0C08003E0730003
    8033000F803F000F003F003E003F003C003F0038003F0030003F00F000FF00F0
    00FFC3F000FFC3F000FFFFF003FFFFF003FFFFFC0FFFFFFC0FFFFFFFFFFF}
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 44
      Height = 13
      Caption = 'Валюта :'
    end
    object Image3: TImage
      Left = 520
      Top = 9
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
    object VALUTA_FULL: TEdit
      Left = 56
      Top = 4
      Width = 445
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'VALUTA_FULL'
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 536
    Height = 319
    Align = alClient
    DataSource = DsHistory
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'KURS_DATE'
        Title.Alignment = taCenter
        Title.Caption = 'Дата изменения'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KURS_KURS'
        Title.Alignment = taCenter
        Title.Caption = 'Значение'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Кто оформил'
        Width = 265
        Visible = True
      end>
  end
  object HistoryTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 140
    Top = 76
  end
  object QueryHistory: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = HistoryTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select kurs.kurs_kurs,kurs.kurs_date,'
      
        'bg_left(kln.kln_fam||" "||bg_LEFT(BG_TOUPPER(kln.kln_name),1)||"' +
        '. "||'
      'bg_LEFT(BG_TOUPPER(kln.kln_name2),1)||".",254) as us_full'
      'from kurs,kln where kurs.us_id=kln.kln_id'
      'and kurs.valuta_id=:valuta_id and kurs.kurs_typ=0'
      'order by kurs_date desc')
    Left = 140
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'valuta_id'
        ParamType = ptInput
      end>
    object QueryHistoryKURS_KURS: TFloatField
      FieldName = 'KURS_KURS'
      Required = True
      DisplayFormat = '#0.0000'
    end
    object QueryHistoryKURS_DATE: TDateTimeField
      FieldName = 'KURS_DATE'
      Required = True
    end
    object QueryHistoryUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Required = True
      FixedChar = True
      Size = 1024
    end
  end
  object DsHistory: TDataSource
    DataSet = QueryHistory
    Left = 140
    Top = 176
  end
end
