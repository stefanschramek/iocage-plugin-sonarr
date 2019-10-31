# iocage-plugin-sonarr
## Final Steps
### Stop the services
```
iocage exec sonarr3 "service sonarr stop"
```
### Add mount points
```
iocage fstab -a sonarr3 /mnt/pool-1/apps/sonarr3 /config nullfs rw 0 0
iocage fstab -a sonarr3 /mnt/pool-1/multimedia/tvshows /media/ nullfs rw 0 0
```
### Update file ownerships
```
iocage exec sonarr3 "chown -R sonarr:sonarr /config"
```
### Start the services
```
iocage exec sonarr3 "service sonarr start"
```
