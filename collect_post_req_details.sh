#!/bin/bash

start_collecting() {
    echo "Collecting POST requests..."
}

finish_collecting() {
    echo "$1 POST requests collected!"
}

read_file() {
    POST_REQ_COUNTER=0
    while read LINE; do
        TYPE=$(echo "$LINE" | awk '{print $6}')
        if [ "$TYPE" = '"POST' ]; then
            echo "$(echo "$LINE" | awk -F'"' '$0=$2')"
            POST_REQ_COUNTER=$(( POST_REQ_COUNTER + 1 ))
        fi
    done < access.log
    echo "$POST_REQ_COUNTER"
}

main() {
    start_collecting
    COUNT=$(read_file)
    finish_collecting "$COUNT"
}

main
