{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppComm;

interface

{$I ppIfDef.pas}

uses

{$IFDEF Delphi5}
  contnrs,
{$ENDIF}
  Classes, SysUtils, Forms, TypInfo, ppDsIntf, ppTypes, ppUtils,
  Windows, Dialogs, ppRTTI;

type

  TppCommunicator = class;
  TppCommunicatorClass = class of TppCommunicator;

  TppNotifyEvent = procedure (Sender: TObject; aCommunicator: TppCommunicator; aOperation: TppOperationType) of object;
  TppEventNotifyEvent = procedure (Sender: TObject; aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList) of object;


  { TppCommunicator }
  TppCommunicator = class(TComponent)
    private
      FComponentDesigner: TppComponentDesigner;
      FDesignState: TppDesignStates;
      FNotifyList: TList;
      FEventNotifyList: TList;
      FEvents: TppEvents;
      FUserName: TComponentName;
      FOnNotify: TppNotifyEvent;
      FOnEventNotify: TppEventNotifyEvent;

      procedure AddOrderedEventNotify(aCommunicator: TppCommunicator);
      function  GetFormDesigner: TppFormDesigner;
      function  GetNotifyCommunicator(aIndex: Integer): TppCommunicator;
      function  GetNotifyCommunicatorCount: Integer;

    protected
      function  GetDefaultUserName: String;
      function  GetUserName: TComponentName; virtual;
      procedure Loaded; override;
      procedure SetComponentDesigner(aComponentDesigner: TppComponentDesigner); virtual;
      procedure DSChanged(aDesignStateSet: TppDesignStates); virtual;
      procedure PropertyChange; virtual;
      procedure SetName(const NewName: TComponentName); override;
      procedure SetUserName(const aUserName: TComponentName); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure ChangeOwner(aNewOwner: TComponent); virtual;
      function  GetValidName(aComponent: TComponent): String;  virtual;

      procedure SetParentComponent(Value: TComponent); override;

      procedure SendEventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
      procedure SendNotify(aCommunicator: TppCommunicator; aOperation: TppOperationType);

      {communication routines}
      procedure AddNotify(aCommunicator: TppCommunicator);
      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); virtual;
      procedure RemoveNotify(aCommunicator: TppCommunicator);

      {event communication routines}
      procedure AddEventNotify(aCommunicator: TppCommunicator);
      procedure EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList); virtual;
      procedure RemoveEventNotify(aCommunicator: TppCommunicator);

      {state routines}
      procedure DSExclude(aDesignStateSet: TppDesignStates); virtual;
      procedure DSInclude(aDesignStateSet: TppDesignStates); virtual;

      {user name routines}
      function  IsValidUserName(aUserName: String): Boolean; virtual;
      function  FindUserObject(aUserName: String): TppCommunicator; virtual;
      function  FindUserObjectInComponent(aUserName: String; aComponent: TComponent): TppCommunicator;
      function  GetUniqueUserName(aComponent: TComponent): String; virtual;
      function  GetParentCommunicator: TppCommunicator;

      function EventOrder: String; virtual;

      property ComponentDesigner: TppComponentDesigner read FComponentDesigner write SetComponentDesigner;
      property DesignState: TppDesignStates read FDesignState;
      property EventNotifies: TppEvents read FEvents write FEvents;
      property FormDesigner: TppFormDesigner read GetFormDesigner;
      property NotifyCommunicators[Index: Integer]: TppCommunicator read GetNotifyCommunicator;
      property NotifyCommunicatorCount: Integer read GetNotifyCommunicatorCount;
      property UserName: TComponentName read GetUserName write SetUserName;

      property OnNotify: TppNotifyEvent read FOnNotify write FOnNotify;
      property OnEventNotify: TppEventNotifyEvent read FOnEventNotify write FOnEventNotify;

  end; {class, TppCommunicator}


  { TppCommunicatorPickList }
  TppCommunicatorPickList = class(TStringList)
    private
      FParent: TppCommunicator;
      FFormDesigner: TppFormDesigner;
      FComponentClass: TppCommunicatorClass;

      procedure AddComponent(aComponent: TComponent);

      procedure BuildList;
      procedure BuildListFromDataModule(aDataModule: TDataModule);

      procedure BuildListFromDesigner(aDesigner: TppFormDesigner);
      procedure BuildListFromOwner(aOwner: TComponent);

      procedure GetDataItemsCallback(const S: string);

      function GetComponentForName(aName: String): TppCommunicator;

      procedure SetParent(aParent: TppCommunicator);

    public
      constructor Create(aParent: TppCommunicator; aComponentClass: TppCommunicatorClass); virtual;

      procedure Refresh;

      property Parent: TppCommunicator read FParent write SetParent;

      property Components[aUserName: String]: TppCommunicator read GetComponentForName;

    end; {class, TppCommunicatorPickList}



