#!/bin/bash
# Author: https://github.com/vitovitolo
rm /etc/bacula/backups/svn/* 2> /dev/null
/usr/bin/svnadmin dump --quiet /opt/svn/ > /etc/bacula/backups/svn/`hostname`_svnbackup_`date +"%Y%m%d"`.dump
