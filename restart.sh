#!/bin/bash

# Restart Nginx inside the container
docker exec nginx nginx -s quit
docker exec nginx nginx
