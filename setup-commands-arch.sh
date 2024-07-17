
sudo pacman -S base-devel git ripgrep zsh exa vim neovim wl-clipboard bitwarden docker docker-compose

#   Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

#   Install Visual Studio, Google Chrome
yay -S visual-studio-code-bin google-chrome


#   Nerd Fonts
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh
cd ..
rm -rf nerd-fonts
# Open Font Manager and remove all Meslo fonts, then install P10K Meslo fonts



#
#   Install Oh-My-Zsh, Powerlevel10k, NvChad
#

#   Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh)
sudo usermod -s /bin/zsh $USER
reboot
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sed -i "s|plugins=(git)|plugins=(git copypath sudo zsh-autosuggestions zsh-syntax-highlighting)|g" ~/.zshrc

#   Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's|ZSH_THEME="robbyrussell"|ZSH_THEME="powerlevel10k/powerlevel10k"|g' ~/.zshrc

#   NvChad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim


#   Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install gcc


#   Docker
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
newgrp docker
docker ps       #test command
docker run hello-world

### Aliases ###
#   cd Aliases 
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

#   Main Aliases
alias la="exa --all --icons --grid --sort=type"
alias ld="exa -D --icons --grid"
alias ls="exa --icons --grid --sort=type"
alias cdl="cd $1 && la"
# alias uu="apt update %% apt upgrade"
alias vim="nvim"

#   Rickroll
alias rr="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"

#   Show available terminal colors
curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/e50a28ec54188d2413518788de6c6367ffcea4f7/print256colours.sh | bash








#   Oh-My-Posh w/ Nightlyte theme
brew install jandedobbeleer/oh-my-posh/oh-my-posh
mkdir github
cd github
git clone https://github.com/nightlyte-dev/dotfiles.git
cd ~
(echo; echo 'eval "$(oh-my-posh init zsh --config ~/github/dotfiles/oh-my-posh/themes/nightlyte-kush.omp.json)"') >> ~/.zshrc
exec zsh
chsh -s $(which zsh)
oh-my-posh font install
