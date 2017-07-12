{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppCDShow;

interface

{$I ppIfDef.pas}

uses DsgnIntf, Classes, ppDsIntf;

{$IFDEF Delphi4}
procedure ppShowComponentDesigner(aFormDesigner: IFormDesigner; aComponent: TComponent);
{$ELSE}
procedure ppShowComponentDesigner(aFormDesigner: TFormDesigner; aComponent: TComponent);
{$ENDIF}


implementation

uses
  Dialogs, Forms,
  ppDsgWin, ppComm, ppTypes, ppForms;

{------------------------------------------------------------------------------}
{ ppShowComponentDesigner }

{$IFDEF Delphi4}
procedure ppShowComponentDesigner(aFormDesigner: IFormDesigner; aComponent: TComponent);
{$ELSE}
procedure ppShowComponentDesigner(aFormDesigner: TFormDesigner; aComponent: TComponent);
{$ENDIF}
var
  lCommunicator: TppCommunicator;
  lDesignWindow: TppDesignWindow;
  lComponentDesignerClass: TppComponentDesignerClass;
  lComponentDesigner: TppComponentDesigner;
  lsMsg: String;
{$IFDEF Demo}
  lFormClass: TFormClass;
  lDemoBox: TppCustomDemoDialog;
{$ENDIF}
begin

  if (aComponent = nil) then Exit;

  if not(aComponent is TppCommunicator) then Exit;

  lCommunicator := TppCommunicator(aComponent);

  if (lCommunicator.ComponentDesigner <> nil) then
    begin
      lComponentDesigner := lCommunicator.ComponentDesigner;

      if not lComponentDesigner.ValidSettings then
        begin
          MessageDlg(lComponentDesigner.ErrorMessage, mtError, [mbOK], 0);
          lComponentDesigner.Free;
        end
      else
        begin
          lCommunicator.ComponentDesigner.Show;

          if lCommunicator.ComponentDesigner.WindowState = wsMinimized then
            lCommunicator.ComponentDesigner.WindowState := wsNormal;
        end;
        
    end

  else

    begin

      lComponentDesignerClass := ppGetComponentDesignerClass(aComponent);

      if (lComponentDesignerClass = nil) then
        begin
          if (aComponent.ClassName = 'TppDataDictionary') then
            lsMsg := 'Data Dictionary Builder cannot be loaded because ' +
                      'DADE is not installed.'
          else
            lsMsg := 'No editor registered for this component';

          MessageDlg(lsMsg, mtError, [mbOK], 0);

          Exit;

        end;

      {create window which communicates with Object Inspector}
      lDesignWindow := TppDesignWindow.Create(Application);

      {create component designer with design window as owner}
      lComponentDesigner := lComponentDesignerClass.Create(lDesignWindow);

      {assign component designer to design window}
      lDesignWindow.ComponentDesigner := lComponentDesigner;

      {assign form designer to design window}
      lDesignWindow.Designer := aFormDesigner;

      {assign component designer to component}
      lCommunicator.ComponentDesigner := lComponentDesigner;

      {assign form to design window}
      if (aComponent.Owner <> nil) and (aComponent.Owner is TForm) then
        lDesignWindow.Form := TForm(aComponent.Owner);

      {assign form designer to component designer}
      lComponentDesigner.FormDesigner.Designer := aFormDesigner;

      {assign component to component designer}
      lComponentDesigner.Component := aComponent;

      if not lComponentDesigner.ValidSettings then
        begin
          MessageDlg(lComponentDesigner.ErrorMessage, mtError, [mbOK], 0);
          lComponentDesigner.Free;
        end
      else
        begin

          {display component designer }
          lComponentDesigner.Show;

{$IFDEF Demo}
          lFormClass := ppGetFormClass(TppCustomDemoDialog);
          lDemoBox := TppCustomDemoDialog(lFormClass.Create(Application));
          lDemoBox.ShowModal;

          lDemoBox.Release;
{$ENDIF}
        end;
        
   end;

end; {procedure, ppShowComponentDesigner}



end.
