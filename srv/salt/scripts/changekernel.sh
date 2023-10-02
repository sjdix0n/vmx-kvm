#!/bin/sh
echo 'GRUB_DEFAULT="Advanced options for Ubuntu>Ubuntu, with Linux 3.13.0-32-generic"' >> /etc/default/grub
touch /srv/salt/changekernel_PASS
/usr/sbin/update-grub
