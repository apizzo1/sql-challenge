# sql-challenge

Notes:
1. I did not create a length for the varchar data type (such as varchar(30)) when creating my tables using the ERD tool (http://www.quickdatabasediagrams.com). Initially I did not want to inadvertently remove data if it exceeded my given character length. However, in normal practice, I know this should be specified to ensure imported data is not longer than an intended length.

2. My table schema is not in the exact order that I imported the tables. I created the tables, and then imported in the following order to avoid errors due to foreign key constraints:
    a. departments
    b. titles
    c. employees
    d. salaries
    e. dept_emp
    f. dept_manager