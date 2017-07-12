
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
  SLangNotFound := '�䤣�� ''%s'' �y��';
  SInvalidLanguage := '���X�k���y���w�q';
  SIdRedeclared := '�ѧO�r���ƫŧi: ';
  SUnknownType := '���������A: ';
  SIncompatibleTypes := '���ۮe�����A';
  SIdUndeclared := '�ѧO�r���ŧi: ';
  SClassRequired := '���B�ݭn���O(Class)���A';
  SIndexRequired := '���B�ݭn����(Index)';
  SStringError := 'Strings�S���ݩ�(properties)�Τ�k(methods)';
  SClassError := '���O(Class) %s �S���w�]���ݩ�';
  SArrayRequired := '���B�ݭn�}�C���A';
  SVarRequired := '���B�ݭn�ܼ�';
  SNotEnoughParams := '��ڪ��ѼƭӼƤ���';
  STooManyParams := '�ѼƭӼƤӦh';
  SLeftCantAssigned := '���䪺�ܼƤ�����w�s����';
  SForError := 'for..loop�ܼƥ����O�ƭ��ܼ�';
  SEventError := '�ƥ�B�z�{�������O�{��(procedure)';

end.
