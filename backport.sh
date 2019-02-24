#!/bin/bash

set -e

# TODO parameterize
gh_pr_endpoint="https://api.github.com/repos/AyuntamientoMadrid/consul/pulls/"
remote="consul"
pr_num="$1"

{ read head; read base; read head_ref; }  <<< "$(curl "$gh_pr_endpoint$pr_num" | jq -r ".head.sha, .base.sha, .head.ref" )"

git fetch $remote
git checkout -q "$remote/master"
git checkout -b "backport-$head_ref"

echo "cherry-picking $base..$head ..."
git cherry-pick $base..$head
git diff "$remote/master..HEAD"

 - run affected tests ?
