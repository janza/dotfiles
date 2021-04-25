alias myip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com"
function ec2 () {
  local selected_instance
  local private_ip
  local public_ip
  selected_instance=$(aws ec2 describe-instances \
    | jq '.Reservations | [.[] | .Instances] | flatten | [.[] | {Tags: [.Tags[]? | select(.Key == "Environment" or .Key == "Name") | .Value ] | sort, PrivateIpAddress, PublicIpAddress, InstanceId, ImageId, InstanceType}] | .[]' -c \
    | sort -u \
    | fzf --sync --preview "echo {} | jq ." --preview-window 'up:40%')

  private_ip=$(echo $selected_instance | jq -r .PrivateIpAddress)
  ip=$(echo $selected_instance | jq -r .PublicIpAddress)

  if [[ "$ip" == "null" ]]; then
    ip=$private_ip
  fi

  if [[ $AWS_PROFILE == 'staging' ]]; then
    ssh_host=staging-euw1.ssh.insided.com
  elif [[ $AWS_PROFILE == 'production' ]]; then
    ssh_host=production-euw1.ssh.insided.com
  elif [[ $AWS_PROFILE = 'production-us' ]]; then
    ssh_host=production-usw2.ssh.insided.com
  elif [[ $AWS_PROFILE = 'management' ]]; then
    ssh_host=management-euw1.ssh.insided.com
  elif [[ $AWS_PROFILE = 'test' ]]; then
    ssh_host=test-euw1.ssh.insided.com
  else
    ssh_host=ssh.insided.com
  fi

  ssh -tA "jenkins@$ssh_host" -- ssh -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$ip"
}

# function getbuildlogs () {
#   aws codebuild list-builds --max-items 10  | jq -r '.ids[]' | fzf | while read buildid; do
#   aws logs get-log-events \
#     --log-group-name "/aws/codebuild/$(echo $buildid | cut -f 1 -d:)" \
#     --log-stream-name "$(echo $buildid | cut -f 2 -d:)"
# done | jq -r '.events[].message'
#   }

# function restartcodebuild () {
#   aws codebuild list-builds --max-items 10  | jq -r '.ids[]' | fzf | while read buildid; do
#   aws codebuild retry-build --id $buildid
#   aws logs get-log-events \
#     --log-group-name "/aws/codebuild/$(echo $buildid | cut -f 1 -d:)" \
#     --log-stream-name "$(echo $buildid | cut -f 2 -d:)"
# done | jq -r '.events[].message'
#   }

function getcloudformationlogs () {
  stack="$1"
  if [ "$stack" = "" ]; then
    stack="$(aws cloudformation list-stacks | jq -r '.StackSummaries[].StackName' | fzf)"
  fi
  aws cloudformation describe-stack-events --stack-name "$stack" --max-items 300 \
    | jq -r '.StackEvents[] | "\(.Timestamp) \(.LogicalResourceId) \(.ResourceType) \(.ResourceStatus) \(.ResourceStatusReason)"' \
    | tac \
    | highlight red FAILED | highlight green COMPLETE | highlight yellow IN_PROGRESS
}

alias apseu='AWS_PROFILE=staging'
alias appeu='AWS_PROFILE=production'
alias appus='AWS_PROFILE=production-us'

alias apstaging='AWS_PROFILE=staging'
alias approduction='AWS_PROFILE=production'
alias approduction-us='AWS_PROFILE=production-us'
alias apmanagement='AWS_PROFILE=management'

alias awsprod='AWS_PROFILE=production aws'
alias awsstag='AWS_PROFILE=staging aws'
alias awsprodus='AWS_PROFILE=production-us aws'

function ec2prod () {
  AWS_PROFILE=production ec2
}

function ec2produs () {
  AWS_PROFILE=production-us ec2
}

function ec2stag () {
  AWS_PROFILE=staging ec2
}

# [ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"

# [ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh


function highlight() {
	declare -A fg_color_map
	fg_color_map[black]=30
	fg_color_map[red]=31
	fg_color_map[green]=32
	fg_color_map[yellow]=33
	fg_color_map[blue]=34
	fg_color_map[magenta]=35
	fg_color_map[cyan]=36

	fg_c=$(echo -e "\e[1;${fg_color_map[$1]}m")
	c_rs=$'\e[0m'
	sed -u s"/$2/$fg_c\0$c_rs/g"
}

# source /usr/bin/aws_zsh_completer.sh

function bbkt() {
  echo https://bitbucket.org/$(git remote -v | head -1 | cut -f 1 -d' ' | cut -f 2 -d:)
}

function get_ticket_from_commit() {
  git log -n 1 --oneline | egrep -o '(PREN|CORE|USER|OPS|CUST)\-[0-9]+'
}

function ipr() {
  branch=$1
  if [ "$branch" = "" ]; then
    branch=$(get_ticket_from_commit)
  fi
  brwsr "$(bbkt)/pull-requests/new?source=$branch"
}

function ibr() {
  branch=$1
  if [ "$branch" = "" ]; then
    branch=$(get_ticket_from_commit)
  fi
  brwsr "$(bbkt)/branch/$branch"
}


fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line -w
  else
    zle push-input -w
    zle clear-screen -w
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
