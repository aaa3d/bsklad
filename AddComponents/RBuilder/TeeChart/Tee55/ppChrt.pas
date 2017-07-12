{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}


unit ppChrt;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, Graphics, ExtCtrls, SysUtils, Forms, Controls, Dialogs, Menus,
  Chart, EditChar, TeEngine, TeExport,
{$IFDEF Delphi3}
  {$IFDEF Tee40}
    IEdiGene,
  {$ENDIF}
{$ELSE}
  {$IFDEF Tee40}
    TeCanvas, IEdit16,
  {$ENDIF}
{$ENDIF}
  ppClass, ppCtrls, ppTypes, ppUtils, ppDevice, ppDrwCmd, ppDsgnCt, ppClasUt,
  ppRTTI, ppEnum;

type

  TppTeeChartPrintMethodType =(pmBitmap, pmMetafile);

  { TppCustomTeeChart }
  TppCustomTeeChart = class(TppCustomComponent)
    private
      FChart: TCustomChart;
      FDrawCommand: TppDrawImage;
      FPainting: Boolean;
      FPrintMethod: TppTeeChartPrintMethodType;

      procedure SetPrintMethod(aPrintMethod: TppTeeChartPrintMethodType);

      {popup menu event handlers}
      procedure EditMenuClick(Sender: TObject);
      procedure ExportMenuClick(Sender: TObject);

      function GetChart: TCustomChart;

    protected

      procedure CreateChart(var aChart: TCustomChart); virtual; abstract;
      procedure UpdatePropertiesFromChart(aChart: TCustomChart); virtual;

{$IFDEF WIN32}
  {$IFDEF Delphi3}
      procedure GetChildren(Proc: TGetChildProc;Root: TComponent); override;
  {$ELSE}
      procedure GetChildren(Proc: TGetChildProc); override;
  {$ENDIF}

{$ELSE}
      procedure WriteComponents(Writer: TWriter); override;
{$ENDIF}

      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure DblClickEvent(Sender: TObject); virtual;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor  Destroy; override;

      procedure Edit; virtual;
      procedure ChangeOwner(aNewOwner: TComponent); override;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;


      procedure AfterDesignerCreate; override;
      function  HasFont: Boolean; override;
      procedure PaintDesignControl(aCanvas: TCanvas); override;
      procedure PopupMenuClick(Sender: TObject); override;
      procedure SetChartProperty(aChart: TCustomChart);

      property Chart: TCustomChart read GetChart;
      property Painting: Boolean read FPainting;
      property PrintMethod: TppTeeChartPrintMethodType read FPrintMethod write SetPrintMethod default pmMetafile;

  end; {class, TppCustomTeeChart}

  { TppTeeChart }
  TppTeeChart = class(TppCustomTeeChart)
    protected
      procedure CreateChart(var aChart: TCustomChart); override;

    published
      property Chart;
      property PrintMethod;
      property Visible;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;
  end; {class, TppTeeChart}

  { TppTeeChartControl }
  TppTeeChartControl = class(TCustomChart)
    private
      FStreamingParent: TComponent;

      procedure SetStreamingParent(aParent: TComponent);

    protected

{$IFDEF WIN32}
      procedure SetParentComponent(Value: TComponent); override;
{$ENDIF}
      procedure ReadState(Reader: TReader); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  HasParent: Boolean; override;
{$IFDEF WIN32}
      function  GetParentComponent: TComponent; override;
{$ENDIF}

      property StreamingParent: TComponent read FStreamingParent write SetStreamingParent;

    published
      { TCustomChart Properties }
      property BackImage;
      property BackImageInside;
      property BackImageMode;
      property BottomWall;
      property Foot;
      property Gradient;
      property LeftWall;
      property MarginBottom;
      property MarginLeft;
      property MarginRight;
      property MarginTop;
      property Title;

      { TCustomAxisPanel properties }
      property AxisVisible;
      property BackColor;
      property BottomAxis;
      property Chart3DPercent;
      property ClipPoints;
      property Frame;
      property LeftAxis;
      property Legend;
      property MaxPointsPerPage;
      property Page;
      property RightAxis;
      property ScaleLastPage;
      property SeriesList;
      property TopAxis;
      property View3D;
      property View3DWalls;

      { TPanel properties }
      property BevelInner;
      property BevelWidth;
      property BevelOuter;
      property BorderWidth;
      property BorderStyle;
      property Color;

  end; {class, TppTeeChartControl}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTppCustomTeeChartRTTI }
  TraTppCustomTeeChartRTTI = class(TraTppComponentRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCustomTeeChartRTTI}

implementation

uses TeeConst;

{******************************************************************************
 *
 ** T E E   C H A R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.Create }

constructor TppCustomTeeChart.Create(aOwner: TComponent);
var
  llHeight: Longint;
  llWidth: Longint;
