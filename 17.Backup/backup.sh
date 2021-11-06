#!/bin/bash
export BORG_PASSPHRASE='password' 
export BORG_REPO='vagrant@server.local:/var/backup'

borg create --stat $BORG_REPO::`date +%Y%m%d_%H%M%S` /etc

borg prune --keep-within 1y --keep-monthly 12 --keep-daily 90
