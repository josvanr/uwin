/* Stupid ass version of memmove

   Copyright (C) 1996, 1997 Free Software Foundation, Inc.

   Written by Miles Bader <miles@gnu.ai.mit.edu>

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License as
   published by the Free Software Foundation; either version 2, or (at
   your option) any later version.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.  */

#ifdef HAVE_CONFIG_H
#include <config.h>
#endif

#ifdef HAVE_STDLIB_H
#include <stdlib.h>
#endif
#ifdef HAVE_STRING_H
#include <string.h>
#endif

void *
memmove (to, from, sz)
     void *to;
     const void *from;
     size_t sz;
{
#ifdef HAVE_BCOPY
  bcopy (from, to, sz);
#else
  char *p = to;
  const char *q = from;

  /* Not *too* efficient... */
  if (q < p)
    {
      q += sz;
      p += sz;
      while (sz-- > 0)
	*--p = *--q;
    }
  else
    while (sz-- > 0)
      *p++ = *q++;
#endif

  return to;
}
