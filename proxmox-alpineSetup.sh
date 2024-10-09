#!/bin/sh
# Setting up the neccessary components to proxmox be able to restart and shutdown guest.

echo "http://dl-cdn.alpinelinux.org/alpine/v3.20/community" >> /etc/apk/repositories
apk update && apk upgrade
apk add vim qemu-guest-agent udev
rc-update add udev boot
rc-update add udev-trigger boot
rc-update add udev-settle boot
rc-update add udev-postmount boot
rc-update add qemu-guest-agent
