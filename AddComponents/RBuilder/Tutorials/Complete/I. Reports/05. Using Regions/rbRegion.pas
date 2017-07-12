{******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rbRegion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ppDB, ppBands, ppClass, ppCtrls, ppMemo, ppStrtch, ppRegion,
  ppPrnabl, ppProd, ppReport, ppComm, ppCache, ppDBPipe, ppDBBDE, Db, DBTables, 
  rbClass, ppVar, ppRelatv;

type

  {Note: This form is setup to run as part of the main tutorial project.
         It descends from TrbReportForm which is defined in rbClass.pas.

         You will need to add rbClass.pas to any project that uses this form.
         The rbClass.pas unit is part of the main tutorial project. }

  TfrmRegions = class(TrbReportForm)
    tblBioLife: TTable;
    tblBioLifeSpeciesNo: TFloatField;
    tblBioLifeCategory: TStringField;
    tblBioLifeCommon_Name: TStringField;
    tblBioLifeSpeciesName: TStringField;
    tblBioLifeLengthcm: TFloatField;
    tblBioLifeLength_In: TFloatField;
    tblBioLifeNotes: TMemoField;
    tblBioLifeGraphic: TGraphicField;
    dsBioLife: TDataSource;
    plBiolife: TppBDEPipeline;
    rbRegions: TppReport;
    ppReport1HeaderBand1: TppHeaderBand;
    ppReport1ColumnHeaderBand1: TppColumnHeaderBand;
    ppReport1Detail: TppDetailBand;
    rgImageRegion: TppRegion;
    ppReport1DBText5: TppDBText;
    rgMemoRegion: TppRegion;
    dbmNotes: TppDBMemo;
    rgFields: TppRegion;
    ppReport1ColumnFooterBand1: TppColumnFooterBand;
    ppReport1FooterBand1: TppFooterBand;
    ppReport1Group1: TppGroup;
    ppReport1GroupHeaderBand1: TppGroupHeaderBand;
    ppReport1GroupFooterBand1: TppGroupFooterBand;
    ppDBImage2: TppDBImage;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    btnPreview: TButton;
    ppReport1Calc2: TppSystemVariable;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure rbRegionsDetailBeforeGenerate(Sender: TObject);
  protected
    function GetReport: TppReport; override;
  private
    FColors: TList;
  public
    { Public declarations }
  end;

var
  frmRegions: TfrmRegions;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TfrmRegions.GetReport }

function TfrmRegions.GetReport: TppReport;
begin
  Result := rbRegions;

end; {function, GetReport}

{------------------------------------------------------------------------------}
{ TfrmRegions.GetReport }

procedure TfrmRegions.FormCreate(Sender: TObject);
begin
  FColors := TList.Create;
  FColors.Add(TObject(clYellow));
  FColors.Add(TObject(clRed));
  FColors.Add(TObject(clLime));
  FColors.Add(TObject(clAqua));
  FColors.Add(TObject(clRed));
  FColors.Add(TObject(clSilver));
  FColors.Add(TObject(clYellow));
  FColors.Add(TObject(clRed));
  FColors.Add(TObject(clBlack));
  FColors.Add(TObject(clGreen));
  FColors.Add(TObject(clOlive));
  FColors.Add(TObject(clBlack));
  FColors.Add(TObject(clSilver));
  FColors.Add(TObject(clMaroon));
  FColors.Add(TObject(clSilver));
  FColors.Add(TObject(clAqua));
  FColors.Add(TObject(clRed));
  FColors.Add(TObject(clSilver));
  FColors.Add(TObject(clAqua));
  FColors.Add(TObject(clMaroon));
  FColors.Add(TObject(clBlack));
  FColors.Add(TObject(clBlue));
  FColors.Add(TObject(clYellow));
  FColors.Add(TObject(clRed));
  FColors.Add(TObject(clSilver));
  FColors.Add(TObject(clMaroon));
  FColors.Add(TObject(clYellow));
  FColors.Add(TObject(clSilver));

end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TfrmRegions.FormDestroy }

procedure TfrmRegions.FormDestroy(Sender: TObject);
begin
  FColors.Free;

end; {procedure, FormDestroy}

{------------------------------------------------------------------------------}
{ TfrmRegions.btnPreviewClick }

procedure TfrmRegions.btnPreviewClick(Sender: TObject);
begin
  rbRegions.Print;

end; {procedure, btnPreviewClick}


{------------------------------------------------------------------------------}
{ TfrmRegions.rbRegionsDetailBeforeGenerate }

procedure TfrmRegions.rbRegionsDetailBeforeGenerate(Sender: TObject);
var
  lColor: TColor;
begin

  if not(ppReport1Detail.OverFlow) then
    begin
      lColor := TColor(FColors[plBiolife.TraversalCount]);

      rgFields.Brush.Color := lColor;
      dbmNotes.Font.Color := lColor;
    end;
    
end; {procedure, rbRegionsDetailBeforeGenerate}

end.
