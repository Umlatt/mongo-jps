#!/bin/bash
echo "Configuring slave..." >> README.md
echo "# Allow replication connections
host     replication     repuser         0.0.0.0/0        trust" >> /var/lib/postgresql/data/pg_hba.conf