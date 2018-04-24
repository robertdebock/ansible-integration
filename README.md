# Interation tests

This setup runs many roles and can be used to:
- Test Ansible roles.
- Demonstrate the intended usage of these roles.

## Setup

```
+--- Webserver ---+
| Serve web pages |
| Proxy requests: |            +--- Backendserver ---+
| - roundcubemail | ---------> | Zabbix server       |
| - zabbix        |            | Roundcubemail       |
| - application   | -+         | rsyslog server      |
+-----------------+  |         | Zabbix web frontend |
                     V         | ISC Bind DNS server |
+--- Application server ---+   | postfix server      |
| Java + Tomcat                   |   |   - clamav          |
+--------------------------+   |   - spamassassin    |
                     |         | Rundeck             |
                     V         +---------------------+
+--- Database server ---+                 |
| MySQL Database        |                 |
|   - zabbix            |                 |
|   - roundcube         | <---------------+
+-----------------------+
```
