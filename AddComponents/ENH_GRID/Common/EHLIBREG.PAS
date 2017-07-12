{*******************************************************}
{                                                       }
{                       EhLib v1.5                      }
{                    Registration unit                  }
{                                                       }
{   Copyright (c) 1998, 1999 by Dmitry V. Bolshakov     }
{                                                       }
{*******************************************************}

unit EhLibReg;

interface

procedure Register;

implementation

uses Classes, TypInfo, DsgnIntf, DBGridEh, GridEhEd, DBSumLst, PrViewEh, 
     PrnDbgEh;

procedure Register;
begin
  RegisterComponents('Data Controls', [TDBGridEh]);
  RegisterComponentEditor(TDBGridEh, TDBGridEhEditor);
  RegisterPropertyEditor(TypeInfo(TCollection), TDBGridEh, 'Columns', TDBGridEhColumnsProperty);
  RegisterPropertyEditor(TypeInfo(string), TColumnEh, 'FieldName', TDBGridEhFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TColumnFooterEh, 'FieldName', TDBGridEhFieldProperty);

  RegisterComponents('Data Controls', [TDBSumList]);
  RegisterComponents('Data Controls', [TPrintDBGridEh]);
  RegisterComponents('System', [TPreviewBox]);
end;

end.
