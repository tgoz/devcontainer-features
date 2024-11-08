#!/bin/sh

touch "${_REMOTE_USER_HOME}/.gitconfig"
NEW_GITCONFIG="$(
    # The existing file, up to but not including [diff "lockb"]
    sed -e '/\[diff "lockb"\]/,$d' "${_REMOTE_USER_HOME}/.gitconfig"
    # The required [diff "lockb"] section
    printf '[diff "lockb"]\n\ttextconv = bun\n\tbinary = true\n'
    # The existing file, removing everything up to and including [diff "lockb"]
    # and then printing anything including and after the first remaining line
    # starting with [
    sed -e '1,/\[diff "lockb"\]/d' "${_REMOTE_USER_HOME}/.gitconfig" | sed -n -e '/^[[]/,$p'
)"
echo "${NEW_GITCONFIG}" >${_REMOTE_USER_HOME}/.gitconfig
chown "${_REMOTE_USER}:" "${_REMOTE_USER_HOME}/.gitconfig"

if [ -r "${_REMOTE_USER_HOME}/.config/git/attributes" ] && grep -q lockb "${_REMOTE_USER_HOME}/.config/git/attributes" 2>/dev/null
then
    : # lockb attribute already defined
else
    mkdir -p "${_REMOTE_USER_HOME}/.config/git"
    echo '*.lockb binary diff=lockb' >>"${_REMOTE_USER_HOME}/.config/git/attributes"
    chown "${_REMOTE_USER}:" "${_REMOTE_USER_HOME}/.config" "${_REMOTE_USER_HOME}/.config/git" "${_REMOTE_USER_HOME}/.config/git/attributes"
fi
