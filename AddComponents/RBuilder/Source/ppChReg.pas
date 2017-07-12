{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}


unit ppChReg;

interface

{$I ppIfDef.pas}

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}

{$IFDEF Tee40}
  ppChrtDP,
{$ENDIF}

  Classes, Graphics, ExtCtrls, SysUtils, Forms, Controls, Dialogs, Menus, DsgnIntf,
  Chart, DBChart, TeEngine, TeExport,
  ppClass, ppCtrls, ppTypes, ppUtils, ppDevice, ppDrwCmd, ppChrt, ppChrtDB;

type

  { TppTeeChartProperty }
  TppTeeChartProperty = class(TClassProperty)
    public
      procedure Edit; override;
      function GetValue: string; override;
      function GetAttributes : TPropertyAttributes; override;
  end; {class, TppTeeChartProperty}


procedure Register;

implementation

{******************************************************************************
 *
 ** C H A R T   P R O P E R T Y   E D I T O R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppTeeChartProperty.Edit }

procedure TppTeeChartProperty.Edit;
var
  lChartComponent: TppCustomTeeChart;
begin

  lChartComponent := TppCustomTeeChart(GetComponent(0));

  lChartComponent.Edit;

  Designer.Modified;
end;

{------------------------------------------------------------------------------}
{ TppTeeChartProperty.GetAttributes }

function TppTeeChartProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

{------------------------------------------------------------------------------}
{ TppTeeChartProperty.GetValue }

function TppTeeChartProperty.GetValue: string;
begin
  FmtStr(Result, '(%s)', [GetPropType^.Name]);
end;

{******************************************************************************
 *
 ** R E G I S T E R
 *
{******************************************************************************}

procedure Register;
begin
  RegisterNoIcon([TppTeeChart, TppDBTeeChart]);

  RegisterPropertyEditor(TypeInfo(TCustomChart), TppTeeChart, 'Chart', TppTeeChartProperty);
  RegisterPropertyEditor(TypeInfo(TCustomChart), TppDBTeeChart, 'Chart', TppTeeChartProperty);

{$IFDEF Tee40}
  RegisterNoIcon([TppDPTeeChart]);

  RegisterPropertyEditor(TypeInfo(TCustomChart), TppDPTeeChart, 'Chart', TppTeeChartProperty);
{$ENDIF}

end;



end.
