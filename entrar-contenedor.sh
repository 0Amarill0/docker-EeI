#!/bin/bash
if [[ $# -ne 1 ]]; then
	echo "Use: $0 container-name"
	exit 0
fi

docker exec -it $1 bash
