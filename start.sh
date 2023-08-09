#!/bin/sh

# Define the function to run your PHP script
run_php_script() {
    php /app/index.php
}

# Redirect stdout and stderr to Docker logs
exec >> /proc/1/fd/1 2>> /proc/1/fd/2

# Run the PHP script initially
run_php_script

# Loop to run the PHP script every 5 minutes
while :; do
    sleep 300  # Sleep for 5 minutes (300 seconds)
    run_php_script
done
