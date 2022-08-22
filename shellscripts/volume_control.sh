#! /bin/sh

function get_volume() {
    pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'
}

function set_volume() {
    pactl set-sink-volume @DEFAULT_SINK@ $@
}

function is_muted() {
    pactl get-sink-mute @DEFAULT_SINK@ | awk '/yes/ {print $2; exit}'
}

function toggle_mute() {
    pactl set-sink-mute @DEFAULT_SINK@ toggle
}

case $1 in
    --get)
        get_volume
    ;;
    --set)
        set_volume $2
    ;;
    --ismuted)
        is_muted
    ;;
    --togglemute)
        toggle_mute
    ;;
esac
