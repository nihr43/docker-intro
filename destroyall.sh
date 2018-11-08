#!/bin/bash
#
## Destroy all docker images on a system

destroy () {
  docker image rm $1 -f
}
export -f destroy




LIST=`docker images -q`

while [ ! -z "`docker images -q`" ] ; do
  parallel destroy {} ::: $LIST
done
