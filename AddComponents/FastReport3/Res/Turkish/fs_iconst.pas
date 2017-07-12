
{******************************************}
{                                          }
{             FastScript v1.7              }
{                Resources                 }
{                                          }
{ (c) 2003, 2004 by Alexander Tzyganenko,  }
{             Fast Reports, Inc            }
{                                          }
{     Translated by Tayfun SUSAMCIOGLU     }
{       Tolga CAGLAYAN, Ozkan DEMIR        }
{                 TURKEY                   }
{                                          }
{******************************************}

unit fs_iconst;

interface

{$i fs.inc}

var
  SLangNotFound: String;
  SInvalidLanguage: String;
  SIdRedeclared: String;
  SUnknownType: String;
  SIncompatibleTypes: String;
  SIdUndeclared: String;
  SClassRequired: String;
  SIndexRequired: String;
  SStringError: String;
  SClassError: String;
  SArrayRequired: String;
  SVarRequired: String;
  SNotEnoughParams: String;
  STooManyParams: String;
  SLeftCantAssigned: String;
  SForError: String;
  SEventError: String;


implementation

initialization
  SLangNotFound := '''%s'' dili bulunamadý';
  SInvalidLanguage := 'Geçersiz dil tanýmý';
  SIdRedeclared := 'Tekrarlanmýþ nitelik: '; 
  SUnknownType := 'Bilinmeyen tip: ';
  SIncompatibleTypes := 'Tip uyuþmazlýðý';
  SIdUndeclared := 'Tanýmlanmamýþ nitelik: ';
  SClassRequired := 'Sýnýf tipi gerekli';
  SIndexRequired := 'Ýndeks gerekli';
  SStringError := 'Özellikleri veya Metotlarý olmayan String''ler';
  SClassError := '%s sýnýfýnýn varsayýlan özelliði yok';
  SArrayRequired := 'Dizi tipi gerekli';
  SVarRequired := 'Deðiþken gerekli';
  SNotEnoughParams := 'Eksik parametre';
  STooManyParams := 'Çok fazla parametre';
  SLeftCantAssigned := 'Sol tarafa deðer atanamaz';
  SForError := 'Döngü deðiþkeni sayýsal olmalýdýr';
  SEventError := 'Olay yakalayýcý prosedür olmalýdýr';

end.
