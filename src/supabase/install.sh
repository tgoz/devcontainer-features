#!/bin/sh

set -ex

echo "===================================================="
echo "STARTING INSTALL.SH FROM SUPABASE FEATURE"
echo "===================================================="

date
id
cd /opt

git clone --filter=blob:none --no-checkout https://github.com/supabase/supabase
cd supabase
git sparse-checkout set --cone docker && git checkout master

cp supabase /usr/local/bin/supabase
chmod +x /usr/local/bin/supabase

echo "===================================================="
