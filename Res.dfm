object fRes: TfRes
  Left = 210
  Top = 204
  Width = 831
  Height = 648
  Caption = 'fRes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 513
    Width = 138
    Height = 13
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1091
  end
  object Image1: TImage
    Left = 315
    Top = 12
    Width = 484
    Height = 511
    Proportional = True
    Stretch = True
    OnDblClick = Image1DblClick
  end
  object Memo1: TMemo
    Left = 15
    Top = 9
    Width = 289
    Height = 355
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 9
    Top = 534
    Width = 784
    Height = 21
    DataField = 'Comment'
    DataSource = fIHistory.DataSource1
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 568
    Width = 815
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button1: TButton
      Left = 60
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Button2: TButton
    Left = 195
    Top = 441
    Width = 105
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1086#1090#1086
    TabOrder = 3
    OnClick = Button2Click
  end
  object OPD1: TOpenPictureDialog
    Filter = 
      'All (*.gif;*.jpg;*.jpeg;*.bmp)|*.gif;*.jpg;*.jpeg;*.bmp|CompuSer' +
      've GIF Image (*.gif)|*.gif|JPEG Image File (*.jpg)|*.jpg|JPEG Im' +
      'age File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp'
    Title = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1086#1090#1086' '#1076#1083#1103' '#1089#1086#1088#1090#1072
    Left = 310
    Top = 120
  end
end
