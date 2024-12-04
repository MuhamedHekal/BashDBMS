#!/bin/bash

# Table-related operations

# Function to create a new table
create_table() {
    # Placeholder for table creation logic
    echo "create table" ; 
   
}

# Function to list tables in database
list_table() {
    # Placeholder for data insertion logic
    echo "list_table" ; 
}

# Function to drop tables
drop_table() {
    # Placeholder for data insertion logic
    echo "drop_table" ; 
}

# Function to insert into table
insert_into_table() {
    # Placeholder for displaying table data
    echo "insert_into_table" ; 
}

# Function to select from
select_from_table() {
    # Placeholder for displaying table data
    echo "select_from_table" ; 
}

# Function to delete from a table
delete_from_table() {
    # Placeholder for deleting table files
    echo "delete_from_table" ; 
}

# Function to update data in a table
update_table() {
    # Placeholder for data update logic
    echo "update_table" ; 
}


# Function to display the main menu to the user
display_table_menu() {
    clear # Clear the screen before showing the menu
    echo "========================="
    echo "       TABLE MENU"
    echo "========================="
    echo "  1. Create Table"
    echo "  2. List Tables"
    echo "  3. Drop Table"
    echo "  4. Insert into Table"
    echo "  5. Select From Table"
    echo "  6. Delete From Table"
    echo "  7. Update Table"
    echo "  8. Exit"
    read -p "Enter choice (1-8): " choice 
    handle_user_input_table $choice
}
handle_user_input_table() {
    case $1 in
        1)
            create_table ;;
        2)
            list_table;;
        3)
            drop_table ;;
        4)
            insert_into_table;;
        5)
            select_from_table;;
        6)
            delete_from_table;;
        7)
            update_table;;
        8)
            cd ../..
            display_main_menu
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            display_table_menu
            ;;
    esac
}
