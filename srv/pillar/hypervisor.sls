zabbix:
  version_repo: 3.2
  lookup:
    version_repo: 3.2
    agent:
      version: 3.2

zabbix-agent:
  listenport: 10050
  logfile: /var/log/zabbix/zabbix_agentd.log
  pidfile: /var/run/zabbix/zabbix_agentd.pid
  logfilesize: 0
  include: /etc/zabbix/zabbix_agentd.d/
  tlsconnect: psk
  tlsaccept: psk
  tlspskfile: /etc/zabbix/agent.psk
  tlspskidentity: perresvmx01
  server: 203.32.127.252
