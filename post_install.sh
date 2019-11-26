#!/bin/sh

fetch "https://services.sonarr.tv/v1/download/phantom-develop/latest?version=3&os=linux" -o /usr/local/share/tmp.tar.gz
tar -xzvf /usr/local/share/tmp.tar.gz -C /usr/local/share
rm /usr/local/share/tmp.tar.gz

pw user add sonarr -c sonarr -u 351 -d /nonexistent -s /usr/bin/nologin
pw groupadd -n media -g 1002
pw groupmod 1002 -m 351

chmod u+x /etc/rc.d/sonarr

sysrc -f /etc/rc.conf sonarr_enable="YES"

chown -R sonarr:sonarr /usr/local/share/Sonarr /config

#Set write permission to be able to write plugins update
chmod 755 /usr/local/share/Sonarr

# Start the services
service sonarr start

echo "Sonarr successfully installed" > /root/PLUGIN_INFO
