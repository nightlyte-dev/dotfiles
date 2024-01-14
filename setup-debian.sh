#! /bin/bash

#   Install essentials
sudo apt update && sudo apt upgrade -y
sudo apt install git build-essential procps curl wget ninja-build gettext cmake unzip neofetch zsh
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

#   Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i "s|plugins=(git)|plugins=(git copypath sudo zsh-autosuggestions zsh-syntax-highlighting)|g" ~/.zshrc

#   Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's|ZSH_THEME="robbyrussell"|ZSH_THEME="powerlevel10k/powerlevel10k"|g' ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh

#   Neovim w/ NVChad
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

sudo chsh -s $(which zsh)