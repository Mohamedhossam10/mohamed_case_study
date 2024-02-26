
#!/bin/bash

DB_USER="UNIVERSITY"
DB_PASSWORD="uni"
DB_NAME="XE"



TIMESTAMP=$(date "+%Y%m%d%H%M%S")
name="$DB_USER$TIMESTAMP"
BACKUP_FILE="$name.dmp"
log_name=$TIMESTAMP"_log"
log_file="$log_name.log"



expdp $DB_USER/$DB_PASSWORD@$DB_NAME DIRECTORY=my_data_pump_dir DUMPFILE=$BACKUP_FILE LOGFILE=$log_file SCHEMAS=$DB_USER


if [ $? -eq 0 ]; then
    echo "Database backup completed successfully: $BACKUP_FILE"
else
    echo "Error: Database backup failed! See expdp.log for details."
fi