unit FormDLL;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, DBTables, DB, ppCtrls, ppClass, ppBands,
  ExtCtrls, Menus, ppStrtch, ppMemo, ppPrnabl, ppCache, ppComm, ppReport,
  ppDB, ppDBBDE, ppTypes, ppRichTx, ppProd, ppVar, ppDBPipe, ppRelatv;

type
  TfrmDLL = class(TForm)
    Shape4: TShape;
    Shape3: TShape;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Shape9: TShape;
    btnBioLifePrint: TButton;
    btnBioLifePrintPreview: TButton;
    dsBioLife: TDataSource;
    tblBioLife: TTable;
    memFormDLL: TMemo;
    ppBioLife: TppReport;
    ppBioLifeHeader: TppHeaderBand;
    ppBioLifeShape1: TppShape;
    ppBioLifeLabel1: TppLabel;
    ppBioLifeLabel2: TppLabel;
    ppBioLifeLabel3: TppLabel;
    ppBioLifeLabel4: TppLabel;
    ppBioLifeLabel5: TppLabel;
    ppBioLifeLabel6: TppLabel;
    ppBioLifeDetail: TppDetailBand;
    ppBioLifeShape4: TppShape;
    ppBioLifeShape5: TppShape;
    ppBioLifeShape6: TppShape;
    ppBioLifeShape3: TppShape;
    ppBioLifeShape2: TppShape;
    ppBioLifeDBText1: TppDBText;
    ppBioLifeDBImage1: TppDBImage;
    ppBioLifeDBText2: TppDBText;
    ppBioLifeDBText3: TppDBText;
    ppBioLifeFooter: TppFooterBand;
    ppBioLifeGroup1: TppGroup;
    ppBioLifeGroupHeader1: TppGroupHeaderBand;
    ppBioLifeGroupFooter1: TppGroupFooterBand;
    ppBioLifeShape7: TppShape;
    ppBioLifeLabel7: TppLabel;
    ppBioLifeDBCalc1: TppDBCalc;
    ppBioLifeLine1: TppLine;
    c: TImage;
    ppBDEPipeline1: TppBDEPipeline;
    ppBioLifeDBMemo1: TppDBMemo;
    ppBioLifeCalc1: TppSystemVariable;
    ppBioLifeCalc2: TppSystemVariable;
    procedure btnBioLifePrintClick(Sender: TObject);
    procedure btnBioLifePrintPreviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


  {Declare an export function - enables form to be used in a DLL }

{$IFDEF WIN32}
  function ShowForm: Bool; StdCall;
{$ELSE}
  function ShowForm: Bool; export;
{$ENDIF}


implementation

{$R *.DFM}

{------------------------------------------------------------------------}
{ShowForm - exported function for DLL example}

function ShowForm: Bool;
var
  Form1: TfrmDLL;

begin
  {create the form}
  Form1 := TfrmDLL.Create(nil);

  {must be modal for DLL calls (never modeless) }
  try
    Result := (Form1.ShowModal = mrOK);
  finally
    Form1.Free;
  end;
end;     


{------------------------------------------------------------------------}
{FormCreate }

procedure TfrmDLL.FormCreate(Sender: TObject);
begin
  {move memo field up}
  memFormDLL.Left := 8;
  memFormDLL.Top  := 32;
  Height := 150;
  tblBiolife.Active := False;

    {scale, if large fonts}
  if Screen.PixelsPerInch = 120 then
    begin
      Height := Trunc(Height * 1.25);
      Width  := Trunc(Width  * 1.25);
      memFormDLL.Left :=  Trunc(memFormDLL.Left  * 1.25);
      memFormDLL.Top  :=  Trunc(memFormDLL.Top   * 1.25);

    end;


end;

{------------------------------------------------------------------------}
{FormCloseQuery }

procedure TfrmDLL.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  {check whether report currently printing }
  if ppBioLife.Printing then

    begin
      {display message to user }
      MessageDlg('Unable to close form - ReportBuilder is currently printing.' ,mtInformation, [mbOK] ,0);

      {do not allow form to close }
      CanClose := False;

    end; {if, currently printing}

end;

{------------------------------------------------------------------------}
{btnBioLifePrintClick }

procedure TfrmDLL.btnBioLifePrintClick(Sender: TObject);
begin
  ppBioLife.Device := dvPrinter;
  ppBioLife.PrintReport;
end;

{------------------------------------------------------------------------}
{btnBioLifePrintPreviewClick }

procedure TfrmDLL.btnBioLifePrintPreviewClick(Sender: TObject);
begin
  ppBioLife.Device := dvScreen;
  ppBioLife.PrintReport;
end;

{------------------------------------------------------------------------}
{FormActivate - required for DLL example }

procedure TfrmDLL.FormActivate(Sender: TObject);
begin
  {initialize the BDE session }

{$IFDEF WIN32}
  Session.Active     := True;
{$ENDIF}

  tblBiolife.Active  := True;

end;

{------------------------------------------------------------------------}
{FormClose - required for DLL example }

procedure TfrmDLL.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   {shut down the BDE session }
   tblBiolife.Active  := False;

{$IFDEF WIN32}
   Session.Active     := False;
{$ELSE}
    Session.DropConnections;
{$ENDIF}

end;

end.
