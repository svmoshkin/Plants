unit GryadHist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, ADOUtilsS, DB;

type
  TfGryadHistory = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    DataSource1: TDataSource;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fGryadHistory: TfGryadHistory;

implementation

uses DMPlnts, Res;

{$R *.dfm}

procedure TfGryadHistory.FormShow(Sender: TObject);
var S: string;
begin
  Caption := 'История грядки №' + InttoStr(CurGryadNum);
  OpenQr('select year,(select (select title from dbo.item i where i.id=item_id)+' +
    ''' ''+ title from dbo.sort s where s.id=sort_id) as sort,'+
    'plantdate,Sht,STComment, id,Sort_ID,Image,Rass_ID,  (select Num from dbo.gryad where id=gryad_id) as Num, ' +
    'res,urog,Comment,ResDate from results where gryad_id in'
    + '(select ID from gryad where Num='
    + IntToStr(DM.qCurGrid['Num']) + ') order by year,2',
    DM.qHist);
  OpenQr('Select distinct Date,Operation from Obr where Gryad_Id in(select ID from gryad where Num='
    + IntToStr(DM.qCurGrid['Num']) + ') order by Date', DM.qObr);
  Datasource1.DataSet := DM.qObr;
  if OpenQr('select distinct Comp from Gryad where Num=' + IntToStr(DM.qCurGrid['Num']) +
    ' and Comp>0  order by Comp', DM.q1Time) then begin
    s := '';
    while not DM.q1Time.eof do begin
      S := s + IntToStr(DM.q1Time['Comp']) + ', ';
      DM.q1Time.Next;
    end;
    Delete(S, Length(S) - 1, 2);
    Label1.Caption := 'Компост: ' + S;
  end else
    Label1.Caption := 'Компоста не было';
end;

procedure TfGryadHistory.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'res' then begin
    DBGrid1.Canvas.Font.Style := [fsBold];
    if DM.qHist['res'] >= 7 then
      DBGrid1.Canvas.Font.Color := $0040FF00
    else if DM.qHist['res'] >= 4 then
      DBGrid1.Canvas.Font.Color := clBlack
    else
      DBGrid1.Canvas.Font.Color := clRed;
  end else begin
    DBGrid1.Canvas.Font.Color := clBlack;
    DBGrid1.Canvas.Font.Style := [];
  end;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfGryadHistory.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfGryadHistory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Datasource1.DataSet := nil;
end;

procedure TfGryadHistory.DBGrid1TitleClick(Column: TColumn);
var S, ss: string;
begin
  s := Column.FieldName;
  if S = 'sort' then
    ss := '2,year'
  else if s = 'year' then
    ss := 'year,2'
  else
    ss := s + ',year,2';
  OpenQr('select year,(select (select title from dbo.item i where i.id=item_id)+' +
    ''' ''+ title from dbo.sort s where s.id=sort_id) as sort,'+
    'plantdate,Sht,STComment, id,Sort_ID,Image,Rass_ID,  (select Num from dbo.gryad where id=gryad_id) as Num, ' +
    'res,urog,Comment,ResDate from dbo.results where gryad_id in(select ID from gryad where Num='
    + IntToStr(DM.qCurGrid['Num']) + ') order by ' + ss, DM.qHist);
end;

procedure TfGryadHistory.DBGrid1DblClick(Sender: TObject);
begin
  fRes.QCur :=  DM.qHist;
  fRes.ID := DM.qHist['ID'];
  fRes.ShowModal;
end;

end.                             var S, ss: string;
begin
  s := Column.FieldName;
  if S = 'sort' then
    ss := '2,year'
  else if s = 'year' then
    ss := 'year,2'
  else
    ss := s + ',year,2';

