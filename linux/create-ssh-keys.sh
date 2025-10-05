#! /bin/bash

ssh-keygen -b 2048 -t rsa
# enter the file name
# enter and confirm the passphrase

# set correct permissions (read only)
chmod 0400 ssh_key

# send private key to client
# append public key to .ssh/auhtorized_keys on the server

# /etc/ssh/sshd_config changes
# configure sshd with
# PubkeyAuthentication yes
# to disable password authntication, configure ssh with
# PasswordAuthentication no
