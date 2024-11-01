#!/bin/sh

set -e

FEATURE_DIR="$(pwd)"

cd /opt

git clone --filter=blob:none --no-checkout https://github.com/supabase/supabase
cd supabase
git sparse-checkout set --cone docker && git checkout master
rm -rf .git

cp "${FEATURE_DIR}/supabase" /usr/local/bin/supabase
chmod +x /usr/local/bin/supabase
