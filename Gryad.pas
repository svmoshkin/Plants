unit Gryad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ADOUtilsS, DMPlnts, StdCtrls, Grids, DBGrids;

type
  TfGryad = class(TForm)
    Image4: TImage;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Button7: TButton;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Button8: TButton;
    Label2: TLabel;
    Button9: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image4DblClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
    WasDown: Boolean;
    MXD: integer;
    MYD: integer;
    MXU: integer;
    MYU: integer;
    MaxNum: integer;
    SSect: TSect;
    Modif: Boolean;
    function GetSelSect: TSect;
    procedure ModifySec;
    procedure SelectNewSect;
    procedure Renum;
    procedure CheckGen(I: integer);
  public
    { Public declarations }
    Gryad_ID: integer;
    GW, GH, K: real;
    GWi, GHi, x0, xE, y0, yE: integer;
    L: TList;
    SelSec: integer;
    MaxGen: integer;
    Del: Boolean;
    procedure DrawGryad(Bmp: TBitmap);
    procedure SelectSect;
    procedure FindNearestP(var XP, YP: Integer);
    procedure CreateSect;
    function SectCorrect(T: TSect): Integer;
  end;

var
  fGryad: TfGryad;

function PointInRect(X, Y, XR0, YR0, XR1, YR1: Integer): boolean;


implementation

uses Math, Posad, PutRes, Obr, ImFlash;

{$R *.dfm}

function PointInRect(X, Y, XR0, YR0, XR1, YR1: Integer): boolean;
begin
  Result := (X > xR0) and (Y > yr0) and (X < xr1) and (Y < yr1);
end;

procedure TfGryad.DrawGryad(Bmp: TBitmap);
var i: integer;
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
  for i := 0 to L.Count - 1 do
    TSect(L[i]).Draw(BMP, X0, y0, True, Del);
end;

