#!/bin/bash
reppassword=$1
masterip=$2
PGSQL_DATA='/var/lib/postgresql/data'

# Stop database services
sudo /etc/init.d/postgresql stop
# Clear current data directory (excluding posgresql.conf & pg_hba.conf)
rm -rf !($PGSQL_DATA/postgresql.conf|$PGSQL_DATA/pg_hba.conf)

# Configure node to host_standby node
echo "hot_standby = on" >> $PGSQL_DATA/postgresql.conf
echo "primary_conninfo = 'host=${masterip} port=5432 user=repuser password=${reppassword}'" >> ${PGSQL_DATA}/postgresql.conf;
echo "promote_trigger_file = '/tmp/postgresql.trigger.5432'" >> ${PGSQL_DATA}/postgresql.conf;

# Add standby signal file
touch /var/lib/postgresql/data/standby.signal 

# Start database services
sudo /etc/init.d/postgresql start

