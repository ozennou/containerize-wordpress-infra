#!/bin/sh

#change the password from env
hashed_passwd=$(htpasswd -nb -B admin $PORTAINER_PASS | cut -d ":" -f 2 | tr -d '\n')

exec ./portainer/portainer --bind-https 0.0.0.0:9443 --admin-password="$hashed_passwd"