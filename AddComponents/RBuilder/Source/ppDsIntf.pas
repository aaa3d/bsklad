{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDsIntf;

interface

{$I ppIfDef.pas}

uses
  Comctrls, Controls, Classes, Forms, TypInfo, SysUtils,
  ppTypes, ppUtils;

type

  TppComponentDesignerClass = class of TppComponentDesigner;
  TppDesignModuleClass = class of TppDesignModule;


  {TppDesignerSelectionList}
  TppDesignerSelectionList = class(TList)
    private
      function GetComponent(aIndex: Integer): TPersistent;

    public

      function Equals(const aList: TppDesignerSelectionList): Boolean;
      property Components[Index: Integer]: TPersistent read GetComponent; default;

    end;  {class, TppDesignerSelectionList }


  TppSetSelectionEvent = procedure(Components: TppDesignerSelectionList) of object;


  TppFormDesignerClass = class of TppFormDesigner;

  { TppFormDesigner }
  TppFormDesigner = class
    private

    protected
      function GetActive: Boolean; virtual; abstract;

{$IFDEF Delphi4}
      function GetDesigner: IDesigner; virtual; abstract;
      procedure SetDesigner(aDesigner: IDesigner); virtual; abstract;
{$ELSE}
      function GetDesigner: TDesigner; virtual; abstract;
      procedure SetDesigner(aDesigner: TDesigner); virtual; abstract;
{$ENDIF}

    public
      constructor Create; virtual;

      function  CreateComponent(ComponentClass: TComponentClass; Parent: TComponent; Left, Top, Width, Height: Integer): TComponent; virtual; abstract;
      procedure GetComponentNames(TypeData: PTypeData; Proc: TGetStrProc); virtual; abstract;
      function  MethodExists(const Name: string): Boolean; virtual; abstract;
      procedure Modified;  virtual; abstract;

      function GetMethodAddress(aComponent: TComponent; const aMethodName: string; var aAddress: Pointer): Boolean; virtual; abstract;

      function GetComponent(const Name: string): TComponent; virtual; abstract;

      function CreateMethod(const Name: string; TypeData: PTypeData): TMethod; virtual; abstract;
      procedure GetMethods(TypeData: PTypeData; Proc: TGetStrProc); virtual; abstract;

      property Active: Boolean read GetActive;

{$IFDEF Delphi4}
      property Designer: IDesigner read GetDesigner write SetDesigner;
{$ELSE}
       property Designer: TDesigner read GetDesigner write SetDesigner;
{$ENDIF}

   end; {class, TppFormDesigner}




  { TppComponentDesigner }
  TppComponentDesigner = class(TForm)
    private
      FComponent: TComponent;
      FFormDesigner: TppFormDesigner;
      FOnSetSelection: TppSetSelectionEvent;
      FDesignModuleClassSubscriber: TObject;
      FErrorMessage: String;

    protected
      procedure DesignModuleClassListChanged(Sender: TObject); virtual;
      procedure DoOnSetSelection(aComponentList: TppDesignerSelectionList);
      procedure SetComponent(aComponent: TComponent); virtual;
      function  GetCurrentComponent: TComponent; virtual;
      procedure SetCurrentComponent(aComponent: TComponent); virtual;

      function GetStatusBar: TStatusBar; virtual;
      procedure SetErrorMessage(aErrorMessage: String);

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      function  ValidSettings: Boolean; virtual;
      procedure ComponentModified; virtual;
      procedure ComponentChanged; virtual;
      procedure SelectionChanged(aSelection: TppDesignerSelectionList);  virtual; abstract;

      property Component: TComponent read FComponent write SetComponent;
      property CurrentComponent: TComponent read GetCurrentComponent write SetCurrentComponent;
      property ErrorMessage: String read FErrorMessage;
      property FormDesigner: TppFormDesigner read FFormDesigner;
      property OnSetSelection: TppSetSelectionEvent read FOnSetSelection write FOnSetSelection;
      property StatusBar: TStatusBar read GetStatusBar;
  end; {class, TppComponentDesigner}


  { TppDesignModule }
  TppDesignModule = class(TComponent)
    private
      FActive: Boolean;
      FParent: TWinControl;
      FComponentDesigner: TppComponentDesigner;
      FCaption: String;
      FOrderIndex: Integer;
      FComponent: TComponent;
      FLanguageIndex: Integer;

      procedure SetActive(aValue: Boolean);

    protected
      procedure ActiveChanged; virtual;
      procedure SetComponent(aComponent: TComponent); virtual;

      function GetStatusBar: TStatusBar; virtual;
      procedure SetLanguageIndex(aLanguageIndex: Integer); virtual;


    public
      constructor CreateModule(aParent: TWinControl; aComponentDesigner: TppComponentDesigner); virtual;

      procedure ActiveChanging(var aAllowChange: Boolean); virtual;
      procedure LoadStateInfo; virtual;
      procedure SaveStateInfo; virtual;
      procedure BeforePreview; virtual;
      procedure AfterPreview;  virtual;
      procedure CloseQuery(var CanClose: Boolean); virtual;
      procedure Close; virtual;

      property ComponentDesigner: TppComponentDesigner read FComponentDesigner;
      property Component: TComponent read FComponent write SetComponent;
      property Active: Boolean read FActive write SetActive;
      property Caption: String read FCaption write FCaption;
      property Parent: TWinControl read FParent;
      property OrderIndex: Integer read FOrderIndex write FOrderIndex;
      property StatusBar: TStatusBar read GetStatusBar;
      property LanguageIndex: Integer read FLanguageIndex write SetLanguageIndex;

    end; {class, TppDesignModule}



  function  ppGetComponentDesignerClass(aComponent: TComponent): TppComponentDesignerClass;
  procedure ppRegisterComponentDesigner(aComponentDesignerClass: TppComponentDesignerClass;
                                        aComponentClass: TComponentClass);

  procedure ppUnRegisterComponentDesigner(aComponentDesignerClass: TppComponentDesignerClass;
                                        aComponentClass: TComponentClass);

  procedure ppRegisterDesignModule(aDesignModuleClass: TppDesignModuleClass;
                                   const aComponentDesignerClassName: String);


  procedure ppUnRegisterDesignModule(aDesignModuleClass: TppDesignModuleClass;
                                   const aComponentDesignerClassName: String);


  procedure ppGetDesignModuleClasses(aComponentDesignerClass: TppComponentDesignerClass; aClassList: TList);
  procedure ppSubscribeDesignModuleClassList(aRegListSubscriber: TObject);
  procedure ppUnSubscribeDesignModuleClassList(aRegListSubscriber: TObject);

  procedure ppRegisterFormDesignerClass(aFormDesignerClass: TppFormDesignerClass);


implementation

var
  FDesignerClassList: TStringList = nil;
  FDesignModuleClassList: TppRegList = nil;
  FFormDesignerClass: TppFormDesignerClass = nil;


{******************************************************************************
 *
 ** D E S I G N E R  S E L E C T I O N  L I S T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDesignerSelectionList.GetComponent }

function TppDesignerSelectionList.GetComponent(aIndex: Integer): TPersistent;
begin
  Result := TPersistent(Items[aIndex]);
end; {function, GetComponent}


{------------------------------------------------------------------------------}
{ TppDesignerSelectionList.Equals }

function TppDesignerSelectionList.Equals(const aList: TppDesignerSelectionList): Boolean;
var
  liIndex: Integer;
begin
  Result := False;

  if aList.Count <> Count then Exit;

  for liIndex := 0 to Count - 1 do
    if aList[liIndex] <> Items[liIndex] then Exit;

  Result := True;

end;  {function, Equals}




{******************************************************************************
 *
 ** F O R M   D E S I G N E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFormDesigner.Create }

constructor TppFormDesigner.Create;
begin

  inherited Create;


end; {constructor, Create}


{******************************************************************************
 *
 ** C O M P O N E N T   D E S I G N E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppComponentDesigner.Create }

constructor TppComponentDesigner.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FComponent      := nil;
  if FFormDesignerClass <> nil then
    FFormDesigner   := FFormDesignerClass.Create;
  FOnSetSelection := nil;
  FDesignModuleClassSubscriber := TppRegListSubscriber.Create;
  TppRegListSubscriber(FDesignModuleClassSubscriber).OnListChanged := DesignModuleClassListChanged;

  ppSubscribeDesignModuleClassList(FDesignModuleClassSubscriber);

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppComponentDesigner.Destroy }

