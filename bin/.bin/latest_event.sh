#!/usr/bin/env bash

humanize() {
    python -c 'import datetime; import humanize; import sys; n = datetime.datetime.now(); d = datetime.datetime.strptime(sys.argv[1], "%d.%m.%Y. %H:%M"); print("urgent" if d - n < datetime.timedelta(0, 300, 0) else "not_urgent", humanize.naturaltime(d, n))' "$1" 2>/dev/null
}

while true; do
    event=$(khal list now 8h --notstarted --format '{start}|{title}' -df '' | grep -v 'Standup' | head -1)
    time=$(echo "$event" | cut -f1 -d'|')
    title=$(echo "$event" | cut -f2 -d'|')
    humanized=$(humanize "$time")

    jo text="$title $(echo "$humanized" | cut -f2- -d' ') " class="$(echo "$humanized" | cut -f1 -d' ')"

    echo -n "$blabla"

    sleep 30
done


