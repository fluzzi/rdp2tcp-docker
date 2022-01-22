#!/usr/bin/python3
import subprocess
import os

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

if not os.path.exists('log'):
        os.makedirs('log')

configdir = os.path.expanduser('~') + '/.config/rdp2tcp'
if not os.path.exists(configdir):
        os.makedirs(configdir)
os.popen('cp docker-compose.yml ' + configdir)

build = "sudo docker build --no-cache -t gederico/rdp2tcp:v1.0.0 ."
start = subprocess.call(build,shell=True)

