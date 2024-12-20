cols_name=("id" "name" "age" "email")  # Example array
primary_key=""

echo "Available columns:"
for i in "${!cols_name[@]}"; do
    echo "$((i + 1)). ${cols_name[i]}"
done

# Prompt user to select a primary key
while true; do
    read -p "Enter the number of the column to use as the primary key (or press Enter to skip): " selected_index

    if [[ -z "$selected_index" ]]; then
        echo "No primary key selected."
        break
    elif [[ "$selected_index" =~ ^[0-9]+$ ]] && ((selected_index >= 1 && selected_index <= ${#cols_name[@]})); then
        primary_key="${cols_name[selected_index-1]}"
        echo "Primary key set to: $primary_key"
        break
    else
        echo "Invalid input. Please select a valid number from the list."
    fi
done