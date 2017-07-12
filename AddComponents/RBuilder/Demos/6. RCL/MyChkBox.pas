{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit myChkBox;

interface

uses
  Windows,
  Classes,  {contains TComponent class}
  Forms,    {contains the global Screen object, used to size the component initially}
  Graphics, {contains declaration of TCanvas, used in PaintDesignControl}
  ppDsgnCt, {contains TppPopupMenu, used in the CreatePopupMenu procedure}
  SysUtils, {contains LoadStr, also used in the CreatePopupMenu procedure}
  Controls, {contains declaration of mrOK, used for the CheckBox Settings dialog}
  ppCtrls,  {contains declaration of TppCustomComponent, from which the CheckBox component descends}
  ppDevice, {contains declaration of TppDrawCommand, used in PropertiesToDrawCommand}
  ppClass,  {contains ppRegisterComponent which registers the component with the
             ReportBuilder Report Designer}
  ppDB,     {contains declaration of TppDataPipeline, used for the data-aware CheckBox}
  ppDrwCmd, {contains declaration of TppDrawText, used in PropertiesToDrawCommand}
  ppTypes,  {contains declaration of ReportBuilder enumerated types}
  ppPrnabl, {contains TppPrintable, CustomComponent ancestor}
  ppRTTI,
  ppEnum;

{define WingDing ASCII codes used to represent check marks}
const
  cEmptyBox       = #168;
  cCheckMarkInBox = #254;
  cCheckMark      = #252;
  cXMark          = #251;
  cXInBox         = #253;

type

  {enumerated type which describes different check box styles}
  TmyCheckStyleType = (csCheckInBox, csXInBox, csCheckMark, csXMark);

  { TmyCustomCheckBox contains most of the functionality needed for this component.
    It is common to code a 'custom' ancestor, which enscapsulates the implementation
    for a certain type of component. You can then create descendants of this
    custom class and avoid unnecessary redundancy.  In this case, TmyCustomCheckBox
    has been created as the ancestor for TmyCheckBox and TmyDBCheckBox.

    TmyCheckBox publishes the Checked property and defines the CheckStyle property
    as the default (which tells the Report Designer to display a drop-down combo box
    in the Edit toolbar and assign the CheckStyle property based on user selections from
    this combo box.)  The choices for this combo-box are supplied in the
    GetDefaultPropEnumNames procedure of TmyCheckBox.

    TmyDBCheckBox publishes DataField and DataPipeline, and overrides the IsDataAware
    function to return True.  The Report Designer automatically displays a drop-down
    combo box of field names for data-aware controls.  TmyDBCheckBox implements a
    speedmenu option called Settings... which gives the user access to a dialog
    where they can set the CheckStyle, BooleanTrue and BooleanFalse properties.}

  { TmyCustomCheckBox }
  TmyCustomCheckBox = class(TppCustomComponent)
    private
      FChecked: Boolean;
      FStyle: TmyCheckStyleType;

      function  GetCheckCharacter: Char;
      procedure SetChecked(Value: Boolean);
      procedure SetStyle(aStyle: TmyCheckStyleType);

    protected
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      procedure PaintDesignControl(aCanvas: TCanvas); override;
      procedure PropertiesToDrawCommand(aDrawCommand: TppDrawCommand); override;

      function  GetChecked: Boolean; virtual;
      
      property Checked: Boolean read GetChecked write SetChecked default True;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      property Style: TmyCheckStyleType read FStyle write SetStyle default csCheckInBox;

  end; {class, TmyCustomCheckBox}

  { TmyCheckBox }
  TmyCheckBox = class(TmyCustomCheckBox)
    protected
      function  GetDefaultPropHint: String; override;

    public
      constructor Create(aOwner: TComponent); override;

      procedure GetDefaultPropEnumNames(aList: TStrings); override;

    published
      {inherited from TmyCustomCheckBox}
      property Checked;
      property Style;

      {inherited from TppPrintable}
      property Color;
      property Height;
      property Left;
      property ReprintOnOverFlow;
      property ShiftWithParent;
      property Top;
      property Transparent;
      property Visible;
      property Width;

      {events - inherited from TppPrintable}
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property OnPrint;

  end; {class, TmyCheckBox}


  { TmyDBCheckBox }
  TmyDBCheckBox = class(TmyCustomCheckBox)
    private
      FBooleanFalse: String;
      FBooleanTrue: String;

      procedure SetBooleanFalse(const Value: String);
      procedure SetBooleanTrue(const Value: String);
      procedure SettingsMenuClick(Sender: TObject);

    protected
      procedure CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu); override;
      function  GetChecked: Boolean; override;

    public
      constructor Create(aOwner: TComponent); override;

      function  IsDataAware: Boolean; override;
      procedure PopupMenuClick(Sender: TObject); override;

      property Checked;

    published
      {inherited from TmyCustomCheckBox}
      property Color;
      property BooleanFalse: String read FBooleanFalse write SetBooleanFalse;
      property BooleanTrue: String read FBooleanTrue write SetBooleanTrue;
      property Style;

      {inherited from TppPrintable}
      property DataPipeline;
      property DataField;
      property Height;
      property Left;
      property ReprintOnOverFlow;
      property ShiftWithParent;
      property Top;
      property Transparent;
      property Visible;
      property Width;

      {events - inherited from TppPrintable}
      property OnDrawCommandClick;
      property OnDrawCommandCreate;
      property OnPrint;

  end; {class, TmyDBCheckBox}

