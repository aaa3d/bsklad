object REPORT_STAT: TREPORT_STAT
  Left = 211
  Top = 247
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Отчет о текущей статистике продаж'
  ClientHeight = 398
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart1: TDBChart
    Left = 2
    Top = 2
    Width = 359
    Height = 195
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = RUSSIAN_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -11
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Frame.Visible = True
    Title.Text.Strings = (
      'Выручка Наличных продаж за сегодня')
    AxisVisible = False
    Chart3DPercent = 20
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    Legend.ColorWidth = 20
    Legend.Font.Charset = RUSSIAN_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -11
    Legend.Font.Name = 'Arial'
    Legend.Font.Style = []
    Legend.ShadowSize = 2
    Legend.TextStyle = ltsPlain
    Legend.TopPos = 2
    Legend.VertMargin = 1
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DOptions.Zoom = 117
    View3DWalls = False
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderWidth = 1
    TabOrder = 0
    object ButtonStat1: TButton
      Left = 4
      Top = 166
      Width = 75
      Height = 25
      Caption = 'Обновить'
      TabOrder = 0
      OnClick = ButtonStat1Click
    end
    object Series1: TPieSeries
      Marks.ArrowLength = 5
      Marks.Visible = True
      DataSource = QueryStat
      SeriesColor = clRed
      XLabelsSource = 'SHOP_NAME'
      Circled = True
      CustomXRadius = 50
      CustomYRadius = 55
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1
      PieValues.Order = loAscending
      PieValues.ValueSource = 'SUMM'
      RotationAngle = 5
    end
  end
  object DBChart2: TDBChart
    Left = 362
    Top = 2
    Width = 359
    Height = 195
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = RUSSIAN_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -11
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Frame.Visible = True
    Title.Text.Strings = (
      'Выручка Безналичных продаж за сегодня')
    AxisVisible = False
    Chart3DPercent = 20
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    Legend.ColorWidth = 20
    Legend.Font.Charset = RUSSIAN_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -11
    Legend.Font.Name = 'Arial'
    Legend.Font.Style = []
    Legend.ShadowSize = 2
    Legend.TextStyle = ltsPlain
    Legend.TopPos = 2
    Legend.VertMargin = 1
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DOptions.Zoom = 108
    View3DWalls = False
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderWidth = 1
    TabOrder = 1
    object ButtonStat2: TButton
      Left = 4
      Top = 166
      Width = 75
      Height = 25
      Caption = 'Обновить'
      TabOrder = 0
      OnClick = ButtonStat2Click
    end
    object PieSeries1: TPieSeries
      Marks.ArrowLength = 5
      Marks.Visible = True
      DataSource = QueryStat2
      SeriesColor = clRed
      XLabelsSource = 'SHOP_NAME'
      Circled = True
      CustomXRadius = 50
      CustomYRadius = 55
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1
      PieValues.Order = loAscending
      PieValues.ValueSource = 'SUMM'
      RotationAngle = 5
    end
  end
  object DBChart4: TDBChart
    Left = 362
    Top = 198
    Width = 359
    Height = 195
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = RUSSIAN_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -11
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Frame.Visible = True
    Title.Text.Strings = (
      'Выручка Наличных продаж за прошлый месяц')
    AxisVisible = False
    Chart3DPercent = 20
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    Legend.ColorWidth = 20
    Legend.Font.Charset = RUSSIAN_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -11
    Legend.Font.Name = 'Arial'
    Legend.Font.Style = []
    Legend.ShadowSize = 2
    Legend.TextStyle = ltsPlain
    Legend.TopPos = 2
    Legend.VertMargin = 1
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DOptions.Zoom = 117
    View3DWalls = False
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderWidth = 1
    TabOrder = 2
    object ButtonStat4: TButton
      Left = 4
      Top = 166
      Width = 75
      Height = 25
      Caption = 'Обновить'
      TabOrder = 0
      OnClick = ButtonStat4Click
    end
    object PieSeries3: TPieSeries
      Marks.ArrowLength = 5
      Marks.Visible = True
      DataSource = QueryStat4
      SeriesColor = clRed
      XLabelsSource = 'SHOP_NAME'
      Circled = True
      CustomXRadius = 50
      CustomYRadius = 55
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1
      PieValues.Order = loAscending
      PieValues.ValueSource = 'SUMM'
      RotationAngle = 5
    end
  end
  object DBChart3: TDBChart
    Left = 2
    Top = 198
    Width = 359
    Height = 195
    AllowPanning = pmNone
    AllowZoom = False
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    BackWall.Pen.Visible = False
    Title.Font.Charset = RUSSIAN_CHARSET
    Title.Font.Color = clBlack
    Title.Font.Height = -11
    Title.Font.Name = 'Arial'
    Title.Font.Style = []
    Title.Frame.Visible = True
    Title.Text.Strings = (
      'Выручка Наличных продаж за текущий месяц')
    AxisVisible = False
    Chart3DPercent = 20
    ClipPoints = False
    Frame.Visible = False
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    Legend.ColorWidth = 20
    Legend.Font.Charset = RUSSIAN_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -11
    Legend.Font.Name = 'Arial'
    Legend.Font.Style = []
    Legend.ShadowSize = 2
    Legend.TextStyle = ltsPlain
    Legend.TopPos = 2
    Legend.VertMargin = 1
    Legend.Visible = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    View3DOptions.Zoom = 117
    View3DWalls = False
    BevelInner = bvRaised
    BevelOuter = bvLowered
    BorderWidth = 1
    TabOrder = 3
    object ButtonStat3: TButton
      Left = 4
      Top = 166
      Width = 75
      Height = 25
      Caption = 'Обновить'
      TabOrder = 0
      OnClick = ButtonStat3Click
    end
    object PieSeries2: TPieSeries
      Marks.ArrowLength = 5
      Marks.Visible = True
      DataSource = QueryStat3
      SeriesColor = clRed
      XLabelsSource = 'SHOP_NAME'
      Circled = True
      CustomXRadius = 50
      CustomYRadius = 55
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1
      PieValues.Order = loAscending
      PieValues.ValueSource = 'SUMM'
      RotationAngle = 5
    end
  end
  object StatTransaction: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 32
    Top = 46
  end
  object QueryStat: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = StatTransaction
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        '     select sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as ' +
        'tw_nds,shop_name'
      '        from PERS_TORG2(0,0,:dt1,:dt2,0)'
      'where rntyp_id in (1,2007)'
      '        group by shop_name order by shop_name'
      '        ')
    Left = 30
    Top = 94
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt2'
        ParamType = ptUnknown
      end>
    object QueryStatSUMM: TFloatField
      FieldName = 'SUMM'
    end
    object QueryStatTW_NSP: TFloatField
      FieldName = 'TW_NSP'
    end
    object QueryStatTW_NDS: TFloatField
      FieldName = 'TW_NDS'
    end
    object QueryStatSHOP_NAME: TIBStringField
      FieldName = 'SHOP_NAME'
      Size = 254
    end
  end
  object StatTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 400
    Top = 46
  end
  object QueryStat2: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = StatTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        '     select sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as ' +
        'tw_nds,shop_name'
      '        from PERS_TORG2(0,0,:dt1,:dt2,0)'
      'where rntyp_id in (2)'
      '        group by shop_name order by shop_name'
      '        ')
    Left = 396
    Top = 92
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt2'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'SUMM'
    end
    object FloatField2: TFloatField
      FieldName = 'TW_NSP'
    end
    object FloatField3: TFloatField
      FieldName = 'TW_NDS'
    end
    object IBStringField1: TIBStringField
      FieldName = 'SHOP_NAME'
      Size = 254
    end
  end
  object StatTransaction4: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 406
    Top = 240
  end
  object QueryStat4: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = StatTransaction4
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        '     select sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as ' +
        'tw_nds,shop_name'
      '        from PERS_TORG2(0,0,:dt1,:dt2,0)'
      'where rntyp_id in (1,2007)'
      '        group by shop_name order by shop_name'
      '        ')
    Left = 404
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt2'
        ParamType = ptUnknown
      end>
    object FloatField7: TFloatField
      FieldName = 'SUMM'
    end
    object FloatField8: TFloatField
      FieldName = 'TW_NSP'
    end
    object FloatField9: TFloatField
      FieldName = 'TW_NDS'
    end
    object IBStringField3: TIBStringField
      FieldName = 'SHOP_NAME'
      Size = 254
    end
  end
  object StatTransaction3: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 38
    Top = 242
  end
  object QueryStat3: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = StatTransaction3
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        '     select sum(tw_summ) as summ,sum(nsp) as tw_nsp,sum(nds) as ' +
        'tw_nds,shop_name'
      '        from PERS_TORG2(0,0,:dt1,:dt2,0)'
      'where rntyp_id in (1,2007)'
      '        group by shop_name order by shop_name'
      '        ')
    Left = 36
    Top = 290
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dt1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt2'
        ParamType = ptUnknown
      end>
    object FloatField4: TFloatField
      FieldName = 'SUMM'
    end
    object FloatField5: TFloatField
      FieldName = 'TW_NSP'
    end
    object FloatField6: TFloatField
      FieldName = 'TW_NDS'
    end
    object IBStringField2: TIBStringField
      FieldName = 'SHOP_NAME'
      Size = 254
    end
  end
end
