program Plants;

uses
  Forms,
  PlantsMain in 'PlantsMain.pas' {FPlantsMain},
  DMPlnts in 'DMPlnts.pas' {DM: TDataModule},
  Posad in 'Posad.pas' {fPosad},
  Agro in 'Agro.pas' {fAgro},
  img in 'img.pas' {fImg},
  EditPosad in 'EditPosad.pas' {fEditPosad},
  PutRes in 'PutRes.pas' {fPutRes},
  GryadHist in 'GryadHist.pas' {fGryadHistory},
  IHistory in 'IHistory.pas' {fIHistory},
  Gryad in 'Gryad.pas' {fGryad},
  Obr in 'Obr.pas' {fObr},
  HistGryad in 'HistGryad.pas' {fHistGryad},
  ImFlash in 'ImFlash.pas' {fIm},
  Seeds in 'Seeds.pas' {fSeeds},
  Res in 'Res.pas' {fRes},
  UBrowser in 'UBrowser.pas' {fBrowser},
  Gryadtmp in 'Gryadtmp.pas' {fGryadTmp},
  Svod in 'Svod.pas' {fSvod};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFPlantsMain, FPlantsMain);
  Application.CreateForm(TfPosad, fPosad);
  Application.CreateForm(TfAgro, fAgro);
  Application.CreateForm(TfImg, fImg);
  Application.CreateForm(TfEditPosad, fEditPosad);
  Application.CreateForm(TfPutRes, fPutRes);
  Application.CreateForm(TfGryadHistory, fGryadHistory);
  Application.CreateForm(TfIHistory, fIHistory);
  Application.CreateForm(TfGryad, fGryad);
  Application.CreateForm(TfObr, fObr);
  Application.CreateForm(TfHistGryad, fHistGryad);
  Application.CreateForm(TfIm, fIm);
  Application.CreateForm(TfSeeds, fSeeds);
  Application.CreateForm(TfRes, fRes);
  Application.CreateForm(TfBrowser, fBrowser);
  Application.CreateForm(TfGryadTmp, fGryadTmp);
  Application.CreateForm(TfSvod, fSvod);
  Application.Run;
end.

