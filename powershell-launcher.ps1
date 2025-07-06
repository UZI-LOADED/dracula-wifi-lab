
# Dracula Wi-Fi Lab PowerShell Launcher
Write-Host "🧛 Welcome to Dracula's Wi-Fi Lab (Windows Edition)" -ForegroundColor Magenta

$menu = @"
1. Start Monitor Mode (Linux only)
2. Capture Handshake (Linux only)
3. Deauth Attack (Linux only)
4. Crack Handshake with Hashcat (Windows compatible)
5. Open HTML Dashboard
"@

Write-Host $menu -ForegroundColor Cyan

$choice = Read-Host "Enter choice (1-5)"

switch ($choice) {
    4 {
        $capfile = Read-Host "Enter the .pcapng file path"
        $wordlist = Read-Host "Enter the path to your wordlist (e.g., rockyou.txt)"
        $out = "handshake.hc22000"
        & "hcxpcapngtool.exe" "-o" $out $capfile
        & "hashcat.exe" "-m" "22000" $out $wordlist
    }
    5 {
        Start-Process "dashboard.html"
    }
    Default {
        Write-Host "This option must be run on a Linux system (e.g., Kali)." -ForegroundColor Red
    }
}
