#!/bin/bash
set -e

if [[ -n "$SOURCE_URL" ]]; then
	if [[ -z "$HOSTNAME" ]]; then
		HOSTNAME="localhost"
	fi
else
	SOURCE_URL='http://www.google.com'
fi

SOURCE_DOMAIN=`echo "$SOURCE_URL" | sed -E 's/^(https?):\/\/([^\/]+)(\/[^\/]*)*$/\2/g'`
if [[ -z "$SOURCE_DOMAIN" ]]; then
	echo >&2 "ERROR: $SOURCE_URL is not standard URL"
	exit 1
fi

if [[ -e default.conf ]]; then
	sed "s@HOSTNAME@$HOSTNAME@g;\
		s@SOURCE_URL@$SOURCE_URL@g;\
		s@SOURCE_DOMAIN@$SOURCE_DOMAIN@g" \
		default.conf > /etc/nginx/conf.d/file_mirror.conf
fi

echo "$@"
exec $@