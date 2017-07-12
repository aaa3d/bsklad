{******************************************}
{                                          }
{             FastReport v2.4              }
{           Add Function Library           }
{                                          }
{ Copyright (c) 1998-2001 by Tzyganenko A. }
{ Copyright (c) 2001 by Stalker SoftWare   }
{                                          }
{******************************************}

unit frFunction;

interface

uses
  Classes, SysUtils, FR_Class, FR_Const, FR_Utils;

{$I FR.inc}

type
  TfrAddFunctionLibrary = class(TComponent)
  private
    FFormatDate :String;
    procedure SetFormatDate(const Value: String);
  published
    constructor Create(AOwner: TComponent); override;
    property FormatDate: String read FFormatDate write SetFormatDate;
  end;

type
  TAddFunctionLibrary = class(TfrFunctionLibrary)
  private
    procedure DoScriptF(cScript: String);
    procedure DoInitStr;
    procedure DoInitNum;
    procedure DoInitDate;
    procedure DoInitSQL;
    procedure DoInitMath;
    procedure DoInitOther;
  public
    constructor Create; override;
    procedure DoFunction(FNo: Integer; p1, p2, p3: Variant; var val: Variant); override;
  end;

 procedure Register;

implementation

{$R fr_addfn.res}


uses
  frFuncStr, frFuncNum, frFuncDate, frFuncSQL, frFConst;

 function ConvCS(cStr :String) :TfrCharSet; forward;


var
  cFFormatDate :String;

{ TfrAddFunctionLibrary }

{--------------------------------------------------------------------}
{ Create TfrAddFunctionLibrary                                       }
{--------------------------------------------------------------------}
constructor TfrAddFunctionLibrary.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);

 FFormatDate := '';
 cFFormatDate := '';
end; { Create }

{--------------------------------------------------------------------}
{ Save property FormatDate                                           }
{--------------------------------------------------------------------}
procedure TfrAddFunctionLibrary.SetFormatDate(const Value: String);
begin
 FFormatDate := Value;
 cFFormatDate := Value;
end; { SetFormatDate }


{ TAddFunctionLibrary }

{--------------------------------------------------------------------}
{ Create library                                                     }
{--------------------------------------------------------------------}
constructor TAddFunctionLibrary.Create;
begin

 inherited Create;

 with List do begin
   Add('ABS');
   Add('CHR');
   Add('COMPARESTR');
   Add('CREATEDATE');
   Add('CREATENUM');
   Add('CREATESTR');
   Add('DATEDIFF');
   Add('DATETOSTR');
   Add('DAYSPERMONTH');
   Add('DELETE');
   Add('ENDPOS');
   Add('EXTRACTWORD');
   Add('FIRSTDAYOFNEXTMONTH');
   Add('FIRSTDAYOFPREVMONTH');
   Add('INCDATE');
   Add('INCDAY');
   Add('INCMONTH');
   Add('INCTIME');  
   Add('INCYEAR');
   Add('INSERT');
   Add('ISLEAPYEAR');
   Add('ISRANGEDATE');
   Add('ISRANGENUM');
   Add('ISWORDPRESENT');
   Add('LASTDAYOFPREVMONTH');
   Add('LEFTCOPY');
   Add('NPOS');
   Add('PADCENTER');
   Add('PADLEFT');
   Add('PADRIGHT');
   Add('REPLACESTR');
   Add('REPLICATE');
   Add('RIGHTCOPY');
   Add('STRTODATEDEF');
   Add('STRTOFLOAT');
   Add('STRTOFLOATDEF');
   Add('STRTOINT');
   Add('STRTOINTDEF');
   Add('SWAP');
   Add('TIMETOSTR');
   Add('TRIMLEFT');
   Add('TRIMRIGHT');
   Add('VALIDDATE');
   Add('VALIDFLOAT');
   Add('VALIDINT');
   Add('WORDCOUNT');
   Add('WORDPOSITION');
 end; { with }

 DoInitStr;
 DoInitNum;
 DoInitDate;
 DoInitSQL;
 DoInitMath;
 DoInitOther;

