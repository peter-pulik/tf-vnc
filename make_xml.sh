#! /bin/sh

#
# Default values
#

TF_REPO="tungstenfabric"
TF_TAG="R2011-2021-04-28"

if [ $# -gt 2 ]; then
	echo "ERROR: Wrong number of arguments"
	echo "Run as $0 [\$TAG]"
	echo "or as $0 \$REPO \$TAG"
	echo "REPO default value is ${TF_REPO}"
	echo "TAG default value is ${TF_TAG}"
	exit 1
fi

if [ $# == 1 ]; then
	TF_TAG="$1"
elif [ $# == 2 ]; then
	TF_REPO="$1"
	TF_TAG="$2"
fi

docker run --rm -d -v $PWD:/host --entrypoint /bin/sh ${TF_REPO}/contrail-debug:${TF_TAG} -c "cp /manifest.xml /host/default.xml" > /dev/null

