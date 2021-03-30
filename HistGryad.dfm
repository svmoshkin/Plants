object fHistGryad: TfHistGryad
  Left = -7
  Top = 178
  Width = 1262
  Height = 750
  Caption = #1055#1086#1089#1072#1076#1082#1080' '#1085#1072' '#1075#1088#1103#1076#1082#1091' '#8470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image4: TImage
    Left = 0
    Top = 0
    Width = 804
    Height = 723
    Align = alClient
  end
  object Panel1: TPanel
    Left = 804
    Top = 0
    Width = 450
    Height = 723
    Align = alRight
    TabOrder = 0
    object Button1: TButton
      Left = 32
      Top = 680
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 16
      Width = 439
      Height = 325
      Caption = #1055#1086#1089#1072#1076#1082#1080' '#1085#1072' '#1075#1088#1103#1076#1082#1091
      TabOrder = 1
      object DBGrid6: TDBGrid
        Left = 5
        Top = 16
        Width = 426
        Height = 291
        DataSource = DM.dsGryadYHist
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'A'
            Title.Caption = #1041#1099#1083#1086' '#1087#1086#1089#1072#1078#1077#1085#1086' '#1085#1072' '#1075#1088#1103#1076#1082#1091
            Width = 335
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Res'
            Title.Caption = #1054#1094#1077#1085#1082#1072
            Width = 54
            Visible = True
          end>
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 22
        Width = 423
        Height = 293
        DataSource = DM.dsSecHist
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGrid1CellClick
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'B'
            Title.Caption = #8470
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'A'
            Title.Caption = #1055#1086#1089#1072#1076#1082#1080' '#1073#1083#1086#1082#1072
            Width = 232
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PlantDate'
            Title.Caption = #1055#1086#1089#1072#1078#1077#1085#1086
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Res'
            Title.Caption = #1054#1094#1077#1085#1082#1072
            Width = 55
            Visible = True
          end>
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 360
      Width = 439
      Height = 299
      Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1080' '#1075#1088#1103#1076#1082#1080
      TabOrder = 2
      object DBGrid2: TDBGrid
        Left = -2
        Top = 18
        Width = 437
        Height = 265
        DataSource = DM.dsObr
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'B'
            Title.Caption = #8470
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Operation'
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
            Width = 316
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Date'
            Title.Caption = #1044#1072#1090#1072
            Width = 53
            Visible = True
          end>
      end
    end
  end
end
