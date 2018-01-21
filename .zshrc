HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory sharehistory incappendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
autoload -Uz compinit promptinit
compinit
promptinit

source ~/.zplug/init.zsh

zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*darwin*amd64*"
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "b4b4r07/enhancd", at:v1
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "dracula/zsh", as:theme
zplug "djui/alias-tips"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

if zplug check b4b4r07/enhancd; then
    # setting if enhancd is available
    export ENHANCD_FILTER=fzf-tmux
fi

# Then, source plugins and add commands to $PATH
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ls='ls -G'
alias ll='ls -lG'
alias vim='nvim'
