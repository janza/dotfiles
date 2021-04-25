source ~/.zshrc.d/zsh_config.zsh

# PS1='%(?.%(!.#.;).%F{6}%B;%b%f) '

export EDITOR=vim
export VISUAL=vim
export BROWSER=$HOME/.bin/brwsr
export GOPATH=~/code/go
export QT_QPA_PLATFORMTHEME=gtk2

export XDG_CURRENT_DESKTOP=sway

export TERM="xterm-256color"

if [[ "$IS_PATH_SET" = "" ]]; then
  export PATH="$HOME/.bin:$PATH"
  export PATH="$HOME/.npm/bin:$PATH"
  export PATH="./node_modules/.bin:$PATH"
  export PATH="$PATH:$GOPATH/bin"
  export PATH="$PATH:./vendors/bin"
  export IS_PATH_SET=1
fi

# colors
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='-s --no-mouse --inline-info'

alias kl="khal list"

alias rg="rg -S"
alias js="jira_sprint --no-summary"

alias l="exa --group-directories-first -1"
alias ll="exa --group-directories-first -l"
alias la="exa --group-directories-first -la"
alias ls="exa"
alias tree="exa --group-directories-first --tree"

alias te="todo edit"
# alias t="todo"
alias tn="todo new"

alias setkbd="xset r rate 180 65 && setxkbmap -layout hr -variant us -option caps:escape"
alias ipy=ipython
alias py=python
alias py2=python2

alias dps="docker ps"
alias dk="docker kill"
alias drm="docker rm -f"
alias dim="docker images"
alias o="xdg-open"
alias open="xdg-open"
alias y="yay"
alias git='hub'
alias mosh='mosh --bind-server=any'
alias bctl='bluetoothctl'

alias vimt='vipe < /dev/null'

alias scu='systemctl --user'
alias sc='sudo systemctl'

function search_and_replace () {
  if [[ -z "$2" ]] || [[ -z "$2" ]]; then
    echo "Usage: search_and_replace TERM_TO_REPLACE TERM_TO_REPLACE_WITH"
    return 1
  fi
  rg "$1" -l | xargs sd "$1" "$2"
}

# export MOZ_USE_XINPUT2=1 # firefox smooth scroll
