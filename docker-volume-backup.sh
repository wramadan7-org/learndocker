## Step to backup volume
## 1. Stop the container we want to backup the volume
## 2. Create new container with 2 mount, volume we want to backup, and folder bind mount from our host (OS)
## 3. Do backup use container with archive fill of volume, and save in folder bind mount
## 4. Backup file now save in our host (OS)
## 5. Delete the container we use for do backup

