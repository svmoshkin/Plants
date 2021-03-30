unit Gryadtmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ADOUtilsS, DMPlnts, StdCtrls, Grids, DBGrids, DB, jpeg,
  Mask, DBCtrls, NumInp;

type
  TfGryadTmp = class(TForm)
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
    Label1: TLabel;
    Button8: TButton;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Image3: TImage;
    dsVid: TDataSource;
    dsSort: TDataSource;
    Label2: TLabel;
    Label4: TLabel;
    Label42: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label3: TLabel;
    Button7: TButton;
    CheckBox1: TCheckBox;
    Button9: TButton;
    Label5: TLabel;
    NumInp1: TNumInp;
    Label6: TLabel;
    Button10: TButton;
    GroupBox4: TGroupBox;
    Label35: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    NumInp2: TNumInp;
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
    procedure Button8Click(Sender: TObject);
    procedure dsVidDataChange(Sender: TObject; Field: TField);
    procedure dsSortDataChange(Sender: TObject; Field: TField);
    procedure Button7Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    CurSectS: Real;
    Px, PY, Pd, db: real;
    OldW, OldH: real;
    procedure SelCurSort(ID : Integer);
    procedure SelectSec(i: integer);
    procedure SelectSecByNum(Num: integer);
    function GetSelSect: TSect;
    procedure ModifySec;
    procedure SelectNewSect;
    procedure Renum;
  public
    { Public declarations }
    Gryad_ID: integer;
    GW, GH, K: real;
    GWi, GHi, x0, xE, y0, yE: integer;
    L: TList;
    SelSec: integer;
    CurN: Integer;
    function CalckN: integer;
    procedure DrawGryad(Bmp: TBitmap);
    procedure SelectSect;
    procedure FindNearestP(var XP, YP: Integer);
    procedure CreateSect;
    function SectCorrect(T: TSect): Integer;
  end;

var
  fGryadTMP: TfGryadTmp;

const Bord = 0.1;
  Bord1 = 0.15;

function PointInRect(X, Y, XR0, YR0, XR1, YR1: Integer): boolean;
function Devided(Val, dev: integer): integer;


implementation

uses Math, Posad, PutRes, Obr, ImFlash;

{$R *.dfm}

function Devided(Val, dev: integer): integer;
begin
  if Val mod dev = 0 then
    result := 1
  else
    result := 0;
end;

function PointInRect(X, Y, XR0, YR0, XR1, YR1: Integer): boolean;
begin
  Result := (X > xR0) and (Y > yr0) and (X < xr1) and (Y < yr1);
end;

procedure TfGryadTmp.DrawGryad(Bmp: TBitmap);
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
    TSect(L[i]).Draw(BMP, X0, y0, True, False, 0, CheckBox1.Checked);
end;

