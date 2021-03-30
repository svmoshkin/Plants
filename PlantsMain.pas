unit PlantsMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, ADOUtilsS, jpeg, ExtCtrls, StdCtrls,
  Grids, DBGrids, DB, DBCtrls, Mask, ExtDlgs, ShellAPI, DateUtils, Buttons,
  ADODB,
  IntList, Printers, NumInp, Registry;

type
  TFPlantsMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    dsCat: TDataSource;
    dsVid: TDataSource;
    dsSort: TDataSource;
    dsUdobr: TDataSource;
    dsRes: TDataSource;
    GroupBox1: TGroupBox;
    Image3: TImage;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBCheckBox1: TDBCheckBox;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit6: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    GroupBox2: TGroupBox;
    Image4: TImage;
    dsGryad: TDataSource;
    Panel2: TPanel;
    DBNavigator3: TDBNavigator;
    DBGrid3: TDBGrid;
    Label19: TLabel;
    DBEdit4: TDBEdit;
    Label20: TLabel;
    DBEdit5: TDBEdit;
    Label21: TLabel;
    DBEdit8: TDBEdit;
    Label22: TLabel;
    DBEdit9: TDBEdit;
    Label23: TLabel;
    DBEdit10: TDBEdit;
    Label24: TLabel;
    DBEdit11: TDBEdit;
    Label25: TLabel;
    DBMemo3: TDBMemo;
    Panel3: TPanel;
    Button1: TButton;
    Button3: TButton;
    OPD1: TOpenPictureDialog;
    Button4: TButton;
    Panel4: TPanel;
    Label26: TLabel;
    dsPosad: TDataSource;
    DBGrid4: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Button5: TButton;
    Button6: TButton;
    DBGrid5: TDBGrid;
    dsSHist: TDataSource;
    Button7: TButton;
    TabSheet3: TTabSheet;
    Image5: TImage;
    Edit1: TEdit;
    Button8: TButton;
    Label27: TLabel;
    DBGrid6: TDBGrid;
    Button2: TButton;
    TabSheet4: TTabSheet;
    DBGrid7: TDBGrid;
    Label28: TLabel;
    Edit2: TEdit;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    TabSheet5: TTabSheet;
    Panel5: TPanel;
    dsSvod: TDataSource;
    DBGrid8: TDBGrid;
    Label29: TLabel;
    Edit3: TEdit;
    Button13: TButton;
    TabSheet6: TTabSheet;
    Button14: TButton;
    Label30: TLabel;
    Label31: TLabel;
    Memo1: TRichEdit;
    Memo2: TRichEdit;
    Button15: TButton;
    Label32: TLabel;
    DBMemo4: TDBMemo;
    Button16: TButton;
    PrintDialog1: TPrintDialog;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit7: TDBEdit;
    DBEdit12: TDBEdit;
    Button17: TButton;
    DBEdit13: TDBEdit;
    URL: TLabel;
    Button18: TButton;
    GroupBox4: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    TabSheet7: TTabSheet;
    Label39: TLabel;
    Button19: TButton;
    RichEdit1: TRichEdit;
    Label40: TLabel;
    Button20: TButton;
    RichEdit2: TRichEdit;
    TabSheet8: TTabSheet;
    Panel6: TPanel;
    DBGrid9: TDBGrid;
    Image6: TImage;
    Label35: TLabel;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Label41: TLabel;
    ComboBox1: TComboBox;
    Label42: TLabel;
    DBEdit14: TDBEdit;
    Label43: TLabel;
    DBEdit15: TDBEdit;
    TabSheet9: TTabSheet;
    Image7: TImage;
    Panel7: TPanel;
    Label44: TLabel;
    Edit4: TEdit;
    Button24: TButton;
    DBGrid10: TDBGrid;
    Button25: TButton;
    Button26: TButton;
    Label45: TLabel;
    Button27: TButton;
    DBEdit16: TDBEdit;
    Label46: TLabel;
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure dsVidDataChange(Sender: TObject; Field: TField);
    procedure dsSortDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure dsGryadDataChange(Sender: TObject; Field: TField);
    procedure Image4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Image3DblClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Image5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button11Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure DBGrid8DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure DBGrid8CellClick(Column: TColumn);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure DBGrid9DblClick(Sender: TObject);
    procedure Image6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button23Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Image7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }

    Gr: TBitmap;
    CurImFile: string;
    G: array[1..30] of TRect;
    procedure Recom;
    procedure SelGryad(BMP: TBitmap; NewNum, Year: integer);
    procedure CheckYear;
  public
    { Public declarations }
    procedure CheckSeed;
    procedure NeedSeeds;
    procedure  CalkNeedSeeds;
    function GetX(X: Real): Integer;
    function GetY(Y: Real): Integer;
    function GetX1(X: Real): Integer;
    function GetY1(Y: Real): Integer;
    procedure PrintPlan(Im: TImage; Year: integer; Del: Boolean);
    procedure PutBmp(R: TRect; BMP: TBitmap);
    procedure PutBorder(BMP: TBitmap; Select: Boolean; GID: Integer);
    procedure DrawGryad(BMP: TBitmap; qr: TADOQuery; Year: integer; Del: Boolean; tmp: Boolean = False);
    procedure DrawGryadP(BMP: TBitmap; qr: TADOQuery; Year: integer; Del: Boolean);
    procedure DrawPlan(BMP: TBitmap; Year: integer; Del: Boolean; tmp: Boolean = False);
    procedure DrawPlanP(BMP: TBitmap; Year: integer; Del: Boolean);
    procedure DrawPlanV(BMP: TBitmap; ItmID: integer);
    function GetGryad(x, y: integer): integer;
    procedure PutSortBMP(r: TRect; q: TADOQuery; BMP: TBitMap);
  end;

var
  FPlantsMain: TFPlantsMain;
  kx, ky: real;

implementation

uses DMPlnts, Posad, Agro, img, EditPosad, PutRes, GryadHist, IHistory,
  Gryad, HistGryad, ImFlash, Seeds, UBrowser, Gryadtmp, Svod;

{$R *.dfm}

procedure TFPlantsMain.N1Click(Sender: TObject);
begin
  Close
end;

procedure TFPlantsMain.FormShow(Sender: TObject);
begin
  DM.ADOConnection1.Connected := True;
  dm.tCat.Open;
  dm.tLetn.Open;
  dm.tRost.Open;
  Image1Click(Sender);
  kx := fon.Width / (XM - X0);
  ky := Fon.Height / (Ym - Y0);
  CurGryadNum := 0;
  gr := TBitMap.Create;
  GR.LoadFromFile(MyPath + 'gr.bmp');
  CheckYear;
end;

procedure TFPlantsMain.Image1Click(Sender: TObject);
begin
  DM.CurCatID := 2;
  Label1.Font.Style := [fsBold];
  Label2.Font.Style := [];
  OpenQr('Select * from [item] where Category_ID=2 order by Title',
    DM.qVid);
  Label9.Visible := True;
  Label10.Visible := False;
  DBEdit3.DataField := 'Sozr';
  Label14.Visible := True;
  Label15.Visible := False;
  DBEdit6.DataField := 'Urog';
end;

procedure TFPlantsMain.Image2Click(Sender: TObject);
begin
  DM.CurCatID := 1;
  Label2.Font.Style := [fsBold];
  Label1.Font.Style := [];
  OpenQr('Select * from [item] where Category_ID=1 order by Title',
    DM.qVid);
  Label9.Visible := False;
  Label10.Visible := True;
  DBEdit3.DataField := 'Cvet';
  Label14.Visible := False;
  Label15.Visible := True;
  DBEdit6.DataField := 'Color';

end;

procedure TFPlantsMain.dsVidDataChange(Sender: TObject; Field: TField);
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
//  end;
end;

procedure TFPlantsMain.dsSortDataChange(Sender: TObject; Field: TField);
var
  S: string;
