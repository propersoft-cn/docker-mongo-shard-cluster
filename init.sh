#!/bin/bash

echo "Intializing mongo config"
cfgScript="rs.initiate({_id: \"mongocfg\",configsvr: true,members: [{ _id : 0, host : \"pep-mongocfg:27019\" }]}); rs.status();"
docker exec -it pep-mongocfg bash -c "echo '${cfgScript}' | mongo --port 27019"

sleep 2

echo "Intializing mongo shard"
shScript="rs.initiate({_id : \"mongoshard\",members: [{ _id : 0, host : \"pep-mongoshard:27018\" }]}); rs.status();"
docker exec -it pep-mongoshard bash -c "echo '${shScript}' | mongo --port 27018"

sleep 2

echo "Intializing mongos"
docker exec -it pep-mongos bash -c "echo \"sh.addShard('mongoshard/pep-mongoshard:27018');\" | mongo "
