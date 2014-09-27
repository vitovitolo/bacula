#!/bin/bash

# Full Backup of Postgresql 9.1 database
# Author: https://github.com/vitovitolo

DST_DIR=/etc/bacula/backups/postgresql/
DST_HOST="10.0.1.1"
DB="databasename"

#Delete old backup
rm $DST_DIR/* 2> /dev/null
# Pause the writing in replication node. Note that streaming has not been stoped, only the writing process.
psql -h $DST_HOST -U postgres -d $DB -c "SELECT pg_xlog_replay_pause();"
#Dump data from pgsql
pg_dump -h $DST_HOST -U postgres $DB -Fc | gzip > $DST_DIR/`hostname`_postgresql_databasename_data_backup_`date +"%Y-%m-%d"`.gz
#Dump roles from pgsql
pg_dumpall -h $DST_HOST -U postgres --database=scint --roles-only --no-tablespaces | gzip > $DST_DIR/`hostname`_postgresql_databasename_roles_backup__`date +"%Y-%m-%d"`.gz

# Recover the replication
psql -h $DST_HOST -U postgres -d $DB -c "SELECT pg_xlog_replay_resume();"
