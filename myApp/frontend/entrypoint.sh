#!/bin/sh
set -e

# Start SSH Server
/usr/sbin/sshd -D &

# Start Node.js Application
exec npm start
