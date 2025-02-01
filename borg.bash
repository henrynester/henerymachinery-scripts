#!/bin/bash
# borg is a file backup tool
# https://borgbackup.readthedocs.io/

BORG_REPO_URL="henry@backup.fios-router.home:/mnt/array/henerymachinery"

# make a new repository
borg init --encryption=none $BORG_REPO_URL
# make a new archive of certain folders
ARCHIVE_NAME="first"
borg create $BORG_REPO_URL::$ARCHIVE_NAME ~/Documents ~/media/henry/"New Volume"

# list archives available at repo
borg list $BORG_REPO_URL
# list contents of archive
borg list $BORG_REPO_URL::$ARCHIVE_NAME
# restore
borg extract $BORG_REPO_URL::$ARCHIVE_NAME
# borg delete repo::archive
# borg compact repo to reduce storage space by compressing deleted
