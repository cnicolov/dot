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
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

export PATH=$HOME/.bin:$PATH
export AWS_PROFILE=personal
export AWS_DEFAULT_REGION=us-east-1

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

ssh_to_personal_instance() {
  export AWS_PROFILE=personal AWS_DEFAULT_REGION=eu-west-1
  # Returns the first instance created in my personal account
  instance_details=$(
    aws ec2 describe-instances \
      --query 'Reservations[0].Instances[0].{InstanceId: InstanceId, PrivateIP: PrivateIpAddress}' \
      --output text
  )

  instance_id="$(echo $instance_details | awk '{print $1}')"
  instance_ip="$(echo $instance_details | awk '{print $2}')"
  aws ec2 start-instances --instance-ids $instance_id
  set -x
  while true; do nc -z -w 5 -v $instance_ip 22 && break || sleep 2; done
  ssh cnicolov@$instance_ip
  # Stop the instance when I'm ready
  aws ec2 stop-instances --instance-ids $instance_id
}

export CDPATH=$CDPATH:$GOPATH/src:$GOPATH/src/github.com:$GOPATH/src/golang.org
fpath=(/usr/local/share/zsh-completions $fpath)
