#!/bin/bash
# Define the project root directory
PROJECT_ROOT="$(dirname "$(dirname "$0")")"

# Sourcing utility script
source "$PROJECT_ROOT/bin/lib.sh"

# check if the value exists in a list or not
check_if_exists() {
    local col_name="$1"
    local array=("${!2}")  # Create an array from the array reference passed

    for name in "${array[@]}"; do
        if [[ "$name" == "$col_name" ]]; then
            return 0  # Exists
        fi
    done
    return 1  # Does not exist
}



# Function to create a new table
create_table() {
   #Get the table name from the user
    read -p "please enter the table name : " tb_name
   #check if the table name exist in the databases
    file_exists $tb_name;
    if [ $? -eq 1 ]; then
        print_error "Table Exist"
        log_message  ERROR "Tried to create an existing table with name $tb_name" 
    else
        while true; do 
            # get the number of columns for the table 
            read -p "please enter the number of column : " col_num
            # check that the number is integer and positive
            validate_data_type $col_num
            if [ $? -eq 1 ]; then
                # loop for the number of column 
                # get columns names
                # check the column name is string and not exist in the table 
                # append in list 
                cols_name_list=()
                for ((i=1; i<=$col_num; i++)); do 
                    while true ; do
                        read -p "please enter column $i name : " col_name
                         if check_if_exists "$col_name" cols_name[@]; then
                            print_error "Duplicate Column Name";
                        else
                            
                            cols_name+=($col_name);
                            break;
                        fi
                    done

                done

                
                
                break;
            else
                print_error "Columns number must be integer positive";

            fi;

        done;
    fi;
   # if the table not exist

   
    # loop for the number of column 
        # get columns names
        # check the column name is string and not exist in the table 
        # append in list 
    # ask user to choose primary key can make table without primary key

    # loop on column to set data type



    # append in metadata file
    # print table created and add in logs


   # if the table exist
    #print error messagee that the table exist
   
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
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            display_table_menu
            ;;
    esac
}
