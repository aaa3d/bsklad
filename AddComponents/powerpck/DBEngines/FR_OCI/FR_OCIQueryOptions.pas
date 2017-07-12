{******************************************}
{                                          }
{     FastReport v2.4 - OCI components     }
{           Query options editor           }
{                                          }
{ Copyright (c) 2001 by Andre Romashchenko }
{                                          }
{******************************************}


unit FR_OCIQueryOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, NCOci, NCOciWrapper, NCOciDB;

type
  TfrOCIQueryOptions = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edSQLMacroChar: TEdit;
    edFixedMacroChar: TEdit;
    edDateTimeFormat: TEdit;
    edDateFormat: TEdit;
    edAssignDateTimeFormat: TEdit;
    edAssignDateFormat: TEdit;
    chEnableBCD: TCheckBox;
    chEnableFixedString: TCheckBox;
    chEnableInteger: TCheckBox;
    chEnableLongString: TCheckBox;
    chEnableNumber: TCheckBox;
    chEnableRequired: TCheckBox;
    chStrsEmpty2Null: TCheckBox;
    chStrsTrim: TCheckBox;
    Bevel1: TBevel;
    Label7: TLabel;
    chFetchAll: TCheckBox;
    chPieceBuffOwn: TCheckBox;
    Label8: TLabel;
    edFetchExact: TEdit;
    Label9: TLabel;
    edInrecDataSize: TEdit;
    Label10: TLabel;
    edPieceBuffSize: TEdit;
    Label11: TLabel;
    edRowsetSize: TEdit;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowfrOCIQueryOptions(AQuery: TOCIQuery);
  end;

implementation

{$R *.DFM}

{ TfrOCIQueryOptions }

class procedure TfrOCIQueryOptions.ShowfrOCIQueryOptions(AQuery: TOCIQuery);
begin
  with TfrOCIQueryOptions.Create(nil) do
  try
    edAssignDateFormat.Text:= AQuery.DataFormat.AssignDateFormat;
    edAssignDateTimeFormat.Text:= AQuery.DataFormat.AssignDateTimeFormat;
    edDateFormat.Text:= AQuery.DataFormat.DateFormat;
    edDateTimeFormat.Text:= AQuery.DataFormat.DateTimeFormat;
    edFixedMacroChar.Text:= AQuery.DataFormat.FixedMacroChar;
    edSQLMacroChar.Text:= AQuery.DataFormat.SQLMacroChar;
    chEnableBCD.Checked:= AQuery.DataFormat.EnableBCD;
    chEnableFixedString.Checked:= AQuery.DataFormat.EnableFixedString;
    chEnableInteger.Checked:= AQuery.DataFormat.EnableInteger;
    chEnableLongString.Checked:= AQuery.DataFormat.EnableLongString;
    chEnableNumber.Checked:= AQuery.DataFormat.EnableNumber;
    chEnableRequired.Checked:= AQuery.DataFormat.EnableRequired;
    chStrsEmpty2Null.Checked:= AQuery.DataFormat.StrsEmpty2Null;
    chStrsTrim.Checked:= AQuery.DataFormat.StrsTrim;

    chFetchAll.Checked:= AQuery.FetchParams.FetchAll;
    chPieceBuffOwn.Checked:= AQuery.FetchParams.PieceBuffOwn;
    edFetchExact.Text:= IntToStr(AQuery.FetchParams.FetchExact);
    edInrecDataSize.Text:= IntToStr(AQuery.FetchParams.InrecDataSize);
    edPieceBuffSize.Text:= IntToStr(AQuery.FetchParams.PieceBuffSize);
    edRowsetSize.Text:= IntToStr(AQuery.FetchParams.RowsetSize);
    if ShowModal= mrOK then
    begin
      AQuery.DataFormat.AssignDateFormat:= edAssignDateFormat.Text;
      AQuery.DataFormat.AssignDateTimeFormat:= edAssignDateTimeFormat.Text;
      AQuery.DataFormat.DateFormat:= edDateFormat.Text;
      AQuery.DataFormat.DateTimeFormat:= edDateTimeFormat.Text;
      AQuery.DataFormat.FixedMacroChar:= edFixedMacroChar.Text[1];
      AQuery.DataFormat.SQLMacroChar:= edSQLMacroChar.Text[1];
      AQuery.DataFormat.EnableBCD:= chEnableBCD.Checked;
      AQuery.DataFormat.EnableFixedString:= chEnableFixedString.Checked;
      AQuery.DataFormat.EnableInteger:= chEnableInteger.Checked;
      AQuery.DataFormat.EnableLongString:= chEnableLongString.Checked;
      AQuery.DataFormat.EnableNumber:= chEnableNumber.Checked;
      AQuery.DataFormat.EnableRequired:= chEnableRequired.Checked;
      AQuery.DataFormat.StrsEmpty2Null:= chStrsEmpty2Null.Checked;
      AQuery.DataFormat.StrsTrim:= chStrsTrim.Checked;

      AQuery.FetchParams.FetchAll:= chFetchAll.Checked;
      AQuery.FetchParams.PieceBuffOwn:= chPieceBuffOwn.Checked;
      AQuery.FetchParams.FetchExact:= StrToInt(edFetchExact.Text);
      AQuery.FetchParams.InrecDataSize:= StrToInt(edInrecDataSize.Text);
      AQuery.FetchParams.PieceBuffSize:= StrToInt(edPieceBuffSize.Text);
      AQuery.FetchParams.RowsetSize:= StrToInt(edRowsetSize.Text);
    end;
  finally
    Free;
  end;
end;

end.
