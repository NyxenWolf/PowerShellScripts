# Install Chocolatey Service and bypass the Execution Policy
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Application installations after Service installation
choco install firefox -y
choco install googlechrome -y
choco install jre8 -y
choco install vcredist140 -y
choco install python3 -y
choco install notepadplusplus.install -y
choco install zoom -y
choco install vlc -y
choco install git.install -y
choco install vscode -y
choco install putty.install -y
choco install microsoft-windows-terminal -y
choco install spotify -y
choco install itunes -y
choco install wireshark -y
choco install powertoys -y
choco install advanced-ip-scanner -y
