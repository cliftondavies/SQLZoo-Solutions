-- TUTORIAL

-- 1. Teachers who have NULL for their department.
SELECT name
FROM teacher
WHERE dept IS NULL;

-- 2. Teachers assigned to departments
SELECT teacher.name AS teacher_name, dept.name AS dept_name
FROM teacher
INNER JOIN dept
ON teacher.dept = dept.id;

-- 3. Teachers with/without departments
SELECT teacher.name AS teacher_name, dept.name AS dept_name
FROM teacher
LEFT JOIN dept
ON teacher.dept = dept.id;

-- 4. Departments with/without teachers
SELECT teacher.name AS teacher_name, dept.name AS dept_name
FROM teacher
RIGHT JOIN dept
ON teacher.dept = dept.id;

-- 5. Teacher name and mobile number or '07986 444 2266'
SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile_number
FROM teacher;

-- 6. Teacher name and department name, with 'None' where there is no department.
SELECT teacher.name AS teacher_name, COALESCE(dept.name, 'None') AS dept_name
FROM teacher
LEFT JOIN dept
ON teacher.dept = dept.id;

-- 7. Number of teachers and the number of mobile phones.
SELECT COUNT(name) AS no_of_teachers, COUNT(mobile) AS no_of_mobiles
FROM teacher;

-- 8. Number of teachers per department
SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept
ON teacher.dept = dept.id
GROUP BY dept.name;

-- 9. Teahcer and their department type (1)
SELECT name,
CASE WHEN dept = 1 OR dept = 2 THEN 'Sci'
ELSE 'Art'
END AS dept_type
FROM teacher;

-- 10. Teacher and their department type (2)
SELECT name,
CASE WHEN dept = 1 OR dept = 2 THEN 'Sci'
     WHEN dept = 3 THEN 'Art'
     ELSE 'None'
     END AS dept_type
FROM teacher;


-- QUIZ

-- 1. Select the code which uses an outer join correctly.
SELECT teacher.name, dept.name
FROM teacher
LEFT OUTER JOIN dept
ON (teacher.dept = dept.id);
 
-- 2. Name of department which employs Cutflower
SELECT dept.name
FROM teacher
JOIN dept
ON (dept.id = teacher.dept)
WHERE teacher.name = 'Cutflower';

-- 3. List of all the departments and number of employed teachers
SELECT dept.name, COUNT(teacher.name)
FROM teacher
RIGHT JOIN dept
ON dept.id = teacher.dept
GROUP BY dept.name;
