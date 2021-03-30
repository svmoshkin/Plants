unit DMPlnts;

interface

uses
  SysUtils, Windows, Classes, ADODB, DB, ShellAPI, ADOUTILSS, DateUtils,
  Graphics,
  Inifiles, Variants;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    tCat: TADOTable;
    qSort: TADOQuery;
    qVid: TADOQuery;
    qRes: TADOQuery;
    qUdobr: TADOQuery;
    qGryd: TADOQuery;
    tLetn: TADOTable;
    dsLetn: TDataSource;
    tRost: TADOTable;
    dsRost: TDataSource;
    q1Time: TADOQuery;
    q2Time: TADOQuery;
    qPosad: TADOQuery;
    q3Time: TADOQuery;
    qHist: TADOQuery;
    dsHist: TDataSource;
    qSHist: TADOQuery;
    qIHist: TADOQuery;
    qCurGrid: TADOQuery;
    qHistGrid: TADOQuery;
    qPosadB: TADOQuery;
    dsGryadYHist: TDataSource;
    qGryadYHist: TADOQuery;
    dsSecHist: TDataSource;
    qSecHist: TADOQuery;
    dsRass: TDataSource;
    qRass: TADOQuery;
    qRass1: TADOQuery;
    qObr: TADOQuery;
    dsObr: TDataSource;
    qSvod: TADOQuery;
    qSeeds: TADOQuery;
    qPosadBid: TAutoIncField;
    qPosadByear: TIntegerField;
    qPosadBurog: TFloatField;
    qPosadBres: TIntegerField;
    qPosadBcomment: TStringField;
    qPosadBimage: TStringField;
    qPosadBsort_id: TIntegerField;
    qPosadBplantdate: TDateTimeField;
    qPosadBgryad_id: TIntegerField;
    qPosadBShtuk: TIntegerField;
    qPosadBSTComment: TStringField;
    qPosadBDeleted: TWordField;
    qPosadBShT: TStringField;
    qPosadBSect_ID: TIntegerField;
    qPosadBMnLetn: TSmallintField;
    qPosadBGeneration: TSmallintField;
    qPosadBRass_ID: TIntegerField;
    qPosadBResDate: TDateTimeField;
    qPosadBA: TStringField;
    qHistyear: TIntegerField;
    qHistsort: TStringField;
    qHistplantdate: TDateTimeField;
    qHistSht: TStringField;
    qHistSTComment: TStringField;
    qHistid: TAutoIncField;
    qHistSort_ID: TIntegerField;
    qHistImage: TStringField;
    qHistRass_ID: TIntegerField;
    qHistNum: TIntegerField;
    qHistres: TIntegerField;
    qHisturog: TFloatField;
    qHistComment: TStringField;
    qHistResDate: TDateTimeField;
    qSeedsId: TAutoIncField;
    qSeedsFirm: TStringField;
    qSeedsYearTo: TIntegerField;
    qSeedsShtuk: TIntegerField;
    qSeedsGram: TFloatField;
    qSeedsSort_ID: TIntegerField;
    qLong: TADOQuery;
    SeedYear: TADOStoredProc;
    SeedAll: TADOStoredProc;
    qGryadtmp: TADOQuery;
    qCurtmpGryad: TADOQuery;
    dsGryadTmp: TDataSource;
    qLongTime: TADOQuery;
    procedure qVidAfterInsert(DataSet: TDataSet);
    procedure tGrydAfterPost(DataSet: TDataSet);
    procedure qSortAfterInsert(DataSet: TDataSet);
    procedure qUdobrAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qGrydAfterInsert(DataSet: TDataSet);
    procedure qSeedsAfterInsert(DataSet: TDataSet);
    procedure qSeedsBeforePost(DataSet: TDataSet);

  private
    { Private declarations }
    Base: string;
    BaseIni: TInifile;
  public
    { Public declarations }
    CurCatID: integer;
    function GetYearGriads(Year: integer; q: TADOQuery): Boolean;
    procedure MakeNewYear(Year: integer);
    procedure NewTMP(Year: integer);
  end;

  TSect = class
  public
    x: real;
    y: real;
    w: real;
    h: real;
    ix: integer;
    ix1: integer;
    iy: integer;
    iy1: integer;
    ID: integer;
    ID_Gryad: integer;
    id_Sort: integer;
    Selected: Boolean;
    Num: integer;
    Generation: integer;
    Year: integer;
    ResDate: integer;
    Deleted: Boolean;
    Invert : Boolean;
    Px, Py, Pd, DB, PN: integer;
    Koef: real;
    procedure Clear;
    constructor Create(Ax, Ay, AW, Ah: real; AGrID: integer; K: real; X0, y0:
      integer; AID: integer = 0);
    constructor CreateFromBase(AID: integer; K: real; X0, y0: integer; Tmp:
      Boolean = False);
    constructor CreateInt(Ax, Ay, AX1, AY1, AGrID: integer; X0, y0: integer; K:
      real);
    procedure Draw(B: TBitmap; X0, y0: integer; N: Boolean = False; Del: Boolean
      = True; ResD: integer = 0; Points: Boolean = False);
    function PointIn(Xi, Yi: integer): Boolean;
    function SectCrossed(A: TSect): Boolean;
    function GetDiagA: real;
    function GetDiagB: real;
    function DiagCross(S: TSect): Boolean;
    procedure PutInBase(Tmp: Boolean = False);
    procedure UpdateSort;
    procedure PutPoints(B: TBitmap; X0, y0: integer);
  end;

