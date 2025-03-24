#!/bin/sh
set -e

# Add debug line to entrypoint.sh
echo "Entrypoint script location: $(pwd)/entrypoint.sh"
ls -l /app/entrypoint.sh

# Start SSH Server
/usr/sbin/sshd -D &

# Start Node.js Application
exec npm start -- --host 0.0.0.0