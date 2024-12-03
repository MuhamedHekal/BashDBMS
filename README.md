# DBMS
# Mini DBMS Project [Bash Scripting] 

This project is a simple **Database Management System (DBMS)** implemented using Bash scripts. It allows users to create, manage, and perform operations on tables stored in the filesystem. The system includes functionalities to create tables, insert data, and perform basic table operations.

# DBMS Structure
```
├── README.md                # Project documentation
├── bin/                     # Scripts directory
│   ├── RUNDBMS.sh           # Main script (entry point)
│   ├── TABLE_OPERATIONS.sh  # Table-related functions
│   └── lib.sh               # Common utility functions
├── databases/                    # Data storage directory
│   └── DBs_names/           # Directory for databases
│       └── tables_name/     # Directory for tables within a database
│           └── tables_data/ # File(s) storing table data
│   └── logfile.log          # file that contain all logs made in this RDMS
└── docs/                    # Documentation files