destructor TppComponentDesigner.Destroy;
begin

  ppUnSubscribeDesignModuleClassList(FDesignModuleClassSubscriber);

  FDesignModuleClassSubscriber.Free;

  FFormDesigner.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppComponentDesigner.SetComponent }

procedure TppComponentDesigner.SetComponent(aComponent: TComponent);
begin
  FComponent := aComponent;
end; {procedure, SetComponent}


{------------------------------------------------------------------------------}
{ TppComponentDesigner.GetCurrentComponent }

function TppComponentDesigner.GetCurrentComponent: TComponent;
begin
  Result := FComponent;
end; {constructor, GetCurrentComponent}

{------------------------------------------------------------------------------}
{ TppComponentDesigner.SetCurrentComponent }

procedure TppComponentDesigner.SetCurrentComponent(aComponent: TComponent);
begin

end; {procedure, SetCurrentComponent}

{------------------------------------------------------------------------------}
{ TppComponentDesigner.DoOnSetSelection }

procedure TppComponentDesigner.DoOnSetSelection(aComponentList: TppDesignerSelectionList);
begin
  if Assigned(FOnSetSelection) then FOnSetSelection(aComponentList);
  
end; {procedure, DoOnSetSelection}

{------------------------------------------------------------------------------}
{ TppComponentDesigner.ComponentModified }

