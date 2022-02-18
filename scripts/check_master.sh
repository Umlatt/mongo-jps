#!/bin/bash
ipaddress=$1
PGSQL_DATA='/var/lib/postgresql/data'

while nc -z $ipaddress 5432; do
  echo -n "." >> REPLICATION_STATUS
  sleep 1 # wait for 1/10 of the second before check again
done
echo "\n\nMaster DB is unavailable. Promoting this slave to replica.\n" >> REPLICATION_STATUS
sudo -u postgres /usr/lib/postgresql/14/bin/pg_ctl promote -D $PGSQL_DATA >> REPLICATION_STATUS