object Print_POST: TPrint_POST
  Left = 16
  Top = 106
  Width = 786
  Height = 442
  Caption = 'Print_POST'
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
    Width = 778
    Height = 415
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Список поставщиков'
      object QuickRep1: TQuickRep
        Left = -20
        Top = 0
        Width = 794
        Height = 1123
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        DataSet = DataModule2.ReportPostList
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        SnapToGrid = True
        Units = MM
        Zoom = 100
        object PageHeaderBand1: TQRBand
          Left = 38
          Top = 38
          Width = 718
          Height = 7
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
            18.5208333333333
            1899.70833333333)
          BandType = rbPageHeader
          object QRLabel7: TQRLabel
            Left = 644
            Top = 0
            Width = 37
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              1703.91666666667
              0
              97.8958333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Страница :'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 5
          end
          object QRSysData1: TQRSysData
            Left = 684
            Top = 0
            Width = 26
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              1809.75
              0
              68.7916666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            Color = clWhite
            Data = qrsPageNumber
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            FontSize = 5
          end
          object TITLE2: TQRLabel
            Left = 0
            Top = 0
            Width = 75
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              0
              0
              198.4375)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Список поставщиков, '
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 5
          end
        end
        object TitleBand1: TQRBand
          Left = 38
          Top = 45
          Width = 718
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          BeforePrint = TitleBand1BeforePrint
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            63.5
            1899.70833333333)
          BandType = rbTitle
          object TITLE1: TQRLabel
            Left = 0
            Top = 0
            Width = 645
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
              1706.5625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'TITLE1'
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
          object QRImage1: TQRImage
            Left = 648
            Top = 0
            Width = 69
            Height = 21
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              55.5625
              1714.5
              0
              182.5625)
            Stretch = True
          end
        end
        object ColumnHeaderBand1: TQRBand
          Left = 38
          Top = 69
          Width = 718
          Height = 16
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          AlignToBottom = False
          Color = 14540253
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            42.3333333333333
            1899.70833333333)
          BandType = rbColumnHeader
          object QRLabel1: TQRLabel
            Left = 40
            Top = 0
            Width = 119
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              105.833333333333
              0
              314.854166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Наименование поставщика'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel2: TQRLabel
            Left = 4
            Top = 0
            Width = 27
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              10.5833333333333
              0
              71.4375)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = '№ п/п'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
        end
        object DetailBand1: TQRBand
          Left = 38
          Top = 85
          Width = 718
          Height = 16
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            42.3333333333333
            1899.70833333333)
          BandType = rbDetail
          object QRDBText1: TQRDBText
            Left = 40
            Top = 0
            Width = 673
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              105.833333333333
              0
              1780.64583333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = DataModule2.ReportPostList
            DataField = 'KLN_FULL'
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRExpr2: TQRExpr
            Left = 4
            Top = 0
            Width = 28
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              10.5833333333333
              0
              74.0833333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Color = clWhite
            ParentFont = False
            ResetAfterPrint = False
            Transparent = True
            WordWrap = True
            Expression = 'count'
            FontSize = 8
          end
        end
        object SummaryBand1: TQRBand
          Left = 38
          Top = 101
          Width = 718
          Height = 32
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            84.6666666666667
            1899.70833333333)
          BandType = rbSummary
          object QRLabel3: TQRLabel
            Left = 4
            Top = 0
            Width = 38
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              10.5833333333333
              0
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
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel4: TQRLabel
            Left = 80
            Top = 0
            Width = 78
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              211.666666666667
              0
              206.375)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'поставщиков.'
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
          object QRLabel5: TQRLabel
            Left = 4
            Top = 16
            Width = 94
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              10.5833333333333
              42.3333333333333
              248.708333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Отчёт построил :'
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
          object USER_FIO: TQRLabel
            Left = 104
            Top = 16
            Width = 56
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              275.166666666667
              42.3333333333333
              148.166666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'USER_FIO'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRExpr1: TQRExpr
            Left = 44
            Top = 0
            Width = 32
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              116.416666666667
              0
              84.6666666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Color = clWhite
            ParentFont = False
            ResetAfterPrint = False
            Transparent = False
            WordWrap = True
            Expression = 'count'
            FontSize = 8
          end
        end
        object PageFooterBand1: TQRBand
          Left = 38
          Top = 133
          Width = 718
          Height = 7
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            18.5208333333333
            1899.70833333333)
          BandType = rbPageFooter
          object QRLabel344: TQRLabel
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
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Движение товара у поставщика подробный'
      ImageIndex = 1
      object QuickRep3: TQuickRep
        Left = 36
        Top = -20
        Width = 1123
        Height = 794
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        DataSet = DataModule2.QrPostMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Page.Orientation = poLandscape
        Page.PaperSize = A4
        Page.Values = (
          100
          2100
          100
          2970
          100
          100
          0)
        PrinterSettings.Copies = 1
        PrinterSettings.Duplex = False
        PrinterSettings.FirstPage = 0
        PrinterSettings.LastPage = 0
        PrinterSettings.OutputBin = Auto
        PrintIfEmpty = True
        SnapToGrid = True
        Units = MM
        Zoom = 100
        object PageHeaderBand2: TQRBand
          Left = 38
          Top = 38
          Width = 1047
          Height = 11
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
            29.1041666666667
            2770.1875)
          BandType = rbPageHeader
          object TITLE2_2: TQRLabel
            Left = 0
            Top = 0
            Width = 34
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              0
              0
              89.9583333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'TITLE2_2'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 5
          end
          object QRLabel22: TQRLabel
            Left = 976
            Top = 0
            Width = 37
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              2582.33333333333
              0
              97.8958333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Страница :'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 5
          end
          object QRSysData3: TQRSysData
            Left = 1016
            Top = 0
            Width = 26
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              2688.16666666667
              0
              68.7916666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            Color = clWhite
            Data = qrsPageNumber
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            FontSize = 5
          end
        end
        object TitleBand2: TQRBand
          Left = 38
          Top = 49
          Width = 1047
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          BeforePrint = TitleBand2BeforePrint
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            63.5
            2770.1875)
          BandType = rbTitle
          object TITLE2_1: TQRLabel
            Left = 0
            Top = 0
            Width = 973
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
              2574.39583333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'TITLE1'
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
          object QRImage3: TQRImage
            Left = 976
            Top = 0
            Width = 69
            Height = 21
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              55.5625
              2582.33333333333
              0
              182.5625)
            Stretch = True
          end
        end
        object ColumnHeaderBand2: TQRBand
          Left = 38
          Top = 73
          Width = 1047
          Height = 16
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            42.3333333333333
            2770.1875)
          BandType = rbColumnHeader
          object QRLabel37: TQRLabel
            Left = 4
            Top = 0
            Width = 27
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              10.5833333333333
              0
              71.4375)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = '№ п/п'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel38: TQRLabel
            Left = 388
            Top = 0
            Width = 49
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1026.58333333333
              0
              129.645833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Код товара'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel39: TQRLabel
            Left = 464
            Top = 0
            Width = 98
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1227.66666666667
              0
              259.291666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Наименование товара'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel40: TQRLabel
            Left = 708
            Top = 0
            Width = 30
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1873.25
              0
              79.375)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Кол-во'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel41: TQRLabel
            Left = 740
            Top = 0
            Width = 36
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1957.91666666667
              0
              95.25)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Ед. изм.'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel42: TQRLabel
            Left = 800
            Top = 0
            Width = 104
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              2116.66666666667
              0
              275.166666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Цена, Сумма в закупке'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel43: TQRLabel
            Left = 940
            Top = 0
            Width = 105
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              2487.08333333333
              0
              277.8125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Цена, Сумма в рознице'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel44: TQRLabel
            Left = 228
            Top = 0
            Width = 30
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              603.25
              0
              79.375)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Клиент'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel45: TQRLabel
            Left = 128
            Top = 0
            Width = 22
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              338.666666666667
              0
              58.2083333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Дата'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel46: TQRLabel
            Left = 36
            Top = 0
            Width = 43
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              95.25
              0
              113.770833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Документ'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
        end
        object DetailBand2: TQRBand
          Left = 38
          Top = 113
          Width = 1047
          Height = 16
          Frame.Color = clSilver
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            42.3333333333333
            2770.1875)
          BandType = rbDetail
          object QRDBText14: TQRDBText
            Left = 24
            Top = 0
            Width = 76
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              63.5
              0
              201.083333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'DOC_FULL_NUM'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText15: TQRDBText
            Left = 128
            Top = 0
            Width = 79
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              338.666666666667
              0
              209.020833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'DOC_DATE_FULL'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText16: TQRDBText
            Left = 228
            Top = 0
            Width = 157
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              603.25
              0
              415.395833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'KLN_FULL'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText17: TQRDBText
            Left = 976
            Top = 0
            Width = 69
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              2582.33333333333
              0
              182.5625)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_SUMMR'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText18: TQRDBText
            Left = 908
            Top = 0
            Width = 69
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              2402.41666666667
              0
              182.5625)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_MROZ'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText19: TQRDBText
            Left = 840
            Top = 0
            Width = 69
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              2222.5
              0
              182.5625)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_SUMMZ'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText20: TQRDBText
            Left = 772
            Top = 0
            Width = 69
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              2042.58333333333
              0
              182.5625)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_MONEY'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText21: TQRDBText
            Left = 744
            Top = 0
            Width = 25
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1968.5
              0
              66.1458333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'ED_SHORT'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText22: TQRDBText
            Left = 672
            Top = 0
            Width = 69
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1778
              0
              182.5625)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_KOL'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText23: TQRDBText
            Left = 464
            Top = 0
            Width = 205
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1227.66666666667
              0
              542.395833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_NAM'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText24: TQRDBText
            Left = 388
            Top = 0
            Width = 73
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1026.58333333333
              0
              193.145833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_ART'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRExpr5: TQRExpr
            Left = 0
            Top = 0
            Width = 25
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
              66.1458333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Color = clWhite
            ParentFont = False
            ResetAfterPrint = False
            Transparent = False
            WordWrap = True
            Expression = 'COUNT'
            FontSize = 7
          end
        end
        object SummaryBand2: TQRBand
          Left = 38
          Top = 149
          Width = 1047
          Height = 40
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            105.833333333333
            2770.1875)
          BandType = rbSummary
          object QRLabel24: TQRLabel
            Left = 4
            Top = 16
            Width = 94
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              10.5833333333333
              42.3333333333333
              248.708333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Отчёт построил :'
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
          object USER2: TQRLabel
            Left = 104
            Top = 16
            Width = 37
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              275.166666666667
              42.3333333333333
              97.8958333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'USER2'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel25: TQRLabel
            Left = 4
            Top = 0
            Width = 59
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              10.5833333333333
              0
              156.104166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'К выдаче :'
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
          object QRExpr8: TQRExpr
            Left = 64
            Top = 0
            Width = 69
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              169.333333333333
              0
              182.5625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Color = clWhite
            OnPrint = QRExpr8Print
            ParentFont = False
            ResetAfterPrint = False
            Transparent = False
            WordWrap = True
            Expression = 'SUM(QrPostMove.SUMM_ACTIV)'
            Mask = '#0.00'
            FontSize = 8
          end
          object ITOG2: TQRLabel
            Left = 136
            Top = 0
            Width = 33
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              359.833333333333
              0
              87.3125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'ITOG2'
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
        end
        object PageFooterBand2: TQRBand
          Left = 38
          Top = 189
          Width = 1047
          Height = 40
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            105.833333333333
            2770.1875)
          BandType = rbPageFooter
        end
        object QRGroup1: TQRGroup
          Left = 38
          Top = 89
          Width = 1047
          Height = 24
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          AlignToBottom = False
          Color = 14540253
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            63.5
            2770.1875)
          Expression = 'QrPostMove.DOC_VID'
          FooterBand = QRBand7
          Master = QuickRep3
          ReprintOnNewPage = False
          object QRDBText13: TQRDBText
            Left = 4
            Top = 4
            Width = 1033
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              10.5833333333333
              10.5833333333333
              2733.14583333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'DOC_VID'
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
        object QRBand7: TQRBand
          Left = 38
          Top = 129
          Width = 1047
          Height = 20
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            52.9166666666667
            2770.1875)
          BandType = rbGroupFooter
          object QRLabel23: TQRLabel
            Left = 4
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
              10.5833333333333
              10.5833333333333
              100.541666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Итого :'
            Color = clWhite
            OnPrint = QRLabel23Print
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object QRExpr6: TQRExpr
            Left = 940
            Top = 0
            Width = 104
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              2487.08333333333
              0
              275.166666666667)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            ResetAfterPrint = True
            Transparent = False
            WordWrap = True
            Expression = 'SUM(QrPostMove.TW_SUMMR)'
            Mask = ',#0.00 руб'
            FontSize = 8
          end
          object QRExpr7: TQRExpr
            Left = 796
            Top = 0
            Width = 116
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              2106.08333333333
              0
              306.916666666667)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            ResetAfterPrint = True
            Transparent = False
            WordWrap = True
            Expression = 'SUM(QrPostMove.TW_SUMMZ)'
            Mask = ',#0.00 руб'
            FontSize = 8
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Остатки товара поставщика'
      ImageIndex = 2
      object QuickRep2: TQuickRep
        Left = 48
        Top = 4
        Width = 1123
        Height = 794
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        DataSet = DataModule2.ReportPostOst
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Page.Orientation = poLandscape
        Page.PaperSize = A4
        Page.Values = (
          100
          2100
          100
          2970
          100
          100
          0)
        PrinterSettings.Copies = 1
        PrinterSettings.Duplex = False
        PrinterSettings.FirstPage = 0
        PrinterSettings.LastPage = 0
        PrinterSettings.OutputBin = Auto
        PrintIfEmpty = True
        SnapToGrid = True
        Units = MM
        Zoom = 100
        object QRBand1: TQRBand
          Left = 38
          Top = 38
          Width = 1047
          Height = 7
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
            18.5208333333333
            2770.1875)
          BandType = rbPageHeader
          object QRLabel6: TQRLabel
            Left = 976
            Top = 0
            Width = 37
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              2582.33333333333
              0
              97.8958333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Страница :'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 5
          end
          object QRSysData2: TQRSysData
            Left = 1016
            Top = 0
            Width = 26
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              2688.16666666667
              0
              68.7916666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            Color = clWhite
            Data = qrsPageNumber
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            FontSize = 5
          end
          object TITLE4: TQRLabel
            Left = 0
            Top = 0
            Width = 75
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              0
              0
              198.4375)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Список поставщиков, '
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 5
          end
        end
        object QRBand2: TQRBand
          Left = 38
          Top = 45
          Width = 1047
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          BeforePrint = QRBand2BeforePrint
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            63.5
            2770.1875)
          BandType = rbTitle
          object TITLE3: TQRLabel
            Left = 0
            Top = 0
            Width = 969
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
              2563.8125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'TITLE1'
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
          object QRImage2: TQRImage
            Left = 976
            Top = 0
            Width = 69
            Height = 21
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              55.5625
              2582.33333333333
              0
              182.5625)
            Stretch = True
          end
        end
        object QRBand3: TQRBand
          Left = 38
          Top = 69
          Width = 1047
          Height = 16
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          AlignToBottom = False
          Color = 14540253
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            42.3333333333333
            2770.1875)
          BandType = rbColumnHeader
          object QRLabel11: TQRLabel
            Left = 4
            Top = 0
            Width = 16
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              10.5833333333333
              0
              42.3333333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Код'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel8: TQRLabel
            Left = 44
            Top = 0
            Width = 98
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              116.416666666667
              0
              259.291666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Наименование товара'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel9: TQRLabel
            Left = 792
            Top = 0
            Width = 59
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              2095.5
              0
              156.104166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Вид поставки'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel10: TQRLabel
            Left = 932
            Top = 0
            Width = 55
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              2465.91666666667
              0
              145.520833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Кто оформил'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel12: TQRLabel
            Left = 736
            Top = 0
            Width = 44
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1947.33333333333
              0
              116.416666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'В рознице'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel13: TQRLabel
            Left = 664
            Top = 0
            Width = 43
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1756.83333333333
              0
              113.770833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'В закупке'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel15: TQRLabel
            Left = 588
            Top = 0
            Width = 35
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1555.75
              0
              92.6041666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Остаток'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel17: TQRLabel
            Left = 536
            Top = 0
            Width = 15
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1418.16666666667
              0
              39.6875)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Ед.'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel18: TQRLabel
            Left = 476
            Top = 0
            Width = 47
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1259.41666666667
              0
              124.354166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Розн. цена'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel20: TQRLabel
            Left = 260
            Top = 0
            Width = 95
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              687.916666666667
              0
              251.354166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Приходная накладная'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel21: TQRLabel
            Left = 384
            Top = 0
            Width = 64
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1016
              0
              169.333333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Дата поставки'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
        end
        object QRBand4: TQRBand
          Left = 38
          Top = 85
          Width = 1047
          Height = 12
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            31.75
            2770.1875)
          BandType = rbDetail
          object QRDBText2: TQRDBText
            Left = 0
            Top = 0
            Width = 38
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
              100.541666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.ReportPostOst
            DataField = 'TW_ART'
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
          object QRDBText3: TQRDBText
            Left = 792
            Top = 0
            Width = 137
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              2095.5
              0
              362.479166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.ReportPostOst
            DataField = 'PNVID_NAM'
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
          object QRDBText4: TQRDBText
            Left = 932
            Top = 0
            Width = 113
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              2465.91666666667
              0
              298.979166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.ReportPostOst
            DataField = 'US_FULL'
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
          object QRDBText5: TQRDBText
            Left = 712
            Top = 0
            Width = 77
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1883.83333333333
              0
              203.729166666667)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.ReportPostOst
            DataField = 'OST_SUMMR'
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
          object QRDBText6: TQRDBText
            Left = 632
            Top = 0
            Width = 77
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1672.16666666667
              0
              203.729166666667)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.ReportPostOst
            DataField = 'OST_SUMMZ'
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
          object QRDBText7: TQRDBText
            Left = 556
            Top = 0
            Width = 77
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1471.08333333333
              0
              203.729166666667)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.ReportPostOst
            DataField = 'TW_OST'
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
          object QRDBText8: TQRDBText
            Left = 456
            Top = 0
            Width = 77
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1206.5
              0
              203.729166666667)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.ReportPostOst
            DataField = 'TW_MROZ'
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
          object QRDBText9: TQRDBText
            Left = 532
            Top = 0
            Width = 25
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1407.58333333333
              0
              66.1458333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.ReportPostOst
            DataField = 'ED_SHORT'
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
          object QRDBText10: TQRDBText
            Left = 40
            Top = 0
            Width = 217
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              105.833333333333
              0
              574.145833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = DataModule2.ReportPostOst
            DataField = 'TW_NAM'
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
          object QRDBText11: TQRDBText
            Left = 260
            Top = 0
            Width = 125
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              687.916666666667
              0
              330.729166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.ReportPostOst
            DataField = 'PN_FULL_NUM'
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
          object QRDBText12: TQRDBText
            Left = 384
            Top = 0
            Width = 73
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1016
              0
              193.145833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.ReportPostOst
            DataField = 'PN_DATE'
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
        object QRBand5: TQRBand
          Left = 38
          Top = 97
          Width = 1047
          Height = 32
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            84.6666666666667
            2770.1875)
          BandType = rbSummary
          object QRLabel14: TQRLabel
            Left = 4
            Top = 16
            Width = 94
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              10.5833333333333
              42.3333333333333
              248.708333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Отчёт построил :'
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
          object USER_FIO2: TQRLabel
            Left = 104
            Top = 16
            Width = 62
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              275.166666666667
              42.3333333333333
              164.041666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'USER_FIO2'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel19: TQRLabel
            Left = 4
            Top = 0
            Width = 38
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              10.5833333333333
              0
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
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRExpr3: TQRExpr
            Left = 632
            Top = 0
            Width = 77
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1672.16666666667
              0
              203.729166666667)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Color = clWhite
            ParentFont = False
            ResetAfterPrint = False
            Transparent = False
            WordWrap = True
            Expression = 'SUM(ReportPostOst.OST_SUMMZ)'
            Mask = ',#0.00 руб'
            FontSize = 7
          end
          object QRExpr4: TQRExpr
            Left = 708
            Top = 0
            Width = 77
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1873.25
              0
              203.729166666667)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Color = clWhite
            ParentFont = False
            ResetAfterPrint = False
            Transparent = False
            WordWrap = True
            Expression = 'SUM(ReportPostOst.OST_SUMMR)'
            Mask = ',#0.00 руб'
            FontSize = 7
          end
        end
        object QRBand6: TQRBand
          Left = 38
          Top = 129
          Width = 1047
          Height = 7
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            18.5208333333333
            2770.1875)
          BandType = rbPageFooter
          object QRLabel16: TQRLabel
            Left = 736
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
              1947.33333333333
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
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
      object QuickRep4: TQuickRep
        Left = -5
        Top = 61
        Width = 794
        Height = 1123
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        DataSet = DataModule2.QrPostMove
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        SnapToGrid = True
        Units = MM
        Zoom = 100
        object QRBand8: TQRBand
          Left = 38
          Top = 38
          Width = 718
          Height = 11
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
            29.1041666666667
            1899.70833333333)
          BandType = rbPageHeader
          object TITLE3_2: TQRLabel
            Left = 0
            Top = 0
            Width = 34
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              0
              0
              89.9583333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'TITLE2_2'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            WordWrap = True
            FontSize = 5
          end
          object QRLabel27: TQRLabel
            Left = 648
            Top = 0
            Width = 37
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              1714.5
              0
              97.8958333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Страница :'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 5
          end
          object QRSysData4: TQRSysData
            Left = 688
            Top = 0
            Width = 26
            Height = 8
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              21.1666666666667
              1820.33333333333
              0
              68.7916666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            Color = clWhite
            Data = qrsPageNumber
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -7
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = False
            FontSize = 5
          end
        end
        object QRBand9: TQRBand
          Left = 38
          Top = 49
          Width = 718
          Height = 24
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          BeforePrint = QRBand9BeforePrint
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            63.5
            1899.70833333333)
          BandType = rbTitle
          object TITLE3_1: TQRLabel
            Left = 0
            Top = 0
            Width = 641
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
              1695.97916666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Caption = 'TITLE1'
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
          object QRImage4: TQRImage
            Left = 644
            Top = 0
            Width = 69
            Height = 21
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              55.5625
              1703.91666666667
              0
              182.5625)
            Stretch = True
          end
        end
        object QRBand10: TQRBand
          Left = 38
          Top = 73
          Width = 718
          Height = 16
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            42.3333333333333
            1899.70833333333)
          BandType = rbColumnHeader
          object QRLabel26: TQRLabel
            Left = 4
            Top = 0
            Width = 27
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              10.5833333333333
              0
              71.4375)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = '№ п/п'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel28: TQRLabel
            Left = 36
            Top = 0
            Width = 49
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              95.25
              0
              129.645833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Код товара'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel29: TQRLabel
            Left = 104
            Top = 0
            Width = 98
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              275.166666666667
              0
              259.291666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Наименование товара'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel31: TQRLabel
            Left = 348
            Top = 0
            Width = 30
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              920.75
              0
              79.375)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Кол-во'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel34: TQRLabel
            Left = 380
            Top = 0
            Width = 36
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1005.41666666667
              0
              95.25)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Ед. изм.'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel35: TQRLabel
            Left = 444
            Top = 0
            Width = 104
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1174.75
              0
              275.166666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Цена, Сумма в закупке'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRLabel36: TQRLabel
            Left = 580
            Top = 0
            Width = 105
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1534.58333333333
              0
              277.8125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Цена, Сумма в рознице'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
        end
        object QRBand11: TQRBand
          Left = 38
          Top = 113
          Width = 718
          Height = 16
          Frame.Color = clSilver
          Frame.DrawTop = False
          Frame.DrawBottom = True
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            42.3333333333333
            1899.70833333333)
          BandType = rbDetail
          object QRDBText28: TQRDBText
            Left = 620
            Top = 0
            Width = 69
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1640.41666666667
              0
              182.5625)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_SUMMR'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText29: TQRDBText
            Left = 548
            Top = 0
            Width = 69
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1449.91666666667
              0
              182.5625)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_MROZ'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText30: TQRDBText
            Left = 480
            Top = 0
            Width = 69
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1270
              0
              182.5625)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_SUMMZ'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText31: TQRDBText
            Left = 412
            Top = 0
            Width = 69
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1090.08333333333
              0
              182.5625)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_MONEY'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText32: TQRDBText
            Left = 384
            Top = 0
            Width = 25
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              1016
              0
              66.1458333333333)
            Alignment = taCenter
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'ED_SHORT'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText33: TQRDBText
            Left = 312
            Top = 0
            Width = 69
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              825.5
              0
              182.5625)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_KOL'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText34: TQRDBText
            Left = 104
            Top = 0
            Width = 205
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              275.166666666667
              0
              542.395833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = True
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_NAM'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRDBText35: TQRDBText
            Left = 28
            Top = 0
            Width = 73
            Height = 13
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              34.3958333333333
              74.0833333333333
              0
              193.145833333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'TW_ART'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 7
          end
          object QRExpr9: TQRExpr
            Left = 0
            Top = 0
            Width = 25
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
              66.1458333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Arial'
            Font.Style = []
            Color = clWhite
            ParentFont = False
            ResetAfterPrint = False
            Transparent = False
            WordWrap = True
            Expression = 'COUNT'
            FontSize = 7
          end
        end
        object QRBand12: TQRBand
          Left = 38
          Top = 149
          Width = 718
          Height = 48
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            127
            1899.70833333333)
          BandType = rbSummary
          object QRLabel30: TQRLabel
            Left = 8
            Top = 32
            Width = 94
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              21.1666666666667
              84.6666666666667
              248.708333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Отчёт построил :'
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
          object USER3: TQRLabel
            Left = 108
            Top = 32
            Width = 37
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              285.75
              84.6666666666667
              97.8958333333333)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'USER3'
            Color = clWhite
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            Transparent = True
            WordWrap = True
            FontSize = 8
          end
          object QRLabel32: TQRLabel
            Left = 4
            Top = 0
            Width = 59
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              10.5833333333333
              0
              156.104166666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'К выдаче :'
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
          object QRExpr10: TQRExpr
            Left = 64
            Top = 0
            Width = 69
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              169.333333333333
              0
              182.5625)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            Color = clWhite
            OnPrint = QRExpr10Print
            ParentFont = False
            ResetAfterPrint = False
            Transparent = False
            WordWrap = True
            Expression = 'SUM(QrPostMove.SUMM_ACTIV)'
            Mask = '#0.00'
            FontSize = 8
          end
          object ITOG3: TQRLabel
            Left = 136
            Top = 0
            Width = 581
            Height = 33
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              87.3125
              359.833333333333
              0
              1537.22916666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Caption = 'ITOG3'
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
        end
        object QRBand13: TQRBand
          Left = 38
          Top = 197
          Width = 718
          Height = 40
          Frame.Color = clBlack
          Frame.DrawTop = False
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            105.833333333333
            1899.70833333333)
          BandType = rbPageFooter
        end
        object QRGroup2: TQRGroup
          Left = 38
          Top = 89
          Width = 718
          Height = 24
          Frame.Color = clGray
          Frame.DrawTop = True
          Frame.DrawBottom = True
          Frame.DrawLeft = True
          Frame.DrawRight = True
          AlignToBottom = False
          Color = 14540253
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            63.5
            1899.70833333333)
          Expression = 'QrPostMove.DOC_VID'
          FooterBand = QRBand14
          Master = QuickRep4
          ReprintOnNewPage = False
          object QRDBText36: TQRDBText
            Left = 4
            Top = 4
            Width = 705
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              10.5833333333333
              10.5833333333333
              1865.3125)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            DataSet = DataModule2.QrPostMove
            DataField = 'DOC_VID'
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
        object QRBand14: TQRBand
          Left = 38
          Top = 129
          Width = 718
          Height = 20
          Frame.Color = clBlack
          Frame.DrawTop = True
          Frame.DrawBottom = False
          Frame.DrawLeft = False
          Frame.DrawRight = False
          AlignToBottom = False
          Color = clWhite
          ForceNewColumn = False
          ForceNewPage = False
          Size.Values = (
            52.9166666666667
            1899.70833333333)
          BandType = rbGroupFooter
          object QRLabel33: TQRLabel
            Left = 4
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
              10.5833333333333
              10.5833333333333
              100.541666666667)
            Alignment = taLeftJustify
            AlignToBand = False
            AutoSize = True
            AutoStretch = False
            Caption = 'Итого :'
            Color = clWhite
            OnPrint = QRLabel33Print
            Transparent = False
            WordWrap = True
            FontSize = 8
          end
          object QRExpr11: TQRExpr
            Left = 596
            Top = 0
            Width = 92
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1576.91666666667
              0
              243.416666666667)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            ResetAfterPrint = True
            Transparent = False
            WordWrap = True
            Expression = 'SUM(QrPostMove.TW_SUMMR)'
            Mask = ',#0.00 руб'
            FontSize = 8
          end
          object QRExpr12: TQRExpr
            Left = 436
            Top = 0
            Width = 112
            Height = 15
            Frame.Color = clBlack
            Frame.DrawTop = False
            Frame.DrawBottom = False
            Frame.DrawLeft = False
            Frame.DrawRight = False
            Size.Values = (
              39.6875
              1153.58333333333
              0
              296.333333333333)
            Alignment = taRightJustify
            AlignToBand = False
            AutoSize = False
            AutoStretch = False
            Color = clWhite
            ResetAfterPrint = True
            Transparent = False
            WordWrap = True
            Expression = 'SUM(QrPostMove.TW_SUMMZ)'
            Mask = ',#0.00 руб'
            FontSize = 8
          end
        end
      end
    end
  end
end
