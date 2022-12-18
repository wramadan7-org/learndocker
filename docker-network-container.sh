docker network create --driver bridge mongonetwork

docker container create --name mongodbnetwork --network mongonetwork -e MONGO_INITDB_ROOT_USERNAME=rama -e MONGO_INITDB_ROOT_PASSWORD=rama mongo:latest

docker image pull mongo-express:latest

## Environment ME_CONFIG_MONGODB_URL is to connect with our mongodb
## mongodb://root:example@mongo:27017/
## root is user
## example is password
## mongo (after @) is host, if we want to connect with another container mention a name of container
## 27017 is port, if we want to connect with another container mention a port of container
docker container create --name mongodbexpress --network mongonetwork -p 8081:8081 -e ME_CONFIG_MONGODB_URL="mongodb://rama:rama@mongodbnetwork:27017/" mongo-express:latest

## Start mongodbnetwork and start mongodbexpress
docker container start mongodbnetwork

docker container start mongodbexpress

## mongonetork is name of network
## mongodbnetwork is container connect with network
docker network disconnect mongonetwork mongodbnetwork

## Connect network
docker network connect mongonetwork mongodbnetwork