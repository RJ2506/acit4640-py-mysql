#!/bin/bash

set -ex


echo "This runs before the web service is launched in the docker container"
envsubst < /app/backend.conf > /app/backend.conf
sed -i "s|___MYSQL_HOST___|${MYSQL_HOST}|" /app/backend.conf
/app/wait-for-it.sh -h ${MYSQL_HOST} -p ${MYSQL_PORT} -t 30 --


exec /app/.local/bin/gunicorn wsgi:app -b 0.0.0.0:8000