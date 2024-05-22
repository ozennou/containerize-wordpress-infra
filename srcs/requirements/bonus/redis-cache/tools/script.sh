#!/bin/sh

exec redis-server --protected-mode no --requirepass $REDIS_PASSWD --daemonize no