procedure TfGryad.FormShow(Sender: TObject);
var S: Real;
begin
  OpenQr('Select w,h from gryad where id=' + IntToStr(Gryad_ID), DM.q1Time);
  GW := DM.q1Time['W'];
  GH := DM.q1Time['H'];
  S := GW * Gh;
  Label1.Caption := 'Площадь грядки ' + FloatToStr(S) + 'кв.м';
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
  MaxGen := FillSectList(L, Gryad_ID, K, x0, y0);
  DrawGryad(Image4.Picture.Bitmap);
  OpenQr('Select *, CONVERT(Varchar(4),Shtuk)+'' ''+(select (select title from item i where i.id=s.item_id)+ '
    +
    ''' "''+Title +''"''  from sort s where s.Id=r.sort_id ) as A,' +
    '(Select Num from Sections where Id=Sect_ID) as B, Year,PlantDate' +
    ' from results r where ' +
    ' Gryad_ID=' +
    IntToStr(Gryad_ID) + ' and deleted!=1 order by B', DM.qSecHist);
  OpenQr('Select Operation,(Select Num from Sections where Id=Block_ID) as B,Date from Obr where Gryad_ID=' +
    IntToStr(Gryad_ID), DM.qObr);
  fIm.Year := CurOperYear;
  Label2.Caption := '';
  fIm.Gryad_ID := gryad_id;
  if fIm.Visible then
    fIm.DrawGryad(FIm.Image1.Picture.Bitmap)
  else
    fIm.Show;
end;

procedure TfGryad.FormCreate(Sender: TObject);
begin
  L := TList.Create;
end;

procedure TfGryad.FormDestroy(Sender: TObject);
begin
  L.Free;
end;

procedure TfGryad.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  WasDown := True;
  MXD := x;
  MYD := y;
  if (RadioGroup1.ItemIndex = 1) or Modif then
    FindNearestP(MXD, MYD);
end;

procedure TfGryad.Image4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  WasDown := False;
  MXU := x;
  MYU := y;
  if (RadioGroup1.ItemIndex = 1) or Modif then begin
    FindNearestP(MXU, MYU);
    if (MXD <> MXU) and (MYD <> MYU) then
      CreateSect;
  end;
end;

procedure TfGryad.Image4DblClick(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    SelectSect;
end;

procedure TfGryad.SelectSect;
var i: integer;
  CurSectS  :real;
begin
  SelSec := -1;
  if L.Count >= 0 then begin
    for i := 0 to L.Count - 1 do
      if TSect(L[i]).PointIn(MXU, MYU) then begin
        SelSec := i;
         CurSectS := (TSect(L[i]).W ) * (TSect(L[i]).H );
        TSect(L[i]).Selected := True
      end else
        TSect(L[i]).Selected := False;
  //if SelSec >= 0 then
  if SelSec>=0 then begin
   Label2.Caption := 'Площадь блока: ' + FormatFloat('##0.##', Round(CurSectS * 100) / 100);
  end else
    Label2.Caption := '';
    DrawGryad(Image4.Picture.Bitmap)
  end else
    ShowMessage('На грядке не создан ни один блок!');
end;



procedure TfGryad.FindNearestP(var XP, YP: Integer);
var X, Y, Dx, DY, dxOld, dyOld, i: integer;
begin
  X := x0;
  Y := y0;
 { XP := XP - x0;
  YP := yP - y0; }
  dxOld := ABS(XP - X0);
  dyOld := abs(Yp - y0);
  Dx := abs(X0 + GWi - Xp);
  if Dx < DxOld then begin
    dxOld := DX;
    X := GWi + x0;
  end;
  Dy := abs(GHi + Y0 - yp);
  if Dy < DyOld then begin
    dyOld := Dy;
    y := GHi + y0;
  end;
  for i := 0 to L.Count - 1 do begin
    Dx := abs(TSect(L[i]).ix - Xp);
    if Dx < DxOld then begin
      dxOld := DX;
      X := TSect(L[i]).ix;
    end;
    Dy := abs(TSect(L[i]).iy - yp);
    if Dy < DyOld then begin
      dyOld := Dy;
      y := TSect(L[i]).iy;
    end;
    Dx := abs(TSect(L[i]).ix1 - Xp);
    if Dx < DxOld then begin
      dxOld := DX;
      X := TSect(L[i]).ix1;
    end;
    Dy := abs(TSect(L[i]).iy1 - yp);
    if Dy < DyOld then begin
      dyOld := Dy;
      y := TSect(L[i]).iy1;
    end;
  end;
  if DXOld < 10 then
    XP := X // + x0
  else
    XP := XP; // + x0;
  if DYOld < 10 then
    YP := y //+ y0
  else
    YP := Yp //+ y0;
end;

procedure TfGryad.CreateSect;
var BMP: TBitmap;
  T: TSect;
  i: integer;
begin
  if (abs(MXD - MXU) / K > 0.10) and (abs(MYD - MYU) / K > 0.10) then begin
    T := TSect.CreateInt(MXD, MYD, MXU, MYU, Gryad_ID, x0, y0, K);
    I := SectCorrect(T);
    if i = -1 then begin
      L.Add(T);
      if Modif then
        ModifySec;
      SelectNewSect;
      DrawGryad(Image4.Picture.Bitmap);
 // T.Draw(Image4.Picture.Bitmap,x0,y0);
   { BMP := Image4.Picture.Bitmap;
    BMP.Canvas.Pen.Width := 2;
    BMP.Canvas.Pen.Color := clRed;
    BMP.Canvas.Brush.Color := $008080FF;
    BMP.Canvas.Rectangle(MXD, MYD, MXU, MYU);
    BMP.Canvas.Pen.Width := 1;
    BMP.Canvas.Pen.Color := clBlack; }
    end else if i = -2 then
      ShowMessage('Блок перекрывает несколько уже существующих. Если они не нужны - удалите их')
    else begin
      if TSect(L[i]).id_Sort <> 0 then
        ShowMessage('Блок перекрывает  уже существующий с неудаленными посадками. Если они не нужны - удалите их')
      else if MessageDlg('Блок перекрывает уже существующий. Удалить более ' + #13 + #10 + 'ранний?',
        mtWarning, [mbYes, mbNo], 0) = mrYes then begin
        CheckGen(i);
        TSect(L[i]).Free;
        L.Delete(I);
        T.Generation := MaxGen;
        L.Add(T);
        if Modif then
          ModifySec;
        SelectNewSect;
        DrawGryad(Image4.Picture.Bitmap);
    //T.Draw(Image4.Picture.Bitmap,x0,y0);
      end;
    end;
  end else ShowMessage('Блок не может иметь размер меньше 10 см');
end;

function TfGryad.SectCorrect(T: TSect): integer;
var i: integer;
begin
  Result := -1;
  for i := 0 to L.Count - 1 do
    if TSect(L[i]).SectCrossed(T) then begin
      if Result = -1 then
        Result := i
      else
        Result := -2
    end;
end;

procedure TfGryad.RadioGroup1Click(Sender: TObject);
begin
  Button3.Enabled := RadioGroup1.ItemIndex = 0;
  Button5.Enabled := RadioGroup1.ItemIndex = 0;
  Button4.Enabled := RadioGroup1.ItemIndex = 1;
  Button8.Enabled := RadioGroup1.ItemIndex = 1;
end;

procedure TfGryad.Button3Click(Sender: TObject);
var S: TSect;
  R: TRect;
begin
  s := nil;
  S := GetSelSect;
  if S <> nil then begin
    if S.ID > 0 then begin
      if (TSect(L[SelSec]).id_Sort = 0)or (TSect(L[SelSec]).Deleted) then begin
        fPosad.ID_Gryad := Gryad_ID;
        fPosad.ID_Sect := S.ID;
        if (TSect(L[SelSec]).id_Sort = 0) then
        fPosad.Gen := S.Generation
        else
          fPosad.Gen := S.Generation+1;
        R := FPosad.Image1.ClientRect;
        FPosad.Image1.Picture.Bitmap.Canvas.StretchDraw(R, Image4.Picture.Bitmap);
        fPosad.Caption := 'Посадки на грядку № ' + IntToStr(CurGryadNum);
        if fPosad.ShowModal = mrOk then begin
          s.id_Sort := fPosad.ID_Sort;
          DrawGryad(Image4.Picture.Bitmap);
          Dm.qPosad.Requery();
        end;
      end else
        ShowMessage('На выбранном блоке еще не убраны предыдущие посадки!');
    end else
      ShowMessage('Выбранный блок еще не сохранен в базу!');
  end else
    ShowMessage('Не выбран блок');
end;

function TfGryad.GetSelSect: TSect;
var i: integer;
begin
  Result := nil;
  for i := 0 to L.Count - 1 do
    if TSect(L[i]).Selected then begin
      Result := TSect(L[i]);
      SSect := Result;
      Exit;
    end
end;

procedure TfGryad.Button4Click(Sender: TObject);
var I: integer;
  IDL: string;
begin
  if Modif then
    L.Add(SSect);
  Modif := False;
  IDL := '0,';
  for i := 0 to L.Count - 1 do
    if TSect(L[i]).ID > 0 then
      IDL := IDL + IntToStr(TSect(L[i]).ID) + ',';
  if IDL <> '' then
    Delete(IDL, Length(IDL), 1);
  ExecQr('Delete from Sections where Gryad_ID='+IntToStr(Gryad_ID) +' and not ID in(' + IDL +
    ') and not exists(select * from Results where Sect_ID=Sections.ID)', DM.q1Time);
  Renum;
  for i := 0 to L.Count - 1 do
    TSect(L[i]).PutInBase;
end;

procedure TfGryad.SelectNewSect;
var I: integer;
begin
  for i := 0 to L.Count - 2 do
    TSect(l[i]).Selected := False;
  SelSec := L.Count - 1;
  TSect(l[SelSec]).Selected := True;
end;

procedure TfGryad.Renum;
var i: integer;
begin
  MaxNum := 0;
  for i := 0 to L.Count - 1 do
    if TSect(L[i]).Num > MaxNum then
      MaxNum := TSect(L[i]).Num;
  for i := 0 to L.Count - 1 do
    if TSect(L[i]).Num = 0 then begin
      inc(MaxNum);
      TSect(L[i]).Num := MaxNum;
    end;
end;




procedure TfGryad.Button5Click(Sender: TObject);
begin
  if SelSec >= 0 then begin
    if TSect(L[SelSec]).id_Sort > 0 then begin
      OpenQr('Select *, CONVERT(Varchar(4),Shtuk)+'' ''+(select (select title from item i where i.id=s.item_id)+ '
        +
        ''' "''+Title +''"''  from sort s where s.Id=r.sort_id ) as A from results r where ' +
        ' Deleted=0 and [Sect_id]=' + IntToStr(TSect(L[SelSec]).id), DM.qPosadB);
      fPutRes.ShowModal;
      TSect(L[SelSec]).UpdateSort;
      DrawGryad(Image4.Picture.Bitmap);
      Dm.qPosad.Requery();
    end else
      ShowMessage('Выбранный блок не засажен!');
  end else
    ShowMessage('Сначала выберите блок!');
