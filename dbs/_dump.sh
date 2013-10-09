#!/bin/bash
FILE_NAME="..."
DATESTAMP=$(date '+%Y.%m.%d.%H.%M.%S')

# Get script location
# Get script location
self="${0#./}"
base="${self%/*}"
current=$(pwd)

if [ "$base" = "$self" ] ; then
  { cd "$current"; DIR=$(pwd); }
else
  { cd $current/$base; DIR=$(pwd); }
fi;

# Check what credentials to use
if [ "$DIR" == "..." ]; then
  DB_NAME="..."
  DB_HOST="..."
  DB_USER="..."
  DB_PASS="..."
elif [ "$DIR" == "..." ]; then
  DB_NAME="..."
  DB_HOST="..."
  DB_USER="..."
  DB_PASS="..."
else
  echo "Cannot determine environment — please check dirnames that are being checked"
  exit
fi

# Create db backup
mysqldump --no-create-db=true -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME > $FILE_NAME.$DATESTAMP.sql
# Create db sync file
mysqldump --no-create-db=true -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME > db_sync.sql