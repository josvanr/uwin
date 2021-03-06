#! /bin/sh

# groffer - display groff files

# Source file position: <groff-source>/contrib/groffer/perl/split_env.sh
# Installed position: <prefix>/lib/groff/groffer/split_env.sh

# Copyright (C) 2006 Free Software Foundation, Inc.
# Written by Bernd Warken.

# Last update: 1 Oct 2006

# This file is part of `groffer', which is part of `groff'.

# `groff' is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# `groff' is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with `groff'; see the files COPYING and LICENSE in the top
# directory of the `groff' source.  If not, write to the Free Software
# Foundation, 51 Franklin St - Fifth Floor, Boston, MA 02110-1301,
# USA.

########################################################################

# This file is called from groffer.pl.  The environment variable
# of the name in $1 will be split at output.  The corresponding variable
# must be exported before the call of groffer.pl.

if test $# = 0
then
    echo 'split_env.sh was called without an argument.' >&2;
else
    eval v='"$'"$1"'"';
    if test _"$v"_ != __
    then
	eval set x $v;
	shift;
	for i in "$@";
	  do
	  echo $i;
	done;
    fi;
fi;
