#!/usr/bin/env python
import i3


def i3clients():
    """
    Returns a dictionary of key-value pairs of a window text and window id.
    Each window text is of format "[workspace] window title (instance number)"
    """
    for ws_num in range(1, 11):
        workspace = i3.filter(num=ws_num)
        if not workspace:
            continue
        workspace = workspace[0]
        windows = i3.filter(workspace, nodes=[])
        # Adds windows and their ids to the clients dictionary
        for window in windows:
            print('%s|[%s] %s' %
                  (
                      window['id'],
                      ws_num,
                      window['name'] or window['window_properties'].get(
                          'title') or window['window_properties'].get('class'),
                  )
                  )


i3clients()
