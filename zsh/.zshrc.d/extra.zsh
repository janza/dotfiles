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

  ssh -tA ssh.insided.com -- ssh -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$ip"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
