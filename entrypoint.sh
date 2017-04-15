#!/bin/sh
set -euo pipefail

: ${UID:=$(id -u nobody)}
: ${GID:=$(id -g nobody)}

chmod +r /gitbucket.war
chown -R $UID:$GID /data
exec /sbin/chpst -u :$UID:$GID  /usr/bin/java -jar /gitbucket.war \
  --host=$HOSTNAME --port=8080 --gitbucket.home=/data --prefix=${PREFIX:-/}
