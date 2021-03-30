unit UBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, StdCtrls, ExtCtrls, DB;

type
  TfBrowser = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBrowser: TfBrowser;

implementation

uses DMPlnts;

{$R *.dfm}

procedure TfBrowser.FormCreate(Sender: TObject);
begin
   WebBrowser1.Silent := True;
end;

procedure TfBrowser.Button1Click(Sender: TObject);
begin
  if  Dm.qSort.State=dsBrowse then
      Dm.qSort.Edit;
   Dm.qSort['URL']:=WebBrowser1.LocationURL;
   Dm.qSort.Post;
   Close;
end;

procedure TfBrowser.Button2Click(Sender: TObject);
begin
    Close;
end;

procedure TfBrowser.Button3Click(Sender: TObject);
begin
   WebBrowser1.GoBack;
end;

end.
