/***************************************************************************
 *   Copyright (C) 2006 by root   *
 *   root@localhost   *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/


#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>

#define ARG(type, arg)		type arg
#define ARGLIST(arg)

#define EXPORT
#define MALLOC malloc

#include "ibase.h"

#define MAX_BUFFER	1024
//#include "win1251.h"

#define IB_START_YEAR 1900
char *delims = " "; // empty delimiters


//double EXPORT  bg_fixedpoint(ARG(double*, x))
//ARGLIST(double	*x)
/*�� ������. �������*/

unsigned char CharUpper( unsigned char in_char)
{
	
	char res = in_char;
	
	if (in_char >223) 
	{
		res= in_char - 0x20;
	}
	else
	if (in_char > 96)
	{
		if ( in_char < 123)
			res= in_char - 0x20;
	}
	
	return res;
}

unsigned char CharLower( unsigned char in_char)
{
	
	char res = in_char;
	
	if (in_char > 64)
	{
		if ( in_char < 91)
			res= in_char + 0x20;
	}
	
	if (in_char > 191)
	{
		if ( in_char < 224)
			res= in_char + 0x20;
	}
	
	return res;
}



 char* bg_toupper( char* s)
{
	 static char buffer[MAX_BUFFER];
	 memset(buffer, 0, MAX_BUFFER);
	 strncpy(buffer, s, MAX_BUFFER-1);
	 char *ptr = buffer;
	while (*ptr)
	{
		*ptr =CharUpper(*ptr);
		ptr++;
		s++;
	} 
	return buffer;
}

 char*  bg_tolower(char* s)
{
	 static char buffer[MAX_BUFFER];
	 memset(buffer, 0, MAX_BUFFER);
	 strncpy(buffer, s, MAX_BUFFER-1);
	 char *ptr = buffer;
	while (*ptr)
	{
		*ptr =CharLower(*ptr);
		ptr++;
		s++;
	} 
	return buffer;
}

/*OK*/
char * bg_crlf(void)
{
  static char buf[3];
  buf[0]=13;
  buf[1]=10;
  buf[2]=0;
  
  return buf;
}
/*��*/
char * bg_monthlong( ISC_QUAD *d)
{	
	struct tm t;
	isc_decode_date(d, &t);
	
	static char buf[10];
	memset(buf, 0, 10);
	
	switch (t.tm_mon) 
	{
	case 0: memcpy(buf, "������", 6); break;
	case 1: memcpy(buf, "�������",7); break;
	case 2: memcpy(buf, "�����", 5); break;
	case 3: memcpy(buf, "������", 6); break;
	case 4: memcpy(buf, "���", 3); break;
	case 5: memcpy(buf, "����", 4); break;
	case 6: memcpy(buf, "����", 4); break;
	case 7: memcpy(buf, "�������", 7); break;
	case 8: memcpy(buf, "��������", 8); break;
	case 9: memcpy(buf, "�������", 7); break;
	case 10: memcpy(buf, "������", 6); break;
	case 11: memcpy(buf, "�������",7 ); break;
	}
	return buf;
}

/*OK*/
char * bg_monthshort( ISC_QUAD *d)
{
	struct tm t;
	isc_decode_date(d, &t);
		
	static char buf[8];
	memset(buf, 0, 8);
	switch (t.tm_mon) 
	{
	case 0: memcpy(buf, "���", 3); break;
	case 1: memcpy(buf, "���", 3); break;
	case 2: memcpy(buf, "���", 3); break;
	case 3: memcpy(buf, "���", 3); break;
	case 4: memcpy(buf, "���", 3); break;
	case 5: memcpy(buf, "���", 3); break;
	case 6: memcpy(buf, "���", 3); break;
	case 7: memcpy(buf, "���", 3); break;
	case 8: memcpy(buf, "���", 3); break;
	case 9: memcpy(buf, "���", 3); break;
	case 10: memcpy(buf, "���", 3); break;
	case 11: memcpy(buf, "���",3 ); break;
	}
	return buf;
}


/*OK*/
int  bg_dateint(ISC_QUAD *d)
{
	return d->gds_quad_high;	
}


/*OK*/
ISC_QUAD * bg_striptime(ISC_QUAD *d)
{
	static ISC_QUAD ret;
	ret.gds_quad_high=d->gds_quad_high;
	ret.gds_quad_low =0;
	return &ret;
}

/*OK*/
ISC_QUAD * bg_addmonth(ISC_QUAD *d, int *m)
{
	static ISC_QUAD ret;
	struct tm tm1;
	isc_decode_date(d, &tm1);
			
	div_t q = div(*m, 12);      
	
	tm1.tm_mon += q.rem;
	tm1.tm_year += q.quot;
	
	isc_encode_date(&tm1, &ret);
	return &ret;
}

/*OK*/
long  bg_year(ISC_QUAD* d)
{
	struct tm tm1;
	isc_decode_date(d, &tm1);
	return (tm1.tm_year + IB_START_YEAR);
}


/*OK*/
long  bg_month(ISC_QUAD* d)
{
	struct tm tm1;
	isc_decode_date(d, &tm1);
	return (tm1.tm_mon + 1);
}

/*OK*/
long  bg_dayofmonth(ISC_QUAD* d)
{
	struct tm tm1;
	isc_decode_date(d, &tm1);
	return (tm1.tm_mday);
}

/*OK*/
long  bg_dayofweek(ISC_QUAD* d)
{
	struct tm tm1;
	isc_decode_date(d, &tm1);
	return (tm1.tm_wday);
}

