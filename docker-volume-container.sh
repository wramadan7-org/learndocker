## Create volume
sudo docker volume create mongodata

## Create container
sudo docker container create --name mongovolume -p 27019:27017 --mount "type=volume,source=mongodata,destination=/data/db" -e MONGO_INITDB_ROOT_USERNAME=rama -e MONGO_INITDB_ROOT_PASSWORD=rama mongo:latest

## Stop container
sudo docker container stop mongovolume

## Delete container
sudo docker container rm mongovolume