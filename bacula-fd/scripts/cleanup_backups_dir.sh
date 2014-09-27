#!/bin/bash

# Cleanup of bacula backup directory
# Author: https://github.com/vitovitolo 2013-09-17

DST_DIR="/etc/bacula/backups/*/*"

#Delete temporal backups in first level of directories
rm $DST_DIR 2> /dev/null
#Delete temporal backups in second level of dirs
rm $DST_DIR/* 2> /dev/null
exit 0