end;

procedure TfGryad.Button6Click(Sender: TObject);
begin
  if SelSec >= 0 then begin
    if (TSect(L[SelSec]).id_Sort = 0) or (TSect(L[SelSec]).Deleted) then begin
      CheckGen(SelSec);
      L.Delete(SelSec);
      SelSec:=L.Count-1;
      DrawGryad(Image4.Picture.Bitmap);
      if RadioGroup1.ItemIndex = 0 then
        Button4Click(Sender);
    end else
      ShowMessage('Не этом блоке есть посадки. Сначала уберите их');
  end else
    ShowMessage('Сначала выберите блок!');
end;

procedure TfGryad.CheckGen(I: integer);
begin
  if (TSect(L[i]).id > 0) and (TSect(L[i]).Generation >= MaxGen) and
    OpenQr('select * from  Results where Sect_ID=' + IntTostr(TSect(L[i]).id), DM.q1Time) then
    MaxGen := TSect(L[i]).Generation + 1;
end;

procedure TfGryad.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 1 then
    Button4Click(Sender);
  ModalResult := mrOk;
end;

procedure TfGryad.Button7Click(Sender: TObject);
var S: TSect;
begin
  s := nil;
  S := GetSelSect;
  if S <> nil then begin
    if S.ID > 0 then begin
      fObr.BLock := S;
      if fObr.ShowModal = mrOK then
        DM.qObr.Requery();
    end else
      ShowMessage('Выбранный блок еще не сохранен в базу!');
  end else
    ShowMessage('Не выбран блок');
