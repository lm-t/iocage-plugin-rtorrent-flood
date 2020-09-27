# iocage-plugin-rtorrent-flood
Fork of the official rtorrent flood plugin with the following changes:
* Use maintained fork of flood
* Simplify mount points and ease of modification
* Switch from forever to pm2 to daemonize flood
* OpenVPN included

## Install
iocage fetch -P rtorrent-flood-ovpn.json --branch master

## rTorrent
* Config directory: /config
* Incomplete download dir: /config/watch
* Complete download dir: /config/download

Upon download completion files are moved from watch to download dir

## Flood

Upon opening the web-ui, select the socket path as /config/session/rtorrent.sock
