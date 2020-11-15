#!/bin/bash

ORG=$1
PREFIX=$2

PAGE_COUNT=$(curl -sI -H "Authorization: token $GITHUB_TOKEN" "https://api.github.com/orgs/$ORG/repos" | sed -n -r 's/^link:.*<[^>]*page=([0-9]+)>; rel="last".*$/\1/ip')

if [ -z "$PAGE_COUNT" ]
then 
    PAGE_COUNT=1
fi

for ((i=1;i<=PAGE_COUNT;i++)); do
    curl -s \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/orgs/$ORG/repos?page=$i" | jq -r ".[] | select(.name|startswith(\"$PREFIX\")) | .name" | sed -r "s/$PREFIX(.*)/\1/"
done