{$IFDEF Delphi5}
  { TppComponentList }
  TppComponentList = class(TComponentList)
    public
      constructor Create(aOwner: TComponent); virtual;
  end;

{$ELSE}

  { TppComponentList }
  TppComponentList = class(TComponent)
    private
      FList: TList;

      function GetItems(aIndex: Integer): TComponent;

    public

      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notification(aComponent: TComponent; Operation: TOperation); override;

      procedure Add(aComponent: TComponent);
      procedure Delete(aIndex: Integer);
      function IndexOf(aComponent: TComponent): Integer;
      function Count: Integer;

      property Items[Index: Integer]: TComponent read GetItems; default;

    end;  {class, TppComponentList}


{$ENDIF}

  { TraTppCommunicatorRTTI }
  TraTppCommunicatorRTTI = class(TraTComponentRTTI)
    public
      class function  GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean; override;
      class function  GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
      class function  RefClass: TClass; override;
      class function  SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean; override;
  end; {class, TraTppCommunicatorRTTI}


implementation


{******************************************************************************
 *
 ** C O M M U N I C A T O R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCommunicator.Create }

constructor TppCommunicator.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FComponentDesigner := nil;
  FDesignState := [];
  FEventNotifyList := nil;
  FEvents := [];
  FNotifyList := nil;
  FOnNotify := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppCommunicator.Destroy }

destructor TppCommunicator.Destroy;
begin

  SendNotify(Self, ppopRemove);

  FNotifyList.Free;
  FEventNotifyList.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppCommunicator.Loaded }

procedure TppCommunicator.Loaded;
begin

  inherited Loaded;

  {required to ensure versions 3.5 and earlier have a user name}
  if ppCheckPropInfo(Self, 'UserName') and (FUserName = '') then
    SetUserName(GetDefaultUserName);

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TppCommunicator.GetNotifyCommunicator }

function TppCommunicator.GetNotifyCommunicator(aIndex: Integer): TppCommunicator;
begin
  if (FNotifyList <> nil) then
    Result := TppCommunicator(FNotifyList[aIndex])
  else
    Result := nil;
end; {function, GetNotifyCommunicator}

{------------------------------------------------------------------------------}
{ TppCommunicator.GetNotifyCommunicator }

function TppCommunicator.GetNotifyCommunicatorCount: Integer;
begin
  if (FNotifyList <> nil) then
    Result := FNotifyList.Count
  else
    Result := 0;
end; {function, GetNotifyCommunicator}

{------------------------------------------------------------------------------}
{ TppCommunicator.AddNotify }

procedure TppCommunicator.AddNotify(aCommunicator: TppCommunicator);
begin

  if (FNotifyList = nil) then
    FNotifyList := TList.Create;

  if FNotifyList.IndexOf(aCommunicator) < 0 then
    begin
      FNotifyList.Add(aCommunicator);
      aCommunicator.AddNotify(Self);
    end;