begin

  inherited Create(aOwner);

  DrawCommandClass := TppDrawImage;

  FChart := nil;
  FPainting := False;
  FPrintMethod := pmMetafile;

  {default width and height}
  llWidth  := ppToMMThousandths(3.6458, utInches, pprtHorizontal, nil);
  llHeight := ppToMMThousandths(2.083, utInches, pprtVertical, nil);

  spWidth  := Round(ppToScreenPixels(llWidth, utMMThousandths, pprtHorizontal, nil));
  spHeight := Round(ppToScreenPixels(llHeight, utMMThousandths, pprtVertical, nil));


  {note: this is critical, when the Owner sends free notification
         the chart control must be destroyed to avoid a Delphi design-time AV}
  if (Owner <> nil) then
    Owner.FreeNotification(Self);

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.Destroy }

destructor TppCustomTeeChart.Destroy;
begin

  FChart.Free;

  inherited Destroy;
   
end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppCustomTeeChart.Notification }

procedure TppCustomTeeChart.Notification(aComponent: TComponent; Operation: TOperation);
begin

  inherited Notification(aComponent, Operation);

 { if (Operation = opRemove) then
    ShowMessage(aComponent.ClassName + ': ' + aComponent.Name);
  }

  if (Operation = opRemove) and (aComponent = Owner) then
    begin
      FChart.Free;
      FChart := nil;
    end;

end; {procedure, Notification}



{------------------------------------------------------------------------------}
{ TppCustomTeeChart.GetChart }

function TppCustomTeeChart.GetChart: TCustomChart;
begin
  if (FChart = nil) then
    CreateChart(FChart);

  Result := FChart;

end; {procedure, GetChart}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.SetChartProperty }

procedure TppCustomTeeChart.SetChartProperty(aChart: TCustomChart);
begin
  FChart := aChart;

end; {procedure, SetChartProperty}


{------------------------------------------------------------------------------}
{ TppCustomTeeChart.AfterDesignerCreate }

procedure TppCustomTeeChart.AfterDesignerCreate;
begin
  CreateChart(FChart);
end; {procedure, AfterDesignerCreate}


{------------------------------------------------------------------------------}
{ TppCustomTeeChart.ChangeOwner }

procedure TppCustomTeeChart.ChangeOwner(aNewOwner: TComponent);
var
  liIndex: Integer;
  
begin

  if (csDestroying in ComponentState) then Exit;

  if (aNewOwner = Owner) then Exit;

  if (FChart <> nil) and (FChart.Owner = Owner) then
    begin
      if Owner <> nil then
        Owner.RemoveComponent(FChart);

      if (aNewOwner <> nil) then
        aNewOwner.InsertComponent(FChart);

      for liIndex := 0 to FChart.SeriesCount-1 do
        if FChart.Series[liIndex].Owner = Owner then
          begin
            if (Owner <> nil) then
              Owner.RemoveComponent(FChart);

            if (aNewOwner <> nil) then
              aNewOwner.InsertComponent(FChart);

          end;

    end;


   inherited ChangeOwner(aNewOwner);

end; {procedure, ChangeOwner}


{------------------------------------------------------------------------------}
{ TppCustomTeeChart.SetPrintMethod }

procedure TppCustomTeeChart.SetPrintMethod(aPrintMethod: TppTeeChartPrintMethodType);
begin

  if (aPrintMethod = FPrintMethod) then Exit;

  FPrintMethod := aPrintMethod;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

end; {procedure, SetPrintMethod}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.PropertiesToDrawCommand }

procedure TppCustomTeeChart.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lMetafile: TMetafile;
  lBitmap: TBitmap;
  lRect: TRect;
  lDrawCommand: TppDrawImage;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  if not(aDrawCommand is TppDrawImage) or (FChart = nil) then Exit;

  lDrawCommand := TppDrawImage(aDrawCommand);

  lDrawCommand.Left   := PrintPosRect.Left;
  lDrawCommand.Top    := PrintPosRect.Top;
  lDrawCommand.Height := PrintPosRect.Bottom - PrintPosRect.Top;
  lDrawCommand.Width  := PrintPosRect.Right - PrintPosRect.Left;

  {indicate that DrawImage should use StretchDraw}
  lDrawCommand.DirectDraw := True;

  lRect.Left   := 0;
  lRect.Top    := 0;
  lRect.Right  := spWidth;
  lRect.Bottom := spHeight;

  case FPrintMethod of

    pmMetafile:
      begin
        lMetafile := FChart.TeeCreateMetafile(True, lRect);

        lDrawCommand.Picture.Graphic := lMetafile;

        lMetaFile.Free;
      end;

    pmBitmap:
      begin
        lBitmap := TBitmap.Create;

        lBitmap.Height := spHeight;
        lBitmap.Width := spWidth;

        FChart.Draw(lBitmap.Canvas, lRect);

        lDrawCommand.Picture.Graphic := lBitmap;

        lBitmap.Free;
        
      end;

  end; {case, print method type}

