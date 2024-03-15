#!/bin/bash

if [ -d "$QUEUE_PATH" ]; then
    if [ "$(ls -A $QUEUE_PATH)" ]; then
        mega-login $MEGA_USERNAME $MEGA_PASSWORD
        mega-put $QUEUE_PATH/* $REMOTE_PATH -c
    else
        echo "$QUEUE_PATH is empty."
    fi
else
    echo "$QUEUE_PATH is not a directory."
    exit 1
fi

exit 0
