## DOCKER VOLUME
## Is like storage to save the data, the difference between volume and bind mounts is
## Bind Mounts, bind mounts data save in our host
## Volume, data manage by Docker

## See list of volume
sudo docker volume ls

## Name of volume is mongovolume
sudo docker volume create mongodata

# We can delete volume, but we must stop container then delete the container
sudo docker volume rm mongovolume