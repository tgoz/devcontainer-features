#!/bin/sh

if [ ! -f /usr/share/zoneinfo/UTC ]
then
    if command -v apt-get >/dev/null
    then
        DEBIAN_FRONTEND=noninteractive apt-get update
        DEBIAN_FRONTEND=noninteractive apt-get install -yq tzdata
    elif command -v yum >/dev/null
    then
        yum install -y tzdata
    elif command -v apk >/dev/null
    then
        apk add tzdata
    fi
fi

(
    echo '#!/bin/sh'
    echo "export DEFAULTTZ=${FALLBACKTIMEZONE}"
    cat set-timezone.sh
) >/usr/local/bin/devcontainer-timezone-set
chmod +x /usr/local/bin/devcontainer-timezone-set
