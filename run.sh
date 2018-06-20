#!/bin/bash

set -e

TIMESTAMP=`date +%Y%m%d-%H%M%S`

mkdir -p work

if [ ! -d work/mastodon.weblate.backup.archive ]; then
    pushd work
    git clone 
    popd
fi

pushd work/mastodon.weblate.backup.archive
git pull
popd

mkdir -p work/mastodon.weblate.backup.archive/zh_Hant_HK

wget https://weblate.joinmastodon.org/download/mastodon/backend/zh_Hant_HK/      -O work/mastodon.weblate.backup.archive/zh_Hant_HK/backend.yml
wget https://weblate.joinmastodon.org/download/mastodon/frontend/zh_Hant_HK/     -O work/mastodon.weblate.backup.archive/zh_Hant_HK/frontend.json
wget https://weblate.joinmastodon.org/download/mastodon/activerecord/zh_Hant_HK/ -O work/mastodon.weblate.backup.archive/zh_Hant_HK/activerecord.yml
wget https://weblate.joinmastodon.org/download/mastodon/devise/zh_Hant_HK/       -O work/mastodon.weblate.backup.archive/zh_Hant_HK/devise.yml
wget https://weblate.joinmastodon.org/download/mastodon/doorkeeper/zh_Hant_HK/   -O work/mastodon.weblate.backup.archive/zh_Hant_HK/doorkeeper.yml
wget https://weblate.joinmastodon.org/download/mastodon/simple_form/zh_Hant_HK/  -O work/mastodon.weblate.backup.archive/zh_Hant_HK/simple_form.yml

pushd work/mastodon.weblate.backup.archive
git add --all
git commit -m "update ${TIMESTAMP}" || true
git push
popd
