# helm-charts
### Install helm charts pada windows
winget install Helm.Helm
helm version

###  Setelah Restart Terminal Masih command not found
Winget biasanya menyimpan alias helm.exe di dalam folder WinGet\Links. Jika terminal UCRT64 Anda belum membacanya secara otomatis, daftarkan secara manual ke .bashrc dengan perintah ini:
echo 'export PATH="$PATH:/c/Users/user/AppData/Local/Microsoft/WinGet/Links"' >> ~/.bashrc
source ~/.bashrc
helm version
helm list -A

