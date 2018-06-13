Mongo Shard Cluster Docker Compose
==================================

This repository provides a minimal fully sharded mongo environment using docker-compose for **DEVELOP** use.

The MongoDB environment consists of the following docker containers

 - **pep-mongoshard**: Mongod data server with one replica set (1 container)
 - **pep-mongocfg**: Stores metadata for sharded data distribution (1 container)
 - **pep-mongos**: Mongo routing service to connect to the cluster through (1 container)

Setup Cluster
-------------

This will pull MongoDB v3.6.5 image and run all the containers.

```
$ docker-compose up
```

You will need to run the following once only to initialize all replica sets and shard data across them

```
$ ./init.sh
```

You should now be able connect to pep-mongos and the new sharded cluster from the mongos container itself using the mongo shell to connect to the running mongos process

```
docker exec -it pep-mongos mongo --port 21017
```
