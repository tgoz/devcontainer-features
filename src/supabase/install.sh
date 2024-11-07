#!/bin/sh

if [ -f /etc/debian_version ]
then
    PFMT=deb
elif [ -f /etc/alpine-release ]
then
    PFMT=apk
elif command -v yum >/dev/null
then
    PFMT=rpm
else
    echo "Unable to identify distribution package format" >&2
    exit 1
fi

install_package()
{
    case $PFMT in
    deb)
        DEBIAN_FRONTEND=noninteractive apt update
        DEBIAN_FRONTEND=noninteractive apt install -yq "${1}"
        ;;
    rpm)
        yum install -y "${1}"
        ;;
    apk)
        apk add --allow-untrusted --no-cache "${1}"
        ;;
    esac
}

get_url()
{
    if command -v curl >/dev/null
    then
        curl -L -s "${1}"
    elif command -v wget >/dev/null
    then
        wget -q -O - "${1}"
    else
        ( install_package curl ) >/dev/null 2>&1
        if command -v curl >/dev/null
        then
            curl -L -s "${1}"
        else
            echo "Unable to download" >&2
            return 1
        fi
    fi
}

get_arch()
{
    MACHINE="$(uname -m)"
    case "${MACHINE}" in
    x86_64)
        echo "amd64"
        ;;
    aarch64*|armv8*)
        echo "arm64"
        ;;
    *)
        echo "Unknown machine architecture: ${MACHINE}" >&2
        return 1
    esac
}


PACKAGE="$(get_url https://api.github.com/repos/supabase/cli/releases/latest | \
    awk -F\" '/browser_download_url.*'"$(get_arch)"'\.'${PFMT}'/ { print $4 }')"

get_url "$PACKAGE" >/tmp/"${PACKAGE##*/}"
install_package /tmp/"${PACKAGE##*/}"
rm -f /tmp/"${PACKAGE##*/}"
