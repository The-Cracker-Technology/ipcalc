#!/bin/sh

# Copyright (C) 2019 Nikos Mavrogiannopoulos
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 3 of the License, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>

IPCALC="${IPCALC:-build/ipcalc}"

set -e

eval $(${IPCALC} -r 96 --prefix -n --minaddr --maxaddr)

NEW=$(${IPCALC} -d "${MINADDR}-${MAXADDR}" --no-decorate)

set +e

if test "${NEW}" != "${NETWORK}/${PREFIX}";then
	echo "Networks do not match"
	exit 1
fi

exit 0
