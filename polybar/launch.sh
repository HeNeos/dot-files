#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

## Left bar
polybar log -c ~/.config/polybar/current.ini &
polybar secondary -c ~/.config/polybar/current.ini &
polybar third -c ~/.config/polybar/current.ini &

## Right bar
polybar top -c ~/.config/polybar/current.ini &
polybar primary -c ~/.config/polybar/current.ini &

## Center bar
polybar primary -c ~/.config/polybar/workspace.ini &

## Left bar
polybar log2 -c ~/.config/polybar/current.ini &
polybar secondary2 -c ~/.config/polybar/current.ini &
polybar third2 -c ~/.config/polybar/current.ini &

## Right bar
polybar top2 -c ~/.config/polybar/current.ini &
polybar primary2 -c ~/.config/polybar/current.ini &

## Center bar
polybar primary2 -c ~/.config/polybar/workspace.ini &
