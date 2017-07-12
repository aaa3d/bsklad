object JOU_REMONT: TJOU_REMONT
  Left = 420
  Top = 350
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Журнал заявок на гарнтийный ремонт'
  ClientHeight = 348
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 329
    Width = 784
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 784
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 1
    object ToolButton10: TToolButton
      Left = 0
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton10'
      ImageIndex = 110
      OnClick = ToolButton10Click
    end
    object ToolButton12: TToolButton
      Left = 25
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 38
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 33
      Top = 2
      Hint = 'Новая заявка'
      Caption = 'ToolButton1'
      ImageIndex = 0
      OnClick = ToolButton1Click
    end
    object ToolButton6: TToolButton
      Left = 58
      Top = 2
      Hint = 'Копировать заявку'
      Caption = 'ToolButton6'
      ImageIndex = 4
    end
    object ToolButton2: TToolButton
      Left = 83
      Top = 2
      Hint = 'Править заявку'
      Caption = 'ToolButton2'
      ImageIndex = 1
    end
    object ToolButton3: TToolButton
      Left = 108
      Top = 2
      Hint = 'Удалить заявку'
      Caption = 'ToolButton3'
      ImageIndex = 2
    end
    object ToolButton4: TToolButton
      Left = 133
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 141
      Top = 2
      Hint = '"История" изменений'
      Caption = 'ToolButton5'
      ImageIndex = 3
    end
    object ToolButton11: TToolButton
      Left = 166
      Top = 2
      Hint = 'Печатать заявку'
      Caption = 'ToolButton11'
      ImageIndex = 9
    end
    object ToolButton9: TToolButton
      Left = 191
      Top = 2
      Hint = 'Найти заявку'
      Caption = 'ToolButton9'
      ImageIndex = 7
    end
    object ToolButton7: TToolButton
      Left = 216
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 224
      Top = 2
      Hint = 'Период дат в журнале (I)'
      Caption = 'ToolButton8'
      ImageIndex = 36
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 784
    Height = 300
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object StatusBar2: TStatusBar
      Left = 0
      Top = 0
      Width = 784
      Height = 19
      Align = alTop
      Panels = <
        item
          Text = 'Журнал заявок на ремонты за СЕГОДНЯ!'
          Width = 50
        end>
      SimplePanel = False
    end
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 19
      Width = 784
      Height = 281
      Align = alClient
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
          Title.Caption = 'Номер'
          Visible = True
        end
        item
          Expanded = False
          Title.Alignment = taCenter
          Title.Caption = 'Дата'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          Title.Alignment = taCenter
          Title.Caption = 'Номер гарант. талона'
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          Title.Alignment = taCenter
          Title.Caption = 'Наименование изделия'
          Width = 164
          Visible = True
        end
        item
          Expanded = False
          Title.Alignment = taCenter
          Title.Caption = 'Дефект'
          Width = 147
          Visible = True
        end
        item
          Expanded = False
          Title.Alignment = taCenter
          Title.Caption = 'Срок гарантии'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          Title.Alignment = taCenter
          Title.Caption = 'Отметки'
          Width = 84
          Visible = True
        end>
    end
  end
end
