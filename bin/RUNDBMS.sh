#!/bin/bash
source "$(dirname "$0")/DATABASE_OPERATIONS.sh"

# Main script to initialize and run the DBMS

# Function to initialize the database environment
initialize_database() {

    # Create a directory to store the tables (if it doesn't exist)
    if [ ! -d "data/tables" ]; then
        mkdir -p databases/
        echo "Databases directory created."
    fi
}

# Function to display the main menu to the user
display_main_menu() {
    
    echo "  1. Create Database"
    echo "  2. List Databases"
    echo "  3. Connect To Database"
    echo "  4. Drop Database"
    echo "  5. Exit"
    read -p "Enter choice (1-5): " choice 
    handle_user_input $choice
}

# Function to handle user input and route to the appropriate operation
handle_user_input() {
    case $1 in
        1)
            ./bin/DATABASE_OPERATIONS.sh 
            create_database;
            
            ;;
        2)
            ./bin/DATABASE_OPERATIONS.sh 
            list_databases
            ;;
        3)
            ./bin/DATABASE_OPERATIONS.sh 
            connect_to_database
            ;;
        4)
            ./bin/DATABASE_OPERATIONS.sh 
            drop_database
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            display_main_menu
            ;;
    esac
}

# Entry point of the script
main() {
    initialize_database
    display_main_menu
}
main
