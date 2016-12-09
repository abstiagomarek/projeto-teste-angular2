#!/bin/bash
#
PROJECT_DIR=$(dirname "$(dirname "$(readlink -f "$0")")")

sudo docker rm -f angular2

sudo docker build -t angular2 --force-rm "$PROJECT_DIR/docker"
if [ $? -eq 0 ]; then
    echo "Running project over http://localhost:3000 in $PROJECT_DIR" && \
    sudo docker run -it -p 3000:3000 --name angular2 -d -v $PROJECT_DIR -w $PROJECT_DIR angular2 /bin/bash
fi
