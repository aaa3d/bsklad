{******************************************************************************}
{                                                                              }
{                      ReportBuilder CrossTab Demos                            }
{                                                                              }
{            Copyright (c) 1996, 2000 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit ctLevels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TctLevelDirectory = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    SpeedButton5: TSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton6: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    SpeedButton7: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    SpeedButton8: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    SpeedButton9: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    SpeedButton10: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    SpeedButton11: TSpeedButton;
    Label23: TLabel;
    Label24: TLabel;
    SpeedButton12: TSpeedButton;
    Label25: TLabel;
    Label26: TLabel;
    SpeedButton13: TSpeedButton;
    Label27: TLabel;
    Label28: TLabel;
    SpeedButton14: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
  private
    FOnButtonClick: TNotifyEvent;
    FButtonIndex: Integer;

    procedure DoOnButtonClick;

  public
    property OnButtonClick: TNotifyEvent read FOnButtonClick write FOnButtonClick;
    property ButtonIndex: Integer read FButtonIndex;

  end;

var
  ctLevelDirectory: TctLevelDirectory;

implementation

{$R *.DFM}

procedure TctLevelDirectory.FormCreate(Sender: TObject);
begin
  FButtonIndex := 0;
  FOnButtonClick := nil;
end;

procedure TctLevelDirectory.DoOnButtonClick;
begin
  if Assigned(FOnButtonClick) then FOnButtonClick(Self);
end;

procedure TctLevelDirectory.SpeedButton14Click(Sender: TObject);
begin
  FButtonIndex := TSpeedButton(Sender).Tag;

  DoOnButtonClick;
end;





end.
