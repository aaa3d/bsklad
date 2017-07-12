{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppRegPro;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Classes, Consts, DsgnIntf, Dialogs, Forms, TypInfo;

procedure Register;

implementation

{$IFDEF Delphi3}
{$R PPREGPRO.DCR}
{$ENDIF}

uses
  ppPropEd, ppClass, ppProd, ppClasUt, ppReport, ppBands, ppCtrls, ppTypes,
  ppUtils, ppPrintr, ppDB, ppDBPipe, ppDBBDE, ppRegion, ppStrtch, ppViewr, ppMemo,
  ppSubRpt, ppTmplat, ppTmDlg, ppTxPipe, ppArchiv, ppBarCod, ppDBJIT,
  ppDsIntf, ppDsgner, ppFldEd, ppEndUsr, ppVar, ppRptExp, ppDsgnDB,
  ppCTMain, ppCTDlg, ppRichTx;

procedure Register;
begin

  {components which appear on Delphi's component palette}
  RegisterComponents('RBuilder', [TppDBPipeline, TppBDEPipeline, TppTextPipeline, TppJITPipeline,
                                  TppReport, TppViewer, TppArchiveReader,
                                  TppDesigner, TppReportExplorer, TppDataDictionary]);


  {sub-components which are used to define Reports }
  RegisterNoIcon([TppChildReport, TppTitleBand, TppHeaderBand, TppDetailBand, TppFooterBand, TppSummaryBand,
                  TppGroup, TppGroupHeaderBand, TppGroupFooterBand,
                  TppColumnHeaderBand, TppColumnFooterBand, TppPageStyle,
                  TppDBText, TppDBMemo, TppDBCalc, TppDBImage, TppDBBarCode,
                  TppLabel, TppMemo, TppCalc, TppVariable, TppSystemVariable,
                  TppImage, TppShape, TppLine,
                  TppBarCode, TppRegion, TppSubReport,
                  TppRichText, TppDBRichText,
                  TppField, TppMasterFieldLink, TppAutoSearchField]);


  {crosstab-components }
  RegisterNoIcon([TppCrossTab, TppColumnDef, TppRowDef, TppValueDef, TppGrandTotal, TppSubTotal,
                  TppTotalDef, TppTotalCaptionDef, TppValueCaptionDef]);

  {component editors - report designer, fields editor }
  RegisterComponentEditor(TppReport,       TppReportComponentEditor);
  RegisterComponentEditor(TppTextPipeline, TppDataPipelineComponentEditor);
  RegisterComponentEditor(TppJITPipeline,  TppDataPipelineComponentEditor);
  RegisterComponentEditor(TppDBPipeline,   TppDataPipelineComponentEditor);
  RegisterComponentEditor(TppBDEPipeline,  TppDataPipelineComponentEditor);

  {component designers - report designer, fields editor }
  ppRegisterComponentDesigner(TppDesignerWindow, TppReport);
  ppRegisterComponentDesigner(TppFieldEditor, TppJITPipeline);
  ppRegisterComponentDesigner(TppFieldEditor, TppTextPipeline);
  ppRegisterComponentDesigner(TppFieldEditor, TppDBPipeline);
  ppRegisterComponentDesigner(TppFieldEditor, TppBDEPipeline);

  {component editors - data dictionary builder }
  RegisterComponentEditor(TppDataDictionary, TppDataDictionaryComponentEditor);


  {property editors }
  RegisterPropertyEditor(TypeInfo(String),         TppComponent,          'DataField',          TppDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppGroup,              'BreakName',          TppBreakNameProperty);
  RegisterPropertyEditor(TypeInfo(TppStretchable), TppComponent,          'ShiftRelativeTo',    TppShiftRelativeToProperty);
  RegisterPropertyEditor(TypeInfo(TppStretchable), TppComponent,          'StretchRelativeTo',  TppShiftRelativeToProperty);
  RegisterPropertyEditor(TypeInfo(TppComponent),   TppSubReport,          'DrillDownComponent', TppDrillDownComponentProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppComponent,          'Caption',            TCaptionProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppPrinterSetup,       'PrinterName',        TppPrinterNameProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppPrinterSetup,       'BinName',            TppBinNameProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppPrinterSetup,       'PaperName',          TppPaperNameProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppTemplateDBSettings, 'NameField',          TppDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppTemplateDBSettings, 'TemplateField',      TppDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppArchiveReader,      'ArchiveFileName',    TppArchiveFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppReport,             'ArchiveFileName',    TppArchiveFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppTextPipeline,       'FileName',           TppTextFileNameProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppReport,             'TextFileName',       TppTextFileNameProperty);
  RegisterPropertyEditor(TypeInfo(TppProducer),    TppViewer,             'Report',             TppViewerReportProperty);
  RegisterPropertyEditor(TypeInfo(TppChildReport), TppSubReport,          'Report',             TClassProperty);
  RegisterPropertyEditor(TypeInfo(TStrings),       TppTextPipeline,       'MasterFieldLinks',   TppMasterFieldLinksProperty);
  RegisterPropertyEditor(TypeInfo(TStrings),       TppJITPipeline,        'MasterFieldLinks',   TppMasterFieldLinksProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppReport,             'DeviceType',         TppDeviceTypeProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppDBImage,            'GraphicType',        TppGraphicTypeProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppFolderFieldNames,   '',                   TppDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppItemFieldNames,     '',                   TppDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppTableFieldNames,    '',                   TppDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppFieldFieldNames,    '',                   TppDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppJoinFieldNames,     '',                   TppDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppRichText,           'RichText',           TppRichTextProperty);
  RegisterPropertyEditor(TypeInfo(String),         TppCrossTab,           'Style',              TppCrossTabStyleProperty);

end; {procedure, Register}


end.