end; {procedure, PropertiesToDrawCommand}


{------------------------------------------------------------------------------}
{ TppCustomTeeChart.UpdatePropertiesFromChart }

procedure TppCustomTeeChart.UpdatePropertiesFromChart(aChart: TCustomChart);
begin
  Visible := aChart.Visible;
end; {procedure, UpdatePropertiesFromChart}


{------------------------------------------------------------------------------}
{ TppCustomTeeChart.HasFont }

function TppCustomTeeChart.HasFont: Boolean;
begin
  Result := False;
end;

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.PaintDesignControl }

procedure TppCustomTeeChart.PaintDesignControl(aCanvas: TCanvas);
begin

  if FPainting then Exit;

  FPainting := True;

  try

    if FDrawCommand = nil then
      FDrawCommand := TppDrawImage.Create(nil);


    {set print position}
    PrintPosRect := ppRect(0, 0, mmWidth, mmHeight);

    {assign draw command properties}
    PropertiesToDrawCommand(FDrawCommand);

    {draw to the canvas}
    aCanvas.StretchDraw(spClientRect, FDrawCommand.Picture.Graphic);

  finally

    FPainting := False;

  end;

end; {procedure, PaintDesignControl}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.CreatePopupMenu }

procedure TppCustomTeeChart.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(25, 'Edit', '',  495);
  aPopupMenu.AddItem(25, 'Export', '',  496);
  aPopupMenu.AddItem(26, 'ChartLine1', '-',  0);

  aPopupMenu.AddItem(40, 'ChartLine2', '-',  0);
  aPopupMenu.AddItem(41, 'Version', TeeMsg_Version,  0);
  aPopupMenu.AddItem(41, 'VersionCopyRight', TeeMsg_Copyright,  0);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.PopupMenuClick }

procedure TppCustomTeeChart.PopupMenuClick(Sender: TObject);
var
  lPopupMenu: TppPopupMenu;
  
begin

  inherited PopupMenuClick(Sender);

  lPopupMenu := TppPopupMenu(Sender);

  lPopupMenu.ItemByName('Edit').OnClick    := EditMenuClick;
  lPopupMenu.ItemByName('Export').OnClick  := ExportMenuClick;

end; {procedure, PopupMenuClick}


{------------------------------------------------------------------------------}
{ TppCustomTeeChart.Edit }

procedure  TppCustomTeeChart.Edit;
{$IFDEF Tee40}
var
  lChartPart: TChartClickedPart;
{$ENDIF}


begin

  if (FChart = nil) then Exit;

{$IFDEF Tee40}

  FChart.CalcClickedPart(FChart.GetCursorPos, lChartPart);
  EditChartPart(nil, FChart, lChartPart);

{$ELSE}
  EditChart(nil, FChart);

{$ENDIF}


  {update props}
  UpdatePropertiesFromChart(FChart);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

  {repaint control}
  InvalidateDesignControl;


end; {procedure, Edit}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.EditMenuClick }

procedure TppCustomTeeChart.EditMenuClick(Sender: TObject);
begin
  Edit;

end; {procedure, EditMenuClick}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.ExportMenuClick }

procedure TppCustomTeeChart.ExportMenuClick(Sender: TObject);
begin
  ChartExport(nil, FChart);
end; {procedure, ExportMenuClick}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.DblClickEvent }

procedure TppCustomTeeChart.DblClickEvent(Sender: TObject);
begin

  Edit;

end; {procedure, DblClickEvent}

{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.GetChildren }

{$IFDEF Delphi3}
   procedure TppCustomTeeChart.GetChildren(Proc: TGetChildProc; Root: TComponent);
{$ELSE}
   procedure TppCustomTeeChart.GetChildren(Proc: TGetChildProc);
{$ENDIF}

begin

  {write report}
  if (FChart <> nil) then
    Proc(FChart);

end;



{$ELSE}

{------------------------------------------------------------------------------}
{ TppCustomTeeChart.WriteComponents }

procedure TppCustomTeeChart.WriteComponents(Writer: TWriter);
begin

  if (FChart <> nil) then
    Writer.WriteComponent(FChart);

end; {procedure, WriteComponents}


{$ENDIF}


{******************************************************************************
 *
 ** T E E   C H A R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTeeChart.CreateChart }

