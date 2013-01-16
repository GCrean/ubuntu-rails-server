#!/bin/bash

TEMP=`getopt -o di --long description,install -- "$@"`

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

# Note the quotes around `$TEMP': they are essential!
eval set -- "$TEMP"

while true ; do
  case "$1" in
    -d|--description) echo $DESCRIPTION ; shift ;;
    -i|--install) install ; shift ;;
    --) shift ; break ;;
    *) echo "Internal error!" ; exit 1 ;;
  esac
done
