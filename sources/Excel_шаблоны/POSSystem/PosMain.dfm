object POS_MAIN: TPOS_MAIN
  Left = 267
  Top = 229
  Width = 751
  Height = 542
  Caption = 'POS_MAIN'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 164
    Top = 16
    Width = 493
    Height = 405
    TabOrder = 0
  end
  object Button1: TButton
    Left = 72
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Comm1: TComm
    DeviceName = 'Com2'
    MonitorEvents = [evBreak, evCTS, evDSR, evError, evRing, evRlsd, evRxChar, evRxFlag, evTxEmpty]
    Options = []
    OnRxChar = Comm1RxChar
    Left = 72
    Top = 32
  end
end
