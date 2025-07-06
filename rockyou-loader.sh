#!/bin/bash
# Dracula's rockyou.txt Loader
echo "[*] Checking for rockyou.txt..."
if [ ! -f rockyou.txt ]; then
    echo "[*] Extracting rockyou.txt from system wordlists..."
    cp /usr/share/wordlists/rockyou.txt.gz .
    gunzip rockyou.txt.gz
    echo "[+] rockyou.txt extracted."
else
    echo "[+] rockyou.txt already exists."
fi