end; {procedure, AddNotify}

{------------------------------------------------------------------------------}
{ TppCommunicator.RemoveNotify }

procedure TppCommunicator.RemoveNotify(aCommunicator: TppCommunicator);
begin
  if (FNotifyList = nil) then Exit;

  if FNotifyList.IndexOf(aCommunicator) >= 0 then
    begin
      FNotifyList.Remove(aCommunicator);
      aCommunicator.RemoveNotify(Self);
    end;

  if (FNotifyList <> nil) and (FNotifyList.Count = 0) then
    begin
      FNotifyList.Free;
      FNotifyList := nil;
    end;

end; {procedure, RemoveNotify}

{------------------------------------------------------------------------------}
{ TppCommunicator.SendNotify }

procedure TppCommunicator.SendNotify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
var
  liNotify: Integer;
  lCommunicator: TppCommunicator;
begin
  if (FNotifyList = nil) then Exit;

  liNotify := FNotifyList.Count - 1;

  {note: process loop last to first because object that are notifiy will
         likely remove themselves from the list}
  while liNotify >= 0 do
    begin
      lCommunicator := TppCommunicator(FNotifyList[liNotify]);
      lCommunicator.Notify(aCommunicator, aOperation);
      Dec(liNotify);
    end;


end; {procedure, SendNotify}

{------------------------------------------------------------------------------}
{ TppCommunicator.Notify }

procedure TppCommunicator.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
var
  liIndex: Integer;
begin

  if Assigned(FOnNotify) then FOnNotify(Self, aCommunicator, aOperation);


  if (aOperation <> ppopRemove) then Exit;

  if (FNotifyList <> nil) then
    begin
      FNotifyList.Remove(aCommunicator);

     { if (FNotifyList.Count = 0) then
        begin
          FNotifyList.Free;
          FNotifyList := nil;
        end;}
    end;


 if (FEventNotifyList <> nil) then
    begin
      liIndex := FEventNotifyList.IndexOf(aCommunicator);

      if (liIndex <> -1) then
        FEventNotifyList.Delete(liIndex);

     { if (FEventNotifyList.Count = 0) then
        begin
          FEventNotifyList.Free;
          FEventNotifyList := nil;
        end;}
    end;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TppCommunicator.EventOrder }

function TppCommunicator.EventOrder: String;
begin
  Result := '';
end; {procedure, EventOrder}

{------------------------------------------------------------------------------}
{ TppCommunicator.AddEventNotify }

procedure TppCommunicator.AddEventNotify(aCommunicator: TppCommunicator);
begin

  if (FEventNotifyList = nil) then
    FEventNotifyList := TList.Create;

  if (FEventNotifyList.IndexOf(aCommunicator) < 0) then
    begin

      if (aCommunicator.EventOrder <> '') then
        AddOrderedEventNotify(aCommunicator)
      else
        FEventNotifyList.Add(aCommunicator);

      AddNotify(aCommunicator);
    end;

end; {procedure, AddEventNotify}

{------------------------------------------------------------------------------}
{ TppCommunicator.AddOrderedEventNotify }

procedure TppCommunicator.AddOrderedEventNotify(aCommunicator: TppCommunicator);
var
  lEventOrders: TStringList;
  liIndex: Integer;
  lCommunicator: TppCommunicator;
begin

  lEventOrders := TStringList.Create;

  for liIndex := 0 to FEventNotifyList.Count - 1 do
    begin
      lCommunicator := TppCommunicator(FEventNotifyList[liIndex]);

      lEventOrders.AddObject(lCommunicator.EventOrder, lCommunicator);
    end;

  lEventOrders.AddObject(aCommunicator.EventOrder, aCommunicator);

  lEventOrders.Sort;

  FEventNotifyList.Clear;

  for liIndex := 0 to lEventOrders.Count - 1 do
    FEventNotifyList.Add(lEventOrders.Objects[liIndex]);

  lEventOrders.Free;

