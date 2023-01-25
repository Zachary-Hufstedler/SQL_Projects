SELECT `#_Of_Positions`, Agency, SUM(`#_Of_Positions`) 
AS Total_Positions FROM nyc_jobs GROUP BY Agency;
-- this allows us to pull in all of the positions for each department 

UPDATE nyc_jobs
SET Salary_Range_From = Salary_Range_From * 40 * 50,
    Salary_Range_To = Salary_Range_To * 40 * 50,
    Salary_Frequency = 'Annual'
WHERE Salary_Frequency = 'Hourly'
-- Changed hourly rate to annual to be more precise in the information

UPDATE nyc_jobs
SET Salary_Range_From = Salary_Range_From * 250,
    Salary_Range_To = Salary_Range_To * 250,
    Salary_Frequency = 'Annual'
WHERE Salary_Frequency = 'Daily'
-- Wanting to change Daily pay to Annual (assuming there are 250 working days = 5 days * 50 weeks)

SELECT Agency, ROUND(AVG(Salary_Range_From),2), 
ROUND(AVG(Salary_Range_To),2)
FROM nyc_jobs
GROUP BY Agency;
-- What to get the average salary for each department 

SELECT Career_Level, 
	Round(AVG(Salary_range_From),2) AS Average_Salary_From,
	Round(AVG(Salary_range_To),2) AS Average_Salary_To
FROM nyc_jobs
GROUP BY Career_Level
-- Want to get the average Salary_Range_From and Salary_Range_To for each of the different career levels: 'Experienced (non-manager)', 'Entry-Level', 'Student', 'Manager', 'Executive'

DELETE FROM nyc_jobs
WHERE job_ID = 87990
-- deleted this information because the job didn't specify the career_level and was the only one that didn't have one. 

UPDATE nyc_jobs
SET Career_Level = 'Entry-Level'
WHERE Job_ID = 554148;
-- Considering changing two jobs that are considered to be 'Executive' because they are intern position. This was changed because the position was an 'intern', so I changed it to better aligned with entry-level

