
{******************************************}
{                                          }
{             FastReport v3.0              }
{            PDF export filter             }
{                                          }
{         Copyright (c) 1998-2005          }
{          by Alexander Fediachov,         }
{             Fast Reports Inc.            }
{                                          }
{******************************************}

unit frxExportPDF;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComObj, Printers, frxClass, JPEG, ShellAPI,
  frxExportMatrix, frxProgress, ComCtrls, frxPDFFile
{$IFDEF Delphi6}, Variants {$ENDIF};

type
  TfrxPDFExportDialog = class(TForm)
    OkB: TButton;
    CancelB: TButton;
    GroupPageRange: TGroupBox;
    DescrL: TLabel;
    AllRB: TRadioButton;
    CurPageRB: TRadioButton;
    PageNumbersRB: TRadioButton;
    PageNumbersE: TEdit;
    GroupQuality: TGroupBox;
    CompressedCB: TCheckBox;
    OpenCB: TCheckBox;
    SaveDialog1: TSaveDialog;
    EmbeddedCB: TCheckBox;
    PrintOptCB: TCheckBox;
    OutlineCB: TCheckBox;
    BackgrCB: TCheckBox;
    procedure FormCreate(Sender: TObject);
  end;

  TfrxPDFExport = class(TfrxCustomExportFilter)
  private
    FCompressed: Boolean;
    FEmbedded: Boolean;
    FOpenAfterExport: Boolean;
    FPDF: TfrxPDFFile;
    FPDFpage: TfrxPDFPage;
    FPrintOpt: Boolean;
    FOutline: Boolean;
    FSubject: String;
    FAuthor: String;
    FBackground: Boolean;
    FCreator: String;
    FTags: Boolean;
    FExportNotPrintable: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    class function GetDescription: String; override;
    function ShowModal: TModalResult; override;
    function Start: Boolean; override;
    procedure ExportObject(Obj: TfrxComponent); override;
    procedure Finish; override;
    procedure StartPage(Page: TfrxReportPage; Index: Integer); override;
  published
    property Compressed: Boolean read FCompressed write FCompressed default True;
    property EmbeddedFonts: Boolean read FEmbedded write FEmbedded default False;
    property OpenAfterExport: Boolean read FOpenAfterExport
      write FOpenAfterExport default False;
    property PrintOptimized: Boolean read FPrintOpt write FPrintOpt;
    property Outline: Boolean read FOutline write FOutline;
    property Author: String read FAuthor write FAuthor;
    property Subject: String read FSubject write FSubject;
    property Background: Boolean read FBackground write FBackground;
    property Creator: String read FCreator write FCreator;
    property HTMLTags: Boolean read FTags write FTags;
    property ExportNotPrintable: Boolean read FExportNotPrintable write FExportNotPrintable;
  end;

implementation

uses frxUtils, frxRes, frxrcExports;

{$R *.dfm}

{ TfrxPDFExport }

constructor TfrxPDFExport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCompressed := True;
  FPrintOpt := False;
  FAuthor := 'FastReport'#174;
  FSubject := 'FastReport'#174' PDF export';
  FBackground := False;
  FCreator := 'FastReport'#174' (http://www.fast-report.com)';
  FTags := True;
  FExportNotPrintable := False;
end;

class function TfrxPDFExport.GetDescription: String;
begin
  Result := frxResources.Get('PDFexport');
end;

function TfrxPDFExport.ShowModal: TModalResult;
begin
  if not Assigned(Stream) then
  begin
    FOutline := Report.PreviewOptions.OutlineVisible;
    with TfrxPDFExportDialog.Create(nil) do
    begin
      OpenCB.Checked := FOpenAfterExport;
      CompressedCB.Checked := FCompressed;
      EmbeddedCB.Checked := FEmbedded;
      PrintOptCB.Checked := FPrintOpt;
      OutlineCB.Checked := FOutline;
      OutlineCB.Enabled := FOutline;
      BackgrCB.Checked := FBackground;
      Result := ShowModal;
      if Result = mrOk then
      begin
        PageNumbers := '';
        CurPage := False;
        if CurPageRB.Checked then
          CurPage := True
        else if PageNumbersRB.Checked then
          PageNumbers := PageNumbersE.Text;

        FOpenAfterExport := OpenCB.Checked;
        FCompressed := CompressedCB.Checked;
        FEmbedded := EmbeddedCB.Checked;
        FPrintOpt := PrintOptCB.Checked;
        FOutline := OutlineCB.Checked;
        FBackground := BackgrCB.Checked;

        if SaveDialog1.Execute then
          FileName := SaveDialog1.FileName
        else
          Result := mrCancel;
      end;
      Free;
    end;
  end else
    Result := mrOk;
end;

function TfrxPDFExport.Start: Boolean;
begin
  if (FileName <> '') or Assigned(Stream) then
  begin
    FPDF := TfrxPDFFile.Create;
    FPDF.Compressed := FCompressed;
    FPDF.EmbeddedFonts := FEmbedded;
    FPDF.PrintOptimized := FPrintOpt;
    FPDF.Outline := FOutline;
    FPDF.Background := FBackground;
    FPDF.Author := FAuthor;
    FPDF.Subject := FSubject;
    FPDF.Creator := FCreator;
    FPDF.HTMLTags := FTags;
    if FOutline then
      FPDF.PreviewOutline := Report.PreviewPages.Outline;
    Result := True
  end else
    Result := False;
end;

procedure TfrxPDFExport.StartPage(Page: TfrxReportPage; Index: Integer);
begin
  FPDFPage := FPDF.AddPage(Page);
end;

procedure TfrxPDFExport.ExportObject(Obj: TfrxComponent);
begin
  if (Obj is TfrxView) and (FExportNotPrintable or TfrxView(Obj).Printable) then
    FPDFPage.AddObject(TfrxView(Obj));
end;

procedure TfrxPDFExport.Finish;
var
  Exp: TStream;
begin
  try
    try
      if Assigned(Stream) then
        Exp := Stream
      else
        Exp := TFileStream.Create(FileName, fmCreate);
      try
        FPDF.Title := Report.ReportOptions.Name;
        FPDF.SaveToStream(Exp);
      finally
        if not Assigned(Stream) then
          Exp.Free;
        if FOpenAfterExport and (not Assigned(Stream)) then
          ShellExecute(GetDesktopWindow, 'open', PChar(FileName), nil, nil, SW_SHOW);
      end;
    except
      on e: Exception do
        if Report.EngineOptions.SilentMode then
          Report.Errors.Add(e.Message)
        else frxErrorMsg(e.Message);
    end;
  finally
    FPDF.Free;
  end;
end;

{ TfrxPDFExportDialog }

procedure TfrxPDFExportDialog.FormCreate(Sender: TObject);
begin
  frxResources.LocalizeForm(Self);
end;

end.
