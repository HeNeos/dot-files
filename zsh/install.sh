#!/bin/bash

sudo apt update -y && sudo apt upgrade -y

# Install fonts
sudo apt-get install unzip -y
mkdir -p ~/.fonts
wget "https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip" -O "JetBrainsMono.zip"
unzip "JetBrainsMono.zip" -d "temp" && rm "JetBrainsMono.zip"
mv temp/fonts/ttf/*.ttf ~/.fonts/
rm -r temp

# Install zsh
sudo apt-get install zsh -y
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"