#!/usr/bin/env python
import asyncio
import json
import sys

from mpd.asyncio import MPDClient


async def getStatus(client):
    try:
        status = await client.status()
        return status
    except Exception:
        return {}
    else:
        return status


def p(text, c=''):
    sys.stdout.write('{}\n'.format(json.dumps({
            "text": text,
            "tooltip": "",
            "class": c
        })))
    sys.stdout.flush()


async def get_state(client):
    status = await getStatus(client)
    if status['state'] == 'play':
        song = await client.currentsong()
        p('{artist}: {title}'.format(**song))
        return

    p('Not playing', 'notplaying')


async def main():
    # print("Create MPD client")
    client = MPDClient()
    await client.connect('localhost', 6600)

    await get_state(client)
    async for _ in client.idle():
        await get_state(client)

if __name__ == '__main__':
    asyncio.get_event_loop().run_until_complete(main())
