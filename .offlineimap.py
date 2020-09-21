#!/usr/bin/env python2
from subprocess import Popen, PIPE

def get_password(host):
    (out, _) = Popen(["secret-tool", "lookup", "host", host], stdout=PIPE).communicate()
    return out.decode().strip()
