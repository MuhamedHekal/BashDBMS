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
        return 1;
    else
       return 0;
    fi ;
}

# Function to validate data before insertion
validate_data_type() {
    local input="$1"

    if [[ "$input" =~ ^[0-9]+$ ]]; then
        return 1 # 1 for integer data type 
  
    elif [[ "$input" =~ ^[a-zA-Z0-9]+$ ]]; then
    	
        return 2 # 2 for string data type
    else
       
        return 0 # 0 for non defiend data type 
    fi
}

# Function to print error messages
print_error() {
    local message=$1
    local red_color="\033[31m"
    local reset_color="\033[0m"
    echo -e "${red_color}[ERROR]: $message${reset_color}"
}

# Function to log messages (optional for debugging)
log_message() {
    local level="$1"      # Log level (INFO, ERROR, WARNING etc.)
    local message="$2"     # Message to log
    local color_reset="\033[0m"
    local color_red="\033[31m"    # For ERROR
    local color_yellow="\033[33m" # For WARNING
    local color_green="\033[32m"  # For INFO
    local logfile="databases/logfile.log"

    # Determine color for terminal output based on log level
    local color
    case "$level" in
        INFO) color="$color_green" ;;
        ERROR) color="$color_red" ;;
        WARNING) color="$color_yellow" ;;
        *) color="$color_reset" ;;
    esac
    # check if the log file exists or not and if nor create it 
    file_exists "$logfile"
    if [ $? -eq 0 ]; then 
        touch "$logfile"
    fi;

    # Print to terminal with color
    #echo -e "${color}[${level}]: $message${color_reset}"
    
    # Log to file without color
    echo "$(date +"%Y-%m-%d %H:%M:%S") [${level}]: $message" >> "$logfile"
    
}
