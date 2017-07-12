object UsWork_FORM: TUsWork_FORM
  Left = 111
  Top = 180
  Width = 659
  Height = 240
  Caption = 'Пользователи, работающие с системой'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 185
    Top = 0
    Width = 466
    Height = 213
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 213
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
      Height = 211
      TabStop = False
      Align = alRight
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14548223
      Lines.Strings = (
        '  В даннной форме '
        'отображаются пользователи, '
        'работающиее в настоящий '
        'момент в системе "СКЛАД".'
        '  Также отображается имя '
        'компьютера, на котором '
        'работает пользователь, '
        'операцию, которую он '
        'выполняет и время её начала.'
        '  Данная форма автоматически '
        'обновляется раз в 10 секунд.')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object IBQuery1: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransaction1
    CachedUpdates = False
    Left = 320
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    Left = 320
    Top = 60
  end
end
