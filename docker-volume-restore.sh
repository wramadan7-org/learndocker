## Step to restore data backup
## 1. Create new volume for location restore data backup
## 2. Create container with 2 mount, new volume to restore backup, and folder bind mount from our host (OS)
## 3. Do restore use container with step to extract backup file inside volume
## 4. File backup now restored in our volume
## 5. Delete container we use to restore
## 6. New volume where fill our backup file already use with new container

## Create new volume for location restore data backup
docker volume create mongorestore

## Mount 1 type bind from folder backup with destination backup
## Mount 2 source is mongorestore
## bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1" enter folder data and extrac use tar xvf and location file backup
docker container run --rm --name ubunturestore --mount "type=bind,source=/home/ramz/Documents/Programming/Docker/learndocker/backup,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"

## Test
sudo docker container create --name mongorestore -p 27020:27017 --mount "type=volume,source=mongorestore,destination=/data/db" -e MONGO_INITDB_ROOT_USERNAME=rama -e MONGO_INITDB_ROOT_PASSWORD=rama mongo:latest