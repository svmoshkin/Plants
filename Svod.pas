unit Svod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DMPlnts, ExtCtrls, DB, Printers,
  ComCtrls;

type
  TfSvod = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    Memo1: TRichEdit;
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSvod: TfSvod;

implementation

uses ADOUtilsS;

{$R *.dfm}

procedure TfSvod.FormShow(Sender: TObject);
begin
  OpenQr('select (Select sum(Shtuk) from [dbo].[resultstmp] where sort_Id in ' +
    '(select ID from sort where item_Id=i.id)) as N, title,ID from [dbo].[item] i where id in ' +
    '(select distinct [item_id] from Sort where id in ' +
    '(select sort_Id from [dbo].[resultstmp])) order by 2 ', DM.qLongTime);
  Memo1.Lines.Clear;
  if OpenQr('select [sort_id],Shtuk,(select title from item where id=' +
    '(select [item_id] from [sort] s where s.id=sort_Id)) as typ, (select s.title  from [sort] s where s.id=sort_Id)' +
    'as name,(select [sozr] from [sort] s where s.id=sort_Id) as Sozr ' +
    'from [dbo].[resultstmp] where ' +
    '((select [rod] from item where id=' +
    '(select [item_id] from [sort] s where s.id=sort_Id))=''Пасленовые'')and ' +
    '((select [sozr] from [sort] s where s.id=sort_Id)>=115)  order by 3,5', DM.q1Time) then begin
    Memo1.Lines.Add('    15 февраля');
    while not DM.q1Time.Eof do begin
      Memo1.Lines.Add(DM.q1Time['typ'] + ' ' + DM.q1Time['name'] + ' (' + intToStr(DM.q1Time['Sozr'])
        + ')' + '  - ' + intToStr(DM.q1Time['Shtuk']));
      DM.q1Time.Next;
    end;
  end;
  if OpenQr('select [sort_id],Shtuk,(select title from item where id=' +
    '(select [item_id] from [sort] s where s.id=sort_Id)) as typ, (select s.title  from [sort] s where s.id=sort_Id)' +
    'as name,(select [sozr] from [sort] s where s.id=sort_Id) as Sozr ' +
    'from [dbo].[resultstmp] where ' +
    '((select [rod] from item where id=' +
    '(select [item_id] from [sort] s where s.id=sort_Id))=''Пасленовые'')and ' +
    '((select [sozr] from [sort] s where s.id=sort_Id) between 95 and 114 )  order by 3,5', DM.q1Time) then begin
    Memo1.Lines.Add('');
    Memo1.Lines.Add('    1 марта');
    while not DM.q1Time.Eof do begin
      Memo1.Lines.Add(DM.q1Time['typ'] + ' ' + DM.q1Time['name'] + ' (' + intToStr(DM.q1Time['Sozr'])
        + ')' + '  - ' + intToStr(DM.q1Time['Shtuk']));
      DM.q1Time.Next;
    end;
  end;
  if OpenQr('select [sort_id],Shtuk,(select title from item where id=' +
    '(select [item_id] from [sort] s where s.id=sort_Id)) as typ, (select s.title  from [sort] s where s.id=sort_Id)' +
    'as name,(select [sozr] from [sort] s where s.id=sort_Id) as Sozr ' +
    'from [dbo].[resultstmp] where ' +
    '((select [rod] from item where id=' +
    '(select [item_id] from [sort] s where s.id=sort_Id))=''Пасленовые'')and ' +
    '((select [sozr] from [sort] s where s.id=sort_Id)<95)  order by 3,5', DM.q1Time) then begin
    Memo1.Lines.Add('');
    Memo1.Lines.Add('    15 марта');
    while not DM.q1Time.Eof do begin
      Memo1.Lines.Add(DM.q1Time['typ'] + ' ' + DM.q1Time['name'] + ' (' + intToStr(DM.q1Time['Sozr'])
        + ')' + '  - ' + intToStr(DM.q1Time['Shtuk']));
      DM.q1Time.Next;
    end;
  end;
  if OpenQr('select [sort_id],Shtuk,(select title from item where id=' +
    '(select [item_id] from [sort] s where s.id=sort_Id)) as typ, (select s.title  from [sort] s where s.id=sort_Id)' +
    'as name,(select [sozr] from [sort] s where s.id=sort_Id) as Sozr ' +
    'from [dbo].[resultstmp] where ' +
    '((select rod from item where id= ' +
    '(select [item_id] from [sort] s where s.id=sort_Id))=''Тыквенные'')  order by 3,5', DM.q1Time) then begin
    Memo1.Lines.Add('');
    Memo1.Lines.Add('    15 апреля');
    while not DM.q1Time.Eof do begin
      Memo1.Lines.Add(DM.q1Time['typ'] + ' ' + DM.q1Time['name'] + ' (' + intToStr(DM.q1Time['Sozr'])
        + ')' + '  - ' + intToStr(DM.q1Time['Shtuk']));
      DM.q1Time.Next;
    end;
  end;
  Datasource1.DataSet := DM.qLongTime;
  DM.q1Time.Active := False;
  DataSource2.DataSet := DM.q1Time;
  DataSource1DataChange(Sender, nil);
end;

procedure TfSvod.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if Field = nil then begin
    OpenQr('select Sum(Shtuk) as N, (select [title] from Sort where id=Sort_ID) as Name,Sort_ID from [resultstmp] where ' +
      'Sort_ID in (Select ID from sort where item_id=' + IntToStr(DM.qLongTime['ID']) + ') ' +
      'group by sort_id order by 2', DM.q1Time);
  end;
end;

procedure TfSvod.Button2Click(Sender: TObject);
begin
  Printer.Orientation := poPortrait;
  Memo1.Print('Сажаем рассаду');
end;

end.

