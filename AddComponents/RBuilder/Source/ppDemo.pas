{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit ppDemo;

interface

{$I ppIfDef.pas}

uses
  Windows, Classes, Graphics, Forms, Controls, StdCtrls, Buttons, ExtCtrls, ppForms, ppTypes;

type

  { TppDemoDialog }
  TppDemoDialog = class(TppCustomDemoDialog)
    Button1: TButton;
    Panel1: TPanel;
    lblOrder: TLabel;
    Label6: TLabel;
    lblEMail: TLabel;
    lblPhone: TLabel;
    lblFax: TLabel;
    Label10: TLabel;
    lblURL: TLabel;
    Label1: TLabel;
    Image1: TImage;
    Shape1: TShape;
    Shape2: TShape;
    lblVersion: TLabel;
    lblEdition: TLabel;
    lblCopyright: TLabel;
    lblReportBuilder: TLabel;
    lblTrademarkSymbol2: TLabel;
    lblCopyrightSymbol1: TLabel;
    lblTrademarkSymbol1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end; {class, TppDemoDlg}

var
  ppDemoDialog: TppDemoDialog;

implementation

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TppDemoDialog.FormCreate }

procedure TppDemoDialog.FormCreate(Sender: TObject);
begin

  {set edition description}
  lblEdition.Caption := 'ReportBuilder ' + ppEdition + ' Edition';

  {set version description}
{$IFDEF Demo}
    lblVersion.Caption := 'Demo Copy - Version ' + ppVersion;
{$ELSE}
    lblVersion.Caption := 'Version ' + ppVersion;
{$ENDIF}

end; {procedure, FormCreate }

{------------------------------------------------------------------------------}
{ TppDemoDialog.FormActivate }

procedure TppDemoDialog.FormActivate(Sender: TObject);
begin

  if (Screen.PixelsPerInch <> 96) then
    begin
      Canvas.Font.Name := lblCopyRight.Font.Name;
      Canvas.Font.Size := lblCopyRight.Font.Size;

      lblTrademarkSymbol1.Left := lblReportBuilder.Left + lblReportBuilder.Width;
      lblCopyRightSymbol1.Left := lblCopyRight.Left + Canvas.TextWidth('CopyRight');
      lblTrademarkSymbol2.Left := lblCopyRight.Left + Canvas.TextWidth('Copyright       1996-1999 Digital Metaphors');
    end;

end; {procedure, FormActivate }

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  ppRegisterForm(TppCustomDemoDialog, TppDemoDialog);

finalization

  ppUnRegisterForm(TppCustomDemoDialog);

end.

