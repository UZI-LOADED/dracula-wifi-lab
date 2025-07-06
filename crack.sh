#!/bin/bash
hcxpcapngtool -o handshake.hc22000 handshake*.cap
hashcat -m 22000 handshake.hc22000 rockyou.txt
