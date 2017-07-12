
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
  SLangNotFound := '���� ''%s'' �� ������';
  SInvalidLanguage := '������ � �������� �����';
  SIdRedeclared := '������������� �������������: ';
  SUnknownType := '����������� ���: ';
  SIncompatibleTypes := '������������� ����';
  SIdUndeclared := '�������������� �������������: ';
  SClassRequired := '��������� �����';
  SIndexRequired := '��������� ������';
  SStringError := '������ �� ����� ������� ��� �������';
  SClassError := '����� %s �� �������� �������� �� ���������';
  SArrayRequired := '��������� ������';
  SVarRequired := '��������� ����������';
  SNotEnoughParams := '������������ ����������';
  STooManyParams := '������� ����� ����������';
  SLeftCantAssigned := '����� ����� ��������� �� ����� ���� ���������';
  SForError := '���������� ����� FOR ������ ���� ��������';
  SEventError := '���������� ������� ������ ���� ����������';


end.
