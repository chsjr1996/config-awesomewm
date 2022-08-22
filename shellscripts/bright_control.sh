#! /bin/sh

function get_bright() {
    light -G
}

function set_bright() {
    light $@
}

case $1 in
    --get)
        get_bright
    ;;
    --set)
        set_bright $2 $3
    ;;
esac
