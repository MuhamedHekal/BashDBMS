
# DBMS - Mini Database Management System

This project is a simple Database Management System (DBMS) implemented using Bash scripts. It allows users to create, manage, and perform operations on databases and tables stored in the filesystem. The system includes functionalities to create databases, manage tables, insert data, and perform basic table operations.

## Project Structure

```
├── README.md                # Project documentation
├── bin/                     # Scripts directory
│   ├── RUNDBMS.sh           # Main script (entry point)
│   ├── TABLE_OPERATIONS.sh  # Table-related functions
│   ├── DATABASE_OPERATIONS.sh # Database-related functions
│   └── lib.sh               # Common utility functions
├── databases/               # Data storage directory
│   └── DBs_names/           # Directory for databases
│       └── tables_name/     # Directory for tables within a database
│           └── tables_data/ # File(s) storing table data
│           └── .logfile.log # Log file for table in this database [hidden file]
│   └── .logfile.log         # File that contains all logs made in this database [hidden file]
└── docs/                    # Documentation files
```

## Features

- **Database Operations**:
  - Create a new database.
  - List all existing databases.
  - Connect to a specific database.
  - Drop (delete) a database.

- **Table Operations**:
  - Create a new table with specified columns and data types.
  - List all tables in a database.
  - Drop (delete) a table.
  - Insert data into a table.
  - Select data from a table (with options to filter by column or row).
  - Delete data from a table.
  - Update data in a table.

- **Data Validation**:
  - Validate data types (integer, string) before insertion.
  - Ensure primary key uniqueness.

- **Logging**:
  - Log all operations (INFO, ERROR, WARNING) for debugging and tracking purposes.

## How to Use

### Clone the Repository

```bash
git clone https://github.com/MuhamedHekal/DBMS.git
cd DBMS
```

### Run the DBMS

Execute the main script to start the DBMS:

```bash
./bin/RUNDBMS.sh
```

### Main Menu

The main menu will provide options to create, list, connect to, or drop databases.  
Once connected to a database, you can perform table operations such as creating tables, inserting data, and querying data.

#### Database Operations

- **Create Database**: Enter a name for the new database.
- **List Databases**: View all existing databases.
- **Connect to Database**: Enter the name of the database you want to connect to.
- **Drop Database**: Delete an existing database.

#### Table Operations

- **Create Table**: Define the table name, number of columns, column names, data types, and primary key.
- **List Tables**: View all tables in the current database.
- **Drop Table**: Delete a table from the database.
- **Insert Data**: Add new rows to a table.
- **Select Data**: Query data from a table with options to filter by column or row.
- **Delete Data**: Remove rows from a table.
- **Update Data**: Modify existing rows in a table.

## Logging

All operations are logged in a `.logfile.log` file within each database directory. This log file records the date, time, and type of operation (INFO, ERROR, WARNING) for debugging and tracking purposes.

## Requirements

- **Bash Shell**: The scripts are written in Bash and should be run in a Unix-like environment (Linux, macOS, or Windows with WSL).
- **Permissions**: Ensure the scripts have executable permissions:
  
```bash
chmod +x bin/RUNDBMS.sh
chmod +x bin/TABLE_OPERATIONS.sh
chmod +x bin/DATABASE_OPERATIONS.sh
chmod +x bin/lib.sh
```

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.
