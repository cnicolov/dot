export ZSH_CACHE_DIR="$HOME/.zsh-cache"
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory sharehistory incappendhistory autocd extendedglob nomatch notify interactivecomments
unsetopt beep
bindkey -v
autoload -Uz compinit promptinit
compinit
promptinit

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "b4b4r07/enhancd", at:v1
zplug "stedolan/jq", from:gh-r, as:command, rename-to:jq
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "dracula/zsh", as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
fi

export ENHANCD_FILTER=fzf-tmux

# Then, source plugins and add commands to $PATH
zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zshaliases
source ~/.zshfunctions

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/christian/gcloud-sdk/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/christian/gcloud-sdk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/christian/gcloud-sdk/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/christian/gcloud-sdk/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/python@2/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/tools/k8s/bin"

alias -g kgpn='get pods -n'
alias -g dflt='default'

autoload -U +X bashcompinit && bashcompinit

alias glNoGraph='git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"

# fcoc_preview - checkout git commit with previews
fcoc_preview() {
  local commit
  commit=$( glNoGraph |
    fzf --no-sort --reverse --tiebreak=index --no-multi \
        --ansi --preview="$_viewGitLogLine" ) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fshow_preview - git commit browser with previews
fshow_preview() {
    glNoGraph |
        fzf --no-sort --reverse --tiebreak=index --no-multi \
            --ansi --preview="$_viewGitLogLine" \
                --header "enter to view, alt-y to copy hash" \
                --bind "enter:execute:$_viewGitLogLine   | less -R" \
                --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"
export EDITOR=nvim
export VISUAL=$EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey -a '^x^e' edit-command-line
bindkey '^x^o' autosuggest-accept
bindkey -a '^x^o' autosuggest-accept

complete -o nospace -C /usr/local/Cellar/terraform/0.11.8/bin/terraform terraform
export FZF_DEFAULT_COMMAND='ag -l -g ""'
export FZF_DEFAULT_OPTS='-x -m --sort 10000'

export LANG=en_US.UTF-8
eval $(keychain --agents ssh,gpg -q --eval)

source ~/.zshrc.local

alias vi=nvim

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
PATH="/Users/christian/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/christian/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/christian/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/christian/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/christian/perl5"; export PERL_MM_OPT;
export PATH="/usr/local/opt/openssl/bin:$PATH"
