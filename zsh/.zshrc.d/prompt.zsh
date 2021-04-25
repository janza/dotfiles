function function precmd {

PROMPT='%(?.%(!.#.;).%F{6}%B;%b%f) '


    # branch=$(vcprompt -f "%b")
    # if [ "$branch" = "master" ]; then
    #     branch=""
    # fi
    # if [ ! $branch = "" ]; then
    #     branch="$branch "
    # fi
    # PROMPT="%F{251}%c%f%b %F{103}$branch%f%b"
    #     RPROMPT=''
}
