Data Engineer Project – Data Modelling & SQL Warehouse
- This repository contains an end-to-end data warehouse prototype designed to digitalize and represent complex organizational processes for a company (example domain: Zoo operations).
- It includes full data modelling, a SQL-based warehouse, automated ETL flows, and SQL queries demonstrating the relationships among all operational entities.

Project Overview
- The warehouse is built from the ground up, starting with the conceptual ER model and ending with a fully functional SQL database populated with example data.
- Processes such as animal care, employee assignments, logistics, facility management, and service operations are reflected in the schema.
- ETL procedures are automated using Python, ensuring reproducible loading, transformation, and validation of the source data.

Repository Structure

.

├─ Operative Datenbank/          # SQL-based warehouse (SQLite) with example data

│   ├─ 01_Source_data/           # Example CSV files used as input for ETL

│   ├─ 02_Create_Tables_Zoo.sql  # SQL Scripts for tables creation

│   ├─ 03_Python_Programs/       # Python scripts for automated ETL, data loading, and validation

│   └─ 04_Queries/               # SQL queries illustrating entity relationships and analytics logic

│

├─ Aufgabe/                      # Original project task and instructions

│

├─ Zoo.db                        # SQL warehouse prototype containing all modeled tables and sample data. File .sqpbro - project copy in SQLite format

├─ Data_Dictionary.xlsx          # Detailed description of tables, attributes, and data types

├─ ERM-Schema                    # Entity-relationship model showing relationships among all parties

├─ Projectpräsentation.pdf       # Presentation: objectives, tools, ERM schema, SQL warehouse, data migration, next steps


Main Files
- Zoo.db and Zoo.sqbpro (with all the queries)
SQLite-based data warehouse filled with sample data representing all operational processes.

- Data_Dictionary.xlsx
Documented table descriptions, field meanings, and data types.

- ERM-Schema
Complete entity-relationship diagram showing all participants and relationships.

- Projectpräsentation.pdf
Explains scope, objectives, modelling decisions, ETL workflow, warehouse structure, data quality checks, and recommended next development steps.

Usage Notes
- SQL queries can be run directly from Zoo.sqbpro file.
- ETL can be reproduced by executing Python scripts inside Python_Programms.
- Warehouse inspection can be done using DB Browser for SQLite or any compatible SQL tool.
