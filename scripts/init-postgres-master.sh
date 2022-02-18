#!/bin/bash
reppassword=$1
PGSQL_DATA='/var/lib/postgresql/data'

# PostgreSQL - Create the replication user
echo " Creating replication user" >> INSTALL_LOG
sudo -u postgres -H -- psql -c "SELECT pg_reload_conf();"
echo " Using password: $reppassword" >> INSTALL_LOG
sudo -u postgres -H -- psql -c "CREATE ROLE repuser PASSWORD 'md5${reppassword}' REPLICATION LOGIN;"

sudo -u postgres -H -- psql -c "SELECT * from pg_create_physical_replication_slot('repl_slot');"
sudo -u postgres -H -- psql -c "SELECT slot_name, slot_type, active, wal_status FROM pg_replication_slots;" >> INSTALL_LOG

