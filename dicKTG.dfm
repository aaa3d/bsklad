object DIC_KTG: TDIC_KTG
  Left = 78
  Top = 167
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Справочник категорий скидок'
  ClientHeight = 501
  ClientWidth = 840
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 482
    Width = 840
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 840
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Caption = 'ToolButton1'
      ImageIndex = 0
      OnClick = ToolButton1Click
    end
    object ToolButton4: TToolButton
      Left = 25
      Top = 2
      Hint = 'Копировать скидку'
      Caption = 'ToolButton4'
      ImageIndex = 4
    end
    object BtnOpen: TToolButton
      Left = 50
      Top = 2
      Hint = 'Изменить скидку'
      Caption = 'BtnOpen'
      ImageIndex = 1
      OnClick = BtnOpenClick
    end
    object BtnDel: TToolButton
      Left = 75
      Top = 2
      Hint = 'Удалить скидку'
      Caption = 'BtnDel'
      ImageIndex = 2
      OnClick = BtnDelClick
    end
    object ToolButton5: TToolButton
      Left = 100
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object BtnNewGroup: TToolButton
      Left = 108
      Top = 2
      Hint = 'Новый раздел каталога'
      Caption = 'BtnNewGroup'
      ImageIndex = 5
      OnClick = BtnNewGroupClick
    end
    object BtnMove: TToolButton
      Left = 133
      Top = 2
      Hint = 'Переместить в другой раздел каталога'
      Caption = 'BtnMove'
      ImageIndex = 8
      OnClick = BtnMoveClick
    end
    object ToolButton8: TToolButton
      Left = 158
      Top = 2
      Hint = 'На один уровень вверх'
      Caption = 'ToolButton8'
      ImageIndex = 15
      OnClick = ToolButton8Click
    end
    object ToolButton9: TToolButton
      Left = 183
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 16
      Style = tbsSeparator
    end
    object BtnSelect: TToolButton
      Left = 191
      Top = 2
      Hint = 'Выбрать скидку'
      Caption = 'BtnSelect'
      ImageIndex = 16
      OnClick = BtnSelectClick
    end
    object ToolButton11: TToolButton
      Left = 216
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 17
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 224
      Top = 2
      Hint = 'Перечень товаров с установленной категорией скидок'
      Caption = 'ToolButton12'
      ImageIndex = 26
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 840
    Height = 453
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 195
      Top = 0
      Width = 3
      Height = 453
      Cursor = crHSplit
    end
    object TreeView1: TTreeView
      Left = 0
      Top = 0
      Width = 195
      Height = 453
      Align = alLeft
      Images = DataModule1.ImageList1
      Indent = 21
      ReadOnly = True
      TabOrder = 0
      OnChange = TreeView1Change
      OnEnter = TreeView1Enter
      OnExit = TreeView1Exit
    end
    object RxDBGrid1: TRxDBGrid
      Left = 198
      Top = 0
      Width = 642
      Height = 453
      Align = alClient
      DataSource = DsList
      DefaultDrawing = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawDataCell = RxDBGrid1DrawDataCell
      OnDrawColumnCell = RxDBGrid1DrawColumnCell
      OnDblClick = RxDBGrid1DblClick
      OnEnter = RxDBGrid1Enter
      OnExit = RxDBGrid1Exit
      Columns = <
        item
          Expanded = False
          FieldName = 'VID'
          Title.Caption = ' '
          Width = 17
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Наименование'
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OPIS'
          Title.Alignment = taCenter
          Title.Caption = 'Описание'
          Width = 418
          Visible = True
        end>
    end
  end
  object WorkTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 366
    Top = 105
  end
  object QueryWork: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = WorkTransaction
    BufferChunks = 1000
    CachedUpdates = False
    Left = 368
    Top = 153
  end
  object ListTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 522
    Top = 105
  end
  object QueryList: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = ListTransaction
    AfterOpen = QueryListAfterOpen
    AfterScroll = QueryListAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from DICPROPTWKTG(:PARENT_ID)')
    Left = 526
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PARENT_ID'
        ParamType = ptInput
      end>
    object QueryListID: TIntegerField
      FieldName = 'ID'
    end
    object QueryListTREE: TIBStringField
      FieldName = 'TREE'
      Size = 1
    end
    object QueryListNAME: TIBStringField
      FieldName = 'NAME'
      Size = 254
    end
    object QueryListOPIS: TIBStringField
      FieldName = 'OPIS'
      Size = 254
    end
    object QueryListVID: TIntegerField
      FieldName = 'VID'
    end
  end
  object DsList: TDataSource
    DataSet = QueryList
    Left = 522
    Top = 209
  end
end
