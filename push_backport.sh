#!/bin/bash

set -x
set -e

original_pr="$1"
own_remote="wairbut"
branch_name=`git rev-parse --abbrev-ref HEAD`

git push -u $own_remote $branch_name

echo "References
=====================
 - Backport of: https://github.com/AyuntamientoMadrid/consul/pull/$original_pr
 - Original issue:"

open "https://github.com/consul/consul/compare/master...wairbut-m2c:$branch_name?expand=1"


#Objectives

#asdf
#sd
#ds"
