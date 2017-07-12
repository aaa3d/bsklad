
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
  SLangNotFound := '�Ҳ��� ''%s'' ����';
  SInvalidLanguage := '���Ϸ������Զ���';
  SIdRedeclared := '��ʶ���ظ�����: ';
  SUnknownType := 'δ֪������: ';
  SIncompatibleTypes := '�����ݵ�����';
  SIdUndeclared := '��ʶ��δ����: ';
  SClassRequired := '�˴���Ҫ��(Class)����';
  SIndexRequired := '�˴���Ҫ����(Index)';
  SStringError := 'Stringsû������(properties)�򷽷�(methods)';
  SClassError := '��(Class) %s û��Ԥ�������';
  SArrayRequired := '�˴���Ҫ��������';
  SVarRequired := '�˴���Ҫ����';
  SNotEnoughParams := 'ʵ�ʵĲ�����������';
  STooManyParams := '��������̫��';
  SLeftCantAssigned := '��ߵı�������ָ���µ�ֵ';
  SForError := 'for..loop������������ֵ����';
  SEventError := '�¼���������ǹ���(procedure)';

end.
