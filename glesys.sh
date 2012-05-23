#!/bin/sh
GLESYS_URL=https://api.glesys.com
. `dirname $0`/config.sh

METHOD="$1"
shift
RESOURCE="$1"
shift

glesys_get()
{
	_RESOURCE="$1"
	curl --silent -u $GLESYS_USER:$GLESYS_PASSWORD $GLESYS_URL/$_RESOURCE/format/json | /usr/local/bin/jsonpipe
}

case $METHOD in

	GET)
		glesys_get "$RESOURCE"
		;;

	*)
		exit 1
esac

		
