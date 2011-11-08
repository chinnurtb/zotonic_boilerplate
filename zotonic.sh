#!/bin/bash 

## == USAGE ======================================== #
##
## usage zotonic.sh {debug|start|stop|restart}
##
## Use "debug" to start an interactive shell (highly recommended when installing the db on the first run).
## Use "start" in production. This boots zotonic in an erlang vm with a heart beat process.
##
## The proposed directory structure is:
## /home/zotonic/zotonic.sh                         -- this script
## /home/zotonic/zotonic/...                        -- the zotonic code
## /home/zotonic/zotonic/priv/sites/default/...     -- your site and uploaded files go here

# == PROJECT BASE ======================================== #

BASE=/Users/pbdigital/Sites/zotonic_boilerplate/


# == SH ======================================== #

ZOTONIC_SH=$BASE/zotonic/zotonic.sh


# == PROJECT PATH ======================================== #
#
# @important This directory must be called zotonic or zotonic-x.y where x.y is the version number.

ZOTONIC=$BASE/zotonic


# == HOSTNAME ======================================== #
#
# @ex ERL="/usr/local/bin/erl"

ERL="/Users/pbdigital/Developer/Cellar/erlang/R14B03/bin/erl"


# == VM ======================================== #

PA="$ZOTONIC/ebin $ZOTONIC/deps/*/ebin $ZOTONIC/modules/*/deps/*/ebin $ZOTONIC/priv/modules/*/deps/*/ebin $ZOTONIC/priv/sites/*/modules/*/deps/*/ebin"


# == UNIQUE ERLANG NODE NAME ======================================== #

SNAME=zotonic001


# == HOSTNAME ======================================== #
#
# @ex HOSTNAME=`hostname`
# @ex HOSTNAME=your.domain.com

HOSTNAME=localhost


# == HEART COMMAND ======================================== #

export HEART_COMMAND="$ZOTONIC_SH start"


# == HOSTNAME ======================================== #
#
# @default 8000

export ZOTONIC_IP=any
export ZOTONIC_PORT=8000


# == UNIX PROC ID ======================================== #

export ZOTONIC_PIDFILE=$BASE/zotonic.pid


# == NULL ======================================== #

pushd $ZOTONIC >/dev/null


# == FUNCS ======================================== #

function start() {
    echo  "Starting zotonic $SNAME"
    make -C $ZOTONIC >/dev/null
    $ERL -pa $PA -name $SNAME@$HOSTNAME -boot start_sasl -heart -detached -s zotonic
}

function stop() {
    echo "Stopping zotonic $SNAME"
    $ERL -noshell -pa $PA -sname ${SNAME}_stop -s zotonic stop $SNAME@$HOSTNAME
}

function update() {
    echo "Updating zotonic $SNAME"
    $ERL -noshell -pa $PA -sname ${SNAME}_stop -s zotonic update $SNAME@$HOSTNAME
}


# == ... ======================================== #

case $1 in

  start)
    start
    ;;
 
  debug)
    $ERL +P 10000000 +K true -pa $PA -name $SNAME@$HOSTNAME -boot start_sasl -s zotonic
    ;;
 
  stop)
    stop
    ;;
 
  update)
    update
    ;;

  shell)
    $ERL -sname zotonic_shell -remsh $SNAME@$HOSTNAME
    ;;

  restart)
    echo "Restarting zotonic"
    stop
    start
    ;;

  *)
    echo "Usage: $0 {debug|start|stop|restart|update}"
    exit 1
esac

popd > /dev/null
 
exit 0


# == START ======================================== #

# ...

 $PA -name $SNAME@$HOSTNAME -boot start_sasl -s zotonic
    ;;
 
  stop)
    stop
    ;;
 
  update)
    update
    ;;

  shell)
    $ERL -sname zotonic_shell -remsh $SNAME@$HOSTNAME
    ;;

  restart)
    echo "Restarting zotonic"
    stop
    start
    ;;

  *)
    echo "Usage: $0 {debug|start|stop|restart|update}"
    exit 1
esac

popd > /dev/null
 
exit 0

