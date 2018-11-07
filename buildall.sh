#!/bin/bash
#
## Builds all docker files found below ./*

build () {
  [ -d $1 ] || exit 1
  cd $1
  docker build -t "auto:`pwd | awk -F '/' '{print $NF}'`" .
  cd ..
}

export -f build

parallel build {} ::: ./*