end; { Create }

{--------------------------------------------------------------------}
{ Processing the call function                                       }
{--------------------------------------------------------------------}
procedure TAddFunctionLibrary.DoFunction(FNo: Integer; p1, p2, p3: Variant; var val: Variant);
var
  cStr :String;

begin

 val := 0;

 case FNo of
   0: val := ABS(frParser.Calc(p1));
   1: val := CHR(Byte(frParser.Calc(p1)));
   2: val := frCompareStr(frParser.Calc(p1),frParser.Calc(p2));
   3: val := frCreateDate(frParser.Calc(p1),cFFormatDate);
   4: val := frCreateNum(frParser.Calc(p1));
   5: val := frCreateStr(frParser.Calc(p1));
   6: begin
        cStr := frParser.Calc(p3);
        frDateDiffEx(frParser.Calc(p1),frParser.Calc(p2),cStr);
        DoScriptF(p3+':='+CHR(39)+cStr+CHR(39));
      end;
   7: val := DateToStr(frParser.Calc(p1));
   8: val := frDaysPerMonth(frParser.Calc(p1),frParser.Calc(p2));
   9: val := frDelete(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));
  10: val := frEndPos(frParser.Calc(p1),frParser.Calc(p2));
  11: val := frExtractWord(frParser.Calc(p1),frParser.Calc(p2),ConvCS(frParser.Calc(p3)));
  12: val := frFirstDayOfNextMonth(frParser.Calc(p1));
  13: val := frFirstDayOfPrevMonth(frParser.Calc(p1));
  14: val := frIncDateEx(frParser.Calc(p1),frParser.Calc(p2));
  15: val := frIncDay(frParser.Calc(p1),frParser.Calc(p2));
  16: val := frIncMonth(frParser.Calc(p1),frParser.Calc(p2));
  17: val := frIncTimeEx(frParser.Calc(p1),frParser.Calc(p2));
  18: val := frIncYear(frParser.Calc(p1),frParser.Calc(p2));
  19: val := frInsert(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));
  20: val := frIsLeapYear(frParser.Calc(p1));

  21: val := frIsRangeDate(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));
  22: val := frIsRangeNum(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));

  23: val := frIsWordPresent(frParser.Calc(p1),frParser.Calc(p2),ConvCS(frParser.Calc(p3)));
  24: val := frLastDayOfPrevMonth(frParser.Calc(p1));
  25: val := frLeftCopy(frParser.Calc(p1),frParser.Calc(p2));
  26: val := frNPos(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));
  27: val := frPadCenter(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));
  28: val := frPadLeft(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));
  29: val := frPadRight(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));
  30: val := frReplaceStr(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3));
  31: val := frReplicate(frParser.Calc(p1),frParser.Calc(p2));
  32: val := frRightCopy(frParser.Calc(p1),frParser.Calc(p2));
  33: val := frStrToDateDef(frParser.Calc(p1),frParser.Calc(p2));
  34: val := StrToFloat(frParser.Calc(p1));
  35: val := frStrToFloatDef(frParser.Calc(p1),frParser.Calc(p2));
  36: val := StrToInt(frParser.Calc(p1));
  37: val := StrToIntDef(frParser.Calc(p1),frParser.Calc(p2));
  38: begin
        DoScriptF('MTV2FR := ' + p1);
        DoScriptF(p1 + ' := ' + p2);
        DoScriptF(p2 + ' := MTV2FR');
      end;
  39: val := TimeToStr(frParser.Calc(p1));
  40: val := TrimLeft(frParser.Calc(p1));
  41: val := TrimRight(frParser.Calc(p1));
  42: val := frValidDate(frParser.Calc(p1));
  43: val := frValidFloat(frParser.Calc(p1));
  44: val := frValidInt(frParser.Calc(p1));
  45: val := frWordCount(frParser.Calc(p1),ConvCS(frParser.Calc(p2)));
  46: val := frWordPosition(frParser.Calc(p1),frParser.Calc(p2),ConvCS(frParser.Calc(p3)));
 end; { case }

