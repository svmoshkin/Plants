unit Res;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, ADOUtilsS, jpeg, ShellApi,
  ExtDlgs, DB,ADODB;

type
  TfRes = class(TForm)
    DBEdit1: TDBEdit;
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    Image1: TImage;
    Memo1: TMemo;
    Button2: TButton;
    OPD1: TOpenPictureDialog;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    
  public
    { Public declarations }
    id: Integer;
    QCur: TADOQuery;
  end;

var
  fRes: TfRes;

implementation

uses IHistory, DMPlnts, img;

{$R *.dfm}

procedure TfRes.FormShow(Sender: TObject);
var S: string;
begin
  Caption := qCur['sort'] + '; ' + IntToStr(qCur['year']);
  Memo1.Lines.Clear;
  Memo1.Lines.Add('      ПОСАДКА');
  Memo1.Lines.Add('Посажено на грядку: ' + DateToStr(qCur['plantdate']));
  Memo1.Lines.Add('Штук: ' + qCur['ShT']);
  Memo1.Lines.Add('Грядка: ' + IntToStr(qCur['Num']));
  if (qCur['StComment'] <> Null) and (qCur['StComment'] <> '') then
    Memo1.Lines.Add(qCur['StComment']);
  if (qCur['Rass_ID'] <> Null) and (qCur['Rass_ID'] <> 0) then begin

    OpenQr('Select * from [Rassada] where id=' + IntToStr(qCur['Rass_ID']), DM.q1Time);
    if DM.q1Time['PlantDate'] <> Null then begin
      Memo1.Lines.Add('Посажено своей рассадой:');
      Memo1.Lines.Add('Дата посадки рассады: ' + DateToStr(DM.q1Time['PlantDate']));
      Memo1.Lines.Add('Семена: ' + DM.q1Time['Source']);
    end else begin
      Memo1.Lines.Add('Посажено покупной рассадой:');
      Memo1.Lines.Add('Дата покупки рассады   : ' + DateToStr(DM.q1Time['ShopDate']));
      Memo1.Lines.Add('Куплена в: ' + DM.q1Time['Source']);
    end;
    Memo1.Lines.Add('Исходно штук: ' + IntToStr(DM.q1Time['Shtuk']) + '; Осталось: ' + IntToStr(DM.q1Time['Growth']));
    Memo1.Lines.Add('Оценка рассады: ' + IntToStr(DM.q1Time['Result']));
    if DM.q1Time['Comment'] <> Null then
      Memo1.Lines.Add('   : ' + DM.q1Time['Comment']);
  end else
    Memo1.Lines.Add('Посажено семенами');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('      РЕЗУЛЬТАТ');
  if qCur['Res'] = Null then
    Memo1.Lines.Add('Еще не убрано')
  else begin
    Memo1.Lines.Add('Убрано: ' + DateToStr(qCur['resdate']));
    if qCur['Urog'] <> Null then
      Memo1.Lines.Add('Урожай: ' + FloatToStr(qCur['Urog']));
    Memo1.Lines.Add('Оценка: ' + IntToStr(qCur['Res']));

  end;
  if qCur['Image'] <> Null then
    s := MyPath + qCur['image']
  else
    S := MyPath + 'foto\Noimage.jpg';
  Image1.Picture.LoadFromFile(S);
end;

procedure TfRes.Button2Click(Sender: TObject);
var CurImFile: string;
begin
  if OPD1.Execute then
  begin
    if Pos(MyPAth + 'Foto\', OPD1.FileName) <> 1 then
      FileOperation(OPD1.FileName, MyPAth + 'Foto\' +
        ExtractFileName(OPD1.FileName),
        FO_MOVE, 0);
    CurImFile := MyPAth + 'Foto\' + ExtractFileName(OPD1.FileName);
    Image1.Picture.LoadFromFile(CurImFile);
    if qCur.State = dsBrowse then
      qCur.Edit;
    qCur['image'] := 'Foto\' + ExtractFileName(OPD1.FileName);
    qCur.Post;
  end;
end;

procedure TfRes.Image1DblClick(Sender: TObject);
var
  im: TJPEGImage;
  CurImfile: string;
begin
  if qCur['image'] <> Null then begin
    CurImfile := MyPAth + qCur['image'];
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

procedure TfRes.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

