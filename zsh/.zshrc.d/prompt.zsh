function function precmd {
    PROMPT="%B%F{green}%c%f%b %B%F{cyan}$(vcprompt -f "[%b]")%f%b "
        RPROMPT=''
}
