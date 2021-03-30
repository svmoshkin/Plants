unit HistGryad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfHistGryad = class(TForm)
    Image4: TImage;
    Panel1: TPanel;
    Button1: TButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    DBGrid6: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }

  public
    { Public declarations }
    Gryad_ID: integer;
    GW, GH, K: real;
    GWi, GHi, x0, xE, y0, yE: integer;
    L: TList;
    SelSec: integer;
    procedure DrawGryad(Bmp: TBitmap);
    procedure SelectSect(i : integer);
  end;

var
  fHistGryad: TfHistGryad;

implementation

uses DMPlnts, ADOUtilsS, Math, PlantsMain, ImFlash;

{$R *.dfm}

procedure TfHistGryad.FormShow(Sender: TObject);
var S: string;

begin
  OpenQr('Select w,h from gryad where id=' + IntToStr(Gryad_ID), DM.q1Time);
  GW := DM.q1Time['W'];
  GH := DM.q1Time['H'];
  k := Min((Image4.Height - 30) / GH, (Image4.Width - 30) / GW);
  GWi := Round(K * GW);
  GHi := Round(k * GH);
  x0 := (Image4.Width - GWi) div 2;
  y0 := (Image4.Height - GHi) div 2;
  XE := x0 + GWi;
  YE := y0 + GHI;
  Image4.Picture.Bitmap.Width := Image4.Width;
  Image4.Picture.Bitmap.Height := Image4.Height;
  Image4.Picture.Bitmap.Canvas.Brush.Color := clMoneyGreen;
  Image4.Picture.Bitmap.Canvas.Rectangle(0, 0, Image4.Width, Image4.Height);
  SelSec := -1;
  {MaxGen :=}FillSectList(L, Gryad_ID, K, x0, y0);
  DrawGryad(Image4.Picture.Bitmap);
  if CurHistYear = 2018 then begin
   DBGrid1.Visible:=False;
   DbGrid6.Visible:=True;
  end else begin
  OpenQr('Select *, CONVERT(Varchar(4),Shtuk)+'' ''+(select (select title from item i where i.id=s.item_id)+ '
    +
    ''' "''+Title +''"''  from sort s where s.Id=r.sort_id ) as A,' +
    '(Select Num from Sections where Id=Sect_ID) as B, PlantDate,Res ' +
    ' from results r where ' +
    ' Gryad_ID=' +
    IntToStr(Gryad_ID) + ' order by B', DM.qSecHist);
    DBGrid1.Visible:=True;
    DbGrid6.Visible:=False;
  end;
  OpenQr('Select Operation,(Select Num from Sections where Id=Block_ID) as B,Date from Obr where Gryad_ID=' +
    IntToStr(Gryad_ID), DM.qObr);
  fIm.Year :=CurHistYear;
  fIm.Gryad_ID := gryad_id;
  if fIm.Visible then
    fIm.DrawGryad(FIm.Image1.Picture.Bitmap)
  else
    fIm.Show;
end;

procedure TfHistGryad.FormCreate(Sender: TObject);
begin
  L := TList.Create;
end;

procedure TfHistGryad.FormDestroy(Sender: TObject);
begin
  L.Free;
end;

procedure TfHistGryad.DrawGryad(Bmp: TBitmap);
var i: integer;
  R: TRect;
begin
  BMP.Canvas.Pen.Width := 3;
  BMP.Canvas.Pen.Color := clMaroon;
  BMP.Canvas.Brush.Color := $0071AEC6;
  BMP.Canvas.Rectangle(x0 - 1, y0 - 1, XE + 1, YE + 1);
  BMP.Canvas.Pen.Width := 1;
  BMP.Canvas.Pen.Color := clBlack;
  PutS(BMP, X0, Y0, XE, 0, k);
  PutS(BMP, X0, 0, XE, YE, k);
  PutS(BMP, X0, Y0, 0, YE, k);
  PutS(BMP, 0, Y0, XE, YE, k);
  if CurHistYear = 2018 then begin
    if OpenQr('select *, (select image from [sort] s where s.Id=r.sort_id) as images from [results] r where((Year=' +
      IntToStr(CurHistYear)
      + ')or ((select Letn from [sort] s where s.Id=r.sort_id)=3))' +
      ' and [gryad_id]=' + IntToStr(Gryad_ID), DM.q2Time)
      then begin
      R.Left := x0 + 1;
      R.Right := xe - 1;
      R.Top := y0 + 1;
      R.Bottom := ye - 1;
      if (DM.q2Time['Images'] <> 'foto\Noimage.jpg') or (DM.q2Time.RecordCount > 1)
        then
        FPlantsMain.PutSortBMP(r, DM.q2Time, BMP)
      else
        FPlantsMain.PutBmp(R, BMP);
    end;
  end else begin
    for i := 0 to L.Count - 1 do
      TSect(L[i]).Draw(BMP, X0, y0, True, True);
  end;
end;

procedure TfHistGryad.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
     if Column.FieldName = 'res' then begin
    TDBGrid(Sender).Canvas.Font.Style := [fsBold];
    if TDBGrid(Sender).DataSource.DataSet['res'] >= 7 then
      TDBGrid(Sender).Canvas.Font.Color := $0040FF00
    else if TDBGrid(Sender).DataSource.DataSet['res'] >= 4 then
      TDBGrid(Sender).Canvas.Font.Color := clBlack
    else
      TDBGrid(Sender).Canvas.Font.Color := clRed;
  end else begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.Font.Style := [];
  end;
  TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfHistGryad.DBGrid1CellClick(Column: TColumn);
var N,i : integer;
begin
   N := DBGrid1.DataSource.DataSet['B'];
   for i:=0 to L.Count-1 do
    if TSect(L[i]).Num=N then begin
      SelectSect(i);
    end;
end;

procedure TfHistGryad.SelectSect(i: integer);
begin
    if  (SelSec >=0) and (SelSec<L.Count) then begin
         TSect(L[SelSec]).Selected := False;
          TSect(L[SelSec]).Draw(Image4.Picture.Bitmap, X0, y0, True, True);
         end;
    if  (i >=0) and (i<L.Count) then begin
        TSect(L[i]).Selected := True;
         TSect(L[i]).Draw(Image4.Picture.Bitmap, X0, y0, True, True);
    end;
    SelSec:=i;
end;

end.

