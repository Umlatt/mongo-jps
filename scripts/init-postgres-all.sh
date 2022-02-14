#!/bin/bash

PGSQL_DATA='/var/lib/postgresql/data'
# Create archive location for replication
echo " Creating archive space"
mkdir /var/lib/postgresql/archive
chown postgres:postgres /var/lib/postgresql/archive
# Create replication user access
echo -e "\n# Allow replication connections for remote DBs
host     replication     repuser         0.0.0.0/0          md5" >> $PGSQL_DATA/pg_hba.conf