begin
  if Field = nil then
  begin
   // Button18.Enabled:=DM.qSort['URL']<>Null;
    if DM.qSort['image'] <> null then
      s := MyPath + DM.qSort['image']
    else
      S := MyPath + 'foto\Noimage.jpg';
    CurImFile := S;
    Image3.Picture.LoadFromFile(S);
    if DM.qSort['Id'] <> Null then
      OpenQr('select year,res,urog,(select Num  from dbo.gryad s where s.id=Gryad_id) as Num,plantdate,Sht,' +
        '(ISNull(STComment+'' '','''')+Comment) as Comment from dbo.results where Sort_Id=' +
        IntToStr(DM.qSort['Id']) + ' order by year', DM.qSHist);
  end;
  CheckSeed;
end;

procedure TFPlantsMain.FormCreate(Sender: TObject);
var Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.OpenKey('\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION\', True);
    Reg.WriteInteger(ExtractFileName(Application.ExeName), 11000);
  finally
    Reg.Free;
  end;
  MyPath := ExtractFilePath(ParamStr(0));
  Fon := TBitMap.Create;
  Fon.LoadFromFile(MyPath + 'plan.bmp');
  ComboBox1.Items.Clear;
  ComboBox1.Items.Add(Inttostr(CurYear));
  ComboBox1.Items.Add(Inttostr(CurYear + 1));
  ComboBox1.ItemIndex := 0;
end;

procedure TFPlantsMain.DrawPlan(BMP: TBitmap; Year: integer; Del: Boolean; tmp: Boolean);
var i: Integer;
  TName: string;
begin
  if tmp then
    TName := 'GryadTmp'
  else
    TName := 'gryad';
  if Assigned(GR) then begin
    for i := 1 to 30 do begin
      g[i].Left := 0;
      g[i].Top := 0;
      g[i].Bottom := 0;
      g[i].Right := 0;
    end;
    BMP.Assign(Fon);
    Application.ProcessMessages;
    OpenQr('Select * from ' + TName + ' where Year=' + IntToStr(Year), DM.qGryd);
    DM.qGryd.First;
    while not DM.qGryd.Eof do
    begin
      DrawGryad(BMP, DM.qGryd, Year, Del, tmp);
      Application.ProcessMessages;
      DM.qGryd.Next;
    end;
  end;
end;

procedure TFPlantsMain.DrawPlanV(BMP: TBitmap; ItmID: integer);
var i, x1, y1, x2, y2, N, W, D: Integer;
  v: Boolean;
  Pref, S: string;
begin
  if Assigned(GR) then begin
    BMP.Canvas.Brush.Color := $0071AEC6;
    for i := 1 to 30 do begin
      g[i].Left := 0;
      g[i].Top := 0;
      g[i].Bottom := 0;
      g[i].Right := 0;
    end;
    BMP.Assign(Fon);
    BMP.Canvas.Font.Style := [fsBold];
    BMP.Canvas.Font.Color := clBlack;
    OpenQr('select * from dbo.gryad where year=' + IntToStr(CurYear), DM.q2Time);
    while not DM.q2Time.Eof do begin
      x1 := GetX(DM.q2Time['x']);
      x2 := GetX(DM.q2Time['x'] + DM.q2Time['w']);
      y1 := GetY(DM.q2Time['y']);
      y2 := GetY(DM.q2Time['y'] + DM.q2Time['h']);
      BMP.Canvas.Rectangle(x1, y1,
        x2, y2);
      if DM.q2Time['h'] > 0.5 then
        BMP.Canvas.TextOut((X2 + x1) div 2 - 10, (y2 + y1) div
          2 - 5, IntToStr(DM.q2Time['num']))
      else
        BMP.Canvas.TextOut((X2 + x1) div 2 - 10, y1 + 1,
          IntToStr(DM.q2Time['num']));
      DM.q2Time.Next;
    end;
    Application.ProcessMessages;
    OpenQr('select distinct YEAR,gryad_id from dbo.results where (select item_id from dbo.sort s where s.id=sort_id)='
      + IntToStr(ItmID), DM.qLong);
    DM.qLong.First;
    while not DM.qLong.Eof do
    begin
      if OpenQr('select * from dbo.gryad where year=' + DM.qLong.FieldByName('Year').AsString + ' and ID=' +
        DM.qLong.FieldByName('gryad_id').AsString, DM.q2Time) then begin
        x1 := GetX(DM.q2Time['x']);
        x2 := GetX(DM.q2Time['x'] + DM.q2Time['w']);
        y1 := GetY(DM.q2Time['y']);
        y2 := GetY(DM.q2Time['y'] + DM.q2Time['h']);

        N := DM.q2Time['Num'];
        g[N].Left := x1;
        g[N].Top := y1;
        g[N].Bottom := y2;
        g[N].Right := x2;
        Application.ProcessMessages;
      end;
      DM.qLong.Next;
    end;
    BMP.Canvas.Brush.Color := $00B4BEFA;
    BMP.Canvas.Font.Size := 10;
    BMP.Canvas.Font.Style := [fsBold];
    for i := 1 to 30 do
      if g[i].Right > 0 then begin
        V := (G[i].Right - G[i].Left < G[i].Bottom - G[i].Top) and ((G[i].Bottom - G[i].Top) > 45);
        BMP.Canvas.Rectangle(g[i]);
        if V then begin
          y1 := G[i].Top + 15;
          d := 25;
        end else begin
          y1 := G[i].Top + 3;
          d := 15;
        end;
        BMP.Canvas.Font.Color := clRed;
        BMP.Canvas.TextOut((G[i].Right + G[i].Left) div 2 - 10, y1, IntToStr(i));

        S := '';
        OpenQr('Select distinct Year from  dbo.results where (select item_id from dbo.sort s where s.id=sort_id)='
          + IntToStr(ItmID) + ' and (select Num from Gryad g where g.ID=gryad_id)=' + InttoStr(i) + ' order by 1', DM.q1Time);
        while not DM.q1Time.Eof do begin
          if s = '' then
            Pref := ''
          else
            Pref := ', ';
          S := S + Pref + IntToStr(DM.q1Time['Year']);
          DM.q1Time.Next;
        end;
        BMP.Canvas.Font.Color := clBlack;
        W := BMP.Canvas.TextWidth(S);
        Y1 := Y1 + D;
        BMP.Canvas.TextOut((G[i].Right + G[i].Left - W) div 2, y1, s);
        OpenQr('select Res  from  dbo.results where (select item_id from dbo.sort s where s.id=sort_id)='
          + IntToStr(ItmID) + ' and gryad_id in (select ID from Gryad g where num=' + InttoStr(i) + ')', DM.q1Time);
        n := 0;
        w := 0;
        while not DM.q1Time.Eof do begin
          if DM.q1Time['Res'] <> Null then begin
            inc(n);
            W := w + DM.q1Time['Res'];
          end;
          DM.q1Time.Next;
        end;
        if N <> 0 then begin
          S := FormatFloat('#0.#', W / N);
          W := BMP.Canvas.TextWidth(s);
          BMP.Canvas.Font.Color := clGreen;
          Y1 := Y1 + D;
          BMP.Canvas.TextOut((G[i].Right + G[i].Left - W) div 2, y1, s);
        end;
       { end else begin
          BMP.Canvas.TextOut(G[i].Left + 5, (G[i].Bottom + G[i].Top) div 2 - 5, IntToStr(i));
        end; }
      end;
  end;
end;

procedure TFPlantsMain.DrawGryad(BMP: TBitmap; qr: TADOQuery; Year: integer; Del: Boolean; tmp: Boolean = False);
var
  i, x1, y1, x2, y2, N: Integer;
  R: TRect;
  S: string;
  L: TList;
begin
  L := TList.Create;
  try
    if (qr['Comp'] = Year) then
      BMP.Canvas.Brush.Color := $004A4A4A
    else
      BMP.Canvas.Brush.Color := $0071AEC6;
    N := qr['Num'];
    if n = CurGryadNum then
      BMP.Canvas.Pen.Color := clRed
    else
      BMP.Canvas.Pen.Color := clBlack;
    x1 := GetX(qr['x']);
    x2 := GetX(qr['x'] + qr['w']);
    y1 := GetY(qr['y']);
    y2 := GetY(qr['y'] + qr['h']);
    g[N].Left := x1;
    g[N].Top := y1;
    g[N].Bottom := y2;
    g[N].Right := x2;
    BMP.Canvas.Rectangle(x1, y1,
      x2, y2);
    if (qr['Comp'] <> Year) then begin
      if Year = 2018 then begin
        if BMP = Image4.Picture.Bitmap then
          S := ' and Deleted=0'
        else
          s := '';
        if OpenQr('select *, (select image from [sort] s where s.Id=r.sort_id) as images from Results r where((Year=' +
          IntToStr(Year)
          + ')or ((select Letn from [sort] s where s.Id=r.sort_id)=3))' +
          s + ' and [gryad_id]=' + IntToStr(qr['ID']), DM.q2Time)
          then begin
          R.Left := x1 + 1;
          R.Right := x2 - 1;
          R.Top := y1 + 1;
          R.Bottom := y2 - 1;
          if (DM.q2Time['Images'] <> 'foto\Noimage.jpg') or (DM.q2Time.RecordCount > 1)
            then
            PutSortBMP(r, DM.q2Time, BMP)
          else
            PutBmp(R, BMP);
        end;
      end else begin
        ClearList(L);
        FillSectList(L, qr['ID'], kx, x1, y1, tmp);
        for i := 0 to L.Count - 1 do
          TSect(L[i]).Draw(BMP, X1, y1, false, Del);
      end;
    end;
    if qr['h'] > 0.4 then
      BMP.Canvas.Font.Size := 12
    else
      BMP.Canvas.Font.Size := 10;
    BMP.Canvas.Font.Style := [fsBold];
    if qr['h'] > 0.5 then
      BMP.Canvas.TextOut((X2 + x1) div 2 - 10, (y2 + y1) div
        2 - 5, IntToStr(qr['num']))
    else
      BMP.Canvas.TextOut((X2 + x1) div 2 - 10, y1 + 1,
        IntToStr(qr['num']));
  finally
    L.Free;
  end;
end;


procedure TFPlantsMain.PageControl1Change(Sender: TObject);
begin
  if fIm.Visible then
    fIm.Close;
  if PageControl1.ActivePage = TabSheet2 then begin
    CheckYear;
    DrawPlan(Image4.Picture.Bitmap, CurYear, False);
    ComboBox1.ItemIndex := 0;
    CurOperYear := CurYear;
  end else if PageControl1.ActivePage = TabSheet3 then begin
    CurHistYear := CurYear - 1;
    edit1.Text := inttoStr(CurHistYear);
    Button8Click(Sender);

    //DrawPlan(Image5.Picture.Bitmap, CurHistYear);
  end else if PageControl1.ActivePage = TabSheet4 then begin
    Edit2.Text := IntToStr(CurYear);
    Button11Click(Sender);
  end else if PageControl1.ActivePage = TabSheet5 then begin
    edit3.Text := inttoStr(CurYear);
    Button13Click(Sender);
    //DrawPlan(Image5.Picture.Bitmap, CurHistYear);
  end else if PageControl1.ActivePage = TabSheet6 then begin
    Recom;
  end else if PageControl1.ActivePage = TabSheet7 then begin
    NeedSeeds;
  end else if PageControl1.ActivePage = TabSheet8 then begin
    DrawPlanV(Image6.Picture.Bitmap, DM.qVid['ID']);
  end else if PageControl1.ActivePage = TabSheet9 then begin
    Edit4.Text := IntToStr(CurYear);
    DrawPlan(Image7.Picture.Bitmap, CurYear, False, True);
  end
end;

function TFPlantsMain.GetX(X: Real): Integer;
begin
  Result := Round(kx * (X - x0));
end;

function TFPlantsMain.GetX1(X: Real): Integer;
begin

end;

function TFPlantsMain.GetY(Y: Real): Integer;
begin
  Result := Round(ky * (Y));
end;

function TFPlantsMain.GetY1(Y: Real): Integer;
begin

end;

procedure TFPlantsMain.dsGryadDataChange(Sender: TObject; Field: TField);
var
  x1, y1, x2, y2: Integer;
begin
  if (Field <> nil) and ((dsGryad.DataSet.State = dsEdit)
    or (dsGryad.DataSet.State = dsInsert)) then
  begin
    DrawPlan(Image4.Picture.Bitmap, CurOperYear, False);
    Image4.Picture.Bitmap.Canvas.Pen.Color := clRed;
    if dsGryad.DataSet['x'] <> null then
    begin
      x1 := GetX(DM.qCurGrid['x']);
      Image4.Picture.Bitmap.Canvas.MoveTo(x1, 0);
      Image4.Picture.Bitmap.Canvas.LineTo(x1, Image4.Picture.Bitmap.Height);
      if dsGryad.DataSet['w'] <> null then
      begin
        x2 := GetX(DM.qCurGrid['x'] + DM.qCurGrid['w']);
        Image4.Picture.Bitmap.Canvas.MoveTo(x2, 0);
        Image4.Picture.Bitmap.Canvas.LineTo(x2, Image4.Picture.Bitmap.Height);
      end
    end;
    if dsGryad.DataSet['y'] <> null then
    begin
      y1 := GetY(DM.qCurGrid['y']);
      Image4.Picture.Bitmap.Canvas.MoveTo(0, y1);
      Image4.Picture.Bitmap.Canvas.LineTo(Image4.Picture.Bitmap.Width, y1);
      if dsGryad.DataSet['h'] <> null then
      begin
        y2 := GetY(DM.qCurGrid['y'] + DM.qCurGrid['h']);
        Image4.Picture.Bitmap.Canvas.MoveTo(0, y2);
        Image4.Picture.Bitmap.Canvas.LineTo(Image4.Picture.Bitmap.Width, y2);
      end;
    end
  end
  else if (Field = nil) and (dsGryad.DataSet.State = dsBrowse) and (CurOperYear > 0) then
  begin

    SelGryad(Image4.Picture.Bitmap, DM.qCurGrid['num'], CurOperYear);
    OpenQr('Select *, CONVERT(Varchar(4),Shtuk)+'' ''+(select (select title from item i where i.id=s.item_id)+ '
      +
      ''' "''+Title +''"''  from sort s where s.Id=r.sort_id ) as A from results r where ((Year=' +
      IntToStr(CurOperYear)
      + ')or ((select Letn from [sort] s where s.Id=r.sort_id)=3))' +
      ' and Deleted=0 and [gryad_id]=' + IntToStr(DM.qCurGrid['ID']), DM.qPosad);
   // DrawPlan(Image4.Picture.Bitmap, CurYear,False);

  end;

end;

function TFPlantsMain.GetGryad(x, y: integer): integer;
var
  i: integer;
begin
  Result := 0;
  for i := 1 to 30 do
    if (g[i].Bottom > 0) and ((y <= g[i].Bottom) and (x <= g[i].Right) and (x >=
      g[i].Left)
      and (y >= g[i].Top)) then
    begin
      Result := i;
      Exit;
    end;
end;

procedure TFPlantsMain.Image4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var N: integer;
begin
  if DM.qCurGrid.State = dsBrowse then
  begin
    N := GetGryad(X, Y);
    if N > 0 then begin
      SelGryad(Image4.Picture.Bitmap, N, CurOperYear);
      DM.qCurGrid.Locate('Num', CurGryadNum, []);
    end
  end;
end;

procedure TFPlantsMain.Button1Click(Sender: TObject);
begin
  if CurGryadNum > 0 then
  begin
    fGryad.Caption := 'Посадки на грядку №' + IntToStr(CurGryadNum);
    fGryad.Gryad_ID := DM.qCurGrid['ID'];
    FGryad.Del := False;
   // FGryad.Tmp := False;
    fGryad.ShowModal;
   { fPosad.Caption := 'Посадки на грядку №' + IntToStr(CurGryadNum);
    fPosad.ShowModal; }
    dsGryadDataChange(nil, nil);
    DrawGryad(Image4.Picture.Bitmap, DM.qCurGrid, CurOperYear, False);
  end
  else
    ShowMessage('Сначала выберите грядку!');

end;

procedure TFPlantsMain.Button3Click(Sender: TObject);
begin
  if CurGryadNum > 0 then
  begin
    DM.qCurGrid.Locate('Num', CurGryadNum, []);
    fGryadHistory.ShowModal;
  end
  else
    ShowMessage('Сначала выберите грядку!');
end;

procedure TFPlantsMain.PutBmp(R: TRect; BMP: TBitmap);
var
  TR: TRect;
  W, h: integer;
begin
  W := R.Right - R.Left;
  h := R.Bottom - R.Top;
  if W > 256 then
  begin
    TR.Left := 0;
    Tr.Right := 256;
    Tr.Top := 0;
    Tr.Bottom := h;
    BMP.Canvas.CopyRect(R, GR.Canvas, TR);
  end
  else if h > 197 then
  begin
    TR.Left := 0;
    Tr.Right := w;
    Tr.Top := 0;
    Tr.Bottom := 197;
    BMP.Canvas.CopyRect(R, GR.Canvas, TR);
  end
  else
  begin
    TR.Left := 0;
    Tr.Right := w;
    Tr.Top := 0;
    Tr.Bottom := h;
    BMP.Canvas.CopyRect(R, GR.Canvas, TR);
  end;
end;

procedure TFPlantsMain.Button4Click(Sender: TObject);
begin
  OpenQr('Select * from udobr where [item_id]=' +
    IntToStr(DM.qVid['ID']) +
    ' order by srok', DM.qUdobr);
  fAgro.ShowModal;
end;

procedure TFPlantsMain.Image3DblClick(Sender: TObject);
begin
  if (DM.qSort['item_id'] <> Null) and OPD1.Execute then
  begin
    if Pos(MyPAth + 'Foto\', OPD1.FileName) <> 1 then
      FileOperation(OPD1.FileName, MyPAth + 'Foto\' +
        ExtractFileName(OPD1.FileName),
        FO_MOVE, 0);
    CurImFile := MyPAth + 'Foto\' + ExtractFileName(OPD1.FileName);
    Image3.Picture.LoadFromFile(CurImFile);
    if DM.qSort.State = dsBrowse then
      DM.qSort.Edit;
    DM.qSort['image'] := 'Foto\' + ExtractFileName(OPD1.FileName);
    DM.qSort.Post;
  end;
end;

procedure TFPlantsMain.Image3Click(Sender: TObject);
var
  im: TJPEGImage;
begin
  im := TJPEGImage.Create;
  try
    Im.LoadFromFile(CurImFile);
    if im.Height < 730 then
    begin
      fImg.Image1.Stretch := False;
      fImg.Image1.Picture.LoadFromFile(CurImFile);
      fImg.ClientWidth := fImg.Image1.Picture.Width + 1;
      fImg.ClientHeight := fImg.Image1.Picture.Height + 1;

    end
    else
    begin
      fImg.Image1.Stretch := True;
      fImg.ClientHeight := 733;
      fImg.ClientWidth := Round(733 * Im.Width / im.Height);
      fImg.Image1.Picture.LoadFromFile(CurImFile);
    end;
    fImg.ShowModal;
  finally
    im.Free;
  end;

end;

procedure TFPlantsMain.SpeedButton2Click(Sender: TObject);
begin
  if DM.qPosad['ID'] <> Null then
  begin
    ExecQR('delete from results where ID=' + IntToStr(DM.qPosad['ID']),
      DM.q1Time);
    DM.qPosad.Requery([]);
    DrawPlan(Image4.Picture.Bitmap, CurYear, False);
  end;
end;



procedure TFPlantsMain.FormDestroy(Sender: TObject);
begin
  GR.Free;
end;

procedure TFPlantsMain.Button5Click(Sender: TObject);
begin
  OpenQr('Select (select dbo.getFullSortName(sort_id)) as sort,year,plantdate,Sht,Shtuk,STComment, id,Sort_ID,Image,Rass_ID,  (select Num from dbo.gryad where id=gryad_id) as Num, ' +
    'res,urog,Comment,ResDate from results where gryad_id in'
    + '(select ID from gryad where Num=' + IntTostr(DM.qCurGrid['Num']) +
    ') order by Year,Id', DM.q1Time);
  fEditPosad.Caption := 'Редактирование посадок на грядке №' + IntToStr(CurGryadNum);
  fEditPosad.ShowModal;
  DrawGryad(Image4.Picture.Bitmap, DM.qCurGrid, CurOperYear, False);
end;

procedure TFPlantsMain.Button6Click(Sender: TObject);
begin
  if (DM.qPosad.RecordCount > 0) then
    ShowMessage('Сначала нужно убрать с грядки оставшиеся посадки')
  else begin
    if
      (MessageDlg('Вы действительно хотите занять эту грядку под компост?', mtWarning, [mbYes, mbNo], 0) = mrYes) then

      ExecQr('Update gryad set Comp=' + IntToStr(CurOperYear) +
        ' where id=' + IntTostr(DM.qCurGrid['ID']), DM.q1Time);
    DM.qPosad.Requery([]);
    DrawGryad(Image4.Picture.Bitmap, DM.qCurGrid, CurOperYear, False);
    //DrawPlan(Image4.Picture.Bitmap, CurYear,False);
  end;
end;

procedure TFPlantsMain.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'res' then begin
    DBGrid5.Canvas.Font.Style := [fsBold];
    if (DM.qSHist.Active) and (DM.qSHist['res'] <> Null) then begin
      if DM.qSHist['res'] >= 7 then
        DBGrid5.Canvas.Font.Color := $0040FF00
      else if DM.qSHist['res'] >= 4 then
        DBGrid5.Canvas.Font.Color := clBlack
      else
        DBGrid5.Canvas.Font.Color := clRed;
    end else begin
      DBGrid5.Canvas.Font.Color := clBlack;
      DBGrid5.Canvas.Font.Style := [];
    end;
  end else begin
    DBGrid5.Canvas.Font.Color := clBlack;
    DBGrid5.Canvas.Font.Style := [];
  end;
  DBGrid5.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFPlantsMain.Button7Click(Sender: TObject);
begin
  fIHistory.VID := DM.qVid['ID'];
  fIHistory.ShowModal;
end;

procedure TFPlantsMain.Button8Click(Sender: TObject);
var i: integer;
begin
  try
    CurHistYear := StrToInt(Edit1.Text);
    DrawPlan(Image5.Picture.Bitmap, CurHistYear, True);
   // if CurGryadNum > 0 then
    OpenQr('Select *, CONVERT(Varchar(4),Shtuk)+'' ''+(select (select title from item i where i.id=s.item_id)+ '
      +
      ''' "''+Title +''"''  from sort s where s.Id=r.sort_id ) as A from results r where ' +
      ' Gryad_ID=(Select ID from Gryad where Year=' +
      IntToStr(CurHistYear) +
      ' and  Num=' + IntToStr(CurGryadNum) + ')', DM.qGryadYHist);
      {OpenQr('Select *, CONVERT(Varchar(4),Shtuk)+'' ''+(select (select title from item i where i.id=s.item_id)+ '
      +
      ''' "''+Title +''"''  from sort s where s.Id=r.sort_id ) as A from results r where ' +
      ' Gryad_ID=(Select ID from Gryad where Year=' +
      IntToStr(CurHistYear) +
      ' and  Num=' + IntToStr(CurGryadNum) + ')', DM.qGryadYHist);  }
  except
    ShowMessage('Введите корректный год');
  end;