end; { DoFunction }

{--------------------------------------------------------------------}
{ Convert from typeString into type TfrCharSet                       }
{--------------------------------------------------------------------}
function ConvCS(cStr :String) :TfrCharSet;
var
  i :Integer;

begin

 Result := [];
 for i := 1 to Length(cStr) do Include(Result, cStr[i]);

end; { ConvCS }

{--------------------------------------------------------------------}
{ Processing variables for functions                                 }
{--------------------------------------------------------------------}
procedure TAddFunctionLibrary.DoScriptF(cScript: String);
var
  sl, sl1, sl2: TStringList;

begin

 if cScript <> '' then begin
   sl := TStringList.Create;
   sl1 := TStringList.Create;
   sl2 := TStringList.Create;
   sl.Add(cScript);
   frInterpretator.PrepareScript(sl, sl1, sl2);
   frInterpretator.DoScript(sl1);
   sl.Free;
   sl1.Free;
   sl2.Free;
 end; { if }

end; { DoScriptF }

{--------------------------------------------------------------------}
{ Initialize library                                                 }
{--------------------------------------------------------------------}
procedure TAddFunctionLibrary.DoInitStr;
var
  rsString :String;

begin

 rsString := LoadStr(SStringCategory);

 // RxLib
 AddFunctionDesc('ISWORDPRESENT', rsString, LoadStr(SDescriptionISWORDPRESENT));
 AddFunctionDesc('WORDPOSITION', rsString, LoadStr(SDescriptionWORDPOSITION));
 AddFunctionDesc('EXTRACTWORD', rsString, LoadStr(SDescriptionEXTRACTWORD));
 AddFunctionDesc('WORDCOUNT', rsString, LoadStr(SDescriptionWORDCOUNT));
 AddFunctionDesc('NPOS', rsString, LoadStr(SDescriptionNPOS));
 AddFunctionDesc('REPLACESTR', rsString, LoadStr(SDescriptionREPLACESTR));

 // Delphi
 AddFunctionDesc('TRIMRIGHT', rsString, LoadStr(SDescriptionTRIMRIGHT));
 AddFunctionDesc('TRIMLEFT', rsString, LoadStr(SDescriptionTRIMLEFT));
 AddFunctionDesc('DELETE', rsString, LoadStr(SDescriptionDELETE));
 AddFunctionDesc('INSERT', rsString, LoadStr(SDescriptionINSERT));
 AddFunctionDesc('DATETOSTR', rsString, LoadStr(SDescriptionDATETOSTR));
 AddFunctionDesc('TIMETOSTR', rsString, LoadStr(SDescriptionTIMETOSTR));
 AddFunctionDesc('CHR', rsString, LoadStr(SDescriptionCHR));

 // StLib
 AddFunctionDesc('REPLICATE', rsString, LoadStr(SDescriptionREPLICATE));
 AddFunctionDesc('PADLEFT', rsString, LoadStr(SDescriptionPADLEFT));
 AddFunctionDesc('PADRIGHT', rsString, LoadStr(SDescriptionPADRIGHT));
 AddFunctionDesc('PADCENTER', rsString, LoadStr(SDescriptionPADCENTER));
 AddFunctionDesc('ENDPOS', rsString, LoadStr(SDescriptionENDPOS));
 AddFunctionDesc('LEFTCOPY', rsString, LoadStr(SDescriptionLEFTCOPY));
 AddFunctionDesc('RIGHTCOPY', rsString, LoadStr(SDescriptionRIGHTCOPY));
 AddFunctionDesc('COMPARESTR', rsString, LoadStr(SDescriptionCOMPARESTR));

end; { DoInitStr }

procedure TAddFunctionLibrary.DoInitNum;
var
  rsNum :String;

