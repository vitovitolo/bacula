#!/bin/bash
# Author: https://github.com/vitovitolo
# Script to save redmine and wiki databases to a file.
# Previously delete last backups.

# This script was designed to execute it through bacula backups system.

USER=username
PASS=passwd

rm /etc/bacula/backups/mysql/support/* 2> /dev/null
/usr/bin/mysqldump -u $USER -p$PASS --opt --routines --triggers --events --databases -c redmine_default wikidb 2> /etc/bacula/backups/mysql/support/`hostname`-mysql-redmine-wiki-backup_$(date +%Y%m%d).log | gzip >  /etc/bacula/backups/mysql/support/`hostname`-mysql-redmine-wiki-backup_$(date +%Y%m%d).sql.gz
