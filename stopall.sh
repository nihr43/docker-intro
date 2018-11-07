#!/bin/bash
#
## Stop all docker containers

stop () {
  docker container stop $1 
}
export -f stop


####


LIST=`docker container list | sed 1d | awk '{print $1}'`

parallel stop {} ::: $LIST
