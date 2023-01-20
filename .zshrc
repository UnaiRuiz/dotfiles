if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/home/$USER/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $HOME/.extra-dotfiles/.env
source $HOME/.extra-dotfiles/.alias
source $HOME/.extra-dotfiles/.functions

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