procedure TppComponentDesigner.ComponentModified;
begin

  {notify Form Designer that component changed - this updates Object Inspector, and
   ensures Form Designer asks user, 'save changes?' when form is closed}
  if (FComponent = nil) then Exit;

  if (csDestroying in FComponent.ComponentState) then Exit;

  if not(csDesigning in FComponent.ComponentState) then Exit;

  if (FormDesigner <> nil) then
    FormDesigner.Modified;

end; {procedure, ComponentModified}


{------------------------------------------------------------------------------}
{ TppComponentDesigner.ComponentChanged }

procedure TppComponentDesigner.ComponentChanged;
begin

end; {procedure, ComponentChanged}


{------------------------------------------------------------------------------}
{ TppComponentDesigner.GetStatusBar }

function TppComponentDesigner.GetStatusBar: TStatusBar;
begin

  Result := nil;

end;  {function, GetStatusBar}


{------------------------------------------------------------------------------}
{ TppComponentDesigner.DesignModuleClassListChanged }

procedure TppComponentDesigner.DesignModuleClassListChanged(Sender: TObject);
begin
  
end; {procedure, DesignModuleClassListChanged}


{------------------------------------------------------------------------------}
{ TppComponentDesigner.ValidSettings }

function  TppComponentDesigner.ValidSettings: Boolean;
begin

  {descendants can override this validate any config settings and set the ErrorMessage}
  Result := True;

end;  {function, ValidSettings}

{------------------------------------------------------------------------------}
{ TppComponentDesigner.SetErrorMessage }

procedure  TppComponentDesigner.SetErrorMessage(aErrorMessage: String);
begin

  FErrorMessage := aErrorMessage;

end;  {procedure, SetErrorMessage}



{******************************************************************************
 *
 ** D E S I G N  M O D U L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDesignModule.CreateModule }

constructor TppDesignModule.CreateModule(aParent: TWinControl; aComponentDesigner: TppComponentDesigner);
begin

  inherited Create(nil);

  FParent := aParent;
  FComponentDesigner := aComponentDesigner;
  FOrderIndex := 0;
  FActive  := False;
  FCaption := '';

end; {constructor, CreateModule}

{------------------------------------------------------------------------------}
{ TppDesignModule.SetActive }

procedure TppDesignModule.SetActive(aValue: Boolean);
begin

  FActive := aValue;
  ActiveChanged;

end; {procedure, SetActive}


{------------------------------------------------------------------------------}
{ TppDesignModule.ActiveChanging }

procedure TppDesignModule.ActiveChanging(var aAllowChange: Boolean);
begin
  aAllowChange := True;

end; {procedure, ActiveChanging}


{------------------------------------------------------------------------------}
{ TppDesignModule.LoadStateInfo }

procedure TppDesignModule.LoadStateInfo;
begin

end; {procedure, LoadStateInfo}

{------------------------------------------------------------------------------}
{ TppDesignModule.SaveStateInfo }

procedure TppDesignModule.SaveStateInfo;
begin

end; {procedure, SaveStateInfo}


{------------------------------------------------------------------------------}
{ TppDesignModule.ActiveChanged }

procedure TppDesignModule.ActiveChanged;
begin

end; {procedure, ActiveChanged}

{------------------------------------------------------------------------------}
{ TppDesignModule.SetComponent }

procedure TppDesignModule.SetComponent(aComponent: TComponent);
begin
  FComponent := aComponent;

