ACCESS_POINT_DIR=/mnt
sudo sshfs root@data-access-point-ubuntu:/shared $ACCESS_POINT_DIR
sudo rsync -av --info=progress2 $ACCESS_POINT_DIR .
sudo fusermount -u $ACCESS_POINT_DIR
