#!/usr/bin/env python
from subprocess import check_output


def get_pass(mail):
    return check_output("pass mail/" + mail, shell=True).splitlines()[0]


def gmail_trans_local(folder):
    folder = folder.lower()
    return {
        'inbox': 'INBOX',
        'archive': '[Gmail]/All Mail',
        'drafts': '[Gmail]/Drafts',
        'sent': '[Gmail]/Sent Mail'
    }.get(folder, folder)


def gmail_trans_remote(folder):
    folder = folder.lower()
    return {
        'inbox': 'inbox',
        '[gmail]/all mail': 'archive',
        '[gmail]/drafts': 'drafts',
        '[gmail]/sent mail': 'sent'
    }.get(folder.lower(), folder.lower())


def gmail_filter(folder):
    return folder in [
        'INBOX',
        '[Gmail]/All Mail',
        '[Gmail]/Drafts',
        '[Gmail]/Sent Mail'
    ]
