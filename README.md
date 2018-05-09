# Interation tests

[![Build Status](https://travis-ci.org/robertdebock/ansible-integration.svg?branch=master)](https://travis-ci.org/robertdebock/ansible-integration)

This setup runs many scenarios which include many roles and can be used to:
- Test Ansible roles.
- Demonstrate the intended usage of these roles.

## Setup

Terraform is used to start "droplets" (virtual machines) on Digital Ocean.
Ansible is used to configure these droplets.

The files (for Terraform and Ansible) are split to make them easier to understand.

## Report

Every integration test saves a [report](https://robertdebock.nl/ansible-integration/report/).


# Overview of environments

## Infrastructure

```text
+--- machine4.meinit.nl ---+    +--- machine5.meinit.nl ---+
| rsyslog server           | <- | rsyslog client           |
+--------------------------+    +--------------------------+
```


## Mail

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

## Webapp

```text
+--- machine6.meinit.nl ---+    +--- machine7.meinit.nl ---+
| application server       | <- | web server               |
+--------------------------+    +--------------------------+
```
