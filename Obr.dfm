object fObr: TfObr
  Left = 1151
  Top = 378
  Width = 461
  Height = 326
  Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1080' '#1087#1086#1089#1072#1076#1086#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 246
    Width = 445
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 58
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 445
    Height = 246
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 38
      Top = 12
      Width = 213
      Height = 13
      Caption = #1054#1087#1077#1088#1072#1094#1080#1103' '#1085#1072' '#1091#1095#1072#1089#1090#1082#1077' '#1075#1088#1103#1076#1082#1080' '#1089' '#1087#1086#1089#1072#1076#1082#1072#1084#1080
    end
    object Label12: TLabel
      Left = 314
      Top = 33
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object DBMemo1: TDBMemo
      Left = 18
      Top = 34
      Width = 273
      Height = 127
      DataField = 'Operation'
      DataSource = DataSource1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 22
      Top = 190
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
    object DateTimePicker1: TDateTimePicker
      Left = 302
      Top = 53
      Width = 131
      Height = 21
      Date = 43216.891734479170000000
      Time = 43216.891734479170000000
      TabOrder = 2
    end
  end
  object DataSource1: TDataSource
    Left = 356
    Top = 122
  end
end
