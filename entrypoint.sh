#!/bin/sh
set -eu

HGID=1000

if [ -z "$(getent group $HGID)" ]; then
	addgroup -g $HGID app
fi

if [ -z "$(getent passwd $HUID)" ]; then
	adduser -G app -u $HUID -D app
fi

exec su-exec app toot $@
