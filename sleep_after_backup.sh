#!/bin/bash
# Waits for Time Machine backup to finish or 2 hours to pass, then sleeps the system.
# macOS, obviously :)


TIME_MACHINE_RUNNING=$(tmutil status | grep "Running = 1")

TIMEOUT=7200 # Timeout in seconds (2 hours = 7200 seconds)
END_TIME=$((SECONDS+TIMEOUT))

while [ -n "$TIME_MACHINE_RUNNING" ] && [ $SECONDS -lt $END_TIME ]; do
  sleep 60
  TIME_MACHINE_RUNNING=$(tmutil status | grep "Running = 1")
done

osascript -e 'tell application "System Events" to sleep'
