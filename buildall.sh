#!/bin/bash
#
## Builds all docker files found below ./*

build_c () {
  [ -d $1 ] || exit 1
  cd $1
  docker build -t "auto:`pwd | awk -F '/' '{print $NF}'`" .
  cd ..
}

export -f build_c

parallel build_c {} ::: ./*
