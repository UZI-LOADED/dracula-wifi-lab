#!/bin/bash
echo "Usage: ./capture.sh <BSSID> <channel>"
airodump-ng --bssid $1 -c $2 -w handshake wlan0mon