var
  DM: TDM;
  CurGryadNum: integer;
  MyPath: string;
  CurYear: integer;
  CurOperYear: integer;
  CurHistYear: integer;
  Fon: TBitmap;
const
  X0 = 20;
  y0 = 16;
  XM = 40;
  YM = 30;

procedure FileOperation(const source, dest: string;
  op, flags: integer);
procedure ClearList(L: TList);
function FillSectList(L: TList; Gr_ID: integer; K: real; X0, y0: integer; Tmp:
  Boolean = False): integer;
procedure PutS(Bmp: TBitmap; X1, Y1, X2, Y2: integer; K: real);

implementation

uses PlantsMain;

{$R *.dfm}

function FillSectList(L: TList; Gr_ID: integer; K: real; X0, y0: integer; Tmp:
  Boolean = False): integer;
var
  S: TSect;
  TName: string;
begin
  if Tmp then
    TName := 'SectionsTmp'
  else
    TName := 'Sections';
  OpenQR('Select ID from ' + TName + ' where Gryad_ID=' + IntToStr(Gr_ID),
    DM.q2Time);
  ClearList(L);
  Result := 1;
  while not DM.q2Time.Eof do
  begin
    S := TSect.CreateFromBase(DM.q2Time['ID'], K, X0, y0, Tmp);
    L.Add(S);
    if S.Generation > Result then
      Result := S.Generation;
    DM.q2Time.Next;
  end;
end;

procedure ClearList(L: TList);
var
  i: integer;
begin
  for i := 0 to L.Count - 1 do
    TObject(L[i]).Free;
  L.Clear;
end;

procedure FileOperation(const source, dest: string;
  op, flags: integer);
var
  shf: TSHFileOpStruct;
  s1, s2: string;
