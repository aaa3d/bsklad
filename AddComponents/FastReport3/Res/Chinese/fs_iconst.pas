
{******************************************}
{                                          }
{             FastScript v1.7              }
{                Resources                 }
{                                          }
{ (c) 2003, 2004 by Alexander Tzyganenko,  }
{             Fast Reports, Inc            }
{                                          }
{******************************************}
{******************************************
  Translate by ChenFeng For Chinese res file at 2004-12-03 23:09PM
  Email:soareay@hotmail.com
  Good Luck!
******************************************}

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
  SLangNotFound := '找不到 ''%s'' 语言';
  SInvalidLanguage := '不合法的语言定义';
  SIdRedeclared := '标识符重复宣告: ';
  SUnknownType := '未知的类型: ';
  SIncompatibleTypes := '不相容的类型';
  SIdUndeclared := '标识符未宣告: ';
  SClassRequired := '此处需要类(Class)类型';
  SIndexRequired := '此处需要索引(Index)';
  SStringError := 'Strings没有属性(properties)或方法(methods)';
  SClassError := '类(Class) %s 没有预设的属性';
  SArrayRequired := '此处需要数据类型';
  SVarRequired := '此处需要变量';
  SNotEnoughParams := '实际的参数个数不符';
  STooManyParams := '参数个数太多';
  SLeftCantAssigned := '左边的变量不能指定新的值';
  SForError := 'for..loop变量必须是数值变量';
  SEventError := '事件句柄必须是过程(procedure)';

end.
