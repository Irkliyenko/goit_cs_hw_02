#!/bin/bash

# Array of website URLs to check
web_sites=(
    'https://google.com' 'https://facebook.com' 'https://twitter.com'
)

# Log file to save results
log_file='ex1.log'

# Clear existing content in the log file
> "$log_file"

# Loop through each website and check its status
for site in "${web_sites[@]}"; do
    # Check if the site is up by sending a GET request and looking for '200 OK' response
    if curl -s --head --request GET "$site" | grep '200' >/dev/null; then 
        # If the site is up, append a message to the log file
        echo "$site is up" >> "$log_file"
    else
        # If the site is down, append a message to the log file
        echo "$site is down" >> "$log_file"
    fi
done

# Inform the user about the location of the log file
echo "Results saved in $log_file"