procedure TfGryadTmp.FormShow(Sender: TObject);
var S: Real;
begin
  dsSort.DataSet:=DM.qSort;
  OpenQr('Select w,h from gryadtmp where id=' + IntToStr(Gryad_ID), DM.q1Time);
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
  FillSectList(L, Gryad_ID, K, x0, y0, True);
  if L.Count = 0 then begin
    L.Add(TSect.Create(0, 0, GW, GH, Gryad_ID, k, x0, y0));
  end;
  SelectSec(0);
  DrawGryad(Image4.Picture.Bitmap);
 { OpenQr('Select *, CONVERT(Varchar(4),Shtuk)+'' ''+(select (select title from item i where i.id=s.item_id)+ '
    +
    ''' "''+Title +''"''  from sort s where s.Id=r.sort_id ) as A,' +
    '(Select Num from SectionsTmp where Id=Sect_ID) as B, Year,PlantDate' +
    ' from resultstmp r where ' +
    ' Gryad_ID=' +
    IntToStr(Gryad_ID) + ' and deleted!=1 order by B', DM.qSecHist); }
  fIm.Year := CurYear;
  fIm.Gryad_ID := gryad_id;
  numInp1.Value := 0;
  if fIm.Visible then
    fIm.DrawGryad(FIm.Image1.Picture.Bitmap)
  else
    fIm.Show;
end;

procedure TfGryadTmp.FormCreate(Sender: TObject);
begin
  L := TList.Create;
end;

procedure TfGryadTmp.FormDestroy(Sender: TObject);
begin
  L.Free;
end;

procedure TfGryadTmp.Image4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  WasDown := True;
  MXD := x;
  MYD := y;
  if (RadioGroup1.ItemIndex = 1) or Modif then
    FindNearestP(MXD, MYD);
end;

procedure TfGryadTmp.Image4MouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TfGryadTmp.Image4DblClick(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    SelectSect;
end;

procedure TfGryadTmp.SelectSect;
var i: integer;
begin
  Button10.Enabled := False;
  if Selsec >= 0 then
    TSect(L[SelSec]).Clear;
  SelSec := -1;
  if L.Count >= 0 then begin
    for i := 0 to L.Count - 1 do
      if TSect(L[i]).PointIn(MXU, MYU) then begin
        SelectSec(i)
      end else
        TSect(L[i]).Selected := False;
  //if SelSec >= 0 then
    DrawGryad(Image4.Picture.Bitmap)
  end else
    ShowMessage('На грядке не создан ни один блок!');
end;



procedure TfGryadTmp.FindNearestP(var XP, YP: Integer);
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

procedure TfGryadTmp.CreateSect;
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
    end else if i = -2 then begin
      ShowMessage('Блок перекрывает несколько уже существующих. Если они не нужны - удалите их');
      T.Free;
    end else begin
      if TSect(L[i]).id_Sort <> 0 then begin
        ShowMessage('Блок перекрывает  уже существующий с неудаленными посадками. Если они не нужны - удалите их');
        T.Free;
      end else if MessageDlg('Блок перекрывает уже существующий. Удалить более ' + #13 + #10 + 'ранний?',
        mtWarning, [mbYes, mbNo], 0) = mrYes then begin
        TSect(L[i]).Free;
        L.Delete(I);
       // T.Generation := MaxGen;
        L.Add(T);
        if Modif then
          ModifySec;
        SelectNewSect;
        DrawGryad(Image4.Picture.Bitmap);
    //T.Draw(Image4.Picture.Bitmap,x0,y0);
      end else
        T.Free;
    end;
  end else ShowMessage('Блок не может иметь размер меньше 10 см');
end;

function TfGryadTmp.SectCorrect(T: TSect): integer;
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

procedure TfGryadTmp.RadioGroup1Click(Sender: TObject);
begin
  Button3.Enabled := RadioGroup1.ItemIndex = 0;
  Button3.Enabled := RadioGroup1.ItemIndex = 0;
  Button5.Enabled := RadioGroup1.ItemIndex = 0;
  Button4.Enabled := RadioGroup1.ItemIndex = 1;
  Button8.Enabled := RadioGroup1.ItemIndex = 1;
  Button10.Enabled := False;
  if (RadioGroup1.ItemIndex = 0) and (L.Count > 0) then begin
    if TSect(L[L.Count - 1]).ID = 0 then
      Button4Click(Sender);
    SelectSec(L.Count - 1);
    DrawGryad(Image4.Picture.Bitmap);
  end
end;


procedure TfGryadTmp.SelectSec(i: integer);
var J: Integer;
begin
  for j := 0 to L.Count - 1 do
    TSect(l[j]).Selected := False;
  SelSec := i;
  if i >= 0 then begin
    TSect(L[i]).Selected := True;
    CurSectS := (TSect(L[i]).W - 2 * Bord) * (TSect(L[i]).H - 2 * Bord);
    Label2.Caption := 'Эффективная площадь блока: ' + FormatFloat('##0.##', Round(CurSectS * 100) / 100);
    if TSect(L[i]).PN > 0 then begin
      Label3.Caption := 'Намечено штук';
      NumInp2.Visible := True;
      NumInp2.Value := TSect(L[i]).PN;
      DM.qGryadtmp.Locate('N',TSect(L[i]).Num,[]);
      SelCurSort(TSect(L[i]).id_Sort);
      Button7.Caption:='Изменить';
      Button7.Enabled:=True;
    end else begin
      Label3.Caption := '';
      NumInp2.Visible := False;
      NumInp2.Value := 0;
      Button7.Caption:='Подтвердить';
      Button7.Enabled:=False;
    end
  end else begin
    Label2.Caption := '';
    Label3.Caption := '';
    NumInp2.Visible := False;
    NumInp2.Value := 0;
    Button7.Caption:='Подтвердить';
    Button7.Enabled:=False;
  end;
end;


procedure TfGryadTmp.Button3Click(Sender: TObject);
var S: TSect;
begin
  s := nil;
  S := GetSelSect;
  if DSSort.DataSet['Dist']=Null then begin
    ShowMessage('Не задано расстояние между растениями');
    Exit;
  end;
  if S <> nil then begin
    if S.ID > 0 then begin
      if (TSect(L[SelSec]).id_Sort > 0) and
        (MessageDlg('На выбранном блоке еще не убраны предыдущие посадки. Удалить их и продолжить?',
        mtWarning, [mbYes, mbNo], 0) = mrNo) then
        Exit;
      Button5Click(Sender);
      S.Clear;
      DrawGryad(Image4.Picture.Bitmap);
      CalckN;
      Label3.Caption := 'Поместится штук';
      NumInp2.Visible := True;
      NumInp2.Value := CurN;
      Button7.Enabled := True;
      Button7.Caption:='Подтвердить';
        //ShowMessage('!');
    end else
      ShowMessage('Выбранный блок еще не сохранен в базу!');
  end else
    ShowMessage('Не выбран блок');
end;

function TfGryadTmp.GetSelSect: TSect;
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

procedure TfGryadTmp.Button4Click(Sender: TObject);
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
  ExecQr('Delete from SectionsTmp where Gryad_ID=' + IntToStr(Gryad_ID) + ' and not ID in(' + IDL +
    ') and not exists(select * from ResultsTmp where Sect_ID=SectionsTmp.ID)', DM.q1Time);
  Renum;
  for i := 0 to L.Count - 1 do
    TSect(L[i]).PutInBase(True);
end;

procedure TfGryadTmp.SelectNewSect;
begin
  SelectSec(L.Count - 1);
  Renum;
   NumInp2.Visible := False;
   Label3.Caption:='';
   Button7.Enabled:=False;
end;

procedure TfGryadTmp.Renum;
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




procedure TfGryadTmp.Button5Click(Sender: TObject);
begin
  if SelSec >= 0 then begin
    if TSect(L[SelSec]).id_Sort > 0 then begin
      TSect(L[SelSec]).id_Sort := 0;
      TSect(L[SelSec]).Clear;
      ExecQr('delete from  resultsTmp where Sect_ID= ' + IntToStr(TSect(L[SelSec]).ID), DM.q1Time);
      DrawGryad(Image4.Picture.Bitmap);
      Dm.qGryadTmp.Requery();
    end {else
      ShowMessage('Выбранный блок не засажен!'); }
  end else
    ShowMessage('Сначала выберите блок!');
end;

procedure TfGryadTmp.Button6Click(Sender: TObject);
begin
  if SelSec >= 0 then begin
    if (TSect(L[SelSec]).id_Sort = 0)  then begin
      L.Delete(SelSec);
      SelectSec(L.Count - 1);
      DrawGryad(Image4.Picture.Bitmap);
      Button10.Enabled := False;
      if RadioGroup1.ItemIndex = 0 then
        Button4Click(Sender);
    end else
      ShowMessage('Не этом блоке есть посадки. Сначала уберите их');
  end else
    ShowMessage('Сначала выберите блок!');
end;


procedure TfGryadTmp.Button1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 1 then
    Button4Click(Sender);
  ModalResult := mrOk;
end;

procedure TfGryadTmp.Button8Click(Sender: TObject);
begin
  if GetSelSect <> nil then begin
    L.Delete(SelSec);
    Modif := True;
    Button10.Enabled := False;
  end else
    ShowMessage('Не выбран блок');
end;

procedure TfGryadTmp.ModifySec;
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

procedure TfGryadTmp.dsVidDataChange(Sender: TObject; Field: TField);
var
  i: integer;
begin
 // if PageControl1.ActivePage = TabSheet1 then begin
  if Field = nil then
  begin
    if DM.qVid['id'] <> Null then
      i := DM.qVid['id']
    else
      i := 0;
    OpenQr('Select * from [sort] where item_id=' + IntToStr(i) +
      ' Order by Title', DM.qSort);
  end;
end;

procedure TfGryadTmp.dsSortDataChange(Sender: TObject; Field: TField);
var
  S: string;
  Sh: integer;
  G: Real;
begin
  if Field = nil then
  begin
    if DM.qSort['image'] <> null then
      s := MyPath + DM.qSort['image']
    else
      S := MyPath + 'foto\Noimage.jpg';
    Image3.Picture.LoadFromFile(S);
    numInp1.Value := 0;
    DM.SeedAll.Active := False;
    DM.SeedAll.Parameters.ParamByName('@SortID').Value := DM.qSort['Id'];
    DM.SeedAll.Open;
    S := '';
    Label35.Caption := '';
    if (DM.SeedAll['S'] > 0) then begin
      Label35.Caption := IntTostr(DM.SeedAll['S']) + ' штук';
      S := ' и ';
      Sh := DM.SeedAll['S'];
    end else
      if (DM.SeedAll['G'] > 0) then begin
        Label35.Caption := Label35.Caption + S + FormatFloat('##0.##', DM.SeedAll['G']) + ' грамм';
        G := DM.SeedAll['G'];
      end else
        Label35.Caption := ' Нет';
  end;
end;

function TfGryadTmp.CalckN: integer;
var ww, hh, dx, s, r: real;
  Row, Col: integer;
begin
  r := DM.qSort['Dist'];
  if R > 0.5 then
    db := 0.2
  else if r > 0.3 then
    db := Bord1
  else
    db := Bord;
  if TSect(L[SelSec]).W < TSect(L[SelSec]).H then begin
    ww := TSect(L[SelSec]).H - 2 * db;
    hh := TSect(L[SelSec]).W - 2 * db;
  end else begin
    ww := TSect(L[SelSec]).W - 2 * db;
    hh := TSect(L[SelSec]).H - 2 * db;
  end;
  if DM.qSort['DistRow'] = Null then begin

    CurN := -1;
    if hh < r * SQRT(3) / 2 then begin
      dx := Sqrt(r * r - hh * hh);
      CurN := trunc(ww / dx + 0.001) + 1;
      Pd := dx;
      Px := 2 * dx;
      PY := hh;
    end else if hh <= r then begin
      dx := Sqrt(r * r - hh * hh);
      CurN := trunc(ww / r + 0.001) + trunc((ww - dx) / r + 0.001) + 2;
      Pd := dx;
      Px := r;
      PY := hh;
    end else if hh < r * SQRT(3) then begin
      dx := Sqrt(r * r - hh * hh / 4);
      CurN := 2 * trunc(ww / (2 * dx) + 0.001) + trunc((ww - dx) / (2 * dx) + 0.001) + 3;
      Pd := dx;
      Px := 2 * dx;
      PY := hh / 2;
    end else if hh < 2 * r then begin
      dx := Sqrt(r * r - hh * hh / 4);
      CurN := 2 * trunc(ww / r + 0.001) + trunc((ww - dx) / r + 0.001) + 3;
      Pd := dx;
      Px := r;
      PY := hh / 2;
    end else if hh < r * 3 * SQRT(3) / 2 then begin
      dx := Sqrt(r * r - hh * hh / 16);
      CurN := 3 * trunc(ww / (2 * dx) + 0.001) + 2 * trunc((ww - dx) / (2 * dx) + 0.001) + 5;
      Pd := dx;
      Px := 2 * dx;
      PY := hh / 4;
    end else if hh < r * 3 then begin
      dx := Sqrt(r * r - hh * hh / 9);
      CurN := 2 * (trunc(ww / r + 0.001) + trunc((ww - dx) / r + 0.001) + 2);
      Pd := dx;
      Px := r;
      PY := hh / 3;
    end;
  end else begin
   // s := DM.qSort['Dist'] * DM.qSort['DistRow'];
    Row := trunc(ww / DM.qSort['DistRow'] + 1 + 0.001);
    Col := trunc(hh / DM.qSort['Dist'] + 1 + 0.001);
    CurN := Row * Col; ///Round(CurSectS / s);
    pd := 0;
    Px := DM.qSort['DistRow'];
    Py := DM.qSort['Dist'];
  end;
  if PY > Px then begin
    TSect(L[SelSec]).Px := round(py * k);
    TSect(L[SelSec]).Py := round(px * k);
  end else begin
    TSect(L[SelSec]).Px := round(px * k);
    TSect(L[SelSec]).Py := round(py * k);
  end;
  TSect(L[SelSec]).pd := round(pd * k);
  TSect(L[SelSec]).db := round(db * k);
  TSect(L[SelSec]).pn := CurN;
  TSect(L[SelSec]).PutPoints(Image4.Picture.Bitmap, x0, y0);
end;

procedure TfGryadTmp.Button7Click(Sender: TObject);
var S: TSect;
  MXD, MYD, MXU, MYU: integer;
begin
  s := nil;
  S := GetSelSect;
  CurN := Round(NumInp2.Value);
  S.PN:=CurN;
  if S <> nil then begin
    ExecQr('Delete from resultsTmp where Sect_ID= '+IntToStr(S.ID), DM.q1Time);
    execQr('insert into resultsTmp ([year], [sort_id], [gryad_id], [Shtuk], [Sect_ID])' +
      'values(' + IntToStr(CurYear) + ',' + IntToStr(DM.qSort['ID']) + ',' + InttoStr(Gryad_ID) +
      ',' + IntToStr(CurN) + ',' + IntToStr(S.ID) + ')', DM.q1Time);
    s.id_Sort := DM.qSort['ID'];
    s.PutInBase(True);
   // DrawGryad(Image4.Picture.Bitmap);
    Dm.qGryadtmp.Requery();
    Button10.Enabled := False;
    if GW > GH then begin
      MXD := S.ix1;
      MXU := X0 + GWi;
      MYD := S.iy;
      MYU := S.iy1;
    end else begin
      MXD := S.ix1;
      MXU := S.ix;
      MYD := S.iy1;
      MYU := y0 + GHi;
    end;
    if (abs(MXD - MXU) > 20) and (abs(MYD - MYU) > 20) then begin
      S := TSect.CreateInt(MXD, MYD, MXU, MYU, Gryad_ID, x0, y0, K);
      try
        if SectCorrect(S) = -1 then begin
          L.Add(S);
          SelectNewSect;
          Button4Click(Sender);
        end else
          S.Free;
      except
        S.Free;
      end;
    end;
    DrawGryad(Image4.Picture.Bitmap);
  end;
end;

procedure TfGryadTmp.CheckBox1Click(Sender: TObject);
begin
  DrawGryad(Image4.Picture.Bitmap);
end;

procedure TfGryadTmp.Button9Click(Sender: TObject);
var Cn, i, nr, n: integer;
  S: TSect;
  ww, hh, dx, r, dd: real;
  Vert: Boolean;
begin
  s := nil;
  if DSSort.DataSet['Dist']=Null then begin
    ShowMessage('Не задано расстояние между растениями');
    Exit;
  end;
  S := GetSelSect;
  if S <> nil then begin
    if S.ID > 0 then begin
      if (S.id_Sort > 0) and
        (MessageDlg('На выбранном блоке еще не убраны предыдущие посадки. Удалить их и продолжить?',
        mtWarning, [mbYes, mbNo], 0) = mrNo) then
        Exit;
      Cn := Round(NumInp1.Value);
      CurN := Cn;
      if Cn > 0 then begin
        OpenQr('select * from Seeds where Sort_ID=' + InttoStr(DM.qSort['ID']), DM.q1Time);
        if ((DM.q1Time['Gram'] = Null) or (DM.q1Time['Gram'] = 0)) and
          ((DM.q1Time['Shtuk'] = Null) or (DM.q1Time['Shtuk'] < Cn)) then begin
          if DM.q1Time['Shtuk'] = Null then
            i := 0
          else
            i := DM.q1Time['Shtuk'];
          if (MessageDlg('Имеющихся семян (' + IntToStr(i) + ' штук) недостаточно. Продолжить подгонку блока под ' +
            IntToStr(Cn) + ' штук?', mtWarning, [mbYes, mbNo], 0) = mrNo) then
            Exit;
        end;
        Button5Click(Sender);
        DrawGryad(Image4.Picture.Bitmap);
        S.Clear;
        r := DM.qSort['Dist'];
        if R > 0.5 then
          db := 0.2
        else if r > 0.3 then
          db := Bord1
        else
          db := Bord;
        if S.W < S.H then begin
          ww := S.H - 2 * db;
          hh := S.W - 2 * db;
          Vert := True;
        end else begin
          ww := S.W - 2 * db;
          hh := S.H - 2 * db;
          Vert := False;
        end;
        if (DM.qSort['DistRow'] = Null) or (DM.qSort['DistRow'] = 0) then begin
          if hh < r * SQRT(3) / 2 then begin
            dx := Sqrt(r * r - hh * hh);
            dd := (Cn - 1) * dx;
            Pd := dx;
            Px := 2 * dx;
            PY := hh;
          end else if hh <= r then begin
            dx := Sqrt(r * r - hh * hh);
            dd := ((Cn - 1) div 2) * r + ((Cn - 1) mod 2) * dx;
            Pd := dx;
            Px := r;
            PY := hh;
          end else if hh < r * SQRT(3) then begin
            if Cn = 2 then begin
              dd := 0.04;
              db := R / 2 - 0.02;
              Px := r;
              PY := hh;
              Pd := 0.001;
            end else begin
              dx := Sqrt(r * r - hh * hh / 4);
              dd := (((Cn - 1) div 3) * 2 + Devided(Cn, 3)) * dx;
              Pd := dx;
              Px := 2 * dx;
              PY := hh / 2;
            end;
          end else if hh <= 2 * r then begin
            dx := Sqrt(r * r - hh * hh / 4);
            dd := ((Cn - 1) div 3) * r + Devided(Cn, 3) * dx;
            Pd := dx;
            Px := r;
            PY := hh / 2;
          end else if hh < r * 3 * SQRT(3) / 2 then begin
            if Cn = 3 then begin
              dd := 0.04;
              db := R / 2 - 0.02;
              Px := r;
              Py := hh / 2;
              PD := 0.001;
            end else begin
              dx := Sqrt(r * r - hh * hh / 16);
              dd := ((Cn - 1) div 5) * 2 * dx;
              if (Cn - 1) mod 5 > 2 then
                dd := dd + dx;
              Pd := dx;
              Px := 2 * dx;
              PY := hh / 4;
            end;
          end else if hh < r * 3 then begin
           { dx := Sqrt(r * r - hh * hh / 9);
            CurN := 2 * (trunc(ww / r + 0.001) + trunc((ww - dx) / r + 0.001) + 2);
            Pd := dx;
            Px := r;
            PY := hh / 3; }
            ShowMessage('Не доделал');
          end;

        end else begin
          nr := Trunc(hh / r + 0.001) + 1;
          n := CN div nr;
          if nr * n < Cn then
            N := N + 1;
          dd := DM.qSort['DistRow'] * N;
          pd := 0;
          Px := DM.qSort['DistRow'];
          Py := DM.qSort['Dist'];
        end;
        if DD < r - 2 * db then
          dd := r - 2 * db;
        if dd > ww then
          ShowMessage('Не помещается столько на выбранный блок')
        else begin
          OldW := S.w;
          OldH := S.h;
          Button10.Enabled := True;
          if Vert then begin
           // S.y:=S.y+s.H-dd + 2 * db;
            S.H := dd + 2 * db;
            S.Invert := (S.h < S.w) and (dx > 0);
            S.iy1 := S.iy + round(S.H * k);
          end else begin
            S.W := dd + 2 * db;
            S.ix1 := S.ix + round(S.W * k);
            S.Invert := (S.h > S.w) and (dx > 0);
          end;
          if PY > Px then begin
            S.Px := round(py * k);
            S.Py := round(px * k);
          end else begin
            S.Px := round(px * k);
            S.Py := round(py * k);
          end;
          S.pd := round(pd * k);
          S.db := round(db * k);
          s.PN := CN;
          NumInp2.Visible := True;
          NumInp2.Value := CurN;
          DrawGryad(Image4.Picture.Bitmap);
          S.PutPoints(Image4.Picture.Bitmap, x0, y0);
          Button7.Caption:='Подтвердить';
          Button7.Enabled := True;
        end;
      end else
        ShowMessage('Не задано количество растений');
    end else
      ShowMessage('Выбранный блок еще не сохранен в базу!');
  end else
    ShowMessage('Не выбран блок');
end;

procedure TfGryadTmp.Button10Click(Sender: TObject);
var S: TSect;
begin
  s := nil;
  S := GetSelSect;
  if S <> nil then begin
    S.H := OldH;
    S.iy1 := S.iy + round(S.H * k);
    S.W := OldW;
    S.ix1 := S.ix + round(S.W * k);
    s.Clear;
    DrawGryad(Image4.Picture.Bitmap);
  end;
  Button10.Enabled := False;
end;

procedure TfGryadTmp.DBGrid1CellClick(Column: TColumn);
var id: integer;
begin
  id := DM.qGryadTmp['sort_Id'];
  SelCurSort(ID);
  SelectSecByNum(DM.qGryadTmp['N']);
end;

procedure TfGryadTmp.SelectSecByNum(Num: integer);
var j: integer;
begin
  for j := 0 to L.Count - 1 do
    if TSect(l[j]).Num = Num then begin
      SelectSec(j);
      DrawGryad(Image4.Picture.Bitmap);
      Break;
    end;
end;

procedure TfGryadTmp.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (DM.qVid['rod'] = 'Пасленовые') or (DM.qVid['rod'] = 'Тыквенные') then begin
    if DM.qSort['Sozr'] <> Null then begin
      if DM.qSort['Sozr'] > 115 then
        DBGrid3.Canvas.Brush.Color := clRed
      else if DM.qSort['Sozr'] > 95 then
        DBGrid3.Canvas.Brush.Color := $000080FF
      else
        DBGrid3.Canvas.Brush.Color := clGreen;
    end
  end;
  DBGrid3.DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TfGryadTmp.SelCurSort(ID : Integer);
begin
  OpenQr('select item_id from sort where id=' + IntToStr(Id), DM.q1Time);
  DM.qVid.Locate('ID', DM.q1Time['item_ID'], []);
  DM.qSort.Locate('Id', ID, []);
end;

procedure TfGryadTmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dsSort.DataSet:=nil;
end;

end.

