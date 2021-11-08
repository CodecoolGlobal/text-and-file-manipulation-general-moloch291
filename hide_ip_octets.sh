#!/bin/bash

inform_user_start() {
    echo 'Hiding ips...'
}

inform_user_finish() {
    echo 'Ips hidden! Check: copy.log in pwd!'
}

hiding_ips() {
    LOG_CONTENT=$(cat access.log);
    COUNTER=0;
    while read line; do
        NEW_LINE=$(echo "$line" | sed 's/[^.]\+/XXX/1; s/[^.]\+/XXX/2; s/[^.]\+/XXX/3;')
        if [ $COUNTER -eq 0 ]; then
            echo "$NEW_LINE" > ips_hidden.log
        else
            echo "$NEW_LINE" >> ips_hidden.log
        fi
        COUNTER=$(( COUNTER+1 ))
    done < access.log
}

main() {
    inform_user_start
    hiding_ips
    inform_user_finish
}

main
