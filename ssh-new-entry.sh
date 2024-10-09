#!/bin/bash
# A simple helper script to manage new ssh connection through aliases.

if [ "$#" -lt 2 ]; then
    echo "usage:"
    echo "${0} hostname ip user(optional)"
    echo "default user is [root]"
    exit 1
fi

if [ "$#" -gt 3 ]; then
    echo "Too many args. exiting"
    exit 1
fi

CONFLOCATION="/home/${USER}/.ssh/config"
HOSTNAME=${1}
HOSTIP=${2}
HOSTUSER=${3}

if [ -z "${3}" ]; then
    HOSTUSER="root"
fi


cat >> ${CONFLOCATION}<< EOF

Host "${HOSTNAME}"
  HostName ${HOSTIP}
  User ${HOSTUSER}
  Port 22
EOF

echo "added new ssh alias entry:"
echo "hostname: ${HOSTNAME}"
echo "ip: ${HOSTIP}"
echo "user: ${HOSTUSER}"

read -p "Add ssh public key to the new host? (Y/N): " sshadd

if [ ${sshadd} == "y" ]; then
    ssh-copy-id ${HOSTUSER}@${HOSTIP}
    echo "ssh public key successfully copied."
fi
