#!/bin/bash
source "$(dirname "$0")/lib.sh"
# Database-related operations

# Function to create a new database
create_database() {
   # get database name
    read -p "Enter database name to create: " dbname
   #check if the database exists or not 
    validate_data_type $dbname
    if [ $? == 2 ]; then
        directory_exists "databases/$dbname"
    # if exist print_error() to the user and insert into logs
        if [ $? == 1 ]; then
            print_error "Database Exists"
            log_message ERROR "Tried to create an existing database with name $dbname"
            create_database
    #if not exists create database foler
        else 
            mkdir -p "databases/$dbname";
            log_message INFO "Database $dbname Created";
        fi;
    else 
        print_error "Database name must be string"
        log_message ERROR "Tried to enter an invalid name [ $dbname ] for database "
        create_database
    fi;
}

# Function to list databases
list_databases() {
    echo "list_databases";
}

# Function to connect to database
connect_to_database() {
    echo "connect_to_database";
}

# Function to delete a table
drop_database() {
    echo "drop_database";
}
