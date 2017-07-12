{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppTypes;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, Classes, Graphics, Mask, SysUtils, TypInfo, Dialogs, Forms;

const

{******************************************************************************
 *
 ** V E R S I O N   C O N T R O L   C O N S T A N T S
 *
{******************************************************************************}

{$IFDEF Enterprise}
  ppEdition  = 'Enterprise';
{$ENDIF}

{$IFDEF Professional}
  ppEdition  = 'Professional';
{$ENDIF}

{$IFDEF Standard}
  ppEdition  = 'Standard';
{$ENDIF}

  ppVersion  = '5.0';
  VersionNoMaxLength = 20;

{$IFDEF Demo}
  IsDemoCopy = True;   {used by the demo application}
  DemoPages = 5;
{$ELSE}
  IsDemoCopy = False;
{$ENDIF}

  cUntitled = 'Untitled';
  cNone     = '<None>';

  {conversions}
  InchPerMM = 0.03937;

  {unique ID for internal window messages }
  ppWCustomMsg = 5050;

  ppQuarterInchInMM = 6350;
  ppHalfInchInMM = 12700;
  ppLetterPaperWidthInMM = 215900;
  ppLetterPaperHeightInMM = 279401;
  ppA4PaperWidthInMM = 210000;
  ppA4PaperHeightInMM = 297000;

  chEnterKey = #13;

  {simulated enumerated types for DeviceType property}
  dtArchive = 'ArchiveFile';
  dtPrinter = 'Printer';
  dtFile = 'TextFile';
  dtTextFile = 'TextFile';
  dtReportTextFile = 'ReportTextFile';
  dtScreen  = 'Screen';

  {strings base number}
  ciBaseNumber = 43000;

  varNumerics = [varSmallint, varInteger, varSingle, varDouble, varCurrency, varDate];
  
{******************************************************************************
 *
 ** M E S S A G E   C O N S T A N T S
 *
{******************************************************************************}

  {custom messages  }
  PM_COMPONENTNAMECHANGE = WM_USER + 100;  {enables ppComponent to notify ppDesignerWindow}
  PM_BANDHEIGHTCHANGE    = WM_USER + 101;  {enables ppBands to notify ppDesignerWindow}
  PM_REPORTDESTROY       = WM_USER + 102;  {enables ppReport to notify ppDesignerWindow}
  PM_CALCWORKSPACEWIDTH  = WM_USER + 103;  {enables ppReport to notify ppDesignerWindow}
  PM_COMPONENTDESTROY    = WM_USER + 104;  {enables ppReport to notify ppDesignerWindow}
  PM_UNITSCHANGE         = WM_USER + 105;  {enables ppReport to notify ppDesignerWindow}
  PM_GROUPMENUCLICK      = WM_USER + 106;  {enables ppGroupBand to notify ppDesignerWindow}
  PM_COMPONENTCHANGE     = WM_USER + 107;  {enables ppReport, ppBands, ppComponent to notify ppDesignerWindow}
  PM_COMPONENTDATAPIPELINECHANGE = WM_USER + 108;  {enables ppComponent to notify ppDesignerWindow}
  PM_SETREPORT           = WM_USER + 109;  {enables ppReport to notify ppDesignerWindow}
  PM_SETLANGUAGE         = WM_USER + 110;  {enables ppReport to notify ppDesignerWindow}
  PM_GETDISPLAYFORMATS   = WM_USER + 111;  {enables ppComponent to notify ppDesignerWindow}
  PM_INSTANTIATECOMPONENTDC = WM_USER + 112;  {enables ppComponent to notify ppDesignerWindow}
  PM_INSTANTIATEBANDDC   = WM_USER + 113;  {enables ppBand to notify ppDesignerWindow}
  PM_BANDADDED           = WM_USER + 114;  {enables ppReport to notify ppDesignerWindow}
  PM_BANDREMOVED         = WM_USER + 115;  {enables ppReport to notify ppDesignerWindow}
  PM_BANDDESTROY         = WM_USER + 116;  {enables ppBand to notify ppDesignerWindow}
  PM_REPORTPRINTING      = WM_USER + 117;  {enables ppReport to notify ppDesignerWindow}

  PM_ADDREPORT           = WM_USER + 118;  {enables ppReport to notify ppDesignerWindow}
  PM_REMOVEREPORT        = WM_USER + 119;  {enables ppReport to notify ppDesignerWindow}
  PM_BOUNDSLOCKCHANGE    = WM_USER + 120;  {enables ppComponent to notify ppDesignerWindow}
  PM_CAPTIONCHANGE       = WM_USER + 121;  {enables ppComponent to notify ppDesignerWindow}
  PM_REPORTLOADSTART     = WM_USER + 122;  {enables ppReport to notify ppDesignerWindow}
  PM_REPORTLOADEND       = WM_USER + 123;  {enables ppReport to notify ppDesignerWindow}
  PM_REPORTUPDATEBEGIN   = WM_USER + 124;  {enables ppReport to notify ppDesignerWindow}
  PM_REPORTUPDATEEND     = WM_USER + 125;  {enables ppReport to notify ppDesignerWindow}
  PM_PRINTERCHANGE       = WM_USER + 126;  {enable  ppReport to notify ppDesignerWindow}
  PM_COMPONENTADDED      = WM_USER + 127;  {enable  ppReport to notify ppDesignerWindow}
  PM_COMPONENTREMOVED    = WM_USER + 128;  {enable  ppReport to notify ppDesignerWindow}
  PM_COMPONENTUPDATED    = WM_USER + 129;  {enable  ppReport to notify ppDesignerWindow}

{******************************************************************************
 *
 ** E V E N T   C O N S T A N T S
 *
{******************************************************************************}

  ciProducerAfterPrint = 0;
  ciProducerBeforePrint = 1;
  ciProducerCancel = 2;
  ciProducerCancelDialogCreate = 3;
  ciProducerCancelDialogClose = 4;
  ciProducerPreviewFormCreate = 5;
  ciProducerPreviewFormClose = 6;
  ciProducerPrintDialogCreate = 7;
  ciProducerPrintDialogClose = 8;
  ciProducerSaveText = 9;
  ciReportAutoSearchDialogCreate = 10;
  ciReportAutoSearchDialogClose = 11;
  ciReportGetAutoSearchValues = 12;
  ciEngineStart = 13;
  ciEngineEnd = 14;
  ciEngineEndColumn = 15;
  ciEngineEndFirstPass = 16;
  ciEngineEndPage = 17;
  ciEngineEndSecondPass = 18;
  ciEngineStartColumn = 19;
  ciEngineStartFirstPass = 20;
  ciEngineStartPage = 21;
  ciEngineStartSecondPass = 22;
  ciBandAfterPrint = 23;
  ciBandBeforePrint = 24;
  ciBandAfterGenerate = 25;
  ciBandBeforeGenerate = 26;
  ciGroupAfterGroupBreak = 27;
  ciGroupBeforeGroupBreak = 28;
  ciGroupBeforeHeader = 29;
  ciGroupBeforeFooter = 30;
  ciGroupGetBreakValue = 31;
  ciComponentPrint = 32;
  ciComponentCalc = 33;
  ciComponentReset = 34;
  ciTraversal = 35;
  ciPipelineActiveChange = 36;
  ciPipelineRecordPositionChange = 37;
  ciPipelineMasterRecordPositionChange = 38;
  ciPipelineTraversal = 39;
  ciPipelineGotoBookmark = 40;
  ciPipelineDataChange = 41;
  ciPipelineFirst = 42;
  ciPipelineNext = 43;
  ciPipelinePrior = 44;
  ciPipelineLast = 45;
  ciPipelineOpen = 46;
  ciPipelineClose = 47;
  ciCacheableSwitchCache = 48;
  ciCacheableRaiseException = 49;
  ciCacheableFreeCache = 50;
  ciBeforeGenerateSQL = 51;
  ciAfterGenerateSQL = 52;
  ciComponentGetText = 53;
  ciCrossTabCalcDimensionValue = 54;
  ciCrossTabFormatCell = 55;
  ciCrossTabGetCaptionText = 56;
  ciCrossTabGetDimensionName = 57;
  ciCrossTabGetDimensionCaption = 58;
  ciCrossTabGetDimensionValue = 59;
  ciCrossTabGetTotalCaptionText = 60;
  ciCrossTabGetTotalValueText = 61;
  ciCrossTabGetValueText = 62;
  ciCrossTabTraverseRecord = 63;
  ciCrossTabBeforeCalc = 64;
  ciCrossTabAfterCalc = 65;
  ciReportCreateAutoSearchCriteria = 66;
  ciComponentCalcLookAhead = 67;
  ciGroupBreak = 68;
  ciComponentGetPicture = 69;
  ciProducerCreate = 70;
  ciProducerDestroy = 71;


{******************************************************************************
 *
 ** L A N G U A G E   C O N S T A N T S
 *
{******************************************************************************}

  ppMsgOK = 17;
  ppMsgCancel = 5;

  {legacy constants no longer used - retained for backward compatibility}
  ppMsg100Percent             = 1;
  ppMsgAccessingData          = 2;
  ppMsgAll                    = 3;
  ppMsgArchiveFile            = 34;
  ppMsgAutoSize               = 226;
  ppMsgAutoSizeFont           = 441;
  ppMsgBlankWhenZero          = 227;
  ppMsgBottomOffset           = 397;
  ppMsgBottom                 = 325;
  ppMsgCalculating            = 4;
  ppMsgCalculations           = 228;
  ppMsgCalcOrder              = 693;
  ppMsgCenter                 = 229;
  ppMsgCharWrap               = 157;
  ppMsgChild                  = 380;
  ppMsgClose                  = 6;
  ppMsgConfigure              = 443;
  ppMsgCopies                 = 7;
  ppMsgCurrent                = 8;
  ppMsgCurrentPage            = 9;
  ppMsgDirectDraw             = 681;
  ppMsgDisplayFormat          = 230;
  ppMsgDouble                 = 231;
  ppMsgDrawing                = 10;
  ppMsgDrillDown              = 498;
  ppMsgDynamicHeight          = 232;
  ppMsgEnterPage              = 11;
  ppMsgErrorLoadingMemo       = 399;
  ppMsgExpandAll              = 643;
  ppMsgFirst                  = 13;
  ppMsgFixed                  = 382;
  ppMsgGroups                 = 146;
  ppMsgHide                   = 225;
  ppMsgHeight                 = 184;
  ppMsgIgnore                 = 416;
  ppMsgIgnoreAll              = 417;
  ppMsgLast                   = 14;
  ppMsgLeft                   = 181;
  ppMsgLines                  = 233;
  ppMsgLineTypes              = 117;
  ppMsgMaintainAspectRatio    = 412;
  ppMsgNext                   = 15;
  ppMsgNewPage                = 234;
  ppMsgNewPrintJob            = 373;
  ppMsgObject                 = 269;
  ppMsgObjects                = 270;
  ppMsgObjectLeft             = 181;
  ppMsgObjectTop              = 182;
  ppMsgObjectWidth            = 183;
  ppMsgObjectHeight           = 184;
  ppMsgOf                     = 16;
  ppMsgOpen                   = 361;
  ppMsgOverFlowOffset         = 419;
  ppMsgPage                   = 18;
  ppMsgPageRange              = 19;
  ppMsgPages                  = 20;
  ppMsgPageWidth              = 31;
  ppMsgParentHeight           = 370;
  ppMsgParentWidth            = 371;
  ppMsgParentPrinterSetup     = 413;
  ppMsgPicture                = 235;
  ppMsgPosition               = 386;
  ppMsgPrint                  = 22;
  ppMsgPrintHumanReadable     = 442;
  ppMsgPrinting               = 24;
  ppMsgPrinter                = 25;
  ppMsgPrintToFile            = 26;
  ppMsgPrintingNoPC           = 27;
  ppMsgPrintingPages          = 28;
  ppMsgPrintOnFirstPage       = 236;
  ppMsgPrintOnLastPage        = 237;
  ppMsgPrintPreview           = 23;
  ppMsgPrior                  = 29;
  ppMsgReady                  = 180;
  ppMsgReprintOnOverFlow      = 238;
  ppMsgReprintOnSubsequent    = 239;
  ppMsgResetPageNo            = 410;
  ppMsgRight                  = 327;
  ppMsgSearchData             = 1021;
  ppMsgSection                = 381;
  ppMsgSetValue               = 119;
  ppMsgShapeTypes             = 118;
  ppMsgShiftRelativeTo        = 336;
  ppMsgShiftWithParent        = 240;
  ppMsgSingle                 = 241;
  ppMsgStaticHeight           = 242;
  ppMsgStopPosition           = 507;
  ppMsgStretch                = 243;
  ppMsgStretchWithParent      = 244;
  ppMsgSuppressRepeatedValues = 245;
  ppMsgTextFile               = 37;
  ppMsgTop                    = 324;
  ppMsgTransparent            = 246;
  ppMsgTraverseAllData        = 644;
  ppMsgUndelete               = 129;
  ppMsgUndo                   = 130;
  ppMsgVisible                = 247;
  ppMsgWhole                  = 30;
  ppMsgWidth                  = 183;
  ppMsgWordWrap               = 248;

type

{******************************************************************************
 *
 ** E N U M E R A T E D   T Y P E S
 *
{******************************************************************************}

  TppFontAttributeType = (faFontName, faFontSize);

  TppColorButtonType = (ctFont, ctLine, ctFill, ctHighlight);

  TppColorPaletteType = (ptFont, ptLine, ptFill, ptHighlight, ptCustom);

  TppAlignType = (asAlignLeftEdges, asAlignVerticalCenters, asAlignRightEdges,
                  asAlignTopEdges, asAlignHorizontalCenters, asAlignBottomEdges,
                  asSpaceHorizontally,   asSpaceVertically,
                  asCenterHorizontally,  asCenterVertically);

  TppSizeType = (asShrinkWidth, asGrowWidth, asShrinkHeight, asGrowHeight);

  TppNudgeType = (nuNudgeUp, nuNudgeDown, nuNudgeLeft, nuNudgeRight);


  TppBandType = (btHeader,  btTitle, btColumnHeader, btGroupHeader, btDetail,
                 btGroupFooter, btColumnFooter, btSummary, btFooter, btPageStyle);

  TppBarCodeType = (bcUPC_A, bcUPC_E, bcEAN_13, bcEAN_8, bcInt2of5, bcCode128, bcCode39, bcPostnet, bcFIM, bcCodabar);

  TppBarCodeOrientation = (orLeftToRight, orRightToLeft, orTopToBottom, orBottomToTop);

  TppBreakType = (btDataField, btCustomField);

  TppCacheType = (ppctMemory, ppctFile);

  TppCacheActionType = (ppcaCreate, ppcaWrite, ppcaRead, ppcaDump, ppcaFree, ppcaSetCacheStream, ppcaSetCacheCount);

  {retained for backward compatiblity, use TppVarType}
  TppCalcType = (ctDate, ctDateTime, ctPrintDateTime, ctPageCount, ctPageSet,
                 ctPageSetDesc, ctPageNo, ctPageNoDesc, ctTime, ctCustom);

  TppDatabaseType = (dtAdvantage, dtInterBase, dtMSAccess, dtMSSQLServer,
                     dtSybaseASE, dtSybaseASA, dtOracle, dtParadox, dtDBISAM, dtOther);

  TppDataPipelineStateType = (ppdaFirstRecord, ppdaLastRecord, ppdaNoRecords);

  TppDataType = (dtBoolean, dtDate, dtTime, dtDateTime, dtInteger, dtSingle,
                 dtDouble, dtExtended, dtCurrency, dtChar, dtString, dtVariant,
                 dtLongint, dtBLOB, dtMemo, dtGraphic, dtNotKnown);

  TppDataEditType = (ppemAll, ppemTables, ppemFields, ppemCalcs, ppemGroup, ppemSearch, ppemSort, ppemText, ppemPreview);

  TppDBCalcType = (dcCount, dcSum, dcMinimum, dcMaximum, dcAverage);

  TppDesignerStateType  = (dsModal, dsUndelete, dsBeginDrag, dsDraggingControl, dsDraggingBand,
                      dsBounding, dsAdditiveBounding, dsSizingControl, dsDeleting,
                      dsUndeleting, dsSelectionChanged, dsDestroying, dsPreviewing,
                      dsOutline, dsPrinting, dsSettingReport, dsUpdating, dsRestoringReportState, dsSavingReportState);

  TppDesignStateType = (pppcDesigning, pppcDesignPreviewing, pppcDesignPrinting,
                        pppcDisplayData, pppcCopying, pppcPasting, pppcLoading,
                        pppcTemplateLoading, pppcTemplateSaving, pppcUpdating, pppcCreating,
                        pppcEmpty);

  TppDeviceType = (dvPrinter, dvScreen, dvFile, dvArchive);
  
  TppDeviceActionType = (ppdvCancelJob, ppdvEndJob, ppdvGetPageRequest, ppdvReceivePage, ppdvStartJob, ppdvReset);

  TppDialogType = (ppdtOpen, ppdtSave);

  TppDuplexType = (dpNone, dpHorizontal, dpVertical);

  TppEngineStateType = (esInitialized, esFirstPass, esSecondPass, esNoData,
                        esPrintingTitle, esPrintingSummary,
                        esStartSection, esGenerateSection, esEndSection);

  TppFileType = (ftComma, ftTab, ftFixedLength, ftCustom);

  TppFormatType = (ftBinary, ftASCII);

  TppFrameStyleType = (fsDashed, fsSolid);

  TppLanguageType = (lgDefault, lgDanish, lgDutch, lgEnglish, lgFrench, lgGerman,
                     lgItalian, lgPortugueseBrazil, lgPortuguese, lgSpanish,
                     lgSpanishMexico, lgSwedish, lgNorwegian, lgCustom);

  TppLinePositionType = (lpTop, lpBottom, lpLeft, lpRight);

  TppLineStyleType = (lsSingle, lsDouble);

  TppLocateOption = (pploCaseInsensitive, pploPartialKey);

  TppOperationType = (ppopRemove, ppopActiveChange, ppopDataChange, ppopUserNameChange, ppopNew, ppopLanguageChange, ppopProgramChange,
                      ppopSetValue);

  TppPageSettingType = (psAll, psPageList, psSinglePage, psFirstPage, psLastPage, psPageRange);
  TppPageRangeType = (prAll, prOddPages, prEvenPages);

  TppPassSettingType = (psOnePass, psTwoPass);

  TppPrintBehaviorType = (pbChild, pbSection, pbFixed);

  TppPrintConditionType = (pppcStartOfReport, pppcEndOfReport,
                           pppcStartOfPage, pppcEndOfPage,
                           pppcStartOfColumn, pppcEndOfColumn,
                           pppcStartOfGroup, pppcEndOfGroup,
                           pppcOnTraversal);

  TppPrinterCapType = (pcPaperNames, pcPapers, pcPaperWidths, pcPaperHeights, pcBinNames, pcBins);

  TppPrintHeightType = (phStatic, phDynamic);

  TppPrintTimesType = (ptZero, ptOne, ptRepeat, ptCount);

  TppPropEditType = (etAutoEdit, etEdit, etFieldList, etDataPipelineList, etValueList);

  TppMenuItemType = (mtBoolean, mtDialog, mtEnumerated);

  TppRangeBeginType = (rbFirstRecord, rbLastRecord, rbCurrentRecord);

  TppRangeEndType = (reFirstRecord, reLastRecord, reCurrentRecord, reCount);

  TppRAPInterfaceOption = (riDialog, riNotebookTab);

  TppRAPOption = (roViewVariables, roEditVariables, roViewEvents, roEditEvents, roViewGlobals, roEditGlobals);

  TppResolutionType = (pprtHorizontal, pprtVertical);

  TppSaveToType = (stDatabase, stFile);

  TppSearchOperatorType = (soEqual, soNotEqual,
                           soLessThan, soLessThanOrEqualTo,
                           soGreaterThan, soGreaterThanOrEqualTo,
                           soLike, soNotLike,
                           soBetween, soNotBetween,
                           soInList, soNotInList,
                           soBlank, soNotBlank);

  TppSortOrderType = (soAscending, soDescending);

  TppShowComponent = (scLabel, scMemo, scRichText, scCalc, scImage,
                      scShape, scLine, scBarCode, scTeeChart,
                      scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage,
                      scDBBarCode, scDBTeeChart, scRegion, scSubReport,
                      scSystemVariable, scVariable);

  TppSQLType = (sqBDELocal, sqSQL1, sqSQL2);

  TppSubReportActionType = (ppsrReset, ppsrExpandDrillDowns, ppsrCollapseDrillDowns, ppsrEnableProcessMessages);

  TppUnitType = (utScreenPixels, utInches, utMillimeters, utPrinterPixels, utMMThousandths);

  TppVarEventType = (veTraversal, veDataPipelineTraversal, vePageStart, vePageEnd, veColumnStart,
                     veColumnEnd, veReportStart, veReportEnd, veGroupStart, veGroupEnd, veGroupBeforeHeader, veGroupBeforeFooter);

  TppVarType = (vtDate, vtDateTime, vtPrintDateTime, vtPageCount, vtPageSet,
                vtPageSetDesc, vtPageNo, vtPageNoDesc, vtTime);

  TppNextActionType = (ppnaNone, ppnaDesign, ppnaPreview);

  TppTextAlignment = (taLeftJustified, taRightJustified, taCentered, taFullJustified);


{******************************************************************************
 *
 ** M I S C
 *
{******************************************************************************}

  TppTabStopPos  = array [0..99] of Integer;

  {used by barcode}
  TppDataBits      = array[0..3999] of char;
  TppAddOnDataBits = array[0..999]  of char;

  TppMultiKeyHelp = record
    mkSize: DWORD;
    mkKeylist: AnsiChar;
    szKeyphrase: array[0..255] of AnsiChar;
  end;


const
  cReportBands       = [btHeader, btDetail, btFooter];
  cChildReportBands  = [btTitle, btDetail, btSummary];

  cAllShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage,
                        scShape, scLine, scBarCode, scTeeChart,
                        scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage,
                        scDBBarCode, scDBTeeChart, scRegion, scSubReport,
                        scSystemVariable, scVariable];

  cAllRAPInterfaceOptions = [riDialog, riNotebookTab];
  cAllRAPOptions = [roViewVariables, roEditVariables, roViewEvents, roEditEvents, roViewGlobals, roEditGlobals];
  cRAPDialogOptions = [roViewVariables, roEditVariables];

  cPOSBarCodes = [bcEAN_13, bcEAN_8, bcUPC_A, bcUPC_E];

  cAllDataEditOptions = [ppemTables, ppemFields, ppemCalcs, ppemGroup, ppemSearch, ppemSort, ppemText, ppemPreview];

  csAlignLeftIdent = 'taLeftJustify';
  csAlignRightIdent = 'taRightJustify';
  csAlignCenterIdent = 'taCenter';


{******************************************************************************
 *
 ** S E T   T Y P E S
 *
{******************************************************************************}
type

  TppBandTypes           = set of TppBandType;
  TppDatabaseTypes       = set of TppDatabaseType;
  TppDataPipelineStates  = set of TppDataPipelineStateType;
  TppDataEditTypes       = set of TppDataEditType;
  TppDesignerStates      = set of TppDesignerStateType;
  TppDesignStates        = set of TppDesignStateType;
  TppEngineStates        = set of TppEngineStateType;
  TppEvents              = set of Byte;
  TppLocateOptions       = set of TppLocateOption;
  TppPrintConditions     = set of TppPrintConditionType;
  TppShowComponents      = set of TppShowComponent;
  TppRAPInterfaceOptions = set of TppRAPInterfaceOption;
  TppRAPOptions          = set of TppRAPOption;


{******************************************************************************
 *
 ** E V E N T S
 *
{******************************************************************************}

  TppAlignEvent = procedure (Action: TppAlignType) of object;
  TppComponentEvent = procedure (Sender: TObject; Component: TComponent) of object;
  TppCreateReportEvent = procedure(Sender: TObject; const aDataName: String; var aReport: TObject) of object;
  TppCreateAutoSearchFieldEvent = procedure(Sender: TObject; aAutoSearchField: TObject) of object;
  TppDialogEvent = procedure (Sender: TObject; aDialog: TObject) of object;
  TppDrawCommandEvent = procedure (Sender: TObject; aDrawCommand: TObject) of object;
  TppGetDataNamesEvent = procedure(Sender: TObject; aDataNameList: TStrings) of object;
  TppGetDisplayFormatsEvent = procedure (Sender: TObject; DisplayFormats: TStrings) of object;
  TppGetFieldAliasesEvent = procedure (Sender: TObject; FieldAliases: TStrings) of object;
  TppGetFieldsEvent = procedure(Sender: TObject; const aDataName: String; aFieldList: TStrings) of object;
  TppGetLastPageCachedEvent = procedure(Sender: TObject; var aPageNo: Longint) of object;
  TppFormatEvent = procedure(Sender: TObject; DisplayFormat: String;
                             DataType: TppDataType; Value: Variant; var Text: String) of object;
  TppGetBreakValueEvent = procedure(Sender: TObject; var aBreakValue: String) of object;
  TppGetAliasForFieldEvent = procedure (Sender: TObject; aDataPipeline: TObject;
                                        const aDataField: String; var aFieldAlias: String) of object;
  TppGetFieldForAliasEvent = procedure (Sender: TObject; const aFieldAlias: String;
                                        var aDataPipeline: TObject; var aDataField: String) of object;
  TppSaveLineEvent = procedure(Sender: TObject; var Line: String) of object;
  TppTextDeviceSaveEvent = procedure(aTextDevice: TObject; aComponent: TObject; var aText: String) of object;
  TppSaveTextEvent = procedure(Sender: TObject; var Text: String) of object;
  TppGetTextEvent = procedure(Sender: TObject; var Text: String) of object;
  TppGotoPageEvent = procedure (Sender: TObject; aPageNo: Longint) of object;
  TppLocateEvent = function (Sender: TObject; const aReportName: String): Boolean of object;
  TppMemoEvent = procedure(Sender: TObject; aLines: TStrings) of object;
  TppPageDefChangeQueryEvent = procedure(Sender: TObject; aNewPageDef: TObject; var CanChange: Boolean) of object;
  TppPageEvent = procedure (Sender: TObject; aPage: TObject) of object;
  TppPageRequestEvent = procedure (Sender: TObject; aPageRequest: TObject) of object;
  TppPaintEvent = procedure(aCanvas: TCanvas) of object;
  TppPictureEvent = procedure(Sender: TObject; aPicture: TPicture) of object;
  TppRenameFolderEvent = procedure(Sender: TObject; aFolderId: Integer; const aNewName: String) of object;
  TppStreamEvent = procedure (Sender: TObject; Stream: TStream) of object;
  TppTabChangeEvent = procedure (Sender: TObject; NewTab: String; var AllowChange: Boolean) of object;
  TppValidateNameEvent = procedure(Sender: TObject; const aName: String; var aNameValid: Boolean) of object;
  TppValidateComponentEvent = procedure (Sender: TObject; Component: TComponent; var Valid: Boolean) of object;
  TppVarCalcEvent = procedure (Sender: TObject; var Value: Variant) of object;

{******************************************************************************
 *
 ** C A C H E   R E C O R D S
 *
{******************************************************************************}

{note: for WIN32, use compiler directive to declare strings as 'ShortStrings'
       this is required for record structures}

{$IFDEF WIN32}
{$H-}
{$ENDIF}

{further note: hopefully the compiler directive above will never be needed.
 Strings take up took much cache space and should be avoided at all costs.}

  {used by ArchiveReader and ArchiveDevice to read header info}
  TppPageEntryRec = record
    Position: Longint;
    AbsolutePageNo: Longint;
  end; {record, TppPageEntry}

  {used by Engine to track print position}
  TppRect = record
    Left: Longint;
    Top: Longint;
    Right: Longint;
    Bottom: Longint;
  end; {record, TppRect}

  TppBandSaveRec = record
    FObjectListIndex: Integer;
    FObjectIndex: Integer;
    FOverFlow: Boolean;
    FPartialGeneration: Boolean;
    FPartialAdjustment: Longint;
    FPrintPositionBreak: Boolean;
    FPrintingSection: Boolean;
  end; {record, TppBandSaveRec}

  TppReportBandSaveRec = record
    FObjectListIndex: Integer;
    FObjectIndex: Integer;
    FOverFlow: Boolean;
    FPartialGeneration: Boolean;
    FPartialAdjustment: Longint;
    FPrintPositionBreak: Boolean;
    FPrintingSection: Boolean;

    FAlreadyPageBreak: Boolean;
  end; {record, TppReportBandSaveRec}

  TppGroupBandSaveRec = record
    FObjectListIndex: Integer;
    FObjectIndex: Integer;
    FOverFlow: Boolean;
    FPartialGeneration: Boolean;
    FPartialAdjustment: Longint;
    FPrintPositionBreak: Boolean;
    FPrintingSection: Boolean;

    FGeneration: Boolean;
  end; {record, TppGroupBandSaveRec}

  TppGroupHeaderBandSaveRec = record
    FObjectListIndex: Integer;
    FObjectIndex: Integer;
    FOverFlow: Boolean;
    FPartialGeneration: Boolean;
    FPartialAdjustment: Longint;
    FPrintPositionBreak: Boolean;
    FPrintingSection: Boolean;

    FGeneration: Boolean;

    FAlreadyColumnBreak: Boolean;
    FAlreadyPageBreak: Boolean;
  end; {record, TppGroupBandSaveRec}

  TppDetailBandSaveRec = record
    FObjectListIndex: Integer;
    FObjectIndex: Integer;
    FOverFlow: Boolean;
    FPartialGeneration: Boolean;
    FPartialAdjustment: Longint;
    FPrintPositionBreak: Boolean;
    FPrintingSection: Boolean;

    FBandsPerRecordCount: Integer;
  end; {record, TppBandSaveRec}

  TppGroupSaveRec = record
    FFirstPageNo: Longint;
    FLastPageNo: Longint;
    FBreaking: Boolean;
    FBreakNo: Longint;
    FFirstColumn: Integer;
    FResetOnCheck: Boolean;
    FKeptTogether: Boolean;
  end; {record, TppGroupSaveRec}

  TppCustomComponentSaveRec = record
    FDrawComponent: Boolean;
  end; {record, TppCalcSaveRec}

  TppCalcSaveRec = record
    FDrawComponent: Boolean;

    FBoolean: Boolean;
    FDateTime: TDateTime;
    FInteger: Longint;
    FDouble: Double;
  end; {record, TppCalcSaveRec}

  TppVariableSaveRec = record
    FDrawComponent: Boolean;
    FResetOnCompute: Boolean;

    FBoolean: Boolean;
    FChar: Char;
    FCurrency: Currency;
    FInteger: Longint;
    FDateTime: TDateTime;
    FDouble: Double;
    FExtended: Extended;
    FSingle: Single;
  end; {record, TppVariableSaveRec}

  TppDBTextSaveRec = record
    FDrawComponent: Boolean;

    FAlreadyPrinted: Boolean;
    FFirstPage: Longint;
    FPriorValueSame: Boolean;
    FResetOnCompute: Boolean;
  end; {record, TppDBTextSaveRec}

  TppDBCalcSaveRec = record
    FDrawComponent: Boolean;

    FAlreadyPrinted: Boolean;
    FFirstPage: Longint;
    FPriorValueSame: Boolean;
    FResetOnCompute: Boolean;

    FDivisor: Double;
    FValue: Double;
    FFirstCount: Longint;
  end; {record, TppDBCalcSaveRec}

  TppStretchableSaveRec = record
    FDrawComponent: Boolean;
    FDrawShifter: Boolean;
    FObjectIndex: Integer;
    FOverFlow: Boolean;
    FPartialGeneration: Boolean;
  end; {record, TppStretchableSaveRec}

  TppCustomMemoSaveRec = record
    FDrawComponent: Boolean;
    FDrawShifter: Boolean;
    FKeptTogether: Boolean;
    FObjectIndex: Integer;
    FOverFlow: Boolean;
    FPartialGeneration: Boolean;

    FCharPos: Longint;
  end; {record, TppCustomMemoSaveRec}

  TppSubReportSaveRec = record
    FDrawComponent: Boolean;
    FDrawShifter: Boolean;
    FKeptTogether: Boolean;
    FObjectIndex: Integer;
    FOverFlow: Boolean;
    FPartialGeneration: Boolean;

    FAlreadyPageBreak: Boolean;
    FCount: Longint;
    FStartReport: Boolean;
    FFirstCachePageNo: Longint;
    FLastPageCached: Longint;
    FReportCompleted: Boolean;
    FReportPageNo: Longint;
    FReportAbsolutePageCount: Longint;
    FFirstPassCompleted: Boolean;
    FMasterPageNo: Longint;
  end; {record, TppSubReportSaveRec}

  TppRegionSaveRec = record
    FDrawComponent: Boolean;
    FDrawShifter: Boolean;
    FKeptTogether: Boolean;
    FObjectIndex: Integer;
    FOverFlow: Boolean;
    FPartialGeneration: Boolean;

    FObjectListIndex: Integer;
    FPartialAdjustment: Longint;
  end; {record, TppRegionSaveRec}

  TppDataPipelineSaveRec = record
    FNoRecords: Boolean;
    FLastRecord: Boolean;
    FFirstRecord: Boolean;
    FBookmarked: Boolean;
    FBookmark: Longint;
    FTraversalCount: Longint;
  end;  {record, TppDataPipelineSaveRec}

  TppEngineSaveRec = record
    FAdvanceRecord: Boolean;
    FAllColumnsStarted: Boolean;
    FAllDataTraversed: Boolean;
    FBandIndex: Integer;
    FBandListIndex: Integer;
    FReportBandCount: Longint;
    FInitialized: Boolean;
    FFirstPass: Boolean;
    FNoData: Boolean;
    FPrintingSummary: Boolean;
    FPrintingTitle: Boolean;
    FStartSection: Boolean;
    FGenerateSection: Boolean;
    FEndSection: Boolean;
    FStartOfReport: Boolean;
    FStartOfPage: Boolean;
    FStartOfColumn: Boolean;
    FStartOfGroup: Boolean;
    FOnTraversal: Boolean;
    FEndOfGroup: Boolean;
    FEndOfColumn: Boolean;
    FEndOfPage: Boolean;
    FEndOfReport: Boolean;
    FTraversedMaster: Boolean;
    FTraversedDetail: Boolean;
    FCalcsOutOfSync: Boolean;
  end;  {record, TppEngineSaveRec}

{$IFDEF WIN32}
{$H+}
{$ENDIF}


{******************************************************************************
 *
 ** E X C E P T I O N S
 *
{******************************************************************************}

  EPrintError = class(Exception);
  ETemplateLoadError = class(Exception);
  ETemplateSaveError = class(Exception);
  EInvalidTemplateError = class(Exception);
  EInvalidPropertyError = class(Exception);
  EDataError = class(Exception);
  ECodeError = class(Exception);


 
implementation






end.

