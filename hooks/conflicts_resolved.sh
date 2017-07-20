#!/bin/bash

# Tests whether all conflicts have been "resolved" in the files passed 
# in as arguments, i.e. the  <<<<<< HEAD ======== >>>>>>>> bar symbols 
# have been deleted

FAIL=0
# List the symbols which would indicate an incomplete merge
PATTERNS="<<<<<<< ======= >>>>>>>"
# Iterate over the arguments
for file in "$@"
do
    for pattern in $PATTERNS
    do
	if [ $(grep -c $pattern $file ) -gt 0 ]
	    then
	    # We have an incomplete merge
	    echo "Unresolved conflict in: " $file
	    FAIL=1
	    break
	fi
    done
done

# Abort commit if unresolved conflicts are present
if [ $FAIL -gt 0 ]
then
    # prefacing a single quoted string causes backslashes to expand
    # a la ANSI
    echo $'\ncommit failed'
    exit -1
fi