{******************************************************************************
 *
 ** R T T I
 *
{******************************************************************************}

  { TraTmyCustomCheckBoxRTTI }
  TraTmyCustomCheckBoxRTTI = class(TraTppComponentRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTmyCustomCheckBoxRTTI}

  { TraTmyCheckBoxRTTI }
  TraTmyCheckBoxRTTI = class(TraTmyCustomCheckBoxRTTI)
    public
      class procedure GetPropList(aClass: TClass; aPropList: TraPropList); override;
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTmyCheckBoxRTTI}


implementation

uses
  myChkDlg; {allows creation of CheckStyle dialog in DBCheckBox.StyleMenuClick}

{include resource file containing bitmap used to represent component in the Report Designer}
{$R myChkBox.res}

{******************************************************************************
 *
 ** C U S T O M   C H E C K   B O X
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TmyCustomCheckBox.Create }

constructor TmyCustomCheckBox.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  {indicate that a DrawText drawcommand should be created when the component needs to print}
  DrawCommandClass := TppDrawText;

  FChecked := True;
  FStyle := csCheckInBox;

  {default size to quarter inch by quarter inch}
  spHeight := Round(0.25 * Screen.PixelsPerInch);
  spWidth := Round(0.25 * Screen.PixelsPerInch);

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TmyCustomCheckBox.Destroy }

destructor TmyCustomCheckBox.Destroy;
begin

  {not currently used for anything, but the minute you take it out
   you'll discover some object you need to free}

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TmyCustomCheckBox.GetChecked }

function TmyCustomCheckBox.GetChecked: Boolean;
begin
  Result := FChecked;
end; {function, GetChecked}

{------------------------------------------------------------------------------}
{ TmyCustomCheckBox.SetStyle }

procedure TmyCustomCheckBox.SetStyle(aStyle: TmyCheckStyleType);
begin
  if (Printing) then Exit;

  FStyle := aStyle;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

  {redraw design control}
  InvalidateDesignControl;

end; {procedure, SetStyle}

{------------------------------------------------------------------------------}
{ TmyCustomCheckBox.SetChecked }

procedure TmyCustomCheckBox.SetChecked(Value: Boolean);
begin

  FChecked := Value;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

  {redraw design control}
  InvalidateDesignControl;
end; {procedure, SetChecked}

{------------------------------------------------------------------------------}
{ TmyCustomCheckBox.GetCheckCharacter }

function TmyCustomCheckBox.GetCheckCharacter: Char;
begin

  {return the WingDings character which will represent the check box}
  Result := #32;

  if GetChecked then
    begin
      case FStyle of
        csCheckMark:   Result := cCheckMark;
        csCheckInBox:  Result := cCheckMarkInBox;
        csXMark:       Result := cXMark;
        csXInBox:      Result := cXInBox;
      end; {case}
    end
  else
    begin
      if (FStyle in [csCheckInBox, csXInBox]) then
        Result := cEmptyBox;
    end;