end; {procedure, SetComponent}

{------------------------------------------------------------------------------}
{ TppDesignModule.SetLanguageIndex }

procedure TppDesignModule.SetLanguageIndex(aLanguageIndex: Integer);
begin
  FLanguageIndex := aLanguageIndex;

end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TppDesignModule.GetStatusBar }

function TppDesignModule.GetStatusBar: TStatusBar;
begin
  if (FComponentDesigner <> nil) then
    Result := FComponentDesigner.StatusBar
  else
    Result := nil;

end; {procedure, SetComponent}

{------------------------------------------------------------------------------}
{ TppDesignModule.BeforePreview }

procedure TppDesignModule.BeforePreview;
begin

end; {procedure, BeforePreview}

{------------------------------------------------------------------------------}
{ TppDesignModule.AfterPreview }

procedure TppDesignModule.AfterPreview;
begin

end; {procedure, AfterPreview}

{------------------------------------------------------------------------------}
{ TppDesignModule.CloseQuery }

procedure TppDesignModule.CloseQuery(var CanClose: Boolean);
begin

end; {procedure, CloseQuery}

{------------------------------------------------------------------------------}
{ TppDesignModule.Close }

procedure TppDesignModule.Close;
begin

end; {procedure, Close}






{******************************************************************************
 *
 ** D E S I G N E R  R E G I S T E R   P R O C E D U R E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppGetDesignerClassList }

function ppGetDesignerClassList: TStringList;
begin

  if (FDesignerClassList = nil) then
    FDesignerClassList := TStringList.Create;

  Result := FDesignerClassList;

end; {function, ppGetDesignerClassList}

{------------------------------------------------------------------------------}
{ ppGetComponentDesignerClass }

function ppGetComponentDesignerClass(aComponent: TComponent): TppComponentDesignerClass;
var
  liIndex: Integer;
  lClassList: TStringList;

begin
  lClassList := ppGetDesignerClassList;

  liIndex :=  lClassList.IndexOf(aComponent.ClassName);

  if liIndex >= 0 then
    Result := TppComponentDesignerClass(lClassList.Objects[liIndex])
  else
    Result := nil;

end; {function, ppGetComponentDesignerClass}

{------------------------------------------------------------------------------}
{ ppRegisterComponentDesigner }

procedure ppRegisterComponentDesigner(aComponentDesignerClass: TppComponentDesignerClass;
                                      aComponentClass: TComponentClass);
var
  lClassList: TStringList;
  lDesignerClass: TppComponentDesignerClass;
  liIndex: Integer;
begin
  if (aComponentDesignerClass = nil) or (aComponentClass = nil) then Exit;

  RegisterClass(aComponentDesignerClass);

  lClassList := ppGetDesignerClassList;

  liIndex :=  lClassList.IndexOf(aComponentClass.ClassName);

  if (liIndex = -1) then
    lClassList.AddObject(aComponentClass.ClassName, TObject(aComponentDesignerClass))

  else
    begin
      lDesignerClass := TppComponentDesignerClass(lClassList.Objects[liIndex]);

      UnRegisterClass(lDesignerClass);

      lClassList.Objects[liIndex] := TObject(aComponentDesignerClass);
    end;

end; {procedure, ppRegisterComponentDesigner}


{------------------------------------------------------------------------------}
{ ppUnRegisterComponentDesigner }

procedure ppUnRegisterComponentDesigner(aComponentDesignerClass: TppComponentDesignerClass;
                                      aComponentClass: TComponentClass);
var
  lClassList: TStringList;
  liIndex: Integer;
begin
  if (aComponentDesignerClass = nil) or (aComponentClass = nil) then Exit;


  lClassList := ppGetDesignerClassList;

  liIndex := lClassList.IndexOf(aComponentClass.ClassName);

  if (liIndex >= 0) then
    lClassList.Delete(liIndex);


end; {procedure, ppUnRegisterComponentDesigner}

{******************************************************************************
 *
 ** D E S I G N M O D U L E  R E G I S T E R   P R O C E D U R E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppGetDesignModuleClassList }

function ppGetDesignModuleClassList: TppRegList;
begin

  if (FDesignModuleClassList = nil) then
    FDesignModuleClassList := TppRegList.Create;

  Result := FDesignModuleClassList;

end; {function, ppGetDesignerClassList}


{------------------------------------------------------------------------------}
{ ppRegisterDesignModule }

