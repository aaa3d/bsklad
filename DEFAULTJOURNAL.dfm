object Default_Journal: TDefault_Journal
  Left = 255
  Top = 341
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Журнал'
  ClientHeight = 348
  ClientWidth = 632
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 632
    Height = 29
    ButtonHeight = 24
    ButtonWidth = 25
    Caption = 'ToolBar1'
    Images = DataModule1.ImageList1
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 2
      Width = 29
      Height = 24
      Hint = 
        'Данная форма соответствует требованиям программ,'#13#10'созданным с ло' +
        'готипом Beginner(R)'
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
      Visible = False
    end
    object ToolButton1: TToolButton
      Left = 29
      Top = 2
      Hint = 'Заблокировать систему'
      Caption = 'ToolButton1'
      ImageIndex = 110
      OnClick = ToolButton1Click
    end
    object ToolButton3: TToolButton
      Left = 54
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 27
      Style = tbsSeparator
    end
    object BtnProw: TToolButton
      Left = 62
      Top = 2
      Hint = 'Провести документ...'
      Caption = 'BtnProw'
      ImageIndex = 22
    end
    object BtnUnProw: TToolButton
      Left = 87
      Top = 2
      Hint = 'Снять с проводки документ...'
      Caption = 'BtnUnProw'
      ImageIndex = 23
    end
    object ToolButton5: TToolButton
      Left = 112
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object BtnNew: TToolButton
      Left = 120
      Top = 2
      Hint = 'Создать новый документ...(INS)'
      Caption = 'BtnNew'
      ImageIndex = 0
    end
    object BtnOpen: TToolButton
      Left = 145
      Top = 2
      Hint = 'Открыть документ...(Enter)'
      Caption = 'BtnOpen'
      ImageIndex = 1
    end
    object btnOpenSale: TToolButton
      Left = 170
      Top = 2
      Caption = 'btnOpenSale'
      ImageIndex = 207
    end
    object BtnCopy: TToolButton
      Left = 195
      Top = 2
      Hint = 'Скопировать документ...(Ctrl+C)'
      Caption = 'BtnCopy'
      ImageIndex = 4
    end
    object BtnDel: TToolButton
      Left = 220
      Top = 2
      Hint = 'Удалить документ...(DEL)'
      Caption = 'BtnDel'
      ImageIndex = 2
    end
    object ToolButton8: TToolButton
      Left = 245
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object BtnPrint: TToolButton
      Left = 253
      Top = 2
      Hint = 'Напечатать документ (F9)'
      Caption = 'BtnPrint'
      ImageIndex = 9
    end
    object BtnPropertis: TToolButton
      Left = 278
      Top = 2
      Hint = '"История" документа (F12)'
      Caption = 'BtnPropertis'
      ImageIndex = 3
    end
    object BtnFind: TToolButton
      Left = 303
      Top = 2
      Hint = 'Найти документ...(1..9)'
      Caption = 'BtnFind'
      ImageIndex = 6
    end
    object ToolButton14: TToolButton
      Left = 328
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object BtnAnaliz: TToolButton
      Left = 336
      Top = 2
      Hint = 'Анализ документа...(F2)'
      Caption = 'BtnAnaliz'
      ImageIndex = 12
    end
    object BtnSubDoc: TToolButton
      Left = 361
      Top = 2
      Hint = 'Создать на основании...'
      Caption = 'BtnSubDoc'
      ImageIndex = 24
    end
    object ToolButton16: TToolButton
      Left = 386
      Top = 2
      Width = 8
      Caption = 'ToolButton16'
      ImageIndex = 25
      Style = tbsSeparator
    end
    object BtnInterval: TToolButton
      Left = 394
      Top = 2
      Hint = 'Установить интервал дат в журнале...(I)'
      Caption = 'BtnInterval'
      ImageIndex = 36
    end
    object ToolButton2: TToolButton
      Left = 419
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 37
      Style = tbsSeparator
    end
    object BtnAdm: TToolButton
      Left = 427
      Top = 2
      Hint = 'Администрирование документа...(Ctrl+A)'
      Caption = 'BtnAdm'
      ImageIndex = 25
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 329
    Width = 632
    Height = 19
    Panels = <>
    SimplePanel = False
    SizeGrip = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 632
    Height = 300
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object StatusBar2: TStatusBar
      Left = 0
      Top = 0
      Width = 632
      Height = 19
      Align = alTop
      Panels = <
        item
          Text = 'За период с 01-Янв-1999 по 20-Фев-1999'
          Width = 276
        end
        item
          Width = 50
        end>
      SimplePanel = False
      SizeGrip = False
    end
    object RxDBGrid1: TRxDBGrid
      Left = 0
      Top = 19
      Width = 632
      Height = 281
      Align = alClient
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
end
