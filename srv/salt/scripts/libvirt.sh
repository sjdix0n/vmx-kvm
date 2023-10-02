#!/bin/sh
echo "### get file"
wget http://libvirt.org/sources/libvirt-1.2.19.tar.gz
echo "### extraxt file"
tar xzvf libvirt-1.2.19.tar.gz
echo "### cd to folder"
cd libvirt-1.2.19
echo "### stop existing libvirt"
service libvirt-bin stop
echo "### configure"
./configure --prefix=/usr --localstatedir=/ --with-numactl
echo "### make"
make
echo "### install"
make install
echo "### start"
service libvirt-bin start
echo "### is it running"
ps aux | grep libvirtd
echo "### check version"
/usr/sbin/libvirtd --version
/usr/bin/virsh --version
touch /srv/salt/libvirt_PASS