procedure ppRegisterDesignModule(aDesignModuleClass: TppDesignModuleClass; const aComponentDesignerClassName: String);
var
  lClassList: TStringList;
  lDesignModuleClass: TppDesignModuleClass;
  liIndex: Integer;
  liClass: Integer;

begin

  if (aDesignModuleClass = nil) or (aComponentDesignerClassName = '') then Exit;

  RegisterClass(aDesignModuleClass);

  lClassList := ppGetDesignModuleClassList;

  liClass  := 0;
  liIndex := -1;

  while (liClass < lClassList.Count) and (liIndex = -1) do
    if (lClassList[liClass] = aComponentDesignerClassName) then
      begin
        lDesignModuleClass := TppDesignModuleClass(lClassList.Objects[liClass]);

        if lDesignModuleClass = aDesignModuleClass then
          liIndex := liClass
        else
          Inc(liClass);

      end;


  if (liIndex = -1) then
    lClassList.AddObject(aComponentDesignerClassName, TObject(aDesignModuleClass))

  else
    begin
      lDesignModuleClass := TppDesignModuleClass(lClassList.Objects[liIndex]);

      UnRegisterClass(lDesignModuleClass);

      lClassList.Objects[liIndex] := TObject(aDesignModuleClass);
    end;

end; {procedure, ppRegisterDesignModule}

{------------------------------------------------------------------------------}
{ ppUnRegisterDesignModule }

procedure ppUnRegisterDesignModule(aDesignModuleClass: TppDesignModuleClass; const aComponentDesignerClassName: String);
var
  lClassList: TStringList;
  lDesignModuleClass: TppDesignModuleClass;
  liIndex: Integer;
  liClass: Integer;
begin

  if (aDesignModuleClass = nil) or (aComponentDesignerClassName = '') then Exit;

  UnRegisterClass(aDesignModuleClass);

  if (FDesignModuleClassList = nil) then Exit;

  lClassList := ppGetDesignModuleClassList;

  liClass  := 0;
  liIndex := -1;

  while (liClass < lClassList.Count) and (liIndex = -1) do
    if (lClassList[liClass] = aComponentDesignerClassName) then
      begin
        lDesignModuleClass := TppDesignModuleClass(lClassList.Objects[liClass]);

        if lDesignModuleClass = aDesignModuleClass then
          liIndex := liClass
        else
          Inc(liClass);

      end;

  if (liIndex >= 0) then
    lClassList.Delete(liIndex);

end; {procedure, ppUnRegisterDesignModule}

{------------------------------------------------------------------------------}
{ ppGetDesignModuleClasses }

procedure ppGetDesignModuleClasses(aComponentDesignerClass: TppComponentDesignerClass; aClassList: TList);
var
  lClassList: TStringList;
  liClass: Integer;

begin

  lClassList := ppGetDesignModuleClassList;

  for liClass := 0 to lClassList.Count-1 do

   if (lClassList[liClass] = aComponentDesignerClass.ClassName) then
      aClassList.Add(lClassList.Objects[liClass]);

end; {procedure, ppGetDesignModuleClasses}

{------------------------------------------------------------------------------}
{ ppSubscribeDesignModuleClassList }

procedure ppSubscribeDesignModuleClassList(aRegListSubscriber: TObject);
begin

  if aRegListSubscriber is TppRegListSubscriber then
    ppGetDesignModuleClassList.AddNotify(TppRegListSubscriber(aRegListSubscriber));

end; {procedure, ppSubscribeDesignModuleClassList}

{------------------------------------------------------------------------------}
{ ppUnSubscribeDesignModuleClassList }

procedure ppUnSubscribeDesignModuleClassList(aRegListSubscriber: TObject);
begin

  if aRegListSubscriber is TppRegListSubscriber then
    ppGetDesignModuleClassList.RemoveNotify(TppRegListSubscriber(aRegListSubscriber));

end;  {procedure, ppUnSubscribeDesignModuleClassList}

{------------------------------------------------------------------------------}
{ ppRegisterFormDesignerClass }

procedure ppRegisterFormDesignerClass(aFormDesignerClass: TppFormDesignerClass);
begin
  FFormDesignerClass := aFormDesignerClass;

end; {procedure, ppRegisterFormDesignerClass}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

finalization

  FDesignerClassList.Free;
  FDesignerClassList := nil;

  FDesignModuleClassList.Free;
  FDesignModuleClassList := nil;

end.