end; {procedure, AddOrderedEventNotify}

{------------------------------------------------------------------------------}
{ TppCommunicator.RemoveEventNotify }

procedure TppCommunicator.RemoveEventNotify(aCommunicator: TppCommunicator);
var
  liIndex: Integer;
begin
  if (FEventNotifyList = nil) then Exit;

  liIndex := FEventNotifyList.IndexOf(aCommunicator);

  if (liIndex <> -1) then
    begin
      FEventNotifyList.Delete(liIndex);

      RemoveNotify(aCommunicator);
    end;

  if (FEventNotifyList <> nil) and (FEventNotifyList.Count = 0) then
    begin
      FEventNotifyList.Free;
      FEventNotifyList := nil;
    end;

end; {procedure, RemoveEventNotify}

{------------------------------------------------------------------------------}
{ TppCommunicator.SendEventNotify }

procedure TppCommunicator.SendEventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
var
  liIndex: Integer;
  lCommunicator: TppCommunicator;
begin
  if (FEventNotifyList = nil) then Exit;

  for liIndex := 0 to (FEventNotifyList.Count - 1) do
    begin
      lCommunicator := TppCommunicator(FEventNotifyList[liIndex]);

      if (aEventID in lCommunicator.EventNotifies) then
        lCommunicator.EventNotify(aCommunicator, aEventID, aParams);
    end;

end; {procedure, SendEventNotify}

{------------------------------------------------------------------------------}
{ TppCommunicator.EventNotify }

procedure TppCommunicator.EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
begin
  if Assigned(FOnEventNotify) then FOnEventNotify(Self, aCommunicator, aEventID, aParams);
end; {procedure, EventNotify}

{------------------------------------------------------------------------------}
{ TppCommunicator.DSInclude }

procedure TppCommunicator.DSInclude(aDesignStateSet: TppDesignStates);
begin

  {if diference of new set with existing set is empty, then do nothing}
  if (aDesignStateSet - FDesignState) = [] then Exit;

  FDesignState := FDesignState + aDesignStateSet;

  DSChanged(aDesignStateSet);
end; {procedure, DSInclude}

{------------------------------------------------------------------------------}
{ TppCommunicator.DSExclude }

procedure TppCommunicator.DSExclude(aDesignStateSet: TppDesignStates);
begin

  {if intersection of new set with existing set is empty, then do nothing}
  if (aDesignStateSet * FDesignState) = [] then Exit;

  FDesignState := FDesignState - aDesignStateSet;

  DSChanged(aDesignStateSet);
end; {procedure, DSExclude}

{------------------------------------------------------------------------------}
{ TppCommunicator.DSChanged }

procedure TppCommunicator.DSChanged(aDesignStateSet: TppDesignStates);
begin

end; {procedure, DSChanged}

{------------------------------------------------------------------------------}
{ TppCommunicator.SetComponentDesigner }

procedure TppCommunicator.SetComponentDesigner(aComponentDesigner: TppComponentDesigner);
begin
  FComponentDesigner := aComponentDesigner;
end; {procedure, SetComponentDesigner}

{------------------------------------------------------------------------------}
{ TppCommunicator.GetFormDesigner }

function TppCommunicator.GetFormDesigner: TppFormDesigner;
var
  lParent: TppCommunicator;

begin

  Result := nil;

  if ComponentDesigner <> nil then
    Result := ComponentDesigner.FormDesigner

  else
    begin

     {try parent, if possible}
     lParent := GetParentCommunicator;

     if (lParent <> nil)then
       Result := lParent.GetFormDesigner;

    end;


end; {function, GetFormDesigner}

{------------------------------------------------------------------------------}
{ TppCommunicator.GetValidName }

function TppCommunicator.GetValidName(aComponent: TComponent): String;
var
  lsNamingPrefix: String;
