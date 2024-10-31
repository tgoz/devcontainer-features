#!/bin/sh

set -e

echo "===================================================="
echo "STARTING INSTALL.SH FROM SUPABASE FEATURE"
echo "===================================================="

set -x
date
id
pwd
set +x

git clone --filter=blob:none --no-checkout https://github.com/supabase/supabase
cd supabase
git sparse-checkout set --cone docker && git checkout master

# Go to the docker folder
cd docker

# Copy the fake env vars
cp .env.example .env

# Pull the latest images
docker compose pull

echo "===================================================="
