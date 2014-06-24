#!/bin/sh
ansible-playbook -i inventory bootstrap.yml --ask-sudo-pass