begin

  lsNamingPrefix := ppGetStdNamingPrefix(aComponent);

  if (Owner <> nil) then
   Result := ppGetUniqueName(Owner, lsNamingPrefix, aComponent)

  else  {run-time designing }
    Result := ppGetUniqueName(Self, lsNamingPrefix, aComponent);

end; {function, GetValidName}



{------------------------------------------------------------------------------}
{ TppCommunicator.PropertyChange }

procedure TppCommunicator.PropertyChange;
begin

end; {procedure, PropertyChange}

{------------------------------------------------------------------------------}
{ TppCommunicator.SetUserName }

procedure TppCommunicator.SetUserName(const aUserName: TComponentName);
var
  liNameNo: Integer;
  lObject: TObject;
  lsLastChar: String;
  lsUserName: String;


begin

{  if (FUserName = aUserName) then Exit;}

{  if ((csReading in ComponentState) or (csLoading in ComponentState)) and
     not (pppcPasting in DesignState)  then
    begin
      FUserName := aUserName;
      Exit;
    end;}

    
  if not IsValidIdent(aUserName) then Exit;

  if IsValidUserName(aUserName) then
      FUserName := aUserName
      
  else
    begin

      {check for a naming no}
      lsLastChar := Copy(aUserName, Length(aUserName), 1);

      liNameNo := StrToIntDef(lsLastChar, 0);

      {if a naming no exists then exit (allow naming to be handled elsewhere}
      if (liNameNo > 0) then Exit;

      {find a new username (ex. plCustomer should be plCustomer1) }
      repeat
        Inc(liNameNo);

        lsUserName := aUserName + IntToStr(liNameNo);

        lObject := FindUserObject(lsUserName);

      until (lObject = nil) or (lObject = Self);

      FUserName := lsUserName;

    end;


  SendNotify(Self, ppopUserNameChange);

end; {procedure, SetUserName}


{------------------------------------------------------------------------------}
{ TppCommunicator.SetName }

procedure TppCommunicator.SetName(const NewName: TComponentName);
var
  lbUpdateUserName: Boolean;
  
begin

  lbUpdateUserName := (FUserName = '') or (FUserName = Name)
                                       or (FUserName = Copy(Name, 3, Length(Name)));

  inherited SetName(NewName);


  if ((csReading in ComponentState) or (csLoading in ComponentState)) and
    not (pppcPasting in DesignState) then Exit;

  if lbUpdateUserName then
    SetUserName(GetDefaultUserName);

end; {procedure, SetName}

{------------------------------------------------------------------------------}
{ TppCommunicator.GetUserName }

function TppCommunicator.GetUserName: TComponentName;
begin

  Result := FUserName;

end; {function, GetUserName}

{------------------------------------------------------------------------------}
{ TppCommunicator.GetDefaultUserName }

function TppCommunicator.GetDefaultUserName: String;
begin

  {check whether Name contains 'pp' or 'ra' etc, if so strip it off}
  if Copy(Name, 1,2) = Copy(ClassName, 2,2) then
    Result := Copy(Name, 3, Length(Name))
  else
    Result := Name;

end; {function, GetDefaultUserName}


{------------------------------------------------------------------------------}
{ TppCommunicator.IsValidUserName }

function TppCommunicator.IsValidUserName(aUserName: String): Boolean;
var
  lObject: TObject;
  
begin

  Result := False;

  if not IsValidIdent(aUserName) then Exit;

  lObject := FindUserObject(aUserName);

  {if no object found or object is self, then user name is valid}
  Result := (lObject = nil)  or (lObject = Self);

end; {function, IsValidUserName}

{------------------------------------------------------------------------------}
{ TppCommunicator.GetParentCommunicator }

function TppCommunicator.GetParentCommunicator: TppCommunicator;
var
  lParent: TComponent;

begin

  Result := nil;

  if HasParent then
    begin

      lParent := GetParentComponent;

      if (lParent <> nil) and (lParent is TppCommunicator) then
          Result := TppCommunicator(lParent);

    end;


end;  {function, GetParentCommunicator}


{------------------------------------------------------------------------------}
{ TppCommunicator.GetUniqueUserName }

function TppCommunicator.GetUniqueUserName(aComponent: TComponent): String;
var
  lsNamingPrefix: String;
  lParent: TppCommunicator;

begin

  {defer to parent, if possible}
  lParent := GetParentCommunicator;

  if (lParent <> nil)then
    begin
      Result := lParent.GetUniqueUserName(aComponent);
      Exit;
    end;


  lsNamingPrefix := ppGetUserNamePrefix(aComponent);

  Result := ppGetUniqueName(aComponent.Owner, lsNamingPrefix, aComponent)

end; {function, GetUniqueUserName}


{------------------------------------------------------------------------------}
{ TppCommunicator.FindUserObject }

function TppCommunicator.FindUserObject(aUserName: String): TppCommunicator;
var
  lParent: TppCommunicator;

begin

  {defer to parent, if possible}
  lParent := GetParentCommunicator;

  if (lParent <> nil) then
    begin
      Result := lParent.FindUserObject(aUserName);
      Exit;
    end;


  if (Owner = nil) then
    begin
      Result := nil;
      Exit;
    end;


  Result := FindUserObjectInComponent(aUserName, Owner);


end; {function, FindUserObject}

{------------------------------------------------------------------------------}
{ TppCommunicator.FindUserObjectInComponent }

function TppCommunicator.FindUserObjectInComponent(aUserName: String; aComponent: TComponent): TppCommunicator;
var
  liComponent: Integer;
  liComponentCount: Integer;
  lCommunicator: TppCommunicator;

begin

  Result := nil;

  if (aComponent = nil) then Exit;

  liComponentCount := aComponent.ComponentCount;

  for liComponent := 0 to liComponentCount-1 do

    if (aComponent.Components[liComponent] is TppCommunicator) then
      begin
        lCommunicator := TppCommunicator(aComponent.Components[liComponent]);

        if (CompareText(lCommunicator.UserName, aUserName) = 0) then
          begin
            Result := lCommunicator;
            Exit;
          end;

      end;

end; {function, FindUserObjectInComponent}

{------------------------------------------------------------------------------}
{ TppCommunicator.SetParentComponent }

procedure TppCommunicator.SetParentComponent(Value: TComponent);
begin

end; {procedure, SetParentComponent}


{------------------------------------------------------------------------------}
{ TppCommunicator.ChangeOwner }

procedure TppCommunicator.ChangeOwner(aNewOwner: TComponent);
begin

  if (aNewOwner = Owner) then Exit;

  {remove from current owner}
  if Owner <> nil then
    Owner.RemoveComponent(Self);

  {assign new owner}
  if aNewOwner <> nil then
    begin
      {if (aNewOwner.FindComponent(Name) <> nil) then
        begin
          Name := ppGetUniqueName(aNewOwner, ppGetStdNamingPrefix(Self), Self);
        end; }
        
      if (FindUserObjectInComponent(FUserName, aNewOwner) <> nil) then
        FUserName := GetUniqueUserName(Self);

      aNewOwner.InsertComponent(Self);


    end;

end; {procedure, ChangeOwner}


{******************************************************************************
*
*  C o m m u n i c a t o r P i c k L i s t
*
******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCommunicatorPickList }

constructor TppCommunicatorPickList.Create(aParent: TppCommunicator; aComponentClass: TppCommunicatorClass);
begin

  FComponentClass := aComponentClass;

  SetParent(aParent);


end;  {procedure, Create}


{------------------------------------------------------------------------------}
{ TppCommunicatorPickList.AddComponent }

procedure TppCommunicatorPickList.AddComponent(aComponent: TComponent);
begin
  {only add to list, if pipeline's Visible property set to true}
  AddObject(TppCommunicator(aComponent).UserName, aComponent);

end; {procedure, AddComponent}


{------------------------------------------------------------------------------}
{ TppCommunicatorPickList.BuildList }

procedure TppCommunicatorPickList.BuildList;
begin

  Clear;

  if (FParent = nil) then Exit;

  {build list of data pipeline names}
  if (FFormDesigner = nil) or (FFormDesigner.Designer = nil) then
    BuildListFromOwner(FParent.Owner)
  else
    BuildListFromDesigner(FFormDesigner);

end; {procedure, BuildList}

{------------------------------------------------------------------------------}
{ TppCommunicatorPickList.Refresh }

procedure TppCommunicatorPickList.Refresh;
begin

  BuildList;

end; {procedure, Refresh}


{------------------------------------------------------------------------------}
{ TppCommunicatorPickList.SetParent }

procedure TppCommunicatorPickList.SetParent(aParent: TppCommunicator);
begin

  FParent := aParent;

  {get the form designer}
  if FParent <> nil then
    FFormDesigner := FParent.FormDesigner
  else
    FFormDesigner := nil;

  BuildList;

end; {procedure, SetParent}


{------------------------------------------------------------------------------}
{ TppCommunicatorPickList.BuildListFromDesigner }

procedure TppCommunicatorPickList.BuildListFromDesigner(aDesigner: TppFormDesigner);
begin
  aDesigner.GetComponentNames(GetTypeData(FComponentClass.ClassInfo), GetDataItemsCallback);

end; {procedure, BuildListFromDesigner}

{------------------------------------------------------------------------------}
{ TppCommunicatorPickList.GetDataItemsCallback }

procedure TppCommunicatorPickList.GetDataItemsCallback(const S: string);
var
  lComponent: TppCommunicator;

begin
  lComponent := TppCommunicator(FFormDesigner.GetComponent(S));
  AddObject(lComponent.UserName, lComponent);

end; {procedure, GetDataItemsCallback}


{------------------------------------------------------------------------------}
{ TppCommunicatorPickList.GetComponentForName }

function TppCommunicatorPickList.GetComponentForName(aName: String): TppCommunicator;
var
  liIndex: Integer;

begin
  liIndex := IndexOf(aName);

  if liIndex < 0 then
    Result := nil
  else
    Result := TppCommunicator(Objects[liIndex]);

end; {procedure, GetComponentForName}


{------------------------------------------------------------------------------}
{ TppCommunicatorPickList.BuildListFromOwner }

procedure TppCommunicatorPickList.BuildListFromOwner(aOwner: TComponent);
var
  liComponent: Integer;
  liComponents: Integer;
  liDataModule: Integer;

begin

  liComponents := aOwner.ComponentCount;

  {add components residing in owner}
  for liComponent := 0 to liComponents-1 do
    if aOwner.Components[liComponent] is FComponentClass then
      AddComponent(TppCommunicator(aOwner.Components[liComponent]));


  {add components residing in data modules }
  for liDataModule := 0 to Screen.DataModuleCount-1 do
    BuildListFromDataModule(Screen.DataModules[liDataModule]);

end; {procedure, BuildListFromOwner}

{------------------------------------------------------------------------------}
{ TppCommunicatorPickList.BuildListFromDataModule }

procedure TppCommunicatorPickList.BuildListFromDataModule(aDataModule: TDataModule);
var
  liComponent: Integer;

begin

  for liComponent := 0 to aDataModule.ComponentCount-1 do

    if aDataModule.Components[liComponent] is FComponentClass then
      AddComponent(TppCommunicator(aDataModule.Components[liComponent]));

end; {procedure, BuildListFromDataModule}


{******************************************************************************
*
*  C o m m u n i c a t o r P i c k L i s t C o m p o n e n t  L i s t
*
******************************************************************************}


{$IFDEF Delphi5}

{------------------------------------------------------------------------------}
{ TppComponentList.Create }

constructor TppComponentList.Create(aOwner: TComponent);
begin

  inherited Create;

  OwnsObjects := False;

end; {function, Create}

{$ELSE}

{------------------------------------------------------------------------------}
{ TppComponentList.Create }

constructor TppComponentList.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FList := TList.Create;

end; {function, Create}

{------------------------------------------------------------------------------}
{ TppComponentList.Destroy }

destructor TppComponentList.Destroy;
begin

  FList.Free;

  inherited Destroy;

end; {function, Create}

{------------------------------------------------------------------------------}
{ TppComponentList.GetItems }

function TppComponentList.GetItems(aIndex: Integer): TComponent;
begin

  Result := TComponent(FList[aIndex]);

end; {function, GetItems}


{------------------------------------------------------------------------------}
{ TppComponentList.Count }

function TppComponentList.Count: Integer;
begin
  Result := FList.Count;

end; {function, Count}


{------------------------------------------------------------------------------}
{ TppComponentList.IndexOf }

function TppComponentList.IndexOf(aComponent: TComponent): Integer;
begin
  Result := FList.IndexOf(aComponent);

end; {function, IndexOf}

{------------------------------------------------------------------------------}
{ TppComponentList.Add }

procedure TppComponentList.Add(aComponent: TComponent);
begin
  FList.Add(aComponent);

  aComponent.FreeNotification(Self);

end; {procedure, Add}

{------------------------------------------------------------------------------}
{ TppComponentList.Delete }

procedure TppComponentList.Delete(aIndex: Integer);
begin
  FList.Delete(aIndex);

end; {procedure, Remove}


{------------------------------------------------------------------------------}
{ TppComponentList.Notification }

procedure TppComponentList.Notification(aComponent: TComponent; Operation: TOperation);
var
  liIndex: Integer;
  
begin
  if (Operation = opRemove) then
    begin
      liIndex := (IndexOf(aComponent));

      if liIndex >= 0 then
        Delete(liIndex);

    end;


  inherited Notification(aComponent, Operation);

end; {procedure, Notification}


{$ENDIF}


{******************************************************************************
 *
 ** C O M M U N I C A T O R   R T T I
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TraTppCommunicatorRTTI.RefClass }

class function TraTppCommunicatorRTTI.RefClass: TClass;
begin
  Result := TppCommunicator;
end; {class function, RefClass}

{------------------------------------------------------------------------------}
{ TraTppCommunicatorRTTI.GetPropRec }

class function TraTppCommunicatorRTTI.GetPropRec(aClass: TClass; const aPropName: String; var aPropRec: TraPropRec): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'UserName') = 0 then
    PropToRec(aPropName, daString, False, aPropRec)

  else
    Result := inherited GetPropRec(aClass, aPropName, aPropRec);

end; {class function, GetPropRec}

{------------------------------------------------------------------------------}
{ TraTppCommunicatorRTTI.GetPropValue }

class function TraTppCommunicatorRTTI.GetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if CompareText(aPropName, 'UserName') = 0 then
    String(aValue) := TppCommunicator(aObject).UserName

  else
    Result := inherited GetPropValue(aObject, aPropName, aValue);

end; {class function, GetPropValue}

{------------------------------------------------------------------------------}
{ TraTppCommunicatorRTTI.SetPropValue }

class function TraTppCommunicatorRTTI.SetPropValue(aObject: TObject; const aPropName: String; var aValue): Boolean;
begin

  Result := True;

  if (CompareText(aPropName, 'UserName') = 0) then
    TppCommunicator(aObject).UserName := String(aValue)

  else
    Result := inherited SetPropValue(aObject, aPropName, aValue);

end; {class function, SetPropValue}


initialization

  raRegisterRTTI(TraTppCommunicatorRTTI);

finalization

  raUnRegisterRTTI(TraTppCommunicatorRTTI);

end.