end;

procedure TfGryad.Button8Click(Sender: TObject);
begin
  if GetSelSect <> nil then begin
    L.Delete(SelSec);
    Modif := True;
  end else
    ShowMessage('Не выбран блок');
end;

procedure TfGryad.ModifySec;
var S: TSect;
begin
  if L.Count > 0 then begin
    S := TSect(L[L.Count - 1]);
    L.Delete(L.Count - 1);
    SSect.x := S.x;
    SSect.y := S.y;
    SSect.w := s.w;
    SSect.h := s.h;
    SSect.ix := S.ix;
    SSect.ix1 := s.ix1;
    SSect.iy := S.iy;
    SSect.iy1 := S.iy1;
    S.Free;
    L.Add(SSect);
  end;
  Modif := False;
end;

procedure TfGryad.Button9Click(Sender: TObject);
begin
    ExecQr('delete from Results where Gryad_ID='+IntToStr(Gryad_ID),DM.q1Time);
    ExecQr('delete from Sections where  Gryad_ID='+IntToStr(Gryad_ID) ,DM.q1Time);

    ExecQr('insert into Sections (Gryad_ID, Year, Num, x, y, w, h, Generation, Prev_ID) '+
    '(Select Gryad_ID, Year, Num, x, y, w, h, Generation, Prev_ID from  SectionsTmp where '+
    ' Gryad_ID='+IntToStr(Gryad_ID)+')',DM.q1Time);

    ExecQr('insert into Results ( year, sort_id,plantdate, gryad_id, Shtuk, Sect_ID, MnLetn, Generation, Deleted) '+
    '(select year, sort_id, getdate(), gryad_id, Shtuk, '+
    '(select Id from Sections where Gryad_ID='+IntToStr(Gryad_ID)+' and Num=(Select Num from SectionsTmp where ID=r.Sect_ID)), '+
    'MnLetn, Generation, Deleted from resultstmp r '+
    'where  Gryad_ID='+IntToStr(Gryad_ID)+')',DM.q1Time);
     FormShow(Sender);
end;

end.

