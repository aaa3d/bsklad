object Report_Min_result: TReport_Min_result
  Left = 193
  Top = 145
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Принятие решения по закупке или перемещению товара'
  ClientHeight = 345
  ClientWidth = 522
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 522
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object BtnSave: TToolButton
      Left = 0
      Top = 2
      Caption = 'BtnSave'
      ImageIndex = 39
      OnClick = BtnSaveClick
    end
    object BtnApply: TToolButton
      Left = 25
      Top = 2
      Caption = 'BtnApply'
      ImageIndex = 38
      OnClick = BtnApplyClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 326
    Width = 522
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 522
    Height = 297
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 522
      Height = 297
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 180
        Top = 4
        Width = 45
        Height = 13
        Caption = 'Решения'
      end
      object Label3: TLabel
        Left = 32
        Top = 32
        Width = 47
        Height = 13
        Caption = 'Закупить'
      end
      object Bevel1: TBevel
        Left = 0
        Top = 20
        Width = 521
        Height = 9
        Shape = bsTopLine
      end
      object Label4: TLabel
        Left = 12
        Top = 60
        Width = 68
        Height = 13
        Caption = 'Переместить'
      end
      object Label5: TLabel
        Left = 224
        Top = 60
        Width = 12
        Height = 13
        Caption = 'из'
      end
      object Label6: TLabel
        Left = 372
        Top = 60
        Width = 6
        Height = 13
        Caption = 'в'
      end
      object Label7: TLabel
        Left = 12
        Top = 84
        Width = 68
        Height = 13
        Caption = 'Переместить'
      end
      object Label8: TLabel
        Left = 224
        Top = 84
        Width = 12
        Height = 13
        Caption = 'из'
      end
      object Label9: TLabel
        Left = 372
        Top = 84
        Width = 6
        Height = 13
        Caption = 'в'
      end
      object Label10: TLabel
        Left = 12
        Top = 108
        Width = 68
        Height = 13
        Caption = 'Переместить'
      end
      object Label11: TLabel
        Left = 224
        Top = 108
        Width = 12
        Height = 13
        Caption = 'из'
      end
      object Label12: TLabel
        Left = 372
        Top = 108
        Width = 6
        Height = 13
        Caption = 'в'
      end
      object Label13: TLabel
        Left = 12
        Top = 132
        Width = 68
        Height = 13
        Caption = 'Переместить'
      end
      object Label14: TLabel
        Left = 224
        Top = 132
        Width = 12
        Height = 13
        Caption = 'из'
      end
      object Label15: TLabel
        Left = 372
        Top = 132
        Width = 6
        Height = 13
        Caption = 'в'
      end
      object Label16: TLabel
        Left = 12
        Top = 156
        Width = 68
        Height = 13
        Caption = 'Переместить'
      end
      object Label17: TLabel
        Left = 224
        Top = 156
        Width = 12
        Height = 13
        Caption = 'из'
      end
      object Label18: TLabel
        Left = 372
        Top = 156
        Width = 6
        Height = 13
        Caption = 'в'
      end
      object Label19: TLabel
        Left = 12
        Top = 180
        Width = 68
        Height = 13
        Caption = 'Переместить'
      end
      object Label20: TLabel
        Left = 224
        Top = 180
        Width = 12
        Height = 13
        Caption = 'из'
      end
      object Label21: TLabel
        Left = 372
        Top = 180
        Width = 6
        Height = 13
        Caption = 'в'
      end
      object Label22: TLabel
        Left = 12
        Top = 204
        Width = 68
        Height = 13
        Caption = 'Переместить'
      end
      object Label23: TLabel
        Left = 224
        Top = 204
        Width = 12
        Height = 13
        Caption = 'из'
      end
      object Label24: TLabel
        Left = 372
        Top = 204
        Width = 6
        Height = 13
        Caption = 'в'
      end
      object Label25: TLabel
        Left = 12
        Top = 228
        Width = 68
        Height = 13
        Caption = 'Переместить'
      end
      object Label26: TLabel
        Left = 224
        Top = 228
        Width = 12
        Height = 13
        Caption = 'из'
      end
      object Label27: TLabel
        Left = 372
        Top = 228
        Width = 6
        Height = 13
        Caption = 'в'
      end
      object Label28: TLabel
        Left = 12
        Top = 252
        Width = 68
        Height = 13
        Caption = 'Переместить'
      end
      object Label29: TLabel
        Left = 224
        Top = 252
        Width = 12
        Height = 13
        Caption = 'из'
      end
      object Label30: TLabel
        Left = 372
        Top = 252
        Width = 6
        Height = 13
        Caption = 'в'
      end
      object Label31: TLabel
        Left = 12
        Top = 276
        Width = 68
        Height = 13
        Caption = 'Переместить'
      end
      object Label32: TLabel
        Left = 224
        Top = 276
        Width = 12
        Height = 13
        Caption = 'из'
      end
      object Label33: TLabel
        Left = 372
        Top = 276
        Width = 6
        Height = 13
        Caption = 'в'
      end
      object ZAK: TRxSpinEdit
        Left = 84
        Top = 28
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Decimal = 4
        ValueType = vtFloat
        TabOrder = 0
        OnChange = ZAKChange
      end
      object Edit1: TEdit
        Left = 184
        Top = 28
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 1
        Text = 'Edit1'
      end
      object MOVE1: TRxSpinEdit
        Left = 84
        Top = 56
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Decimal = 4
        ValueType = vtFloat
        TabOrder = 2
        OnChange = ZAKChange
      end
      object Edit2: TEdit
        Left = 184
        Top = 56
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 3
        Text = 'Edit1'
      end
      object SHOP1_1: TRxDBLookupCombo
        Left = 244
        Top = 56
        Width = 125
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 4
        OnChange = ZAKChange
      end
      object SHOP1_2: TRxDBLookupCombo
        Left = 384
        Top = 56
        Width = 129
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 5
        OnChange = ZAKChange
      end
      object MOVE2: TRxSpinEdit
        Left = 84
        Top = 80
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Decimal = 4
        ValueType = vtFloat
        TabOrder = 6
        OnChange = ZAKChange
      end
      object Edit3: TEdit
        Left = 184
        Top = 80
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 7
        Text = 'Edit1'
      end
      object SHOP2_1: TRxDBLookupCombo
        Left = 244
        Top = 80
        Width = 125
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 8
        OnChange = ZAKChange
      end
      object SHOP2_2: TRxDBLookupCombo
        Left = 384
        Top = 80
        Width = 129
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 9
        OnChange = ZAKChange
      end
      object MOVE3: TRxSpinEdit
        Left = 84
        Top = 104
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Decimal = 4
        ValueType = vtFloat
        TabOrder = 10
        OnChange = ZAKChange
      end
      object Edit4: TEdit
        Left = 184
        Top = 104
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 11
        Text = 'Edit1'
      end
      object SHOP3_1: TRxDBLookupCombo
        Left = 244
        Top = 104
        Width = 125
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 12
        OnChange = ZAKChange
      end
      object SHOP3_2: TRxDBLookupCombo
        Left = 384
        Top = 104
        Width = 129
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 13
        OnChange = ZAKChange
      end
      object MOVE4: TRxSpinEdit
        Left = 84
        Top = 128
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Decimal = 4
        ValueType = vtFloat
        TabOrder = 14
        OnChange = ZAKChange
      end
      object Edit5: TEdit
        Left = 184
        Top = 128
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 15
        Text = 'Edit1'
      end
      object SHOP4_1: TRxDBLookupCombo
        Left = 244
        Top = 128
        Width = 125
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 16
        OnChange = ZAKChange
      end
      object SHOP4_2: TRxDBLookupCombo
        Left = 384
        Top = 128
        Width = 129
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 17
        OnChange = ZAKChange
      end
      object MOVE5: TRxSpinEdit
        Left = 84
        Top = 152
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Decimal = 4
        ValueType = vtFloat
        TabOrder = 18
        OnChange = ZAKChange
      end
      object Edit6: TEdit
        Left = 184
        Top = 152
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 19
        Text = 'Edit1'
      end
      object SHOP5_1: TRxDBLookupCombo
        Left = 244
        Top = 152
        Width = 125
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 20
        OnChange = ZAKChange
      end
      object SHOP5_2: TRxDBLookupCombo
        Left = 384
        Top = 152
        Width = 129
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 21
        OnChange = ZAKChange
      end
      object MOVE6: TRxSpinEdit
        Left = 84
        Top = 176
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Decimal = 4
        ValueType = vtFloat
        TabOrder = 22
        OnChange = ZAKChange
      end
      object Edit7: TEdit
        Left = 184
        Top = 176
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 23
        Text = 'Edit1'
      end
      object SHOP6_1: TRxDBLookupCombo
        Left = 244
        Top = 176
        Width = 125
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 24
        OnChange = ZAKChange
      end
      object SHOP6_2: TRxDBLookupCombo
        Left = 384
        Top = 176
        Width = 129
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 25
        OnChange = ZAKChange
      end
      object MOVE7: TRxSpinEdit
        Left = 84
        Top = 200
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Decimal = 4
        ValueType = vtFloat
        TabOrder = 26
        OnChange = ZAKChange
      end
      object Edit8: TEdit
        Left = 184
        Top = 200
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 27
        Text = 'Edit1'
      end
      object SHOP7_1: TRxDBLookupCombo
        Left = 244
        Top = 200
        Width = 125
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 28
        OnChange = ZAKChange
      end
      object SHOP7_2: TRxDBLookupCombo
        Left = 384
        Top = 200
        Width = 129
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 29
        OnChange = ZAKChange
      end
      object MOVE8: TRxSpinEdit
        Left = 84
        Top = 224
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Decimal = 4
        ValueType = vtFloat
        TabOrder = 30
        OnChange = ZAKChange
      end
      object Edit9: TEdit
        Left = 184
        Top = 224
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 31
        Text = 'Edit1'
      end
      object SHOP8_1: TRxDBLookupCombo
        Left = 244
        Top = 224
        Width = 125
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 32
        OnChange = ZAKChange
      end
      object SHOP8_2: TRxDBLookupCombo
        Left = 384
        Top = 224
        Width = 129
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 33
        OnChange = ZAKChange
      end
      object MOVE9: TRxSpinEdit
        Left = 84
        Top = 248
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Decimal = 4
        ValueType = vtFloat
        TabOrder = 34
        OnChange = ZAKChange
      end
      object Edit10: TEdit
        Left = 184
        Top = 248
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 35
        Text = 'Edit1'
      end
      object SHOP9_1: TRxDBLookupCombo
        Left = 244
        Top = 248
        Width = 125
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 36
        OnChange = ZAKChange
      end
      object SHOP9_2: TRxDBLookupCombo
        Left = 384
        Top = 248
        Width = 129
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 37
        OnChange = ZAKChange
      end
      object MOVE10: TRxSpinEdit
        Left = 84
        Top = 272
        Width = 97
        Height = 21
        Alignment = taRightJustify
        Decimal = 4
        ValueType = vtFloat
        TabOrder = 38
        OnChange = ZAKChange
      end
      object Edit11: TEdit
        Left = 184
        Top = 272
        Width = 33
        Height = 21
        Enabled = False
        TabOrder = 39
        Text = 'Edit1'
      end
      object SHOP10_1: TRxDBLookupCombo
        Left = 244
        Top = 272
        Width = 125
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 40
        OnChange = ZAKChange
      end
      object SHOP10_2: TRxDBLookupCombo
        Left = 384
        Top = 272
        Width = 129
        Height = 21
        DropDownCount = 8
        LookupField = 'SKL_ID'
        LookupDisplay = 'SKL_SHORT'
        LookupSource = DsSkl
        TabOrder = 41
        OnChange = ZAKChange
      end
    end
  end
  object SklTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 556
    Top = 113
  end
  object QuerySkl: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SklTransaction
    CachedUpdates = False
    SQL.Strings = (
      
        'select skl_short,skl_id from skl where skl_speed>0 order by skl_' +
        'speed')
    Left = 556
    Top = 161
    object QuerySklSKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Required = True
      Size = 32
    end
    object QuerySklSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Required = True
    end
  end
  object DsSkl: TDataSource
    DataSet = QuerySkl
    Left = 556
    Top = 209
  end
  object PopupMenu1: TPopupMenu
    Left = 180
    Top = 129
    object N1: TMenuItem
      Caption = 'Сохранить и выйти'
      ShortCut = 16397
      OnClick = BtnSaveClick
    end
    object N2: TMenuItem
      Caption = 'Применить'
      OnClick = BtnApplyClick
    end
  end
end
