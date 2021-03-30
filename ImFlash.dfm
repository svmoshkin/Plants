object fIm: TfIm
  Left = 864
  Top = 81
  Width = 367
  Height = 240
  Caption = #1043#1088#1103#1076#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 351
    Height = 201
    Align = alClient
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 86
    Top = 20
  end
  object Timer2: TTimer
    Interval = 500
    OnTimer = Timer2Timer
    Left = 220
    Top = 52
  end
end
