#!/usr/bin/env python
from subprocess import check_output


def get_pass(mail):
    return check_output("pass mail/" + mail, shell=True).splitlines()[0]
