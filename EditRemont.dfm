object Edit_REMONT: TEdit_REMONT
  Left = 22
  Top = 85
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Заявка на гарантийный ремонт'
  ClientHeight = 456
  ClientWidth = 733
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
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 437
    Width = 733
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 733
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 29
    Width = 733
    Height = 408
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 60
      Top = 12
      Width = 79
      Height = 13
      Caption = 'Номер заявки :'
    end
    object Label2: TLabel
      Left = 280
      Top = 12
      Width = 109
      Height = 13
      Caption = 'Дата подачи заявки :'
    end
    object Label3: TLabel
      Left = 32
      Top = 40
      Width = 105
      Height = 13
      Caption = 'Гарантийный талон :'
    end
    object Label4: TLabel
      Left = 12
      Top = 64
      Width = 127
      Height = 13
      Caption = 'Наименование изделия :'
    end
    object Label5: TLabel
      Left = 60
      Top = 88
      Width = 80
      Height = 13
      Caption = 'Срок гарантии :'
    end
    object Label6: TLabel
      Left = 276
      Top = 88
      Width = 114
      Height = 13
      Caption = 'Дата конца гарантии :'
    end
    object Label7: TLabel
      Left = 16
      Top = 112
      Width = 123
      Height = 13
      Caption = 'Обнаруженный дефект :'
    end
    object Label8: TLabel
      Left = 20
      Top = 224
      Width = 118
      Height = 13
      Caption = 'Повторность ремонта :'
    end
    object Label9: TLabel
      Left = 236
      Top = 224
      Width = 50
      Height = 13
      Caption = 'Отметка :'
    end
    object Label10: TLabel
      Left = 16
      Top = 248
      Width = 122
      Height = 13
      Caption = 'Комментарий мастера :'
    end
    object Label11: TLabel
      Left = 144
      Top = 324
      Width = 175
      Height = 13
      Caption = 'Фактические затраты на ремонт :'
    end
    object Label12: TLabel
      Left = 552
      Top = 324
      Width = 51
      Height = 13
      Caption = 'К оплате :'
    end
    object Label13: TLabel
      Left = 68
      Top = 348
      Width = 69
      Height = 13
      Caption = 'Примечания :'
    end
    object Button1: TButton
      Left = 652
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Сохранить'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 652
      Top = 36
      Width = 75
      Height = 25
      Caption = 'Применить'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 652
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Закрыть'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Edit1: TEdit
      Left = 144
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object DateEdit1: TDateEdit
      Left = 396
      Top = 8
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
    end
    object Edit2: TEdit
      Left = 144
      Top = 36
      Width = 229
      Height = 21
      TabOrder = 5
    end
    object Edit3: TEdit
      Left = 144
      Top = 60
      Width = 497
      Height = 21
      TabOrder = 6
    end
    object Edit4: TEdit
      Left = 144
      Top = 84
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object DateEdit2: TDateEdit
      Left = 396
      Top = 84
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 8
    end
    object Memo1: TMemo
      Left = 144
      Top = 108
      Width = 585
      Height = 109
      TabOrder = 9
    end
    object RxSpinEdit1: TRxSpinEdit
      Left = 144
      Top = 220
      Width = 81
      Height = 21
      TabOrder = 10
    end
    object Edit5: TEdit
      Left = 292
      Top = 220
      Width = 349
      Height = 21
      TabOrder = 11
    end
    object Memo2: TMemo
      Left = 144
      Top = 244
      Width = 585
      Height = 73
      TabOrder = 12
    end
    object RxCalcEdit1: TRxCalcEdit
      Left = 324
      Top = 320
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 р##'
      NumGlyphs = 2
      TabOrder = 13
    end
    object RxCalcEdit2: TRxCalcEdit
      Left = 608
      Top = 320
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00 р##'
      NumGlyphs = 2
      TabOrder = 14
    end
    object Memo3: TMemo
      Left = 144
      Top = 344
      Width = 585
      Height = 57
      TabOrder = 15
    end
  end
end
