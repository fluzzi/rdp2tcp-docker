#!/bin/bash

supervisorctl restart xvfb
supervisorctl restart rdesktop
supervisorctl restart rdp2tcp
