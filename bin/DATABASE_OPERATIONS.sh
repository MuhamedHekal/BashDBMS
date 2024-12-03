#!/bin/bash
source "$(dirname "$0")/lib.sh"

# Database-related operations

# Function to create a new database
create_database() {
   # get database name
    read -p "Enter database name to create: " dbname
   # validate database name to be string
    validate_data_type $dbname
    if [ $? == 2 ]; then
    #check if the database exists or not 
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
        read -p "press to continue"
        display_main_menu
    else 
        print_error "Database name must be string"
        log_message ERROR "Tried to enter an invalid name [ $dbname ] for database "
        create_database
    fi;
}

# Function to list databases
list_databases() {
   # list all folder in the databases folder 
   # check if the dir exists 
    directory_exists "databases/"
    if [ $? == 1 ] && [ "$(ls -A databases/)" ] ; then 
        echo -e "$(ls -l databases/ | grep ^d | awk '{print $9}')"
        log_message INFO "lists the databases exist"
    else
        Echo "There is no databases exists"
    fi;
   read -p "press to continue"
   display_main_menu

}

# Function to connect to database
connect_to_database() {
    echo "connect_to_database";
}

# Function to delete a table
drop_database() {
    echo "drop_database";
}
