unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, frxDesgn, frxClass, frxDCtrl,
  frxChart, frxRich, frxBarcode, ImgList, ComCtrls, ExtCtrls, frxOLE,
  frxCross, frxDMPExport, frxExportImage, frxExportRTF, frxExportTXT,
  frxExportXML, frxExportXLS, frxExportHTML, frxGZip, frxExportPDF,
  frxBDEComponents, frxChBox;

type
  TForm1 = class(TForm)
    DesignB: TButton;
    frxDesigner1: TfrxDesigner;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxRichObject1: TfrxRichObject;
    frxChartObject1: TfrxChartObject;
    frxDialogControls1: TfrxDialogControls;
    Tree: TTreeView;
    ImageList1: TImageList;
    PreviewB: TButton;
    DescriptionM: TMemo;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    frxOLEObject1: TfrxOLEObject;
    frxCrossObject1: TfrxCrossObject;
    frxBDEComponents1: TfrxBDEComponents;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxReport1: TfrxReport;
    frxGZipCompressor1: TfrxGZipCompressor;
    frxPDFExport1: TfrxPDFExport;
    Label4: TLabel;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    procedure DesignBClick(Sender: TObject);
    procedure TreeCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure PreviewBClick(Sender: TObject);
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    WPath: String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}


procedure TForm1.FormShow(Sender: TObject);
begin
  WPath := ExtractFilePath(Application.ExeName);
  Tree.Items[0].Item[0].Selected := True;
end;

procedure TForm1.DesignBClick(Sender: TObject);
begin
  frxReport1.DesignReport;
end;

procedure TForm1.PreviewBClick(Sender: TObject);
begin
  frxReport1.ShowReport;
end;

procedure TForm1.TreeCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Node.Count <> 0 then
    Tree.Canvas.Font.Style := [fsBold];
end;

procedure TForm1.TreeChange(Sender: TObject; Node: TTreeNode);
begin
  if Node.StateIndex = -1 then
  begin
    Tree.FullCollapse;
    Node[0].Selected := True;
  end
  else
  begin
    DesignB.Enabled := True;
    PreviewB.Enabled := True;
    frxReport1.LoadFromFile(WPath + IntToStr(Node.StateIndex) + '.fr3');
    DescriptionM.Lines := frxReport1.ReportOptions.Description;
  end;
end;

end.
