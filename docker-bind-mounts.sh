## BIND MOUNTS
## Is a to sharing/binding folder/file between container and our host (OS)

sudo docker container create --name mongodata -p 27018:27017 --mount "type=bind,source=/home/ramz/Documents/Programming/Docker/learndocker/mongo-data,destination=/data/db" -e MONGO_INITDB_ROOT_USERNAME=rama -e MONGO_INITDB_ROOT_PASSWORD=rama mongo:latest