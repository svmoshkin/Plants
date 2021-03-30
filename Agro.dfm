object fAgro: TfAgro
  Left = 79
  Top = 309
  Width = 1194
  Height = 485
  Caption = '. '#1054#1073#1088#1072#1073#1086#1090#1082#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1178
    Height = 405
    Align = alClient
    TabOrder = 0
    DesignSize = (
      1178
      405)
    object DBNavigator1: TDBNavigator
      Left = 20
      Top = 2
      Width = 224
      Height = 25
      DataSource = DataSource1
      VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 4
      Top = 32
      Width = 1180
      Height = 383
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Udobr'
          Title.Caption = #1059#1076#1086#1073#1088#1077#1085#1080#1077' ('#1076#1077#1081#1089#1090#1074#1080#1077')'
          Width = 194
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'srok'
          Title.Caption = #1044#1085#1077#1081' '#1086#1090' '#1087#1086#1089#1072#1076#1082#1080
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'spos'
          Title.Caption = #1057#1087#1086#1089#1086#1073
          Width = 860
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 405
    Width = 1178
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 24
      Top = 9
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.qUdobr
    Left = 638
    Top = 12
  end
end
