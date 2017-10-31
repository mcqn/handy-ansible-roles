#!/bin/bash
set +e
SSH_OPTIONS=" -i /etc/tunnel/id_rsa" 
# Always assume initial connection will be successful
export AUTOSSH_GATETIME=0
# Disable echo service, relying on SSH exiting itself
export AUTOSSH_PORT=0
#to test, use (check out man ssh for explanation of options:
autossh -vv -- $SSH_OPTIONS -o 'ControlPath none' -L 6379:localhost:6379 -R 2222:localhost:22 tunneluser@tunnelserver -N > /var/user_sshlog.out 2> /var/user_ssh_error.out &
#once proven, use (and rem out previous command):
#autossh -f -- $SSH_OPTIONS -o 'ControlPath none' -L 6379:localhost:6379 -R 2222:localhost:22 tunneluser@tunnelserver -N 2> /var/user_ssh_error.out &

