cd_fzf_exec() {
  local dir=$(fasd -l -d | grep -v '/\.' | fzf --reverse --height 20)
  if [[ -n $dir ]]; then
    cd $dir
  fi
}

find_in_vim() {
  vim -c ":Rg $*"
}

find_in_mutt() {
  notmuch-mutt -r search "$*" && mutt -f ~/.cache/notmuch/mutt/results
}

switch_branch() {
  git branch -a --no-merged origin/master | sed "s|remotes/origin/||" | cut -c2- | sort -u | fzf | xargs git checkout
}

bindkey -s '^P' "vim -c ':FZF!'\n"
bindkey -s '^O' "vim -c ':GitFiles!?'\n"
bindkey -s '^F' "find_in_vim "
bindkey -s '^S' "find_in_mutt "
bindkey -s '^K' "cd_fzf_exec\n"
bindkey -s '^G' "switch_branch\n"
