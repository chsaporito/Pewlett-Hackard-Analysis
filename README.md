# Pewlett-Hackard-Analysis
## Overview of the analysis: 
This analisys is to discover how big of an impact retiring employees will have on Pewlett-Hackard.
## Results: 
- When querying retirement ready employees, from the employees table, it was found that there were many duplicate employees due to changing titles over time. The employee table returned 133,776 employees with birthdates between 1952 and 1955.
- When we queried for unique employees ready for retirement, there were 72,458 employees returned.
- A query of unique titles count of retiring employees showed that Senior Engineer and Senior Staff positions had the most employees that are ready for retirement.

![This is an image](retiring_titles.png)

- The mentor eligibility query returned 1,549 rows. These were employees born in 1965.
## Summary: 
- How many roles will need to be filled as the "silver tsunami" begins to make an impact?
  - There are 72,458 roles to be filled in total.
- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
  - Yes. The proportion of mentors to retirement ready employees is consistent.
  

Additionally queries:

![This is an image](Mentor_Retiring.PNG)

![This is an image](RetirementCountDept.PNG)
