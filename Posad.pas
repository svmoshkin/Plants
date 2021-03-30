unit Posad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, Mask, jpeg, ExtCtrls, Grids, DBGrids,
  ADOUtilsS, NumInp, ComCtrls, DateUtils, InfocommUtils, IntList;

type
  TfPosad = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    Image3: TImage;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBCheckBox1: TDBCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    dsVid: TDataSource;
    dsSort: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label11: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label12: TLabel;
    Memo1: TMemo;
    Label13: TLabel;
    Edit1: TEdit;
    Image1: TImage;
    Label19: TLabel;
    NumInp1: TNumInp;
    Label20: TLabel;
    Label21: TLabel;
    Edit2: TEdit;
    Label22: TLabel;
    ComboBox1: TComboBox;
    procedure dsVidDataChange(Sender: TObject; Field: TField);
    procedure dsSortDataChange(Sender: TObject; Field: TField);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ID_Gryad: integer;
    ID_Sect: integer;
    ID_Sort: integer;
    Gen: Integer;
    RasShop: Boolean;
  end;

var
  fPosad: TfPosad;

implementation

uses DMPlnts;

{$R *.dfm}

procedure TfPosad.dsVidDataChange(Sender: TObject; Field: TField);
begin
  if Visible and (Field = nil) then
    OpenQr('Select * from [sort] where item_id=' + IntToStr(DM.qVid['id']) + ' order by Title', DM.qSort);
end;

procedure TfPosad.dsSortDataChange(Sender: TObject; Field: TField);
var S: string;
begin
  if Field = nil then begin
    if DM.qSort['image'] <> null then
      s := MyPath + DM.qSort['image']
    else
      S := MyPath + 'foto/Noimage.jpg';
    Image3.Picture.LoadFromFile(S);
    Edit1.Text := '';
    Memo1.Text := '';
    Combobox1.Items.Clear;
    if (ID_GryaD > 0) and
      OpenQr('Select * from Rassada where Sort_ID=' + IntTostr(DM.qSort['ID']) +
      ' and Year=' + IntToStr(CurOperYear), DM.q2Time) then
      while not DM.q2Time.Eof do begin
        s := 'Рассада ' + IntToStr(DM.q2Time['Shtuk']) + ' штук. ' + FormatDateTime('yyyy.mm.dd', DM.q2Time['PlantDate']);
        Combobox1.Items.AddObject(S, T2IntObj.Create(0, DM.q2Time['ID']));
        DM.q2Time.Next;
      end;
    if not RasShop and OpenQr('Select * from Seeds where  Sort_ID=' + IntTostr(DM.qSort['ID']) +
      ' and  (Shtuk>0 or Gram>0)', DM.q2Time) then
      while not DM.q2Time.Eof do begin
        s := 'Семена ';
        if DM.q2Time['Shtuk'] > 0 then
          s := s + intToStr(DM.q2Time['Shtuk']) + ' штук. '
        else
          s := s + FormatFloat('####0.#',DM.q2Time['Gram']) + ' грамм. ';
        s := s + DM.q2Time['Firm'] + '. до ' + IntToStr(DM.q2Time['YearTo']);
        Combobox1.Items.AddObject(S, T2IntObj.Create(DM.q2Time['ID'], 0));
        DM.q2Time.Next;
      end;
    if Combobox1.Items.Count > 0 then
      Combobox1.ItemIndex := 0;
  end;
end;

procedure TfPosad.Label1Click(Sender: TObject);
begin
  DM.CurCatID := 2;
  Label1.Font.Style := [fsBold];
  Label2.Font.Style := [];
  OpenQr('Select * from [item] where Category_ID=2', DM.qVid);
  Label9.Visible := True;
  Label10.Visible := False;
  DBEdit3.DataField := 'Sozr';
  Label14.Visible := True;
  Label15.Visible := False;
  DBEdit6.DataField := 'Urog';
end;

procedure TfPosad.Label2Click(Sender: TObject);
begin
  DM.CurCatID := 1;
  Label2.Font.Style := [fsBold];
  Label1.Font.Style := [];
  OpenQr('Select * from [item] where Category_ID=1', DM.qVid);
  Label9.Visible := False;
  Label10.Visible := True;
  DBEdit3.DataField := 'Cvet';
  Label14.Visible := False;
  Label15.Visible := True;
  DBEdit6.DataField := 'Color';
end;

procedure TfPosad.Button2Click(Sender: TObject);
var y, s, RSID, SeedID: integer;
  R: string;
  D: TDate;
