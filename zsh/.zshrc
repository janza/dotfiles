# ttyctl -f

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# make time work more like bash time
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'

export HASTE_SERVER=http://paste.jjanzic.com

# export QT_XFT=true
# export GDK_USE_XFT=1
export EDITOR=vim
export VISUAL=vim
export BROWSER=google-chrome-unstable
export GOPATH=~/code/go

export PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin/"
export PATH="$PATH:$HOME/.gem/ruby/2.2.0/bin/"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.npm/bin"
export PATH="$PATH:/opt/android-sdk/platform-tools"
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:./node_modules/.bin"

# export FZF_DEFAULT_COMMAND='ag -l --nocolor'
export FZF_DEFAULT_COMMAND='rg --files --follow'
export FZF_DEFAULT_OPTS='-1 -s --no-mouse --inline-info'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# export VIRTUAL_ENV_DISABLE_PROMPT=1
# export WORKON_HOME=/home/josip/.virtualenvs/
export TERM=xterm-256color
export NODE_REPL_HISTORY_FILE="$HOME/.node-repl-history"

alias gq="gcalcli quick --calendar 'Josip Janzic'"
alias rg="rg -S"

alias setkbd="xset r rate 180 65 && setxkbmap -layout hr -variant us -option caps:escape"
alias ipy=ipython

alias gdd="git diff --color | diff-so-fancy | less"

alias dps="docker ps"
alias dk="docker kill"
alias drm="docker rm -f"
alias dim="docker images"
alias o="xdg-open"
alias open="xdg-open"
alias y="yaourt"
alias git='hub'
alias mosh='mosh --bind-server=any'
alias ran='ranger'
alias ti='tig --all'

alias vimt='vipe < /dev/null'

alias scu='systemctl --user'
alias sc='sudo systemctl'

unsetopt CORRECT

alias gs="git status"
alias gaa="git add \$(git status --porcelain -s | awk '{print \$2}' | fzf)"
alias gdw="git diff --color-words --word-diff-regex='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+'"


function ec2 () {
  aws ec2 describe-instances \
    | jq '.Reservations | [.[] | .Instances] | flatten | [.[] | {Tags: [.Tags[]? | select(.Key == "Environment" or .Key == "Name") | .Value ] | sort, PublicDnsName, InstanceId, ImageId, InstanceType}] | .[]' -c \
    | sort -u \
    | fzf --preview "echo {} | jq ." --preview-window 'up:40%' \
    | jq -r .PublicDnsName
}

function search_and_replace () {
    if [[ -z "$1" ]] || [[ -z "$2" ]]; then
        return
    fi
    ag $1 -l | xargs sed -i "s/$1/$2/g"
}

function mch() {
    ssh -f -N -R 4040:localhost:$1 jjanzic.com
}

function gg() {
  git branch --no-color | cut -c 3- | fzf | xargs git checkout
}

# KEYBINDINGS
#

__fsel() {
  set -e
    command git rev-parse --show-cdup &> /dev/null || exit
    command ag -l $(git rev-parse --show-cdup) | fzf
}

__gdsel() {
    set -e
    set -o nonomatch
    command git rev-parse --show-cdup &> /dev/null || exit
    command git status -s --porcelain | awk '{print $2}' | fzf
}

file-widget() {
    LBUFFER="vim $(__fsel)\n"
    zle redisplay
}

changed-file-widget() {
    LBUFFER="vim $(__gdsel)"
    zle redisplay
}

cd_fzf_exec() {
  local dir=$(fzf_fasd)
  if [[ -n $dir ]]; then
    cd $dir
  fi
}

zle -N file-widget
zle -N changed-file-widget
# bindkey '^P' file-widget
bindkey -s '^P' "vim -c ':FZF!'\n"
bindkey -s '^O' "vim -c ':GitFiles!?'\n"
bindkey -s '^F' "vim -c ':Ag '\n"
# bindkey '^O' changed-file-widget
bindkey -s '^K' 'cd_fzf_exec\n'
bindkey -s '^G' 'git branch --no-color | cut -c 3- | fzf | xargs git checkout\n'

c() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  /bin/cp -f ~/.config/google-chrome-unstable/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
  from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs xdg-open
}

# Aliases
alias g='git'
compdef g=git
alias gst='git status'
compdef _git gst=git-status
alias gd='git diff'
compdef _git gd=git-diff
alias gdc='git diff --cached'
compdef _git gdc=git-diff
alias gdt='git diff-tree --no-commit-id --name-only -r'
compdef _git gdc=git diff-tree --no-commit-id --name-only -r
alias gl='git pull'
compdef _git gl=git-pull
alias gup='git pull --rebase'
compdef _git gup=git-fetch
alias gp='git push'
compdef _git gp=git-push
alias gd='git diff'
compdef _git gdv=git-diff
alias gdt='git difftool'
alias gc='git commit -v'
compdef _git gc=git-commit
alias gc!='git commit -v --amend'
compdef _git gc!=git-commit
alias gca='git commit -v -a'
compdef _git gc=git-commit
alias gca!='git commit -v -a --amend'
compdef _git gca!=git-commit
alias gcmsg='git commit -m'
compdef _git gcmsg=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcm='git checkout master'
alias grup='git remote update'
compdef _git grset=git-remote
alias grb='git rebase'
compdef _git grb=git-rebase
alias grbi='git rebase -i'
compdef _git grbi=git-rebase
alias grbc='git rebase --continue'
compdef _git grbc=git-rebase
alias grba='git rebase --abort'
compdef _git grba=git-rebase
alias gb='git branch'
compdef _git gb=git-branch
alias gbr='git branch --remote'
alias gcount='git shortlog -sn'
compdef gcount=git
alias gcl='git config --list'
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias gss='git status -s'
compdef _git gss=git-status
alias ga='git add'
compdef _git ga=git-add
alias gap='git add --patch'
alias gm='git merge'
compdef _git gm=git-merge


# Will cd into the top of the current repository
# or submodule.
alias gcd='cd $(git rev-parse --show-toplevel || echo ".")'

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
compdef ggpull=git
alias ggpur='git pull --rebase origin $(current_branch)'
compdef ggpur=git
alias ggpush='git push origin $(current_branch)'
compdef ggpush=git

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# CTRL-R - Paste the selected command from history into the command line
__fzfcmd() {
    [ ${FZF_TMUX:-1} -eq 1 ] && echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
}
fzf-history-widget() {
    local selected num
    setopt localoptions noglobsubst
    selected=( $(fc -l 1 | $(__fzfcmd) +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r ${=FZF_CTRL_R_OPTS} -q "${LBUFFER//$/\\$}") )
    if [ -n "$selected" ]; then
        num=$selected[1]
        if [ -n "$num" ]; then
            zle vi-fetch-history -n $num
        fi
    fi
    zle redisplay
}
zle     -N   fzf-history-widget
bindkey '^T' fzf-history-widget


cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey

[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

# export NVM_DIR="/home/josip/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autostart x
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx
fi

if [[ $1 == "fasd" ]]
then
  cd $(fzf_fasd)
  pwd
fi

export PATH="$HOME/.yarn/bin:$PATH"
