object fSvod: TfSvod
  Left = 377
  Top = 136
  Width = 923
  Height = 820
  Caption = 'fSvod'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 907
    Height = 740
    Align = alClient
    TabOrder = 0
    DesignSize = (
      907
      740)
    object Label1: TLabel
      Left = 33
      Top = 12
      Width = 27
      Height = 13
      Caption = #1042#1080#1076#1099
    end
    object Label2: TLabel
      Left = 303
      Top = 15
      Width = 30
      Height = 13
      Caption = #1057#1086#1088#1090#1072
    end
    object Label3: TLabel
      Left = 594
      Top = 18
      Width = 85
      Height = 13
      Caption = #1057#1072#1078#1072#1077#1084' '#1088#1072#1089#1089#1072#1076#1091
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 30
      Width = 243
      Height = 706
      Anchors = [akLeft, akTop, akBottom]
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
          FieldName = 'Title'
          Title.Caption = #1042#1080#1076
          Width = 155
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N'
          Title.Caption = #1064#1090#1091#1082
          Width = 45
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 252
      Top = 36
      Width = 262
      Height = 697
      Anchors = [akLeft, akTop, akBottom]
      DataSource = DataSource2
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = #1057#1086#1088#1090
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N'
          Title.Caption = #1064#1090#1091#1082
          Width = 44
          Visible = True
        end>
    end
    object Memo1: TRichEdit
      Left = 531
      Top = 39
      Width = 370
      Height = 697
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'Memo1')
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 740
    Width = 907
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 216
      Top = 9
      Width = 75
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 681
      Top = 6
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 60
    Top = 75
  end
  object DataSource2: TDataSource
    Left = 327
    Top = 102
  end
end
