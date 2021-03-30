unit Seeds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, StdCtrls, DBCtrls;

type
  TfSeeds = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSeeds: TfSeeds;

implementation

uses DMPlnts;

{$R *.dfm}

procedure TfSeeds.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfSeeds.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if DataSource1.DataSet.State<> dsBrowse then
       DataSource1.DataSet.Post;
end;

end.

