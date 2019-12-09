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
  else
    ssh_host=ssh.insided.com
  fi

  ssh -tA "$ssh_host" -- ssh -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$ip"
}

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

[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh

source /usr/bin/aws_zsh_completer.sh
