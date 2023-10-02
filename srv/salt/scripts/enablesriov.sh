#!/bin/sh
echo 'GRUB_CMDLINE_LINUX_DEFAULT="intel_iommu=on"' >> /etc/default/grub
echo 'options ixgbe max_vfs=4,4,4,4,4,4,4,4' >> /etc/modprobe.d/ixgbe.conf
touch /srv/salt/enablesriov_PASS
/usr/sbin/update-grub
/sbin/modprobe kvm-intel
