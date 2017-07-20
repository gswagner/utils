#!/bin/bash

command -v pep8 >/dev/null 2>&1 || { echo >&2 "Pep8 checking requires the package pep8 to be installed"; exit 1; }

ERRORS=0
for file in $@
do
    if [[ $file != *.py ]]
    then
	echo "Skipping"
	continue
    fi
    OUT=$(pep8 --show-source $file)
    if [ -n "$OUT" ]
    then
	echo "$OUT"
	ERRORS=1
    fi
done
if [ $ERRORS -gt 0 ]
then
    exit -1
fi
