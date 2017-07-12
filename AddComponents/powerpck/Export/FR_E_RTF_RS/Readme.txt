RTF export filter.

To use this unit, copy fr_e_rtf_rs.pas, fr_e_rtf_rs.dfm
into your project catalog and write in your program source:
 uses ...,fr_e_rtf_rs;

Sample using this filter:

var
  ...
  rtf_exp : TfrRTF_rsExport;

begin
  ...
  rtf_exp:=TfrRTF_rsExport.Create(nil);
  ...
  frReport1.ShowReport;
  ...
  rtf_exp.Destroy;
end;