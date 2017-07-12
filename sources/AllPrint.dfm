object All_Print: TAll_Print
  Left = 69
  Top = 184
  Width = 801
  Height = 488
  Caption = 'All_Print'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 793
    Height = 461
    ActivePage = TabSheet5
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheet5: TTabSheet
      Caption = 'Отчёт об остатках'
      ImageIndex = 4
      object QuickRep5: TQuickRep
        Left = 0
        Top = 0
        Width = 794
        Height = 1123
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        DataSet = DataModule1.ReportOst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Functions.Strings = (
          'PAGENUMBER'
          'COLUMNNUMBER'
          'REPORTTITLE')
        Functions.DATA = (
          '0'
          '0'
          #39#39)
        Options = [LastPageFooter]
        Page.Columns = 1
        Page.Orientation = poPortrait
        Page.PaperSize = A4
        Page.Values = (
          100
          2970
          100
          2100
          100
          100
          0)
        PrinterSettings.Copies = 1
        PrinterSettings.Duplex = False
        PrinterSettings.FirstPage = 0
        PrinterSettings.LastPage = 0
        PrinterSettings.OutputBin = Auto
        PrintIfEmpty = True
        ReportTitle = 'Отчёт об остатках'
        SnapToGrid = True
        Units = MM
        Zoom = 100
        object PageHeaderBand2: TQRBand
          Left = 38
          Top = 38
          Width = 718
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            39.6875
            1899.70833333333)
          BandType = rbPageHeader
          object QRLabel132: TQRLabel
            Left = 624
            Top = 0
            Width = 53
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1651
              0
              140.229166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'страница №'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRSysData5: TQRSysData
            Left = 680
            Top = 0
            Width = 33
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1799.16666666667
              0
              87.3125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            Color = clWhite
            Data = qrsPageNumber
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            FontSize = 7
          end
          object QRLabel133: TQRLabel
            Left = 0
            Top = 0
            Width = 118
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              0
              0
              312.208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Отчёт об остатках товаров'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRSysData6: TQRSysData
            Left = 500
            Top = 0
            Width = 50
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1322.91666666667
              0
              132.291666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            Color = clWhite
            Data = qrsDateTime
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            FontSize = 7
          end
          object OST_TITLE2: TQRLabel
            Left = 120
            Top = 0
            Width = 53
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              317.5
              0
              140.229166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'OST_TITLE2'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
        object TitleBand2: TQRBand
          Left = 38
          Top = 53
          Width = 718
          Height = 20
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            52.9166666666667
            1899.70833333333)
          BandType = rbTitle
          object QRLabel134: TQRLabel
            Left = 0
            Top = 0
            Width = 163
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              0
              0
              431.270833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Отчёт об остатках товаров '
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object OST_TITLE: TQRLabel
            Left = 168
            Top = 0
            Width = 549
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              444.5
              0
              1452.5625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'OST_TITLE'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 9
          end
        end
        object ColumnHeaderBand2: TQRBand
          Left = 38
          Top = 73
          Width = 718
          Height = 20
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            52.9166666666667
            1899.70833333333)
          BandType = rbColumnHeader
          object QRLabel136: TQRLabel
            Left = 4
            Top = 4
            Width = 22
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              10.5833333333333
              10.5833333333333
              58.2083333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = '№ п/п'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel137: TQRLabel
            Left = 44
            Top = 4
            Width = 15
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              116.416666666667
              10.5833333333333
              39.6875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Код'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel138: TQRLabel
            Left = 84
            Top = 4
            Width = 53
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              222.25
              10.5833333333333
              140.229166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Наименование'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel139: TQRLabel
            Left = 400
            Top = 4
            Width = 31
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              1058.33333333333
              10.5833333333333
              82.0208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Ед. изм.'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel140: TQRLabel
            Left = 464
            Top = 4
            Width = 39
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              1227.66666666667
              10.5833333333333
              103.1875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Розн. цена'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel141: TQRLabel
            Left = 536
            Top = 4
            Width = 31
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              1418.16666666667
              10.5833333333333
              82.0208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Остаток'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel142: TQRLabel
            Left = 588
            Top = 4
            Width = 48
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              1555.75
              10.5833333333333
              127)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Сумма в зак.'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel143: TQRLabel
            Left = 656
            Top = 4
            Width = 52
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              1735.66666666667
              10.5833333333333
              137.583333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Сумма в розн.'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
        end
        object DetailBand2: TQRBand
          Left = 38
          Top = 109
          Width = 718
          Height = 12
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            31.75
            1899.70833333333)
          BandType = rbDetail
          object QRDBText76: TQRDBText
            Left = 644
            Top = 0
            Width = 70
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1703.91666666667
              0
              185.208333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'TW_SUMMR'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Mask = '#0.00 р'
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText77: TQRDBText
            Left = 572
            Top = 0
            Width = 70
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1513.41666666667
              0
              185.208333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'TW_SUMMZ'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Mask = '#0.00 р'
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText78: TQRDBText
            Left = 436
            Top = 0
            Width = 70
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1153.58333333333
              0
              185.208333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'TW_MROZ'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Mask = '#0.00 р'
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText79: TQRDBText
            Left = 508
            Top = 0
            Width = 62
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1344.08333333333
              0
              164.041666666667)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'OST'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Mask = ',#0.0000'
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText80: TQRDBText
            Left = 400
            Top = 0
            Width = 31
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1058.33333333333
              0
              82.0208333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'ED_SHORT'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText81: TQRDBText
            Left = 88
            Top = 0
            Width = 309
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              232.833333333333
              0
              817.5625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'TW_NAM'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText82: TQRDBText
            Left = 32
            Top = 0
            Width = 56
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              84.6666666666667
              0
              148.166666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'TW_ART'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRExpr17: TQRExpr
            Left = 0
            Top = 0
            Width = 29
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              0
              0
              76.7291666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            ResetAfterPrint = False
            Transparent = True
            WordWrap = True
            Expression = 'COUNT'
            FontSize = 7
          end
        end
        object SummaryBand2: TQRBand
          Left = 38
          Top = 137
          Width = 718
          Height = 40
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Frame.Width = 2
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            105.833333333333
            1899.70833333333)
          BandType = rbSummary
          object QRLabel145: TQRLabel
            Left = 0
            Top = 4
            Width = 38
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              0
              10.5833333333333
              100.541666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Итого :'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            OnPrint = QRLabel145Print
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object QRExpr20: TQRExpr
            Left = 572
            Top = 4
            Width = 70
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1513.41666666667
              10.5833333333333
              185.208333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Color = clWhite
            ParentFont = False
            ResetAfterPrint = True
            Transparent = False
            WordWrap = True
            Expression = 'SUM(ReportOst.TW_SUMMZ)'
            Mask = ',#0.00 р'
            FontSize = 7
          end
          object QRExpr21: TQRExpr
            Left = 644
            Top = 4
            Width = 70
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1703.91666666667
              10.5833333333333
              185.208333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Color = clWhite
            ParentFont = False
            ResetAfterPrint = True
            Transparent = False
            WordWrap = True
            Expression = 'SUM(ReportOst.TW_SUMMR)'
            Mask = ',#0.00 р'
            FontSize = 7
          end
          object QRLabel147: TQRLabel
            Left = 4
            Top = 24
            Width = 96
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              10.5833333333333
              63.5
              254)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Документ напечатал :'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object OST_FIO: TQRLabel
            Left = 108
            Top = 24
            Width = 42
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              285.75
              63.5
              111.125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'PNR_FIO'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
        object PageFooterBand2: TQRBand
          Left = 38
          Top = 177
          Width = 718
          Height = 8
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            21.1666666666667
            1899.70833333333)
          BandType = rbPageFooter
          object QRLabel146: TQRLabel
            Left = 412
            Top = 0
            Width = 306
            Height = 9
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              23.8125
              1090.08333333333
              0
              809.625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 
              'Подготовлено и отпечатано в системе "АРМ-Склад" ver 3.01, ® Begi' +
              'nner. Бритвин Сергей. 1997-1999, E-mail: Beginner@inbox.ru'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -5
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 4
          end
        end
        object QRGroup1: TQRGroup
          Left = 38
          Top = 93
          Width = 718
          Height = 16
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Frame.Width = 2
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            42.3333333333333
            1899.70833333333)
          Expression = 'ReportOst.TWTREE_ID'
          FooterBand = QRBand18
          Master = QuickRep5
          ReprintOnNewPage = False
          object QRLabel135: TQRLabel
            Left = 0
            Top = 0
            Width = 95
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              0
              0
              251.354166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Группа товаров :'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRDBText75: TQRDBText
            Left = 100
            Top = 0
            Width = 613
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              264.583333333333
              0
              1621.89583333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'TWTREE_FULL'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
        end
        object QRBand18: TQRBand
          Left = 38
          Top = 121
          Width = 718
          Height = 16
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            42.3333333333333
            1899.70833333333)
          BandType = rbGroupFooter
          object QRLabel144: TQRLabel
            Left = 0
            Top = 0
            Width = 139
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              0
              0
              367.770833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Итого в группе товаров :'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object QRExpr18: TQRExpr
            Left = 572
            Top = 0
            Width = 70
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1513.41666666667
              0
              185.208333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Color = clWhite
            ParentFont = False
            ResetAfterPrint = True
            Transparent = False
            WordWrap = True
            Expression = 'SUM(ReportOst.TW_SUMMZ)'
            Mask = ',#0.00 р'
            FontSize = 7
          end
          object QRExpr19: TQRExpr
            Left = 644
            Top = 0
            Width = 70
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1703.91666666667
              0
              185.208333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Color = clWhite
            ParentFont = False
            ResetAfterPrint = True
            Transparent = False
            WordWrap = True
            Expression = 'SUM(ReportOst.TW_SUMMR)'
            Mask = ',#0.00 р'
            FontSize = 7
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Отчёт об остатка для ревизии'
      ImageIndex = 5
      object QuickRep6: TQuickRep
        Left = -1
        Top = 1
        Width = 794
        Height = 1123
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        DataSet = DataModule1.ReportOst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Functions.Strings = (
          'PAGENUMBER'
          'COLUMNNUMBER'
          'REPORTTITLE')
        Functions.DATA = (
          '0'
          '0'
          #39#39)
        Options = [LastPageFooter]
        Page.Columns = 1
        Page.Orientation = poPortrait
        Page.PaperSize = A4
        Page.Values = (
          100
          2970
          100
          2100
          100
          100
          0)
        PrinterSettings.Copies = 1
        PrinterSettings.Duplex = False
        PrinterSettings.FirstPage = 0
        PrinterSettings.LastPage = 0
        PrinterSettings.OutputBin = Auto
        PrintIfEmpty = True
        ReportTitle = 'Отчёт об остатках для ревизии'
        SnapToGrid = True
        Units = MM
        Zoom = 100
        object QRBand19: TQRBand
          Left = 38
          Top = 38
          Width = 718
          Height = 15
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            39.6875
            1899.70833333333)
          BandType = rbPageHeader
          object QRLabel148: TQRLabel
            Left = 624
            Top = 0
            Width = 53
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1651
              0
              140.229166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'страница №'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRSysData7: TQRSysData
            Left = 680
            Top = 0
            Width = 33
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1799.16666666667
              0
              87.3125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            Color = clWhite
            Data = qrsPageNumber
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            FontSize = 7
          end
          object QRLabel149: TQRLabel
            Left = 0
            Top = 0
            Width = 118
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              0
              0
              312.208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Отчёт об остатках товаров'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object QRSysData8: TQRSysData
            Left = 500
            Top = 0
            Width = 50
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1322.91666666667
              0
              132.291666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            Color = clWhite
            Data = qrsDateTime
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            FontSize = 7
          end
          object OST2_TITLE2: TQRLabel
            Left = 120
            Top = 0
            Width = 58
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              317.5
              0
              153.458333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'OST2_TITLE2'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
        object QRBand20: TQRBand
          Left = 38
          Top = 53
          Width = 718
          Height = 20
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            52.9166666666667
            1899.70833333333)
          BandType = rbTitle
          object QRLabel151: TQRLabel
            Left = 0
            Top = 0
            Width = 163
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              0
              0
              431.270833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Отчёт об остатках товаров '
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 10
          end
          object OST2_TITLE: TQRLabel
            Left = 168
            Top = 0
            Width = 549
            Height = 17
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              44.9791666666667
              444.5
              0
              1452.5625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'OST2_TITLE'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 9
          end
        end
        object QRBand21: TQRBand
          Left = 38
          Top = 73
          Width = 718
          Height = 20
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            52.9166666666667
            1899.70833333333)
          BandType = rbColumnHeader
          object QRLabel153: TQRLabel
            Left = 4
            Top = 4
            Width = 22
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              10.5833333333333
              10.5833333333333
              58.2083333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = '№ п/п'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel154: TQRLabel
            Left = 44
            Top = 4
            Width = 15
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              116.416666666667
              10.5833333333333
              39.6875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Код'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel155: TQRLabel
            Left = 84
            Top = 4
            Width = 53
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              222.25
              10.5833333333333
              140.229166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Наименование'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel156: TQRLabel
            Left = 400
            Top = 4
            Width = 31
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              1058.33333333333
              10.5833333333333
              82.0208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Ед. изм.'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel157: TQRLabel
            Left = 464
            Top = 4
            Width = 39
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              1227.66666666667
              10.5833333333333
              103.1875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Розн. цена'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel158: TQRLabel
            Left = 556
            Top = 4
            Width = 31
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              1471.08333333333
              10.5833333333333
              82.0208333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Остаток'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
          object QRLabel150: TQRLabel
            Left = 616
            Top = 4
            Width = 39
            Height = 11
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              29.1041666666667
              1629.83333333333
              10.5833333333333
              103.1875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'В т.ч. брак'
            Color = clWhite
            Transparent = False
            WordWrap = True
            FontSize = 6
          end
        end
        object QRBand22: TQRBand
          Left = 38
          Top = 109
          Width = 718
          Height = 12
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            31.75
            1899.70833333333)
          BandType = rbDetail
          object QRDBText85: TQRDBText
            Left = 436
            Top = 0
            Width = 70
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1153.58333333333
              0
              185.208333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'TW_MROZ'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Mask = '#0.00 р'
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText87: TQRDBText
            Left = 400
            Top = 0
            Width = 31
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1058.33333333333
              0
              82.0208333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'ED_SHORT'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText88: TQRDBText
            Left = 88
            Top = 0
            Width = 309
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              232.833333333333
              0
              817.5625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'TW_NAM'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText89: TQRDBText
            Left = 32
            Top = 0
            Width = 56
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              84.6666666666667
              0
              148.166666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'TW_ART'
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRExpr22: TQRExpr
            Left = 0
            Top = 0
            Width = 29
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              0
              0
              76.7291666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            ResetAfterPrint = False
            Transparent = True
            WordWrap = True
            Expression = 'COUNT'
            FontSize = 7
          end
        end
        object QRBand23: TQRBand
          Left = 38
          Top = 137
          Width = 718
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Frame.Width = 2
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            63.5
            1899.70833333333)
          BandType = rbSummary
          object QRLabel162: TQRLabel
            Left = 4
            Top = 8
            Width = 96
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              10.5833333333333
              21.1666666666667
              254)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Документ напечатал :'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            OnPrint = QRLabel162Print
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
          object OST2_FIO: TQRLabel
            Left = 108
            Top = 8
            Width = 45
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              285.75
              21.1666666666667
              119.0625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'OST2_FIO'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 7
          end
        end
        object QRBand24: TQRBand
          Left = 38
          Top = 161
          Width = 718
          Height = 8
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            21.1666666666667
            1899.70833333333)
          BandType = rbPageFooter
          object QRLabel164: TQRLabel
            Left = 412
            Top = 0
            Width = 306
            Height = 9
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              23.8125
              1090.08333333333
              0
              809.625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 
              'Подготовлено и отпечатано в системе "АРМ-Склад" ver 3.01, ® Begi' +
              'nner. Бритвин Сергей. 1997-1999, E-mail: Beginner@inbox.ru'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -5
            Font.Name = 'Arial'
            Font.Style = [fsUnderline]
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 4
          end
        end
        object QRGroup2: TQRGroup
          Left = 38
          Top = 93
          Width = 718
          Height = 16
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          Frame.Width = 2
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            42.3333333333333
            1899.70833333333)
          Expression = 'ReportOst.TWTREE_ID'
          FooterBand = QRBand25
          Master = QuickRep6
          ReprintOnNewPage = False
          object QRLabel165: TQRLabel
            Left = 0
            Top = 0
            Width = 95
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              0
              0
              251.354166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Группа товаров :'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRDBText90: TQRDBText
            Left = 100
            Top = 0
            Width = 613
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              264.583333333333
              0
              1621.89583333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = DataModule1.ReportOst
            DataField = 'TWTREE_FULL'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
        end
        object QRBand25: TQRBand
          Left = 38
          Top = 121
          Width = 718
          Height = 16
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ForceNewColumn = False
          ForceNewPage = False
          ParentFont = False
          Size.Values = (
            42.3333333333333
            1899.70833333333)
          BandType = rbGroupFooter
        end
      end
    end
  end
end
