{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppCTDlg;

interface

{$I ppIfDef.pas}

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls,
  StdCtrls, Buttons, ExtCtrls, IniFiles,
  ppClass, ppTypes, ppUtils, ppForms, ppCtMain, ppCTDsgn;

type

  { TppCrossTabDesignerForm }
  TppCrossTabDesignerForm = class(TppCustomCrossTabDesignerForm)
    pnlButtons: TPanel;
    pnlOKCancel: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    sbrStatus: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);

  private
    FCancelClicked: Boolean;
    FCrossTab: TppCrossTab;
    FDesigner: TppCrossTabDesigner;

    procedure LoadStateInfo;
    procedure SaveStateInfo;

  protected
    procedure LanguageChanged; override;

  end; {class, TppCrossTabDesignerForm }


implementation

{$R *.DFM}


{******************************************************************************
 *
 ** C R O S S T A B   D E S I G N E R   F OR M
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerForm.FormCreate }

procedure TppCrossTabDesignerForm.FormCreate(Sender: TObject);
begin

  FCancelClicked := False;

  FDesigner := TppCrossTabDesigner.Create(Self);
  FDesigner.Parent := Self;
  FDesigner.Align := alClient;

  LoadStateInfo;

end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerForm.FormDestroy }

procedure TppCrossTabDesignerForm.FormDestroy(Sender: TObject);
begin

  FDesigner.Free;

end; {procedure, FormDestroy}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerForm.FormClose }

procedure TppCrossTabDesignerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  SaveStateInfo;

  if FCancelClicked then Exit;

  ModalResult := mrOK;

  {transfer new configuration to crosstab}
  if FDesigner.CrossTab.Modified then
    FCrossTab.Assign(FDesigner.CrossTab);

end; {procedure, FormClose}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerForm.FormActivate }

procedure TppCrossTabDesignerForm.FormActivate(Sender: TObject);
begin

  if (CrossTab = nil) or not(CrossTab is TppCrossTab) then Exit;

  FCrossTab := TppCrossTab(CrossTab);

  FDesigner.CrossTab := FCrossTab;

end; {procedure, FormActivate}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerForm.btnCancelClick }

procedure TppCrossTabDesignerForm.btnCancelClick(Sender: TObject);
begin
  FCancelClicked := True;
end; {procedure, btnCancelClick}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerForm.LoadStateInfo }

procedure TppCrossTabDesignerForm.LoadStateInfo;
var
  lIniFile: TIniFile;
  lScreenRes: TPoint;
  liLeft: Integer;
  liTop: Integer;
  liWidth: Integer;
  liHeight: Integer;
  liWindowState: Integer;
begin

  lIniFile := TIniFile.Create('RBuilder.ini');

  {calc default screen size }
  lScreenRes := ppGetScreenRes;

  liWidth  := 790;
  liHeight := 600;

  if lScreenRes.X <> 1024 then
    begin
      liWidth  := (liWidth  * lScreenRes.X)  div 1024;
      liHeight := (Height * lScreenRes.Y) div 768;
    end;

  {default to center of screen}
  liLeft := (Screen.Width  - liWidth)  div 2;
  liTop  := (Screen.Height - liHeight) div 2;

  liWindowState := lIniFile.ReadInteger('Crosstab Dialog', 'WindowState', Ord(wsNormal));

  if TWindowState(liWindowState) = wsNormal then
    begin
      liLeft   := lIniFile.ReadInteger('Crosstab Dialog', 'Left',   liLeft);
      liTop    := lIniFile.ReadInteger('Crosstab Dialog', 'Top',    liTop);
      liWidth  := lIniFile.ReadInteger('Crosstab Dialog', 'Width',  liWidth);
      liHeight := lIniFile.ReadInteger('Crosstab Dialog', 'Height', liHeight);
    end;

  SetBounds(liLeft, liTop, liWidth, liHeight);

  if TWindowState(liWindowState) <> wsMinimized then
    WindowState :=  TWindowState(liWindowState);

  FDesigner.FieldPanel.Width := lIniFile.ReadInteger('Crosstab Dialog', 'Field List Width', 185);
  FDesigner.DisplayTips := lIniFile.ReadBool('Crosstab Dialog', 'Tips Visible', True);

  lIniFile.Free;

end; {procedure, LoadStateInfo}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerForm.SaveStateInfo }

procedure TppCrossTabDesignerForm.SaveStateInfo;
var
  lIniFile: TIniFile;
begin

  lIniFile := TIniFile.Create('RBuilder.ini');

  lIniFile.WriteInteger('Crosstab Dialog', 'WindowState', Ord(WindowState));

  lIniFile.WriteInteger('Crosstab Dialog', 'Left',   Left);
  lIniFile.WriteInteger('Crosstab Dialog', 'Top',    Top);
  lIniFile.WriteInteger('Crosstab Dialog', 'Width',  Width);
  lIniFile.WriteInteger('Crosstab Dialog', 'Height', Height);

  lIniFile.WriteInteger('Crosstab Dialog', 'Field List Width', FDesigner.FieldPanel.Width);
  lIniFile.WriteBool('Crosstab Dialog', 'Tips Visible', FDesigner.DisplayTips);

  lIniFile.Free;

end; {procedure, SaveStateInfo}

{------------------------------------------------------------------------------}
{ TppCrossTabDesignerForm.LanguageChanged}

procedure TppCrossTabDesignerForm.LanguageChanged;
begin

  Caption := ppLoadStr(662); {'Configure Crosstab'}

  btnOK.Caption := ppLoadStr(ppMsgOK);
  btnCancel.Caption := ppLoadStr(ppMsgCancel);

end; {procedure, LanguageChanged}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterForm(TppCustomCrossTabDesignerForm, TppCrossTabDesignerForm);

finalization

  ppUnRegisterForm(TppCustomCrossTabDesignerForm);

end.
