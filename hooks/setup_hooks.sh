#!/bin/bash

# Sets up git hooks as desired.  Must be run from the directory containing the
# target scripts
FILES="pre-commit pre-push"

HOOKDIR='../../.git/hooks/'

for f in $FILES
do
    ln -s $PWD/$f $HOOKDIR$f 2> /dev/null
done
