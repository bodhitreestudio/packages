#!/bin/bash

set +x

PKGS_PATH=`pwd`
pkgPath=
tgzName=

usage="
Usage:

  npm-pack.sh
    -h | --help
    -p | --pkg-path
    -t | --target-name\n
"

while [ "$1" != "" ]; do
  PARAM=`echo $1 | awk -F= '{print $1}'`
  VALUE=`echo $1 | awk -F= '{print $2}'`
  case $PARAM in
    -h | --help)
      printf "$usage"
      exit
      ;;
    -p | --pkg-path)
      pkgPath=$VALUE
      ;;
    -t | --tgz-name)
      tgzName=$VALUE
      ;;
    *)
      echo "ERROR: unknown parameter \"$PARAM\""
      printf $usage
      exit 1
      ;;
  esac
  shift
done

if [[ -z $pkgPath ]]; then
  printf "$usage"
  exit 1
fi

cd $pkgPath
npm pack
mv *.tgz $PKGS_PATH/$tgzName

