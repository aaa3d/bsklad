object ZP_RL_USER: TZP_RL_USER
  Left = 85
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Расчетный лист сотрудника'
  ClientHeight = 453
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Hint = 'Добавить расчет'
      Caption = 'ToolButton1'
      ImageIndex = 163
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 2
      Hint = 'Удалить расчет'
      Caption = 'ToolButton2'
      ImageIndex = 162
    end
    object ToolButton3: TToolButton
      Left = 50
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object Label1: TLabel
      Left = 58
      Top = 2
      Width = 59
      Height = 24
      AutoSize = False
      Caption = 'Расчет на : '
      Layout = tlCenter
    end
    object MES: TComboBox
      Left = 117
      Top = 3
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'MES'
      OnChange = MESChange
      Items.Strings = (
        'январь'
        'февраль'
        'март'
        'апрель'
        'май'
        'июнь'
        'июль'
        'август'
        'сентябрь'
        'октябрь'
        'ноябрь'
        'декабрь')
    end
    object ToolButton4: TToolButton
      Left = 262
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object YEAR: TRxSpinEdit
      Left = 270
      Top = 2
      Width = 59
      Height = 24
      Alignment = taRightJustify
      MaxValue = 2050
      MinValue = 2002
      Value = 2002
      TabOrder = 1
      OnChange = YEARChange
    end
    object Label2: TLabel
      Left = 329
      Top = 2
      Width = 65
      Height = 24
      AutoSize = False
      Caption = '  года'
      Layout = tlCenter
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 434
    Width = 688
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 324
    Width = 688
    Height = 110
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 688
      Height = 17
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Описание'
      TabOrder = 0
    end
    object Memo1: TMemo
      Left = 0
      Top = 17
      Width = 688
      Height = 93
      Align = alClient
      TabOrder = 1
    end
  end
  object RxDBGrid1: TRxDBGrid
    Left = 0
    Top = 29
    Width = 688
    Height = 295
    Align = alClient
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Width = 652
        Visible = True
      end>
  end
end
