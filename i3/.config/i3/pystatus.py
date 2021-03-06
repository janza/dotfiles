from i3pystatus import Status
from i3pystatus.mail.maildir import MaildirMail
from i3pystatus.calendar.khal_calendar import Khal

status = Status(logfile='/home/josip/.i3pystatus.log',)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register(
    "clock",
    format="%-d.%-m. %H:%M", )

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
# status.register("load")
# status.register("uptime")

# Shows your CPU temperature, if you have a Intel CPU
# status.register("temp",
#                 format="{temp:.0f}°C",)

# The battery monitor has many formatting options, see README for details

# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/

# This would look like this:
# Discharging 6h:51m
# status.register(
#     "battery",
#     battery_ident='BAT1',
#     format="{status}{percentage:.0f}%",
#     alert=False,
#     full_color='#ffffff',
#     charging_color='#ffffff',
#     status={
#         "DIS": "<",
#         "CHR": ">",
#         "FULL": "",
#     }, )
status.register(
    "battery",
    battery_ident='BAT0',
    format="{status} {percentage:.0f}%",
    levels={
        0: '',
        15: '',
        40: '',
        60: '',
        90: '',
    },
    full_color='#ffffff',
    charging_color='#ffffff',
    alert=True,
    status={
        'CHR': '',
        'FULL': ''
    }
)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
# status.register("network",
#                 interface="eth0",
#                 format_down="",
#                 format_up="{v4cidr}",)

# Note: requires both netifaces and basiciw (for essid and quality)
status.register(
    "network",
    interface="wlp3s0",
    dynamic_color=False,
    color_up="#ffffff",
    color_down="#ffffff",
    format_down="off",
    format_up="", )

# Shows disk usage of /
# Format:
# 42/128G [86G]
# status.register(
#     "disk",
#     path="/",
#     format="Disk: {avail}G", )

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio", format=" {volume}", )

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
status.register(
    "mpd",
    format="{status} {title}",
    status={
        "pause": "",
        "play": "",
        "stop": "",
    }, )

for maildir in ['jjanzic', 'personal', 'insided']:
    status.register(
        "mail",
        on_leftclick='termite -e neomutt',
        backends=[
            MaildirMail(
                account=maildir,
                directory="/home/josip/.mail/{maildir}/inbox".format(
                    maildir=maildir))
        ],
        format='  ' + maildir[0] + " {current_unread}",
        format_plural='  ' + maildir[0] + " {current_unread}",
        color_unread="#00ff00")

# status.register("external_ip")
# status.register("bitcoin", currency='EUR')
# status.register("pomodoro",
#                 sound="~/dotfiles/message.wav")

# status.register(
#     "updates",
#     format="U: {count}",
#     format_no_updates="No updates",
#     color='#ffffff',
#     backends=[pacman.Pacman()])

status.register("calendar",
                # urgent_seconds=600000,
                dynamic_color=False,
                interval=1,
                format=" {title}",
                update_interval=60,
                skip_all_day=True,
                skip_regex=r'Standup|holidays',
                urgent_blink=False,
                on_leftclick='notify-send -i task-due Calendar "$(khal list --notstarted now)"',
                backend=Khal(config_path='/home/josip/.config/khal/config'))

# status.register('file',
#                 format=' {weather}',
#                 components={
#                     'weather': (str, 'tmp/forecast')
#                 })

status.run()
