#!/bin/bash
#
## Stop all docker containers

stop () {
  docker container stop $1 
}
export -f stop



LIST=`docker container list -q`

parallel stop {} ::: $LIST
