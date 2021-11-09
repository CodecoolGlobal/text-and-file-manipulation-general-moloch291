#!/bin/bash

print_lines() {
    LINE_COUNTER=11
    head -n 20 access.log | tail -n 10 > wanted_lines.log
    while read LINE; do
        echo 'Line '$LINE_COUNTER': '$LINE''
        LINE_COUNTER=$(( LINE_COUNTER + 1 ))
    done < wanted_lines.log
    rm wanted_lines.log
}

main() {
    echo "Lines 11-20:"
    print_lines
}

main