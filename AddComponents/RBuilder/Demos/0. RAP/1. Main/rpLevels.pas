{******************************************************************************}
{                                                                              }
{                   ReportBuilder CrossTab Demos                                    }
{                                                                              }
{             Copyright (c) 1996-1999 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit rpLevels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TrapLevelDirectory = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
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
  rapLevelDirectory: TrapLevelDirectory;

implementation

{$R *.DFM}

procedure TrapLevelDirectory.FormCreate(Sender: TObject);
begin
  FButtonIndex := 0;
  FOnButtonClick := nil;
end;

procedure TrapLevelDirectory.DoOnButtonClick;
begin
  if Assigned(FOnButtonClick) then FOnButtonClick(Self);
end;

procedure TrapLevelDirectory.SpeedButton14Click(Sender: TObject);
begin
  FButtonIndex := TSpeedButton(Sender).Tag;

  DoOnButtonClick;
end;





end.
