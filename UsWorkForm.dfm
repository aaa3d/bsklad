object UsWork_FORM: TUsWork_FORM
  Left = 2
  Top = 104
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Пользователи, работающие с системой'
  ClientHeight = 399
  ClientWidth = 787
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
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 157
    Top = 0
    Width = 630
    Height = 399
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'US_FIO'
        Title.Alignment = taCenter
        Title.Caption = 'Фамилия, инициалы'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USWORK_COMPUTER'
        Title.Alignment = taCenter
        Title.Caption = 'Компьютер'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USWORK_STAT'
        Title.Alignment = taCenter
        Title.Caption = 'Операция'
        Width = 295
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USWORK_DT'
        Title.Alignment = taCenter
        Title.Caption = 'Время начала...'
        Width = 114
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 157
    Height = 399
    Align = alLeft
    BevelOuter = bvLowered
    Color = 14548223
    TabOrder = 1
    object Image2: TImage
      Left = 0
      Top = 2
      Width = 16
      Height = 16
      AutoSize = True
      Picture.Data = {
        07544269746D6170F6000000424DF60000000000000076000000280000001000
        000010000000010004000000000080000000120B0000120B0000100000001000
        0000000000000000800000800000008080008000000080008000808000008080
        8000C0C0C0000000FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFF
        FF00DADADADADADA0ADAADADADADADA00DADDADA7777770B07DAADA0000000FF
        007DDA0FFFBFBFBFFF07AD0FBFFF44FFBF07DA0FFFBFFFBFFF07AD0FBFFF47FF
        BF07DA0FFFBF748FFF07AD0FBFFFB747BF07DA0FFF47FF44FF07AD0FBF44B844
        BF07DA0FFF844448FF07AD0FBFFFBFFFBF07DA0FFFBFFFBFFF0AADA000000000
        00AD}
      Transparent = True
    end
    object RichEdit1: TRichEdit
      Left = 16
      Top = 1
      Width = 140
      Height = 397
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        '  В даннной форме '
        'отображаются '
        'пользователи, '
        'работающиее в настоящий '
        'момент в системе '
        '"СКЛАД".'
        '  Также отображается имя '
        'компьютера, на котором '
        'работает пользователь и '
        'операция, которую он '
        'выполняет, и время её '
        'начала.'
        '  Данная форма '
        'автоматически '
        'обновляется раз в 10 '
        'секунд.')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    OnCalcFields = IBQuery1CalcFields
    CachedUpdates = False
    SQL.Strings = (
      'select kln.kln_fam,kln.kln_name,kln.kln_name2,'
      'uswork.uswork_dt,uswork.uswork_stat,uswork.uswork_computer,'
      'uswork.uswork_id'
      'from kln,uswork'
      'where kln.kln_id=uswork.kln_id'
      'order by uswork.uswork_dt')
    Left = 320
    Top = 32
    object IBQuery1US_FIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'US_FIO'
      Size = 254
      Calculated = True
    end
    object IBQuery1USWORK_ID: TIntegerField
      FieldName = 'USWORK_ID'
      Required = True
    end
    object IBQuery1KLN_FAM: TIBStringField
      FieldName = 'KLN_FAM'
      Size = 254
    end
    object IBQuery1KLN_NAME: TIBStringField
      FieldName = 'KLN_NAME'
      Size = 254
    end
    object IBQuery1KLN_NAME2: TIBStringField
      FieldName = 'KLN_NAME2'
      Size = 254
    end
    object IBQuery1USWORK_DT: TDateTimeField
      FieldName = 'USWORK_DT'
      Required = True
    end
    object IBQuery1USWORK_STAT: TIBStringField
      FieldName = 'USWORK_STAT'
      Required = True
      Size = 254
    end
    object IBQuery1USWORK_COMPUTER: TIBStringField
      FieldName = 'USWORK_COMPUTER'
      Required = True
      Size = 254
    end
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 404
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 320
    Top = 96
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 208
    Top = 48
  end
end
