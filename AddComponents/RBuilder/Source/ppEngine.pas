{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppEngine;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppTypes, ppUtils, ppClass, ppBands, ppDB, ppComm, ppReport, ppDevice;

const
  cPageHeaderBands = 0;
  cReportHeaderBands = 1;
  cColumnHeaderBands = 2;
  cGroupHeaderBands = 3;
  cDetailBands = 4;
  cGroupFooterBands = 5;
  cReportFooterBands = 6;
  cColumnFooterBands = 7;
  cPageFooterBands = 8;

  cPageBandStart = 3;
  cPageBandEnd = 5;

type

  TppDataPipelineCommandType = (ppdcOpen, ppdcClear, ppdcClose, ppdcRestore, ppdcUpdateCurrentBookmark);
  TppTraversalDirectionType = (pptdForward, pptdBackward);

  { TppEngine }
  TppEngine = class(TppCustomEngine)
    private
      FBandIndex: Integer;
      FBandListIndex: Integer;
      FColumnComplete: Boolean;
      FColumnarReport: Boolean;
      FMasterDetailReport: Boolean;
      FColumnStartPosition: Longint;
      FCurrentBand: TppCustomBand;
      FDetailDataPipeline: TppDataPipeline;
      FFirstPassCompleted2: Boolean;
      FFirstPassStarted: Boolean;
      FLastBand: TppCustomBand;
      FLastPageGenerated: Longint;
      FLookupDataPipelines: TList;
      FMainReportStarted: Boolean;
      FMasterDataPipeline: TppDataPipeline;
      FMinGroupNo: Integer;
      FPageComplete: Boolean;
      FPageListIndex: Integer;
      FPageRequest: TppPageRequest;
      FSecondPassStarted: Boolean;
      FSecondPassCompleted: Boolean;
      FTraversedDetail: Boolean;
      FTraversedMaster: Boolean;

      FBandLists: TList;
      FMasterBandList: TStringList;

      FReportHeaderBands: TList;
      FPageHeaderBands: TList;
      FColumnHeaderBands: TList;
      FGroupHeaderBands: TList;
      FDetailBands: TList;
      FGroupFooterBands: TList;
      FColumnFooterBands: TList;
      FPageFooterBands: TList;
      FReportFooterBands: TList;

      {print routines}
      procedure AfterPass;
      procedure BeforePass;
      procedure CheckGroups(aDataPipeline: TppDataPipeline);
      procedure CategorizeBands;
      procedure ClearBandLists;
      procedure ComputeCalcs;
      procedure ExecuteDataPipelineCommand(aCommand: TppDataPipelineCommandType;
                                           var aDataPipeline: TppDataPipeline);
      procedure FinishColumn;
      procedure FinishPage;
      procedure ForceGroupBreaks;
      procedure Generate;
      procedure GenerateBands(aBandList: TList; aBandIndex: Integer; aUpdateBandIndex: Boolean);
      procedure GenerateOrphanedGroupFooter;
      procedure GeneratePage(aBandListIndex, aBandIndex: Integer);
      procedure GetFirstPage;
      procedure GetNextPage;
      function  GetPageFromPageList: Boolean;
      procedure InitBands;
      procedure InitDrawPage;
      procedure InitGroups;
      procedure InitPage;
      procedure IssueDataPipelineCommand(aCommand: TppDataPipelineCommandType);
      procedure KeepGroupsTogether;
      procedure NextMDRecord;
      procedure NextRecord;
      procedure OpenDataPipeline(aDataPipeline: TppDataPipeline); {4.06}
      procedure OpenDataPipelines;
      procedure OpenLookupDataPipelines;
      function  PageRequestedInvalid: Boolean;
      procedure PageStart;
      function  PrintingSection: Boolean;
      procedure PriorMDRecord;
      procedure PriorRecord;
      procedure RemoveDrawCommandsFromLastPage;
      procedure RestorePage;
      procedure SaveEngineState;
      procedure SendPage;
      function  SetColumnPosition: Boolean;
      procedure StartColumn;
      procedure StartPage;
      procedure TraverseMaster(aDirection: TppTraversalDirectionType);
      procedure UpdateControlGroup;
      procedure UpdateGenerateCompleted;

    protected
      function  GetCurrentBand: TppBand; override;
      function  GetCurrentBandListIndex: Integer; override;
      function  GetPageCount: Longint; override;
      function  GetPageNo: Longint; override;
      function  GetPageBottom: Longint; override;
      function  GetPageStarted: Boolean; override; {4.06}

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      {overriden from empty implementations in TppCustomEngine}
      procedure CloseDataPipelines; override;
      procedure DataTraversalCompleted; override;
      procedure Init; override;
      procedure RequestPage(aPageRequest: TppPageRequest); override;
      procedure ResetFromPageNo(aAbsolutePageNo: Longint); override;
      procedure PageLimitReached; override;
      procedure Reset; override;
      procedure RestoreFromCache(aCachePageNo: Longint); override;
      procedure SaveToCache(aCachePageNo: Longint); override;
      procedure SetPageStarted(aValue: Boolean); override;
      procedure SyncData; override;
      procedure TraverseData; override;

    published

  end; {class, TppEngine}

implementation

uses
  ppCtrls, ppStrtch, ppSubRpt; {4.06 added ppSubRpt}

{******************************************************************************
 *
 ** E N G I N E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppEngine.Create                                                             }

constructor TppEngine.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  CacheRecordSize := SizeOf(TppEngineSaveRec);

  ESInclude([esInitialized]);

  FMainReportStarted := False;

  Reset;

  FLookupDataPipelines := TList.Create;
  FPageRequest := TppPageRequest.Create;
  FMasterBandList := TStringList.Create;

  FPageHeaderBands := TList.Create;
  FReportHeaderBands := TList.Create;
  FColumnHeaderBands := TList.Create;
  FGroupHeaderBands := TList.Create;
  FDetailBands := TList.Create;
  FGroupFooterBands := TList.Create;
  FColumnFooterBands := TList.Create;
  FReportFooterBands := TList.Create;
  FPageFooterBands := TList.Create;

  FBandLists := TList.Create;

  FBandLists.Add(FPageHeaderBands);
  FBandLists.Add(FReportHeaderBands);
  FBandLists.Add(FColumnHeaderBands);
  FBandLists.Add(FGroupHeaderBands);
  FBandLists.Add(FDetailBands);
  FBandLists.Add(FGroupFooterBands);
  FBandLists.Add(FReportFooterBands);
  FBandLists.Add(FColumnFooterBands);
  FBandLists.Add(FPageFooterBands);

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppEngine.Destroy }

destructor TppEngine.Destroy;
var
  liBandList: Integer;
  liBandLists: Integer;
begin

  IssueDataPipelineCommand(ppdcClear);

  FLookupDataPipelines.Free;

  {free band lists}
  liBandLists := FBandLists.Count;

  for liBandList := 0 to liBandLists - 1 do
    TList(FBandLists[liBandList]).Free;

  FBandLists.Free;

  {free misc lists}
  FMasterBandList.Free;
  FPageRequest.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppEngine.Reset }

procedure TppEngine.Reset;
begin

  if (Printing) then Exit;

  if not(esInitialized in State) then Exit;

  Page.FreeDrawCommands;

  AbsolutePageNo := 0;
  AbsolutePageCount := 0;

  State := [];

  PrintCondition := [];

  FMainReportStarted := False;

  FirstPassCompleted := False;
  FFirstPassCompleted2 := False;
  FSecondPassStarted := False;

  {notify all objects in report that report has started}
  if (Report is TppReport) and not(Report.PrintingAsSubReport) then
    Report.TriggerCodeModuleDestroy;

end; {procedure, Reset}

{------------------------------------------------------------------------------}
{ TppEngine.CloseDataPipelines }

procedure TppEngine.CloseDataPipelines;
begin
  IssueDataPipelineCommand(ppdcClose);
end; {procedure, CloseDataPipelines}

{------------------------------------------------------------------------------}
{ TppEngine.Notify }

procedure TppEngine.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
var
  liIndex: Integer;
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation = ppopRemove) then
    begin

      if (aCommunicator = FMasterDataPipeline) then
        FMasterDataPipeline := nil;

      if (aCommunicator = FDetailDataPipeline) then
        FDetailDataPipeline := nil;

      liIndex := FLookupDataPipelines.IndexOf(aCommunicator);

      if (liIndex <> -1) then
        FLookupDataPipelines.Delete(liIndex);

    end;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppEngine.DataTraversalCompleted }

procedure TppEngine.DataTraversalCompleted;
begin

  AllDataTraversed := True;

  PCInclude([pppcEndOfGroup, pppcEndOfReport]);

end; {procedure, DataTraversalCompleted}

{------------------------------------------------------------------------------}
{ TppEngine.PageLimitReached }

procedure TppEngine.PageLimitReached;
begin

  AllDataTraversed := True;
  LastBandGenerated := True;

  PCInclude([pppcEndOfGroup, pppcEndOfReport]);

end; {procedure, PageLimitReached}

{------------------------------------------------------------------------------}
{ TppEngine.RequestPage }

procedure TppEngine.RequestPage(aPageRequest: TppPageRequest);
begin

  {if we're already generating pages, we're outta here}
  if Printing then Exit;

  {indicate printing is in progress}
  Printing := True;

  {copy page request settings}
  FPageRequest.Assign(aPageRequest);


  {generate all pages}
  if (Report.PassSetting = psTwoPass) and not(Report is TppChildReport) and
     (not(esInitialized in State) or not(FirstPassCompleted)) then
    begin
      FPageRequest.PageSetting := psAll;

      Generate;

      FPageRequest.PageSetting := aPageRequest.PageSetting;

      {generate requested pages}
      if not(StopPrinting) then
        Generate;

    end
  else
    Generate;

  {restore datapipeline record positions}
  {if (Report is TppReport) then
    IssueDataPipelineCommand(ppdcRestore);}
    
  {indicate to external objects that printing is no longer in progress}
  Printing := False;

