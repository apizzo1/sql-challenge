# sql-challenge

## Challenge Details

This challenge was to create a database to organize employee data from the 1980s and 1990s at a fictitious company, Pewlett Hackard. Once the database was created, queries were performed to gain insights into the data.

To perform these actions, [PostgreSQL](https://www.postgresql.org/) was employed, in conjunction with [pgAdmin](https://www.pgadmin.org/).

### Steps to create Database and Load Data

1. First, a new database was created in pgAdmin, named PH_Employees_db.

2. Next, the basic outline of the database tables was sketched using an entity relationship diagram. To do this, an [ERD Drawing tool](http://www.quickdatabasediagrams.com) was used. This diagram can be found in the EmployeeSQL folder and seen below. 

![ERD](EmployeeSQL/ERD_PH_Employees_db.png)

This diagram shows primary keys in each table and relationships between tables using foreign keys (signfied by lines connecting to corresponding parameter in related table). Two tables show 2 primary keys - in this case, this is a composite key, which takes 2 primary keys to uniquely identify the row. The data type can also be seen for each parameter in each table. Note: No length was specified for the varchar data types in these tables (such as varchar(30)). In normal practice, this should be specified to ensure imported data is not longer than an intended length.

3. Once the ERD is sketched out, the ERD drawing tool allows the user to export a schema file, which can be used in pgAdmin to create the tables that will hold the employee data. This schema was used to create tables in PH_Employees_db.

4. Once the tables were created, the data (contained in 6 csvs) was imported to the tables. Note: the tables must be imported in the following order, to avoid errors due to foreign key constraints:
    a. departments
    b. titles
    c. employees
    d. salaries
    e. dept_emp
    f. dept_manager

Due to the csvs' file sizes, the files were not uploaded to this repository.

### Querying the Database

Once the database was created and the data was loaded, the following queries were performed:

* List the following details of each employee: employee number, last name, first name, sex, and salary.
* List first name, last name, and hire date for employees who were hired in 1986.
* List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
* List the department of each employee with the following information: employee number, last name, first name, and department name.
* List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
* List all employees in the Sales department, including their employee number, last name, first name, and department name.
* List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
* In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
    
### Creating Visualizations using Connection to the Database

To create some visualizations, a jupyter notebook was utilized, with a connection to the database using [SQL Alchemy](https://www.sqlalchemy.org/).

Once the connection was made, the following visualizations were created:
* A histogram to visualize the most common salary ranges for employees
* A bar chart of average salary by title

### Files Included

* EmployeeSQL folder:
    * ERD_PH_Employees_db.png - image of the entity relationship diagram
    * Table_Schema.sql - file containing the schema needed to create database tables
    * Data_Analysis.sql - file containing all database queries performed
    * Bonus_SQL - jupyter notebook containing database visualizations. Note: the SQL Alchemy database connection will require the pgAdmin username and password to connect. These were saved in a config.py file, which was not uploaded to this repository. To replicate this, the user would need to create a config.py file, stored in the same folder as the jupyter notebook file, with the following format:
    
username = "your pgAdmin username"

password = "your pgAdmin password"
