object DIC_DOST: TDIC_DOST
  Left = 118
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '���� ��������'
  ClientHeight = 316
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 658
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnNew: TToolButton
      Left = 0
      Top = 2
      Hint = '����� ��� ������� (Insert)'
      Caption = 'BtnNew'
      ImageIndex = 0
      OnClick = BtnNewClick
    end
    object BtnOpen: TToolButton
      Left = 25
      Top = 2
      Hint = '�������� �������� ������� (Enter)'
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object BtnDel: TToolButton
      Left = 50
      Top = 2
      Hint = '������� ��� ������� (Del)'
      Caption = 'BtnDel'
      ImageIndex = 2
      OnClick = BtnDelClick
    end
    object ToolButton1: TToolButton
      Left = 75
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 83
      Top = 2
      Hint = '������������� �������'
      Caption = 'ToolButton2'
      ImageIndex = 110
      OnClick = ToolButton2Click
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 658
    Height = 287
    Align = alClient
    DataSource = DsUsGroup
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'USGROUP_NAME'
        Title.Alignment = taCenter
        Title.Caption = '������������ �������'
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USGROUP_PRIM'
        Title.Alignment = taCenter
        Title.Caption = '����������'
        Width = 276
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLOSE_PER'
        Title.Caption = '������'
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 128
    Top = 52
    object MnNew: TMenuItem
      Caption = '����� ��� �������'
      ShortCut = 45
      OnClick = BtnNewClick
    end
    object MnOpen: TMenuItem
      Caption = '�������� �������� ���� �������'
      ShortCut = 13
      OnClick = BtnOpenClick
    end
    object MnDel: TMenuItem
      Caption = '������� ��� �������'
      ShortCut = 46
      OnClick = BtnDelClick
    end
  end
  object UsGroupTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 272
    Top = 44
  end
  object QrUsGroup: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = UsGroupTransaction
    AfterOpen = QrUsGroupAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from usgroup order by usgroup_name')
    Left = 272
    Top = 92
    object QrUsGroupUSGROUP_ID: TIntegerField
      FieldName = 'USGROUP_ID'
      Required = True
    end
    object QrUsGroupUSGROUP_NAME: TIBStringField
      FieldName = 'USGROUP_NAME'
      Required = True
      Size = 254
    end
    object QrUsGroupUSGROUP_PRIM: TIBStringField
      FieldName = 'USGROUP_PRIM'
      Size = 254
    end
    object QrUsGroupCLOSE_PER: TIntegerField
      FieldName = 'CLOSE_PER'
      Origin = 'USGROUP.CLOSE_PER'
    end
  end
  object DsUsGroup: TDataSource
    DataSet = QrUsGroup
    Left = 272
    Top = 144
  end
end
