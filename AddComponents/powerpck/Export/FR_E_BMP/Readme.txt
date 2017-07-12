Simply JPG, BMP, GIF export filters.

To use this unit, copy fr_e_bmp.pas, fr_e_bmp.dfm
into your project catalog and write in your program source:
 uses ...,fr_e_bmp;

Sample using this filter:

var
  ...
  bmp_exp : TfrBMPExport;

begin
  ...
  bmp_exp:=TfrBMPExport.Create(nil);
  ...
  frReport1.ShowReport;
  ...
  bmp_exp.Destroy;
end;