#   Install essentials and add Microsoft to source list for VScode
sudo apt install build-essential procps curl wget file git gpg zsh vim
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update

sudo apt install code exa neofetch lolcat ranger 

#
#   Install Oh-My-Zsh, Homebrew, and Oh-My-Posh
#

#   Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
sed -i "s|plugins=(git)|plugins=(git copypath sudo zsh-autosuggestions zsh-syntax-highlighting)|g" ~/.zshrc

#   Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's|ZSH_THEME="robbyrussell"|ZSH_THEME="powerlevel10k/powerlevel10k"|g' .zshrc

#   Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install gcc

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


#   Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER


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