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
