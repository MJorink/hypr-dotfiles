# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnosterzak"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# fastfetch. Will be disabled if above colorscript was chosen to install
fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias edit='micro'

alias config='cd $HOME/.config'
alias config-hypr='cd $HOME/.config/hypr'
alias wallpapers='cd $HOME/.config/wallpapers'
alias config-waybar='cd $HOME/.config/waybar'
alias config-fastfetch='cd $HOME/.config/fastfetch'
alias config-zsh='micro $HOME/.zshrc'
alias config-dots='micro $HOME/hypr-dotfiles-local/push-script.sh'


# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
