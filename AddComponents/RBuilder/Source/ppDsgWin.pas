{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDsgWin;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DsgnWnds, DsgnIntf, ppDsIntf, TypInfo;

type

  { TppDesignWindow }
  TppDesignWindow = class(TDesignWindow)
    private
      FComponentDesigner: TppComponentDesigner;
      FForm: TForm;

      procedure SetComponentDesigner(aComponentDesigner: TppComponentDesigner);

    protected
      function UniqueName(Component: TComponent): string; override;
      procedure Notification(AComponent: TComponent; Operation: TOperation); override;

      procedure SetDesignerSelection(aSelection: TppDesignerSelectionList);

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

{$IFDEF Delphi4}
      {inherited from TDesignWindow}
      procedure ComponentDeleted(Component: IPersistent); override;
{$ELSE}
      procedure ComponentDeleted(Component: TComponent); override;
{$ENDIF}


{$IFDEF Delphi3}
      procedure FormClosed(aCustomForm: TCustomForm); override;
{$ELSE}
      procedure FormClosed(aForm: TForm); override;
{$ENDIF}

{$IFDEF Delphi5}
    procedure SelectionChanged(ASelection: TDesignerSelectionList); override;
{$ELSE}
    procedure SelectionChanged(aSelection: TComponentList); override;
{$ENDIF}

      property ComponentDesigner: TppComponentDesigner read FComponentDesigner write SetComponentDesigner;
      property Form: TForm read FForm write FForm;

  end; {class, TppDesignWindow}



  { TppDelphiFormDesigner }
  TppDelphiFormDesigner = class(TppFormDesigner)
    private
      FMethods: TStringList;

{$IFDEF Delphi4}
      FFormDesigner: IFormDesigner;
{$ELSE}
      FFormDesigner: TFormDesigner;
{$ENDIF}
      procedure GetMethodsProc(const MethodName: String);

    protected

      function GetActive: Boolean; override;


{$IFDEF Delphi4}
      function GetDesigner: IDesigner; override;
      procedure SetDesigner(aDesigner: IDesigner); override;
{$ELSE}
      function GetDesigner: TDesigner; override;
      procedure SetDesigner(aDesigner: TDesigner); override;
{$ENDIF}

    public
      constructor Create; override;

      function  CreateComponent(ComponentClass: TComponentClass; Parent: TComponent; Left, Top, Width, Height: Integer): TComponent; override;
      procedure GetComponentNames(TypeData: PTypeData; Proc: TGetStrProc); override;
      function  MethodExists(const Name: string): Boolean; override;
      procedure Modified; override;

      function GetMethodAddress(aComponent: TComponent; const aMethodName: string; var aAddress: Pointer): Boolean; override;

      function  GetComponent(const Name: string): TComponent; override;
      function CreateMethod(const Name: string; TypeData: PTypeData): TMethod;  override;
      procedure GetMethods(TypeData: PTypeData; Proc: TGetStrProc); override;

       {procedure AddToInterface(InvKind: Integer; const Name: string; VT: Word; const TypeInfo: string);
       function  CreateComponent(ComponentClass: TComponentClass; Parent: TComponent; Left, Top, Width, Height: Integer): TComponent;
       function  MethodFromAncestor(const Method: TMethod): Boolean;
       procedure MakeComponentLinkable(Component: TComponent);
       function  GetAncestorDesigner: IFormDesigner;
       function  GetComponentName(Component: TComponent): string;
       function  GetIsDormant: Boolean;
       function  GetMethodName(const Method: TMethod): string;
       function  GetObject(const Name: string): TPersistent;
       function  GetObjectName(Instance: TPersistent): string;
       procedure GetObjectNames(TypeData: PTypeData; Proc: TGetStrProc);
       function  GetPrivateDirectory: string;
       procedure GetProjectModules(Proc: TGetModuleProc);
       function  GetRoot: TComponent;
       procedure GetSelections(const List: IDesignerSelections);
       function  HasInterface: Boolean;
       function  HasInterfaceMember(const Name: string): Boolean;
       function  IsSourceReadOnly: Boolean;
       function  IsComponentLinkable(Component: TComponent): Boolean;
       procedure RenameMethod(const CurName, NewName: string);
       procedure Revert(Instance: TPersistent; PropInfo: PPropInfo);
       procedure SelectComponent(Instance: TPersistent);
       procedure SetSelections(const List: IDesignerSelections);
       procedure ShowMethod(const Name: string);
       function  UniqueName(const BaseName: string): string;

       property  AncestorDesigner: IFormDesigner read GetAncestorDesigner;
       property  IsDormant: Boolean read GetIsDormant; }


   end; {class, TppFormDesigner}



  
var
  ppDesignWindow: TppDesignWindow;


implementation

{$R *.DFM}


{------------------------------------------------------------------------------}
{ TppDesignWindow.Create }

constructor TppDesignWindow.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FComponentDesigner := nil;
  FForm := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDesignWindow.Destroy }

destructor TppDesignWindow.Destroy;
begin


  if (FComponentDesigner <> nil) then
    FComponentDesigner.Free;

  inherited Destroy;


