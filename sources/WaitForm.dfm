object Wait_Form: TWait_Form
  Left = 208
  Top = 148
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Состояние'
  ClientHeight = 41
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Gauge1: TGauge
    Left = 0
    Top = 21
    Width = 281
    Height = 20
    Align = alClient
    BackColor = 16762566
    Color = clWhite
    ForeColor = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Progress = 50
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 0
    Width = 281
    Height = 21
    Align = alTop
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
end
