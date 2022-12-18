## List network
docker network ls

## Create docker network
docker network create --driver bridge network_example

## Remove network
## Network can't delete if already use in container, we must delete container from network first
docker network rm nameofnetwordk