end; {function, GetCheckCharacter}

{------------------------------------------------------------------------------}
{ TmyCustomCheckBox.PaintDesignControl }

procedure TmyCustomCheckBox.PaintDesignControl(aCanvas: TCanvas);
var
  lcChar: Char;
  lClientRect: TRect;
  
begin
  {this call to inherited would paint a single line border around the design control
   which we don't want for the check box component}
  {inherited PaintDesignControl(aCanvas);}


  if not (pppcDesigning in DesignState) or (Printing) then Exit;

  lClientRect := spClientRect;

  {draw background}
  if not Transparent then
    begin
      aCanvas.Brush.Color := Self.Color;
      aCanvas.Brush.Style := bsSolid;
      aCanvas.FillRect(lClientRect);
    end;

  aCanvas.Brush.Style := bsClear;
  aCanvas.Font.CharSet := SYMBOL_CHARSET;
  aCanvas.Font.Name := 'WingDings';

  lcChar := GetCheckCharacter;

  if (lcChar = #32) then Exit;

  aCanvas.Font.Height := spHeight;

  aCanvas.TextOut(0, 0, lcChar);

end; {procedure, PaintDesignControl}

{------------------------------------------------------------------------------}
{ TmyCustomCheckBox.CreatePopupMenu }

procedure TmyCustomCheckBox.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  {creates based options (BringToFront, SendToBack, Position, Visible) }
  inherited CreatePopupMenu(aOwner, aPopupMenu);

  {TppPopupMenu is a descendant of TPopupMenu. It has added functionality for
   adding menu items, referencing menu items by name, and handling menu items
   that represent boolean properties of a TppComponent.

  {AddItem paramters: GroupIndex, Name, Caption, StringId}
  {1. for boolean properties, specify the property name and ReportBuilder will
      autmatically set the checked status and set the value when the user clicks etc.
   2. for a dialog, attach an event handler in the OnPopup event (see TmyCheckbox below)


 { these are the options defined in ancestor, TppComponent:

  aPopupMenu.AddItem(10, 'BringToFront', '',  161);
  aPopupMenu.AddItem(10, 'SendToBack', '',  177);
  aPopupMenu.AddItem(20, 'Line1', '-',  0);

  aPopupMenu.AddItem(30, 'Position', '',  ppMsgPosition);
  aPopupMenu.AddItem(30, 'Visible', '',  ppMsgVisible);
 }

  aPopupMenu.AddItem(30, 'Checked', 'Checked', 0);
  aPopupMenu.AddItem(30, 'ReprintOnOverFlow', '',  238);
  aPopupMenu.AddItem(30, 'ShiftWithParent', '',  240);
  aPopupMenu.AddItem(30, 'Transparent', '',  246);

end; {procedure, TmyCustomCheckBox}


{------------------------------------------------------------------------------}
{ TmyCustomCheckBox.PropertiesToDrawCommand }

procedure TmyCustomCheckBox.PropertiesToDrawCommand(aDrawCommand: TppDrawCommand);
var
  lDrawText: TppDrawText;
begin

  inherited PropertiesToDrawCommand(aDrawCommand);

  {make sure the drawcommand is of the appropriate class}
  if not(aDrawCommand is TppDrawText) then Exit;

  lDrawText := TppDrawText(aDrawCommand);

  {set the position of the text on the page}
  lDrawText.Left    := PrintPosRect.Left;
  lDrawText.Top     := PrintPosRect.Top;
  lDrawText.Height  := PrintPosRect.Bottom - PrintPosRect.Top;
  lDrawText.Width   := PrintPosRect.Right - PrintPosRect.Left;

  {set the drawtext properties so the visual represention of the check box will
   be correct when the command is rendered by the receiving Device (ScreenDevice
   for Print Preview form, PrinterDevice when printing to printer, etc.)}
  lDrawText.Alignment    := taLeftJustify;
  lDrawText.AutoSize     := True;
  lDrawText.Color        := Color;
  lDrawText.Font.CharSet := SYMBOL_CHARSET;
  lDrawText.Font.Name    := 'WingDings';
  lDrawText.Font.Height  := spHeight;
{$IFDEF WIN32}
  lDrawText.Text         := String(GetCheckCharacter);
{$ELSE}
  lDrawText.Text         := GetCheckCharacter;
{$ENDIF}
  lDrawText.Transparent  := Transparent;
  lDrawText.WordWrap     := False;

end; {procedure, PropertiesToDrawCommand}

{******************************************************************************
 *
 ** C H E C K   B O X
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TmyCheckBox.Create }

constructor TmyCheckBox.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  {define default property, which tells the Report Designer to use a drop-down
   list}
  DefaultPropName     := 'Style';
  DefaultPropEditType := etValueList;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TmyCheckBox.GetDefaultPropHint }

function TmyCheckBox.GetDefaultPropHint: String;
begin
  {hint displayed when user gets hint for Edit toolbar combo-box}
  Result := 'Checkbox Styles';
end; {function, GetDefaultPropHint}

{------------------------------------------------------------------------------}
{ TmyCheckBox.GetDefaultPropEnumNames }

procedure TmyCheckBox.GetDefaultPropEnumNames(aList: TStrings);
begin

  {options displayed when user clicks on Edit toolbar combo-box}
  aList.Clear;

  aList.Add('Checkmark and Box');
  aList.Add('X and Box');
  aList.Add('Checkmark only');
  aList.Add('X only');

end; {procedure, GetDefaultPropEnumNames}

{******************************************************************************
 *
 ** D B   C H E C K   B O X
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TmyDBCheckBox.Create }

constructor TmyDBCheckBox.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FBooleanTrue := 'True';
  FBooleanFalse := 'False';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TmyDBCheckBox.IsDataAware }

function TmyDBCheckBox.IsDataAware: Boolean;
begin
  {Report Designer will display list of datafields in Edit toolbar}
  Result := True;
end; {function, IsDataAware}


{------------------------------------------------------------------------------}
{ TmyDBCheckBox.SetBooleanFalse }

procedure TmyDBCheckBox.SetBooleanFalse(const Value: String);
begin
  if (Printing) then Exit;

  FBooleanFalse := Value;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

  {redraw design control}
  InvalidateDesignControl;

end; {procedure, SetBooleanFalse}

{------------------------------------------------------------------------------}
{ TmyDBCheckBox.SetBooleanTrue }

procedure TmyDBCheckBox.SetBooleanTrue(const Value: String);
begin
  if (Printing) then Exit;

  FBooleanTrue := Value;

  {notify report designer}
  PropertyChange;

  {notify report engine}
  Reset;

  {redraw design control}
  InvalidateDesignControl;

end; {procedure, SetBooleanTrue}  {returns whether check box should be checked or not}

{------------------------------------------------------------------------------}
{ TmyDBCheckBox.GetChecked }

function TmyDBCheckBox.GetChecked: Boolean;
begin

  Result := False;

  try

    if (DataPipeline <> nil) then
      begin

        if (FBooleanTrue <> '') then
          Result := (DataPipeline.GetFieldAsString(DataField) = FBooleanTrue)

        else if (FBooleanFalse <> '') then
          Result := (DataPipeline.GetFieldAsString(DataField) <> FBooleanFalse)

        else
          Result := (DataPipeline.GetFieldAsString(DataField) <> '');

      end;

  except on EDataError do
    Result := False;
  end;

end; {function, GetChecked}

{------------------------------------------------------------------------------}
{ TmyDBCheckBox.CreatePopupMenu }

procedure TmyDBCheckBox.CreatePopupMenu(aOwner: TComponent; var aPopupMenu: TppPopupMenu);
begin

  inherited CreatePopupMenu(aOwner, aPopupMenu);


  aPopupMenu.ItemByName('Checked').Free;


  {add Settings option}
  aPopupMenu.AddItem(30, 'Settings', 'Settings...',  0);

end; {procedure, CreatePopupMenu}

{------------------------------------------------------------------------------}
{ TmyDBCheckBox.PopupMenuClick }

procedure TmyDBCheckBox.PopupMenuClick(Sender: TObject);
begin
  inherited PopupMenuClick(Sender);

  {assign the OnClick event-handler for the Settings menu item}
  TppPopupMenu(Sender).ItemByName('Settings').OnClick := SettingsMenuClick;

end; {procedure, PopupMenuClick}

{------------------------------------------------------------------------------}
{ TmyDBCheckBox.SettingsMenuClick }

procedure TmyDBCheckBox.SettingsMenuClick(Sender: TObject);
var
  lDialog: TfrmChkDlg;
begin

  {create and display dialog in response to user clicking
   Settings... speedmenu item}
  lDialog := TfrmChkDlg.Create(Application);
  lDialog.CheckStyle := Style;
  lDialog.BooleanTrue := BooleanTrue;
  lDialog.BooleanFalse := BooleanFalse;

  if (lDialog.ShowModal = mrOK) then
    begin
      Style := lDialog.CheckStyle;
      BooleanTrue := lDialog.BooleanTrue;
      BooleanFalse := lDialog.BooleanFalse;
    end;

  lDialog.Free;

end; {procedure, SettingsMenuClick}

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
 ** C U S T O M   C H E C K B O X   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTmyCustomCheckBoxRTTI.RefClass }

class function TraTmyCustomCheckBoxRTTI.RefClass: TClass;
begin
  Result := TmyCustomCheckBox;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTmyCustomCheckBoxRTTI.GetPropList }

class procedure TraTmyCustomCheckBoxRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTmyCustomCheckBoxRTTI.GetPropRec }

class function TraTmyCustomCheckBoxRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Style') = 0) then
    EnumPropToRec(aPropName, 'TmyCheckStyleType', False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTmyCustomCheckBoxRTTI.GetPropValue }

class function TraTmyCustomCheckBoxRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Style') = 0) then
    Integer(aValue) := Ord(TmyCustomCheckBox(aObject).Style)

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTmyCustomCheckBoxRTTI.SetPropValue }

class function TraTmyCustomCheckBoxRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Style') = 0) then
    TmyCustomCheckBox(aObject).Style := TmyCheckStyleType(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}

{******************************************************************************
 *
 ** C H E C K B O X   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTmyCheckBoxRTTI.RefClass }

class function TraTmyCheckBoxRTTI.RefClass: TClass;
begin
  Result := TmyCheckBox;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTmyCheckBoxRTTI.GetPropList }

class procedure TraTmyCheckBoxRTTI.GetPropList(aClass: TClass; aPropList: TraPropList);
begin

  inherited GetPropList(aClass, aPropList);

end; {class procedure, GetPropList}

{------------------------------------------------------------------------------}
{ TraTmyCheckBoxRTTI.GetPropRec }

