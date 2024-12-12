#!/bin/bash
# Sourcing utility and table operations scripts
source "$(dirname "$0")/lib.sh"
source "$(dirname "$0")/TABLE_OPERATIONS.sh"

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
            echo "Database $dbname Created"
            log_message INFO "Database $dbname Created" ;
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
        log_message INFO "lists the exist databases " 
    else
        Echo "There is no databases exists"
    fi;
   read -p "press to continue"
   display_main_menu

}

# Function to connect to database
connect_to_database() {
    read -p "Please enter the database name: " dbname
    validate_data_type $dbname
    if [ $? == 2 ]; then
        directory_exists "databases/$dbname"
        if [ $? == 1 ]; then
            log_message INFO "connect to $dbname" 
            cd databases/$dbname
            display_table_menu
        else
            print_error "Database not exist"
            log_message ERROR "try to connect to not existing database $dbname" 
            connect_to_database
        fi;
    else
        print_error "Database name must be string"
        log_message ERROR "Tried to enter an invalid name [ $dbname ] for database " 
        connect_to_database
    fi;
   
}

# Function to delete a table
drop_database() {
    read -p "Please enter the database name: " dbname
    validate_data_type $dbname
    if [ $? == 2 ]; then
        directory_exists "databases/$dbname"
        if [ $? == 1 ]; then
            rm -r databases/$dbname
            log_message INFO "Drop Database $dbname" 
            Echo "Database Droped"
            read -p "press enter to continue"
            display_main_menu
        else
            print_error "Database not exist"
            log_message ERROR "try to Drop not existing database $dbname" 
            drop_database
        fi;
    else
        print_error "Database name must be string"
        log_message ERROR "Tried to enter an invalid name [ $dbname ] for database " 
        drop_database
    fi;
}


