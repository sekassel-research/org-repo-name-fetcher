#!/bin/bash

ORG=$1
PREFIX=$2

PAGE_COUNT=$(curl -sI "https://api.github.com/orgs/$ORG/repos?access_token=$GITHUB_TOKEN" | sed -n -r 's/^link:.*<[^>]*page=([0-9]+)>; rel="last".*$/\1/ip')

for ((i=1;i<=PAGE_COUNT;i++)); do
    curl -s \
    -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/orgs/$ORG/repos?access_token=$GITHUB_TOKEN&page=$i" | jq -r ".[] | select(.name|startswith(\"$PREFIX\")) | .name" | sed -r "s/$PREFIX(.*)/\1/"
done
