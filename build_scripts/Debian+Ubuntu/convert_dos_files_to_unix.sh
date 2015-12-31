#!/bin/sh

# This script search for files with [dos] line endings down the current directory and converts them to unix format

files=""
files=$files" "`find . -name "*.cpp" | xargs file /tmp | grep CRLF | cut -d: -f1`
files=$files" "`find . -name "*.h"   | xargs file /tmp | grep CRLF | cut -d: -f1`
files=$files" "`find . -name "*.ui"  | xargs file /tmp | grep CRLF | cut -d: -f1`
files=$files" "`find . -name "*.pro" | xargs file /tmp | grep CRLF | cut -d: -f1`

echo About to convert the following files to unix format:
for i in $files; do
	echo "   "$i
done
echo Please press [ENTER] when ready

read tmp

for i in $files; do
	echo converting $i...
	cat $i | sed -e s/
	mv -f $i.tmp0000 $i
done

echo Done.

