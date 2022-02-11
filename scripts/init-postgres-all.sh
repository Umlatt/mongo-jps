#!/bin/bash
echo "Step 1 - Postgres - Init - Generic" >> README.md
echo -e "\n# Allow replication connections for remote DBs
host     replication     repuser         0.0.0.0/0          md5" >> /var/lib/postgresql/data/pg_hba.conf