unit EditPosad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, StdCtrls, jpeg, Buttons, ExtDlgs,
  ShellApi, ADOUtilsS;

type
  TfEditPosad = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    Image3: TImage;
    Label1: TLabel;
    OPD1: TOpenPictureDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Image3Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEditPosad: TfEditPosad;

implementation

uses DMPlnts, img, Res;

{$R *.dfm}

procedure TfEditPosad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataSource1.DataSet := nil;
end;

procedure TfEditPosad.FormShow(Sender: TObject);
begin
  DataSource1.DataSet := DM.q1Time;
end;

procedure TfEditPosad.Button1Click(Sender: TObject);
begin
  if DM.q1Time.State <> dsBrowse then
    DM.q1Time.Post;
   // Close;
end;

procedure TfEditPosad.SpeedButton1Click(Sender: TObject);
var CurImFile: string;
begin
  if (DM.q1Time['sort_id'] <> Null) and OPD1.Execute then
  begin
    if Pos(MyPAth + 'Foto\', OPD1.FileName) <> 1 then
      FileOperation(OPD1.FileName, MyPAth + 'Foto\' +
        ExtractFileName(OPD1.FileName),
        FO_MOVE, 0);
    CurImFile := MyPAth + 'Foto\' + ExtractFileName(OPD1.FileName);
    Image3.Picture.LoadFromFile(CurImFile);
    if DM.q1Time.State = dsBrowse then
      DM.q1Time.Edit;
    DM.q1Time['image'] := 'Foto\' + ExtractFileName(OPD1.FileName);
    DM.q1Time.Post;
  end;

end;

procedure TfEditPosad.DataSource1DataChange(Sender: TObject;
  Field: TField);
var S: string;
begin
  if Field = nil then begin
    if DM.q1Time['image'] <> null then
      s := MyPath + DM.q1Time['image']
    else
      S := MyPath + 'foto/Noimage.jpg';
    Image3.Picture.LoadFromFile(S);
  end;
end;

procedure TfEditPosad.Image3Click(Sender: TObject);
var
  im: TJPEGImage;
  CurImfile: string;
begin
  if DM.q1Time['image'] <> Null then begin
    CurImfile := MyPAth + DM.q1Time['image'];
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

end;

procedure TfEditPosad.DBGrid1TitleClick(Column: TColumn);
var S, ss: string;
begin
  s := Column.FieldName;
  if S = 'sort' then
    ss := '1,year'
  else if s = 'year' then
    ss := 'year,1'
  else
    ss := s + ',year,1';
  OpenQr('Select (select dbo.getFullSortName(sort_id)) as sort,year,plantdate,Sht,STComment, id,Sort_ID,Image,Rass_ID,  (select Num from dbo.gryad where id=gryad_id) as Num, ' +
    'res,urog,Comment,ResDate from results where gryad_id in'
    + '(select ID from gryad where Num=' + IntTostr(DM.qCurGrid['Num']) +
    ') order by ' + ss, DM.q1Time);
end;

procedure TfEditPosad.DBGrid1DblClick(Sender: TObject);
begin
  fRes.QCur := DM.q1Time;
  fRes.ID := DM.q1Time['ID'];
  fRes.ShowModal;
end;

end.