/*OK*/
long  bg_dayofyear(ISC_QUAD* d)
{
	struct tm tm1;
	isc_decode_date(d, &tm1);
	return (tm1.tm_yday);
}
  
 /*OK*/
 double bg_fixedpoint(double* x, int *n)
{
    ////return ((int) (((*x)*pow(10, *digits))+0.5000000001))/(pow(10, *digits));
    
	return *x>=0 ? floor((*x*pow(10,*n)+0.500000001))*pow(10,*n*(-1)) : ceil((*x*pow(10,*n)-0.500000001))*pow(10,*n*(-1));    
//    return (*x < 0.0) ? -*x : *x;
}


/*OK*/
double bg_abs(double *x)
{
    return (*x < 0.0) ? -*x : *x;
}

/*OK*/
int bg_length(char *str)
{
    return strlen(str);
}

/*OK*/
char *bg_left(char *str, int* n)
{
    if (*n> MAX_BUFFER-1)
    *n=MAX_BUFFER-1;

    static char buffer[MAX_BUFFER];

    memset(buffer, 0 , MAX_BUFFER);
    memset(buffer, ' ' ,*n); 
    buffer[*n+1]=0; 
    int diff = *n - strlen(str);  
    if (diff < 0 )
    	diff=0;


    memcpy(buffer, str, *n-diff); 
    return buffer;
}

/*OK*/
char *bg_right(char *str, int* n)
{
    if (*n> MAX_BUFFER-1)
	*n=MAX_BUFFER-1;
//    *n=   (*n)> bg_length(str)? bg_length(str):*n;
    static char buffer[MAX_BUFFER];
    memset(buffer, 0, MAX_BUFFER);
    memset(buffer, ' ', *n);
    
    int diff = -*n + strlen(str);
    /*����������� � */
    if (diff < 0 )
    	diff=0;
    strncpy(buffer+(*n - (strlen(str)-diff)), str+diff, strlen(str)-diff);
    return buffer;
}



/*OK*/
char* EXPORT bg_ltrim(char*  s)
{
	char *c;
	c = s;
	while (*c && strchr(delims, *c)) c++;
	return c;
}

/*OK*/
char*  bg_rtrim(char* s)
{
	long n;
	n = strlen(s);
	while (n && strchr(delims, s[n-1])) n--;
	s[n] = '\0';
	return s;
}






/*OK*/
char * bg_strtrunc(char* str, int *n)
{
    if (*n> MAX_BUFFER-1)
	*n=MAX_BUFFER-1;
    
    static char buffer[MAX_BUFFER];
    memset(buffer, 0, MAX_BUFFER);
    
    strncpy(buffer, str, *n);
    return buffer;
}

/*OK*/
long  bg_pos(char* str1, char* str2)
{
	char *ptr;
	if (!*str1) return 0;
	ptr = strstr(str1, str2);
	return (ptr) ? (ptr-str1+1) : 0;
}

long RoundUP(double X)
{
	if (X<0)
		return (long)(X-0.5);
	return (long)(X+0.5);
	
}

/*OK*/
double roundd(double *value, double *min_cu)
{
	double MP = pow(10, *min_cu);
	return RoundUP((*value)*MP)/MP;
}

char * bg_proper(char *str)
{	
	if (strlen(str) == 0)
		return "";
	static char buffer[MAX_BUFFER-1];
	memset(buffer, 0, MAX_BUFFER);
	strncpy(buffer, bg_tolower(str), MAX_BUFFER-1);
	
	buffer[0] = CharUpper(str[0]);
	return buffer;
}


char * bg_properfio(char *str)
{	
	if (strlen(str)==0)
		return "";
	static char buffer[MAX_BUFFER];
	memset(buffer, 0, MAX_BUFFER);
	strncpy(buffer, bg_tolower(str), MAX_BUFFER-1);
	char c;
	
	char *space=buffer;
	while (space[0]==' ')
		{
			space++;
			if (strlen(space)==0)
				break;
		}
	if (strlen(space)>0)
	{
		*space=CharUpper(*space);
	}		
	
	space = strchr(buffer, ' ');
	
	
	
	while (space)
	{
		while (space[0]==' ')
		{
			space++;
			if (strlen(space)==0)
				break;
		}
		if (strlen(space)>0)
		{
			*space=CharUpper(*space);
		}
		space = strchr(space, ' ');
	}
	
	return buffer;
}

int main(int argc, char *argv[])
{
  printf ("%s\n", bg_properfio("name fam  last_name"));
  printf("Hello, world%s", bg_crlf());
  printf("pos %d\n", bg_pos("asdsdgf", "ds"));
  int n=11;
  printf("[%s]\n", bg_left("bg_left run correctly", &n));
  printf("[%s]\n", bg_right("bg_right run correctly", &n));

  char buf[20];
  
  double d=1261645441345.675;
  int dig=2;
  
  printf ("CharUpper %c\n", CharUpper(0xDF));
  
  printf ("%s\n", bg_toupper("asd���"));

  double res;
  n=4;
  //printf("[%f]\n", bg_fixedpoint(&d, &dig));
//  printf(

  
  time_t ttt;
  time(&ttt);
  
  struct tm *t = localtime(&ttt);
  
//  printf("[%s]\n", bg_left("asdfghj63333333444kl", &n));
//  printf("[%s]\n", bg_right("123456gh", &n));
  
  return EXIT_SUCCESS;
}