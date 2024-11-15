#!/bin/bash

###
# Количество документов
###

docker compose exec -T mongos_router mongosh --port 27020 --quiet  <<EOF

use somedb;
db.helloDoc.countDocuments();
exit();

EOF

# Количество документов на шарде 1 (и на репликах)
docker compose exec -T shard1 mongosh --port 27018 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
exit();

EOF

docker compose exec -T shard1-1 mongosh --port 27021 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
exit();

EOF

docker compose exec -T shard1-2 mongosh --port 27022 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
exit();

EOF

docker compose exec -T shard1-3 mongosh --port 27023 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
exit();

EOF

# Количество документов на шарде 2 (и на репликах)

docker compose exec -T shard2 mongosh --port 27019 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
exit();

EOF

docker compose exec -T shard2-1 mongosh --port 27024 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
exit();

EOF

docker compose exec -T shard2-2 mongosh --port 27025 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
exit();

EOF

docker compose exec -T shard2-3 mongosh --port 27026 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
exit();

EOF