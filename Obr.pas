unit Obr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls, ExtCtrls, DMPlnts, ADOUtilsS, DB;

type
  TfObr = class(TForm)
    Panel2: TPanel;
    Button1: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    DBMemo1: TDBMemo;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    BLock: TSect;
  end;

var
  fObr: TfObr;

implementation


{$R *.dfm}

procedure TfObr.FormCreate(Sender: TObject);
begin
  DateTimePicker1.DateTime := Now;
end;

procedure TfObr.FormShow(Sender: TObject);
var s: string;
begin
  S := 'Операция на участке грядки';
  if (Block.id_Sort > 0) and
    OpenQr('select (select title from item i where i.id=s.item_id)+ '
    +
    ''' "''+Title +''"'' as A from sort s where s.Id=' + IntToStr(Block.id_Sort), DM.q1Time) then
    S := s + ' с посадками ' + DM.q1Time['A'];
  OpenQr('Select * from Obr where ID=0', DM.q1Time);
  DM.q1Time.Insert;
  DM.q1Time['Gryad_ID'] := Block.ID_Gryad;
  DM.q1Time['Sort_ID'] := Block.id_Sort;
  DM.q1Time['Block_ID'] := Block.ID;
  DM.q1Time['Operation'] := '';
  DataSource1.DataSet := DM.q1Time;
end;



procedure TfObr.Button1Click(Sender: TObject);
begin
  if DM.q1Time.State <> dsBrowse then
    DM.q1Time.Cancel;

end;

procedure TfObr.Button2Click(Sender: TObject);
begin
  if DM.q1Time['Operation'] <> '' then begin
    DM.q1Time['Date'] := Round(DateTimePicker1.DateTime);
    DM.q1Time.Post;
    ModalResult := mrOK;
  end else
    ShowMessage('Не указана операция');
end;

procedure TfObr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataSource1.DataSet := nil;
end;

end.

