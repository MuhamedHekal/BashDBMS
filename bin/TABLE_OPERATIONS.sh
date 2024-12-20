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
        create_table
    else
        # validate the table name can string only [ string mean just string or comination of string and number or numbers and string]
        validate_data_type $tb_name;
        if [ $? -eq 2 ]; then
        # if the table not exist
            while true; do 
                # get the number of columns for the table 
                read -p "please enter the number of columns : " col_num
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
                            check_if_exists "$col_name" cols_name_list[@]
                            if [ $? -eq "0" ]; then
                            print_error "Duplicate Column Name";
                            log_message  ERROR "Tried to create an existing column in table:  $tb_name"
                            else
                                cols_name_list+=($col_name);
                                break;
                            fi
                        done

                    done
                    #################################################
                    # ask user to choose primary key can make table without primary key
                    clear
                    for ((i=0; i<=$col_num; i++)); do 
                        if [ $i -eq $col_num ]; then 
                            Echo "$(( i + 1 )) ) None" 
                            break;
                        fi 
                        Echo "$(( i + 1 )) ) ${cols_name_list[$i]}"
                    done

                    while true; do
                        read -p  "Please Choose a column for priamry key: " pk_col
                        validate_data_type $pk_col
                        if [ $? -eq 1 ] && [ $pk_col -le $(( col_num + 1 )) ]; then 
                            if [ $pk_col -eq $(( col_num + 1 )) ]; then 
                                pk_col='None'
                            else
                                pk_col=${cols_name_list[$(( pk_col - 1 ))]}
                            fi 
                            break 
                        else        
                            print_error "Invalid choise";

                        fi

                    done;
                    #################################################
                    # loop on column to set data type
                    touch "$tb_name" # file for table data
                    touch ".$tb_name" #hidden file for meta data
                    for name in "${cols_name_list[@]}"; do
                        meta_data='' # this is the meta data line 
                        clear
                        echo "Pelase enter the data type for the column $name"
                        echo "1) Integer"
                        echo "2) String"
                        while true; do
                            read -p "What is Your choise : " col_dt
                            validate_data_type $col_dt
                            if [ $? -eq 1 ] && [ "$col_dt" -le "2" ]; then 
                                if [ "$col_dt" -eq "1" ]; then
                                    meta_data+="$name:Int:"
                                else  
                                    meta_data+="$name:String:"
                                fi;

                                if [ "$pk_col" == "$name" ]; then
                                    meta_data+="PK"
                                fi;
                                # append in metadata file
                                echo "$meta_data" >> ".$tb_name"
                                # print table created and add in logs
                                
                                break
                            else 
                                print_error "Invalid choise";
                            fi
                            
                        done;
                    done
                    break; # for break from the main loop
                else
                    print_error "Columns number must be integer positive";

                fi;
            done;
        else
            print_error "Invalid table name";
            log_message  ERROR "tring to create table with invalid name:  $tb_name " 
            create_table
        fi
    
    fi;
    echo "Table $tb_name Created"
    read -p "press enter to continue"
    log_message  INFO "table with table_name: $tb_name created" 
    display_table_menu
}

# Function to list tables in database
list_table() {
    if [ $(ls | wc -l) -eq "0" ]; then 
        echo "No tables found"
        log_message  INFO "List table in database $dbname" 
        read -p "press enter to continue"
        display_table_menu
    else
        clear
        echo "The tables found are: "
        ls
        log_message  INFO "List tables in database $dbname" 
        read -p "Press enter to contnue"
        display_table_menu
    fi
}

# Function to drop tables
drop_table() {
    clear
    read -p "please enter the table name: " drop_tbname
    file_exists $drop_tbname
    if [ $? -eq 1 ]; then
        rm $drop_tbname && rm .$drop_tbname
        echo "Table $drop_tbname has been dropped"
        log_message  INFO "Drop table with name : $drop_tbname" 
        read -p "Press enter to contnue"
        display_table_menu

    else
        echo "Table Not exist "
        log_message  ERROR "Try to drop un existing table with name : $drop_tbname" 
        read -p "Press enter to contnue"
        drop_table
    fi;
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
