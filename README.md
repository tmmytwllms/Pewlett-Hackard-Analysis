# Pewlett-Hackard-Analysis
## Resources
- Data: Departments.csv, Employees.csv, Dept_manager.csv, Salaries.csv, Dept_emp.csv, Titles.csv
- Software: pgAdmin 4, Visual Studio Code, Quick DBD, Microsoft Excel
<br/>

## Overview
The purpose of this analysis was to use Quick DBD to organize the Pewlett Hackard employee data files and their fields, and to then determine the primary and foreign keys of each table to create relationships. pgAdmin was then used to create a relationional database using the database diagram created in Quick DBD to enter out Pewlett Hackard data. After creating a relational database, this info was used to determine employees who would soon be retiring and were eligible for the company's mentorship program.
<br/>

## Results

### Retiring Employees by Title
1. Our first goal was to create a list of all employees, with their titles, who were eligible for retirement. To do this, we queried our employees and titles tables to determine which employees met the retirement criteria, which was a birth date between 1/1/1952 and 12/31/1955. 
  This query returned the following table:
  
  <br/>
  
  ![1-retirement_titles_unclean](https://user-images.githubusercontent.com/82389466/121438156-8375c700-c951-11eb-84ee-7c7e7d00184f.png)
  
  <br/>
  
2. After gathering our list of all employees that met the birth date criteria for retirement, it was found that the data in this list needed to be cleaned. The data in the new list, posted above, contained copies of employees who possesed more than one position at Pewlett Hackard. Another query was then created to find only the most recent positions for each employee. This was achieved by using <DISTINCT ON (employee number)>, because in the data set, each employee's title or titles were listed with their most recent position ocurring first in the unclean data set. Alternatively, we could have used a WHERE statement on the to_date column to return only rows of data where the to_date was 9999-01-01, indicating they are still employeed in that position. 
  This query returned the following table:
  
  <br/>
  
  ![2-unique_titles](https://user-images.githubusercontent.com/82389466/121438573-3e9e6000-c952-11eb-825c-19d51f776639.png)

<br/>

3. After getting each current employee's title, name, and employee number, the total number of employees by title needed to be established. A query using an aggregate function, COUNT(), was performed on the employee number column and then used GROUP BY () on the title column to determine how many employees in each title were retiring.
  This query returned the following table:
  
  <br/>
  
  ![3-retiring_titles](https://user-images.githubusercontent.com/82389466/121438814-b1a7d680-c952-11eb-9d7f-2342ae0e06f7.png)

<br/>

### Employees Eligible for Mentorship
1. The second objective in this analysis was to determine the total number of employees who were eligible for Pewlett Hackard's mentorship program. To be elibile for this program, an employee must have a birthdate between 1/1/1965 and 12/31/1965. We created a table to determine who these employees were using a query to join the employees, dept_employees, and titles tables.
  This query returned the following table:
  
  <br/>
  
  ![4-mentorship_program_table](https://user-images.githubusercontent.com/82389466/121441516-f8e49600-c957-11eb-96f2-1fd3fab39379.png)

<br/>

## Summary
The analysis of Pewlett Hackard's employee data determined the number of employees retiring by title, and the total number of retiring employees eligible for the company's mentorship program. However, two additional questions and concerns were raised.
1. In addition to our previous queries, the total number of retiring employees needed to be determined. This was determined by the following query:

<br/>

SELECT SUM(count) as "Total Retiring Employees" FROM retiring_titles;

<br/>

![5-total_retiring](https://user-images.githubusercontent.com/82389466/121440383-cc2f7f00-c955-11eb-8d4c-5b23a0441320.png)

<br/>

This query determined that there were a total of 90,398 retiring employees, which was nearly one third of Hewlett Packard's entire workforce.

<br/>

2. The last objective of this analysis was to determine if there were enough employees eligible for the mentorship program to mentor the next generation of staff. First, the total number of employees eligible was determined, using the following query:

<br/>

SELECT COUNT(emp_no) FROM mentorship_eligibility;
                                                        
<br/>

![6-total_mentors](https://user-images.githubusercontent.com/82389466/121442627-0ac73880-c95a-11eb-93b8-5c18cad5adba.png)

<br/>

This query determined that there were only 1,549 employees eligible for the mentorship program, which is drastically different than the total number of retiring employees. As a result, there will not be enough employees to mentor the next generation of Pewlett Hackard employees.
