#!/bin/bash

# Install zsh theme
mkdir -p ~/.oh-my-zsh/themes
## Install requirements for the zsh theme
sudo apt-get install bc -y
git clone https://github.com/ChesterYue/ohmyzsh-theme-passion ~/ohmyzsh-theme-passion/
cp ~/ohmyzsh-theme-passion/passion.zsh-theme ~/.oh-my-zsh/themes/passion.zsh-theme
sudo rm -r ~/ohmyzsh-theme-passion
## Copy zshrc to home directory
cp ".zshrc" "${HOME}/.zshrc"

# Install plugins
## Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
## Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting