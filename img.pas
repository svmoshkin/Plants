unit img;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TfImg = class(TForm)
    Image1: TImage;
    procedure Image1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImg: TfImg;

implementation

{$R *.dfm}

procedure TfImg.Image1DblClick(Sender: TObject);
begin
  Close;
end;

end.

