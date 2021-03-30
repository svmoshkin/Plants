object fIHistory: TfIHistory
  Left = 55
  Top = 317
  Width = 1274
  Height = 735
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1074#1080#1076#1072
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
  object Panel1: TPanel
    Left = 0
    Top = 655
    Width = 1258
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 98
      Top = 10
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1258
    Height = 655
    Align = alClient
    DataSource = DataSource1
    DefaultDrawing = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
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
        Width = 192
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
        FieldName = 'Num'
        Title.Caption = #1043#1088#1103#1076#1082#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sht'
        Title.Caption = #1055#1086#1089#1072#1078#1077#1085#1086
        Width = 70
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
        FieldName = 'resDate'
        Title.Caption = #1059#1073#1086#1088#1082#1072
        Width = 69
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
        Width = 452
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DM.qIHist
    Left = 314
    Top = 146
  end
end