end;

procedure TFPlantsMain.PutSortBMP(r: TRect; q: TADOQuery; BMP: TBitMap);
var
  TR: TRect;
  W, h, D, i, j, St, n, Dl, Lim: integer;
  im: TImage;
  S: string;
  L: TList;
  p: pointer;
begin
  im := TImage.Create(Application);
  L := TList.Create;
  try
    H := 0;
    St := 0;
    while not q.Eof do
    begin
      W := q['Shtuk'];
      if q['images'] <> Null then begin
        L.Add(TStrObj.Create(MyPath + q['images'], W));
        if W > h then
        begin
          H := W;
          n := 1;
        end
        else if W = h then
          inc(n);
      end;
      q.Next;
    end;
    for i := 0 to l.Count - 1 do
      if TSTrObj(l[i]).Lev < H then
        TSTrObj(l[i]).Lev := 0
      else
        TSTrObj(l[i]).Lev := 1;
    if l.Count > 1 then
    begin
      for i := 1 to l.Count - 1 do
        for j := 0 to L.Count - 1 - i do
          if TSTrObj(l[j]).Lev > TSTrObj(l[j + 1]).Lev then
          begin
            P := L[j];
            L[j] := L[j + 1];
            L[j + 1] := P;
          end;
    end;
    W := R.Right - R.Left;
    h := R.Bottom - R.Top;
    TR.Left := R.Left;
    TR.Top := R.Top;
    if W > h then
      Tr.Bottom := R.Bottom
    else
      Tr.Right := R.Right;
    for i := 0 to l.Count - 1 do
    begin
      S := TSTrObj(l[i]).Val;
      Im.Picture.LoadFromFile(s);
      if W > h then
      begin
        D := Round(im.Width * h / im.Height);
        Tr.Right := TR.Left + d;
        if TSTrObj(l[i]).Lev = 0 then
        begin
          BMP.Canvas.StretchDraw(TR, IM.Picture.Graphic);
          Tr.Left := TR.Right;
          Tr.Right := TR.Left + d;
        end else begin
          if St = 0 then
            DL := Round((R.Right - TR.Left) / n);
          lim := TR.Left + DL;
          Inc(St);
          while TR.Right < Lim do
          begin
            BMP.Canvas.StretchDraw(TR, IM.Picture.Graphic);
            Tr.Left := TR.Right;
            Tr.Right := TR.Left + d;
          end;
          TR.Right := Lim;
          BMP.Canvas.StretchDraw(TR, IM.Picture.Graphic);
          TR.Left := Lim;
        end;
      end
      else
      begin
        D := Round(im.Height * w / im.Width);
        Tr.Bottom := Tr.Top + D;
        if TSTrObj(l[i]).Lev = 0 then
        begin
          BMP.Canvas.StretchDraw(TR, IM.Picture.Graphic);
          TR.Top := Tr.Bottom;
          Tr.Bottom := Tr.Top + D
        end
        else
        begin
          if ST = 0 then
            DL := Round((R.Bottom - TR.Top) / n);
          lim := TR.Top + DL;
          Inc(ST);
          while TR.Bottom < Lim do
          begin
            BMP.Canvas.StretchDraw(TR, IM.Picture.Graphic);
            TR.Top := Tr.Bottom;
            Tr.Bottom := Tr.Top + D
          end;
          Tr.Bottom := Lim;
          BMP.Canvas.StretchDraw(TR, IM.Picture.Graphic);
          TR.Top := Lim;
        end;
      end;
    end;
  finally
    im.Free;
  end;

end;

procedure TFPlantsMain.Image5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var N: integer;
begin
  N := GetGryad(X, Y);
  if N > 0 then begin
    SelGryad(Image5.Picture.Bitmap, N, CurHistYear);
    OpenQr('Select *, CONVERT(Varchar(4),Shtuk)+'' ''+(select (select title from item i where i.id=s.item_id)+ '
      +
      ''' "''+Title +''"''  from sort s where s.Id=r.sort_id ) as A,Res from results r where ' +
      ' Gryad_ID=(Select ID from Gryad where Year=' +
      IntToStr(CurHistYear) +
      ' and  Num=' + IntToStr(CurGryadNum) + ')', DM.qGryadYHist);
  end
end;

procedure TFPlantsMain.Button11Click(Sender: TObject);
var Y: integer;
begin
  try
    Y := StrToInt(Edit2.Text);
    Button9.Enabled := y = CurYear;
    Button10.Enabled := Button9.Enabled;
    OpenQr('Select *, '' ''+(select (select title from item i where i.id=s.item_id)+ '
      +
      ''' "''+Title +''"''  from sort s where s.Id=r.sort_id ) as A  from Rassada r where Year=' + Edit2.Text, DM.qRass1);
  except
    ShowMessage('Введите корректный год');
  end;
end;

procedure TFPlantsMain.Button9Click(Sender: TObject);
begin
  fPosad.ID_Gryad := 0;
  fPosad.RasShop := False;
  CurOperYear:=StrToInt(Edit2.Text);
  fPosad.ShowModal;
  DM.qRass1.Requery();
 
end;

procedure TFPlantsMain.Button10Click(Sender: TObject);
begin
  fPosad.ID_Gryad := 0;
  fPosad.RasShop := True;
  CurOperYear:=StrToInt(Edit2.Text);
  fPosad.ShowModal;
  DM.qRass1.Requery();
end;

procedure TFPlantsMain.PutBorder(BMP: TBitmap; Select: Boolean;
  Gid: Integer);
var x1, x2, y1, y2: Integer;
begin
  OpenQr('Select * from gryad where id=' + IntToStr(GID), DM.q1Time);
  if Select then begin
    BMP.Canvas.Pen.Color := clRed;
    //BMP.Canvas.Pen.Width:=2;
  end else begin
    BMP.Canvas.Pen.Color := clBlack;
   // BMP.Canvas.Pen.Width:=1;
  end;
  x1 := GetX(DM.q1Time['x']);
  x2 := GetX(DM.q1Time['x'] + DM.q1Time['w']);
  y1 := GetY(DM.q1Time['y']);
  y2 := GetY(DM.q1Time['y'] + DM.q1Time['h']);
  BMP.Canvas.Polyline([Point(x1, y1), Point(x2, y1), Point(x2, y2), Point(x1, y2), Point(x1, y1)]);
  //  BMP.Canvas.Pen.Width:=1;
end;

procedure TFPlantsMain.SelGryad(BMP: TBitmap; NewNum, Year: integer);
begin
  if Year > 0 then begin
    if OpenQr('Select ID from  gryad where Year=' + IntToStr(Year) + ' and Num='
      + IntToStr(CurGryadNum), DM.q1Time) then
      Putborder(BMP, False, DM.q1Time['ID']);
    CurGryadNum := NewNum;
    OpenQr('Select ID from  gryad where Year=' + IntToStr(Year) + ' and Num='
      + IntToStr(CurGryadNum), DM.q1Time);
    Putborder(BMP, True, DM.q1Time['ID']);
  end;
end;


procedure TFPlantsMain.Button12Click(Sender: TObject);
begin
  if CurGryadNum > 0 then
  begin
    OpenQr('Select ID from  gryad where Year=' + IntToStr(CurHistYear) + ' and Num='
      + IntToStr(CurGryadNum), DM.q1Time);
    fHistGryad.Caption := 'Посадки на грядку №' + IntToStr(CurGryadNum) + ' в ' + IntToStr(CurHistYear) +
      ' году';
    fHistGryad.Gryad_ID := DM.q1Time['ID'];
    //fHistGryad.Del:=False;
    fHistGryad.ShowModal;
   { fPosad.Caption := 'Посадки на грядку №' + IntToStr(CurGryadNum);
    fPosad.ShowModal; }
   // dsGryadDataChange(nil, nil);
   // DrawGryad(Image4.Picture.Bitmap,DM.qCurGrid, CurYear,False);
  end
  else
    ShowMessage('Сначала выберите грядку!');

end;

procedure TFPlantsMain.Button13Click(Sender: TObject);
var i, g: integer;
begin
  try
    g := StrToInt(Edit3.Text);

   // if CurGryadNum > 0 then
    OpenQr('select id, (select (select title from item i where i.id=s.item_id)' +
      '+'' "''+Title +''"''  from sort s where s.Id=r.sort_id ) as A,urog, res, comment, sort_id, plantdate,' +
      '(select Num from dbo.gryad g where g.id=r.gryad_id) as B,Shtuk, STComment,  ShT,  ResDate,Gryad_ID ' +
      'from dbo.results r where YEAR=' + IntToStr(g) + ' order by A', DM.qSvod);
    fIm.Year := g;
    fIm.Gryad_ID := DM.qSvod['gryad_id'];
    if fIm.Visible then
      fIm.DrawGryad(FIm.Image1.Picture.Bitmap)
    else
      fIm.Show;
  except
    ShowMessage('Введите корректный год');
  end;