end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDesignWindow.SetComponentDesigner }

procedure TppDesignWindow.SetComponentDesigner(aComponentDesigner: TppComponentDesigner);
begin
  if (FComponentDesigner <> nil) then
    FComponentDesigner.OnSetSelection := nil;

  FComponentDesigner := aComponentDesigner;

  if (FComponentDesigner <> nil) then
    FComponentDesigner.OnSetSelection := SetDesignerSelection;

end; {procedure, SetComponentDesigner}

{------------------------------------------------------------------------------}
{ TppDesignWindow.Notification }

procedure TppDesignWindow.Notification(AComponent: TComponent; Operation: TOperation);
begin

  inherited Notification(AComponent, Operation);

  if (aComponent = FComponentDesigner) and (Operation = opRemove) then
    begin
    
       SetComponentDesigner(nil);

       {note: must use Release here rather than Free or get an Access Violation}
       if not (csDestroying in ComponentState) then
        Release;

    end;

end; {procedure, Notification}


{$IFDEF Delphi3}

{------------------------------------------------------------------------------}
{ TppDesignWindow.FormClosed }

procedure TppDesignWindow.FormClosed(aCustomForm: TCustomForm);
begin

  if (aCustomForm = FForm) then
    Free;

end; {procedure, FormClosed}


{$ELSE}


{------------------------------------------------------------------------------}
{ TppDesignWindow.FormClosed }

procedure TppDesignWindow.FormClosed(aForm: TForm);
begin

  if (aForm = FForm) then
    Free;

end; {procedure, FormClosed}

{$ENDIF}

{------------------------------------------------------------------------------}
{ TppDesignWindow.ComponentDeleted }

{$IFDEF Delphi4}

procedure TppDesignWindow.ComponentDeleted(Component: IPersistent);
begin

  inherited ComponentDeleted(Component);

  if (FComponentDesigner <> nil) and
     (ExtractPersistent(Component) = FComponentDesigner.Component) then
    Free;

end; {procedure, ComponentDeleted}

{$ELSE}

procedure TppDesignWindow.ComponentDeleted(Component: TComponent);
begin

  inherited ComponentDeleted(Component);

  if (FComponentDesigner <> nil) and (Component = FComponentDesigner.Component) then
    Free;

end; {procedure, ComponentDeleted}

{$ENDIF}

{------------------------------------------------------------------------------}
{ TppDesignWindow.SelectionChanged }

{$IFDEF Delphi5}
procedure TppDesignWindow.SelectionChanged(ASelection: TDesignerSelectionList);
{$ELSE}
procedure TppDesignWindow.SelectionChanged(ASelection: TComponentList);
{$ENDIF}
var
  lComponentList: TppDesignerSelectionList;
  liSelection: Integer;
begin

  lComponentList := TppDesignerSelectionList.Create;

  for liSelection := 0 to aSelection.Count-1 do
    lComponentList.Add(aSelection[liSelection]);

  if (FComponentDesigner <> nil) then
    FComponentDesigner.SelectionChanged(lComponentList);

  lComponentList.Free;


end; {procedure, SelectionChanged}

{------------------------------------------------------------------------------}
{ TppDesignWindow.SetDesignerSelection }

procedure TppDesignWindow.SetDesignerSelection(aSelection: TppDesignerSelectionList);
var
  liIndex: Integer;
{$IFDEF Delphi5}
  lSelection: TDesignerSelectionList;
{$ELSE}
  lSelection: TComponentList;
{$ENDIF}

begin
{$IFDEF Delphi5}
  lSelection := TDesignerSelectionList.Create;
{$ELSE}
  lSelection := TComponentList.Create;
{$ENDIF}

  for liIndex := 0 to aSelection.Count-1 do
    lSelection.Add(aSelection[liIndex]);

  {notify object inspector}
  SetSelection(lSelection);


end; {procedure, SetDesignerSelection}



{------------------------------------------------------------------------------}
{ TppDesignWindow.UniqueName }

function TppDesignWindow.UniqueName(Component: TComponent): string;
begin
  Result := '';
end; {function, UniqueName}



{******************************************************************************
 *
 ** F O R M   D E S I G N E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.Create }

constructor TppDelphiFormDesigner.Create;
begin
  inherited Create;

  FFormDesigner := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.GetActive }

function TppDelphiFormDesigner.GetActive: Boolean;
begin
  Result := (FFormDesigner <> nil);

end; {function, GetActive}

{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.GetDesigner }

{$IFDEF Delphi4}
function TppDelphiFormDesigner.GetDesigner: IDesigner;
{$ELSE}
function TppDelphiFormDesigner.GetDesigner: TDesigner;
{$ENDIF}

begin
  Result := FFormDesigner;

end; {function, GetDesigner}

{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.SetDesigner }

{$IFDEF Delphi4}
procedure TppDelphiFormDesigner.SetDesigner(aDesigner: IDesigner);
begin

  FFormDesigner := IFormDesigner(aDesigner);

end;  {procedure, SetDesigner}

{$ELSE}
procedure TppDelphiFormDesigner.SetDesigner(aDesigner: TDesigner);
begin
  FFormDesigner := TFormDesigner(aDesigner);

