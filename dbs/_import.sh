#!/bin/bash
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

# Give user option to pick the file to import
echo "Which .sql do you want to import? (give full filename, or leave blank to use db_sync.sql)"
read FILE_NAME
# If nothing is given then use db_sync.sql
if [ -z "$FILE_NAME" ]; then
  FILE_NAME="db_sync.sql"
fi

# Import
mysql -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME < $FILE_NAME