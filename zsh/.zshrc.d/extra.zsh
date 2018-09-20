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

  ssh_host=ssh.insided.com
  if [[ $AWS_DEFAULT_REGION = 'us-west-2' ]]; then
    ssh_host=ssh-us-west-2.insided.com
  fi

  ssh -tA "$ssh_host" -- ssh -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "$ip"
}

function prs () {
  repo="$(basename $PWD)"
  if [[ "$repo" == "" ]]; then
    echo "Could not determine current directory" >&2
    exit 1
  fi
  curl -s -u "$(pass show bitbucket_api)" "https://api.bitbucket.org/2.0/repositories/insided/$repo/pullrequests" | jq '.values[] | (.author.display_name |split(" ")[0][0:7?]) + "\t" + .title + "\t" + .links.html.href' -r | fzf --delimiter="\t" --with-nth 1,2 | awk -F'\t' '{print $(NF)}'
}

[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"

[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh


