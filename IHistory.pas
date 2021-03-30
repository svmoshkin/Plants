unit IHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, ExtCtrls, ADOUtilsS;

type
  TfIHistory = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    VID: integer;
    procedure ShowGr(ID,Year : integer);
  end;

var
  fIHistory: TfIHistory;

implementation

uses DMPlnts, Res, ImFlash;

{$R *.dfm}

procedure TfIHistory.FormShow(Sender: TObject);
begin
  OpenQr('Select Title from dbo.item where id=' + IntToStr(Vid), DM.q1Time);
  Caption := DM.q1Time['Title'] + ' - история инаших посадок';
  OpenQr('select year,(select    title from dbo.sort s where s.id=sort_id) as sort, ' +
    'plantdate,Sht,STComment, id,Sort_ID,Image,Rass_ID, gryad_id, (select Num from dbo.gryad where id=gryad_id) as Num, ' +
    'res,urog,Comment,ResDate from dbo.results where sort_id ' +
    'in (Select ID from dbo.sort where item_id=' + IntToStr(Vid) + ') order by 2,year',
    DM.qIHist);
  ShowGR(0,CurYear);
end;

procedure TfIHistory.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfIHistory.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'res' then begin
    DBGrid1.Canvas.Font.Style := [fsBold];
    if DM.qIHist['res'] >= 7 then
      DBGrid1.Canvas.Font.Color := $0040FF00
    else if DM.qIHist['res'] >= 4 then
      DBGrid1.Canvas.Font.Color := clBlack
    else
      DBGrid1.Canvas.Font.Color := clRed;
  end else begin
    DBGrid1.Canvas.Font.Color := clBlack;
    DBGrid1.Canvas.Font.Style := [];
  end;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfIHistory.DBGrid1TitleClick(Column: TColumn);
var S, ss: string;
begin
  s := Column.FieldName;
  if S = 'sort' then
    ss := '2,year'
  else if s = 'year' then
    ss := 'year,2'
  else
    ss := s + ',year,2';
  OpenQr('select  year,(select title from dbo.sort s where s.id=sort_id) as sort, ' +
    'plantdate,Sht,STComment, id,Sort_ID,Image,Rass_ID,  (select Num from dbo.gryad where id=gryad_id) as Num, ' +
    'res,urog,Comment,ResDate from dbo.results where sort_id ' +
    'in (Select ID from dbo.sort where item_id=' + IntToStr(Vid) + ') order by ' + ss,
    DM.qIHist);
end;

procedure TfIHistory.DBGrid1DblClick(Sender: TObject);
begin
  fRes.QCur :=  DM.qIHist;
  fRes.ID := DM.qIHist['ID'];
  fRes.ShowModal;
end;

procedure TfIHistory.ShowGr(ID,Year: integer);
begin
     fIm.Year := Year;
  fIm.Gryad_ID := ID;
  if fIm.Visible then
    fIm.DrawGryad(FIm.Image1.Picture.Bitmap)
  else
    fIm.Show;
end;

procedure TfIHistory.DBGrid1CellClick(Column: TColumn);
begin
    ShowGr(DM.qIHist['gryad_id'],DM.qIHist['Year']);
end;

procedure TfIHistory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     fIm.Visible:=False;
end;

end.

