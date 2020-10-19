#!/usr/bin/env bash

set -eo pipefail

auth="$(pass show bitbucket_api)"
echo > /tmp/bitbucket_prs_tmp

users='AliakseiKrychko|5bb1df071767377761ba66c8
DominikHurtienne|5d888ab0c7d4e30dc282e040
DickBrouwers|557058:641c5016-66bb-41f6-9dbb-b73f9ec7a1f6
DilekGencer|557058:28c977dc-ed66-4923-aa1e-549666efd7ab
DinoSatto|5db6b7c2b3c7570c49db17af
DanielMartinez|5bdb0d31a6ec23204d6bfb1a
EnriqueSalazar|5ed642658884020c24ec25cc
IlliaPermiakov|5de5221d752c1b0d114f2caf
JaninaWoita|5bdb093b25920d32d45f9f5a
JorisDieben|557058:f24de807-f4ba-40a3-9f00-ef9db0d0c8e3
JosipJanzic|557058:99d74746-bf01-46a1-afc4-bbb8710470d9
MaikBroxterman|557058:0366c782-13dc-4a86-aa9f-2872f0b7c5cf
PeterParkkali|5bb22d3fd9ae0f09918831d7
ReethikaDSouza|557058:94465eb7-5559-4271-b46d-7e38d04fea0d
RikBruil|557058:1de164e2-f551-4bc9-ae1a-ae0c0ea2c002
RobertoVecilla|5bb1e10eeec89a2b8534a585
VasileiaFtochogianni|5b8d30c7d1ba852c37e18192'

for bb_user in $users
do
    echo Processing "$bb_user"
    bb_uuid=$(echo "$bb_user" | cut -f 2 -d'|')
    curl -s -u "$auth" "https://api.bitbucket.org/2.0/pullrequests/$bb_uuid" >> /tmp/bitbucket_prs_tmp
done



if [[ "$(cat /tmp/bitbucket_prs_tmp)" != "" ]]
then
    mv /tmp/bitbucket_prs_tmp /tmp/bitbucket_prs
fi
rm -f /tmp/bitbucket_prs_tmp

for link in $(jq < /tmp/bitbucket_prs '.values[] | (.links.diff.href) + "|" + (.source.repository.name) + (.id |tostring) + (.updated_on)' -r); do
    file_name=/tmp/bitbucket_prs_$(echo "$link" | cut -d'|' -f2)
    if [[ -f "$file_name" ]]; then
        # echo Skipping "$file_name"
        continue
    fi
    # echo Processing "$file_name"
    curl -sL -u "$auth" "$(echo $link | cut -d'|' -f1)" > "${file_name}"
done
