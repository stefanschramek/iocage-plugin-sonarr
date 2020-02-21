# iocage-plugin-sonarr
## Post install steps
### Add permissions using FreeNAS 11.3 ACL manager
1. Click the three dots next to the media dataset; in this example, it is called "media"
2. Select "Edit ACL"
3. Click the "Add ACL Item" button. A new section will appear at the bottom of the list of existing ACL items.
4. Fill in the following:

![ACL Permissions](https://github.com/stefanschramek/iocage-plugin-sonarr/blob/master/acl-permissions.png)

Don't worry if it says "Could not find a username for this ID"
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