end; {procedure, RequestPage}

{------------------------------------------------------------------------------}
{ TppEngine.Generate }

procedure TppEngine.Generate;
begin

  {clear indicators}
  GenerateCompleted := False;
  StopPrinting := False;
  LastBandGenerated := False;

  {get engine ready}
  Init;

  {determine starting AbsolutePageNo value}
  GetFirstPage;

  {loop until all page requests granted or printing cancelled}
  while not(GenerateCompleted) and not(StopPrinting) do
    begin

      SpaceUsed := 0;

      {set pass states, fire event handles}
      BeforePass;

      {generate the page}
      RestorePage;

      {set pass states, fire event handles}
      AfterPass;

      {advance to next page}
      GetNextPage;

      Report.ProcessMessages;

    end; {while, pagesrequested}

end;  {procedure, Generate}

{------------------------------------------------------------------------------}
{ TppEngine.AfterPass }

procedure TppEngine.AfterPass;
begin

  if not(FirstPassCompleted) or (AbsolutePageNo <> AbsolutePageCount) then Exit;

  {fire events and exclude states}
  if (esFirstPass in State) and not(FFirstPassCompleted2) then
    begin
      FFirstPassCompleted2 := True;

      Report.DoOnEndFirstPass;

      ESExclude([esFirstPass]);
    end

  else if (esSecondPass in State) and not(FSecondPassCompleted) then
    begin
      FSecondPassCompleted := True;

      Report.DoOnEndSecondPass;

      ESExclude([esSecondPass]);
    end;

end; {procedure, AfterPass}

{------------------------------------------------------------------------------}
{ TppEngine.BeforePass }

procedure TppEngine.BeforePass;
begin

  ESExclude([esFirstPass, esSecondPass]);

  {set state}
  if (Report.PassSetting = psOnePass) then
    ESInclude([esFirstPass])

  else if not(FirstPassCompleted) then
    ESInclude([esFirstPass])

  else
    ESInclude([esSecondPass]);

  {fire startpass events}
  if (esFirstPass in State) and not(FFirstPassStarted) then
    begin
      FFirstPassStarted := True;

      Report.DoOnStartFirstPass
    end

  else if (esSecondPass in State) and not(FSecondPassStarted) then
    begin
      FSecondPassStarted := True;

      Report.DoOnStartSecondPass;
    end;

end; {procedure, BeforePass}

{------------------------------------------------------------------------------}
{ TppEngine.GeneratePage }

procedure TppEngine.GeneratePage(aBandListIndex, aBandIndex: Integer);
var
  lBandList: TList;
  liBandListIndex: Integer;
  liBandIndex: Integer;
begin

  FBandListIndex := aBandListIndex;
  FBandIndex := aBandIndex;

  {loop until page is complete}
  while (FBandListIndex <= cPageBandEnd) and not(FPageComplete) and not(StopPrinting) do
    begin

      if (FColumnarReport) and ((FColumnComplete) or (CurrentColumn = 0)) then
        begin
          FColumnComplete := False;

          {generate column headers}
          liBandListIndex := FBandListIndex;
          liBandIndex := FBandIndex;

          StartColumn;

          FBandListIndex := liBandListIndex;
          FBandIndex := liBandIndex;

          {generate group headers}
          if (FBandListIndex = cGroupFooterBands) then
            GenerateOrphanedGroupFooter

          else if (FBandListIndex = cDetailBands) or (FBandListIndex = cGroupHeaderBands) then
            begin
              GenerateBands(FGroupHeaderBands, 0, True);

              FBandListIndex := cDetailBands;
              FBandIndex := 0;
            end;

        end;

      {generate bands in list}
      lBandList := FBandLists[FBandListIndex];

      GenerateBands(lBandList, FBandIndex, True);

      {advance to next band list}
      if (not(FColumnarReport) and not(FPageComplete)) or
         ((FColumnarReport) and not(FColumnComplete)) then
        begin
          if (FBandListIndex = cPageBandEnd) and not(AllDataTraversed) then
            FBandListIndex := cPageBandStart
          else
            FBandListIndex := FBandListIndex + 1;

          FBandIndex := 0;
        end;

      Report.ProcessMessages;
    end; {while}

  {generate report footer bands}
  if not(FPageComplete) and (AllDataTraversed) then
    begin
      FBandListIndex := cReportFooterBands;

      GenerateBands(FReportFooterBands, 0, True);
    end;

  {print final drawcommands and indicate page is complete}
  if not(FPageComplete) then
    if (FColumnarReport) then
      FinishColumn
    else
      FinishPage;

end; {procedure, GeneratePage}

{------------------------------------------------------------------------------}
{ TppEngine.PrintingSection }

function TppEngine.PrintingSection: Boolean;
begin
  Result := (esGenerateSection in State) or (esStartSection in State);
end; {function, PrintingSection}

{------------------------------------------------------------------------------}
{ TppEngine.RestorePage }

procedure TppEngine.RestorePage;
var
  liGroup: Integer;
begin

  {restore report state as of the end of the previous page}
 {if (FLastPageGenerated <> AbsolutePageNo - 1) then}
    DoOnReadCache;

  {special section logic}
  if PrintingSection then
    begin
      InitPage;

      GeneratePage(FBandListIndex, FBandIndex);

      Exit;
    end;

  {start the page}
  StartPage;

  if (FBandListIndex <> cGroupFooterBands) then
    begin
      SyncData;

      {refresh group values, must do this after start page}
      for liGroup := 0 to Report.GroupCount - 1 do
        Report.Groups[liGroup].RefreshBreakValues;
    end;


  {reset the indexes}
  case FBandListIndex of

    cGroupHeaderBands:
      FBandIndex := 0;

    cDetailBands, cPageHeaderBands, cReportHeaderBands, cColumnHeaderBands:
      begin
        FBandListIndex := cGroupHeaderBands;
        FBandIndex := 0;
      end;

    cGroupFooterBands:
      if not(FColumnarReport) then
        GenerateOrphanedGroupFooter;

  end; {case, band list type}

  {continue with the page}
  GeneratePage(FBandListIndex, FBandIndex);

end; {procedure, RestorePage}

{------------------------------------------------------------------------------}
{ TppEngine.GenerateOrphanedGroupFooter }

procedure TppEngine.GenerateOrphanedGroupFooter;
var
  liBandIndex: Integer;
  lGroupBand: TppGroupBand;
  lbGroupFootersComplete: Boolean;
  lGroupHeaderBands: TList;
  liOrphanGroup: Integer;
  liGroup: Integer;
