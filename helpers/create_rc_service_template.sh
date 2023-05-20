cat << EOF > $1
#!/bin/sh
#
# rc.\$SERVICE_NAME - Start/Stop the \$SERVICE_NAME daemon
#

# Set the service name
SERVICE_NAME=""

# Set the path to the service binary
SERVICE_BIN=""

# Set the path to the service state
SERVICE_STATE=""

# Set the path to the service sock
SERVICE_SOCK=""

# Set the path to the service user
SERVICE_USER=""

# Start or stop the \$SERVICE_NAME daemon
case "\$1" in
    start)
        echo "Starting \$SERVICE_NAME..."
        su -c "\$SERVICE_BIN --state=\$SERVICE_STATE --socket=\$SERVICE_SOCK > /dev/null 2>&1 &" "\$SERVICE_USER"
        ;;
    stop)
	echo "Stopping \$SERVICE_NAME..."
	pkill -f "\$SERVICE_BIN"
        ;;
    restart)
        \$0 stop
        sleep 1
        \$0 start
        ;;
    *)
        echo "Usage: \$0 {start|stop|restart}"
        exit 1
        ;;
esac

exit 0
EOF
