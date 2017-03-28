from i3pystatus import Status

status = Status()

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
                format="%a %-d %b %H:%M",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load")
status.register("uptime")

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
status.register("battery",
                battery_ident='BAT1',
                format="{status}{percentage:.2f}%",
                alert=False,
                status={
                    "DIS": "↓",
                    "CHR": "↑",
                    "FULL": "",
                },)
status.register("battery",
                battery_ident='BAT0',
                format="{status}{percentage:.2f}%",
                alert=False,
                status={
                    "DIS": "↓",
                    "CHR": "↑",
                    "FULL": "",
                },)
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
status.register("network",
                interface="wlan0",
                format_up="{essid} {v4}",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
                path="/",
                format="Free: {avail}G",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
                format="Vol: {volume}",)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
status.register("mpd",
                format="{status} {title}",
                status={
                    "pause": "Paused:",
                    "play": "Playing:",
                    "stop": "Stopped",
                },)

status.run()
