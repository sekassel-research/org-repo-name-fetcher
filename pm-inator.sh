#!/usr/bin/env bash
org=$1
homework=$2
prefix=$3
message=$4

mkdir -p "tmp"
mkdir -p "out/$homework"
bash fetch_repo_names.sh "$org" "$prefix" | while read name; do
	git clone "https://github.com/$org/$prefix$name.git" "tmp/$prefix$name"
	pushd "tmp/$prefix$name"
	zip "../../out/$homework/$prefix$name.zip" -r .
	popd
	rm -rf "tmp/$prefix$name"
done

python3 pm-inator.py "$message: <https://cloud.uniks.de/apps/files/?dir=/se-all/PM/WT2021/$homework>"
