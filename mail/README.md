# Setup

```text
+--- machine1.meinit.nl ---------+   +--- machine2.meinit.nl ---------+
| Receiving mailserver           |   | Outgoing mailserver            |
|   - mydestination: example.com |   |   - mynetworks: 192.168.1.0/24 |
+--------------------------------+   +--------------------------------+
                                          ^
                                          |
                   +--- machine3.meinit.nl ------------+
                   | Mailserver client                 |
                   |   - relayhost: machine2.meinit.nl | 
                   +-----------------------------------+
```
