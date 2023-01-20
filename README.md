# Unai Ruiz DotFiles
This project is organized in orphan branches that correspond to my different environments.

<details>
<summary>Table of Contents</summary>

- [Installation](#installation)
- [Linux/WSL](#linuxwsl)
</details>

## Installation
- **Linux/WSL**
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/UnaiRuiz/dotfiles/linux/wsl/.extra-dotfiles/install.sh)"
```

## Linux/WSL
### Packages overview
- [Zsh](https://www.zsh.org/): It is a shell designed for interactive use, although it is also a powerful scripting language
- [Oh my Zsh](https://github.com/ohmyzsh/ohmyzsh): It is an open source, community-driven framework for managing your zsh configuration
    - Theme:
        - [Powerlevel10k](https://github.com/romkatv/powerlevel10k): It is a theme for Zsh that emphasizes speed, flexibility and out-of-the-box experience
    - Plugins:      
        - [zsh-autosuggetions](https://github.com/zsh-users/zsh-autosuggestions): It suggests commands as you type based on history and completions
- [VIM Plug](https://github.com/junegunn/vim-plug): A minimalist Vim plugin manager
    - Plugins:      
        - [vim-surround](https://github.com/tpope/vim-surround): It is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs
        - [vim-airline](https://github.com/vim-airline/vim-airline): Lean & mean status/tabline for vim that's light as air
        - [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes): Themes for vim airline status bar
        - [nerdtree](https://github.com/preservim/nerdtree): It is a file system explorer for the Vim editor
        - [vim-gitgutter](https://github.com/airblade/vim-gitgutter): It is a plugin which shows a git diff in the sign column. It shows which lines have been added, modified, or removed
- [fzf](https://github.com/junegunn/fzf): It is a general-purpose command-line fuzzy finder
### Notes
- **Zsh** is set as the default shell
- A backup of `~/.zshrc` and `~/.vimrc` files is made with "{*filename*}.{*timestamp*}.bak" name structure