end;

procedure TFPlantsMain.DBGrid8DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'res' then begin
    DBGrid8.Canvas.Font.Style := [fsBold];
    if DM.qSvod['res'] >= 7 then
      DBGrid8.Canvas.Font.Color := $0040FF00
    else if DM.qSvod['res'] >= 4 then
      DBGrid8.Canvas.Font.Color := clBlack
    else
      DBGrid8.Canvas.Font.Color := clRed;
  end else begin
    DBGrid8.Canvas.Font.Color := clBlack;
    DBGrid8.Canvas.Font.Style := [];
  end;
  DBGrid8.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFPlantsMain.Recom;
var N: integer;
  S, W: string;
  R: real;
  M1, M2: TstringList;
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  try
   { M1:=TStringList.Create;
    M2:=TStringList.Create; }
    DM.qVid.DisableControls;
    DM.qVid.First;
    while not DM.qVid.Eof do begin
      if OpenQr('select sort_id,(select title from dbo.sort s where s.id=r.sort_id) as Title, COUNT(*) as C,' +
        '(SUM(CONVERt(float,res))/COUNT(*)+(COUNT(distinct year)-1)/COUNT(distinct year)) as R,COUNT(distinct year) as Y ' +
        'from results r where  Res>0  and Sort_id in(Select id from Sort where Item_Id='
        + IntToStr(DM.qVid['id']) + ') group by sort_ID order by R Desc', DM.q1Time) then begin
        if DM.q1Time['R'] > 5 then
          with Memo1 do begin
            Lines.Add(' ');
            SelStart := Length(Text);
            SelAttributes.Size := 10;
            SelAttributes.Style := [fsBold];
            Lines.Add('              ' + DM.qVid['title']);
          end;
        DM.q1Time.Last;
        if DM.q1Time['R'] <= 5 then
          with Memo2 do begin
            Lines.Add(' ');
            SelStart := Length(Text);
            SelAttributes.Size := 10;
            SelAttributes.Style := [fsBold];
            Lines.Add('              ' + DM.qVid['title']);
          end;
        DM.q1Time.First;
        N := 1;
        while not DM.q1Time.Eof do begin
          R := (Round(DM.q1Time['R'] * 100) / 100);
          w := '';
          if OpenQr('select Charact from Sort where id=' + IntToStr(DM.q1Time['Sort_ID']) + ' and Charact!=''''', DM.q2Time) then
            W := ' ' + DM.q2Time['Charact'];
          if OpenQr('select Comment,Year from results where Res>0 and not Comment is Null and Comment!='''' and Sort_id=' +
            IntToStr(DM.q1Time['Sort_ID']) + ' order by Year desc', DM.q2Time) then begin
            while not DM.q2Time.Eof do begin
              if Pos(dm.q2Time['Comment'], W) = 0 then
                W := W + ' ' + dm.q2Time['Comment'] + ' (' + IntToStr(dm.q2Time['Year']) + ')';
              DM.q2Time.Next;
            end
          end;
          if R > 7.9 then
            S := '!'
          else if r > 5.9 then
            s := ''
          else
            s := '?';
          if (R > 5) and ((N < 3) or (R > 6.5)) then begin
            with Memo1 do begin
              SelStart := Length(Text);
              SelAttributes.Size := 8;
              SelAttributes.Style := [fsBold];
              SelText := ('   ' + DM.q1Time['Title'] + ' (' + FormatFloat('0.##', R) + S + '; лет: ' + IntToStr(+DM.q1Time['Y']) + ')');
              SelStart := Length(Text);
              SelAttributes.Style := [];
              SelText := (W + '.' + #13);
            end;
            inc(N);
          end else if (R <= 5) then
            with Memo2 do begin
              SelStart := Length(Text);
              SelAttributes.Size := 8;
              SelAttributes.Style := [fsBold];
              SelText := ('   ' + DM.q1Time['Title'] + ' (' + FormatFloat('0.##', R) + S + '; лет: ' + IntToStr(+DM.q1Time['Y']) + ')');
              SelStart := Length(Text);
              SelAttributes.Style := [];
              SelText := (W + '.' + #13);
            end;
          DM.q1Time.Next;
        end;
      end;
       {if (M1.[M1.Count-1]<>'')and
        (M1.[M1.Count-1][Length(M1.[M1.Count-1])]<>')') then
            M1.Add('?');
         if (M1[M1.Count-1]<>'') then
            Memo1.Add('');
       if (M2[M2.Count-1]='')or
            M2.Add('');  }
      DM.qVid.Next;
    end;

  finally

    DM.qVid.EnableControls;
  end;
end;

procedure TFPlantsMain.Button14Click(Sender: TObject);
begin
  Printer.Orientation := poPortrait;
  Memo1.Print('Recom');
end;

procedure TFPlantsMain.Button15Click(Sender: TObject);
begin
  Printer.Orientation := poPortrait;
  Memo2.Print('Recom');
end;

procedure TFPlantsMain.DBGrid8CellClick(Column: TColumn);
begin
  if fIm.Visible then begin
    fIm.Gryad_ID := DM.qSvod['gryad_id'];
    fIm.DrawGryad(FIm.Image1.Picture.Bitmap);
  end;
end;


procedure TFPlantsMain.DrawPlanP(BMP: TBitmap; Year: integer; Del: Boolean);
var i: Integer;
begin
  for i := 1 to 30 do begin
    g[i].Left := 0;
    g[i].Top := 0;
    g[i].Bottom := 0;
    g[i].Right := 0;
  end;
  OpenQr('Select * from gryad where Year=' + IntToStr(Year), DM.qGryd);
  DM.qGryd.First;
  while not DM.qGryd.Eof do
  begin
    DrawGryadP(BMP, DM.qGryd, Year, Del);
    Application.ProcessMessages;
    DM.qGryd.Next;
  end;
end;



procedure TFPlantsMain.Button16Click(Sender: TObject);
begin

  try
    CurHistYear := StrToInt(Edit1.Text);
  except
    ShowMessage('Введите корректный год');
    Exit
  end;
  PrintPlan(Image5, CurHistYear, True);
  Button8Click(nil);
end;

procedure AngleTextOut(ACanvas: TCanvas; Angle, X, Y: Integer; Str: string);
var
  LogRec: TLogFont;
  OldFontHandle,
    NewFontHandle: hFont;
begin
  GetObject(ACanvas.Font.Handle, SizeOf(LogRec), Addr(LogRec));
  LogRec.lfEscapement := Angle * 10;
  LogRec.lfOrientation := Angle * 10;
  LogRec.lfFaceName := 'Tahoma';
  NewFontHandle := CreateFontIndirect(LogRec);
  OldFontHandle := SelectObject(ACanvas.Handle, NewFontHandle);
  ACanvas.TextOut(X, Y, Str);
  NewFontHandle := SelectObject(ACanvas.Handle, OldFontHandle);
  DeleteObject(NewFontHandle);
end;

procedure TFPlantsMain.DrawGryadP(BMP: TBitmap; qr: TADOQuery;
  Year: integer; Del: Boolean);
var i, x1, y1, x2, y2, N: Integer;
  R: TRect;
  S: string;
  V: Boolean;
begin
  v := qr['h'] > qr['w'] + 0.1;
  {if (qr['Comp'] = Year) then
    BMP.Canvas.Brush.Color := clBlack
  else }
  BMP.Canvas.Brush.Color := clWhite;
  N := qr['Num'];
  BMP.Canvas.Pen.Color := clBlack;
  x1 := GetX(qr['x']);
  x2 := GetX(qr['x'] + qr['w']);
  y1 := GetY(qr['y']);
  y2 := GetY(qr['y'] + qr['h']);
  g[N].Left := x1;
  g[N].Top := y1;
  g[N].Bottom := y2;
  g[N].Right := x2;
  BMP.Canvas.Rectangle(x1, y1,
    x2, y2);
  BMP.Canvas.Brush.Color := clWhite;
  BMP.Canvas.Font.Size := 10;
  if v then
    BMP.Canvas.TextOut(X1 + 2, Y1 + 1, IntToStr(qr['Num']))
  else
    BMP.Canvas.TextOut(X1 + 2, Y1 - 11, IntToStr(qr['Num']));
  OpenQr('select dbo.GetGryadStr (' + IntToStr(Year) + ',' + IntToStr(qr['ID']) + ') as A', DM.q1Time);
  BMP.Canvas.Font.Size := 7;
  if (qr['Comp'] = Year) then
    S := 'Компост'
  else
    S := DM.q1Time['A'];
  if not v then
      //BMP.Canvas.TextOut(X1+1, Y2-15,S)
    AngleTextOut(BMP.Canvas, 0, x1 + 2, y2 - 15, S)
  else
    AngleTextOut(BMP.Canvas, 90, x2 - 18, y2 - 5, S);
end;

procedure TFPlantsMain.PrintPlan(Im: TImage; Year: integer; Del: Boolean);
var B: TBitmap;
  r: TRect;
begin
  try
    B := TBitMap.Create;
    B.Width := Im.Picture.Bitmap.Width;
    B.Height := Im.Picture.Bitmap.Height;
    DrawPlanP(B, Year, Del);
    B.Canvas.Font.Size := 14;
    B.Canvas.TextOut(20, 20, 'Посадки ' + IntToStr(Year) + ' года');
    Image5.Picture.Bitmap.Assign(B);

    Printer.Orientation := poLandscape;

    r.Left := 1;
    r.Top := 1;
    r.Right := Printer.PageWidth - 1;
    r.Bottom := Printer.PageHeight - 1;
  //Round(Printer.PageWidth * Bitmap.Height / Bitmap.Width); // h/w = ph/pw; ph = h/w*pw
 { if r.Bottom > Printer.PageHeight then begin
    r.Bottom := Printer.PageHeight;
    r.Right := Round(Printer.PageHeight * Bitmap.Width / Bitmap.Height);
  end;  }

    if PrintDialog1.Execute then begin
      Printer.BeginDoc;
      Printer.Canvas.StretchDraw(r, B);
      Printer.EndDoc;
    end;
  finally
    B.Free;
  end;
end;

procedure TFPlantsMain.Button17Click(Sender: TObject);
var ID: integer;
begin
  if DM.qSort.State <> dsBrowse then begin
    DM.qSort.Post;
  end;
  ID := DM.qSort['ID'];
  OpenQr('Select * from Seeds where Sort_ID=' + IntToStr(ID), DM.qSeeds);
  TFloatField(DM.qSeeds.FieldByName('Gram')).DisplayFormat := '####0.##';
  fSeeds.Caption := 'Семена сорта ' + DM.qSort['Title'];
  fSeeds.ShowModal;
  CheckSeed;
  DM.qSort.Requery();
  DM.qSort.Locate('ID', ID, []);
end;

procedure TFPlantsMain.Button18Click(Sender: TObject);
begin
  if (DM.qSort['URL'] <> Null) and (DM.qSort['URL'] <> '') then begin
    fBrowser.WebBrowser1.Navigate(DM.qSort['URL']);
    fBrowser.Button1.Visible := False;
  end else begin
    fBrowser.WebBrowser1.Navigate(DM.qVid['title'] + ' ' + DM.qSort['Title'] + ' описание');
    fBrowser.Button1.Visible := True; ;
  end;
  fBrowser.Button3.Visible := fBrowser.Button1.Visible;
  fBrowser.Caption := DM.qVid['title'] + ' ' + DM.qSort['title'];
  fBrowser.Show;
end;

procedure TFPlantsMain.CheckSeed;
var Sh, ShY, ShN, Y: integer;
  S: string;
  G, Gn, GY: Real;
begin

  Sh := 0;
  G := 0;
  Label36.Visible := False;
  Label37.Visible := False;
  Label38.Visible := False;
  if (DM.qSort['Id'] <> Null) then begin
    //OpenQr('select ISNull(Sum(ISNull(Shtuk,0)),0) as S,ISNull(Sum(ISNull(Gram,0)),0) as G from Seeds where Sort_Id=' + IntToStr(DM.qSort['Id']), DM.q1Time) then begin
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
    y := CurYear;
    if MonthOf(Now) > 8 then
      inc(y);
    {if OpenQr('select IsNull(Sum(ISNull(Shtuk,0)),0) as S, ISNull(Sum(ISNull(Gram,0)),0) as G from Seeds where Sort_Id='
      + IntToStr(DM.qSort['Id']) + 'and [YearTo]>=' + Inttostr(Y), DM.q1Time) then begin }
    DM.SeedYear.Active := False;
    DM.SeedYear.Parameters.ParamByName('@SortID').Value := DM.qSort['Id'];
    DM.SeedYear.Parameters.ParamByName('@Y').Value := Y;
    DM.SeedYear.Open;
    ShY := DM.SeedYear['S'];
    GY := DM.SeedYear['G'];
   { end else begin
      ShY := 0;
      GY := 0;
    end; }
  end else
    Label35.Caption := ' Нет';

  if (DM.qSort['Id'] <> Null) then begin
    if DM.qSort['NeedSht'] <> Null then
      ShN := DM.qSort['NeedSht']
    else
      ShN := 0;
    if DM.qSort['NeedG'] <> Null then
      GN := DM.qSort['NeedG']
    else
      GN := 0;
    if (ShY >= SHN) and (GY >= GN) then
      Label36.Visible := True
    else if (Sh >= SHN) and (G >= GN) then
      Label37.Visible := True
    else
      Label38.Visible := True;
  end;
end;

procedure TFPlantsMain.DBEdit7Exit(Sender: TObject);
begin
  CheckSeed;
end;

procedure TFPlantsMain.NeedSeeds;
var s, s1, T: string;
  Sh, ShY, ShN, Y, SD: integer;
  G, Gn, GD, GY: Real;
begin
  RichEdit1.Lines.Clear;
  RichEdit2.Lines.Clear;
  CalkNeedSeeds;
  OpenQr('select item_ID,(select title from item where id=item_id) as vid,' +
    ' ID, title, NeedG, NeedSht from dbo.sort where NeedG>0 or NeedSht>0 order by 2,4', DM.q3Time);
  while not DM.q3Time.Eof do begin
    T := DM.q3Time['vid'] + ' ' + DM.q3Time['title'];
    Sh := 0;
    G := 0;
    ShN := DM.q3Time['NeedSht'];
    GN := DM.q3Time['NeedG'];
    //if OpenQr('select Sum(ISNull(Shtuk,0)) as S,Sum(ISNull(Gram,0)) as G from Seeds where Sort_Id=' + IntToStr(DM.q3Time['Id']), DM.q1Time) then begin
    DM.SeedAll.Active := False;
    DM.SeedAll.Parameters.ParamByName('@SortID').Value := DM.q3Time['Id'];
    DM.SeedAll.Open;
    Sh := DM.SeedAll['S'];
    G := DM.SeedAll['G'];
    y := CurYear;
    if MonthOf(Now) > 8 then
      inc(y);
     { OpenQr('select Sum(ISNull(Shtuk,0)) as S,Sum(ISNull(Gram,0)) as G from Seeds where Sort_Id='
        + IntToStr(DM.q3Time['Id']) + 'and [YearTo]>=' + Inttostr(Y), DM.q1Time);}

    DM.SeedYear.Active := False;
    DM.SeedYear.Parameters.ParamByName('@SortID').Value := DM.q3Time['Id'];
    DM.SeedYear.Parameters.ParamByName('@Y').Value := Y;
    DM.SeedYear.Open;
    ShY := DM.SeedYear['S'];
    GY := DM.SeedYear['G'];
  //  end;
    S1 := t;
    S := '  - ';
    if Gn > 0 then begin
      S1 := s1 + '  - ' + formatFloat('###0.##', GN) + ' грамм';
      S := ' и ';
    end;
    if ShN > 0 then
      S1 := S1 + s + intTostr(ShN) + ' штук';
    RichEdit1.Lines.Add(s1);
      //end;

    Sd := SHN - Sh;
    GD := GN - G;
    with RichEdit2 do begin
      SelStart := Length(Text);
           // SelAttributes.Size := 10;

      if (SD > 0) or (GD > 0) then begin
        S1 := t + ' докупить: ';
        S := '';
        SelAttributes.Style := [fsBold];
        if Gd > 0 then begin
          S1 := s1 + formatFloat('###0.##', GD) + ' грамм';
          S := ' и ';
        end;
        if Sd > 0 then
          S1 := S1 + s + intTostr(SD) + ' штук';
        Lines.Add(s1);
      //end;
      end else begin
        Sd := SHN - ShY;
        GD := GN - GY;
        if (SD > 0) or (GD > 0) then begin
          S1 := t + ' обновить: ';
          S := '';
          SelAttributes.Style := [];
          if Gd > 0 then begin
            S1 := s1 + formatFloat('###0.##', Gd) + ' грамм';
            S := ' и ';
          end;
          if Sd > 0 then
            S1 := S1 + s + intTostr(SD) + ' штук';
          Lines.Add(s1);
      //end;
        end;
      end;
    end;
    Dm.q3Time.Next;
  end;
end;

procedure TFPlantsMain.Button19Click(Sender: TObject);
begin
  Printer.Orientation := poPortrait;
  RichEdit1.Print('Намечено посадить');
end;

procedure TFPlantsMain.Button20Click(Sender: TObject);
begin
  Printer.Orientation := poPortrait;
  RichEdit2.Print('Нужно купить');
end;



procedure TFPlantsMain.DBGrid9DblClick(Sender: TObject);
begin
  DrawPlanV(Image6.Picture.Bitmap, DM.qVid['ID']);
end;

procedure TFPlantsMain.Image6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var N: integer;
begin
  N := GetGryad(X, Y);
  if N > 0 then
    SelGryad(Image6.Picture.Bitmap, N, CurYear);
end;

procedure TFPlantsMain.CheckYear;
begin
  if OpenQr('Select top 1 * from gryad where [Year]=' + IntToStr(CurYear + 1), DM.q1Time) then begin
    ComboBox1.Enabled := True;
  end else begin
    ComboBox1.Enabled := False;
  end;
  Button23.Enabled := not ComboBox1.Enabled;
end;

procedure TFPlantsMain.Button23Click(Sender: TObject);
begin
  if (MessageDlg('Создать схему грядок для посадок следующего года?', mtWarning, [mbYes, mbNo], 0) = mrYes) then begin
    DM.MakeNewYear(CurYear + 1);
    CheckYear;
    ComboBox1.ItemIndex := 1;
  end;
end;

procedure TFPlantsMain.ComboBox1Select(Sender: TObject);
begin
  CurOperYear := StrToInt(ComboBox1.Items[ComboBox1.ItemIndex]);
  DM.GetYearGriads(CurOperYear, dM.qCurGrid);
  DrawPlan(Image4.Picture.Bitmap, CurOperYear, False);
end;

procedure TFPlantsMain.Button24Click(Sender: TObject);
begin
  ExecQr('Delete from ResultsTmp', DM.q1Time);
  ExecQr('Delete from SectionsTmp', DM.q1Time);
  ExecQr('set identity_insert [SectionsTmp] on;' +
    ' insert into [dbo].[SectionsTmp] ([Id], [Gryad_ID], [Year], [Num], [x], [y], [w], [h], [Generation],Prev_ID)' +
    '(select [Id], [Gryad_ID], [Year], [Num], [x], [y], [w], [h], [Generation],Prev_ID from [dbo].[Sections] where [Year]=' +
    IntToStr(CurYear) + '); set identity_insert [SectionsTmp] off', DM.q1Time);
  ExecQr('set identity_insert [resultstmp] on;' +
    'insert into [dbo].[resultstmp] ([id], [year], [sort_id], [gryad_id], [Shtuk], [Sect_ID], [MnLetn], [Generation])' +
    '(select [id], [year], [sort_id], [gryad_id], [Shtuk], [Sect_ID], [MnLetn], [Generation] from [dbo].[results] where [Year]=' +
    IntToStr(CurYear) + '); set identity_insert [resultstmp] off', DM.q1Time);
  DrawPlan(Image7.Picture.Bitmap, CurYear, False, True);
end;

procedure TFPlantsMain.Image7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var N: integer;
  GH, GW, S: Real;
begin
  N := GetGryad(X, Y);
  if N > 0 then begin
   // CurGryadNum:=N;
    SelGryad(Image7.Picture.Bitmap, N, CurYear);
    OpenQr('Select ID,W,H from GryadTmp where  Num=' + IntToStr(N), DM.q1Time);
    GW := DM.q1Time['W'];
    GH := DM.q1Time['H'];
    S := GW * Gh;
    Label45.Caption := 'Площадь грядки ' + FormatFloat('#0.##', S) + 'кв.м';
    OpenQr('Select Sort_id, (Select Num from SectionsTmp s where s.id=Sect_ID) as N,' +
      ' CONVERT(Varchar(4),Shtuk)+''  ''+(select (select title from item i where i.id=s.item_id)+ '
      +
      ''' "''+Title +''"''  from sort s where s.Id=r.sort_id ) as A from resultstmp r where ' +
      ' Gryad_ID=' + IntToStr(DM.q1Time['ID']), DM.qGryadtmp);
  end

end;

procedure TFPlantsMain.Button26Click(Sender: TObject);
begin
  if CurGryadNum > 0 then begin
    OpenQr('select * from GryadTmp where  Num=' + IntToStr(CurGryadNum), DM.qCurTmpGryad);
    fGryadTmp.Caption := 'Намечаем посадки на грядку №' + IntToStr(CurGryadNum);
    fGryadTmp.Gryad_ID := DM.qCurTmpGryad['ID'];

    fGryadTmp.ShowModal;
    DM.qGryadtmp.Requery();
    DrawGryad(Image7.Picture.Bitmap, DM.qCurTmpGryad, CurYear, False, True);
  end
  else
    ShowMessage('Сначала выберите грядку!');
end;

procedure TFPlantsMain.Button27Click(Sender: TObject);
begin
  fSvod.ShowModal;
end;

procedure TFPlantsMain.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 // if not(gdSelected in State) then begin
  if (DM.qVid['rod'] = 'Пасленовые') or (DM.qVid['rod'] = 'Тыквенные') then begin
    if DM.qSort['Sozr'] <> Null then begin
      if DM.qSort['Sozr'] > 115 then
        DBGrid2.Canvas.Brush.Color := clRed
      else if DM.qSort['Sozr'] > 95 then
        DBGrid2.Canvas.Brush.Color := $000080FF
      else
        DBGrid2.Canvas.Brush.Color := clGreen;
    end
  end;
  DBGrid2.DefaultDrawDataCell(Rect, Column.Field, State);
// DBGrid2.Canvas.Brush.Color:=clWhite;
end;

procedure TFPlantsMain.CalkNeedSeeds;
begin
  ExecQr('Update Sort set NeedSht=0',DM.q1Time);
   try
   ExecQr('drop table #ttt',DM.q1Time);
   except
   end;
	 ExecQr('Select sum(Shtuk)as  N, sort_Id,(select title from Sort where id=Sort_id) as Name into #ttt  from [dbo].[resultstmp]  t where '+
	 'not exists (select * from Results r where r.id=t.id) Group by sort_Id',DM.q1Time);
	 ExecQr('update #ttt set N=N-IsNull((select Sum(Shtuk) from [dbo].[Rassada] r where #ttt.Sort_Id=r.Sort_ID and Year=2021 Group by Sort_id),0)',DM.q1Time);
   ExecQr('Update Sort set NeedSht=IsNull((select N from #ttt  where Sort_Id=ID and N>0),0)',DM.q1Time);
    ExecQr('drop table #ttt',DM.q1Time);
end;

end.

