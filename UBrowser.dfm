object fBrowser: TfBrowser
  Left = 68
  Top = 31
  Width = 1193
  Height = 876
  Caption = 'fBrowser'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 1177
    Height = 796
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C000000A5790000455200000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126202000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 796
    Width = 1177
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button2: TButton
      Left = 39
      Top = 10
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 1002
      Top = 7
      Width = 75
      Height = 25
      Caption = #1047#1072#1087#1086#1084#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 534
      Top = 9
      Width = 75
      Height = 25
      Caption = #1053#1072#1079#1072#1076
      TabOrder = 2
      OnClick = Button3Click
    end
  end
end
