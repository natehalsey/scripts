# !/bin/bash
ACCESS_POINT_DIR=/mnt

sudo mkdir $ACCESS_POINT_DIR

sudo sshfs root@data-access-point-ubuntu:/shared $ACCESS_POINT_DIR

sudo rsync -av --info=progress2 --exclude=".*" --exclude="os-images" --delete-excluded --force ~ $ACCESS_POINT_DIR

sudo fusermount -u $ACCESS_POINT_DIR
