# iocage-plugin-sonarr

## Final Steps

### Add mount points

```
iocage fstab -a sonarr3 /mnt/pool-1/apps/sonarr3 /config nullfs rw 0 0
iocage fstab -a sonarr /mnt/pool-1/multimedia/tvshows /mnt/ nullfs rw 0 0
```

iocage exec sonarr3 chown -R sonarr:sonarr /usr/local/share/NzbDrone /config
