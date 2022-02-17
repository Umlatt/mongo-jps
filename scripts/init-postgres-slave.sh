#!/bin/bash
reppassword=$1
masterip=$2
PGSQL_DATA='/var/lib/postgresql/data'

# Stop database services
echo " Stopping DB" >> INSTALL_LOG
sudo systemctl stop postgresql
# Clear current data directory (excluding posgresql.conf & pg_hba.conf)
echo " Cleaning old data directory [$PGSQL_DATA]" >> INSTALL_LOG
sudo rm -rf $PGSQL_DATA/*
echo " Sync data from master db." >> INSTALL_LOG
#sudo -u postgres pg_basebackup --pgdata $PGSQL_DATA \
#    --format=p --write-recovery-conf --checkpoint=fast \
#    --label=mffb --progress --host=$masterip --port=5432 \
#    --username=repuser

sudo -u postgres pg_basebackup -h ${masterip} -D ${PGSQL_DATA} -U repuser -v -P;

echo " Add replication settings to postgresql conf" >> INSTALL_LOG
echo "# Standby" >> $PGSQL_DATA/postgresql.conf
echo "primary_conninfo = 'user=repuser port=5432 host=$masterip application_name=replica'">> $PGSQL_DATA/postgresql.conf
echo "primary_slot_name = 'repl_slot'" >> $PGSQL_DATA/postgresql.conf

# Start database services
echo " Starting DB" >> INSTALL_LOG
sudo systemctl start postgresql
sudo -u postgres pg_ctl start &