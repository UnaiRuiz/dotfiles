#!/usr/bin/bash
#
# Shell script to install zsh, oh my zsh, powerlevel10k theme,
# zsh-autosuggestions plugin, VIM-Plug, fzf and
# to apply my custom configuration including my aliases, functions and env vars
#
# This script should be run via curl:
#   bash -c "$(curl -fsSL https://raw.githubusercontent.com/UnaiRuiz/dotfiles/linux/wsl/.extra-dotfiles/install.sh)"
# or via wget:
#   bash -c "$(wget -qO- https://raw.githubusercontent.com/UnaiRuiz/dotfiles/linux/wsl/.extra-dotfiles/install.sh)"
# or via fetch:
#   bash -c "$(fetch -o - https://raw.githubusercontent.com/UnaiRuiz/dotfiles/linux/wsl/.extra-dotfiles/install.sh)"

DOTFILES_REPO=https://github.com/UnaiRuiz/dotfiles.git
DOTFILES_BRANCH="${DOTFILES_BRANCH:=linux/wsl}"

# Install Dependencies
sudo apt update
if command -v git > /dev/null; then
  echo "git is already installed"
else
  echo "git is not installed, installing now..."
  # install git using apt package manager
  sudo apt install git -y
  echo "git has been successfully installed!"
fi
if command -v curl > /dev/null; then
  echo "curl is already installed"
else
  echo "curl is not installed, installing now..."
  sudo apt install curl -y
  echo "curl has been successfully installed!"
fi

# Install ZSH
if command -v zsh > /dev/null; then
  echo "zsh is already installed"
else
  echo "zsh is not installed, installing now..."
  if [ ! -f "$HOME/.zshrc" ]; then
    touch $HOME/.zshrc
  fi
  sudo apt install zsh -y
  echo "zsh has been successfully installed!"
fi

# Install Oh my ZSH
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "oh-my-zsh is already installed"
else
  echo "oh-my-zsh is not installed, installing now..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  echo "oh-my-zsh has been successfully installed!"
fi

# Install Powerlevel10k and zsh-autosuggestions plugin
if [ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  echo "powerlevel10k is already installed"
else
  echo "powerlevel10k is not installed, installing now..."
  git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "powerlevel10k and zsh-autosuggestions have been successfully installed!"
fi

# Install Vim-Plug
if [ -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "vim-plug is already installed"
else
  echo "vim-plug is not installed, installing now..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "vim-plug has been successfully installed!"
  echo "Please add 'call plug#begin()' and 'call plug#end()' in your .vimrc file"
fi

# Install fzf
if [ -d "$HOME/.fzf" ]; then
  echo "fzf is already installed"
else
  echo "fzf is not installed, installing now..."
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all
  echo "fzf has been successfully installed!"
fi

# Install lsd
if command -v lsd > /dev/null; then
  echo "lsd is already installed"
else
  echo "lsd is not installed, installing now..."
  wget https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb
  sudo dpkg -i lsd_0.23.1_amd64.deb
  rm lsd_0.23.1_amd64.deb
  echo "lsd has been successfully installed!"
fi

# Add my custom dotfiles
if [[ -d "$HOME/.dotfiles" ]]; then
  echo "dotfiles are already installed"
else
  # Backup existing .zshrc and .vimrc
  files_to_backup=($HOME/.zshrc $HOME/.vimrc)
  for file_to_backup in "${files_to_backup[@]}"; do
    if [ -f "$file_to_backup" ]; then
      timestamp=$(date +%Y%m%d_%H%M%S)
      backup_file="${file_to_backup}.${timestamp}.bak"
      mv "$file_to_backup" "$backup_file"
      echo "Successfully created backup of $file_to_backup at $backup_file"
    fi
  done
  git clone --bare $DOTFILES_REPO $HOME/.dotfiles
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout $DOTFILES_BRANCH
  echo "dotfiles are not installed, installing now..."
  echo "dotfiles have been successfully installed!"
fi

# Apply new configuration
vim +'PlugInstall --sync' +qa
sudo usermod --shell $(which zsh) $USER
zsh
source $HOME/.zshrc

