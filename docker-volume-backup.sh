## Step to backup volume
## 1. Stop the container we want to backup the volume
## 2. Create new container with 2 mount, volume we want to backup, and folder bind mount from our host (OS)
## 3. Do backup use container with archive fill of volume, and save in folder bind mount
## 4. Backup file now save in our host (OS)
## 5. Delete the container we use for do backup

## Stop container
sudo docker container stop mongovolume

## Get container in /data then we backup in /backup
docker container create --name nginxbackup --mount "type=bind,source=/home/ramz/Documents/Programming/Docker/learndocker/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" nginx:latest

## Lets in the container
docker container exec -i -t nginxbackup /bin/bash

## Check list of folder inside contaier
ls -l

## Archive folder inside exec container
## Save file in folder /backup, and folder we want to bacup is /data
tar cvf /backup/backup.tar.gz /data

## Stop container for backup
docker container stop nginxbackup

## Delete container for backup
docker container rm nginxbackup

## Start again mongovolume
docker container start mongovolume

## Simple backup container use docker run and use parameter --rm for delete after done execute
## First stop container we want to backup
docker container stop nameofcontainer

## Run docker
docker container run --rm --name ubuntubackup --mount "type=bind,source=/home/ramz/Documents/Programming/Docker/learndocker/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backupagain.tar.gz /data
