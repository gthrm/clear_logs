#!/bin/bash

# Load environment variables from .env file in the home directory
set -a
if [ -f ~/".env" ]; then
    source ~/".env"
else
    echo "Error: .env file not found."
    exit 1
fi
set +a

# Variables from .env
# LOG_DIR, LOG_NAME, TELEGRAM_TOKEN, TELEGRAM_CHAT_ID

# Function to send Telegram notification
send_telegram_notification() {
    local message=$1
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage" -d chat_id=$TELEGRAM_CHAT_ID -d text="$message"
}

# Cleaning log files
if find "$LOG_DIR" -type f -name "$LOG_NAME" -exec truncate -s 0 {} \;; then
    # Get free disk space for /dev/vda1
    FREE_SPACE=$(df -h | grep '/dev/vda1' | awk '{print $4}')
    SUCCESS_MESSAGE="Log file cleanup completed. Free space on /dev/vda1: $FREE_SPACE"
    send_telegram_notification "$SUCCESS_MESSAGE"
else
    FAIL_MESSAGE="Error during log file cleanup"
    send_telegram_notification "$FAIL_MESSAGE"
fi
