#!/bin/bash

extract_first_names() {
    echo "First names of each employee:\n"
    jq '.employees | .[].firstName' employees.json
}

extract_first_names_with_phone_number() {
    echo "\nNames and numbers:"
    LENGTH=$(jq '.employees | length' employees.json)
    CURRENT_EMPLOYEE=0
    while [ $CURRENT_EMPLOYEE -le $(( LENGTH - 1 )) ]; do
        echo "\nEmployee number "$(($CURRENT_EMPLOYEE + 1))":\nName:"
        jq '.employees | .['$CURRENT_EMPLOYEE'].firstName' employees.json
        echo "Tel.:"
        jq '.employees | .['$CURRENT_EMPLOYEE'].phoneNumbers | .[].number' employees.json
        CURRENT_EMPLOYEE=$(( CURRENT_EMPLOYEE + 1 ))
    done
}

extract_first_name_and_cell_number() {
    # ToDo_: implement me!
    echo "This function will extract names and only mobile numbers from employees.json!"
}

main() {
    if [ "$1" = "names" ]; then
        extract_first_names
        elif [ "$1" = "names-and-numbers" ]; then
        extract_first_names_with_phone_number
        elif [ "$1" = "names-and-mobiles" ]; then
        extract_first_name_and_cell_number
    else
        echo "Pleaes use the following options: names, names-and-numbers or names-and-mobiles"
    fi
}

main $@
