#!/bin/sh

fetch "https://services.sonarr.tv/v1/download/phantom-develop/latest?version=3&os=linux" -o /usr/local/share/tmp.tar.gz 2>/dev/null
tar -xzvf /usr/local/share/tmp.tar.gz -C /usr/local/share 2>/dev/null
rm /usr/local/share/tmp.tar.gz 2>/dev/null

pw user add sonarr -c sonarr -u 351 -d /nonexistent -s /usr/bin/nologin 2>/dev/null
pw groupadd -n media -g 1002 2>/dev/null
pw groupmod 1002 -m 351 2>/dev/null

chmod u+x /etc/rc.d/sonarr 2>/dev/null

sysrc -f /etc/rc.conf sonarr_enable="YES" 2>/dev/null

#62991
chown -R sonarr:sonarr /usr/local/share/Sonarr /config 2>/dev/null

#we need write permission to be able to write plugins update. #53127
chmod 755 /usr/local/share/Sonarr 2>/dev/null

# Start the services
service sonarr start 2>/dev/null

echo "Sonarr successfully installed" > /root/PLUGIN_INFO
