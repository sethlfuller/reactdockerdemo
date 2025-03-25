# frontend/Dockerfile
FROM node:18-alpine
WORKDIR /app

# Install OpenSSH and configure Azure requirements
RUN apk add --no-cache openssh \
    && echo "root:Docker!" | chpasswd \
    && ssh-keygen -A

# Copy SSH configuration
COPY sshd_config /etc/ssh/sshd_config


COPY package.json .
RUN npm install
COPY . .

# Set up entrypoint
COPY entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh

EXPOSE 3000 2222

ENTRYPOINT ["/app/entrypoint.sh"]

#CMD ["/bin/sh", "-c", "/usr/sbin/sshd -D & npm start"]

#CMD ["npm", "start"]