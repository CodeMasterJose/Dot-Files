#!/usr/bin/env bash
#
## Terminate already running bar instances 
killall -q polybar
#Launch bar
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar example >>/tmp/polybar1.log 2>&1 &

echo "Bars launches..."
