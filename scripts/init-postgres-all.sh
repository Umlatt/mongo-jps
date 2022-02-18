#!/bin/bash

PGSQL_DATA='/var/lib/postgresql/data'
# Create archive location for replication
echo " Creating archive space" >> INSTALL_LOG
mkdir /var/lib/postgresql/archive
chown postgres:postgres /var/lib/postgresql/archive
# Create replication user access
echo "# Allow replication connections for remote DBs
host     replication     repuser         0.0.0.0/0          trust" >> $PGSQL_DATA/pg_hba.conf
sudo apt install netcat -y