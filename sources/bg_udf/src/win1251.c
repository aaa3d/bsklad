/*====================================================================
		rstring.c

		rFunc InterBase UDF library.
		String functions.

		Copyright 1998-2003 Polaris Software
		http://rfunc.sourceforge.net
		mailto: rFunc@mail.ru

====================================================================== */

#include <ibase.h>
#include <string.h>
//#include <stdio.h>
#include <stdlib.h>
//#include <math.h>
//#include "rfunc.h"
//#include "rstring.h"
//#include "rmath.h"
#include "win1251.h"

unsigned char* EXPORT fn_rupper(ARG(unsigned char*, s))
ARGLIST(unsigned char *s)
{
	unsigned char *ptr = s;

	while (*ptr) *ptr = upper_win1251[(short)*ptr++];
	return s;
}

unsigned char* EXPORT fn_rlower(ARG(unsigned char*, s))
ARGLIST(unsigned char *s)
{
	unsigned char *ptr = s;

	while (*ptr) *ptr = lower_win1251[(short)*ptr++];
	return s;
}

unsigned char* EXPORT fn_rlatin(ARG(unsigned char*, s))
ARGLIST(unsigned char *s)
{
	unsigned char *ptr = s;

	while (*ptr) *ptr = latin_win1251[(short)*ptr++];
	return s;
}

unsigned char* rntranslit(ARG(unsigned char*, s), ARG(long, maxlength))
ARGLIST(unsigned char *s)
ARGLIST(long maxlength)
{
	unsigned char *buffer = (unsigned char*) MALLOC (maxlength);
	unsigned char *sptr = s;
	int i, l = 0;
	short r;

	while (*sptr)
	{
		 if (r = translit_win1251[(short)*sptr])
		 {
			i = 0;
			 while ((buffer[l++] = TYP_win1251[r-1][i++]) && (l < maxlength));
			 l--;
		 } else
			 buffer[l++] = *sptr;
		 sptr++;
		if (l >= maxlength) break;
	}
	buffer[l] = '\0';
	return buffer;
}

unsigned char* EXPORT fn_rtranslit(ARG(unsigned char*, s))
ARGLIST(unsigned char *s)
{
	return rntranslit(s, shortlen);
}

unsigned char* EXPORT fn_longrtranslit(ARG(unsigned char*, s))
ARGLIST(unsigned char *s)
{
	return rntranslit(s, longlen);
}

short TestNum(ARG(long*, Num))
ARGLIST(long* Num)
{
	if ((nmod(*Num, 10) == 1) && (nmod(*Num, 100) != 11)) return 0;
	if ((2 <= nmod(*Num, 10)) && (nmod(*Num, 10) <= 4) &&
		!((12 <= nmod(*Num, 100)) && (nmod(*Num, 100) <= 14))) return 1;
	return 2;
}

char* EXPORT fn_numinwords(ARG(long*, Sum), ARG(short*, Gender))
ARGLIST(long *Sum)
ARGLIST(short *Gender)
{
	char *buffer = (char*) MALLOC (shortlen);
	long i, j, l = 0, nGender, mNum, tn;
	long pNum, Divider;

	if (*Sum < 0)
	{
		pNum = -*Sum;
		buffer[l++] = '-';
	}
	else
		pNum = *Sum;

//	Divider = 1000000000000;
	Divider = 1000000000;
	for (i = 0; i <= 3/*!*/; i++)
	{
		mNum = ndiv(pNum, Divider);
		if (mNum)
		{
			if (mNum > 99)
			{
				tn = ndiv(mNum, 100);
				j = 0; while ((buffer[l++] = a100[tn][j++]));
				buffer[l-1] = ' ';
				mNum = nmod(mNum, 100);
			}
			if (mNum > 19)
			{
				tn = ndiv(mNum, 10);
				j = 0; while ((buffer[l++] = a10[tn][j++]));
				buffer[l-1] = ' ';
				mNum = nmod(mNum, 10);
			}
			if (mNum > 0)
			{
				if (i == 3/*!*/)
					nGender = *Gender + 1;
				else
					nGender = atoi(aExp[i+1/*!*/][0]);
				if (!((1 <= nGender) && (nGender <= 4))) nGender = 1;
				if (!*a1[mNum][nGender-1]) nGender = 1/*!*/;
				j = 0; while ((buffer[l++] = a1[mNum][nGender-1][j++]));
				buffer[l-1] = ' ';
			}
			if (i < 3/*!*/)
			{
				// name of numeral
				tn = TestNum(&mNum) + 2;
				j = 0; while ((buffer[l++] = aExp[i+1/*!*/][tn-1][j++]));
				buffer[l-1] = ' ';
			}
		}
		pNum = nmod(pNum, Divider);
		Divider = ndiv(Divider, 1000);
	}

	j = 0; if (!l) while ((buffer[l++] = a1[0][0][j++]));
	buffer[l] = '\0';
	return buffer;
}

