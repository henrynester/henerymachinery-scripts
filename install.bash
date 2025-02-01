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
