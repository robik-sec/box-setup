#!/bin/bash

#update and install basic tools
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt-get install emacs tmux -y

#set shell aliases
echo 'alias ll="ls -al"' >> ~/.zshrc
echo 'alias ll="ls -al"' >> ~/.bashrc

echo 'alias ..="cd .."' >> ~/.zshrc
echo 'alias ..="cd .."' >> ~/.bashrc
 
#set emacs aliases
echo 'alias em="emacs -nw"' >> ~/.zshrc 
echo 'alias em="emacs -nw"' >> ~/.bashrc

#tmux config
echo "unbind C-b" > .tmux.conf
echo "set-option -g prefix C-a" >> ~/.tmux.conf
echo "bind-key C-a send-prefix" >> ~/.tmux.conf

# intall additional tools from repo...
sudo apt-get install gobuster -y

# remove unused components
sudo apt-get autoremove -y
sudo apt-get autoclean -y

#download privesc tools
mkdir ~/tools
cd ~/tools
wget  https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32s

#downlolad seclists
cd /usr/share/wordlists/
sudo git clone https://github.com/danielmiessler/SecLists.git
chmod -R +rwx SecLists
cd

