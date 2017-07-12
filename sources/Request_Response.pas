{************************************************************}
{       COMMON BPL - система работы с подгружаемыми пакетами }
{       автор   ѕотапов ƒ.ј. (dio) dio-sun@mail.ru           }
{класс. содержащий универсально успользуем€е пол€ и методы   }
{дл€ всех других объектов и библиотек bpl                    }
{ служит транспортом дл€ передачи параметров между любыми    }
{ част€ми системы  (c) 2002 год                              }
{************************************************************}

unit Request_Response;

interface
uses classes;
type
  TTypeParam = (ObjectType, VariantType);
  TAnyParam = class
    FTypeParam : TTypeParam; //тип параметра
    FVariantVal: Variant; //банальный вариант
    FObjectVal: TObject;
  private
    FName: String;
    procedure SetObjectValue(const Value: TObject);
    procedure SetVariantValue(const Value: Variant); //объектный тип
  public
    constructor Create(Name:String; VariantValue:Variant); overload;
    constructor Create(Name:String; ObjectValue:TObject); overload;
    destructor Destroy; override;
    property VariantValue:Variant read FVariantVal write SetVariantValue;
    property ObjectValue:TObject read FObjectVal write SetObjectValue;
    property TypeValue:TTypeParam read FTypeParam;
    property Name:String read FName; //название параметра
    //copy all fields from Source object to other
    procedure Assign(Source: TAnyParam); virtual;
   end;

Type
  TRequest_Response = class
    FListParams:TList; //список параметров
  public
    constructor Create; virtual;
    destructor Destroy; override;
    property ListParams:TList read FListParams;
    procedure AddParam(Name:String; Value:TObject); overload;
    procedure AddParam(Name:String; Value:Variant); overload;
    procedure RemoveParam(Name:String);
    procedure ClearParamsList(); //сбрасывает весь список
    //copy all fields from Source object to other
    procedure Assign(Source:TRequest_Response); virtual;
    function IndexOf(Name:String):integer; //return index of the item from List (-1 if not found)
    function LocateObj(Name:String):TObject; overload; //return param value from List
    function LocateObj(Index: integer): TObject; overload; //return param value from List by index
    function LocateVar(Name:String):Variant; overload; //return param value from List
    function LocateVar(Index: integer): Variant; overload; //return param value from List by index
end;
Type

  TParamRequest = class(TRequest_Response);

  TParamResponse = class(TRequest_Response);

implementation

uses sysUtils;
{ TRequest_Response }

procedure TRequest_Response.AddParam(Name: String; Value: Variant);
Var
 new_param:TAnyParam;
 index:integer;
begin
 index:=IndexOf(Name);
 If index<0 then //param not present - adding
  begin
   new_param:=TAnyParam.Create(Name, Value);
   FListParams.Add(new_param);
  end
 else //param is present and changing it
  begin
   TAnyParam(FListParams[index]).VariantValue:=Value;
  end;
end;

procedure TRequest_Response.AddParam(Name: String; Value: TObject);
Var
 new_param:TAnyParam;
 index:integer;
begin
 index:=IndexOf(Name);
 If index<0 then //param not present - adding
  begin
   new_param:=TAnyParam.Create(Name, Value);
   FListParams.Add(new_param);
  end
 else //param is present and changing it
  begin
   TAnyParam(FListParams[index]).ObjectValue:=Value;
  end;
end;

procedure TRequest_Response.Assign(Source: TRequest_Response);
Var
 i:integer;
begin
  self.ClearParamsList(); //почистить надо бы...
  For i:=0 to Source.ListParams.Count-1 do
   begin
     if (TAnyParam(Source.ListParams[i]).TypeValue=ObjectType) then
       self.AddParam(TAnyParam(Source.ListParams[i]).Name,
         TAnyParam(Source.ListParams[i]).ObjectValue)
     else
       self.AddParam(TAnyParam(Source.ListParams[i]).Name,
          TAnyParam(Source.ListParams[i]).VariantValue);
   end;
end;

procedure TRequest_Response.ClearParamsList;
Var
 i:integer;
begin
 for i:=0 to FListParams.Count - 1 do
  TAnyParam(FListParams[i]).Free;
 FListParams.Clear;
end;

constructor TRequest_Response.Create;
begin
 inherited;
 FListParams:=TList.Create();
end;

destructor TRequest_Response.Destroy;
begin
  inherited;
  FListParams.Free;
end;

function TRequest_Response.IndexOf(Name: String): integer;
Var
 i:integer;
begin
 result:=-1;
 for i:=0 to FListParams.Count - 1 do
  if UpperCase(TAnyParam(FListParams[i]).Name) = UpperCase(Name) then
   begin
     result:=i;
     break;
   end;
end;

function TRequest_Response.LocateObj(Name: String): TObject;
Var
 index:integer;
begin
 index:=IndexOf(Name);
 if (index>=0) and (TAnyParam(FListParams[index]).TypeValue=ObjectType)
    then result:=TAnyParam(FListParams[index]).ObjectValue
 else result:=nil;
end;

function TRequest_Response.LocateObj(Index: integer): TObject;
begin
 if (index>=0) and (TAnyParam(FListParams[index]).TypeValue=ObjectType)
    then result:=TAnyParam(FListParams[index]).ObjectValue
 else result:=nil;
end;

function TRequest_Response.LocateVar(Name: String): Variant;
Var
 index:integer;
begin
 index:=IndexOf(Name);
 if (index>=0) and (TAnyParam(FListParams[index]).TypeValue=VariantType)
    then result:=TAnyParam(FListParams[index]).VariantValue
 else result:=Unassigned;
end;

function TRequest_Response.LocateVar(Index: integer): Variant;
begin
 if (index>=0) and (TAnyParam(FListParams[index]).TypeValue=VariantType)
    then result:=TAnyParam(FListParams[index]).VariantValue
 else result:=Unassigned;
end;

procedure TRequest_Response.RemoveParam(Name: String);
Var
 index:integer;
begin
 index:=IndexOf(Name);
 if index>=0 then
  begin
   TAnyParam(FListParams[index]).Free;
   FListParams.Delete(index);
  end
end;

{ TAnyParam }

//copy all fields from Source object to other
procedure TAnyParam.Assign(Source: TAnyParam);
begin
{   self.FTypeParam : Source.TypeValue; //тип параметра
 if (Source.TypeValue = ObjectType) then
     self.ObjectValue(Source.ObjectValue);
 else
     self.VariantValue(Source.VariantValue);
 self.FName:= Source.Name;
}end;

constructor TAnyParam.Create(Name: String; ObjectValue: TObject);
begin
 FName:=Name;
 self.ObjectValue:=ObjectValue;
end;

constructor TAnyParam.Create(Name: String; VariantValue: Variant);
begin
 FName:=Name;
 self.VariantValue:=VariantValue;
end;

destructor TAnyParam.Destroy;
begin
  inherited;
  self.ObjectValue:=nil;
end;

procedure TAnyParam.SetObjectValue(const Value: TObject);
begin
 FTypeParam:=ObjectType;
 FObjectVal:=Value;
 FVariantVal:=unassigned;
end;

procedure TAnyParam.SetVariantValue(const Value: Variant);
begin
 FTypeParam:=VariantType;
 FObjectVal:=nil;
 FVariantVal:=Value;
end;

initialization


finalization

end.
