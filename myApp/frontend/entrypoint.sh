#!/bin/bash
set -e

# Start SSH in background and capture PID
/usr/sbin/sshd -D &
SSHD_PID=$!

# Wait for SSH to bind to port 2222
timeout 15 sh -c 'until nc -z localhost 2222; do sleep 1; done' || {
    echo "SSH failed to start within 15 seconds"
    exit 1
}

# Start Node.js application in foreground
exec npm start

# Cleanup on exit (optional)
trap "kill $SSHD_PID" EXIT
