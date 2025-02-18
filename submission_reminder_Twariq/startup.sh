#!/bin/bash

# Resolve script directory and execute reminder
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "Starting the Submission Reminder App..."
bash "$SCRIPT_DIR/app/reminder.sh"
