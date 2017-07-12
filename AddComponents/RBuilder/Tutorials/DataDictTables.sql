/*******************************************************************************}
{                                                                              }
{                   ReportBuilder Tutorials                                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{*******************************************************************************/

/*
  INTERBASE TUTORIAL

  This script defines the Table and Field tables used by the ReportBuilder
  Data Dictionary. The Data Dictionary is designed to support desktop and
  client/server databases. This requirement limits the flexibility of the
  table definitions. Adding field constraints such those described below
  will result in Delphi run-time errors.


    Objects          Notes
  -------------     ------------------------------------------------
  1. tables          Do NOT modify the table definitions.
                     Do NOT Add field constraints such as UNIQUE or NOT NULL.
                     Do NOT define a primary key.

  2. indexes         Do NOT modify the index definitions.


*/


/* connect to the database

  note: you should modify the connection parameters to connect to the desired server.
        The parameters below use the employee database that InterBase installs
        as its demo database.

*/


CONNECT "C:\Program Files\Common Files\Borland Shared\Data\employee.gdb"
USER "SYSDBA" PASSWORD "masterkey";


/* create Table table */

CREATE TABLE rb_table
(table_name VARCHAR(60),
table_alias VARCHAR(60));

CREATE INDEX rb_table_name_idx ON rb_table (table_name);

COMMIT;


/* create Field table */

CREATE TABLE rb_field
(table_name VARCHAR(60),
field_name VARCHAR(60),
field_alias VARCHAR(60),
selectable CHAR(1),
searchable CHAR(1),
sortable CHAR(1));

CREATE INDEX rb_table_field_name_idx ON rb_field (table_name, field_name);


COMMIT;


EXIT;

