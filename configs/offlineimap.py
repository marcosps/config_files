import os

def get_gpg(path):
    return os.popen('gpg -q -d ' + path).read().strip()