begin

 rsNum := LoadStr(SMathCategory);

 AddFunctionDesc('VALIDINT', rsNum, LoadStr(SDescriptionVALIDINT));
 AddFunctionDesc('VALIDFLOAT', rsNum, LoadStr(SDescriptionVALIDFLOAT));
 AddFunctionDesc('ISRANGENUM', rsNum, LoadStr(SDescriptionISRANGENUM));
 AddFunctionDesc('STRTOFLOATDEF', rsNum, LoadStr(SDescriptionSTRTOFLOATDEF));
 AddFunctionDesc('STRTOINTDEF', rsNum, LoadStr(SDescriptionSTRTOINTDEF));
 AddFunctionDesc('STRTOINT', rsNum, LoadStr(SDescriptionSTRTOINT));
 AddFunctionDesc('STRTOFLOAT', rsNum, LoadStr(SDescriptionSTRTOFLOAT));

end; { DoInitNum }

procedure TAddFunctionLibrary.DoInitDate;
var
  rsDate :String;

begin

 rsDate := LoadStr(SDateTimeCategory);

 // RxLib
 AddFunctionDesc('DATEDIFF', rsDate, LoadStr(SDescriptionDATEDIFF));
 AddFunctionDesc('INCDATE', rsDate, LoadStr(SDescriptionINCDATE));
 AddFunctionDesc('INCTIME', rsDate, LoadStr(SDescriptionINCTIME));
 AddFunctionDesc('DAYSPERMONTH', rsDate, LoadStr(SDescriptionDAYSPERMONTH));
 AddFunctionDesc('FIRSTDAYOFNEXTMONTH', rsDate, LoadStr(SDescriptionFIRSTDAYOFNEXTMONTH));
 AddFunctionDesc('FIRSTDAYOFPREVMONTH', rsDate, LoadStr(SDescriptionFIRSTDAYOFPREVMONTH));
 AddFunctionDesc('LASTDAYOFPREVMONTH', rsDate, LoadStr(SDescriptionLASTDAYOFPREVMONTH));
 AddFunctionDesc('INCDAY', rsDate, LoadStr(SDescriptionINCDAY));
 AddFunctionDesc('INCYEAR', rsDate, LoadStr(SDescriptionINCYEAR));

 // StLib
 AddFunctionDesc('ISRANGEDATE', rsDate, LoadStr(SDescriptionISRANGEDATE));
 AddFunctionDesc('STRTODATEDEF', rsDate, LoadStr(SDescriptionSTRTODATEDEF));
 AddFunctionDesc('VALIDDATE', rsDate, LoadStr(SDescriptionVALIDDATE));

 // Delphi
 AddFunctionDesc('INCMONTH', rsDate, LoadStr(SDescriptionINCMONTH));
 AddFunctionDesc('ISLEAPYEAR', rsDate, LoadStr(SDescriptionISLEAPYEAR));

end; { DoInitDate }

procedure TAddFunctionLibrary.DoInitSQL;
var
  rsSQL :String;

begin

 rsSQL := 'SQL';

 // StLib
 AddFunctionDesc('CREATEDATE', rsSQL, LoadStr(SDescriptionCREATEDATE));
 AddFunctionDesc('CREATESTR', rsSQL, LoadStr(SDescriptionCREATESTR));
 AddFunctionDesc('CREATENUM', rsSQL, LoadStr(SDescriptionCREATENUM));

end; { DoInitSQL }

procedure TAddFunctionLibrary.DoInitMath;
var
  rsMath :String;

begin

 rsMath := LoadStr(SMathCategory);

 AddFunctionDesc('ABS', rsMath, LoadStr(SDescriptionABS));

end; { DoInitOther }

procedure TAddFunctionLibrary.DoInitOther;
var
  rsOther :String;

begin

 rsOther := LoadStr(SOtherCategory);

 // TZ
 AddFunctionDesc('SWAP', rsOther, LoadStr(SDescriptionSWAP));

end; { DoInitOther }

procedure Register;
begin
 RegisterComponents('FastReport', [TfrAddFunctionLibrary]);
end;


initialization
  frRegisterFunctionLibrary(TAddFunctionLibrary);

finalization
  frUnRegisterFunctionLibrary(TAddFunctionLibrary);


end.

