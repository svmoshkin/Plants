object fGryad: TfGryad
  Left = 4
  Top = 37
  Width = 1430
  Height = 1027
  Caption = #1043#1088#1103#1076#1082#1072' '#8470
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
    Width = 1030
    Height = 988
    Align = alClient
    OnDblClick = Image4DblClick
    OnMouseDown = Image4MouseDown
    OnMouseUp = Image4MouseUp
  end
  object Panel1: TPanel
    Left = 1030
    Top = 0
    Width = 384
    Height = 988
    Align = alRight
    TabOrder = 0
    object Label1: TLabel
      Left = 241
      Top = 14
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 231
      Top = 36
      Width = 80
      Height = 13
      Caption = #1055#1083#1086#1097#1072#1076#1100' '#1073#1083#1086#1082#1072
    end
    object RadioGroup1: TRadioGroup
      Left = 22
      Top = 12
      Width = 144
      Height = 79
      Caption = #1056#1077#1078#1080#1084
      ItemIndex = 0
      Items.Strings = (
        #1042#1099#1073#1086#1088' '#1073#1083#1086#1082#1072
        #1056#1072#1079#1084#1077#1090#1082#1072' '#1073#1083#1086#1082#1086#1074)
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object Button1: TButton
      Left = 35
      Top = 944
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 278
      Top = 944
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
    object Button3: TButton
      Left = 18
      Top = 106
      Width = 101
      Height = 25
      Caption = #1047#1072#1089#1072#1076#1080#1090#1100' '#1073#1083#1086#1082
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 237
      Top = 59
      Width = 133
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1088#1072#1079#1084#1077#1090#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 20
      Top = 142
      Width = 101
      Height = 25
      Caption = #1059#1073#1088#1072#1090#1100' '#1091#1088#1086#1078#1072#1081
      TabOrder = 5
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 288
      Top = 137
      Width = 81
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1073#1083#1086#1082
      TabOrder = 6
      OnClick = Button6Click
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 228
      Width = 373
      Height = 319
      Caption = #1055#1086#1089#1072#1076#1082#1080' '#1085#1072' '#1075#1088#1103#1076#1082#1091
      TabOrder = 7
      object DBGrid1: TDBGrid
        Left = 2
        Top = 27
        Width = 369
        Height = 290
        Align = alBottom
        DataSource = DM.dsSecHist
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
          end>
      end
    end
    object Button7: TButton
      Left = 22
      Top = 178
      Width = 101
      Height = 25
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100
      TabOrder = 8
      OnClick = Button7Click
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 579
      Width = 373
      Height = 346
      Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1080' '#1075#1088#1103#1076#1082#1080
      TabOrder = 9
      object DBGrid2: TDBGrid
        Left = 2
        Top = 33
        Width = 369
        Height = 311
        Align = alBottom
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
            Width = 250
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
    object Button8: TButton
      Left = 286
      Top = 180
      Width = 87
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1073#1083#1086#1082
      TabOrder = 10
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 141
      Top = 105
      Width = 106
      Height = 25
      Caption = #1056#1077#1072#1083#1080#1079#1086#1074#1072#1090#1100' '#1087#1083#1072#1085
      TabOrder = 11
      OnClick = Button9Click
    end
  end
end