begin

  {save generation state of all group headers}
  for liBandIndex := 0 to FGroupHeaderBands.Count - 1 do
    begin
      lGroupBand := TppGroupBand(FGroupHeaderBands[liBandIndex]);
      lGroupBand.SaveGeneration := lGroupBand.Generation;
      lGroupBand.Generation := False;
    end;

  {generate group headers for groups outside orphaned group}
  lGroupBand := FGroupFooterBands[FBandIndex];

  liOrphanGroup := Report.FindGroup(lGroupBand.Group);

  {generate header for orphaned group based on HeaderForOrphanedFooter prop}
  if not(lGroupBand.Group.HeaderForOrphanedFooter) then
    liOrphanGroup := liOrphanGroup - 1;

  {generate group headers}
  if (liOrphanGroup > -1) then
    begin
      lGroupHeaderBands := TList.Create;

      for liBandIndex := 0 to liOrphanGroup do
        lGroupHeaderBands.Add(FGroupHeaderBands[liBandIndex]);

      GenerateBands(lGroupHeaderBands, 0, False);

      lGroupHeaderBands.Free;
    end;

  PCExclude([pppcStartOfPage, pppcStartOfColumn, pppcStartOfReport]);

  {restore group header generation state}
  for liBandIndex := 0 to FGroupHeaderBands.Count - 1 do
    begin
      lGroupBand := TppGroupBand(FGroupHeaderBands[liBandIndex]);
      lGroupBand.Generation := lGroupBand.SaveGeneration;
    end;

  {generate group footers}
  liBandIndex := FBandIndex;

  GenerateBands(FGroupFooterBands, FBandIndex, True);

  lGroupBand := TppGroupBand(FGroupFooterBands[liBandIndex]);

  {determine if all group footer printed}
  lbGroupFootersComplete := True;
  liBandIndex := FBandIndex;

  while (liBandIndex < FGroupFooterBands.Count) and (lbGroupFootersComplete) do
    begin
      lGroupBand := FGroupFooterBands[liBandIndex];

      lbGroupFootersComplete := not(lGroupBand.OutOfSpace);

      Inc(liBandIndex);
    end;

  if AllDataTraversed and (lbGroupFootersComplete) then
    begin
      FBandListIndex := cReportFooterBands;
      FBandIndex := 0;
    end
  else if (lbGroupFootersComplete) then
    begin
      FBandListIndex := cGroupHeaderBands;
      FBandIndex := 0;
    end;

  {refresh group values}
  for liGroup := 0 to Report.GroupCount - 1 do
    Report.Groups[liGroup].RefreshBreakValues;

  {if group footer orphaned for StartNewPage, don't advance record}
  if lGroupBand.Group.NewPage then Exit;

  SyncData;

end; {procedure, GenerateOrphanedGroupFooter}

{------------------------------------------------------------------------------}
{ TppEngine.KeepGroupsTogether }

procedure TppEngine.KeepGroupsTogether;
var
  lbKeepTogether: Boolean;
begin

  if (ControlKeepTogether = nil) then Exit;

  {modified for 4.06}
  if (FCurrentBand is TppDetailBand) then
    lbKeepTogether := True

  else if (FCurrentBand is TppGroupFooterBand) then
    lbKeepTogether := (TppGroupFooterBand(FCurrentBand).Group.GroupNo >= ControlKeepTogether.GroupNo)

  else if (FCurrentBand is TppGroupHeaderBand) then
    lbKeepTogether := (TppGroupHeaderBand(FCurrentBand).Group.GroupNo >= ControlKeepTogether.GroupNo)

  else
    lbKeepTogether := False;

  if lbKeepTogether then
    ControlKeepTogether.DetailOutOfSpace

end; {procedure, KeepGroupsTogether}

{------------------------------------------------------------------------------}
{ TppEngine.GenerateBands }

procedure TppEngine.GenerateBands(aBandList: TList; aBandIndex: Integer; aUpdateBandIndex: Boolean);
var
  liBands: Integer;
  liBand: Integer;
  lbOutOfSpace: Boolean;
begin

  {generate start page bands}
  liBands := aBandList.Count;

  liBand := aBandIndex;

  lbOutOfSpace := False;

  while (liBand < liBands) and not(lbOutOfSpace) and not(StopPrinting) do
    begin

      FCurrentBand := TppCustomBand(aBandList[liBand]);

      FCurrentBand.Generate;

      if not(PageStarted) and
         not(FBandListIndex = cReportHeaderBands) and
         not(FBandListIndex = cPageHeaderBands) and
         not(FBandListIndex = cColumnHeaderBands) and
         not((FBandListIndex = cGroupHeaderBands) and
             (FCurrentBand is TppGroupBand) and (TppGroupBand(FCurrentBand).Group.ReprintOnSubsequentPage)) then
        PageStarted := True;

      if (PrintPosRect.Bottom > SpaceUsed) then
        SpaceUsed := PrintPosRect.Bottom;

      lbOutOfSpace := FCurrentBand.OutOfSpace;

      if (lbOutOfSpace) then
        KeepGroupsTogether;

      if (AllDataTraversed) and (FCurrentBand = FLastBand) and not(lbOutOfSpace) then
        LastBandGenerated := True;

      if not(lbOutOfSpace) then
        Inc(liBand);

      Report.ProcessMessages;
    end;

  if (aBandList = FGroupHeaderBands) and not(lbOutOfSpace) then
    PCExclude([pppcStartOfPage, pppcStartOfColumn, pppcStartOfReport]);

  if (aUpdateBandIndex) then
    if (liBand < aBandList.Count) then
      FBandIndex := liBand
    else
      FBandIndex := aBandList.Count - 1;


  {finish the page or column}
  if lbOutOfSpace and not(pppcEndOfPage in PrintCondition) then

    if (FColumnarReport) then
      FinishColumn
    else
      FinishPage;

  {clear current band}
  FCurrentBand := nil;

end; {procedure, GenerateBands}

{------------------------------------------------------------------------------}
{ TppEngine.UpdateGenerateCompleted }

procedure TppEngine.UpdateGenerateCompleted;
begin

  case FPageRequest.PageSetting of
    psAll, psLastPage:
      if (LastBandGenerated) and (DrawPage) and (AbsolutePageNo = AbsolutePageCount) then
        GenerateCompleted := True;

    psSinglePage:
      if (AbsolutePageNo >= FPageRequest.PageRequested) and (DrawPage) then
        GenerateCompleted := True;

    psFirstPage:
      if (AbsolutePageNo >= 1) and (DrawPage)  then
        GenerateCompleted := True;

    psPageList:
      if (PageRequestedInvalid) then
        GenerateCompleted := True;

   end; {case, page settting type}

end; {procedure, UpdateGenerateCompleted}

{------------------------------------------------------------------------------}
{ TppEngine.GetFirstPage }

procedure TppEngine.GetFirstPage;
begin

  DoOnGetLastPageCached;

  {determine starting page no}
  case FPageRequest.PageSetting of
    psAll:
      AbsolutePageNo := 1;

    psSinglePage:
      begin
        if FirstPassCompleted and (FPageRequest.PageRequested > AbsolutePageCount) then
          FPageRequest.PageRequested := AbsolutePageCount

        else if (FPageRequest.PageRequested < 1) then
          FPageRequest.PageRequested := 1;

        AbsolutePageNo := FPageRequest.PageRequested;
      end;

    psFirstPage:
      AbsolutePageNo := 1;

    psLastPage:
      if FirstPassCompleted then
        AbsolutePageNo := AbsolutePageCount
      else
        AbsolutePageNo := LastPageCached + 1;

    psPageList:
      begin
        FPageListIndex := 0;

        if GetPageFromPageList then
          AbsolutePageNo := FPageRequest.PageRequested
        else
          GenerateCompleted := True;

      end;

   end; {case, page setting type}


  {if page is beyond page cache, start from last page cached}
  if (AbsolutePageNo > (LastPageCached + 1) ) then
    AbsolutePageNo := LastPageCached + 1;

end; {procedure, GetFirstPage}

{------------------------------------------------------------------------------}
{ TppEngine.GetNextPage }

procedure TppEngine.GetNextPage;
begin

  if GenerateCompleted then Exit;

  case FPageRequest.PageSetting of
    psAll:
      if (LastBandGenerated) then
        GenerateCompleted := True
      else
        AbsolutePageNo := AbsolutePageNo + 1;

    psSinglePage:
      begin
        if (AbsolutePageNo >= FPageRequest.PageRequested) then
          GenerateCompleted := DrawPage;

        if not(GenerateCompleted) then
          begin
            if FirstPassCompleted and (FPageRequest.PageRequested > AbsolutePageCount) then
              FPageRequest.PageRequested := AbsolutePageCount

            else if (FPageRequest.PageRequested < 1) then
              FPageRequest.PageRequested := 1;

            AbsolutePageNo := FPageRequest.PageRequested;
          end;

      end;

    psFirstPage:
      if (AbsolutePageNo >= 1) then
        GenerateCompleted := True;

    psLastPage:
      if (LastBandGenerated) then
        GenerateCompleted := DrawPage
      else
        AbsolutePageNo := AbsolutePageNo + 1;

    psPageList:
      begin
        if GetPageFromPageList then
          AbsolutePageNo := FPageRequest.PageRequested
        else
          GenerateCompleted := True;
      end;

   end; {case, page settting type}

  DoOnGetLastPageCached;

  if (AbsolutePageNo > (LastPageCached + 1)) then
    AbsolutePageNo := LastPageCached + 1;
    
end; {procedure, GetNextPage}

{------------------------------------------------------------------------------}
{ TppEngine.GetPageFromPageList }

function TppEngine.GetPageFromPageList: Boolean;
var
  lbInvalidPage: Boolean;
begin
  Result := True;

  if (FPageRequest.PageList = nil) then
    Result := False

  else if (FPageListIndex >= FPageRequest.PageList.Count) then
    Result := False

  else
    begin
      lbInvalidPage := True;

      while (FPageListIndex < FPageRequest.PageList.Count) and lbInvalidPage do
        begin
          lbInvalidPage := PageRequestedInvalid;

          if (FPageRequest.PageRequested <= (AbsolutePageCount + 1)) or lbInvalidPage then
            Inc(FPageListIndex);
        end; {while, pages invalid}

      if (lbInvalidPage) then
        Result := False;
    end;

end; {function, GetPageFromPageList}

{------------------------------------------------------------------------------}
{ TppEngine.PageRequestedInvalid }

function TppEngine.PageRequestedInvalid: Boolean;
begin

  Result := True;

  if (FPageRequest.PageList = nil) then Exit;

  if (FPageListIndex >= FPageRequest.PageList.Count) then Exit;

  FPageRequest.PageRequested := StrToInt(FPageRequest.PageList[FPageListIndex]);

  if FirstPassCompleted then
    begin
      if (FPageRequest.PageRequested > 0) and (FPageRequest.PageRequested <= AbsolutePageCount) then
        Result := False;
    end

  else if (FPageRequest.PageRequested > 0) then
    Result := False;
    
end; {procedure, PageRequestedInvalid}

{------------------------------------------------------------------------------}
{ TppEngine.StartPage }

procedure TppEngine.StartPage;
var
  liBandIndex: Integer;
  liBandListIndex: Integer;
begin
  PageStarted := False;

  {save current band settings}
  liBandIndex := FBandIndex;
  liBandListIndex := FBandListIndex;

  InitPage;

  {print report header bands}
  if (pppcStartOfReport in PrintCondition) then
    begin
      FBandListIndex := cReportHeaderBands;

      GenerateBands(FReportHeaderBands, 0, True);

      if not(FPageComplete) then
        PCExclude([pppcStartOfReport]);
    end;


  {print page header bands}
  if not(FPageComplete) then
    begin
      PCInclude([pppcStartOfPage]);

      FBandListIndex := cPageHeaderBands;

      GenerateBands(FPageHeaderBands, 0, True);

      {restore band list and band position}
      FBandIndex := liBandIndex;
      FBandListIndex := liBandListIndex;
    end;

end; {procedure, StartPage}

{------------------------------------------------------------------------------}
{ TppEngine.InitPage }

procedure TppEngine.InitPage;
var
  liBand: Integer;
begin

  if (AbsolutePageNo = 1) then
    SendEventNotify(Self, ciEngineStart, nil);
    
  {fire appropriate report events}
  Report.DoOnStartPage;

  {force detail band to print, before first traversal}
  if (AbsolutePageNo = 1) then
    PCInclude([pppcOnTraversal]);

  {set print position to top of page}
  SetPrintPosition(Page.PageDef.mmMarginLeft, Page.PageDef.mmMarginTop,
                   Page.PageDef.mmPrintableWidth, Page.PageDef.mmMarginTop);

  {init indicator used to support detailband printposition property}
  FirstDetailBandPrinted := False;

  CurrentColumn := 0;
  FColumnStartPosition := 0;

  FPageComplete := False;

  PageBandCount := 1;

  {during first pass, update page count}
  if not(FirstPassCompleted) and (AbsolutePageNo > AbsolutePageCount) then
    begin
      AbsolutePageCount := AbsolutePageNo;

      UpdateControlGroup;
    end;

  {clear any draw commands}
  Page.FreeDrawCommands;

  {send message page}
  DrawPage := False;

  SendPage;

  {set draw page}
  InitDrawPage;

  {notify bands of draw page value}
  for liBand := 0 to (Report.BandCount - 1) do
    Report.Bands[liBand].DrawPage := DrawPage;

  {notify bands & objects that page has started}
  PageStart;

end; {procedure, InitPage}

{------------------------------------------------------------------------------}
{ TppEngine.UpdateControlGroup }

procedure TppEngine.UpdateControlGroup;
var
  lGroupHeader: TppGroupHeaderBand;
  lBandList: TList;
  lBand: TppCustomBand;
  lComponent: TppComponent;
  lbUpdate: Boolean;
begin

  if (ControlGroup = nil) then Exit;

  {modified for 4.06}
  if not(FBandListIndex = cGroupFooterBands) and not(FBandListIndex = cReportFooterBands) then
    begin
      lGroupHeader := TppGroupHeaderBand(ControlGroup.HeaderBand);

      if (pppcStartOfReport in PrintCondition) or ((lGroupHeader.Generation) and not(lGroupHeader.OverFlow)) then
        ControlGroup.FirstPageNo := AbsolutePageNo;
    end;

  if PrintingSection then
    begin
      lBandList := TList(FBandLists[FBandListIndex]);
      lBand := TppCustomBand(lBandList[FBandIndex]);
      lComponent := lBand.CurrentObject;

      if (lComponent is TppSubReport) and not(TppSubReport(lComponent).ResetPageNo) then
        lbUpdate := True
      else
        lbUpdate := False;
    end
  else
    lbUpdate := True;


  if lbUpdate then
    ControlGroup.UpdatePageCount;

end; {procedure, UpdateControlGroup}

{------------------------------------------------------------------------------}
{ TppEngine.FinishPage }

procedure TppEngine.FinishPage;
begin

  {indicate to engine that page has been completed}
  FPageComplete := True;

  {save engine state to cache}
  if not(FColumnarReport) then
    SaveEngineState;
    
  {save last generated page}
  FLastPageGenerated := AbsolutePageNo;

  {put record on correct position for printing column footers}
  if CalcsOutOfSync and not(FColumnarReport) then
    begin
      PriorRecord;

      AdvanceRecord := True;
    end;

  {generate page footer bands}
  if not(pppcEndofPage in PrintCondition) and ([esGenerateSection, esEndSection] * State = []) then
    begin
      PCInclude([pppcEndOfPage]);

      GenerateBands(FPageFooterBands, 0, False);
    end;

  {notify report that page is complete, do this before writing to cache}
  DoOnPageEnd;

  {if we've traversed all data and last band has been generated, we're done}
  if ((esFirstPass in State) and (AllDataTraversed) and (LastBandGenerated)) then
    begin
      if not(FirstPassCompleted) then
        FirstPassCompleted := True;

      SendEventNotify(Self, ciEngineEnd, nil);

      {notify all objects in report that report has started}
      if (Report is TppReport) and not(Report.PrintingAsSubReport) and not(FMainReportStarted) then
        Report.EndOfMainReport;
    end;

  {this is the last page remove unneeded draw commands}
  if (FirstPassCompleted) and (AbsolutePageNo = AbsolutePageCount) and (DrawPage) then
    RemoveDrawCommandsFromLastPage;

  {notify all bands and objects}
  DoBeforeSendPage;

  {send the page}
  SendPage;

  {4.06 - new print job fix}
  UpdateGenerateCompleted;

  {notify all bands and objects}
  DoAfterSendPage;

  {clear end of page condition}
  PCExclude([pppcEndOfPage]);

end; {procedure, FinishPage}

{------------------------------------------------------------------------------}
{ TppEngine.RemoveDrawCommandsFromLastPage }

procedure TppEngine.RemoveDrawCommandsFromLastPage;
var
  liIndex: Integer;
  liIndex2: Integer;
  llHeaderSpaceUsed: Integer;
  lDrawCommands: TList;
  lBand: TppBand;
  lPageBand: TppPageBand;
  lDrawCommand: TppDrawCommand;
begin

  if not(DrawPage) then Exit;
  
  lDrawCommands := TList.Create;

  {remove header band draw commands}
  llHeaderSpaceUsed := 0;

  for liIndex := 0 to FPageHeaderBands.Count - 1 do
    begin
      lBand := TppBand(FPageHeaderBands[liIndex]);

      if (lBand is TppPageBand) and not(TppPageBand(lBand).PrintOnLastPage) then
        begin
          lPageBand := TppPageBand(lBand);

          for liIndex2 := 0 to Page.DrawCommandCount - 1 do
            begin
              if (Page.DrawCommands[liIndex2].Band = lPageBand) then
                lDrawCommands.Add(Page.DrawCommands[liIndex2]);
            end;

          if (lPageBand.SpaceUsed > llHeaderSpaceUsed) then
            llHeaderSpaceUsed := lPageBand.SpaceUsed;
        end;

    end;
    
  {adjust remaining draw commands for space used by header}
  if (llHeaderSpaceUsed > 0) then
    begin
      for liIndex := 0 to Page.DrawCommandCount - 1 do
        Page.DrawCommands[liIndex].Top := Page.DrawCommands[liIndex].Top - llHeaderSpaceUsed;
    end;

  {remove footer band draw commands}
  for liIndex := 0 to FPageFooterBands.Count - 1 do
    begin
      lPageBand := TppPageBand(FPageFooterBands[liIndex]);

      if not(lPageBand.PrintOnLastPage) then
        begin

          for liIndex2 := 0 to Page.DrawCommandCount - 1 do
            begin
              if (Page.DrawCommands[liIndex2].Band = lPageBand) then
                lDrawCommands.Add(Page.DrawCommands[liIndex2]);
            end;

        end;

    end;

  for liIndex := 0 to lDrawCommands.Count - 1 do
    begin
      lDrawCommand := TppDrawCommand(lDrawCommands[liIndex]);

      lDrawCommand.Page := nil;
      
      lDrawCommand.Free;
    end;

  lDrawCommands.Free;

end; {procedure, RemoveDrawCommandsFromLastPage}

{------------------------------------------------------------------------------}
{ TppEngine.SaveEngineState }

procedure TppEngine.SaveEngineState;
begin

  {this is the last page, no need to cache}
  if not(esFirstPass in State) then Exit;

  DoOnGetLastPageCached;

  {save engine state}
  if (AbsolutePageNo = 0) or (AbsolutePageNo > LastPageCached) then
    DoOnWriteCache;

end; {procedure, SaveEngineState}

{------------------------------------------------------------------------------}
{ TppEngine.SendPage }

procedure TppEngine.SendPage;
begin

  {notify devices that we're starting a page}
  Page.AbsolutePageNo := AbsolutePageNo;
  Page.AbsolutePageCount := AbsolutePageCount;

  if (ControlGroup <> nil) then
    Page.ControlGroupBreakNo := ControlGroup.BreakNo;

  Page.DocumentName := Report.PrinterSetup.DocumentName;
  Page.FirstPage := (AbsolutePageNo = 1);
  Page.LanguageIndex := Report.LanguageIndex;
  Page.LastPage := (LastBandGenerated and (AbsolutePageNo = AbsolutePageCount));
  Page.PassSetting := Report.PassSetting;
  {Page.PageNo := PageNo;
  Page.PageCount := PageCount;} {4.06}

  if ([esStartSection, esGenerateSection, esEndSection] * State = []) then
    begin
      Page.PageNo := PageNo;
      Page.PageCount := PageCount;
    end;

  Page.PrintDateTime := PrintDateTime;

  if ((Report.PassSetting = psOnePass) and (esFirstPass in State)) or
     ((Report.PassSetting = psTwoPass) and (esSecondPass in State)) and DrawPage then
    Page.Final := True
  else
    Page.Final := False;

  Page.Calculation := not(DrawPage);

  DoOnPageSent;

end; {procedure, SendPage}

{------------------------------------------------------------------------------}
{ TppEngine.StartColumn }

procedure TppEngine.StartColumn;
begin
  if (esPrintingTitle in State) or (esPrintingSummary in State) then Exit;

  {initialize column start position}
  if (CurrentColumn = 0) then
    FColumnStartPosition := PrintPosRect.Top;

  if (CurrentColumn < Report.Columns) then
    begin
      CurrentColumn := CurrentColumn + 1;

      if SetColumnPosition then
        begin
          Report.DoOnStartColumn;

          PCInclude([pppcStartOfColumn]);

          FBandListIndex := cColumnHeaderBands;

          PageStarted := False;

          GenerateBands(FColumnHeaderBands, 0, True);

        end; {if, column position successfully set}

    end; {if, column should be advanced}

end; {procedure, StartColumn}

{------------------------------------------------------------------------------}
{ TppEngine.FinishColumn }

procedure TppEngine.FinishColumn;
var
  lbStartNewPage: Boolean;
  lbNextColumnValid: Boolean;
  lSaveRect: TppRect;
begin

  {indicate column is complete}
  FColumnComplete := True;

  {check to see if group forces new page, do this first}
  if (FCurrentBand is TppGroupHeaderBand) and
     TppGroupHeaderBand(FCurrentBand).Group.NewPage and
     not(TppGroupHeaderBand(FCurrentBand).Group.NewColumn) then
    lbStartNewPage := True
  else
    lbStartNewPage := False;

  if (CurrentColumn > 0) and (CurrentColumn = Report.ColumnPositions.Count) then
    lbNextColumnValid := False
  else
    begin
      lSaveRect := PrintPosRect;
      CurrentColumn := CurrentColumn + 1;
      lbNextColumnValid := SetColumnPosition;
      CurrentColumn := CurrentColumn - 1;
      SetPrintPosition(lSaveRect.Left, lSaveRect.Top, lSaveRect.Right, lSaveRect.Bottom);
    end;

  {save engine state to cache}
  if (CurrentColumn = Report.Columns) or
     ((AllDataTraversed) and (FBandListIndex > cGroupFooterBands)) or
     not(lbNextColumnValid) or lbStartNewPage then
    SaveEngineState;

  {put record on correct position for printing column footers}
  if CalcsOutOfSync then
    begin
      PriorRecord;
      
      AdvanceRecord := True;
    end;

  {generate column footer bands}
  PCInclude([pppcEndOfColumn]);

  GenerateBands(FColumnFooterBands, 0, False);

  {trigger event, after column footers generate}
  Report.DoOnEndColumn;

  {generate column footer bands}
  PCExclude([pppcEndOfColumn]);

  {if this is the last column, finish the page}
  if (CurrentColumn = Report.Columns) or
     ((AllDataTraversed) and (FBandListIndex > cGroupFooterBands)) or
     not(lbNextColumnValid) or lbStartNewPage then
    begin
      {set print position back to far left}
      SetPrintPosition(Page.PageDef.mmMarginLeft, PrintPosRect.Top, Page.PageDef.mmPrintableWidth, PrintPosRect.Bottom);

      FinishPage;
    end;

end; {procedure, FinishColumn}

{------------------------------------------------------------------------------}
{ TppEngine.SetColumnPosition }

function TppEngine.SetColumnPosition: Boolean;
var
  lrColumnPos: Single;
  liColumnPositions: Integer;
  llColumnWidth: Longint;
  llNewLeft: Longint;
  lsMessage: String;
  lbValidPosition: Boolean;
  llRightBoundary: Longint;
begin

  {calculate starting left position for column}
  llNewLeft := 0;

  llColumnWidth := Report.mmColumnWidth;

  liColumnPositions := Report.ColumnPositions.Count;

  if (liColumnPositions > 0) then
    begin

      if (CurrentColumn <= liColumnPositions) then

        try
          lrColumnPos := StrToFloat(Report.ColumnPositions[CurrentColumn - 1]);
          llNewLeft := ppToMMThousandths(lrColumnPos, Report.Units, pprtHorizontal, Report.Printer);
        except on EConvertError do
          begin
            lsMessage := ppLoadStr(42);
            lsMessage := ppSetMessageParameters(lsMessage);
            lsMessage := Format(lsMessage, [IntToStr(CurrentColumn)]);
            Report.RaiseException(EPrintError.Create(lsMessage + '.'));
          end;
        end {try, except}

      else
        begin
          lsMessage := ppLoadStr(43);
          lsMessage := ppSetMessageParameters(lsMessage);
          lsMessage := Format(lsMessage, [IntToStr(CurrentColumn)]);
          Report.RaiseException(EPrintError.Create(lsMessage + '.'));
        end;

    end {if, user has specified column positions}

  else
    llNewLeft := Page.PageDef.mmMarginLeft + (llColumnWidth * (CurrentColumn - 1));


  {set new column position}
  llRightBoundary := Page.PageDef.mmWidth - Page.PageDef.mmMarginRight;

  if (Report.ColumnPositions.Count > 0) and (llNewLeft > llRightBoundary) then
        lbValidPosition := False

  else if (Report.ColumnPositions.Count = 0) and
          ((llNewLeft + llColumnWidth) > (llRightBoundary)) then
    lbValidPosition := False

  else
    lbValidPosition := True;


  if lbValidPosition then
    SetPrintPosition(llNewLeft, FColumnStartPosition, llRightBoundary, FColumnStartPosition);


  Result := lbValidPosition;

end; {function, SetColumnPosition}

{------------------------------------------------------------------------------}
{ TppEngine.CheckGroups }

procedure TppEngine.CheckGroups(aDataPipeline: TppDataPipeline);
var
  liGroup: Integer;
  liGroups: Integer;
  lGroup: TppGroup;
  lbGroupBreak: Boolean;
begin

  if not(CheckForGroupBreaks) then  Exit;

  {check for group breaks from highest to lowest}
  liGroups := Report.GroupCount;

  for liGroup := (liGroups - 1) downto 0 do
    begin
      lGroup := Report.Groups[liGroup];

      if (aDataPipeline <> nil) and (lGroup.DataPipeline = aDataPipeline) and aDataPipeline.EOF then
        lbGroupBreak := True
      else
        begin
          lGroup.CheckForBreak;

          lbGroupBreak := lGroup.Breaking;
        end;

      if (lbGroupBreak) and (liGroup < FMinGroupNo) then
        FMinGroupNo := liGroup;

    end; {for, each group}

end; {procedure, CheckGroups}

{------------------------------------------------------------------------------}
{ TppEngine.ForceGroupBreaks }

procedure TppEngine.ForceGroupBreaks;
var
  liGroup: Integer;
  liGroups: Integer;
  lbNewPageFound: Boolean;
begin

  if not(CheckForGroupBreaks) then Exit;

  lbNewPageFound := False;

  liGroups := Report.GroupCount;

  for liGroup := FMinGroupNo to liGroups - 1 do
    begin
      Report.Groups[liGroup].ForceBreak;

      if Report.Groups[liGroup].NewPage and not(lbNewPageFound) then
        lbNewPageFound := True

      else if lbNewPageFound and (liGroup <> FMinGroupNo) then
        TppGroupHeaderBand(Report.Groups[liGroup].HeaderBand).AlreadyPageBreak := True;

    end;

end; {procedure, ForceGroupBreaks}

{------------------------------------------------------------------------------}
{ TppEngine.InitDrawPage }

procedure TppEngine.InitDrawPage;
var
  lMainReport: TppReport;
begin

  lMainReport := TppReport(Report.MainReport);

  {determine whether pages should be generated}
  if (esFirstPass in State) and (lMainReport.PassSetting = psOnePass) then
    DrawPage := True

  else if (esSecondPass in State) and (lMainReport.PassSetting = psTwoPass) then
    DrawPage := True

  else if (esFirstPass in State) and (lMainReport.PassSetting = psTwoPass) then
    DrawPage := (AbsolutePageNo = FPageRequest.PageRequested)

  else
    DrawPage := False;


  if DrawPage and lMainReport.Publisher.CachePages then Exit;
  
  case FPageRequest.PageSetting of
    psSinglePage:
      DrawPage := (AbsolutePageNo = FPageRequest.PageRequested);

    psFirstPage:
      DrawPage := (AbsolutePageNo = 1);

    psLastPage:
      DrawPage := FirstPassCompleted and (AbsolutePageNo = AbsolutePageCount);

    psPageList:
      DrawPage := (AbsolutePageNo = FPageRequest.PageRequested);

  end; {case, page settting type}


end; {procedure, InitDrawPage}

{------------------------------------------------------------------------------}
{ TppEngine.ResetFromPageNo }

procedure TppEngine.ResetFromPageNo(aAbsolutePageNo: Longint);
begin

  if (aAbsolutePageNo = 0) then
    begin
      AbsolutePageNo := 0;
      AbsolutePageCount := 0;

      State := [];

      PrintCondition := [];
    end
  else
    AbsolutePageCount := aAbsolutePageNo;

  Page.FreeDrawCommands;

  FirstPassCompleted := False;
  FFirstPassCompleted2 := False;
  FSecondPassStarted := False;

end; {procedure, ResetFromPageNo}

{------------------------------------------------------------------------------}
{ TppEngine.Init }

procedure TppEngine.Init;
begin

  if (esInitialized in State) then Exit; {4.06}

  {open the data pipelines, must do this before calling subreports - 4.23}
  IssueDataPipelineCommand(ppdcOpen);

  {notify all objects in report that report has started}
  if (Report is TppReport) and not(Report.PrintingAsSubReport) and not(FMainReportStarted) then
    begin
      Report.StartOfMainReport;

      FMainReportStarted := True;

      Report.TriggerCodeModuleCreate;
    end;

  {notify any subreports, one level down}
  Report.StartOfParentReport;

  {indicate that engine has been run}
  PrintCondition := [];
  State := [];

  {clear cache}
  DoOnResetCache;

  {reset first pass complete indicator}
  FFirstPassStarted := False;
  FirstPassCompleted := False;
  FFirstPassCompleted2 := False;
  FSecondPassStarted := False;

  {must do this here, in case engine exits due to no data}
  SpaceUsed := 0;

  {open the data pipelines}
  IssueDataPipelineCommand(ppdcOpen);

  {init data traversal vars}
  AllDataTraversed := False;
  FTraversedDetail := False;
  FTraversedMaster := False;
  AdvanceRecord := False;
  CalcsOutOfSync := False;

  {indicate whether this is a master/detail report}
  FMasterDetailReport := (FMasterDataPipeline <> nil) and (FDetailDataPipeline <> nil);

  {exit if master contains no data and SkipWhenNoRecords set to True}
  if (FMasterDataPipeline <> nil) and (FMasterDataPipeline.SkipWhenNoRecords) and
     ((ppdaNoRecords in FMasterDataPipeline.State) or (FMasterDataPipeline.EOF)) then
    begin
      GenerateCompleted := True;
      LastBandGenerated := True;

      Exit;
    end;

  {bookmark current record of all pipelines}
  if (Report is TppReport) then
    IssueDataPipelineCommand(ppdcUpdateCurrentBookmark);

  {default so first call to ComputeCalcs actually works}
  CalcsOutOfSync := True;
  FTraversedMaster := (FMasterDataPipeline <> nil);
  FTraversedDetail := (FDetailDataPipeline <> nil);

  {must do this after opening the data pipelines and before CategorizeBands}
  InitGroups;

  {categorize bands by print condition}
  CategorizeBands;

  {all bands to build object lists}
  InitBands;

  {force group headers to print at beginning of report}
  PCInclude([pppcStartOfGroup]);

  {save time report printing was started}
  {save time report printing was started, used by TppCalc's ctPrintDateTime}
  if (Report is TppReport) and not(Report.PrintingAsSubReport) then
    PrintDateTime := Now
  else
    PrintDateTime := Report.MainReport.PrintDateTime;

  {indicate that engine has been initialized}
  ESInclude([esInitialized, esFirstPass]);

  {init band counters}
  ReportBandCount := 0;
  PageBandCount := 0;

  {init page counters}
  AbsolutePageNo := 0;
  AbsolutePageCount := 0;

  {indicate whether this is a columnar report}
  FColumnarReport := (Report.Columns > 1);

  {force title band to print at beginning of report}
  PCInclude([pppcStartOfReport]);

  {write nil info into first cache position, do this after all other initiallization}
  FBandListIndex := cReportHeaderBands;
  FBandIndex := 0;

  SaveEngineState;

  FLastPageGenerated := 0;

  BeforePass;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TppEngine.InitGroups }

procedure TppEngine.InitGroups;

var
  liGroup: Integer;
  liGroups: Integer;
  lGroup: TppGroup;
  liInnerMostNewPage: Integer;
begin

  ControlGroup := nil;
  ControlKeepTogether := nil;

  liGroups := Report.GroupCount - 1;

  if (liGroups = -1) then Exit;

  {init groups & group bands}
  for liGroup := 0 to liGroups do
    begin
      lGroup := Report.Groups[liGroup];

      lGroup.Init;

      if (ControlGroup = nil) and lGroup.NewPage and lGroup.ResetPageNo then
        ControlGroup := lGroup;
    end;

  liInnerMostNewPage := -1;  {4.06}
  
  for liGroup := liGroups downto 0 do
    begin
      lGroup := Report.Groups[liGroup];

      if (lGroup.NewPage) and (lGroup.Index > liInnerMostNewPage) then
        liInnerMostNewPage := lGroup.Index;

      {set the controlling keep together group}
      if (ControlKeepTogether = nil) and lGroup.KeepTogether and not(lGroup.NewPage) then
        ControlKeepTogether := lGroup;
    end;

  {new page group inside a keep together invalidates the keep together}
  if (ControlKeepTogether <> nil) and (ControlKeepTogether.Index < liInnerMostNewPage) then
    ControlKeepTogether := nil;

end; {procedure, InitGroups}

{------------------------------------------------------------------------------}
{ TppEngine.InitBands }

procedure TppEngine.InitBands;
var
  liBand: Integer;
begin

  {init bands}
  for liBand := 0 to (Report.BandCount - 1) do
    Report.Bands[liBand].Init;

end; {procedure, InitBands}

{------------------------------------------------------------------------------}
{ TppEngine.ComputeCalcs }

procedure TppEngine.ComputeCalcs;
var
  liBand: Integer;
  lMasterPipeline: TppDataPipeline;
  lDetailPipeline: TppDataPipeline;
begin

  {trigger traversal events}
  if FTraversedMaster then
    begin
      FMasterDataPipeline.DoOnTraversal;

      lMasterPipeline := FMasterDataPipeline;
    end
  else
    lMasterPipeline := nil;

  if FTraversedDetail then
    begin
      FDetailDataPipeline.DoOnTraversal;

      lDetailPipeline := FDetailDataPipeline;
    end
  else
    lDetailPipeline := nil;

  {compute all DBText(for SuppressRepeatedValue) and DBCalcs}
  for liBand := 0 to (Report.BandCount - 1) do
    Report.Bands[liBand].ComputeCalcs(lMasterPipeline, lDetailPipeline);

 { if (FMasterDataPipeline <> nil) or (FDetailDataPipeline <> nil) then} {4.23}

  {notify all components of traversal}
  SendEventNotify(Self, ciTraversal, nil);

end; {procedure, ComputeCalcs}

{------------------------------------------------------------------------------}
{ TppEngine.PageStart }

procedure TppEngine.PageStart;

var
  liBand: Integer;
begin

  for liBand := 0 to (Report.BandCount - 1) do
    Report.Bands[liBand].PageStart;

end; {procedure, PageStart}

{------------------------------------------------------------------------------}
{ TppEngine.CategorizeBands }

procedure TppEngine.CategorizeBands;
var
  liBand: Integer;
  liBands: Integer;
  lBand: TppCustomBand;
  lPrintCondition: TppPrintConditions;
begin

 if (Report.BandCount = 0) then
    Report.CreateDefaultBands;
 {   Report.RaiseException(EPrintError.Create(ppLoadStr(1022)));} {'No bands for this report.'}

  {clear previous band lists}
  ClearBandLists;

  FMasterBandList.Clear;

  {load bands into string list}
  for liBand := 0 to (Report.BandCount - 1) do
    begin
      lBand := TppCustomBand(Report.Bands[liBand]);

      if lBand.Height > Page.PageDef.mmPrintableHeight then
        Report.RaiseException(EPrintError.Create(ppLoadStr(44)));

      FMasterBandList.AddObject(lBand.Rank, lBand);

    end;

  {put bands in print order}
  FMasterBandList.Sort;

  liBands := FMasterBandList.Count;

  {load bands into page lists, based on sorted order}
  for liBand := 0 to  liBands - 1 do
    begin
      lBand := TppCustomBand(FMasterBandList.Objects[liBand]);

      lPrintCondition := lBand.PrintCondition;

      if (pppcStartOfReport in lPrintCondition) then
        FReportHeaderBands.Add(lBand)

      else if (pppcStartOfGroup in lPrintCondition) then
        FGroupHeaderBands.Add(lBand)

      else if (pppcStartOfPage in lPrintCondition) then
        FPageHeaderBands.Add(lBand)

      else if (pppcStartOfColumn in lPrintCondition) then
        FColumnHeaderBands.Add(lBand)

      else if (pppcOnTraversal in lPrintCondition) then
        FDetailBands.Add(lBand)

      else if (pppcEndOfGroup in lPrintCondition) then
        FGroupFooterBands.Add(lBand)

      else if (pppcEndOfColumn in lPrintCondition) then
        FColumnFooterBands.Add(lBand)

      else if (pppcEndOfPage in lPrintCondition) then
        FPageFooterBands.Add(lBand)

      else if (pppcEndOfReport in lPrintCondition) then
        FReportFooterBands.Add(lBand);

    end; {for, each band in sorted list}

  {determine last band of report}
  if (FReportFooterBands.Count > 0) then
    FLastBand := TppCustomBand(FReportFooterBands[FReportFooterBands.Count - 1])

  else if (FGroupFooterBands.Count > 0) then
    FLastBand := TppCustomBand(FGroupFooterBands[FGroupFooterBands.Count - 1])

  else if (FDetailBands.Count > 0) then
    FLastBand := TppCustomBand(FDetailBands[FDetailBands.Count - 1])

  else
    FLastBand := nil;

end; {procedure, CategorizeBands}

{------------------------------------------------------------------------------}
{ TppEngine.ClearBandLists }

procedure TppEngine.ClearBandLists;
begin

  FReportHeaderBands.Clear;
  FPageHeaderBands.Clear;
  FColumnHeaderBands.Clear;
  FGroupHeaderBands.Clear;
  FDetailBands.Clear;
  FGroupFooterBands.Clear;
  FColumnFooterBands.Clear;
  FPageFooterBands.Clear;
  FReportFooterBands.Clear;

end; {procedure, ClearBandLists}

{------------------------------------------------------------------------------}
{ TppEngine.SaveToCache }

procedure TppEngine.SaveToCache(aCachePageNo: Longint);
var
  lRec: TppEngineSaveRec;
begin

  lRec.FAdvanceRecord      := AdvanceRecord;
  lRec.FAllDataTraversed   := AllDataTraversed;
  lRec.FBandListIndex      := FBandListIndex;
  lRec.FBandIndex          := FBandIndex;
  lRec.FCalcsOutOfSync     := CalcsOutOfSync;
  lRec.FReportBandCount    := ReportBandCount;
  lRec.FTraversedMaster    := FTraversedMaster;
  lRec.FTraversedDetail    := FTraversedDetail;

  {save engine states}
  lRec.FNoData  := (esNoData in State);
  lRec.FInitialized  := (esInitialized in State);
  {lRec.FFirstPass  := (esFirstPass in State);}

  lRec.FPrintingSummary  := (esPrintingSummary in State);
  lRec.FPrintingTitle    := (esPrintingTitle in State);

  lRec.FStartSection     := (esStartSection in State);
  lRec.FGenerateSection  := (esGenerateSection in State);

  {save print conditions}
  lRec.FStartOfReport := (pppcStartOfReport in PrintCondition);
  lRec.FStartOfPage   := (pppcStartOfPage in PrintCondition);
  lRec.FStartOfColumn := (pppcStartOfColumn in PrintCondition);
  lRec.FStartOfGroup  := (pppcStartOfGroup in PrintCondition);
  lRec.FOnTraversal   := (pppcOnTraversal in PrintCondition);
  lRec.FEndOfGroup    := (pppcEndOfGroup in PrintCondition);
  lRec.FEndOfColumn   := (pppcEndOfColumn in PrintCondition);
  lRec.FEndOfPage     := (pppcEndOfPage in PrintCondition);
  lRec.FEndOfReport   := (pppcEndOfReport in PrintCondition);

  WriteRecordToCache(aCachePageNo, lRec);

end; {procedure, SaveToCache}

{------------------------------------------------------------------------------}
{ TppEngine.RestoreFromCache }

procedure TppEngine.RestoreFromCache(aCachePageNo: Longint);
var
  lRec: TppEngineSaveRec;
begin

  ReadRecordFromCache(aCachePageNo, lRec);

  {set current band}
  AdvanceRecord          := lRec.FAdvanceRecord;
  AllDataTraversed       := lRec.FAllDataTraversed;
  FBandListIndex         := lRec.FBandListIndex;
  FBandIndex             := lRec.FBandIndex;
  CalcsOutOfSync         := lRec.FCalcsOutOfSync;
  ReportBandCount        := lRec.FReportBandCount;
  FTraversedMaster       := lRec.FTraversedMaster;
  FTraversedDetail       := lRec.FTraversedDetail;

  if lRec.FInitialized then ESInclude([esInitialized]) else ESExclude([esInitialized]);
  {if lRec.FFirstPass then ESInclude([esFirstPass]) else ESExclude([esFirstPass]);}
  if lRec.FNoData then ESInclude([esNoData]) else ESExclude([esNoData]);
  if lRec.FPrintingTitle then ESInclude([esPrintingTitle]) else ESExclude([esPrintingTitle]);
  if lRec.FPrintingSummary then ESInclude([esPrintingSummary]) else ESExclude([esPrintingSummary]);
  if lRec.FStartSection then ESInclude([esStartSection]) else ESExclude([esStartSection]);
  if lRec.FGenerateSection then ESInclude([esGenerateSection]) else ESExclude([esGenerateSection]);

  {restore print conditions}
  PrintCondition := [];

  if lRec.FStartOfReport then PCInclude([pppcStartOfReport]);
  if lRec.FStartOfPage   then PCInclude([pppcStartOfPage]);
  if lRec.FStartOfColumn then PCInclude([pppcStartOfColumn]);
  if lRec.FStartOfGroup  then PCInclude([pppcStartOfGroup]);
  if lRec.FOnTraversal   then PCInclude([pppcOnTraversal]);
  if lRec.FEndOfGroup    then PCInclude([pppcEndOfGroup]);
  if lRec.FEndOfColumn   then PCInclude([pppcEndOfColumn]);
  if lRec.FEndOfPage     then PCInclude([pppcEndOfPage]);
  if lRec.FEndOfReport   then PCInclude([pppcEndOfReport]);

end; {procedure, RestoreFromCache}

{------------------------------------------------------------------------------}
{ TppEngine.GetCurrentBand }

function  TppEngine.GetCurrentBand: TppBand;
begin
  Result := FCurrentBand;
end; {function, GetCurrentBand}

{------------------------------------------------------------------------------}
{ TppEngine.GetCurrentBandListIndex }

function  TppEngine.GetCurrentBandListIndex: Integer;
begin
  Result := FBandListIndex;
end; {function, GetCurrentBandListIndex}

{------------------------------------------------------------------------------}
{ TppEngine.GetPageStarted }

function TppEngine.GetPageStarted: Boolean;
begin

  Result := inherited GetPageStarted;

  {if not page started, check to see if parent has page started}
  if not(Result) and (Report.ParentReport <> nil) then
    Result := Report.ParentReport.Engine.PageStarted;

end; {function, GetPageStarted}

{------------------------------------------------------------------------------}
{ TppEngine.SetPageStarted }

procedure TppEngine.SetPageStarted(aValue: Boolean);
var
  liBandListIndex: Integer;
  lCurrentBand: TppBand;
begin

  inherited SetPageStarted(aValue);

  {if page started, make sure parent report knows about it}
  if (aValue) and (Report.ParentReport <> nil) then
    begin
      liBandListIndex := Report.ParentReport.Engine.CurrentBandListIndex;
      lCurrentBand := Report.ParentReport.Engine.CurrentBand;

      if not(liBandListIndex = cReportHeaderBands) and
         not(liBandListIndex = cPageHeaderBands) and
         not(liBandListIndex = cColumnHeaderBands) and
         not((liBandListIndex = cGroupHeaderBands) and
             (lCurrentBand is TppGroupBand) and (TppGroupBand(lCurrentBand).Group.ReprintOnSubsequentPage)) then
        Report.ParentReport.Engine.SetPageStarted(aValue);
    end;

end; {procedure, SetPageStarted}

{------------------------------------------------------------------------------}
{ TppEngine.GetPageNo }

function TppEngine.GetPageNo: Longint;
var
  lTitleBand: TppBand;
begin

  {if title band is cover page, then page numbering cannot be controlled by group}
  lTitleBand := Report.GetBand(btTitle, 0);

  if (Report.AbsolutePageNo = 1) and (lTitleBand <> nil) and (TppTitleBand(lTitleBand).NewPage) then
    Result := inherited GetPageNo

  {if group is controlling page numbers, get page number from group}
  else if Printing and (ControlGroup <> nil) then
    Result := ControlGroup.PageNo

  else
    Result := inherited GetPageNo;

end; {function, GetPageNo}

{------------------------------------------------------------------------------}
{ TppEngine.GetPageCount }

function TppEngine.GetPageCount: Longint;
var
  lTitleBand: TppBand;
begin

  {if title band is cover page, then page numbering cannot be controlled by group}
  lTitleBand := Report.GetBand(btTitle, 0);

  if (Report.AbsolutePageNo = 1) and (lTitleBand <> nil) and (TppTitleBand(lTitleBand).NewPage) then
    begin
      if (ControlGroup <> nil) then
        Result := inherited GetPageNo
      else
        Result := inherited GetPageCount;
    end

  {if group is controlling page numbers, get page count from group}
  else if Printing and (ControlGroup <> nil) then
    Result := ControlGroup.PageCount

  else
    Result := inherited GetPageCount;

end; {function, GetPageCount}

{------------------------------------------------------------------------------}
{ TppEngine.GetPageBottom }

function TppEngine.GetPageBottom: Longint;
var
  liBand: Integer;
  lBand: TppCustomBand;
  lFooterBand: TppFooterBand;
begin

  {4.06 - modified to take footer band visibility into account}

  Result := 0;

  if (Report = nil) then Exit;

  Result := Page.PageDef.mmHeight - Page.PageDef.mmMarginBottom;

  {reduce for height used by column footers}
  for liBand := 0 to FColumnFooterBands.Count - 1 do
    begin
      lBand := TppCustomBand(FColumnFooterBands[liBand]);

      if (lBand.Visible) then
        Result := Result - lBand.mmHeight;
    end;

  {reduce for height used by page footers}
  for liBand := 0 to FPageFooterBands.Count - 1 do
    begin
      lFooterBand := TppFooterBand(FPageFooterBands[liBand]);

      if not(lFooterBand.PrintOnLastPage) and ((LastBandGenerated) or (esPrintingSummary in State)) and
         (AbsolutePageNo = AbsolutePageCount) then
        {do nothing}
      else if (lFooterBand.Visible) then
        Result := Result - lFooterBand.mmHeight;
    end;

end; {function, GetPageBottom}

{------------------------------------------------------------------------------}
{ TppEngine.TraverseData }

procedure TppEngine.TraverseData;
begin

  CheckForGroupBreaks := True;

  {update states}
  if (pppcStartOfReport in PrintCondition) then
    GenerateStarted := True;

  PCExclude([pppcStartOfPage, pppcStartOfColumn, pppcStartOfGroup]);

  {set print condition to traversal only, do this before checking AllDataTraversed}
  PCInclude([pppcOnTraversal]);

  {check this separately from MasterPipeline, in case DonePrinting has set the value}
  if (AllDataTraversed) then Exit;

  {move to next record}
  NextRecord;

  {4.06, modified to call PriorRecord only when not EOF}

  {set indicator here}
  if ((FMasterDataPipeline <> nil) and (FMasterDataPipeline.EOF)) then
    begin
      AllDataTraversed := True;

      PCInclude([pppcEndOfReport, pppcEndOfGroup]);

      {if (FMasterDetailReport) then} {4.21, always goto last record after EOF}

      TraverseMaster(pptdBackward);
    end

  {we've got a group break, so step one record back}
  else if (pppcEndOfGroup in PrintCondition) then
    PriorRecord
    
  else
    CalcsOutOfSync := True;


end; {procedure, TraverseData}

{------------------------------------------------------------------------------}
{ TppEngine.SyncData }

procedure TppEngine.SyncData;
var
  liGroup: Integer;
begin

  if not(AdvanceRecord) and not(CalcsOutOfSync) then Exit;

  CheckForGroupBreaks := False;

  {we're about to print group headers, so step forward}
  if AdvanceRecord then
    begin
      AdvanceRecord := False;
      CalcsOutOfSync := False;

      {move to next record}
      NextRecord;

      {compute value of calc components}
      ComputeCalcs;

      {indicate group footers have completed}
      if not(pppcEndOfReport in PrintCondition) then
        PCExclude([pppcEndofGroup]);

      {set print condition for group header and detail band printing}
      PCInclude([pppcStartOfGroup, pppcOnTraversal]);
    end

  else if CalcsOutOfSync then
    begin
      CalcsOutOfSync := False;

      {compute value of calc components}
      ComputeCalcs;
    end;

  {refresh group values, must do this after start page}
  for liGroup := 0 to Report.GroupCount - 1 do
    Report.Groups[liGroup].RefreshBreakValues;

end; {procedure, SyncData}

{------------------------------------------------------------------------------}
{ TppEngine.NextRecord }

procedure TppEngine.NextRecord;
begin

  {track minimum breaking group no}
  FMinGroupNo := Report.GroupCount;

  if not(FMasterDetailReport) then
    begin
      TraverseMaster(pptdForward);

      CheckGroups(FMasterDataPipeline);
    end

  else
    NextMDRecord;

  {force group breaks}
  if (FMinGroupNo <> Report.GroupCount) then
    begin
      ForceGroupBreaks;

      PCInclude([pppcStartOfGroup, pppcEndOfGroup]);
    end;

end; {procedure, NextRecord}

{------------------------------------------------------------------------------}
{ TppEngine.NextMDRecord }

procedure TppEngine.NextMDRecord;
var
  lbTraverseMaster: Boolean;
  lbTraverseDetail: Boolean;
begin

  {determine which DataPipelines should be traversed}
  lbTraverseMaster := (FMasterDataPipeline <> nil) and
                       not(ppdaNoRecords in FMasterDataPipeline.State) and
                       not(ppdaLastRecord in FMasterDataPipeline.State);

  lbTraverseDetail := (FDetailDataPipeline <> nil) and
                       not(ppdaNoRecords in FDetailDataPipeline.State) and
                       not(ppdaLastRecord in FDetailDataPipeline.State);

  {traverse record}
  if (lbTraverseDetail) then
    begin
      FDetailDataPipeline.Next;

      FTraversedDetail := True;
      FTraversedMaster := False;

      {allow detail pipeline groups to break}
      CheckGroups(FDetailDataPipeline);

      {allow master pipeline groups to break}
      if FDetailDataPipeline.EOF then
        begin
          FTraversedDetail := False;

          TraverseMaster(pptdForward);

          CheckGroups(FMasterDataPipeline);
        end;

    end

  else if (lbTraverseMaster) then
    begin
      TraverseMaster(pptdForward);

      CheckGroups(FMasterDataPipeline);
    end;

end; {procedure, NextMDRecord}

{------------------------------------------------------------------------------}
{ TppEngine.PriorRecord }

procedure TppEngine.PriorRecord;
begin

  if not(FMasterDetailReport) then
    TraverseMaster(pptdBackward)

  else
    PriorMDRecord;

end; {procedure, PriorRecord}

{------------------------------------------------------------------------------}
{ TppEngine.PriorMDRecord }

procedure TppEngine.PriorMDRecord;
var
  lbTraverseMaster: Boolean;
  lbTraverseDetail: Boolean;
begin
  {determine which DataPipelines should be traversed}
  lbTraverseMaster := (FMasterDataPipeline <> nil) and
                      not(ppdaFirstRecord in FMasterDataPipeline.State) and
                      not(ppdaNoRecords in FMasterDataPipeline.State);

  lbTraverseDetail := (FDetailDataPipeline <> nil) and
                      not(ppdaFirstRecord in FDetailDataPipeline.State) and
                      not(ppdaNoRecords in FDetailDataPipeline.State);

  {traverse record}
  if (lbTraverseDetail) then
    begin
      if FDetailDataPipeline.EOF then
        FDetailDataPipeline.Last
      else
        FDetailDataPipeline.Prior;
    end

  else if lbTraverseMaster then
    TraverseMaster(pptdBackward);

end; {procedure, PriorMDRecord

{------------------------------------------------------------------------------}
{ TppEngine.TraverseMaster }

procedure TppEngine.TraverseMaster(aDirection: TppTraversalDirectionType);
begin

  if (FMasterDataPipeline = nil) then Exit;

  case aDirection of

    pptdForward:
      begin
        FMasterDataPipeline.Next;

        FTraversedMaster := True;

        if (FDetailDataPipeline <> nil) then
          begin

            FDetailDataPipeline.First;

            FTraversedDetail := True;

            if (ppdaNoRecords in FDetailDataPipeline.State) and (FDetailDataPipeline.SkipWhenNoRecords)then

              while (ppdaNoRecords in FDetailDataPipeline.State) and not(FMasterDataPipeline.EOF) do
                begin
                  FMasterDataPipeline.Skip;
                  FDetailDataPipeline.First;
                end;

          end;

      end;

    pptdBackward:
      begin
        if FMasterDataPipeline.EOF then
          FMasterDataPipeline.Last
        else
          FMasterDataPipeline.Prior;

        if (FDetailDataPipeline <> nil) then
          begin
            FDetailDataPipeline.Last;

            if (ppdaNoRecords in FDetailDataPipeline.State) and (FDetailDataPipeline.SkipWhenNoRecords) then

              while (ppdaNoRecords in FDetailDataPipeline.State) and not(FMasterDataPipeline.BOF) do
                begin
                  FMasterDataPipeline.SkipBack;
                  FDetailDataPipeline.Last;
                end;

          end;
      end;

    end; {case, traversal direction}

end; {procedure, TraverseMaster}

{------------------------------------------------------------------------------}
{ TppEngine.IssueDataPipelineCommand }

procedure TppEngine.IssueDataPipelineCommand(aCommand: TppDataPipelineCommandType);
var
  liDataPipeline: Integer;
  lDataPipeline: TppDataPipeline;
begin

  ExecuteDataPipelineCommand(aCommand, FMasterDataPipeline);

  if (aCommand = ppdcRestore) then Exit;

  ExecuteDataPipelineCommand(aCommand, FDetailDataPipeline);

  for liDataPipeline := (FLookupDataPipelines.Count - 1) downto 0 do
    begin
      lDataPipeline := TppDataPipeline(FLookupDataPipelines[liDataPipeline]);

      ExecuteDataPipelineCommand(aCommand, lDataPipeline);

      if (lDataPipeline = nil) then
        FLookupDataPipelines.Delete(liDataPipeline);

    end; {for, each DataPipeline}


  if (aCommand = ppdcOpen) then
    begin
      OpenDataPipelines;
      OpenLookupDataPipelines;
    end;

end; {procedure, DataPipelineCommand}

{------------------------------------------------------------------------------}
{ TppEngine.ExecuteDataPipelineCommand }

procedure TppEngine.ExecuteDataPipelineCommand(aCommand: TppDataPipelineCommandType;
                                               var aDataPipeline: TppDataPipeline);
begin

  if (aDataPipeline = nil) then Exit;

  case aCommand of
    ppdcClear, ppdcOpen:
      begin
        aDataPipeline.RemoveNotify(Self);

        aDataPipeline := nil;
      end;

    ppdcClose:
      begin
        aDataPipeline.RemoveNotify(Self);

        aDataPipeline.Close;

        aDataPipeline := nil;
      end;

    ppdcRestore:
      aDataPipeline.RestoreRecordPosition;

    ppdcUpdateCurrentBookmark:
      aDataPipeline.UpdateCurrentBookmark;

  end; {case, action type}

end; {procedure, ExecuteDataPipelineCommand}

{------------------------------------------------------------------------------}
{ TppEngine.OpenDataPipelines }

procedure TppEngine.OpenDataPipelines;
var
  lDetailBand: TppDetailBand;
begin

  FMasterDataPipeline := Report.DataPipeline;

  if (FMasterDataPipeline <> nil) then
    begin
      FMasterDataPipeline.AddNotify(Self);

      OpenDataPipeline(FMasterDataPipeline);

      FMasterDataPipeline.First;


      FTraversedMaster := True;

      {get detailband}
      lDetailBand := TppDetailBand(Report.GetBand(btDetail, 0));

      if (lDetailBand <> nil) and (lDetailBand.DataPipeline <> FMasterDataPipeline) then
        FDetailDataPipeline := lDetailBand.DataPipeline
      else
        FDetailDataPipeline := nil;

      if (FDetailDataPipeline <> nil) then
        begin

          FDetailDataPipeline.AddNotify(Self);

          OpenDataPipeline(FDetailDataPipeline);

          FDetailDataPipeline.First;


          FTraversedDetail := True;

          while (ppdaNoRecords in FDetailDataPipeline.State) and
                (FDetailDataPipeline.SkipWhenNoRecords) and
                 not(FMasterDataPipeline.EOF) do
            begin
              FMasterDataPipeline.Skip;
              FDetailDataPipeline.First;
            end;

        end; {if, detail data pipeline}

    end; {if, master data pipeline}

  if (FMasterDataPipeline = nil) or
     ((FMasterDataPipeline <> nil) and (ppdaNoRecords in FMasterDataPipeline.State)) then
    ESInclude([esNoData])

  else if (esNoData in State) then
    ESExclude([esNoData]);

end; {procedure, OpenDataPipelines}

{------------------------------------------------------------------------------}
{ TppEngine.OpenLookupDataPipelines }

procedure TppEngine.OpenLookupDataPipelines;
var
  liBand: Integer;
  lBand: TppCustomBand;
  lComponent: TppComponent;
  liComponent: Integer;
  lDataPipeline: TppDataPipeline;
begin

  for liBand := 0 to Report.BandCount - 1 do
    begin
      lBand := TppCustomBand(Report.Bands[liBand]);

      for liComponent := 0 to lBand.ObjectCount - 1 do
        begin
          lComponent := TppComponent(lBand.Objects[liComponent]);
          lDataPipeline := lComponent.DataPipeline;

          if lComponent.IsDataAware and (lDataPipeline <> nil) and
            (lDataPipeline <> FMasterDataPipeline) and (lDataPipeline <> FDetailDataPipeline) then
            lComponent.LookupPipeline := True
          else
            lComponent.LookupPipeline := False;

          if lComponent.LookupPipeline and (FLookupDataPipelines.IndexOf(lDataPipeline) = -1) then
            begin
              OpenDataPipeline(lDataPipeline);

              lDataPipeline.AddNotify(Self);

              FLookupDataPipelines.Add(lDataPipeline);
            end; {if, DataPipeline not in list}

        end; {for, each component}

    end; {for, each band}

end; {procedure, OpenLookupDataPipelines}

{------------------------------------------------------------------------------}
{ TppEngine.OpenDataPipeline }

procedure TppEngine.OpenDataPipeline(aDataPipeline: TppDataPipeline);
begin

  try
    aDataPipeline.Open;
  except on EDataError do
    Report.RaiseException(EPrintError.Create(ppLoadStr(40) + '.'));
  end;

  if not(aDataPipeline.Active) then
    Report.RaiseException(EPrintError.Create(ppLoadStr(40) + '.'));

end; {procedure, OpenDataPipeline}






end.
