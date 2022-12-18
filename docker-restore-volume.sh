docker volume create mongorestore

docker container run --rm --name ubunturestore --mount "type=bind,source=/home/ramz/Documents/Programming/Docker/learndocker,destination=/backup" --mount "tyoe=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup/bakcup.tar.gz --strip 1"