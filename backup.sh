#!/bin/bash

# Variables
SOURCE_FILES="/home/website-abc/public_html"
DESTIN_PATH="/root/website-ABC"
DB_NAME="site_db"

# Setting up folders
mkdir -p $DESTIN_PATH/files && mkdir $DESTIN_PATH/db

# Backup Database
mysqldump $DB_NAME > $DESTIN_PATH/db/database_dump.sql

# Backup files
rsync -avh $SOURCE_FILES $DESTIN_PATH/files

# Set ownership as root so it doesn't eat into the users quota
chown -R root:root $DESTIN_PATH/files

exit 0
