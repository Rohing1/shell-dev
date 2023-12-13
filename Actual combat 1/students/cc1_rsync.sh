#!/bin/bash

Start() {
    /usr/bin/rsync --daemon
}

Stop() {
    pkill rsync
}

Restart() {
    Stop
    sleep 1
    Start
}
Kill_service(){
ps -ef | grep rsync | grep -v grep | wc -l
}

if [ $# -ne 1 ]; then
    echo "Usage: $0 {start|stop|restart}"
    exit 1
fi

case "$1" in
    start)
        Start
        sleep 2
	if [ "$(Kill_service)" -ge "1" ]; then
            echo "Rsync is running"
        else
            echo "Rsync is down"
        fi
        ;;
    stop)
        Stop
        sleep 1
	if [ "$(Kill_service)" -eq "0" ]; then
            echo "Rsync is stopped"
        else
            echo "Failed to stop Rsync"
        fi
        ;;
    restart)
        Restart
        sleep 1
	if [ "$(Kill_service)" -ge "1" ]; then
            echo "Rsync is restarted"
        else
            echo "Failed to restart Rsync"
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac

exit 0

