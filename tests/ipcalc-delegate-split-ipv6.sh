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

eval $(${IPCALC} -r 56 --prefix -n)
HEAD=$(${IPCALC} -S 64 ${NETWORK}/${PREFIX} --no-decorate|head -1)
TAIL=$(${IPCALC} -S 64 ${NETWORK}/${PREFIX} --no-decorate|tail -1)
echo "Network: ${NETWORK}/${PREFIX}"

export HEAD TAIL
FIRST=$(${IPCALC} --no-decorate --minaddr ${HEAD})
LAST=$(${IPCALC} --no-decorate --maxaddr ${TAIL})

export FIRST LAST
NEW=$(${IPCALC} --no-decorate -d ${FIRST}-${LAST})
echo "Calculated: ${NETWORK}/${PREFIX}"

set +e

if test "${NEW}" != "${NETWORK}/${PREFIX}";then
	echo "Addresses do not match"
	exit 1
fi

exit 0
