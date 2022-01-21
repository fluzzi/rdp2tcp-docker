#!/bin/bash

echo "yes" | rdesktop -r addin:rdp2tcp:/rdp2tcp/client/rdp2tcp -u $USERNAME -d $DOMAIN -p $PASSWORD $HOST
