#!/bin/bash
echo "Step 2 - Postgres - Init Master Node" >> README.md
password=$(cat replication_password)
echo "Creating replication user..." >> README.md
# Create archive location for replication
mkdir /var/lib/postgresql/archive
chown postgres:postgres /var/lib/postgresql/archive
# PostgreSQL - Create the replication user
gosu postgres postgres --single <<-EOSQL
   CREATE ROLE repuser PASSWORD 'md5${password}' REPLICATION LOGIN;
EOSQL