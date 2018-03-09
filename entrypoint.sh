#!/bin/sh
if [ -z "$GCR_SERVICE_ACCOUNT" ]; then
    echo "WARN: GCR_SERVICE_ACCOUNT not set"
    exec "$@"
    exit 0
fi

file=$(mktemp)

set +x
echo $GCR_SERVICE_ACCOUNT > $file
gcloud auth activate-service-account --key-file $file

export GCR_SERVICE_ACCOUNT=""

/usr/local/bin/docker-entrypoint.sh "$@"
