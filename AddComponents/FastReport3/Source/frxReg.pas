{******************************************}
{ }
{ FastReport v3.0 }
{ Registration unit }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxReg;

{$I frx.inc}
{$I frxReg.inc}

interface

procedure Register;

implementation

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
{$IFNDEF Delphi6}
  DsgnIntf,
{$ELSE}
  DesignIntf, DesignEditors,
{$ENDIF}
  Dialogs, frxClass,
  frxDock, frxCtrls, frxDesgnCtrls,
  frxDesgn, frxPreview, frxChart, frxRich, frxOLE, frxBarCode,
  frxChBox, frxDMPExport,
{$IFNDEF FR_VER_BASIC}
  frxDCtrl,
{$ENDIF}
  frxCross, frxRichEdit, frxGradient,
  frxGZip,
  frxEditAliases;

{-----------------------------------------------------------------------}
type
  TfrxReportEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index:Integer); override;
    function GetVerb(Index:Integer):String; override;
    function GetVerbCount:Integer; override;
  end;

  TfrxDataSetEditor = class(TComponentEditor)
    procedure ExecuteVerb(Index:Integer); override;
    function GetVerb(Index:Integer):String; override;
    function GetVerbCount:Integer; override;
  end;

{ TfrxReportEditor }

procedure TfrxReportEditor.ExecuteVerb(Index:Integer);
begin
  TfrxReport(Component).DesignReport(Designer, Self);
  if not TfrxReport(Component).StoreInDFM then
    Designer.Modified;
end;

function TfrxReportEditor.GetVerb(Index:Integer):String;
begin
  Result:= 'Edit Report...';
end;

function TfrxReportEditor.GetVerbCount:Integer;
begin
  Result:= 1;
end;

{ TfrxDataSetEditor }

procedure TfrxDataSetEditor.ExecuteVerb(Index:Integer);
begin
  with TfrxAliasesEditorForm.Create(Application) do
  begin
    DataSet:= TfrxCustomDBDataSet(Component);
    if ShowModal = mrOk then
      Self.Designer.Modified;
    Free;
  end;
end;

function TfrxDataSetEditor.GetVerb(Index:Integer):String;
begin
  Result:= 'Edit Fields Aliases...';
end;

function TfrxDataSetEditor.GetVerbCount:Integer;
begin
  Result:= 1;
end;

{-----------------------------------------------------------------------}
procedure Register;
begin
  RegisterComponents('FastReport 3.0',
    [TfrxReport, TfrxUserDataset,
{$IFNDEF FR_VER_BASIC}
     TfrxDesigner,
{$ENDIF}
     TfrxPreview,
     TfrxBarcodeObject, TfrxOLEObject, TfrxChartObject, TfrxRichObject,
     TfrxCrossObject, TfrxCheckBoxObject, TfrxGradientObject,
     TfrxDotMatrixExport
{$IFNDEF FR_VER_BASIC}
   , TfrxDialogControls
{$ENDIF}
   , TfrxGZipCompressor
     ]);

  RegisterComponents('FR3 tools',
    [TfrxDock, TfrxToolBar, TfrxTBPanel, TfrxDockSite, TfrxComboEdit,
     TfrxComboBox, TfrxFontComboBox, TfrxRuler, TfrxScrollBox]);

  RegisterComponentEditor(TfrxReport, TfrxReportEditor);
  RegisterComponentEditor(TfrxCustomDBDataSet, TfrxDataSetEditor);
end;

end.
