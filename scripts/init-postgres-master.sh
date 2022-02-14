#!/bin/bash
reppassword=$
PGSQL_DATA='/var/lib/postgresql/data'

# PostgreSQL - Create the replication user
echo " Creating replication user" >> INSTALL_LOG
echo " Using password: $reppassword" >> INSTALL_LOG
sudo -u postgres -H -- psql -c "CREATE ROLE repuser PASSWORD 'md5${reppassword}' REPLICATION LOGIN;"