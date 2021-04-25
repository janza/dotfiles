alias gs="git status"
alias gaa="git add \$(git status --porcelain -s | awk '{print \$2}' | fzf)"
alias gdw="git diff --color-words --word-diff-regex='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+'"


pick_issue() {
  jira_sprint list | fzf --no-sort --ansi --with-nth 1 -d '\t' --reverse --preview "echo {} | tr '\t' '\n' | tr -d '"'"'"' | tail -n +2 | bat --color always -l md -p" --preview-window 'up:30%:wrap' | cut -d' ' -f 1
}

pick_commit() {
  git log $1 --color=always --graph \
    --pretty=format:'%Cred%h%Creset %C(bold blue)%an%Creset%C(yellow)%d%Creset %s %Cgreen(%cr)' --abbrev-commit -n 1000 $2 \
    | fzf --ansi +s --height 40 --reverse \
    --preview 'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show $1 | delta | less -R; }; f {}' \
    --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort" \
    | grep -o '[a-f0-9]\{7\}' | head -1
}

tig() {
  git log $1 --color=always --graph \
    --pretty=format:'%Cred%h%Creset %C(bold blue)%an%Creset%C(yellow)%d%Creset %s %Cgreen(%cr)' --abbrev-commit -n 1000 $2 \
    | fzf --ansi +s --height 40 --reverse \
    --preview 'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show $1 | delta | less -R; }; f {}' \
    --bind "tab:accept,j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
      (grep -o '[a-f0-9]\{7\}' | head -1 |
      xargs -I % sh -c 'git show --color=always % | delta -s --paging always') << 'FZF-EOF'
      {}
	FZF-EOF" # | egrep -o ' [a-z0-9]{10} ' | cut -f 2 -d' '
}

gpr() {
  if [ $commit = "" ]; then
    exit 1
  fi

  issue="$(pick_issue)"
  if [ $issue = "" ]; then
    exit 1
  fi

  git push $1 origin "${commit}:refs/heads/${issue}"
}

# Aliases
alias g='git'
compdef g=git

alias gf='git fetch'
compdef _git gf=git-fetch
alias gd='git diff'
compdef _git gd=git-diff
alias gdc='git diff --cached'
compdef _git gdc=git-diff
alias gl='git pull'
compdef _git gl=git-pull
alias gp='git push'
compdef _git gp=git-push
alias gd='git diff'
compdef _git gdv=git-diff
alias gc='git commit -v'
compdef _git gc=git-commit
alias gca='git commit -v --amend'
compdef _git gc!=git-commit
alias gcah='git commit -v --amend -CHEAD'
compdef _git gc!=git-commit
alias gco='git checkout'
compdef _git gco=git-checkout
alias gcm='git checkout master'
alias grb='git rebase'
compdef _git grb=git-rebase
alias grbi='git rebase -i'
compdef _git grbi=git-rebase
alias grbc='git rebase --continue'
compdef _git grbc=git-rebase
alias grba='git rebase --abort'
compdef _git grba=git-rebase
alias grbiom='git rebase -i origin/master'
compdef _git grbiom=git-rebase
alias gb='git branch'
compdef _git gb=git-branch
alias gcount='git shortlog -sn'
compdef gcount=git
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias gss='git status -s'
compdef _git gss=git-status
alias ga='git add'
compdef _git ga=git-add
alias gm='git merge'
compdef _git gm=git-merge
alias grhom='git reset --hard origin/master'
alias grh='git reset --hard'

# Will cd into the top of the current repository
# or submodule.
alias gcd='cd $(git rev-parse --show-toplevel || echo ".")'

function gpo() {
  force=''
  if [ "$1" = '-f' ]; then
    force='-f'
    shift
  fi

  if [ "$1" = "" ]; then
    echo Needs a commmit
    return 1
  fi
  branch=$2
  if [ "$branch" = "" ]; then
    branch=$(git log "$1" -n 1 --oneline | egrep -o '(PREN|TECH|CORE|USER|OPS|CUST)\-[0-9X]+')
  fi
  echo git push origin "$1":refs/heads/"$branch"
  git push $force origin "$1":refs/heads/"$branch"
}

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
