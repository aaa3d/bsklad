
{******************************************}
{                                          }
{             FastReport v3.0              }
{         Language resource file           }
{                                          }
{         Copyright (c) 1998-2005          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{         Translated by Sergiy Sekela      }
{         Ternopil, Ukraine                }
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
  SLangNotFound := '���� ''%s'' �� ��������';
  SInvalidLanguage := '������� � ���� ����';
  SIdRedeclared := '������������� ��������������: ';
  SUnknownType := '�������� ���: ';
  SIncompatibleTypes := '������� ����';
  SIdUndeclared := '������������ �������������: ';
  SClassRequired := '��������� ����';
  SIndexRequired := '��������� ������';
  SStringError := '����� �� �� ������������ ��� ������';
  SClassError := '���� %s �� ������ ���������� �� �������������';
  SArrayRequired := '��������� �����';
  SVarRequired := '��������� �����';
  SNotEnoughParams := '����������� ���������';
  STooManyParams := '������� ������ ���������';
  SLeftCantAssigned := '˳�� ������� ������ �� ���� ���� �����������';
  SForError := '����� ����� FOR ������� ���� ��������';
  SEventError := '���������� ��䳿 ������� ���� ����������';


end.
