# sql-challenge

## Challenge Details

This challenge was to create a database to organize employee data from the 1980s and 1990s at a fictitious company, Pewlett Hackard. Once the database was created, queries were performed to gain insights into the data.

### Steps to create Database

First, the basic outline of the database tables was sketched using an entity relationship diagram. To do this, http://www.quickdatabasediagrams.com was used. This diagram can be found in the EmployeeSQL folder and seen below. 

![ERD](EmployeeSQL/ERD_PH_Employees_db.PNG)

Notes:

1. Created new database called PH_Employees_db

2. My table schema is not in the exact order that I imported the tables. I created the tables, and then imported in the following order to avoid errors due to foreign key constraints:
    a. departments
    b. titles
    c. employees
    d. salaries
    e. dept_emp
    f. dept_manager
    
3. I did not create a length for the varchar data type (such as varchar(30)) when creating my tables using the ERD tool (http://www.quickdatabasediagrams.com). Initially I did not want to inadvertently remove data if it exceeded my given character length. However, in normal practice, I know this should be specified to ensure imported data is not longer than an intended length.
    
4. I added the csv files to my gitignore file due to their size so these files are not located in my git repo