procedure TppTeeChart.CreateChart(var aChart: TCustomChart);
begin

  {create & configure tee chart control}

  {note: create with a nil owner and then insert into the Owner
         at the bottom of this procedure - this avoids D5 lockup}

  aChart := TppTeeChartControl.Create(nil);

  TppTeeChartControl(aChart).StreamingParent := Self;

  {use global parent window as the parent}
  aChart.Parent := ppParentWnd;

  aChart.Name := GetValidName(aChart);

  aChart.Title.Text.Clear;
  aChart.Title.Text.Add('Chart');
  aChart.Foot.Font.Color := clRed;
  aChart.Foot.Font.Style :=[fsItalic];
  aChart.Color := clWhite;
  aChart.BevelOuter := bvNone;
  aChart.BufferedDisplay := False;

  if Owner <> nil then
    Owner.InsertComponent(aChart);
  
end; {procedure, CreateChart}


{******************************************************************************
 *
 ** T E E   C H A R T   C O N T R O L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.Create }

constructor TppTeeChartControl.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FStreamingParent := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.Destroy }

destructor TppTeeChartControl.Destroy;
begin

  {remove from parent}
  SetStreamingParent(nil);

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppTeeChartControl.SetStreamingParent }

procedure TppTeeChartControl.SetStreamingParent(aParent: TComponent);
begin

  if (FStreamingParent <> nil) and (FStreamingParent is TppCustomTeeChart) then
    TppCustomTeeChart(FStreamingParent).SetChartProperty(nil);

  FStreamingParent := aParent;

  if (FStreamingParent <> nil) and (FStreamingParent is TppCustomTeeChart) then
    TppCustomTeeChart(FStreamingParent).SetChartProperty(Self);

end; {procedure, SetStreamingParent}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.HasParent }

function TppTeeChartControl.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.GetParentComponent - required method for Components with HasParent = True }

function TppTeeChartControl.GetParentComponent: TComponent;
begin
  Result := FStreamingParent;
end;

{------------------------------------------------------------------------------}
{ TppTeeChartControl.SetParentComponent - required method for Components with HasParent = True }

procedure TppTeeChartControl.SetParentComponent(Value: TComponent);
begin
  if (Value is TppCustomTeeChart) then
    SetStreamingParent(Value);

end;

{$ENDIF}

{------------------------------------------------------------------------------}
{ TppTeeChartControl.ReadState }

procedure TppTeeChartControl.ReadState(Reader: TReader);
begin

{$IFDEF WINDOWS}
  if (Reader.Parent is TppCustomTeeChart) then
    SetStreamingParent(Reader.Parent);
{$ENDIF}

  inherited ReadState(Reader);

  {use global parent window as the parent}
  Parent := ppParentWnd;

end;



{******************************************************************************
 *
 *
 *
 ** R T T I
 *
 *
 *
{******************************************************************************}

{******************************************************************************
 *
 ** C U S T O M   T E E   C H A R T   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCustomTeeChartRTTI.RefClass }

class function TraTppCustomTeeChartRTTI.RefClass: TClass;
begin
  Result := TppCustomTeeChart;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCustomTeeChartRTTI.GetPropList }

class procedure TraTppCustomTeeChartRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTppCustomTeeChartRTTI.GetPropRec }

class function TraTppCustomTeeChartRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Chart') = 0) then
    ClassPropToRec(aPropName, TCustomChart, True, aPropRec)

  else if (CompareText(aPropName, 'Painting') = 0) then
    PropToRec(aPropName, daBoolean, True, aPropRec)

  else if (CompareText(aPropName, 'PrintMethod') = 0) then
    EnumPropToRec(aPropName, 'TppTeeChartPrintMethodType', False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCustomTeeChartRTTI.GetPropValue }

class function TraTppCustomTeeChartRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Chart') = 0) then
    Integer(aValue) := Integer(TppCustomTeeChart(aObject).Chart)

  else if (CompareText(aPropName, 'Painting') = 0) then
    Boolean(aValue) := TppCustomTeeChart(aObject).Painting

  else if (CompareText(aPropName, 'PrintMethod') = 0) then
    Integer(aValue) := Ord(TppCustomTeeChart(aObject).PrintMethod)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCustomTeeChartRTTI.SetPropValue }

class function TraTppCustomTeeChartRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'PrintMethod') = 0) then
    TppCustomTeeChart(aObject).PrintMethod := TppTeeChartPrintMethodType(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppTeeChart, TppTeeChartControl]);

  ppRegisterComponent(TppTeeChart, 'Standard Components', 8, 462, '', 0);

  raRegisterRTTI(TraTppCustomTeeChartRTTI);

  raRegisterEnum('TppTeeChartPrintMethodType', TypeInfo(TppTeeChartPrintMethodType));

finalization

  UnRegisterClasses([TppTeeChart, TppTeeChartControl]);

  ppUnRegisterComponent(TppTeeChart);

  raUnRegisterRTTI(TraTppCustomTeeChartRTTI);

  raUnRegisterEnum('TppTeeChartPrintMethodType');

end.
