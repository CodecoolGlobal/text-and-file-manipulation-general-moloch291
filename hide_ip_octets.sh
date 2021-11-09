#!/bin/bash

inform_user_start() {
    echo 'Hiding ips...'
}

inform_user_finish() {
    echo 'Ips hidden in '$1' lines! New log file: ips_hidden.log in pwd!'
}

hiding_ips() {
    LINE_COUNTER=0;
    while read line; do
        NEW_LINE=$(echo "$line" | sed 's/[^.]\+/XXX/1; s/[^.]\+/XXX/2; s/[^.]\+/XXX/3;')
        if [ $LINE_COUNTER -eq 0 ]; then
            echo "$NEW_LINE" > ips_hidden.log
        else
            echo "$NEW_LINE" >> ips_hidden.log
        fi
        LINE_COUNTER=$(( LINE_COUNTER + 1 ))
    done < access.log
    echo "$LINE_COUNTER"
}

main() {
    inform_user_start
    inform_user_finish $(hiding_ips)
}

main
