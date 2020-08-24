#!/bin/sh

pw useradd rtorrent -g 0 -m

mv /root/.rtorrent.rc /config/rtorrent.rc
ln -s /config/rtorrent.rc /home/rtorrent/.rtorrent.rc

npm install -g npm
npm install -g forever

# rTorrent startup script
chmod 555 /usr/local/etc/rc.d/rtorrent
sysrc -f /etc/rc.conf rtorrent_enable="YES"

# rTorrent Flood startup script
chmod 555 /usr/local/etc/rc.d/rtorrent_flood
sysrc -f /etc/rc.conf rtorrent_flood_enable="YES"

# Create flood folder
cd /home/rtorrent || exit 1

# Download sources
git clone https://github.com/jesec/flood.git
cd flood || exit 1
cp -rf /root/rtorrent/flood/* .

chown -R rtorrent /home/rtorrent

npm install
npm run build

# Start the service
service rtorrent start
service rtorrent_flood start

echo "When creating flood user, put socket directory as: /config/.session/rtorrent.sock" > /root/PLUGIN_INFO
