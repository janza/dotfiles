#!/usr/bin/env bash

set -eo pipefail

auth="$(pass show bitbucket_api)"
echo > /tmp/bitbucket_prs_tmp
for repo in community-backend api cloudformation-templates community syncsearch community-api e2e_tests infrastructure
do
    echo Processing $repo
    curl -s -u "$auth" "https://api.bitbucket.org/2.0/repositories/insided/$repo/pullrequests" >> /tmp/bitbucket_prs_tmp
done



if [[ "$(cat /tmp/bitbucket_prs_tmp)" != "" ]]
then
    mv /tmp/bitbucket_prs_tmp /tmp/bitbucket_prs
fi
rm -f /tmp/bitbucket_prs_tmp

for link in $(jq < /tmp/bitbucket_prs '.values[] | (.links.diff.href) + "|" + (.source.repository.name) + (.id |tostring) + (.updated_on)' -r); do
    file_name=/tmp/bitbucket_prs_$(echo "$link" | cut -d'|' -f2)
    if [[ -f "$file_name" ]]; then
        echo Skipping "$file_name"
        continue
    fi
    echo Processing "$file_name"
    curl -sL -u "$auth" "$(echo $link | cut -d'|' -f1)" > "${file_name}"
done
