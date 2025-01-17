#!/bin/sh

pw useradd rtorrent -g 0 -m

mkdir /config
chown rtorrent /config

mv /root/.rtorrent.rc /config/rtorrent.rc
ln -s /config/rtorrent.rc /home/rtorrent/.rtorrent.rc

npm install -g typescript ts-node pm2
pm2 update
pm2 install typescript

# rTorrent startup script
chmod 555 /usr/local/etc/rc.d/rtorrent
sysrc -f /etc/rc.conf rtorrent_enable="YES"

# rTorrent Flood startup script
chmod 555 /usr/local/etc/rc.d/rtorrent_flood
sysrc -f /etc/rc.conf rtorrent_flood_enable="YES"

# Create flood folder
cd /home/rtorrent || exit 1

# Download sources
git clone --branch v4.3.1 https://github.com/jesec/flood.git
cd flood || exit 1
cp -rf /root/rtorrent/flood/* .

chown -R rtorrent /home/rtorrent

npm install
npm run build


# Start the service
service rtorrent start
service rtorrent_flood start

npm install -g yargs

echo "When creating flood user, put socket directory as: /config/.session/rtorrent.sock" > /root/PLUGIN_INFO
