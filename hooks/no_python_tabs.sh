#!/bin/bash

# Tests whether any of the python files passed in as arguments contain
# tabs. Ignores non-python filse

FAIL=0
for file in "$@"
do 
    if [[ $file == *.py && $(grep -c $'\t' $file) -gt 0 ]]
    then
	# file contains a tab
	echo "Tab in: " $file
	FAIL=1
    fi
done

# Abort commit if tabs are present in the commited files
if [ $FAIL -gt 0 ]
then
    # prefacing a single quoted string causes backslashes to expand
    # a la ANSI
    echo $'\ncommit failed'
    exit -1
fi
