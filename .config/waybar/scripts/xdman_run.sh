#!/bin/bash

# Find the PID of the xdman process
xdman_pid=$(ps aux | grep "[x]dm-app" | awk '{print $2}')

if [ -n "$xdman_pid" ]; then
    # If xdman is running, kill the process
    kill $xdman_pid
fi

# Launch xdman and redirect stdout and stderr to /dev/null
/opt/xdman/xdm-app >/dev/null 2>&1 &

# Wait for xdman to start
while ! ps aux | grep -q "[x]dm-app"; do
    sleep 1
done