begin
  FillChar(shf, SizeOf(shf), #0);
  s1 := source + #0#0;
  s2 := dest + #0#0;
  shf.Wnd := 0;
  shf.wFunc := op;
  shf.pFrom := PCHAR(s1);
  shf.pTo := PCHAR(s2);
  shf.fFlags := flags;
  SHFileOperation(shf);
end;

procedure PutS(Bmp: TBitmap; X1, Y1, X2, Y2: integer; K: real);
var
  St, x, y, i, L: integer;
  xr: real;
begin
  i := 0;
  if (X1 = 0) or (X2 = 0) then
  begin
    xr := 0;
    St := Round(0.1 * K);
    y := Y1;
    while y <= Y2 do
    begin
      if i = 0 then
        L := 10
      else
        L := 5;
      if X1 = 0 then
      begin
        x := X2;
        L := -L;
      end
      else
        x := X1;
      Bmp.Canvas.MoveTo(x, y);
      Bmp.Canvas.LineTo(x - L, y);
      xr := xr + 0.1;
      y := Y1 + Round(K * xr);
      inc(i);
      if i = 10 then
        i := 0;
    end;
  end
  else
  begin
    xr := 0;
    St := Round(0.1 * K);
    x := X1;
    while x <= X2 do
    begin
      if i = 0 then
        L := 10
      else
        L := 5;
      if Y1 = 0 then
      begin
        y := Y2;
        L := -L;
      end
      else
        y := Y1;
      Bmp.Canvas.MoveTo(x, y);
      Bmp.Canvas.LineTo(x, y - L);
      xr := xr + 0.1;
      x := X1 + Round(K * xr);
      inc(i);
      if i = 10 then
        i := 0;
    end;
  end;
end;

procedure TDM.qVidAfterInsert(DataSet: TDataSet);
begin
  DataSet['category_id'] := CurCatID;
end;

procedure TDM.tGrydAfterPost(DataSet: TDataSet);
begin
  fPlantsMain.DrawPlan(fPlantsMain.Image4.Picture.Bitmap, CurYear, False);
end;

procedure TDM.qSortAfterInsert(DataSet: TDataSet);
begin
  DataSet['item_id'] := qVid['Id'];
end;

procedure TDM.qUdobrAfterInsert(DataSet: TDataSet);
begin
  DataSet['item_id'] := qVid['Id'];
end;

function TDM.GetYearGriads(Year: integer; q: TADOQuery): Boolean;
begin
  Result := OpenQR('Select * from gryad where [Year]=' + IntToStr(Year), q);
end;

procedure TDM.MakeNewYear(Year: integer);
var
  y: integer;
begin
  OpenQR('select max([Year]) as c from gryad', q1Time);
  y := q1Time['c'];
  ExecQr('insert into gryad (num, comp, comment, x, y, w, h, Year,Prev_ID) ' +
    ' (select num, comp, comment, x, y, w, h,' + IntToStr(Year) +
    ',ID from gryad where Year=' + IntToStr(y) + ')', q1Time);
  ExecQr('insert into results (year,  Generation, image, sort_id, plantdate, gryad_id, Shtuk, STComment, Deleted, ShT, Sect_ID, MnLetn)'
    +
    '(select ' + IntToStr(Year) +
    ', Generation,  image, sort_id, plantdate, gryad_id, Shtuk, STComment, Deleted, ShT, Sect_ID, MnLetn from results where Year=' +
    IntToStr(y) + ' and  MnLetn=1 and deleted=0)', q1Time);
  ExecQr('insert into Sections (Gryad_ID, Year, Num, x, y, w, h, Generation,Prev_ID) (select Gryad_ID,'
    +
    IntToStr(Year) +
    ',  Num, x, y, w, h, Generation,ID from Sections where year=' +
    IntToStr(y) + ' and id in (select Sect_ID from results where Year=' +
    IntToStr(Year) + '))', q1Time);
  ExecQr('Update sections set Gryad_ID=(Select ID from  gryad where Prev_ID=Gryad_ID) where  Year='
    + IntToStr(Year), q1Time);
  ExecQr('Update results set Sect_ID =(Select ID from Sections s where  Prev_ID=Sect_ID),'
    +
    'Gryad_ID=(select ID From gryad where Prev_ID=Gryad_ID) where  Year=' +
    IntToStr(Year), q1Time);
  ExecQr('Insert into dbo.Sections(Gryad_ID, Year, Num, x, y, w, h, Generation)'
    +
    '(select id, year,1,0,0,w,H,1 from dbo.gryad g where ' +
    ' not exists(select * from Sections where Gryad_ID=g.id))', q1Time);

  {Select * into #tt from dbo.Sections s where YEAR=2019 and not Gryad_ID in(68,82,79) and
(Select Deleted  from dbo.results r where  r.Sect_ID=s.Id)=0

select * from #tt

update #tt set Year=2020, Gryad_ID=(Select ID from dbo.gryad where Prev_ID=Gryad_ID),Prev_ID=ID

insert into Sections (Gryad_ID, Year, Num, x, y, w, h, Generation, Prev_ID)
(Select Gryad_ID, Year, Num, x, y, w, h, Generation, Prev_ID from #tt)

insert into dbo.results
(year, sort_id, plantdate, gryad_id, Shtuk, STComment, Deleted, ShT, Sect_ID, MnLetn, Generation)
(select '2020', sort_id, plantdate, gryad_id, Shtuk, STComment, Deleted, ShT,
(Select ID from Sections t where t.Prev_ID=r.Sect_ID)as Sect_ID
, MnLetn, Generation from results r where Sect_ID in (select Prev_ID from #tt))}
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  S, Serv: string;
const
  Def = 'Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;';
begin
  ADOConnection1.Connected := False;
  BaseIni := TInifile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  Base := BaseIni.ReadString(Name, 'SQLDataBase', 'Plants');
  Serv := BaseIni.ReadString(Name, 'SQLServer', '(local)');
  BaseIni.Free;
  S := Def + 'Data Source=' + Serv + ';Initial Catalog=' + Base;
  ADOConnection1.ConnectionString := S;
  ADOConnection1.Connected := True;
  CurYear := YearOf(Now);
  if not DM.GetYearGriads(CurYear, DM.qCurGrid) then
  begin
    DM.MakeNewYear(CurYear);
    DM.GetYearGriads(CurYear, DM.qCurGrid);
  end;
end;

{ TSect }

procedure TSect.Clear;
begin
  if id_Sort = 0 then
  begin
    Px := 0;
    Py := 0;
    Pd := 0;
    DB := 0;
  end;
end;

constructor TSect.Create(Ax, Ay, AW, Ah: real; AGrID: integer; K: real; X0, y0:
  integer; AID: integer = 0);
begin
  inherited Create;
  x := Ax;
  y := Ay;
  w := AW;
  h := Ah;
  ID := AID;
  ID_Gryad := AGrID;
  Selected := False;
  id_Sort := 0;
  ix := X0 + Round(K * x);
  ix1 := X0 + Round(K * (x + w));
  iy := y0 + Round(K * y);
  iy1 := y0 + Round(K * (y + h));
  Num := 0;
  Generation := 1;
  Year := CurYear;
  Koef := K;
end;

constructor TSect.CreateFromBase(AID: integer; K: real; X0, y0: integer; Tmp:
  Boolean = False);
var
  Suf: string;
begin
  if Tmp then
    Suf := 'Tmp'
  else
    Suf := '';
  OpenQR('Select * from Sections' + Suf + ' where ID=' + IntToStr(AID),
    DM.q3Time);
  Create(DM.q3Time['x'], DM.q3Time['y'], DM.q3Time['w'], DM.q3Time['h'],
    DM.q3Time['Gryad_ID'],
    K, X0, y0, DM.q3Time['ID'], );
  Num := DM.q3Time['Num'];
  Generation := DM.q3Time['Generation'];
  if Tmp then
  begin
    Px := Round(DM.q3Time['px'] * K);
    Py := Round(DM.q3Time['py'] * K);
    Pd := Round(DM.q3Time['pd'] * K);
    db := Round(DM.q3Time['db'] * k);
    PN := DM.q3Time['N'];
    Invert:= DM.q3Time['Inv']>0;
    OpenQR('Select Sort_ID from ResultsTMP where Sect_ID=' + IntToStr(AID),
      DM.q1Time);
    if DM.q1Time.RecordCount > 0 then
    begin
      id_Sort := DM.q1Time['Sort_ID'];
      Deleted := False;
      Year := CurYear;
      ResDate := 0;
    end;
    Clear;
  end else begin
    if not
      OpenQR('Select Sort_ID,Deleted,ResDate from Results where Deleted=0 and Sect_ID='
      + IntToStr(AID), DM.q1Time) then
      OpenQR('Select Sort_ID,Deleted,ResDate from Results where Sect_ID=' +
        IntToStr(AID), DM.q1Time);
    if DM.q1Time.RecordCount > 0 then
    begin
      id_Sort := DM.q1Time['Sort_ID'];
      Deleted := DM.q1Time['Deleted'];
      if DM.q1Time['ResDate'] <> Null then
        ResDate := YearOf(DM.q1Time['ResDate'])
      else
        ResDate := 0;
    end;
    Year := DM.q3Time['Year'];
  end;

end;

constructor TSect.CreateInt(Ax, Ay, AX1, AY1, AGrID: integer; X0, y0: integer;
  K: real);
begin
  inherited Create;
  if Ax < AX1 then
  begin
    ix := Ax;
    ix1 := AX1;
  end
  else
  begin
    ix1 := Ax;
    ix := AX1;
  end;
  if Ay < AY1 then
  begin
    iy := Ay;
    iy1 := AY1;
  end
  else
  begin
    iy1 := Ay;
    iy := AY1;
  end;
  ID := 0;
  ID_Gryad := AGrID;
  Selected := True;
  id_Sort := 0;
  x := (ix - X0) / K;
  y := (iy - y0) / K;
  w := (ix1 - X0) / K - x;
  h := (iy1 - y0) / K - y;
  Num := 0;
  Generation := 1;
  Year := CurYear;
end;

function TSect.DiagCross(S: TSect): Boolean;
var
  A, B, A1, B1, x: real;
  xx, yy: integer;
begin
  Result := False;
  A := S.GetDiagA;
  B := S.GetDiagB;
  A1 := GetDiagA;
  B1 := GetDiagB;
  if A = A1 then
    Exit;
  x := (B - B1) / (A1 - A);
  xx := Round(x);
  yy := Round((x * A) + B);
  Result := (yy > iy) and (yy < iy1) and (xx > ix) and (xx < ix1) and
    (yy > S.iy) and (yy < S.iy1) and (xx > S.ix) and (xx < S.ix1);
end;

procedure TSect.Draw(B: TBitmap; X0, y0: integer; N: Boolean = False; Del:
  Boolean = True; ResD: integer = 0; Points: Boolean = False);
var
  R: TRect;
  cl: TColor;
begin
  cl := B.Canvas.Brush.Color;
  if Selected then
  begin
    B.Canvas.Pen.Color := ClRed;
    B.Canvas.Brush.Color := $008080EF;
  end
  else
  begin
    B.Canvas.Pen.Color := ClBlack;
    B.Canvas.Pen.Width := 1;
    B.Canvas.Brush.Style := bsClear;
    B.Canvas.Brush.Color := $0080EFEF;
  end;
  B.Canvas.Rectangle(ix, iy, ix1, iy1);

  if not Points and (id_Sort > 0) and (Del or not Deleted)
    and OpenQR('Select 1 as Shtuk, image as images from [sort] s where s.Id='
    + IntToStr(id_Sort), DM.q2Time) and (DM.q2Time['Images'] <>
    'foto\Noimage.jpg') then
  begin

    R.Left := ix + 1;
    R.Right := ix1 - 1;
    R.Top := iy + 1;
    R.Bottom := iy1 - 1;
    fPlantsMain.PutSortBMP(R, DM.q2Time, B);
    {else
      PutBmp(R,BMP); }
  end;
  if N then
  begin
    B.Canvas.Font.Size := 12;
    B.Canvas.Font.Style := [fsBold];
    if h > 0.3 then
      B.Canvas.TextOut((ix + ix1) div 2 - 10, (iy + iy1) div
        2 - 5, IntToStr(Num))
    else
      B.Canvas.TextOut((ix + ix1) div 2 - 10, iy + 1,
        IntToStr(Num));
  end;
  if Points then
    PutPoints(B, X0, Y0);
  B.Canvas.Brush.Style := bsSolid;
  B.Canvas.Brush.Color := cl;

end;

function TSect.GetDiagA: real;
begin
  Result := (iy1 - iy) / (ix1 - ix);
end;

function TSect.GetDiagB: real;
begin
  Result := iy - ix * (iy1 - iy) / (ix1 - ix);
end;

procedure TDM.NewTMP(Year: integer);
begin
  ExecQr('Delete from ResultsTmp', q1Time);
  ExecQr('Delete from SectionsTmp', q1Time);
  ExecQr('Delete from GryadTmp', q1Time);
  ExecQr('insert into [dbo].[gryadTMP] ([id], [num], [comp], [x], [y], [w], [h],[Year])'
    +
    '(Select [id], [num], [comp], [x], [y], [w], [h],[Year] from [dbo].[gryad] where [Year]='
    + IntToStr(Year) + ')', q1Time);
  ExecQr('insert into [dbo].[SectionsTmp] ([Id], [Gryad_ID], [Year], [Num], [x], [y], [w], [h], [Generation])'
    +
    '(select [Id], [Gryad_ID], [Year], [Num], [x], [y], [w], [h], [Generation] from [dbo].[Sections] where [Year]=' +
    IntToStr(Year) + ')', q1Time);
  ExecQr('insert into [dbo].[resultstmp] ([id], [year], [sort_id], [gryad_id], [Shtuk], [Sect_ID], [MnLetn], [Generation])'
    +
    '(select [id], [year], [sort_id], [gryad_id], [Shtuk], [Sect_ID], [MnLetn], [Generation] from [dbo].[results] where [Year]' +
    IntToStr(Year) + ')', q1Time);
end;

function TSect.PointIn(Xi, Yi: integer): Boolean;
begin
  Result := (Xi > ix) and (Yi > iy) and (Xi < ix1) and (Yi < iy1)
    // and ((Xi<>ix)or(Yi<>iy))and((Xi<>ix1)or(Yi<>iy))AND((Xi<>ix)or(Yi<>iy1))AND((Xi<>ix1)or(Yi<>iy1));
end;

procedure TSect.PutInBase(Tmp: Boolean = False);
var
  TSuf: string;
begin
  if Tmp then
    TSuf := 'Tmp'
  else
    TSuf := '';
  OpenQR('Select * from Sections' + TSuf + ' where ID=' + IntToStr(ID),
    DM.q2Time);
  if ID > 0 then
    DM.q2Time.Edit
  else
    DM.q2Time.Insert;
  DM.q2Time['Gryad_ID'] := ID_Gryad;
  DM.q2Time['Year'] := Year;
  DM.q2Time['Num'] := Num;
  DM.q2Time['x'] := x;
  DM.q2Time['y'] := y;
  DM.q2Time['w'] := w;
  DM.q2Time['h'] := h;
  DM.q2Time['Generation'] := Generation;
  if Tmp then
  begin
    Clear;
    if Koef > 0 then begin
      DM.q2Time['px'] := Px / Koef;
      DM.q2Time['py'] := Py / Koef;
      DM.q2Time['pd'] := Pd / Koef;
      DM.q2Time['db'] := DB / Koef;
      DM.q2Time['N'] := PN;
      if Invert then
       DM.q2Time['Inv']:=1
      else
         DM.q2Time['Inv']:=0;
    end;
  end;
  DM.q2Time.Post;
  ID := DM.q2Time['ID'];
end;

procedure TSect.PutPoints(B: TBitmap; X0, y0: integer);
var
  i, j, k, nx, ny, Curx, curY: integer;
begin
  if px > 0 then begin
    B.Canvas.Pen.Color := ClGreen;
    B.Canvas.Pen.Width := 2;
    B.Canvas.Brush.Style := bsClear;
    B.Canvas.Brush.Color := ClGreen;
    k := 1;
    if (w > h) and not Invert then
    begin
      nx := (ix1 - ix - 2 * DB + 1) div Px;
      ny := (iy1 - iy - 2 * DB + 1) div Py;
      if Pd = 0 then
      begin
        for i := 0 to nx do
        begin
           Curx := ix + DB+PX*i;
          for j := 0 to ny do
          begin
            curY:= iy + DB+PY*j;
            B.Canvas.Rectangle(Curx - 2, curY - 2, Curx + 2, curY + 2);
            //inc(curY, Py);
            inc(k);
            if k > PN then
              Exit;
          end;
          //inc(Curx, Px);

        end;
      end
      else
      begin
        curY := iy + DB;
        for j := 0 to ny do
        begin
          Curx := ix + DB + Pd * (j mod 2);
          for i := 0 to nx do
          begin
            if Curx <= ix1 - DB+1 then begin
              B.Canvas.Rectangle(Curx - 2, curY - 2, Curx + 2, curY + 2);
              inc(k);
            end;
            inc(Curx, Px);
            if k > PN then
              Exit;
          end;
          inc(curY, Py);
        end;
      end
    end
    else
    begin
      nx := (ix1 - ix - 2 * DB + 1) div Py;
      ny := (iy1 - iy - 2 * DB + 1) div Px;
      if Pd = 0 then
      begin

       // Curx := ix + DB;
        for i := 0 to nx do
        begin
          Curx := ix + DB+Py*i;
          for j := 0 to ny do
          begin
             curY := iy + DB+Px*j;
            B.Canvas.Rectangle(Curx - 2, curY - 2, Curx + 2, curY + 2);
            //inc(curY, Px);
            inc(k);
            if k > PN then
              Exit;
          end;
          //inc(Curx, Py);

        end;
      end
      else
      begin
        Curx := ix + DB;
        for j := 0 to nx do
        begin
          curY := iy + DB + Pd * (j mod 2);
          for i := 0 to ny do
          begin
            if curY <= iy1 - DB+1 then begin
              B.Canvas.Rectangle(Curx - 2, curY - 2, Curx + 2, curY + 2);
              inc(k);
            end;
            inc(curY, Px);
            if k > PN then
              Exit;
          end;
          inc(Curx, Py);
        end;
      end
    end;
  end;
end;

function TSect.SectCrossed(A: TSect): Boolean;
begin
  Result := PointIn(A.ix, A.iy) or PointIn(A.ix1, A.iy) or PointIn(A.ix, A.iy1)
    or PointIn(A.ix1, A.iy1) or
    A.PointIn(ix, iy) or A.PointIn(ix, iy1) or A.PointIn(ix1, iy) or
    A.PointIn(ix1, iy1)
    or PointIn((A.ix1 + A.ix) div 2, (A.iy1 + A.iy) div 2) or A.PointIn((ix1 +
    ix) div 2, (iy1 + iy) div 2)
    or DiagCross(A);
end;

procedure TSect.UpdateSort;
begin
  id_Sort := 0;
  if (ID > 0) and OpenQR('Select Sort_ID,Deleted from Results where Sect_ID=' +
    IntToStr(ID), DM.q3Time) and (DM.q3Time['Deleted'] = 0) then
    id_Sort := DM.q3Time['Sort_ID'];
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  BaseIni := TInifile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  BaseIni.WriteString(Name, 'SQLDataBase', Base);
  BaseIni.Free;
end;

procedure TDM.qGrydAfterInsert(DataSet: TDataSet);
begin
  DataSet['Year'] := CurYear;
end;

procedure TDM.qSeedsAfterInsert(DataSet: TDataSet);
begin
  DataSet['Sort_ID'] := qSort['ID'];
end;

procedure TDM.qSeedsBeforePost(DataSet: TDataSet);
begin
    if (DataSet['Gram']>0) and
    OpenQr('select ShtInGr from Item where ShtInGr>0 and id=(select [item_id] from [dbo].[sort] where id='
    +InttoStr(DataSet['Sort_ID'])+')',Dm.q1Time)
    then begin
      DataSet['Shtuk']:=DataSet['Gram']* Dm.q1Time['ShtInGr'];
      DataSet['Gram']:=0
    end ;
end;

end.

