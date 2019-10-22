#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
if [ "$1" == "suspend" ]; then
   sudo sleep 1h && systemctl suspend -i
elif [ "$1" == "hibernate" ]; then
   sudo sleep 1h && systemctl hibernate -i
else
    echo "Function call should look like ./1.sh [suspend/hibernate]"
    exit 1
fi

#systemctl [OPTIONS...] {COMMAND} ...
#Query or send control commands to the systemd manager.
#suspend                             Suspend the system
#hibernate                           Hibernate the system
# -i --ignore-inhibitors             When shutting down or sleeping, ignore inhibitors

#Usage: sleep NUMBER[SUFFIX]...


#The $EUID environment variable holds the current user's UID. Root's UID is 0. 