begin
  if Edit1.Text <> '' then begin
    if RasShop then
      SeedID := 0
    else begin
      if Combobox1.ItemIndex < 0 then begin
        ShowMessage('Не задан источник (семена или рассада)');
        Exit;
      end else begin
        RsId := T2IntObj(Combobox1.Items.Objects[Combobox1.ItemIndex]).Val2;
        SeedID := T2IntObj(Combobox1.Items.Objects[Combobox1.ItemIndex]).Val;
      end;
    end;
    if SeedID > 0 then
      OpenQr('Select * from Seeds where id=' + IntToStr(SeedID), DM.qLongTime);
    if ID_Gryad > 0 then begin

      {if OpenQr('Select * from Rassada where Sort_ID=' + IntTostr(DM.qSort['ID']) +
        ' and Year=' + IntToStr(CurOperYear), DM.q2Time) and
        (MessageDlg('Сажаем имеющуюся рассаду?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
        RSID := DM.q2Time['Id']; }
      if RSID > 0 then begin
        R := InputBox('Посадка рассады', 'Введите оценку качества рассады (0-10)', '5');
        try
          StrToInt(Trim(R));
        except
          ShowMessage('Оценка должна быть числом. Снова нажмите "Посадить" и введите корректную оценку');
          Exit;
        end;
        ExecQr('Update Rassada set Result=' + R + ' where ID=' + IntToStr(RSID), DM.q2Time);
      end;

      y := YearOf(DateTimePicker1.DateTime);
      OpenQr('Select * from results where id<0', DM.q1Time);
      DM.q1Time.Insert;
      DM.q1Time['Year'] := CurOperYear;
      DM.q1Time['Sht'] := Edit1.Text;
      try
        S := StrToInt(FindNumStr(Edit1.Text, 1));
      except
        s := 1;
      end;
      DM.q1Time['Rass_Id'] := RSID;
      DM.q1Time['Seed_Id'] := SeedID;
      DM.q1Time['Shtuk'] := S;
      ID_Sort := DM.qSort['ID'];
      DM.q1Time['sort_id'] := ID_Sort;
      if DM.qSort['Letn'] = 3 then
        DM.q1Time['MnLetn'] := 1
      else
        DM.q1Time['MnLetn'] := 0;
      DM.q1Time['Generation'] := Round(NumInp1.Value);
      DM.q1Time['gryad_id'] := ID_Gryad;
      DM.q1Time['Sect_id'] := ID_Sect;
      D := Trunc(DateTimePicker1.DateTime);
      DM.q1Time['plantdate'] := D;
      DM.q1Time['StComment'] := Memo1.Text;
      DM.q1Time.Post;
      ModalResult := mrOK;
    end else begin
      try
        S := StrToInt(FindNumStr(Edit1.Text, 1));
      except
        ShowMessage('Неверно задано количество');
        Exit;
      end;
      y := YearOf(DateTimePicker1.DateTime);
      OpenQr('Select * from Rassada where id<0', DM.q1Time);
      DM.q1Time.Insert;
      DM.q1Time['Year'] := CurOperYear;
      DM.q1Time['Shtuk'] := S;
      ID_Sort := DM.qSort['ID'];
      DM.q1Time['Seed_Id'] := SeedID;
      DM.q1Time['sort_id'] := ID_Sort;
      D := Round(DateTimePicker1.DateTime);
      if RasShop then begin
        DM.q1Time['Shopdate'] := D;
        DM.q1Time['Source'] := Edit2.Text;
      end else begin
        DM.q1Time['plantdate'] := D;
        DM.q1Time['Source'] := DM.qLongTime['Firm'] + '. до ' + IntToStr(DM.qLongTime['YearTo']);
      end;
      DM.q1Time['Comment'] := Memo1.Text;
      DM.q1Time.Post;

    end;
    if SeedID > 0 then begin
      DM.qLongTime.Edit;
      if DM.qLongTime['Shtuk'] > 0 then begin
        s := DM.qLongTime['Shtuk'] - StrToInt(FindNumStr(Edit1.Text, 1));
        if s < 0 then
          s := 0;
        DM.qLongTime['Shtuk'] := s;
      end else begin
        s := DM.qLongTime['Gram'] - StrToInt(FindNumStr(Edit1.Text, 1));
        if s < 0 then
          s := 0;
        DM.qLongTime['Gram'] := s;
      end;
      DM.qLongTime.Post;
    end;
    Close;
  end else
    ShowMessage('Не задан объем посадки');
end;

procedure TfPosad.FormCreate(Sender: TObject);
begin
  DateTimePicker1.DateTime := Now;
  Image1.Picture.Bitmap.Width := Image1.Width;
  Image1.Picture.Bitmap.Height := Image1.Height;
end;

procedure TfPosad.Button1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfPosad.FormShow(Sender: TObject);
begin
 dsSort.DataSet:= DM.qSort;
  if ID_Gryad > 0 then begin
    NumInp1.Value := Gen;
    NumInp1.Visible := True;
    Label19.Visible := True;
    Edit2.Visible := False;
   // Image1.BringToFront;
    IMage1.Visible := True;
    Label12.Caption := 'Дата посадки';
    Label20.Visible := False;
    Label21.Visible := False;
  end else begin
    NumInp1.Visible := False;
    Label19.Visible := False;
    //Image1.SendToBack;
    Image1.Visible := False;
    Label20.Visible := True;
    Edit2.Text := '';
    if RasShop then begin
      Label12.Caption := 'Дата покупки';
      Label21.Visible := True;
      Edit2.Visible := True;
      ComboBox1.Visible := False;
      Label22.Visible := False;
    end else begin
      Label12.Caption := 'Дата посадки';
      Edit2.Visible := False;
      Label21.Visible := False;
      ComboBox1.Visible := True;
      Label22.Visible := True;
    end;
  end;
end;

procedure TfPosad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      dsSort.DataSet:= nil;
end;

end.

