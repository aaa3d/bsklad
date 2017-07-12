
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
  SLangNotFound := '''%s'' dili bulunamad�';
  SInvalidLanguage := 'Ge�ersiz dil tan�m�';
  SIdRedeclared := 'Tekrarlanm�� nitelik: '; 
  SUnknownType := 'Bilinmeyen tip: ';
  SIncompatibleTypes := 'Tip uyu�mazl���';
  SIdUndeclared := 'Tan�mlanmam�� nitelik: ';
  SClassRequired := 'S�n�f tipi gerekli';
  SIndexRequired := '�ndeks gerekli';
  SStringError := '�zellikleri veya Metotlar� olmayan String''ler';
  SClassError := '%s s�n�f�n�n varsay�lan �zelli�i yok';
  SArrayRequired := 'Dizi tipi gerekli';
  SVarRequired := 'De�i�ken gerekli';
  SNotEnoughParams := 'Eksik parametre';
  STooManyParams := '�ok fazla parametre';
  SLeftCantAssigned := 'Sol tarafa de�er atanamaz';
  SForError := 'D�ng� de�i�keni say�sal olmal�d�r';
  SEventError := 'Olay yakalay�c� prosed�r olmal�d�r';

end.
