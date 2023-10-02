hypervisor:
  pkg.installed:
    - pkgs:
      - qemu-kvm
      - bridge-utils
      - libvirt-bin
      - python
      - python-netifaces
      - vnc4server
      - libyaml-dev
      - python-yaml
      - numactl
      - libparted0-dev
      - libpciaccess-dev
      - libnuma-dev
      - libyajl-dev
      - libxml2-dev
      - libglib2.0-dev
      - libnl-dev
      - libnl-dev
      - python-pip
      - python-dev
      - libxml2-dev
      - libxslt-dev
      - linux-firmware 
      - linux-image-3.13.0.32-generic 
      - linux-image-extra-3.13.0.32-generic
      - linux-headers-3.13.0.32-generic
      - git

compile_and_install_libvirt:
  cmd.script:
  - unless: test -f /srv/salt/libvirt_PASS
  - source: salt://scripts/libvirt.sh
  - runas: root
  - shell: /bin/bash

enable_sr-iov:
  cmd.script:
  - unless: test -f /srv/salt/enablesriov_PASS
  - source: salt://scripts/enablesriov.sh
  - runas: root
  - shell: /bin/bash

change_kernel_3.13:
  cmd.script:
  - unless: test -f /srv/salt/changekernel_PASS
  - source: salt://scripts/changekernel.sh
  - runas: root
  - shell: /bin/bash

znnoc:
  user.present:
    - fullname: NocUser 
    - shell: /bin/bash
    - home: /home/znnoc
    - groups:
      - sudo 

vmxextract:
  archive.extracted:
    - name: /home/vmx
    - source: salt://apps/src/vmx-bundle-16.1R4-S1.3.tgz
    - user: root
    - group: root
    - options: --strip 1
    - enforce_toplevel: false

/home/vmx/config/perresvmx.conf:
  file.managed:
   - source: salt://templates/vmx.jinja
   - template: jinja
   - defaults:
     mgmtint: eth0
     reimage: junos-vmx-x86-64-16.1R3-S2.1.qcow2
     pfeimage: vFPC-20170119.img
     remem: 4096
     recores: 1
     reconsole: 8601
     pfemem: 16384
     pfecores: 6
     pfeconsole: 8602
     pfedevicetype: sriov
     pfeint1: p1p1
     pfeint1mtu: 2000
     pfeint2: p2p1
     pfeint2mtu: 2000

