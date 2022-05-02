#!/bin/bash

#update and install basic tools
sudo apt-get update && sudo apt-get dist-upgrade -y
sudo apt-get install emacs tmux -y

#set shell aliases
echo 'alias ll="ls -al"' >> ~/.zshrc
echo 'alias ll="ls -al"' >> ~/.bashrc

echo 'alias ..="cd .."' >> ~/.zshrc
echo 'alias ..="cd .."' >> ~/.bashrc

echo 'bindkey "^P" history-beginning-search-backward' >> ~/.zshrc

#set emacs aliases
echo 'alias em="emacs -nw"' >> ~/.zshrc 
echo 'alias em="emacs -nw"' >> ~/.bashrc

#tmux config
echo "unbind C-b" > ~/.tmux.conf
echo "set-option -g prefix C-a" >> ~/.tmux.conf
echo "bind-key C-a send-prefix" >> ~/.tmux.conf
echo "set -g window-style 'fg=colour247,bg=colour236'" >> ~/.tmux.conf
echo "set -g window-active-style 'fg=default,bg=colour234'" >> ~/.tmux.conf

# intall additional tools from repo...
sudo apt-get install gobuster seclists bpython golang ffuf feroxbuster hakrawler -y gdb build-essentials

#setup golang
echo 'export GOROOT=/usr/lib/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go'  >> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH'  >> ~/.bashrc

echo 'export GOROOT=/usr/lib/go' >> ~/.zshrc
echo 'export GOPATH=$HOME/go'  >> ~/.zshrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH'  >> ~/.zshrc

#install tomnomnom tools
go install github.com/tomnomnom/assetfinder@latest
go install github.com/tomnomnom/httprobe@latest
go install github.com/tomnomnom/waybackurls@latest
go install github.com/tomnomnom/hacks/inscope@latest
go install github.com/tomnomnom/fff@latest
go install github.com/tomnomnom/gf@latest

cd ~/box-setup/
git clone https://github.com/tomnomnom/gf.git
mkdir ~/.gf
cp ~/box-setup/gf/examples/* ~/.gf

echo 'source ~/box-setup/gf/gf-completion.bash' >> ~/.bashrc
echo 'source ~/box-setup/gf/gf-completion.zsh' >> ~/.zshrc

# add link for wordlists
cd /usr/share/wordlists/
sudo ln -s /usr/share/seclists/ .
cd 

# remove unused components
sudo apt-get autoremove -y
sudo apt-get autoclean -y

#download privesc tools
mkdir ~/tools
cd ~/tools
wget  https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy32s

# radare-ghydra installation, use git version
cd ~/box-setup/
sudo apt-get remove radare2
git clone https://github.com/radareorg/radare2
radare2/sys/install.sh
r2pm update
r2pm -ci r2ghidra

#install pwntools

pip3 install pwntools

#install GEF
bash -c "$(curl -fsSL http://gef.blah.cat/sh)"

