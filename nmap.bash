#!/bin/bash
# nmap is used to scan network for devices

sudo nmap -sL # list only
sudo nmap -sn # ping scan only (faster)
sudo nmap -A # get details for each IP scanned (OS, ports open, etc) (slow)

# pass in a list of IPs like 192.168.0-255.0-255 for example
# see current device's IP:
ip address

# Vienna home network cfg:
# coax ---> fios-router.home (control panel 192.168.1.1, pwd=pad83track)
#           |----> backup (NAS. ssh henry@backup.fios-router.home. 192.168.1.X, pwd="password")
#           |----> eero WiFi repeater system (192.168.1.X, but all devices connected to wifi are on subnets numbered by which repeater is used)
