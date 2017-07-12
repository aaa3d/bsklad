{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}


unit ppChrtDB;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, Graphics, ExtCtrls, SysUtils, Forms, Controls, Dialogs, Menus,
  Chart, DBChart, EditChar, DBEditCh, TeEngine, TeExport,
{$IFDEF Delphi3}
  {$IFDEF Tee40}
    IEdiGene,
  {$ENDIF}
{$ELSE}
  {$IFDEF Tee40}
    TeCanvas,
  {$ENDIF}
{$ENDIF}

  ppClass, ppCtrls, ppTypes, ppUtils, ppDevice, ppDrwCmd, ppChrt, ppDsgnCt;

type

  { TppDBTeeChart }
  TppDBTeeChart = class(TppCustomTeeChart)
    private
    
      {popup menu event handlers}
      procedure RefreshDataMenuClick(Sender: TObject);

    protected
      procedure CreateChart(var aChart: TCustomChart); override;
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;

    public

       procedure PopupMenuClick(Sender: TObject); override;

{$IFNDEF Tee40}
      procedure Edit; override;
{$ENDIF}

    published
      property Chart;
      property PrintMethod;
      property Visible;

      {these properties saved in 'fake' properties}
      property Height stored False;
      property Left stored False;
      property Top stored False;
      property Width stored False;
  end; {class, TppDBTeeChart}


  { TppDBTeeChartControl }
  TppDBTeeChartControl = class(TCustomDBChart)
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
      { TCustomDBChart properties }
      property ShowGlassCursor;

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

  end; {class, TppDBTeeChartControl}


implementation

uses TeeConst;

{******************************************************************************
 *
 ** D B T E E   C H A R T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDBTeeChart.CreateChart }

procedure TppDBTeeChart.CreateChart(var aChart: TCustomChart);
begin

  {create & configure tee chart control}

 {note: create with a nil owner and then insert into the Owner
         at the bottom of this procedure - this avoids D5 lockup}

  aChart := TppDBTeeChartControl.Create(nil);

  TppDBTeeChartControl(aChart).StreamingParent := Self;

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

{------------------------------------------------------------------------------}
{ TppDBTeeChart.PropertiesToDrawCommand }

procedure TppDBTeeChart.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
begin

  TppDBTeeChartControl(Chart).RefreshData;

  inherited PropertiesToDrawCommand(aDrawCommand);


end; {procedure, PropertiesToDrawCommand}



{$IFNDEF Tee40}

{------------------------------------------------------------------------------}
{ TppDBTeeChart.Edit }

procedure TppDBTeeChart.Edit;
var
  lForm: TForm;
begin

  {form needed here because TeeChart looks in the Form to create
   the DataSet list for the series}
  if (Owner is TForm) then
    lForm := TForm(Owner)
  else
    lForm := nil;

  if Chart is TppDBTeeChartControl then
    EditDBChart(lForm, TCustomDBChart(Chart));


  {update props}
  UpdatePropertiesFromChart(Chart);

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

  {repaint control}
  InvalidateDesignControl;

end; {procedure, Edit}

{$ENDIF}


{------------------------------------------------------------------------------}
{ TppDBTeeChart.CreatePopupMenu }

procedure TppDBTeeChart.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {paramters: GroupIndex, Name, Caption, StringId}
  aPopupMenu.AddItem(25, 'RefreshData', '',  497);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TppDBTeeChart.PopupMenuClick }

procedure TppDBTeeChart.PopupMenuClick(Sender: TObject);
begin

  inherited PopupMenuClick(Sender);

  {assign menu item event handlers}
  TppPopupMenu(Sender).ItemByName('RefreshData').OnClick  := RefreshDataMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TppDBTeeChart.RefreshDataMenuClick }

procedure TppDBTeeChart.RefreshDataMenuClick(Sender: TObject);
begin
  TCustomDBChart(Chart).RefreshData;
end; {procedure, RefreshDataMenuClick}



{******************************************************************************
 *
 ** D B T E E   C H A R T   C O N T R O L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDBTeeChartControl.Create }

constructor TppDBTeeChartControl.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FStreamingParent := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDBTeeChartControl.Destroy }

destructor TppDBTeeChartControl.Destroy;
begin

  {remove from parent}
  SetStreamingParent(nil);


  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDBTeeChartControl.SetStreamingParent }

procedure TppDBTeeChartControl.SetStreamingParent(aParent: TComponent);
begin

  if (FStreamingParent <> nil) and (FStreamingParent is TppCustomTeeChart) then
    TppCustomTeeChart(FStreamingParent).SetChartProperty(nil);

  FStreamingParent := aParent;

  if (FStreamingParent <> nil) and (FStreamingParent is TppCustomTeeChart) then
    TppCustomTeeChart(FStreamingParent).SetChartProperty(Self);

end; {procedure, SetStreamingParent}


{------------------------------------------------------------------------------}
{ TppDBTeeChartControl.HasParent }

function TppDBTeeChartControl.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppDBTeeChartControl.GetParentComponent - required method for Components with HasParent = True }

function TppDBTeeChartControl.GetParentComponent: TComponent;
begin
  Result := FStreamingParent;
end;

{------------------------------------------------------------------------------}
{ TppDBTeeChartControl.SetParentComponent - required method for Components with HasParent = True }

procedure TppDBTeeChartControl.SetParentComponent(Value: TComponent);
begin
  if (Value is TppCustomTeeChart) then
    SetStreamingParent(Value);
end;

{$ENDIF}

{------------------------------------------------------------------------------}
{ TppDBTeeChartControl.ReadState }

procedure TppDBTeeChartControl.ReadState(Reader: TReader);
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
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TppDBTeeChart, TppDBTeeChartControl]);

{$IFNDEF Tee40}
  ppRegisterComponent(TppDBTeeChart, 'Data Components', 6, 463, '', 0);
{$ENDIF}

finalization

{$IFNDEF Tee40}
  ppUnRegisterComponent(TppDBTeeChart);
{$ENDIF}

end. 
