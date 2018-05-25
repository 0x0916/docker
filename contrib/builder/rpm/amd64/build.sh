#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

set -x
./generate.sh
for d in */; do
	if [ "$d" == "centos-7/" ];then
		docker build -t "dockercore/builder-rpm:$(basename "$d")" "$d"
	fi
done
