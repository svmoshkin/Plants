unit ImFlash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ADOUTILSS, Math;

type
  TfIm = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    kx, ky: real;
    R: TRect;
    Year: integer;
    Gryad_ID: integer;
    procedure DrawGryad(Bmp: TBitmap);
  end;

var
  fIm: TfIm;

implementation

uses DMPlnts;

{$R *.dfm}

procedure TfIm.DrawGryad(Bmp: TBitmap);
var x1, y1, x2, y2, N: integer;
begin
  {Image1.Picture.Bitmap.Canvas.Brush.Color := clMoneyGreen;
  Image1.Picture.Bitmap.Canvas.Rectangle(0, 0, Image1.Width, Image1.Height); }
  Image1.Picture.Bitmap.Canvas.StretchDraw(r, Fon);
  OpenQr('Select * from gryad where Year=' + IntToStr(Year), DM.q1Time);
  while not DM.q1Time.Eof do begin
    if (DM.q1Time['Comp'] = Year) then
      BMP.Canvas.Brush.Color := $004A4A4A
    else if DM.q1Time['ID'] = Gryad_ID then
      BMP.Canvas.Brush.Color := $008080FF
    else
      BMP.Canvas.Brush.Color := $0071AEC6;
   { N := DM.q1Time['Num'];
    if n = CurGryadNum then
      BMP.Canvas.Pen.Color := clRed
    else
      BMP.Canvas.Pen.Color := clBlack; }
    x1 := Round(kx * (DM.q1Time['x'] - x0)); ;
    x2 := Round(kx * (DM.q1Time['x'] + DM.q1Time['w'] - x0));
    y1 := Round(ky * (DM.q1Time['y']));
    y2 := Round(ky * (DM.q1Time['y'] + DM.q1Time['h']));
   { g[N].Left := x1;
    g[N].Top := y1;
    g[N].Bottom := y2;
    g[N].Right := x2;  }
    BMP.Canvas.Rectangle(x1, y1,
      x2, y2);
    if DM.q1Time['h'] > 0.5 then
      BMP.Canvas.TextOut((X2 + x1) div 2 - 10, (y2 + y1) div
        2 - 5, IntToStr(DM.q1Time['num']))
    else
      BMP.Canvas.TextOut((X2 + x1) div 2 - 10, y1 + 1,
        IntToStr(DM.q1Time['num']));
    DM.q1Time.Next;
  end;
  Timer1.Enabled := True;
end;

procedure TfIm.FormShow(Sender: TObject);
begin
  Top:=0;
  Left:=0;
  R.Top := 0;
  R.Left := 0;
  R.Right := Image1.Width;
  R.Bottom := Image1.Height;
  Image1.Picture.Bitmap.Width := Image1.Width;
  Image1.Picture.Bitmap.Height := Image1.Height;
  kx := Image1.Picture.Bitmap.Width / (XM - X0);
  ky := Image1.Picture.Bitmap.Height / (Ym - Y0);
  DrawGryad(Image1.Picture.Bitmap);
end;

procedure TfIm.Timer1Timer(Sender: TObject);
begin
  BringToFront;
  Timer1.Enabled := False;
end;

procedure TfIm.FormResize(Sender: TObject);
begin
  Timer2.Enabled := True;
end;

procedure TfIm.Timer2Timer(Sender: TObject);
begin
  FormShow(nil);
  Timer2.Enabled := False;
end;

end.

