#!/bin/bash

# Reload Nginx configuration inside the container
docker exec nginx nginx -s reload
