#!/bin/sh

if [ -r "${_REMOTE_USER_HOME}/.config/git/config" ] && grep -q 'diff "lockb"' "${_REMOTE_USER_HOME}/.config/git/config" 2>/dev/null
then
    : # lockb config already defined
else
    mkdir -p "${_REMOTE_USER_HOME}/.config/git"
    printf '[diff "lockb"]\n\ttextconv = bun\n\tbinary = true\n' >>"${_REMOTE_USER_HOME}/.config/git/config"
    chown "${_REMOTE_USER}:" "${_REMOTE_USER_HOME}/.config" "${_REMOTE_USER_HOME}/.config/git" "${_REMOTE_USER_HOME}/.config/git/config"
fi

if [ -r "${_REMOTE_USER_HOME}/.config/git/attributes" ] && grep -q lockb "${_REMOTE_USER_HOME}/.config/git/attributes" 2>/dev/null
then
    : # lockb attribute already defined
else
    mkdir -p "${_REMOTE_USER_HOME}/.config/git"
    echo '*.lockb binary diff=lockb' >>"${_REMOTE_USER_HOME}/.config/git/attributes"
    chown "${_REMOTE_USER}:" "${_REMOTE_USER_HOME}/.config" "${_REMOTE_USER_HOME}/.config/git" "${_REMOTE_USER_HOME}/.config/git/attributes"
fi