end;  {procedure, SetDesigner}
{$ENDIF}

{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.CreateComponent }

function TppDelphiFormDesigner.CreateComponent(ComponentClass: TComponentClass; Parent: TComponent; Left, Top, Width, Height: Integer): TComponent;
begin
  if (FFormDesigner <> nil) then
    Result := FFormDesigner.CreateComponent(ComponentClass, Parent, Left, Top, Width, Height)
  else
    Result := nil;
end; {function, CreateComponent}

{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.Modified }

procedure TppDelphiFormDesigner.Modified;
begin
  if (FFormDesigner <> nil) then
    FFormDesigner.Modified;
end; {procedure, Modified}

{$IFDEF WIN32}
{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.GetComponent }

function TppDelphiFormDesigner.GetComponent(const Name: string): TComponent;
begin
  if (FFormDesigner <> nil) then
    Result := FFormDesigner.GetComponent(Name)
  else
    Result := nil;
end; {procedure, GetComponent}
{$ENDIF}

{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.GetComponentNames }

procedure TppDelphiFormDesigner.GetComponentNames(TypeData: PTypeData; Proc: TGetStrProc);
begin
  if (FFormDesigner <> nil) then
    FFormDesigner.GetComponentNames(TypeData, Proc);
end; {procedure, GetComponentNames}

{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.MethodExists }

function TppDelphiFormDesigner.MethodExists(const Name: String): Boolean;
begin
  if (FFormDesigner <> nil) then
    Result := FFormDesigner.MethodExists(Name)
  else
    Result := False;
end; {function, MethodExists}

{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.CreateMethod }

function TppDelphiFormDesigner.CreateMethod(const Name: string; TypeData: PTypeData): TMethod;
begin
  if (FFormDesigner <> nil) then
    Result := FFormDesigner.CreateMethod(Name, TypeData);
end; {function, CreateMethod}

{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.GetMethods }

procedure TppDelphiFormDesigner.GetMethods(TypeData: PTypeData; Proc: TGetStrProc);
begin
  if (FFormDesigner <> nil) then
    FFormDesigner.GetMethods(TypeData, Proc);
end; {procedure, GetMethods}


{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.GetMethodAddress }

function TppDelphiFormDesigner.GetMethodAddress(aComponent: TComponent; const aMethodName: string; var aAddress: Pointer): Boolean;
var
  liPropCount,
  liMethodCount,
  liMethod: Integer;
  lMethod: TMethod;
  lPPropList: PPropList;

begin

  Result := False;

  aAddress := nil;

  if (FFormDesigner = nil) or (aComponent = nil) then Exit;

  lPPropList := nil;

  {ask the designer whether this method exists }
  if FFormDesigner.MethodExists(aMethodName) then
    try

      {allocate memory for property list }
      liPropCount := GetTypeData(aComponent.ClassInfo)^.PropCount;

      GetMem(lPPropList, liPropCount * SizeOf(Pointer));

      {create string list used to store method names}
      FMethods := TStringList.Create;

      {get methods props for the current component }
      liMethodCount := GetPropList(aComponent.ClassInfo, [tkMethod], lPPropList);

      liMethod := 0;

     {look for the address of the method }
      while (aAddress = nil) and (liMethod < liMethodCount) do
        begin

          FMethods.Clear;
          {ask designer for list of method names that are valid for the method type}

{$IFDEF Delphi3}
          FFormDesigner.GetMethods(GetTypeData(lPPropList^[liMethod]^.PropType^), GetMethodsProc);
{$ELSE}
          FFormDesigner.GetMethods(GetTypeData(lPPropList^[liMethod]^.PropType), GetMethodsProc);
{$ENDIF}
          {check whether the method we're looking for is in the list }
          if FMethods.IndexOf(aMethodName) >= 0 then
            begin
              {get the address from the designer }

{$IFDEF Delphi3}
              lMethod := FFormDesigner.CreateMethod(aMethodName, GetTypeData(lPPropList^[liMethod]^.PropType^));
{$ELSE}
              lMethod := FFormDesigner.CreateMethod(aMethodName, GetTypeData(lPPropList^[liMethod]^.PropType));
{$ENDIF}
              aAddress := lMethod.Code;

            end;

          Inc(liMethod);

        end;

    finally

      FMethods.Free;

{$IFDEF WIN32}
     FreeMem(lPPropList);
{$ELSE}
     FreeMem(lPPropList,liPropCount * SizeOf(Pointer));
{$ENDIF}

    end;

  Result := (aAddress <> nil);

end; {procedure, GetMethodAddress}

{------------------------------------------------------------------------------}
{ TppDelphiFormDesigner.GetMethodsProc - call back proc for Designer.GetMethods routine }

procedure TppDelphiFormDesigner.GetMethodsProc(const MethodName: String);
begin
  FMethods.Add(MethodName);

end; {procedure, GetMethodsProc}


initialization

  ppRegisterFormDesignerClass(TppDelphiFormDesigner);

finalization

  ppRegisterFormDesignerClass(nil);



end.
