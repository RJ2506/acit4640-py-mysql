#!/bin/bash

set -ex


echo "This runs before the web service is launched in the docker container"
sed -i "s|___MYSQL_HOST___|${MYSQL_HOST}|" /app/src/backend.conf
/app/src/wait-for-it.sh -h ${MYSQL_HOST} -p ${MYSQL_PORT} -t 30 --


envsubst < /app/src/backend.conf.template > /app/src/backend.conf
exec /app/.local/bin/gunicorn wsgi:app -b 0.0.0.0:8000