cd_fzf_exec() {
  local dir=$(fasd -l -d | grep -v '/\.' | fzf --reverse --height 20)
  if [[ -n $dir ]]; then
    cd $dir
  fi
}

find_in_vim() {
  vim -c ":Rg $*"
}

fzf_find_file() {
  if [ "$PWD" = "$HOME" ]; then
    vim -c ":History<CR>:Gcd<CR>"
  else
    vim -c ':FZF!'
  fi
}

find_in_mutt() {
  notmuch-mutt -r search "$*" && mutt -f ~/.cache/notmuch/mutt/results
}

switch_branch() {
  git branch -a --no-merged origin/master | sed "s|remotes/origin/||" | cut -c2- | sort -u | fzf | xargs git checkout
}



bindkey -s '^P' "fzf_find_file\n"
bindkey -s '^O' "vim -c ':GitFiles!?'\n"
bindkey -s '^F' "find_in_vim "
bindkey -s '^S' "find_in_mutt "
bindkey -s '^K' "cd_fzf_exec\n"
bindkey -s '^G' "switch_branch\n"


fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  # [[ -o sharehistory ]] && fc -RI
  selected=( $(fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++' |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --no-sort --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" fzf) )
    # fzy -l 20 -p "") )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget
