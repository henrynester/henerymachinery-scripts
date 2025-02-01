#!/bin/bash
# programs installed

# regolith desktop (also installs standard gnome programs)
# get keys
wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null
# add to package repo list
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-3_2-debian-bookworm-amd64 bookworm main" | \
sudo tee /etc/apt/sources.list.d/regolith.list
# install
sudo apt update
sudo apt install regolith-desktop regolith-session-flashback regolith-look-lascaille
# install status bar indicators
sudo apt install i3xrocks-battery i3xrocks-cpu-usage i3xrocks-memory i3xrocks-net-traffic i3xrocks-temp i3xrocks-time
# select theme lascaille
sudo apt install regolith-look lascaille
regolith-look set lascaille
# restart to use

# virtualbox
sudo apt install virtualbox virtualbox-guest-utils 
# guest utils are for copy-paste and shared folders to work

# save power with powertop
sudo apt install powertop
#sudo powertop --auto-tune # <-- needs to run at startup
sudo systemctl enable powertop.service # ^ accomplished here

# firefox browser
sudo apt install firefox
# extensions used: 
# AdBlocker Ultimate, 
# AdBlocker for YT, 
# Google search engine with udm=14 preset (stops AI results)
# install chromium if some page doesnt work right

# VSCode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/keyrings/microsoft-archive-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
# extension list?

#Docker
# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# backups
sudo apt install borgbackup

# development
