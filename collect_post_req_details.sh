#!/bin/bash

start_collecting() {
    echo "Collecting POST requests..."
}

finish_collecting() {
    echo "$1 POST requests collected from 'access.log'!"
}

get_post_reqs() {
    POST_REQ_COUNT=0
    grep POST access.log > post_reqs.log
    while read LINE; do
        echo "$(echo "$LINE" | awk -F'"' '$0=$2')"
        POST_REQ_COUNT=$(( POST_REQ_COUNT + 1 ))
    done < post_reqs.log
    rm post_reqs.log
    echo "$POST_REQ_COUNT"
}

main() {
    start_collecting
    POST_COUNT=$(get_post_reqs)
    finish_collecting "$POST_COUNT"
}

main
