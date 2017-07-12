object DIC_SKLAD: TDIC_SKLAD
  Left = 277
  Top = 206
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Список складов'
  ClientHeight = 361
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 189
    Top = 0
    Width = 603
    Height = 361
    Align = alClient
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 601
      Height = 29
      ButtonHeight = 24
      ButtonWidth = 25
      Caption = 'ToolBar1'
      Images = DataModule1.ImageList1
      TabOrder = 0
      object BtnNew: TToolButton
        Left = 0
        Top = 2
        Hint = 'Новый склад...(INS)'
        Caption = 'BtnNew'
        ImageIndex = 0
        OnClick = BtnNewClick
      end
      object BtnOpen: TToolButton
        Left = 25
        Top = 2
        Hint = 'Редактировать данные склада (ENTER)'
        Caption = 'BtnOpen'
        ImageIndex = 1
        OnClick = BtnOpenClick
      end
      object BtnDel: TToolButton
        Left = 50
        Top = 2
        Hint = 'Удалить склад (DEL)'
        Caption = 'BtnDel'
        ImageIndex = 2
        OnClick = BtnDelClick
      end
      object ToolButton4: TToolButton
        Left = 75
        Top = 2
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object BtnUp: TToolButton
        Left = 83
        Top = 2
        Hint = 
          'Переместить вверх в списке "быстрой" информации '#13#10'(Shift+Стрелка' +
          ' Вверх)'
        Caption = 'BtnUp'
        ImageIndex = 33
        OnClick = BtnUpClick
      end
      object BtnDown: TToolButton
        Left = 108
        Top = 2
        Hint = 
          'Переместить вверх в списке "быстрой" информации'#13#10'(Shift+Стрелка ' +
          'вниз)'
        Caption = 'BtnDown'
        ImageIndex = 34
        OnClick = BtnDownClick
      end
      object ToolButton6: TToolButton
        Left = 133
        Top = 2
        Width = 8
        Caption = 'ToolButton6'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object BtnPropertis: TToolButton
        Left = 141
        Top = 2
        Hint = '"История" изменений (F12)'
        Caption = 'BtnPropertis'
        ImageIndex = 3
      end
      object ToolButton1: TToolButton
        Left = 166
        Top = 2
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton2: TToolButton
        Left = 174
        Top = 2
        Hint = 'Заблокировать систему'
        Caption = 'ToolButton2'
        ImageIndex = 110
        OnClick = ToolButton2Click
      end
    end
    object RxDBGrid1: TRxDBGrid
      Left = 1
      Top = 30
      Width = 601
      Height = 311
      Align = alClient
      DataSource = DataSource1
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawDataCell = RxDBGrid1DrawDataCell
      OnDrawColumnCell = RxDBGrid1DrawColumnCell
      OnDblClick = RxDBGrid1DblClick
      OnKeyDown = RxDBGrid1KeyDown
      OnKeyPress = RxDBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'SKL_SPEED'
          Title.Alignment = taCenter
          Title.Caption = ' '
          Width = 19
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SKL_NAME'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SKL_SHORT'
          Title.Alignment = taCenter
          Title.Caption = 'Сокращение'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SKL_ADR'
          Title.Alignment = taCenter
          Title.Caption = 'Адрес'
          Width = 203
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SKL_TEL'
          Title.Alignment = taCenter
          Title.Caption = 'Телефон'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SKL_TIME'
          Title.Alignment = taCenter
          Title.Caption = 'Время работы'
          Width = 160
          Visible = True
        end>
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 341
      Width = 601
      Height = 19
      Panels = <>
      SimplePanel = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 189
    Height = 361
    Align = alLeft
    BevelOuter = bvLowered
    Caption = 'Panel2'
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
      Width = 172
      Height = 359
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        ' Это список складов, '
        'используемых в системе.'
        'Наличие значка "I" в левой '
        'колонке сигнализирует о том, '
        'что в каталоге товаров, зявках '
        'на закупку и других формах '
        'будет выводиться "быстрая" '
        'информация о наличии товара на '
        'этом складе.'
        'Очерёдность показа "быстрой" '
        'информации определяется '
        'положение склада в списке. '
        'Изменить очерёдность можно '
        'кнопками с изображением '
        'стрелок вверх и вниз.'
        'Вся введённая информация о '
        'складе (адрес, телефон, время '
        'работы и т.д. будет печататься '
        'на '
        'документах).')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object QrSklad: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = SkladTransaction
    AfterOpen = QrSkladAfterOpen
    AfterScroll = QrSkladAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select bg_left((select kln.kln_prefix from kln where kln_id = sk' +
        'l.skl_frm)||" ", 32) ||skl.skl_FULL skl_name,  skl.* from SKL or' +
        'der by SKL_SPEED, SKL_FULL')
    Left = 60
    Top = 76
    object QrSkladSKL_NAME: TIBStringField
      FieldName = 'SKL_NAME'
      Size = 1278
    end
    object QrSkladSKL_ID: TIntegerField
      FieldName = 'SKL_ID'
      Origin = 'SKL.SKL_ID'
      Required = True
    end
    object QrSkladSKL_SHORT: TIBStringField
      FieldName = 'SKL_SHORT'
      Origin = 'SKL.SKL_SHORT'
      Required = True
      Size = 32
    end
    object QrSkladSKL_FULL: TIBStringField
      FieldName = 'SKL_FULL'
      Origin = 'SKL.SKL_FULL'
      Required = True
      Size = 254
    end
    object QrSkladSKL_ADR: TIBStringField
      FieldName = 'SKL_ADR'
      Origin = 'SKL.SKL_ADR'
      Size = 254
    end
    object QrSkladSKL_TEL: TIBStringField
      FieldName = 'SKL_TEL'
      Origin = 'SKL.SKL_TEL'
      Size = 254
    end
    object QrSkladSKL_TIME: TIBStringField
      FieldName = 'SKL_TIME'
      Origin = 'SKL.SKL_TIME'
      Size = 254
    end
    object QrSkladSKL_SPEED: TIntegerField
      FieldName = 'SKL_SPEED'
      Origin = 'SKL.SKL_SPEED'
    end
    object QrSkladTM: TDateTimeField
      FieldName = 'TM'
      Origin = 'SKL.TM'
    end
    object QrSkladSKL_FRM: TIntegerField
      FieldName = 'SKL_FRM'
      Origin = 'SKL.SKL_FRM'
    end
  end
  object DataSource1: TDataSource
    DataSet = QrSklad
    Left = 56
    Top = 132
  end
  object SkladTransaction: TIBTransaction
    Active = True
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 60
    Top = 28
  end
end
