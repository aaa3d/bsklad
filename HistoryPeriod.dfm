object History_Period: THistory_Period
  Left = 79
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'История закрытия периода'
  ClientHeight = 418
  ClientWidth = 692
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 29
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 102
      Height = 13
      Caption = 'Категория доступа :'
    end
    object Edit1: TEdit
      Left = 116
      Top = 4
      Width = 573
      Height = 21
      Enabled = False
      TabOrder = 0
      Text = 'Edit1'
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 692
    Height = 389
    Align = alClient
    DataSource = DsH
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'US_FULL'
        Title.Alignment = taCenter
        Title.Caption = 'Кто'
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TM'
        Title.Alignment = taCenter
        Title.Caption = 'Когда'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MESS'
        Title.Alignment = taCenter
        Title.Caption = 'Причина'
        Width = 387
        Visible = True
      end>
  end
  object HTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 332
    Top = 92
  end
  object QueryH: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = HTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select kln.kln_fam||" "||bg_left(bg_toupper(kln.kln_name),1)||".' +
        ' "||'
      'bg_left(bg_toupper(kln.kln_name),1)||". " as us_full,period.tm,'
      'period.mess," " as shop_name'
      'from period,kln where period.usgroup_id=:usgroup_id '
      'and period.us_id=kln.kln_id'
      'order by period.tm desc')
    Left = 240
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'usgroup_id'
        ParamType = ptUnknown
      end>
    object QueryHTM: TDateTimeField
      FieldName = 'TM'
      Required = True
    end
    object QueryHMESS: TIBStringField
      FieldName = 'MESS'
      Size = 254
    end
    object QueryHSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Size = 1
    end
    object QueryHUS_FULL: TIBStringField
      FieldName = 'US_FULL'
      Size = 2307
    end
  end
  object DsH: TDataSource
    DataSet = QueryH
    Left = 240
    Top = 136
  end
end