class function TraTmyCheckBoxRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Checked') = 0) then
    PropToRec(aPropName, daBoolean, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTmyCheckBoxRTTI.GetPropValue }

class function TraTmyCheckBoxRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Checked') = 0) then
    Boolean(aValue) := TmyCheckBox(aObject).Checked

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTmyCheckBoxRTTI.SetPropValue }

class function TraTmyCheckBoxRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'Checked') = 0) then
    TmyCheckBox(aObject).Checked := Boolean(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  {register the component, the parameters are:

     Component Class Name,   class name of component
     Toolbar Name,           name of Toolbar on which component should appear
     Position,               position of component on toolbar
     HintIndex,              (used by the built-in ReportBuilder components) Loads the Language string
                             of the specified index as the hint
     Hint,                   Hint text which appears when mouse is positioned over component on Toolbar
     HInstance,              Handle of library for this unit, needed to load bitmap from resource file}

  ppRegisterComponent(TmyCheckBox, 'Standard Components', 10, 0, 'CheckBox', HInstance);
  ppRegisterComponent(TmyDBCheckBox, 'Data Components', 10, 0, 'DBCheckBox', HInstance);

  raRegisterRTTI(TraTmyCustomCheckBoxRTTI);
  raRegisterRTTI(TraTmyCheckBoxRTTI);
  raRegisterEnum('TmyCheckStyleType', TypeInfo(TmyCheckStyleType));


finalization

  ppUnRegisterComponent(TmyCheckBox);
  ppUnRegisterComponent(TmyDBCheckBox);

  raUnRegisterRTTI(TraTmyCustomCheckBoxRTTI);
  raUnRegisterRTTI(TraTmyCheckBoxRTTI);
  raUnRegisterEnum('TmyCheckStyleType');

end.
