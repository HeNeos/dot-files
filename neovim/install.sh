#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

# Download Hack Nerd Fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip" -O "HackNerdFont.zip"
unzip "HackNerdFont.zip" -d "temp" && rm "HackNerdFont.zip"
mv temp/*.ttf ~/.fonts/
sudo rm -r temp

# Install ripgrep for Telescope
sudo apt-get install ripgrep -y

# Install neovim
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim -y

# Install NvChad
# Clone repository
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim