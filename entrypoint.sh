#!/bin/sh

# Export the DOMAIN_NAME environment variable
export DOMAIN_NAME=${DOMAIN_NAME}

# Substitute environment variables in the nginx configuration file
envsubst '${DOMAIN_NAME}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

# Start Nginx
nginx -g 'daemon off;'