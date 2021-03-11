#!/bin/sh
#
# This shell script is a simple test runner for ipcalc tests.
#
# Adapted from: Matej Susta <msusta@redhat.com>
#
#   Copyright (c) 2009 Red Hat, Inc. All rights reserved.
#
#   This copyrighted material is made available to anyone wishing
#   to use, modify, copy, or redistribute it subject to the terms
#   and conditions of the GNU General Public License version 2.
#
#   This program is distributed in the hope that it will be
#   useful, but WITHOUT ANY WARRANTY; without even the implied
#   warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
#   PURPOSE. See the GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public
#   License along with this program; if not, write to the Free
#   Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
#   Boston, MA 02110-1301, USA.

exitcode=0

ok() {
	echo "ok."
}

fail() {
	echo "FAILED!"
	exitcode=$((exitcode+1))
	echo -e "Output was:\n$1"
}

TestSuccess() {
	echo -n "Checking $@... "
	output=$(sh -c "$1" 2>&1)
	rc=$?
	[ $rc -eq 0 ] && ok || fail $output
}

TestFailure() {
	echo -n "Checking $@... "
	output=$(sh -c "$1" 2>&1)
	rc=$?
	[ $rc -eq 0 ] && fail $output || ok
}

TestOutput() {
	echo -n "Checking $1... "
	output=$(sh -c "$1" 2>&1)
	rc=$?
	[ "$output" = "$2" ] && ok || fail $output
}

TestOutputFile() {
	echo -n "Reading $2... "
	[ -e "$2" ] || { fail "missing file $2"; return; }
	contents="$(cat "$2" 2>/dev/null)"
	[ -n "$contents" ] && ok || { fail "failed to read $2"; return; }
	TestOutput "$1" "$contents"
}

TestEqual() {
	TestSuccess "$1"
	[ -n "$output" ] && output1="$output" || { fail "no output from $1"; return; }
	TestSuccess "$2"
	[ -n "$output" ] && output2="$output" || { fail "no output from $2"; return; }
	echo -n "Comparing output... "
	[ "$output1" = "$output2" ] && ok || fail "$output1 <> $output2"
}

while [ $# -gt 0 ]; do
	case $1 in
		--test-success) TestSuccess "$2"; shift ;;
		--test-failure) TestFailure "$2"; shift ;;
		--test-output)  TestOutput "$2" "$3"; shift; shift ;;
		--test-outfile) TestOutputFile "$2" "$3"; shift; shift ;;
		--test-equal)   TestEqual "$2" "$3"; shift; shift ;;
		*) fail "invalid argument: $1" ;;
	esac
	shift
done

echo "$exitcode test(s) failed."
exit $exitcode
