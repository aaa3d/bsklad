
{******************************************}
{                                          }
{             FastScript v1.7              }
{                Resources                 }
{                                          }
{ (c) 2003, 2004 by Alexander Tzyganenko,  }
{             Fast Reports, Inc            }
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
  SLangNotFound := '找不到 ''%s'' 語言';
  SInvalidLanguage := '不合法的語言定義';
  SIdRedeclared := '識別字重複宣告: ';
  SUnknownType := '未知的型態: ';
  SIncompatibleTypes := '不相容的型態';
  SIdUndeclared := '識別字未宣告: ';
  SClassRequired := '此處需要類別(Class)型態';
  SIndexRequired := '此處需要索引(Index)';
  SStringError := 'Strings沒有屬性(properties)或方法(methods)';
  SClassError := '類別(Class) %s 沒有預設的屬性';
  SArrayRequired := '此處需要陣列型態';
  SVarRequired := '此處需要變數';
  SNotEnoughParams := '實際的參數個數不符';
  STooManyParams := '參數個數太多';
  SLeftCantAssigned := '左邊的變數不能指定新的值';
  SForError := 'for..loop變數必須是數值變數';
  SEventError := '事件處理程式必須是程序(procedure)';

end.
