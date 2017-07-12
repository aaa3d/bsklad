object EDIT_MONEY_DOPUSK: TEDIT_MONEY_DOPUSK
  Left = 181
  Top = 195
  Width = 1106
  Height = 749
  VertScrollBar.Position = 23
  Caption = 'Допуск к прайсовым ценам'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 719
    Top = 327
    Width = 148
    Height = 16
    Caption = 'Цена продажи не ниже'
  end
  object Label6: TLabel
    Left = 713
    Top = 580
    Width = 131
    Height = 16
    Caption = 'Заявки на списание'
  end
  object Label2: TLabel
    Left = 719
    Top = 381
    Width = 297
    Height = 48
    Caption = 
      'Заявка на закупку. не менее 5 согласований '#13#10'по заявке и не мене' +
      'е одного согласования '#13#10'каждой категории.'
  end
  object RxDBGrid1: TRxDBGrid
    Left = 5
    Top = -13
    Width = 690
    Height = 720
    DataSource = DS_USERS
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -14
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleButtons = True
    OnGetBtnParams = RxDBGrid1GetBtnParams
    OnTitleBtnClick = RxDBGrid1TitleBtnClick
    Columns = <
      item
        Expanded = False
        FieldName = 'KLNTREE_FULL'
        Title.Caption = 'Группа клиента'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'US_NAME'
        Title.Caption = 'Пользователь'
        Width = 213
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USGROUP_NAME'
        Title.Caption = 'Группа доступа'
        Width = 167
        Visible = True
      end>
  end
  object RadioGroup1: TRadioGroup
    Left = 709
    Top = 179
    Width = 287
    Height = 144
    Caption = 'Доступ к скидкам'
    Items.Strings = (
      'Работа только по ценам клиента'
      'Уменьшение цены на 1 категорию'
      'Уменьшение цены на 2 категорию'
      'Уменьшение цены на 3 категорию'
      'Уменьшение цены до закупки'
      'Уменьшение цены ниже закупки')
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object GroupBox1: TGroupBox
    Left = 709
    Top = 41
    Width = 287
    Height = 134
    Caption = 'Доступ к печати цен в прайс листе'
    TabOrder = 2
    object CheckBox1: TCheckBox
      Left = 15
      Top = 25
      Width = 184
      Height = 21
      Caption = 'Оптовые цены'
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 15
      Top = 44
      Width = 184
      Height = 21
      Caption = 'Крупно оптовых цен'
      TabOrder = 1
      OnClick = CheckBox2Click
    end
    object CheckBox3: TCheckBox
      Left = 15
      Top = 64
      Width = 184
      Height = 21
      Caption = 'Спец цены'
      TabOrder = 2
      OnClick = CheckBox3Click
    end
    object CheckBox4: TCheckBox
      Left = 15
      Top = 84
      Width = 184
      Height = 21
      Caption = 'Цены перепродажи'
      TabOrder = 3
      OnClick = CheckBox4Click
    end
    object CheckBox5: TCheckBox
      Left = 15
      Top = 103
      Width = 184
      Height = 21
      Caption = 'Закупочные цены'
      TabOrder = 4
      OnClick = CheckBox5Click
    end
  end
  object CheckBox6: TCheckBox
    Left = 724
    Top = -8
    Width = 184
    Height = 21
    Caption = 'Печать прайс листа'
    TabOrder = 3
    OnClick = CheckBox6Click
  end
  object CheckBox7: TCheckBox
    Left = 724
    Top = 11
    Width = 184
    Height = 21
    Caption = 'Смена категории клиента'
    TabOrder = 4
    OnClick = CheckBox7Click
  end
  object MIN_USER_MONEY_KTG: TComboBox
    Left = 714
    Top = 341
    Width = 277
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    TabOrder = 5
    OnChange = MIN_USER_MONEY_KTGChange
    Items.Strings = (
      'Оптовой'
      'Крупнооптовой'
      'Спеццены')
  end
  object trindeF_dostup: TRxCheckListBox
    Left = 714
    Top = 597
    Width = 282
    Height = 120
    ItemHeight = 16
    TabOrder = 6
    OnClickCheck = trindeF_dostupClickCheck
    InternalVersion = 202
  end
  object ZAY_EMAIL: TRxCheckListBox
    Left = 714
    Top = 430
    Width = 282
    Height = 119
    ItemHeight = 16
    TabOrder = 7
    OnClickCheck = ZAY_EMAILClickCheck
    InternalVersion = 202
  end
  object Q_USERS: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = read_transaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select kln_id, kln_fam||'#39' '#39'||kln.kln_name||'#39' '#39'||kln_name2 us_nam' +
        'e,'
      'usgroup.usgroup_name,'
      'klntree.klntree_full'
      ''
      ' from kln, usgroup   , klntree'
      'where kln.kln_password<>'#39#39
      'and kln.usgroup_id=usgroup.usgroup_id'
      'and not kln.kln_close=1'
      'and klntree.klntree_id=kln.klntree_id'
      'order by 2')
    Left = 80
    Top = 128
  end
  object read_transaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 112
    Top = 184
  end
  object DS_USERS: TDataSource
    DataSet = Q_USERS
    Left = 168
    Top = 168
  end
  object USERS: TRxMemoryData
    FieldDefs = <>
    AfterScroll = USERSAfterScroll
    Left = 176
    Top = 64
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 304
    Top = 108
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 348
    Top = 116
  end
end
