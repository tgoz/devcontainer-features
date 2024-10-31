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

cat >/usr/local/bin/supabase <<EOF
#!/bin/sh

case "$1" in
    pull)
        docker compose pull
    ;;
    up)
        docker compose up -d
    ;;
    stop)
        docker compose down
    ;;
    remove)
        docker compose down -v --remove-orphans
    ;;
    *)
        :
esac

EOF
chmod +x /usr/local/bin/supabase

pwd >/install-pwd
ls -lR >/install-ls-lR

echo "===================================================="
