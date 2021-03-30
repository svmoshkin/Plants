object fGryadHistory: TfGryadHistory
  Left = 1
  Top = 111
  Width = 1271
  Height = 740
  Anchors = [akLeft, akBottom]
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1075#1088#1103#1076#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1255
    Height = 375
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DM.dsHist
    DefaultDrawing = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'year'
        Title.Caption = #1043#1086#1076
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sort'
        Title.Caption = #1057#1086#1088#1090
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'plantdate'
        Title.Caption = #1055#1086#1089#1072#1076#1082#1072
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sht'
        Title.Caption = #1055#1086#1089#1072#1078#1077#1085#1086
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STComment'
        Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1087#1086#1089#1072#1076#1082#1077
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'urog'
        Title.Caption = #1059#1088#1086#1078#1072#1081' ('#1082#1075')'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'res'
        Title.Caption = #1054#1094#1077#1085#1082#1072
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Comment'
        Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
        Width = 606
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 660
    Width = 1255
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 374
      Top = 16
      Width = 52
      Height = 13
      Caption = #1050#1086#1084#1087#1086#1089#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 58
      Top = 10
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 375
    Width = 1255
    Height = 285
    Align = alClient
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Date'
        Title.Caption = #1044#1072#1090#1072
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Operation'
        Title.Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072
        Width = 1166
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    Left = 1138
    Top = 424
  end
end
