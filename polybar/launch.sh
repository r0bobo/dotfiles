#!/usr/bin/env sh

# Terminate already running bar instance
killall -q polybar

# Wait until the process have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch example
polybar top --reload &
polybar bottom --reload &

echo "Polybar started..."
