#!/bin/sh

valid_tz()
{
    [ -r /usr/share/zoneinfo/"$1" ]
}

if [ -n "${DEVTZ}" ] && valid_tz "${DEVTZ}"
then
    SET_TZ="${DEVTZ}"
elif [ -L /run/timezone-etc/localtime ]
then
    TMP_TZ="$(readlink /run/timezone-etc/localtime|sed 's#.*zoneinfo/##')"
    if valid_tz "${TMP_TZ}"
    then
        SET_TZ="${TMP_TZ}"
    fi
fi
if [ -z "${SET_TZ}" ] && valid_tz "${DEFAULTTZ}"
then
    SET_TZ="${DEFAULTTZ}"
fi

if [ -n "${SET_TZ}" ]
then
    if [ $(id -u) -eq 0 ]
    then
        ln -sf /usr/share/zoneinfo/"${SET_TZ}" /etc/localtime
    else
        sudo ln -sf /usr/share/zoneinfo/"${SET_TZ}" /etc/localtime
    fi
fi
