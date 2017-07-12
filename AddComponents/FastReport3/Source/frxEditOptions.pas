{******************************************}
{ }
{ FastReport v3.0 }
{ Designer options }
{ }
{ Copyright (c) 1998-2005 }
{ by Alexander Tzyganenko, }
{ Fast Reports Inc. }
{ }
{******************************************}

unit frxEditOptions;

interface

{$I frx.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, frxCtrls
{$IFDEF Delphi6}
, Variants
{$ENDIF};
  

type
  TfrxOptionsEditor = class(TForm)
    OkB:TButton;
    CancelB:TButton;
    ColorDialog:TColorDialog;
    RestoreDefaultsB:TButton;
    Label1:TGroupBox;
    Label2:TLabel;
    Label3:TLabel;
    Label4:TLabel;
    Label13:TLabel;
    Label14:TLabel;
    Label15:TLabel;
    Label16:TLabel;
    CMRB:TRadioButton;
    InchesRB:TRadioButton;
    PixelsRB:TRadioButton;
    CME:TEdit;
    InchesE:TEdit;
    PixelsE:TEdit;
    DialogFormE:TEdit;
    ShowGridCB:TCheckBox;
    AlignGridCB:TCheckBox;
    Label6:TGroupBox;
    Label7:TLabel;
    Label8:TLabel;
    Label9:TLabel;
    Label10:TLabel;
    CodeWindowFontCB:TComboBox;
    CodeWindowSizeCB:TComboBox;
    MemoEditorFontCB:TComboBox;
    MemoEditorSizeCB:TComboBox;
    ObjectFontCB:TCheckBox;
    Label11:TGroupBox;
    WorkspacePB:TPaintBox;
    ToolPB:TPaintBox;
    WorkspaceB:TButton;
    ToolB:TButton;
    LCDCB:TCheckBox;
    Label5:TGroupBox;
    Label12:TLabel;
    Label17:TLabel;
    EditAfterInsCB:TCheckBox;
    FreeBandsCB:TCheckBox;
    GapE:TEdit;
    BandsCaptionsCB:TCheckBox;
    DropFieldsCB:TCheckBox;
    StartupCB:TCheckBox;
    procedure FormCreate(Sender:TObject);
    procedure WorkspacePBPaint(Sender:TObject);
    procedure ToolPBPaint(Sender:TObject);
    procedure WorkspaceBClick(Sender:TObject);
    procedure ToolBClick(Sender:TObject);
    procedure RestoreDefaultsBClick(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure FormHide(Sender:TObject);
  private
    { Private declarations }
    FWColor:TColor;
    FTColor:TColor;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

uses frxDesgn, frxDesgnWorkspace, frxUtils, frxRes;

{ TfrxPreferencesEditor }

procedure TfrxOptionsEditor.FormShow(Sender:TObject);

  procedure SetEnabled(cAr:Array of TControl; Enabled:Boolean);
  var
    i:Integer;
  begin
    for i:= 0 to High(cAr) do
      cAr[i].Enabled:= Enabled;
  end;

begin
  ColorDialog.CustomColors.Add('ColorA='+IntToHex(ColorToRGB(clBtnFace), 6));

  with TfrxDesignerForm(Owner) do
  begin
    CodeWindowFontCB.Items.Assign(Screen.Fonts);
    MemoEditorFontCB.Items.Assign(Screen.Fonts);

    SetEnabled([CMRB, InchesRB, PixelsRB, CME, InchesE, PixelsE],
      (Workspace.GridType<>gtDialog) and (Workspace.GridType<>gtChar));

    CMRB.Checked:= Units = duCM;
    InchesRB.Checked:= Units = duInches;
    PixelsRB.Checked:= Units = duPixels;

    CME.Text:= FloatToStr(GridSize1);
    InchesE.Text:= FloatToStr(GridSize2);
    PixelsE.Text:= FloatToStr(GridSize3);
    DialogFormE.Text:= FloatToStr(GridSize4);

    ShowGridCB.Checked:= ShowGrid;
    AlignGridCB.Checked:= GridAlign;
    EditAfterInsCB.Checked:= EditAfterInsert;
    BandsCaptionsCB.Checked:= Workspace.ShowBandCaptions;
    DropFieldsCB.Checked:= DropFields;
    StartupCB.Checked:= ShowStartup;
    FreeBandsCB.Checked:= Workspace.FreeBandsPlacement;
    GapE.Text:= IntToStr(Workspace.GapBetweenBands);

    CodeWindowFontCB.Text:= CodeWindow.Font.Name;
    CodeWindowSizeCB.Text:= IntToStr(CodeWindow.Font.Size);
    MemoEditorFontCB.Text:= MemoFontName;
    MemoEditorSizeCB.Text:= IntToStr(MemoFontSize);
    ObjectFontCB.Checked:= UseObjectFont;

    FWColor:= WorkspaceColor;
    FTColor:= ToolsColor;
    LCDCB.Checked:= Workspace.GridLCD;
  end;
end;

procedure TfrxOptionsEditor.FormHide(Sender:TObject);
begin
  if ModalResult = mrOk then
    with TfrxDesignerForm(Owner) do
    begin
      GridSize4:= frxStrToFloat(DialogFormE.Text);

      if CMRB.Enabled then
      begin
        GridSize1:= frxStrToFloat(CME.Text);
        GridSize2:= frxStrToFloat(InchesE.Text);
        GridSize3:= frxStrToFloat(PixelsE.Text);

        if CMRB.Checked then
          Units:= duCM
        else if InchesRB.Checked then
          Units:= duInches else
          Units:= duPixels;
      end;

      ShowGrid:= ShowGridCB.Checked;
      GridAlign:= AlignGridCB.Checked;
      EditAfterInsert:= EditAfterInsCB.Checked;
      Workspace.ShowBandCaptions:= BandsCaptionsCB.Checked;
      DropFields:= DropFieldsCB.Checked;
      ShowStartup:= StartupCB.Checked;
      Workspace.FreeBandsPlacement:= FreeBandsCB.Checked;
      Workspace.GapBetweenBands:= StrToInt(GapE.Text);

      CodeWindow.Font.Name:= CodeWindowFontCB.Text;
      CodeWindow.Font.Size:= StrToInt(CodeWindowSizeCB.Text);
      MemoFontName:= MemoEditorFontCB.Text;
      MemoFontSize:= StrToInt(MemoEditorSizeCB.Text);
      UseObjectFont:= ObjectFontCB.Checked;

      WorkspaceColor:= FWColor;
      ToolsColor:= FTColor;
      Workspace.GridLCD:= LCDCB.Checked;
    end;
end;

procedure TfrxOptionsEditor.WorkspacePBPaint(Sender:TObject);
begin
  with WorkspacePB.Canvas do
  begin
    Pen.Color:= clGray;
    Brush.Color:= FWColor;
    Rectangle(0, 0, 161, 21);
  end;
end;

procedure TfrxOptionsEditor.ToolPBPaint(Sender:TObject);
begin
  with ToolPB.Canvas do
  begin
    Pen.Color:= clGray;
    Brush.Color:= FTColor;
    Rectangle(0, 0, 161, 21);
  end;
end;

procedure TfrxOptionsEditor.WorkspaceBClick(Sender:TObject);
begin
  ColorDialog.Color:= FWColor;
  if ColorDialog.Execute then
    FWColor:= ColorDialog.Color;
  WorkspacePB.Repaint;
end;

procedure TfrxOptionsEditor.ToolBClick(Sender:TObject);
begin
  ColorDialog.Color:= FTColor;
  if ColorDialog.Execute then
    FTColor:= ColorDialog.Color;
  ToolPB.Repaint;
end;

procedure TfrxOptionsEditor.RestoreDefaultsBClick(Sender:TObject);
begin
  TfrxDesignerForm(Owner).RestoreState(True);
  ModalResult:= mrOk;
end;

procedure TfrxOptionsEditor.FormCreate(Sender:TObject);
begin
  frxResources.LocalizeForm(Self);
end;

end.
