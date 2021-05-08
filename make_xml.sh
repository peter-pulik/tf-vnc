#! /bin/sh

#
# Default values
#

TF_REPO="tungstenfabric"
TF_TAG="R2011-2021-04-28"

# Load config from .env
. $PWD/.env

docker run --rm -d -v $PWD:/host --entrypoint /bin/sh ${TF_REPO}/contrail-debug:${TF_TAG} -c "cp /manifest.xml /host/default.xml" > /dev/null

