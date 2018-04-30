# Interation tests

[![Build Status](https://travis-ci.org/robertdebock/ansible-integration.svg?branch=master)](https://travis-ci.org/robertdebock/ansible-integration)

This setup runs many scenarios which include many roles and can be used to:
- Test Ansible roles.
- Demonstrate the intended usage of these roles.

## Setup

Each integration test is placed in it's own directory and contain:
1. A terraform configuration to manage hosts.
2. An ansible configuration to manage the configuration.

## Report

Every integration test saves a [report](https://robertdebock.nl/ansible-integration/).
