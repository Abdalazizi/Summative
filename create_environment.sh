#!/bin/bash

#request users name

echo -n "Enter your name: "
read user_name

# Define the root directory name
root_dir="submission_reminder_${user_name}"

# Define subdirectories
mkdir -p "${root_dir}/app"
mkdir -p "${root_dir}/modules"
mkdir -p "${root_dir}/assets"
mkdir -p "${root_dir}/config"

echo "creating files"

# Create the necessary files
touch "${root_dir}/config/config.env"
touch "${root_dir}/assets/submissions.txt"
touch "${root_dir}/app/reminder.sh"
touch "${root_dir}/modules/functions.sh"
touch "${root_dir}/startup.sh"

echo "writing into a file config.env"

cat <<EOL > "${root_dir}/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

echo "writing in submission.txt"

cat <<EOL > "${root_dir}/assets/submissions.txt"
# Student submissions (Name, Assignment, Status)
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
EOL

echo "writing in remainder.sh"

cat <<EOL > "${root_dir}/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOL
chmod +x "${root_dir}/app/reminder.sh"

cat <<EOL > "${root_dir}/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOL
chmod +x "${root_dir}/modules/functions.sh"

cat <<EOL > "${root_dir}/startup.sh"
#!/bin/bash

echo "Starting the Submission Reminder App..."
bash "\$(dirname "\$0")/app/reminder.sh"
EOL
chmod +x "${root_dir}/startup.sh"

echo "Environment setup complete. Navigate to ${root_dir} and run ./startup.sh to start the app."


