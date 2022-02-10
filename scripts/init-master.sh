#!/bin/bash
echo "Configuring master..." >> README.md
echo "# Allow replication connections
host     replication     repuser         0.0.0.0/0        trust" >> /var/lib/postgresql/data/pg_hba.conf