#!/bin/bash

extract_first_names() {
    echo "First names of each employee:\n"
    jq '.employees | .[].firstName' employees.json
}

extract_first_name_and_number() {
    # ToDo_: implement me!
    echo "\nNames and $1:"
    LENGTH=$(jq '.employees | length' employees.json)
    CURRENT_EMPLOYEE=0
    while [ $CURRENT_EMPLOYEE -le $(( LENGTH - 1 )) ]; do
        echo "\nEmployee "$(( $CURRENT_EMPLOYEE + 1 ))":\nName:"
        jq '.employees | .['$CURRENT_EMPLOYEE'].firstName' employees.json
        echo "$1:"
        jq '.employees | .['$CURRENT_EMPLOYEE'].phoneNumbers | '$3'' employees.json
        CURRENT_EMPLOYEE=$(( CURRENT_EMPLOYEE + 1 ))
    done
}

main() {
    if [ "$1" = "names" ]; then
        extract_first_names
        elif [ "$1" = "names-and-numbers" ]; then
        extract_first_name_and_number "phone numbers" "Phone" ".[].number"
        elif [ "$1" = "names-and-mobiles" ]; then
        extract_first_name_and_number "mobile" "Mobile" ".[1].number"
    else
        echo "Pleaes use the following options: names, names-and-numbers or names-and-mobiles"
    fi
}

main $@
