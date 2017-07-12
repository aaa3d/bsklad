object Edit_KLNTREE: TEdit_KLNTREE
  Left = 78
  Top = 168
  Width = 676
  Height = 132
  Caption = 'Создание раздела в списке контактов'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 192
    Top = 60
    Width = 139
    Height = 13
    Caption = 'Наименование подгруппы :'
  end
  object Label2: TLabel
    Left = 192
    Top = 4
    Width = 182
    Height = 13
    Caption = 'Подгруппа будет создана в группе :'
  end
  object Bevel1: TBevel
    Left = 192
    Top = 20
    Width = 389
    Height = 21
  end
  object Label3: TLabel
    Left = 196
    Top = 24
    Width = 381
    Height = 13
    AutoSize = False
    Caption = 'Label3'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 105
    Align = alLeft
    BevelOuter = bvLowered
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
      Width = 168
      Height = 103
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        '  В данной форме Вы можете '
        'создать новую или изменить '
        'название имеющиейся '
        'подгруппы в древовидном '
        'списке.'
        'Нажатие кнопки "Сохранить" '
        'приведёт к записи изменений '
        'и закрытию формы.'
        'Кнопка "Применить" '
        'сохраняет изменения без '
        'закрытия. Кнопка "Закрыть" '
        'не записывает изменения.'
        'После создания новой группы '
        'она появится в древовидном '
        'списке.')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Edit1: TEdit
    Left = 192
    Top = 80
    Width = 385
    Height = 21
    MaxLength = 254
    TabOrder = 0
    Text = 'Edit1'
    OnChange = Edit1Change
  end
  object BtnSave: TButton
    Left = 588
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Сохранить'
    TabOrder = 2
    OnClick = BtnSaveClick
  end
  object BtnApply: TButton
    Left = 588
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Применить'
    TabOrder = 3
    OnClick = BtnApplyClick
  end
  object BtnClose: TButton
    Left = 588
    Top = 60
    Width = 75
    Height = 25
    Caption = 'Закрыть'
    TabOrder = 4
    OnClick = BtnCloseClick
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    CachedUpdates = False
    Left = 404
    Top = 20
  end
end
