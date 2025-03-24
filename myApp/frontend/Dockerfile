# frontend/Dockerfile
FROM node:18-alpine
WORKDIR /app

# Install OpenSSH and configure Azure requirements
RUN apk add --no-cache openssh \
    && echo "root:Docker!" | chpasswd \
    && ssh-keygen -A

# Copy SSH configuration
COPY sshd_config /etc/ssh/sshd_config


# Application dependencies
COPY package*.json ./
RUN npm install

# Copy application files
COPY . .

RUN chmod +x entrypoint.sh

# Expose application and SSH ports
EXPOSE 3000 2222

# Configure entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
