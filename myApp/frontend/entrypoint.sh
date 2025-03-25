#!/bin/sh
# File currently being bypassed.
set -e

# Start SSH server in background (Azure requires port 2222)
/usr/sbin/sshd -D &

# Start Node.js application with Azure requirements
exec npm start -- --host 0.0.0.0 -p 3000