unit Agro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ExtCtrls, ADOUtilsS, Grids, DBGrids, DBCtrls;

type
  TfAgro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    Button1: TButton;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAgro: TfAgro;

implementation

uses DMPlnts;

{$R *.dfm}

procedure TfAgro.Button1Click(Sender: TObject);
begin
  ModalResult:=MrOk;
end;

end.
