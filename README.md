# Submission Reminder App Environment Setup

This repository contains the `create_environment.sh` script, which sets up the directory structure and files required for the Submission Reminder App. This app is designed to alert students about upcoming assignment deadlines.

## What the Script Does

1. **Requests Your Name:**
   - The script prompts you to enter your name. This name is used to create a unique root directory named `submission_reminder_{yourName}`.

2. **Creates the Application Directory Structure:**
   - Inside the root directory, the script creates the following subdirectories:
     - **app**: Contains the application source code (e.g., `reminder.sh`).
     - **modules**: Contains helper functions (e.g., `functions.sh`).
     - **assets**: Contains data files (e.g., `submissions.txt`).
     - **config**: Contains configuration files (e.g., `config.env`).

3. **Creates and Populates Files:**
   - **Configuration File (`config.env`)**:  
     Stored in the `config` directory, this file sets key environment variables (such as `ASSIGNMENT` and `DAYS_REMAINING`).
   - **Submissions File (`submissions.txt`)**:  
     Stored in the `assets` directory, this CSV file holds student submission records.
   - **Reminder Script (`reminder.sh`)**:  
     Stored in the `app` directory, this script displays assignment details and calls a function to check for unsubmitted assignments.
   - **Functions Script (`functions.sh`)**:  
     Stored in the `modules` directory, this script defines the `check_submissions` function that processes the submissions file and prints reminders.
   - **Startup Script (`startup.sh`)**:  
     Located in the root of the environment, this script starts the application by invoking the reminder script.

4. **Sets Execute Permissions:**
   - The script makes `reminder.sh`, `functions.sh`, and `startup.sh` executable so that they can be run directly.

5. **Final Message:**
   - Once the environment is set up, you are informed of the successful setup and instructed to navigate to the created directory and run `./startup.sh` to launch the app.

## How to Run the Application

1. **Run the Environment Setup Script:**
   ```bash
   ./create_environment.sh
   ```
2. **Enter your name when prompted. This will create a directory named**
   ```bash
    cd submission_reminder_{yourName}
    ./startup.sh
   ```

