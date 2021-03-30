object fSeeds: TfSeeds
  Left = 367
  Top = 360
  Width = 437
  Height = 320
  Caption = 'fSeeds'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 421
    Height = 240
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 34
      Width = 419
      Height = 205
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Firm'
          Title.Caption = #1060#1080#1088#1084#1072
          Width = 217
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Gram'
          Title.Caption = #1043#1088#1072#1084#1084
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Shtuk'
          Title.Caption = #1064#1090#1091#1082
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'YearTo'
          Title.Caption = #1043#1086#1076#1085#1099' '#1076#1086'  ('#1075#1086#1076')'
          Width = 83
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 419
      Height = 33
      Align = alTop
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 18
        Top = 3
        Width = 172
        Height = 25
        DataSource = DataSource1
        VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 240
    Width = 421
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 33
      Top = 6
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.qSeeds
    Left = 165
    Top = 165
  end
end
