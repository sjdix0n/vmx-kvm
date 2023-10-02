# Using salt minion to build KVM Hypervisor for vMX.

Build this years ago haven't done much with it but still works on ubuntu 14.04

# To use

## Install salt-masterless.

```
curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
sudo sh bootstrap_salt.sh
```

vi /etc/salt/minion.d/zg-masterless.conf   (zabbix is optional)
```
—
file_client: local
 
file_roots:
  base:
    - /srv/salt
    - /srv/formulas/zabbix-formula
—
```


Stop the minion
```
systemctl stop salt-minion
```
Stop it starting on boot
```
systemctl disable salt-minion
```

Run it locally

```
salt-call --local state.apply -l debug
salt-call --local state.apply test=true
```