#!/bin/sh

case "$1" in
    start)
        nohup /jffs/bin/kcptun/client_linux_arm7 -c /jffs/bin/kcptun/client.json > /dev/null 2>&1 &
        ;;
    stop)
        killall client_linux_arm7
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac