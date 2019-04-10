#!/bin/sh
# This file create by Nathan McCorkle
# based on telegraf.sh included with Telegraf
# Put this file at:
# /usr/local/etc/rc.d/node_exporter.sh
# Use the pfSense shellcmd package to run the following at startup
# /usr/local/etc/rc.d/node_exporter.sh start

rc_start() {
        /usr/sbin/daemon -crP /var/run/node_exporter.pid /usr/local/bin/node_exporter  2> /var/log/node_exporter.log
}

rc_stop() {
        /bin/kill `/bin/cat /var/run/node_exporter.pid`
}

case $1 in
        start)
                rc_start
                ;;
        stop)
                rc_stop
                ;;
        restart)
                rc_stop
                rc_start
                ;;
esac
