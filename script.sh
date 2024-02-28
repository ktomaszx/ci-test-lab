#!/bin/bash

# Define log file path
LOG_FILE="mylog.txt"

# Function to log messages
log_message() {
    local message="$1"
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $message"
}

# Example usage
log_message "Starting the script..."

log_message "Encountered an error."
exit 1  # Exiting with non-zero status

log_message "Script execution completed."