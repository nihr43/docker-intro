#!/bin/bash
#
## Destroy all docker images on a system

destroy () {
  docker image rm $1 -f
}
export -f destroy




LIST=`docker images | sed 1d | awk '{print $3}'`

while [ ! -z "`docker images | sed 1d`" ] ; do
  parallel destroy {} ::: $LIST
done
