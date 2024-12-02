#!/bin/bash

# Common utility functions

# Function to check if a file exists
file_exists() {
    if [ -e "$1" ]; then
        return 1
    else
        return 0
    fi ;
}

# Function to check if a directory exists
directory_exists() {
    if [ -d "$1" ]; then
        return 1
    else
       retuen 0
    fi ;
}

# Function to validate data before insertion
validate_data_type() {
    # Placeholder for data validation logic
    echo "validate_data_type" 
}

# Function to print error messages
print_error() {
    # Placeholder for error printing logic
    echo "print_error"
}

# Function to log messages (optional for debugging)
log_message() {
    # Placeholder for logging logic
    echo "log_message"
    
}


