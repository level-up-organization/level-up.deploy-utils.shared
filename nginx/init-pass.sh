#!/bin/bash

if [ ! -f /etc/nginx/.htpasswd ]; then
    USERNAME="user$(openssl rand -hex 3)"
    PASSWORD=$(openssl rand -base64 12)
    
    htpasswd -b -c /etc/nginx/auth/.htpasswd "$USERNAME" "$PASSWORD"
    
    echo "=========================================="
    echo "Generated credentials for Basic Auth:"
    echo "Username: $USERNAME"
    echo "Password: $PASSWORD"
    echo "=========================================="
fi

exec nginx -g "daemon off;"