# iocage-plugin-sonarr
## Post install steps
### Stop the services
```
iocage exec jail_name "service sonarr stop"
```
### Add mount points
```
iocage fstab -a jail_name /mnt/pool-1/apps/sonarr /config nullfs rw 0 0
iocage fstab -a jail_name /mnt/pool-1/multimedia/tvshows /media/ nullfs rw 0 0
```
### Update file ownerships
```
iocage exec jail_name "chown -R sonarr:sonarr /config"
```
### Start the services
```
iocage exec jail_name "service sonarr start"
```
