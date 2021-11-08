LOG_CONTENT=$(cat access.log);
COUNTER=0
while read line; do
    COUNTER=$(( COUNTER+1 ))
    echo "$line" | sed 's/[^.]\+/XXX/1; s/[^.]\+/XXX/2; s/[^.]\+/XXX/3;' >> copy.log
done < access.log