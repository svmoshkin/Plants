unit PutRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, jpeg, DBCtrls, Mask,
  ExtDlgs, Buttons, ShellApi, DB, ADOUtilsS, ComCtrls;

type
  TfPutRes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image3: TImage;
    Button2: TButton;
    SpeedButton1: TSpeedButton;
    OPD1: TOpenPictureDialog;
    Button3: TButton;
    DataSource1: TDataSource;
    DBEdit3: TDBEdit;
    Button4: TButton;
    Label12: TLabel;
    DateTimePicker1: TDateTimePicker;
    procedure Image3DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    WasDel: boolean;
  end;

var
  fPutRes: TfPutRes;

implementation

uses PlantsMain, DMPlnts;

{$R *.dfm}

procedure TfPutRes.Image3DblClick(Sender: TObject);
var CurImFile: string;
begin
  if (DM.qPosadB['sort_id'] <> Null) and OPD1.Execute then
  begin
    if Pos(MyPAth + 'Foto\', OPD1.FileName) <> 1 then
      FileOperation(OPD1.FileName, MyPAth + 'Foto\' +
        ExtractFileName(OPD1.FileName),
        FO_MOVE, 0);
    CurImFile := MyPAth + 'Foto\' + ExtractFileName(OPD1.FileName);
    Image3.Picture.LoadFromFile(CurImFile);
    if DM.qPosadB.State = dsBrowse then
      DM.qPosadB.Edit;
    DM.qPosadB['image'] := 'Foto\' + ExtractFileName(OPD1.FileName);
    DM.qPosadB.Post;
  end;

end;

procedure TfPutRes.Button2Click(Sender: TObject);
begin
  if not Button3.Visible then begin
    if DM.qPosadB.State <> dsEdit then
      DM.qPosadB.Edit;
    if DM.qPosadB['MnLetn'] = 0 then
      DM.qPosadB['Deleted'] := 1;
    DM.qPosadB['ResDate'] := Round(DateTimePicker1.DateTime);
    DM.qPosadB.Post;
    WasDel := True;
  end else begin
    if DM.qPosadB.State = dsEdit then
      DM.qPosadB.Post;
  end;
  ModalResult := mrOK;
end;

procedure TfPutRes.Button1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfPutRes.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if Visible and (Field = nil) and (DM.qPosadB['sort_id'] <> Null) then begin
    OpenQr('select Letn from [sort] s where s.Id=' + intToStr(DM.qPosadB['sort_id']), DM.q1Time);
    Button3.Visible := DM.q1Time['Letn'] = 3;
  end;
end;

procedure TfPutRes.FormShow(Sender: TObject);
begin
  DataSource1DataChange(nil, nil);
  WasDel := False;
end;

procedure TfPutRes.Button3Click(Sender: TObject);
begin
  if DM.qPosadB.State <> dsEdit then
    DM.qPosadB.Edit;
  DM.qPosadB['Deleted'] := 1;
  DM.qPosadB['ResDate'] := DateTimePicker1.DateTime;
  DM.qPosadB.Post;
  WasDel := True;
  ModalResult := mrOK;
end;

procedure TfPutRes.Button4Click(Sender: TObject);
begin
  if MessageDlg('Вы уверены, что хотите безвозвратно удалить запись об ' + #13 + #10 + 'этих посадках?',
    mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    if DM.qPosadB.State <> dsBrowse then
      DM.qPosadB.Cancel;
    DM.qPosadB.Delete;
    ModalResult := mrOK;
  end;
end;

procedure TfPutRes.FormCreate(Sender: TObject);
begin
  DateTimePicker1.DateTime := Now;
end;

end.

