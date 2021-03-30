object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 758
  Top = 215
  Height = 706
  Width = 710
  object ADOConnection1: TADOConnection
    CommandTimeout = 20
    ConnectionString = 
      'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initi' +
      'al Catalog=Plants;Data Source=SV\SQLSERVER2019;Use Procedure for' +
      ' Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=D' +
      'ACHA;Use Encryption for Data=False;Tag with column collation whe' +
      'n possible=False;'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 22
  end
  object tCat: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'categories'
    Left = 116
    Top = 18
  end
  object qSort: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterInsert = qSortAfterInsert
    Parameters = <>
    SQL.Strings = (
      'Select * from [sort] order by Title')
    Left = 112
    Top = 128
  end
  object qVid: TADOQuery
    Connection = ADOConnection1
    AfterInsert = qVidAfterInsert
    Parameters = <>
    Left = 110
    Top = 72
  end
  object qRes: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 336
    Top = 124
  end
  object qUdobr: TADOQuery
    Connection = ADOConnection1
    AfterInsert = qUdobrAfterInsert
    Parameters = <>
    Left = 188
    Top = 182
  end
  object qGryd: TADOQuery
    Connection = ADOConnection1
    AfterInsert = qGrydAfterInsert
    Parameters = <>
    Left = 406
    Top = 86
  end
  object tLetn: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Letn'
    Left = 208
    Top = 24
  end
  object dsLetn: TDataSource
    DataSet = tLetn
    Left = 210
    Top = 78
  end
  object tRost: TADOTable
    Connection = ADOConnection1
    TableName = 'rost'
    Left = 266
    Top = 24
  end
  object dsRost: TDataSource
    DataSet = tRost
    Left = 278
    Top = 74
  end
  object q1Time: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 336
    Top = 190
  end
  object q2Time: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 384
    Top = 190
  end
  object qPosad: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 458
    Top = 144
  end
  object q3Time: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 436
    Top = 196
  end
  object qHist: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select year,(select (select title from dbo.item i where i.id=ite' +
        'm_id)+'
      '    '#39' '#39'+ title from dbo.sort s where s.id=sort_id) as sort,'
      
        '  plantdate,Sht,STComment, id,Sort_ID,Image,Rass_ID,  (select Nu' +
        'm from dbo.gryad where id=gryad_id) as Num, '
      '  res,urog,Comment,ResDate from dbo.results')
    Left = 322
    Top = 254
    object qHistyear: TIntegerField
      FieldName = 'year'
    end
    object qHistsort: TStringField
      FieldName = 'sort'
      ReadOnly = True
      Size = 251
    end
    object qHistplantdate: TDateTimeField
      FieldName = 'plantdate'
    end
    object qHistSht: TStringField
      FieldName = 'Sht'
      Size = 50
    end
    object qHistSTComment: TStringField
      FieldName = 'STComment'
      Size = 150
    end
    object qHistid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qHistSort_ID: TIntegerField
      FieldName = 'Sort_ID'
    end
    object qHistImage: TStringField
      FieldName = 'Image'
      Size = 100
    end
    object qHistRass_ID: TIntegerField
      FieldName = 'Rass_ID'
    end
    object qHistNum: TIntegerField
      FieldName = 'Num'
      ReadOnly = True
    end
    object qHistres: TIntegerField
      FieldName = 'res'
    end
    object qHisturog: TFloatField
      FieldName = 'urog'
    end
    object qHistComment: TStringField
      FieldName = 'Comment'
      Size = 6000
    end
    object qHistResDate: TDateTimeField
      FieldName = 'ResDate'
    end
  end
  object dsHist: TDataSource
    DataSet = qHist
    Left = 276
    Top = 254
  end
  object qSHist: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select year,res,urog,(select Num  from gryad s where s.id=Gryad_' +
        'id) as Num,plantdate,Sht,'
      
        '   IsNull(STComment+'#39' '#39','#39#39')+Comment) as Comment from results whe' +
        're Sort_Id=5')
    Left = 186
    Top = 260
  end
  object qIHist: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select year,res,urog,(select Num  from gryad s where s.id=Gryad_' +
        'id) as Num,plantdate,Sht,Gryad_id,'
      
        '   (STComment+'#39' '#39'+Comment) as Comment from results where Sort_Id' +
        '=5')
    Left = 116
    Top = 256
  end
  object qCurGrid: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 85
    Top = 394
  end
  object qHistGrid: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 468
    Top = 26
  end
  object qPosadB: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select *, CONVERT(Varchar(4),Shtuk)+'#39' '#39'+(select (select title fr' +
        'om item i where i.id=s.item_id)+ '
      
        '   '#39' '#39'+Title +'#39' '#39'    from sort s where s.Id=r.sort_id ) as A fro' +
        'm results r where '
      '         Deleted=0 ')
    Left = 460
    Top = 93
    object qPosadBid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qPosadByear: TIntegerField
      FieldName = 'year'
    end
    object qPosadBurog: TFloatField
      FieldName = 'urog'
    end
    object qPosadBres: TIntegerField
      FieldName = 'res'
    end
    object qPosadBcomment: TStringField
      FieldName = 'comment'
      Size = 6000
    end
    object qPosadBimage: TStringField
      FieldName = 'image'
      Size = 100
    end
    object qPosadBsort_id: TIntegerField
      FieldName = 'sort_id'
    end
    object qPosadBplantdate: TDateTimeField
      FieldName = 'plantdate'
    end
    object qPosadBgryad_id: TIntegerField
      FieldName = 'gryad_id'
    end
    object qPosadBShtuk: TIntegerField
      FieldName = 'Shtuk'
    end
    object qPosadBSTComment: TStringField
      FieldName = 'STComment'
      Size = 150
    end
    object qPosadBDeleted: TWordField
      FieldName = 'Deleted'
    end
    object qPosadBShT: TStringField
      FieldName = 'ShT'
      Size = 50
    end
    object qPosadBSect_ID: TIntegerField
      FieldName = 'Sect_ID'
    end
    object qPosadBMnLetn: TSmallintField
      FieldName = 'MnLetn'
    end
    object qPosadBGeneration: TSmallintField
      FieldName = 'Generation'
    end
    object qPosadBRass_ID: TIntegerField
      FieldName = 'Rass_ID'
    end
    object qPosadBResDate: TDateTimeField
      FieldName = 'ResDate'
    end
    object qPosadBA: TStringField
      FieldName = 'A'
      ReadOnly = True
      Size = 257
    end
  end
  object dsGryadYHist: TDataSource
    DataSet = qGryadYHist
    Left = 430
    Top = 252
  end
  object qGryadYHist: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 506
    Top = 254
  end
  object dsSecHist: TDataSource
    DataSet = qSecHist
    Left = 290
    Top = 324
  end
  object qSecHist: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 350
    Top = 322
  end
  object dsRass: TDataSource
    DataSet = qRass1
    Left = 46
    Top = 318
  end
  object qRass: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 196
    Top = 328
  end
  object qRass1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        ' Select *,(select (select title from item i where i.id=s.item_id' +
        ')'
      
        '     +'#39' "'#39'+Title +'#39'"'#39'  from sort s where s.Id=r.sort_id ) as A  ' +
        'from Rassada r where Year=2019')
    Left = 104
    Top = 320
  end
  object qObr: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 574
    Top = 52
  end
  object dsObr: TDataSource
    DataSet = qObr
    Left = 580
    Top = 112
  end
  object qSvod: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select id, (select (select title from item i where i.id=s.item_i' +
        'd)+'#39' "'#39'+Title +'#39'"'#39' '
      
        ' from sort s where s.Id=r.sort_id ) as A,urog, res, comment, sor' +
        't_id,'
      
        ' plantdate,(select Num from dbo.gryad g where g.id=r.gryad_id) a' +
        's B,Shtuk,'
      
        ' STComment,  ShT,  ResDate from dbo.results r where YEAR=2018 or' +
        'der by A')
    Left = 476
    Top = 324
  end
  object qSeeds: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterInsert = qSeedsAfterInsert
    BeforePost = qSeedsBeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from Seeds')
    Left = 603
    Top = 228
    object qSeedsId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object qSeedsFirm: TStringField
      FieldName = 'Firm'
      Size = 50
    end
    object qSeedsYearTo: TIntegerField
      FieldName = 'YearTo'
    end
    object qSeedsShtuk: TIntegerField
      FieldName = 'Shtuk'
    end
    object qSeedsGram: TFloatField
      FieldName = 'Gram'
    end
    object qSeedsSort_ID: TIntegerField
      FieldName = 'Sort_ID'
    end
  end
  object qLong: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 58
    Top = 193
  end
  object SeedYear: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'GetSeedYear'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@SortID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Y'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 609
    Top = 312
  end
  object SeedAll: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'GetSeedAll'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@SortID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 543
    Top = 324
  end
  object qGryadtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 522
    Top = 29
  end
  object qCurtmpGryad: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 151
    Top = 394
  end
  object dsGryadTmp: TDataSource
    DataSet = qGryadtmp
    Left = 517
    Top = 83
  end
  object qLongTime: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 318
    Top = 441
  end
end
