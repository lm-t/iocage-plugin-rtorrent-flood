# iocage-plugin-rtorrent-flood
Fork of the official rtorrent flood plugin with the following changes:
* Use maintained fork of flood
* Simplify mount points and ease of modification

## Install
iocage fetch -P rtorrent.json dhcp=on --branch master

## rTorrent
* Config directory: /config
* Incomplete download dir: /torrents/incomplete
* Complete download dir: /torrents/complete

Upon download completion files are moved from incomplete to complete dir

## Flood

Upon opening the web-ui, select the socket path as /config/session/rtorrent.sock
